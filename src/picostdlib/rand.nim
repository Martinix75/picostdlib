type
    rng_128*{.bycopy.} = object
        r*: array[2, uint64]

{.push header:"pico/rand.h".}
proc getrand128*(rand128: ptr rng_128) {.importC: "get_rand_128".}
proc getRand64*(): uint64 {.importC: "get_rand_64".}
proc getrand32*(): uint32 {.importC: "get_rand_32".}
{.pop.}
