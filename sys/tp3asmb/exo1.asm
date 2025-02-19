; Exercice 1 Big Endian / Little Endian pour stocker des donn ees en m emoire

SECTION INTVEC

SECTION CODE
    MOV #0x20000000, R0      ; Base address for data storage

    ; Store 0x12345678 in Big Endian (12 34 56 78)
    MOV #0x12, [R0]
    MOV #0x34, [R0,#1]
    MOV #0x56, [R0,#2]
    MOV #0x78, [R0,#3]

    ; Store 0x12345678 in Little Endian (78 56 34 12)
    MOV #0x78, [R0,#4]
    MOV #0x56, [R0,#5]
    MOV #0x34, [R0,#6]
    MOV #0x12, [R0,#7]

    ; Store 0xAABBCCDD in Big Endian (AA BB CC DD)
    MOV #0xAA, [R0,#8]
    MOV #0xBB, [R0,#9]
    MOV #0xCC, [R0,#10]
    MOV #0xDD, [R0,#11]

    ; Store 0xAABBCCDD in Little Endian (DD CC BB AA)
    MOV #0xDD, [R0,#12]
    MOV #0xCC, [R0,#13]
    MOV #0xBB, [R0,#14]
    MOV #0xAA, [R0,#15]

    END

SECTION DATA
