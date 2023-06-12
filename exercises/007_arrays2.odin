/*
 * In addition to specifying the length of an array manually
 * when declaring it, Odin supports inferring the length of the
 * array by placing a question mark (?) in place of the length.
 * For example:
 *
 *    x := [?]int{1, 2, 3, 4, 5}
 *
 * In this instance, Odin can infer that the array is of length 5.
 *
 * A very cool thing about Odin's arrays is that they support a feature
 * referred to as array programming. This effectively means that operations
 * done on the array will be done on each of the array's elements. For
 * instance:
 *
 *    a := [?]int{1, 4, 9}
 *    b := [?]int{2, 4, 8}
 *    c := a + b // {3, 8, 17}
 *    d := a * b // {2, 16, 72}
 *    e := a + 1 // {2, 5, 10}
 *
 * With this knowledge, fix the below program.
 */

package main

import "core:fmt"

main :: proc() {
    a := [?]int{7, 15, 12, 45}

    // We're trying to multiply each of the elements in array a by 2.
    // However, this only adds 1 to each of the elements.
    // Fix this so that it behaves like we want..
    b := a + 1

    fmt.printf("Array b contents: {}, {}, {}, {}\n", b[0], b[1], b[2], b[3])

    c := [?]int{7, 5, 3}
    d := [?]int{6, 4, 2, 0}

    // This only works if the arrays are the same length.
    // Since c is shorter than d, add a 0 to array c.
    e := c + d

    fmt.printf("Array e contents: {}, {}, {}, {}", e[0], e[1], e[2], e[3])
}
