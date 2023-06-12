/*
 * Oops! This program is supposed to print a line like our Hello World
 * example. But we wrote the wrong package name when running print().
 *
 * Instead of actually fixing that line of code (who would do that?),
 * let's learn about referencing packages by a different name. When importing
 * a package, you can give a different name as well as the string indicating
 * where the package is from. For example:
 *
 *    import my_package "core:os"
 *
 * Now, anything from the "os" package can now be accessed via my_package.
 *
 * With this information, can you fix this program without touching line 23?
 */

package main

import format "core:fmt"

main :: proc() {
    // Do not change this line.
    format.print("Successful import")
}
