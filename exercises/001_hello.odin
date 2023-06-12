/*
 * This program is supposed to print "Hello, World!", but it instead prints some
 * ancient Viking hallway presided over by some mythical guy named Odin. Try updating the
 * string that is printed to read "Hello, World!".
 */

// Don't worry about this just yet. All Odin files are required to have this.
package main

import "core:fmt"

// This syntax for declaring a function may seem strange at first. We'll go over
// it later on.
main :: proc() {
    // This needs to print "Hello, World!"
    fmt.print("Hello, Valhalla!") // Notice that unlike some languages, semicolons are optional in Odin.
}
