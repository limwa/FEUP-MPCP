.text
.global IsPalindrome
.type IsPalindrome, "function"

IsPalindrome:
    mov x2, x0

Counter:
    mov x3, x0
    ldrb w1, [x0], 1
    cbnz w1, Counter

    sub x3, x3, 1 // x3 is the memmory address that contains the byte 0

    mov x0, 1

Read1:
    cmp x3, x2
    b.LO Fim
    ldrb w5, [x2], 1
    cmp w5, 32
    b.EQ Read1

Read2:
    cmp x3, x2
    b.LO Fim
    ldrb w6, [x3], -1
    cmp w6, 32
    b.EQ Read2

    cmp w6, w5
    b.eq Read1

    mov x0, 0
    b Fim

Fim:    
    ret
