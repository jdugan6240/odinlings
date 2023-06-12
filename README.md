# Odinlings

Welcome to Odinlings! This project contains a series of exercises
to get you used to reading and writing [Odin](https://odin-lang.org)
code. This includes reading and responding to compiler messages.

These broken programs need your help! (You'll also help out some
vikings and some notable figures in Norse mythology, including
Odin himself.)

This project is heavily inspired by the excellent [Rustlings](https://github.com/rust-lang/rustlings)
and [Ziglings](https://github.com/rat-factor/ziglings) projects
for the Rust and Zig languages, respectively, as well as the
similar [Ruby Koans](https://www.rubykoans.com).

## Intended Audience

No specific programming experience is required, but it may be
a bit difficult if you've _never_ programmed before. In particular,
you are _not_ expected to have any prior experience with "systems programming"
or a "systems" level language such as C.

Each exercise should contain enough explanation to solve them
without external resources, but checking out the following
resources should prove useful:

* https://odin-lang.org/docs/overview
* https://github.com/odin-lang/examples
* https://pkg.odin-lang.org

## Getting Started

Install a [recent build](https://odin-lang.org/docs/install/) of the Odin compiler.

Verify the installation by retrieving the Odin version like so:
```
odin version
odin version dev-2023-05-nightly:0c352213
```

Clone the repository with Git:
```
placeholder text
cd odinlings
```

Then run the `build.sh` script to build the Odinlings binary.

## Doing exercises

The exercises are found in the exercises directory, and are designed to be done
in order. The task is simple - most exercises contain errors that keep them
from compiling, and it's up to you to fix it! When the output of the exercise
matches what Odinlings expects, the exercise is considered solved and will be
skipped from then on.

To run the exercises in the recommended order, execute:
```
./odinlings verify
```
This will attempt to verify the completion of every exercise in order, stopping
at the first one that fails.

If you wish to run a specific exercise, you can run:
```
./odinlings run 5
```
where the number 5 is replaced by the number corresponding to the desired exercise.
You can also run
```
./odinlings run next
```
to run just the next unsolved exercise in the course.

In case you get stuck, you can run the following command to get a hint for your exercise:
```
./odinlings hint 5
```
where the number 5 is replaced by the number corresponding to the desired exercise.
You can also run
```
./odinlings hint next
```
to receive a hint for the next unsolved exercise in the course. Hints aren't available for
the quizzes, however.

To check your progress, you can run the following command:
```
./odinlings list
```
This will print a checklist indicating which exercises you've solved and which you have not.

## What's Covered

The primary goal of Odinlings is to cover the core Odin language. While
some parts of the standard library are covered, it's not this project's
core focus.

Language coverage checklist:

* [x] Hello World
* [x] Importing packages
* [x] Variable declarations/assignment
* [ ] Constants
* [ ] Packages
* [ ] Control flow
* [ ] Procedures
* [ ] Basic types
* [ ] Operators
* [x] Arrays
* [x] Strings
* [ ] Runes
* [ ] Slices
* [ ] Dynamic arrays
* [ ] Structs
* [ ] Enumerations
* [ ] Unions
* [ ] Maps
* [ ] Pointers
* [ ] Bit sets
* [ ] Type aliases
* [ ] Distinct types
* [ ] Pointers
* [ ] Multi Pointers
* [ ] Matrix type
* [ ] Using statement
* [ ] or_else expression
* [ ] or_return operator
* [ ] Conditional compilation
* [ ] Context system
* [ ] Foreign system
* [ ] Parametric polymorphism
* [ ] Attributes
* [ ] Directives
