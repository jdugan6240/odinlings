package main

import "core:fmt"
import "core:os"
import "core:strconv"

parse_args :: proc() {
    exercise_collection := load_exercises()
    if len(exercise_collection.exercises) == 0 {
        fmt.eprintln("Exercises weren't loaded properly")
        os.exit(1)
    }
    if len(os.args) > 1 {
        /*
         * The argument structure of odinlings is a subcommand, and an argument if the subcommand takes one.
         *
         * The "verify" subcommand takes no arguments, and simply attempts to run all the exercises in order.
         *
         * The "run" subcommand takes one argument, either a number for a specific exercise or "next" for the next exercise.
         * This allows for running a specific exercise.
         *
         * The "hint" subcommand takes one argument, either a number for a specific exercise or "next" for the next exercise.
         * This prints a hint for the given exercise.
         *
         * The "list" subcommand takes no arguments, and prints a list of all exercises, and whether they've been solved.
         */
        if os.args[1] == "verify" {
            run_exercises(exercise_collection)
        }
        else if os.args[1] == "run" {
            if len(os.args) < 3 {
                fmt.eprintln("run subcommand requires either an exercise number or \"next\"")
                os.exit(1)
            }
            value := os.args[2]
            if value == "next" {
                run_next_exercise(exercise_collection)
            }
            else {
                exec_num, ok := strconv.parse_uint(value)
                if !ok {
                    fmt.eprintln("run subcommand requires either an exercise number or \"next\"")
                }
                run_specific_exercise(exercise_collection, exec_num)
            }
        }
        else if os.args[1] == "hint" {
            if len(os.args) < 3 {
                fmt.eprintln("hint subcommand requires either an exercise number or \"next\"")
                os.exit(1)
            }
            value := os.args[2]
            if value == "next" {
                exercise_hint_next(exercise_collection)
            }
            else {
                exec_num, ok := strconv.parse_uint(value)
                if !ok {
                    fmt.eprintln("hint subcommand requires either an exercise number or \"next\"")
                }
                exercise_hint(exercise_collection, exec_num)
            }
        }
        else if os.args[1] == "list" {
            exercise_list(exercise_collection)
        }
        else {
            fmt.eprintln("Invalid odinlings subcommand")
            fmt.eprintln("Usage: odinlings <verify|run|hint|list> [next|some_number]")
            os.exit(1)
        }
    }
    else {
        // Run all the exercises by default.
        // This is as if the user ran "odinlings verify".
        run_exercises(exercise_collection)
    }
}

main :: proc() {
    // This needs to be run from the project root directory.
    if !os.exists("build.sh") {
        fmt.eprintln("Must be run from project root directory")
        os.exit(1)
    }

    parse_args()
}
