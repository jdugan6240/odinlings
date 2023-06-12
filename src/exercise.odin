package main

import libc "core:c/libc"
import "core:fmt"
import "core:os"
import "core:strings"
import "core:encoding/json"

Exercise :: struct {
    name : string,
    expected_output : string,
    hint: string,
}

ExerciseCollection :: struct {
    exercises : [dynamic]Exercise,
}

load_exercises :: proc() -> ExerciseCollection {
    file := "src/exercises.json"
    data, ok := os.read_entire_file(file)
    if ok {
        value, err := json.parse(data)
        if err == .None {
            exercises: ExerciseCollection
            err := json.unmarshal_any(data, &exercises)
            if err == nil {
                return exercises
            }
            else {
                fmt.printf("Error: {}\n", err)
            }
        }
    }
    // If we got here, something went wrong. Return an empty collection of exercises.
    return ExerciseCollection{}
}

run_exercise :: proc(exercise: Exercise) -> bool {
    fmt.printf("\nChecking exercise {}\n\n", exercise.name)

    // If the executable exists, then that must mean it passed already.
    // Don't run it if that's the case.
    if os.exists(fmt.aprintf("out/{}", exercise.name)) {
        fmt.print("Exercise passed already; skipping...\n")
        return true
    }

    // First check to ensure it compiles.
    err_code := libc.system(strings.clone_to_cstring(fmt.aprintf("odin build ./exercises/{}.odin -file -out=./out/{}", exercise.name, exercise.name)))
    if (err_code != 0) {
        fmt.println("FAILED")
        fmt.printf("Exercise {} failed to compile.\n", exercise.name)
        if len(exercise.hint) != 0 {
            fmt.println("---")
            fmt.printf("{}\n", exercise.hint)
        }
        return false
    }
    // Now run it and ensure that it doesn't crash.
    // TODO: replace this with a native stdout redirect instead of using sh.
    err_code = libc.system(strings.clone_to_cstring(fmt.aprintf("sh -c \"./out/{} > out/output.txt\"", exercise.name)))
    if (err_code != 0) {
        fmt.println("FAILED")
        fmt.printf("Exercise {} exited abnormally.\n", exercise.name)
        libc.system(strings.clone_to_cstring(fmt.aprintf("rm out/{}", exercise.name)))
        fmt.printf("Hint: {}\n", exercise.hint)
        return false
    }
    // Now check the output and ensure it is correct.
    buf: [1024]byte
    handle, errno := os.open("out/output.txt")
    if errno != os.ERROR_NONE {
        fmt.println("FAILED")
        fmt.printf("Exercise {} produced no output.\n", exercise.name)
        libc.system(strings.clone_to_cstring(fmt.aprintf("rm out/{}", exercise.name)))
        return false
    }
    n, err := os.read(handle, buf[:])
    str := string(buf[:n])
    str = strings.trim_space(str)
    if str != exercise.expected_output {
        fmt.println("FAILED")
        fmt.printf("---\nExpected output:\n{}\n---\nActual output:\n{}\n", exercise.expected_output, str)
        libc.system(strings.clone_to_cstring(fmt.aprintf("rm out/{}", exercise.name)))
        libc.system("rm out/output.txt")
        return false
    }

    // The exercise passed.
    fmt.println("PASSED")
    fmt.printf("---\nOutput:\n{}\n---\n", str)
    libc.system("rm out/output.txt")
    return true
}

run_exercises :: proc(exercise_collection: ExerciseCollection) {
    for exercise in exercise_collection.exercises {
        passed := run_exercise(exercise)
        if !passed {
            break
        }
    }
}

run_specific_exercise :: proc(exercise_collection: ExerciseCollection, num: uint) {
    if num > len(exercise_collection.exercises) || num == 0 {
        fmt.eprintf("Exercise number must be between 1 and {}\n", len(exercise_collection.exercises))
        os.exit(1)
    }
    run_exercise(exercise_collection.exercises[num - 1])
}

run_next_exercise :: proc(exercise_collection: ExerciseCollection) {
    for i : uint = 0; i < len(exercise_collection.exercises); i += 1 {
        exercise := exercise_collection.exercises[i]
        // If the executable exists, then that must mean it passed already.
        // We're looking for the first one where that's not the case.
        if !os.exists(fmt.aprintf("out/{}", exercise.name)) {
            run_specific_exercise(exercise_collection, i + 1)
            break
        }
    }
}

exercise_hint :: proc(exercise_collection: ExerciseCollection, num: uint) {
    if num > len(exercise_collection.exercises) || num == 0 {
        fmt.eprintf("Exercise number must be between 1 and {}\n", len(exercise_collection.exercises))
        os.exit(1)
    }
    exercise := exercise_collection.exercises[num - 1]
    name := exercise.name
    hint := exercise.hint
    if hint == "" {
        fmt.printf("No hint available for exercise {}.\n", name)
    }
    else {
        fmt.printf("{} hint:\n", name)
        fmt.printf("{}\n", hint)
    }
}

exercise_hint_next :: proc(exercise_collection: ExerciseCollection) {
    for i : uint = 0; i < len(exercise_collection.exercises); i += 1 {
        exercise := exercise_collection.exercises[i]
        // If the executable exists, then that must mean it passed already.
        // We're looking for the first one where that's not the case.
        if !os.exists(fmt.aprintf("out/{}", exercise.name)) {
            exercise_hint(exercise_collection, i + 1)
            break
        }
    }
}

exercise_list :: proc(exercise_collection: ExerciseCollection) {
    for exercise in exercise_collection.exercises {
        if os.exists(fmt.aprintf("out/{}", exercise.name)) {
            fmt.printf("[x] {}\n", exercise.name)
        }
        else {
            fmt.printf("[ ] {}\n", exercise.name)
        }
    }
}
