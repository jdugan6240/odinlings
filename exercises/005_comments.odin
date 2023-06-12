/*
 * A good programming practice when learning is to ensure your code is well commented,
 * so let's talk about that.
 *
 * Odin has support for two types of comments: single line and multi-line comments.
 *
 * Single line comments start with "//" and extend to the end of the line.
 * Multi-line comments start with /* and extend until a matching */ is reached.
 *
 * You've already seen plenty of comments in the exercises so far, so fixing this
 * program should be easy enough.
 */

package main

import "core:fmt"

main :: proc() {
    / This is supposed to be a single line comment.
    /*
     This is supposed to be a multi-line comment.
     /*
    fmt.print("Successfully learned how to comment in Odin.")
}

/*
 Bonus tip: unlike most other languages, Odin supports nesting multi-line comments.
 If you pay close attention, you'll notice that this happened in the initial multi-line
 comment at the top of the file (where?).
 /*
    Isn't this cool???
  */
 */
