.text
.global SelectedUpperCase
.type SelectedUpperCase, "function"

// x0 - Sequência de caracteres para substituir
// x1 - Sequência de caracteres original

SelectedUpperCase:
    mov x2, x0
    mov x3, 0

L1:
    mov x0, x2
    ldrb w7, [x1], 1
    cmp w7, 0
    b.eq End

L2:
    ldrb w8, [x0], 1
    cmp w8, 0
    b.eq L1

    cmp w7, w8
    b.ne L2

    add w3, w3, 1
    sub w7, w7, 32
    strb w7, [x1, -1]

    b L1

End:
    mov w0, w3 
    ret