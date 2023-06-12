/*
 * Oh, no. We seem to have forgotten how variable declaration and assignment works in Odin.
 *
 * Odin's syntax for declaring and assigning variables may seem strange at first.
 * Essentially, it follows this syntax:
 *
 *    <variable_name> : <variable_type> = <variable_value>
 *
 * An example of this, declaring a 32-bit unsigned integer with the value 20:
 *    my_var : u32 = 20
 *
 * Once a variable has been declared, re-assigning it is as easy as:
 *    my_var = 35
 *
 * With this information, can you fix the following program?
 */

package main

import "core:fmt"

main :: proc() {
    // Variables can be declared without assigning a value to them.
    // If you do this, it will be assigned to 0 by default.
    x : int
    // Since x has been declared, we don't need the ":" to assign a value to it.
    x = 5

    y : int = 4

    // You can also optionally take out the type when declaring variables, causing Odin to
    // infer the type of the variable. You still need the ":", however.
    z := 1

    // This line is broken. Fix it!
    result = x * y * z

    // This is a slightly different print statement that takes a format string and some parameters.
    fmt.printf("{}\n", result)

    // Now that result has been declared, we no longer need the ":".
    result = x + y + z
    fmt.printf("{}", result)
}
