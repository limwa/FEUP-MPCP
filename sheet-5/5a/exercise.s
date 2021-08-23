.text
.global Exercise
.type Exercise, "function"

.extern puts

// X0 - endereço da cadeira de caracteres
Exercise:
    stp x29, x30, [sp, -16]!
    mov x29, sp

    mov x1, x0
    mov x2, x0

    strb wzr, [sp, -16]! // Add NULL terminator to the end of the result string

Exercise_LengthLoop:
    ldrb w0, [x1], 1
    strb w0, [sp, -16]!
    cbnz w0, Exercise_LengthLoop

    // At this point, the string is stored in the stack
    
    mov x1, x2
    add sp, sp, 16 // Ignore the last byte (NULL terminator)

Exercise_ReadLoop:    
    ldrb w0, [sp], 16
    strb w0, [x1], 1
    cbnz w0, Exercise_ReadLoop

    mov x0, x2
    bl puts

    ldp x29, x30, [sp], 16
    ret
