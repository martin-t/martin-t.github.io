+++
title = "Undefined Behavior Explained with Examples"
+++

## ELI5 explnation

Optimizations work by allowing the compiler to make more assumptions about your code. For example, in Rust, there can only be one mutable reference to a given place in memory. So when a function takes 2 mutable references, the compiler assumes they always point to different addresses. This means when you change data through one reference and data from the other is already in registers, it doesn't have to reload the data subsequently accessed through the other reference.

[Rust version](https://godbolt.org/#g:!((g:!((g:!((h:codeEditor,i:(filename:'1',fontScale:14,fontUsePx:'0',j:1,lang:rust,selection:(endColumn:1,endLineNumber:9,positionColumn:1,positionLineNumber:9,selectionStartColumn:1,selectionStartLineNumber:1,startColumn:1,startLineNumber:1),source:'pub+fn+aa(a:+%26mut+i32,+b:+%26mut+i32)+-%3E+i32+%7B%0A++++let+mut+sum+%3D+*a+%2B+*b%3B%0A++++if+*a+%3E+10+%7B%0A++++++++*a+/%3D+2%3B%0A++++%7D%0A++++sum+%2B%3D+*b%3B%0A++++sum%0A%7D%0A'),l:'5',n:'0',o:'Rust+source+%231',t:'0')),k:50,l:'4',n:'0',o:'',s:0,t:'0'),(g:!((h:compiler,i:(compiler:r1730,filters:(b:'0',binary:'1',binaryObject:'1',commentOnly:'0',debugCalls:'1',demangle:'0',directives:'0',execute:'1',intel:'0',libraryCode:'0',trim:'1'),flagsViewOpen:'1',fontScale:14,fontUsePx:'0',j:1,lang:rust,libs:!(),options:'-Copt-level%3D3',overrides:!(),selection:(endColumn:12,endLineNumber:11,positionColumn:12,positionLineNumber:11,selectionStartColumn:12,selectionStartLineNumber:11,startColumn:12,startLineNumber:11),source:1),l:'5',n:'0',o:'+rustc+1.73.0+(Editor+%231)',t:'0')),k:50,l:'4',n:'0',o:'',s:0,t:'0')),l:'2',n:'0',o:'',t:'0')),version:4)

```rust
pub fn aa(a: &mut i32, b: &mut i32) -> i32 {
    let mut sum = *a + *b;
    if *a > 10 {
        *a /= 2;
    }
    sum += *b;
    sum
}
```

With `-Copt-level=3`:

```asm
example::aa:
        mov     eax, dword ptr [rdi]
        mov     ecx, dword ptr [rsi]
        cmp     eax, 10
        jle     .LBB0_2
        mov     edx, eax
        shr     edx
        mov     dword ptr [rdi], edx
.LBB0_2:
        lea     eax, [rax + 2*rcx]
        ret
```

[C++ version](https://godbolt.org/#g:!((g:!((g:!((h:codeEditor,i:(filename:'1',fontScale:14,fontUsePx:'0',j:1,lang:c%2B%2B,selection:(endColumn:14,endLineNumber:6,positionColumn:14,positionLineNumber:6,selectionStartColumn:14,selectionStartLineNumber:6,startColumn:14,startLineNumber:6),source:'int+aa(int+*+a,+int+*+b)+%7B%0A++++int+sum+%3D+*a+%2B+*b%3B%0A++++if+(*a+%3E+10)+%7B%0A++++++++*a+/%3D+2%3B%0A++++%7D%0A++++sum+%2B%3D+*b%3B%0A++++return+sum%3B%0A%7D'),l:'5',n:'0',o:'C%2B%2B+source+%231',t:'0')),k:50,l:'4',n:'0',o:'',s:0,t:'0'),(g:!((h:compiler,i:(compiler:clang1701,filters:(b:'0',binary:'1',binaryObject:'1',commentOnly:'0',debugCalls:'1',demangle:'0',directives:'0',execute:'1',intel:'0',libraryCode:'0',trim:'1'),flagsViewOpen:'1',fontScale:14,fontUsePx:'0',j:1,lang:c%2B%2B,libs:!(),options:'-O3',overrides:!(),selection:(endColumn:34,endLineNumber:10,positionColumn:34,positionLineNumber:10,selectionStartColumn:34,selectionStartLineNumber:10,startColumn:34,startLineNumber:10),source:1),l:'5',n:'0',o:'+x86-64+clang+17.0.1+(Editor+%231)',t:'0')),k:50,l:'4',n:'0',o:'',s:0,t:'0')),l:'2',n:'0',o:'',t:'0')),version:4)

```cpp
int aa(int * a, int * b) {
    int sum = *a + *b;
    if (*a > 10) {
        *a /= 2;
    }
    sum += *b;
    return sum;
}
```

With `-O3`:

```asm
aa(int*, int*):                              # @aa(int*, int*)
        mov     ecx, dword ptr [rdi]
        mov     eax, dword ptr [rsi]
        mov     edx, eax
        cmp     ecx, 11
        jl      .LBB0_2
        mov     edx, ecx
        shr     edx
        mov     dword ptr [rdi], edx
        mov     edx, dword ptr [rsi]
.LBB0_2:
        add     eax, ecx
        add     eax, edx
        ret
``````

Unoptimized code might load/save data from/to memory each time the reference is used. Optimized code can load data from both into registers in the beginning, do all computations using only registers (which is usually faster) and only save the new values back to memory at the end. But if the assumption is wrong (for example somebody used unsafe to mistakenly create 2 mut refs to the same address), then the behavior can be different depending on opt level. In unoptimized mode, updating data through one reference will immediately be visible when accessing it through the other, whereas the optimized version will continue using the original value in registers because it never notices the memory changed.
