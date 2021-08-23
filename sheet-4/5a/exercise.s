.text
.global POS1msb
.type POS1msb, "function"

POS1msb:
    clz X1, X0
    
    mov X2, 63
    sub X0, X2, X1
    
    ret