.text
.global Exercise
.type Exercise, "function"

Exercise:
    // Copied from sheet
    CMP X0, #0
    CNEG X0, X0, LT

    // This subroutine returns the absolute value of the first argument
    // that is passed to it.
    ret