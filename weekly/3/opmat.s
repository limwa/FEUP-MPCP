.text
.global OpMat
.type OpMat, "function"

// W0 - número de colunas
// W1 - número de linhas
// X2 - endereço do vetor de operações
// X3 - endereço do vetor da matriz
OpMat:
    stp x29, x30, [sp, -64]!
    mov x29, sp

    str x19, [sp, 16]
    str x20, [sp, 24]
    str x21, [sp, 32]
    str x22, [sp, 40]
    str x23, [sp, 48]
    str x24, [sp, 56]

    mov w19, w0 // número de colunas
    mov w20, w1 // número de linhas
    mov x21, x2 // endereço do vetor de operações
    mov x22, x3 // endereço do vetor da matriz

    mov w23, -1 // resultado de OpMat
    mul w24, w19, w20 // tamanho da matriz

OpMat_Loop:
    ldrb w9, [x21], 1
    cmp w9, 88 // ASCII ('X') = 88
    b.eq OpMat_End
    
    cmp w9, 76 // ASCII ('L') = 76
    b.eq OpMat_OpL

    cmp w9, 67 // ASCII ('C') = 67
    b.eq OpMat_OpC

    cmp w9, 80 // ASCII ('P') = 80
    b.eq OpMat_OpP

    cmp w9, 66 // ASCII ('B') = 66
    b.eq OpMat_OpB

    cmp w9, 79 // ASCII ('O') = 79
    b.eq OpMat_OpO

    b OpMat_Loop // Just in case

OpMat_OpL:
    mov w0, w19
    mov w1, w20
    mov x2, x22

    ldrb w3, [x21], 1
    ldrb w4, [x21], 1

    bl OpL

    b OpMat_Loop

OpMat_OpC:
    mov w0, w19
    mov w1, w20
    mov x2, x22

    ldrb w3, [x21], 1
    ldrb w4, [x21], 1

    bl OpC
    
    b OpMat_Loop

OpMat_OpP:
    mov w0, w19
    mov w1, w20
    mov x2, x22

    ldrb w3, [x21], 1
    ldrb w4, [x21], 1
    ldrb w5, [x21], 1

    bl OpP
    
    b OpMat_Loop

OpMat_OpB:
    mov w0, w19
    mov w1, w20
    mov x2, x22

    bl OpB

    b OpMat_Loop


OpMat_OpO:
    ldrb w0, [x21], 1

    mov x1, x22
    mov w2, w24

    bl ocorr
    mov w23, w0

    b OpMat_Loop

OpMat_End:
    mov w0, w23

    ldr x19, [sp, 16]
    ldr x20, [sp, 24]
    ldr x21, [sp, 32]
    ldr x22, [sp, 40]
    ldr x23, [sp, 48]
    ldr x24, [sp, 56]

    ldp x29, x30, [sp], 64
    ret


// W0 - número de colunas
// W1 - número de linhas (não é usado)
// X2 - endereço do vetor da matriz
// W3 - índice da linha
// W4 - elemento a atribuir
// Devolve: void
OpL:
    stp x29, x30, [sp, -16]!
    mov x29, sp

    // Calcular endereço da linha
    umaddl x2, w0, w3, x2

    // Iterar sobre os elementos da linha
    mov w9, 0

OpL_Loop:
    cmp w9, w0
    b.hs OpL_End

    // Substituir elementos
    strb w4, [x2], 1

    add w9, w9, 1

    b OpL_Loop

OpL_End:
    ldp x29, x30, [sp], 16
    ret


// W0 - número de colunas
// W1 - número de linhas
// X2 - endereço do vetor da matriz
// W3 - índice da coluna
// W4 - elemento a atribuir
// Devolve: void
OpC:
    stp x29, x30, [sp, -16]!
    mov x29, sp

    // Calcular endereço da coluna
    add x2, x2, w3, sxtw

    // Iterar sobre os elementos da coluna
    mov w9, 0

OpC_Loop:
    cmp w9, w1
    b.hs OpC_End

    // Substituir elementos
    strb w4, [x2]
    add x2, x2, w0, sxtw

    add w9, w9, 1

    b OpC_Loop

OpC_End:
    ldp x29, x30, [sp], 16
    ret


// W0 - número de colunas
// W1 - número de linhas
// X2 - endereço do vetor da matriz
// W3 - índice da coluna
// W4 - índice da linha
// W5 - elemento a atribuir
// Devolve: void
OpP:
    stp x29, x30, [sp, -16]!
    mov x29, sp

    // Calcular endereço da posição
    umaddl x2, w0, w4, x2 // X2 = endereço da linha
    add x2, x2, w3, sxtw // X2 = endereço da posição

    // Substituir elementos
    strb w5, [x2]

    ldp x29, x30, [sp], 16
    ret


// W0 - número de colunas
// W1 - número de linhas
// X2 - endereço do vetor da matriz
// Devolve: void
OpB:
    stp x29, x30, [sp, -16]!
    mov x29, sp

    // Calcular número de elementos na matriz
    mul w10, w0, w1

    // Iterar sobre elementos
    mov w9, 0

OpB_Loop:
    cmp w9, w10
    b.hs OpB_End

    // "Binarizar" elementos
    ldrb w11, [x2]

    cmp w11, 128
    cinv w11, wzr, hs

    strb w11, [x2], 1

    add w9, w9, 1

    b OpB_Loop

OpB_End:
    ldp x29, x30, [sp], 16
    ret
