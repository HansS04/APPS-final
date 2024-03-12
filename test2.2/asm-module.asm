    bits 64

    section .data
    extern array
    extern array2

    extern character
    extern text

    extern count
    extern firstAppear



    section .text

    global xorFun

xorFun:

    mov esi, 0
    mov edi, 5
    mov eax, [ array + esi * 4 ]

.back:
    inc esi ;i++
    mov ecx, [ array + esi * 4 ] ;tady se hodnoti podle toho daneho prvku vyhodnoti * to spravne meritko, delame s 32 bitovym registrem
    xor eax, ecx ;provede se ten xor
    dec edi ;i--

    jnz .back
    jmp .done

.done:
    ret

    global absVal
absVal:

    mov esi, 0
    mov edi, 6


.back2:  
    mov ecx, 0 

    mov eax, [ array2+ esi * 4 ]  
    test eax, eax
    jge .positive

    sub ecx, eax
    mov eax, ecx
    mov [ array2 + esi * 4 ], eax


.positive:
    inc esi
    dec edi
    jnz .back2
    jmp .fin2

.fin2:
    ret

    
    global findChar
findChar:

    xor esi, esi          
    xor eax, eax

    mov ecx, -1

    mov bl, [character]
    cmp bl, 'A'
    jb .not_uppercase
    cmp bl, 'Z'
    ja .not_uppercase
    add bl, 32
.not_uppercase:

.back3:    
    mov dl, [text + esi]
    cmp dl, 0
    je .fin3
    cmp dl, bl
    je .found_char
    cmp dl, 'A'
    jb .not_uppercase_text
    cmp dl, 'Z'
    ja .not_uppercase_text
    add dl, 32
.not_uppercase_text:
    cmp dl, bl
    jne .skip
.found_char:
    inc eax
    cmp ecx, -1
    jne .skip
    mov ecx, esi
.skip:
    inc esi
    jmp .back3
.fin3:  
    mov [count], eax
    mov [firstAppear], ecx
    ret