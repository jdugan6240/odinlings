/*
 * It's time to learn how arrays work in Odin.
 *
 * Arrays can be contructed as in the following example:
 *
 *    x := [5]int{1, 2, 3, 4, 5}
 *
 * Notice that we put the length of the array in [] brackets.
 *
 * Get values of an array using array[index] notation:
 *
 *    x_val := x[4]
 *
 * As in other languages, Odin uses 0-based indexing, so the
 * first element is at index 0 and the last element (in this
 * case) is at index 5.
 *
 * Set values of an array using array[index] notation:
 *
 *    x[3] = 5
 *
 * Get the length of an array using the len() builtin:
 *
 *   length := len(x)
 *
 * Given this knowledge, fix the below program.
 */

package main

import "core:fmt"

main :: proc() {
    // This is supposed to create an array of even numbers.
    // However, we forgot how to properly declare an array.
    even_nums := [9]int{2, 4, 6, 8, 10, 12, 14, 16, 18}

    last_even_num := even_nums[8]

    odd_nums := [8]int{1, 3, 5, 7, 9, 11, 13, 15}

    // This is supposed to grab the last value of the odd_nums array.
    // However, something's wrong with it (can you see what it is?)
    last_odd_num := odd_nums[7]

    fmt.printf("Last odd num: {}\nLast even num: {}\n", last_odd_num, last_even_num)

    // This is supposed to print the number of odd numbers and the
    // number of even numbers. Fix this line (and don't cheat by
    // just typing the array lengths directly!)
    fmt.printf("Number of odds: {}\nNumber of evens: {}", len(odd_nums), len(even_nums))
}
