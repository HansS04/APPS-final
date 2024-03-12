bits 64

;rdi, rsi, rdx, rcx, r8, r9

section.data
    extern character
    extern text

    extern count
    extern firstAppear


section.text

    ;rdi, rsi, rdx, rcx, r8, r9
    global my_strchr
my_strchr:

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

return_back:    
    mov dl, [text + esi] 

    cmp dl, 0          
    je .final
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
    jmp return_back 

.final:  
    mov [count], eax 
    mov [firstAppear], ecx 

    ret                


    ;rdi, rsi, rdx, rcx, r8, r9
    global str2int
str2int:
    xor rax, rax   
    mov rcx, 0    

.loop:
    mov dl, [rdi + rcx]   
    test dl, dl          
    jz .done              

    sub dl, '0'           
    imul rax, rax, 10     
    add rax, rdx          

    inc rcx             
    jmp .loop            

.done:
    mov [rsi], rax        
    ret     

    ;rdi, rsi, rdx, rcx, r8, r9
    global not_bits
not_bits:
    mov rax, [rdi]       
    popcnt rcx, rax       
    mov rax, rcx         
    ret