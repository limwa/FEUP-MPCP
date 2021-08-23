.text
.global Exercise
.type Exercise, "function"

Exercise:
    // Setup
    mov x12, x0

    // Exercise
    eor x10, x10, x10
    bfi x10, x12, 8, 56

    // End
    mov x0, x10
    ret