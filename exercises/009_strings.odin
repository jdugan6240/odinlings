/*
 * We've learned about arrays, so let's talk about strings.
 * Strings in Odin are basically immutable arrays of bytes,
 * encoded in UTF-8. Odin offers multiple ways to write a
 * string literal.
 *
 * 1) They can be written with "" characters. You've already
 *    seen this notation in action with the print statements.
 *    These can only be one line, with newlines being represented
 *    by a \n, and any " characters within the string must be
 *    escaped with a \.
 * 2) They can be written with `` characters. Known as a raw
 *    string, every character in the string is taken literally,
 *    including newlines. An example of a raw string is as follows:
 *
 *    raw_literal := `This is a raw string literal.
Anything and everything between the tick marks is taken literally.
This is the simplest way to write a multi-line string in Odin.`
 *
 * With the above knowledge, fix the below program.
 */

package main

import "core:fmt"

main :: proc() {

    // Seems we forgot here that raw strings can contain newlines.
    // Please fix this.
    raw_literal := `Line one\nLine two`

    fmt.printf("{}\n", raw_literal)

    regular_string := "Adin Rocks"

    // Oops! Strings are immutable in Odin, so this doesn't work.
    // Is there another way to change the value of regular_string?
    regular_string[0] = 'O'

    fmt.printf("{}\n", regular_string)

    // This is supposed to be the last byte of regular_string.
    last_byte := regular_string[???]

    // Don't worry about this for now. This converts the last byte of the string to
    // a string for printing. Since the string is entirely ASCII, this works.
    last_byte_arr := []u8{last_byte}
    last_byte_str := strings.clone_from_bytes(last_byte_arr)

    fmt.printf("Last byte: %s", last_byte_str)
}
