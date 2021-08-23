.text
.global NCAP
.type NCAP, "function"

NCAP:
    rbit w1, w0
    cmp w1, w0
    cset x0, eq
    ret