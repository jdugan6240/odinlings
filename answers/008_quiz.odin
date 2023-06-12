/*
 * Quiz time! Let's see if you can fix this whole program.
 *
 * A viking has written a program to help him determine
 * how far Greenland is from Norway. How he got the latitude
 * and longitude of Norway and Greenland, we're not sure. However,
 * since he is new to Odin, it doesn't work correctly. Please help
 * him fix his code so it works properly.
 *
 * If you get stuck, remember: the compiler is your friend.
 * Take a close look at the error messages to see where the errors are.
 * Although note that fixing some errors may reveal others.
 */

package main

import "core:fmt"

main :: proc() {
    // Must comment my code, or ragnarok will happen early...

    /*
    Represent the latitude/longitude of Greenland and Norway as an array.
    We're using ints here to simplify the math.
    */
    greenland_latlon := [?]int{80, 80}
    norway_latlon := [?]int{60, 8}

    /* Now calculate the distance between them */
    total_dist := greenland_latlon - norway_latlon

    /* Assuming each degree of latitude is approximately 69 miles apart */
    total_dist[0] = total_dist[0] * 69 // Is this how we reference the first value?

    /* Assuming each degree of longitude is approximately 53 miles apart */
    total_dist[1] = total_dist[1] * 53 // Is this how we reference the second value?

    fmt.printf("Our Viking longship must go {} miles north and {} miles west.", total_dist[0], total_dist[1])
}
