#include <memlayout.h>

# vectors.S sends all traps here.
.text
.globl __alltraps
__alltraps:

    # 这里会保存当前打断程序的trapframe结构
    # 同时吧kenel里面的数据压栈
    # 把这个trapframe作为一个trapframe类型的参数传入到trap中，进行中断处理

    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
    pushl %es
    pushl %fs
    pushl %gs
    pushal

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
    movw %ax, %ds
    movw %ax, %es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp

    # call trap(tf), where tf=%esp
    call trap
    # 注意，第一个eip是trapframe的eip，另外一个eip是call命令产生的eip，需要区分

    # pop the pushed stack pointer
    popl %esp

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal

    # restore %ds, %es, %fs and %gs
    popl %gs
    popl %fs
    popl %es
    popl %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
    iret

