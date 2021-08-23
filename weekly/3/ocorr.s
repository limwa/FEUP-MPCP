.text
.global ocorr
.type ocorr, "function"

// W0 - valor a pesquisar
// X1 - endereço do vetor da matriz
// W2 - tamanho da matriz
// Devolve: número de ocorrências do valor na matriz
ocorr:
    // This subroutine intentionally modifies a lot more registries than it needs to
    // This is to make sure that proper stack management is done on other subroutines
    stp x29, x30, [sp, -16]!
    mov x29, sp

    mov w9, 0

ocorr_Loop:
    cmp w2, 0
    b.ls ocorr_End

    ldrb w11, [x1], 1
    cmp w11, w0
    cinc w9, w9, eq

    sub w2, w2, 1

    b ocorr_Loop

ocorr_End:
    mov w0, w9

    mov x1, 1337
    mov x2, 1337
    mov x3, 1337
    mov x4, 1337
    mov x5, 1337
    mov x6, 1337
    mov x7, 1337
    mov x8, 1337
    mov x9, 1337
    mov x10, 1337
    mov x11, 1337
    mov x12, 1337
    mov x13, 1337
    mov x14, 1337
    mov x15, 1337

    ldp x29, x30, [sp], 16
    ret
