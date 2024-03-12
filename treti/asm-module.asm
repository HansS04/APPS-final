bits 64

;rdi, rsi, rdx, rcx, r8, r9

section.data


section.text

    ;while (str[i] != 0) {citace[str[i]]++
    global cetnost

cetnost:

    enter 256 * 4, 0

    mov rsi, rbp
    sub rsi, 256 * 4    ;ctace[0]

    mov rcx, 0
nulovani:
    cmp rcx, 256
    jge vynulovano

    mov [rsi + rcx * 4], dword 0    ;ctace[i] = 0

    inc rcx
    jmp nulovani
vynulovano:

    mov rcx, 0
    mov rdx, 0
zpet1:
    cmp [rdi + rcx ], byte 0    ;str[i] == 0?
    je hotovo1

    mov dl, [rdi + rcx]         ;znak = str[i]
    inc dword[ rsi + rdx * 4]      ;citace[znak]++

    inc rcx
    jmp zpet1
hotovo1:

    mov rdi, rsi
    mov rsi, 256
    call pozice_max         ;pozice_max(ciatce, 256)

    leave
    ret

    global int2str

int2str:

    mov rcx, 0      ;i = 0
    mov eax, edi    ;number
    mov r8d, 10     ;zaklad
zpet:
    cdq             ;eax -> eax-edx
    idiv r8d        ;eax /= 10
    add dl, '0'     ;M -> 'M' (M = modulo)
    mov [rsi + rcx], dl     ;str[i] = 'M'
    inc rcx
    cmp eax, 0      ;number == 0
    jne zpet

    mov [ rsi + rcx], byte 0

    add rcx, rsi
    dec rcx         ;rcx - *pravy rsi - *levy

otacime:
    cmp rsi, rcx
    jge otoceno

    mov ah, [rsi]   ;swap *levy <-> *pravy
    mov al, [rcx]
    mov [rsi], al
    mov [rcx], ah
    inc rsi
    dec rcx

    jmp otacime

otoceno:
    ret

    global pozice_max

pozice_max:

    mov eax, 0      ;pozice = 0
    mov edx, [rdi]  ;max = ipole[0]
    movsx rsi, esi  ;N = N
    mov rcx, 0      ;i = 0
zpet2:
    cmp rcx, rsi    ;i < N
    jge hotovo

    cmp edx, [rdi + rcx * 4]    ;if (max ? pole[i])
    cmovl edx, [rdi + rcx * 4]  ;max = pole[i]
    cmovl eax, ecx          ;pozice = i

    inc rcx
    jmp zpet2

hotovo:
    ret
