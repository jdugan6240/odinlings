/*
 * Oops! This program is supposed to print a line like our Hello World
 * example. But we forgot how to import the "fmt" package.
 *
 * Imports are typically done with the following line of Odin:
 *     import "<package_name>"
 *
 * Please complete the import below.
 */

package main

??? "core:fmt"

main :: proc() {
    fmt.print("Successful import")
}
