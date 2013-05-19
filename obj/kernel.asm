
bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba 20 fd 10 00       	mov    $0x10fd20,%edx
  10000b:	b8 18 ea 10 00       	mov    $0x10ea18,%eax
  100010:	89 d1                	mov    %edx,%ecx
  100012:	29 c1                	sub    %eax,%ecx
  100014:	89 c8                	mov    %ecx,%eax
  100016:	89 44 24 08          	mov    %eax,0x8(%esp)
  10001a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100021:	00 
  100022:	c7 04 24 18 ea 10 00 	movl   $0x10ea18,(%esp)
  100029:	e8 31 34 00 00       	call   10345f <memset>

    cons_init();                // init the console
  10002e:	e8 33 16 00 00       	call   101666 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100033:	c7 45 f4 20 36 10 00 	movl   $0x103620,-0xc(%ebp)
    cprintf("%s\n\n", message);
  10003a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100041:	c7 04 24 3c 36 10 00 	movl   $0x10363c,(%esp)
  100048:	e8 da 02 00 00       	call   100327 <cprintf>

    print_kerninfo();
  10004d:	e8 e4 07 00 00       	call   100836 <print_kerninfo>
   
    cprintf("It's kalfazed------------------------\n");
  100052:	c7 04 24 44 36 10 00 	movl   $0x103644,(%esp)
  100059:	e8 c9 02 00 00       	call   100327 <cprintf>
    grade_backtrace();
  10005e:	e8 86 00 00 00       	call   1000e9 <grade_backtrace>

    pmm_init();                 // init physical memory management
  100063:	e8 e9 29 00 00       	call   102a51 <pmm_init>
    pic_init();                 // init interrupt controller
  100068:	e8 44 17 00 00       	call   1017b1 <pic_init>
    idt_init();                 // init interrupt descriptor table
  10006d:	e8 a2 18 00 00       	call   101914 <idt_init>

//    kbd_init();
    clock_init();               // init clock interrupt
  100072:	e8 41 0d 00 00       	call   100db8 <clock_init>
    intr_enable();              // enable irq interrupt
  100077:	e8 9c 16 00 00       	call   101718 <intr_enable>
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
//    while (1);
}
  10007c:	c9                   	leave  
  10007d:	c3                   	ret    

0010007e <grade_backtrace2>:

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  10007e:	55                   	push   %ebp
  10007f:	89 e5                	mov    %esp,%ebp
  100081:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  100084:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  10008b:	00 
  10008c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100093:	00 
  100094:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10009b:	e8 42 0c 00 00       	call   100ce2 <mon_backtrace>
}
  1000a0:	c9                   	leave  
  1000a1:	c3                   	ret    

001000a2 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  1000a2:	55                   	push   %ebp
  1000a3:	89 e5                	mov    %esp,%ebp
  1000a5:	53                   	push   %ebx
  1000a6:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  1000a9:	8d 5d 0c             	lea    0xc(%ebp),%ebx
  1000ac:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1000af:	8d 55 08             	lea    0x8(%ebp),%edx
  1000b2:	8b 45 08             	mov    0x8(%ebp),%eax
  1000b5:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  1000b9:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  1000bd:	89 54 24 04          	mov    %edx,0x4(%esp)
  1000c1:	89 04 24             	mov    %eax,(%esp)
  1000c4:	e8 b5 ff ff ff       	call   10007e <grade_backtrace2>
}
  1000c9:	83 c4 14             	add    $0x14,%esp
  1000cc:	5b                   	pop    %ebx
  1000cd:	5d                   	pop    %ebp
  1000ce:	c3                   	ret    

001000cf <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000cf:	55                   	push   %ebp
  1000d0:	89 e5                	mov    %esp,%ebp
  1000d2:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000d5:	8b 45 10             	mov    0x10(%ebp),%eax
  1000d8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000dc:	8b 45 08             	mov    0x8(%ebp),%eax
  1000df:	89 04 24             	mov    %eax,(%esp)
  1000e2:	e8 bb ff ff ff       	call   1000a2 <grade_backtrace1>
}
  1000e7:	c9                   	leave  
  1000e8:	c3                   	ret    

001000e9 <grade_backtrace>:

void
grade_backtrace(void) {
  1000e9:	55                   	push   %ebp
  1000ea:	89 e5                	mov    %esp,%ebp
  1000ec:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000ef:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000f4:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000fb:	ff 
  1000fc:	89 44 24 04          	mov    %eax,0x4(%esp)
  100100:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100107:	e8 c3 ff ff ff       	call   1000cf <grade_backtrace0>
}
  10010c:	c9                   	leave  
  10010d:	c3                   	ret    

0010010e <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  10010e:	55                   	push   %ebp
  10010f:	89 e5                	mov    %esp,%ebp
  100111:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  100114:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100117:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  10011a:	8c 45 f2             	mov    %es,-0xe(%ebp)
  10011d:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  100120:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100124:	0f b7 c0             	movzwl %ax,%eax
  100127:	89 c2                	mov    %eax,%edx
  100129:	83 e2 03             	and    $0x3,%edx
  10012c:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100131:	89 54 24 08          	mov    %edx,0x8(%esp)
  100135:	89 44 24 04          	mov    %eax,0x4(%esp)
  100139:	c7 04 24 6b 36 10 00 	movl   $0x10366b,(%esp)
  100140:	e8 e2 01 00 00       	call   100327 <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  100145:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100149:	0f b7 d0             	movzwl %ax,%edx
  10014c:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100151:	89 54 24 08          	mov    %edx,0x8(%esp)
  100155:	89 44 24 04          	mov    %eax,0x4(%esp)
  100159:	c7 04 24 79 36 10 00 	movl   $0x103679,(%esp)
  100160:	e8 c2 01 00 00       	call   100327 <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  100165:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100169:	0f b7 d0             	movzwl %ax,%edx
  10016c:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100171:	89 54 24 08          	mov    %edx,0x8(%esp)
  100175:	89 44 24 04          	mov    %eax,0x4(%esp)
  100179:	c7 04 24 87 36 10 00 	movl   $0x103687,(%esp)
  100180:	e8 a2 01 00 00       	call   100327 <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  100185:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100189:	0f b7 d0             	movzwl %ax,%edx
  10018c:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100191:	89 54 24 08          	mov    %edx,0x8(%esp)
  100195:	89 44 24 04          	mov    %eax,0x4(%esp)
  100199:	c7 04 24 95 36 10 00 	movl   $0x103695,(%esp)
  1001a0:	e8 82 01 00 00       	call   100327 <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  1001a5:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1001a9:	0f b7 d0             	movzwl %ax,%edx
  1001ac:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001b1:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001b5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001b9:	c7 04 24 a3 36 10 00 	movl   $0x1036a3,(%esp)
  1001c0:	e8 62 01 00 00       	call   100327 <cprintf>
    round ++;
  1001c5:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001ca:	83 c0 01             	add    $0x1,%eax
  1001cd:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  1001d2:	c9                   	leave  
  1001d3:	c3                   	ret    

001001d4 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001d4:	55                   	push   %ebp
  1001d5:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001d7:	5d                   	pop    %ebp
  1001d8:	c3                   	ret    

001001d9 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001d9:	55                   	push   %ebp
  1001da:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001dc:	5d                   	pop    %ebp
  1001dd:	c3                   	ret    

001001de <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001de:	55                   	push   %ebp
  1001df:	89 e5                	mov    %esp,%ebp
  1001e1:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001e4:	e8 25 ff ff ff       	call   10010e <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001e9:	c7 04 24 b4 36 10 00 	movl   $0x1036b4,(%esp)
  1001f0:	e8 32 01 00 00       	call   100327 <cprintf>
    lab1_switch_to_user();
  1001f5:	e8 da ff ff ff       	call   1001d4 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001fa:	e8 0f ff ff ff       	call   10010e <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001ff:	c7 04 24 d4 36 10 00 	movl   $0x1036d4,(%esp)
  100206:	e8 1c 01 00 00       	call   100327 <cprintf>
    lab1_switch_to_kernel();
  10020b:	e8 c9 ff ff ff       	call   1001d9 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100210:	e8 f9 fe ff ff       	call   10010e <lab1_print_cur_status>
}
  100215:	c9                   	leave  
  100216:	c3                   	ret    
	...

00100218 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  100218:	55                   	push   %ebp
  100219:	89 e5                	mov    %esp,%ebp
  10021b:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  10021e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100222:	74 13                	je     100237 <readline+0x1f>
        cprintf("%s", prompt);
  100224:	8b 45 08             	mov    0x8(%ebp),%eax
  100227:	89 44 24 04          	mov    %eax,0x4(%esp)
  10022b:	c7 04 24 f3 36 10 00 	movl   $0x1036f3,(%esp)
  100232:	e8 f0 00 00 00       	call   100327 <cprintf>
    }
    int i = 0, c;
  100237:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10023e:	eb 01                	jmp    100241 <readline+0x29>
        else if (c == '\n' || c == '\r') {
            cputchar(c);
            buf[i] = '\0';
            return buf;
        }
    }
  100240:	90                   	nop
    if (prompt != NULL) {
        cprintf("%s", prompt);
    }
    int i = 0, c;
    while (1) {
        c = getchar();
  100241:	e8 6e 01 00 00       	call   1003b4 <getchar>
  100246:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100249:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10024d:	79 07                	jns    100256 <readline+0x3e>
            return NULL;
  10024f:	b8 00 00 00 00       	mov    $0x0,%eax
  100254:	eb 79                	jmp    1002cf <readline+0xb7>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100256:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  10025a:	7e 28                	jle    100284 <readline+0x6c>
  10025c:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100263:	7f 1f                	jg     100284 <readline+0x6c>
            cputchar(c);
  100265:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100268:	89 04 24             	mov    %eax,(%esp)
  10026b:	e8 df 00 00 00       	call   10034f <cputchar>
            buf[i ++] = c;
  100270:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100273:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100276:	81 c2 40 ea 10 00    	add    $0x10ea40,%edx
  10027c:	88 02                	mov    %al,(%edx)
  10027e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100282:	eb 46                	jmp    1002ca <readline+0xb2>
        }
        else if (c == '\b' && i > 0) {
  100284:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  100288:	75 17                	jne    1002a1 <readline+0x89>
  10028a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10028e:	7e 11                	jle    1002a1 <readline+0x89>
            cputchar(c);
  100290:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100293:	89 04 24             	mov    %eax,(%esp)
  100296:	e8 b4 00 00 00       	call   10034f <cputchar>
            i --;
  10029b:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  10029f:	eb 29                	jmp    1002ca <readline+0xb2>
        }
        else if (c == '\n' || c == '\r') {
  1002a1:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  1002a5:	74 06                	je     1002ad <readline+0x95>
  1002a7:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  1002ab:	75 93                	jne    100240 <readline+0x28>
            cputchar(c);
  1002ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1002b0:	89 04 24             	mov    %eax,(%esp)
  1002b3:	e8 97 00 00 00       	call   10034f <cputchar>
            buf[i] = '\0';
  1002b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1002bb:	05 40 ea 10 00       	add    $0x10ea40,%eax
  1002c0:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1002c3:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  1002c8:	eb 05                	jmp    1002cf <readline+0xb7>
        }
    }
  1002ca:	e9 71 ff ff ff       	jmp    100240 <readline+0x28>
}
  1002cf:	c9                   	leave  
  1002d0:	c3                   	ret    
  1002d1:	00 00                	add    %al,(%eax)
	...

001002d4 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1002d4:	55                   	push   %ebp
  1002d5:	89 e5                	mov    %esp,%ebp
  1002d7:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002da:	8b 45 08             	mov    0x8(%ebp),%eax
  1002dd:	89 04 24             	mov    %eax,(%esp)
  1002e0:	e8 ad 13 00 00       	call   101692 <cons_putc>
    (*cnt) ++;
  1002e5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002e8:	8b 00                	mov    (%eax),%eax
  1002ea:	8d 50 01             	lea    0x1(%eax),%edx
  1002ed:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002f0:	89 10                	mov    %edx,(%eax)
}
  1002f2:	c9                   	leave  
  1002f3:	c3                   	ret    

001002f4 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  1002f4:	55                   	push   %ebp
  1002f5:	89 e5                	mov    %esp,%ebp
  1002f7:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002fa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  100301:	8b 45 0c             	mov    0xc(%ebp),%eax
  100304:	89 44 24 0c          	mov    %eax,0xc(%esp)
  100308:	8b 45 08             	mov    0x8(%ebp),%eax
  10030b:	89 44 24 08          	mov    %eax,0x8(%esp)
  10030f:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100312:	89 44 24 04          	mov    %eax,0x4(%esp)
  100316:	c7 04 24 d4 02 10 00 	movl   $0x1002d4,(%esp)
  10031d:	e8 40 29 00 00       	call   102c62 <vprintfmt>
    return cnt;
  100322:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100325:	c9                   	leave  
  100326:	c3                   	ret    

00100327 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100327:	55                   	push   %ebp
  100328:	89 e5                	mov    %esp,%ebp
  10032a:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10032d:	8d 55 0c             	lea    0xc(%ebp),%edx
  100330:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100333:	89 10                	mov    %edx,(%eax)
    cnt = vcprintf(fmt, ap);
  100335:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100338:	89 44 24 04          	mov    %eax,0x4(%esp)
  10033c:	8b 45 08             	mov    0x8(%ebp),%eax
  10033f:	89 04 24             	mov    %eax,(%esp)
  100342:	e8 ad ff ff ff       	call   1002f4 <vcprintf>
  100347:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10034a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10034d:	c9                   	leave  
  10034e:	c3                   	ret    

0010034f <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  10034f:	55                   	push   %ebp
  100350:	89 e5                	mov    %esp,%ebp
  100352:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100355:	8b 45 08             	mov    0x8(%ebp),%eax
  100358:	89 04 24             	mov    %eax,(%esp)
  10035b:	e8 32 13 00 00       	call   101692 <cons_putc>
}
  100360:	c9                   	leave  
  100361:	c3                   	ret    

00100362 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  100362:	55                   	push   %ebp
  100363:	89 e5                	mov    %esp,%ebp
  100365:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  100368:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  10036f:	eb 13                	jmp    100384 <cputs+0x22>
        cputch(c, &cnt);
  100371:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  100375:	8d 55 f0             	lea    -0x10(%ebp),%edx
  100378:	89 54 24 04          	mov    %edx,0x4(%esp)
  10037c:	89 04 24             	mov    %eax,(%esp)
  10037f:	e8 50 ff ff ff       	call   1002d4 <cputch>
 * */
int
cputs(const char *str) {
    int cnt = 0;
    char c;
    while ((c = *str ++) != '\0') {
  100384:	8b 45 08             	mov    0x8(%ebp),%eax
  100387:	0f b6 00             	movzbl (%eax),%eax
  10038a:	88 45 f7             	mov    %al,-0x9(%ebp)
  10038d:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  100391:	0f 95 c0             	setne  %al
  100394:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  100398:	84 c0                	test   %al,%al
  10039a:	75 d5                	jne    100371 <cputs+0xf>
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
  10039c:	8d 45 f0             	lea    -0x10(%ebp),%eax
  10039f:	89 44 24 04          	mov    %eax,0x4(%esp)
  1003a3:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  1003aa:	e8 25 ff ff ff       	call   1002d4 <cputch>
    return cnt;
  1003af:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1003b2:	c9                   	leave  
  1003b3:	c3                   	ret    

001003b4 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1003b4:	55                   	push   %ebp
  1003b5:	89 e5                	mov    %esp,%ebp
  1003b7:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1003ba:	e8 fc 12 00 00       	call   1016bb <cons_getc>
  1003bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1003c2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003c6:	74 f2                	je     1003ba <getchar+0x6>
        /* do nothing */;
    return c;
  1003c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1003cb:	c9                   	leave  
  1003cc:	c3                   	ret    
  1003cd:	00 00                	add    %al,(%eax)
	...

001003d0 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1003d0:	55                   	push   %ebp
  1003d1:	89 e5                	mov    %esp,%ebp
  1003d3:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1003d6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003d9:	8b 00                	mov    (%eax),%eax
  1003db:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1003de:	8b 45 10             	mov    0x10(%ebp),%eax
  1003e1:	8b 00                	mov    (%eax),%eax
  1003e3:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1003e6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1003ed:	e9 c6 00 00 00       	jmp    1004b8 <stab_binsearch+0xe8>
        int true_m = (l + r) / 2, m = true_m;
  1003f2:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1003f5:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1003f8:	01 d0                	add    %edx,%eax
  1003fa:	89 c2                	mov    %eax,%edx
  1003fc:	c1 ea 1f             	shr    $0x1f,%edx
  1003ff:	01 d0                	add    %edx,%eax
  100401:	d1 f8                	sar    %eax
  100403:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100406:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100409:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  10040c:	eb 04                	jmp    100412 <stab_binsearch+0x42>
            m --;
  10040e:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)

    while (l <= r) {
        int true_m = (l + r) / 2, m = true_m;

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  100412:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100415:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100418:	7c 1b                	jl     100435 <stab_binsearch+0x65>
  10041a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10041d:	89 d0                	mov    %edx,%eax
  10041f:	01 c0                	add    %eax,%eax
  100421:	01 d0                	add    %edx,%eax
  100423:	c1 e0 02             	shl    $0x2,%eax
  100426:	03 45 08             	add    0x8(%ebp),%eax
  100429:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10042d:	0f b6 c0             	movzbl %al,%eax
  100430:	3b 45 14             	cmp    0x14(%ebp),%eax
  100433:	75 d9                	jne    10040e <stab_binsearch+0x3e>
            m --;
        }
        if (m < l) {    // no match in [l, m]
  100435:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100438:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  10043b:	7d 0b                	jge    100448 <stab_binsearch+0x78>
            l = true_m + 1;
  10043d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100440:	83 c0 01             	add    $0x1,%eax
  100443:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  100446:	eb 70                	jmp    1004b8 <stab_binsearch+0xe8>
        }

        // actual binary search
        any_matches = 1;
  100448:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  10044f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100452:	89 d0                	mov    %edx,%eax
  100454:	01 c0                	add    %eax,%eax
  100456:	01 d0                	add    %edx,%eax
  100458:	c1 e0 02             	shl    $0x2,%eax
  10045b:	03 45 08             	add    0x8(%ebp),%eax
  10045e:	8b 40 08             	mov    0x8(%eax),%eax
  100461:	3b 45 18             	cmp    0x18(%ebp),%eax
  100464:	73 13                	jae    100479 <stab_binsearch+0xa9>
            *region_left = m;
  100466:	8b 45 0c             	mov    0xc(%ebp),%eax
  100469:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10046c:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  10046e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100471:	83 c0 01             	add    $0x1,%eax
  100474:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100477:	eb 3f                	jmp    1004b8 <stab_binsearch+0xe8>
        } else if (stabs[m].n_value > addr) {
  100479:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10047c:	89 d0                	mov    %edx,%eax
  10047e:	01 c0                	add    %eax,%eax
  100480:	01 d0                	add    %edx,%eax
  100482:	c1 e0 02             	shl    $0x2,%eax
  100485:	03 45 08             	add    0x8(%ebp),%eax
  100488:	8b 40 08             	mov    0x8(%eax),%eax
  10048b:	3b 45 18             	cmp    0x18(%ebp),%eax
  10048e:	76 16                	jbe    1004a6 <stab_binsearch+0xd6>
            *region_right = m - 1;
  100490:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100493:	8d 50 ff             	lea    -0x1(%eax),%edx
  100496:	8b 45 10             	mov    0x10(%ebp),%eax
  100499:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  10049b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10049e:	83 e8 01             	sub    $0x1,%eax
  1004a1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1004a4:	eb 12                	jmp    1004b8 <stab_binsearch+0xe8>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  1004a6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004a9:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004ac:	89 10                	mov    %edx,(%eax)
            l = m;
  1004ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004b1:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1004b4:	83 45 18 01          	addl   $0x1,0x18(%ebp)
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
    int l = *region_left, r = *region_right, any_matches = 0;

    while (l <= r) {
  1004b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1004bb:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1004be:	0f 8e 2e ff ff ff    	jle    1003f2 <stab_binsearch+0x22>
            l = m;
            addr ++;
        }
    }

    if (!any_matches) {
  1004c4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1004c8:	75 0f                	jne    1004d9 <stab_binsearch+0x109>
        *region_right = *region_left - 1;
  1004ca:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004cd:	8b 00                	mov    (%eax),%eax
  1004cf:	8d 50 ff             	lea    -0x1(%eax),%edx
  1004d2:	8b 45 10             	mov    0x10(%ebp),%eax
  1004d5:	89 10                	mov    %edx,(%eax)
  1004d7:	eb 3b                	jmp    100514 <stab_binsearch+0x144>
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  1004d9:	8b 45 10             	mov    0x10(%ebp),%eax
  1004dc:	8b 00                	mov    (%eax),%eax
  1004de:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1004e1:	eb 04                	jmp    1004e7 <stab_binsearch+0x117>
  1004e3:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  1004e7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004ea:	8b 00                	mov    (%eax),%eax
  1004ec:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004ef:	7d 1b                	jge    10050c <stab_binsearch+0x13c>
  1004f1:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004f4:	89 d0                	mov    %edx,%eax
  1004f6:	01 c0                	add    %eax,%eax
  1004f8:	01 d0                	add    %edx,%eax
  1004fa:	c1 e0 02             	shl    $0x2,%eax
  1004fd:	03 45 08             	add    0x8(%ebp),%eax
  100500:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100504:	0f b6 c0             	movzbl %al,%eax
  100507:	3b 45 14             	cmp    0x14(%ebp),%eax
  10050a:	75 d7                	jne    1004e3 <stab_binsearch+0x113>
            /* do nothing */;
        *region_left = l;
  10050c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10050f:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100512:	89 10                	mov    %edx,(%eax)
    }
}
  100514:	c9                   	leave  
  100515:	c3                   	ret    

00100516 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  100516:	55                   	push   %ebp
  100517:	89 e5                	mov    %esp,%ebp
  100519:	53                   	push   %ebx
  10051a:	83 ec 54             	sub    $0x54,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  10051d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100520:	c7 00 f8 36 10 00    	movl   $0x1036f8,(%eax)
    info->eip_line = 0;
  100526:	8b 45 0c             	mov    0xc(%ebp),%eax
  100529:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  100530:	8b 45 0c             	mov    0xc(%ebp),%eax
  100533:	c7 40 08 f8 36 10 00 	movl   $0x1036f8,0x8(%eax)
    info->eip_fn_namelen = 9;
  10053a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10053d:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  100544:	8b 45 0c             	mov    0xc(%ebp),%eax
  100547:	8b 55 08             	mov    0x8(%ebp),%edx
  10054a:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  10054d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100550:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100557:	c7 45 f4 6c 3f 10 00 	movl   $0x103f6c,-0xc(%ebp)
    stab_end = __STAB_END__;
  10055e:	c7 45 f0 08 b8 10 00 	movl   $0x10b808,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  100565:	c7 45 ec 09 b8 10 00 	movl   $0x10b809,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  10056c:	c7 45 e8 d5 d7 10 00 	movl   $0x10d7d5,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  100573:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100576:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100579:	76 0d                	jbe    100588 <debuginfo_eip+0x72>
  10057b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10057e:	83 e8 01             	sub    $0x1,%eax
  100581:	0f b6 00             	movzbl (%eax),%eax
  100584:	84 c0                	test   %al,%al
  100586:	74 0a                	je     100592 <debuginfo_eip+0x7c>
        return -1;
  100588:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10058d:	e9 9e 02 00 00       	jmp    100830 <debuginfo_eip+0x31a>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100592:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100599:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10059c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10059f:	89 d1                	mov    %edx,%ecx
  1005a1:	29 c1                	sub    %eax,%ecx
  1005a3:	89 c8                	mov    %ecx,%eax
  1005a5:	c1 f8 02             	sar    $0x2,%eax
  1005a8:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  1005ae:	83 e8 01             	sub    $0x1,%eax
  1005b1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1005b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1005b7:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005bb:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1005c2:	00 
  1005c3:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1005c6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005ca:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1005cd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1005d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005d4:	89 04 24             	mov    %eax,(%esp)
  1005d7:	e8 f4 fd ff ff       	call   1003d0 <stab_binsearch>
    if (lfile == 0)
  1005dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005df:	85 c0                	test   %eax,%eax
  1005e1:	75 0a                	jne    1005ed <debuginfo_eip+0xd7>
        return -1;
  1005e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1005e8:	e9 43 02 00 00       	jmp    100830 <debuginfo_eip+0x31a>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1005ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005f0:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1005f3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1005f6:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1005f9:	8b 45 08             	mov    0x8(%ebp),%eax
  1005fc:	89 44 24 10          	mov    %eax,0x10(%esp)
  100600:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  100607:	00 
  100608:	8d 45 d8             	lea    -0x28(%ebp),%eax
  10060b:	89 44 24 08          	mov    %eax,0x8(%esp)
  10060f:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100612:	89 44 24 04          	mov    %eax,0x4(%esp)
  100616:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100619:	89 04 24             	mov    %eax,(%esp)
  10061c:	e8 af fd ff ff       	call   1003d0 <stab_binsearch>

    if (lfun <= rfun) {
  100621:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100624:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100627:	39 c2                	cmp    %eax,%edx
  100629:	7f 72                	jg     10069d <debuginfo_eip+0x187>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  10062b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10062e:	89 c2                	mov    %eax,%edx
  100630:	89 d0                	mov    %edx,%eax
  100632:	01 c0                	add    %eax,%eax
  100634:	01 d0                	add    %edx,%eax
  100636:	c1 e0 02             	shl    $0x2,%eax
  100639:	03 45 f4             	add    -0xc(%ebp),%eax
  10063c:	8b 10                	mov    (%eax),%edx
  10063e:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100641:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100644:	89 cb                	mov    %ecx,%ebx
  100646:	29 c3                	sub    %eax,%ebx
  100648:	89 d8                	mov    %ebx,%eax
  10064a:	39 c2                	cmp    %eax,%edx
  10064c:	73 1e                	jae    10066c <debuginfo_eip+0x156>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  10064e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100651:	89 c2                	mov    %eax,%edx
  100653:	89 d0                	mov    %edx,%eax
  100655:	01 c0                	add    %eax,%eax
  100657:	01 d0                	add    %edx,%eax
  100659:	c1 e0 02             	shl    $0x2,%eax
  10065c:	03 45 f4             	add    -0xc(%ebp),%eax
  10065f:	8b 00                	mov    (%eax),%eax
  100661:	89 c2                	mov    %eax,%edx
  100663:	03 55 ec             	add    -0x14(%ebp),%edx
  100666:	8b 45 0c             	mov    0xc(%ebp),%eax
  100669:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  10066c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10066f:	89 c2                	mov    %eax,%edx
  100671:	89 d0                	mov    %edx,%eax
  100673:	01 c0                	add    %eax,%eax
  100675:	01 d0                	add    %edx,%eax
  100677:	c1 e0 02             	shl    $0x2,%eax
  10067a:	03 45 f4             	add    -0xc(%ebp),%eax
  10067d:	8b 50 08             	mov    0x8(%eax),%edx
  100680:	8b 45 0c             	mov    0xc(%ebp),%eax
  100683:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100686:	8b 45 0c             	mov    0xc(%ebp),%eax
  100689:	8b 40 10             	mov    0x10(%eax),%eax
  10068c:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  10068f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100692:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  100695:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100698:	89 45 d0             	mov    %eax,-0x30(%ebp)
  10069b:	eb 15                	jmp    1006b2 <debuginfo_eip+0x19c>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  10069d:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006a0:	8b 55 08             	mov    0x8(%ebp),%edx
  1006a3:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  1006a6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006a9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1006ac:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006af:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1006b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006b5:	8b 40 08             	mov    0x8(%eax),%eax
  1006b8:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1006bf:	00 
  1006c0:	89 04 24             	mov    %eax,(%esp)
  1006c3:	e8 0f 2c 00 00       	call   1032d7 <strfind>
  1006c8:	89 c2                	mov    %eax,%edx
  1006ca:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006cd:	8b 40 08             	mov    0x8(%eax),%eax
  1006d0:	29 c2                	sub    %eax,%edx
  1006d2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006d5:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1006d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1006db:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006df:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1006e6:	00 
  1006e7:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1006ea:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006ee:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1006f1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006f8:	89 04 24             	mov    %eax,(%esp)
  1006fb:	e8 d0 fc ff ff       	call   1003d0 <stab_binsearch>
    if (lline <= rline) {
  100700:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100703:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100706:	39 c2                	cmp    %eax,%edx
  100708:	7f 20                	jg     10072a <debuginfo_eip+0x214>
        info->eip_line = stabs[rline].n_desc;
  10070a:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10070d:	89 c2                	mov    %eax,%edx
  10070f:	89 d0                	mov    %edx,%eax
  100711:	01 c0                	add    %eax,%eax
  100713:	01 d0                	add    %edx,%eax
  100715:	c1 e0 02             	shl    $0x2,%eax
  100718:	03 45 f4             	add    -0xc(%ebp),%eax
  10071b:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  10071f:	0f b7 d0             	movzwl %ax,%edx
  100722:	8b 45 0c             	mov    0xc(%ebp),%eax
  100725:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100728:	eb 13                	jmp    10073d <debuginfo_eip+0x227>
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
    if (lline <= rline) {
        info->eip_line = stabs[rline].n_desc;
    } else {
        return -1;
  10072a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10072f:	e9 fc 00 00 00       	jmp    100830 <debuginfo_eip+0x31a>
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  100734:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100737:	83 e8 01             	sub    $0x1,%eax
  10073a:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  10073d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100740:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100743:	39 c2                	cmp    %eax,%edx
  100745:	7c 4a                	jl     100791 <debuginfo_eip+0x27b>
           && stabs[lline].n_type != N_SOL
  100747:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10074a:	89 c2                	mov    %eax,%edx
  10074c:	89 d0                	mov    %edx,%eax
  10074e:	01 c0                	add    %eax,%eax
  100750:	01 d0                	add    %edx,%eax
  100752:	c1 e0 02             	shl    $0x2,%eax
  100755:	03 45 f4             	add    -0xc(%ebp),%eax
  100758:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10075c:	3c 84                	cmp    $0x84,%al
  10075e:	74 31                	je     100791 <debuginfo_eip+0x27b>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100760:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100763:	89 c2                	mov    %eax,%edx
  100765:	89 d0                	mov    %edx,%eax
  100767:	01 c0                	add    %eax,%eax
  100769:	01 d0                	add    %edx,%eax
  10076b:	c1 e0 02             	shl    $0x2,%eax
  10076e:	03 45 f4             	add    -0xc(%ebp),%eax
  100771:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100775:	3c 64                	cmp    $0x64,%al
  100777:	75 bb                	jne    100734 <debuginfo_eip+0x21e>
  100779:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10077c:	89 c2                	mov    %eax,%edx
  10077e:	89 d0                	mov    %edx,%eax
  100780:	01 c0                	add    %eax,%eax
  100782:	01 d0                	add    %edx,%eax
  100784:	c1 e0 02             	shl    $0x2,%eax
  100787:	03 45 f4             	add    -0xc(%ebp),%eax
  10078a:	8b 40 08             	mov    0x8(%eax),%eax
  10078d:	85 c0                	test   %eax,%eax
  10078f:	74 a3                	je     100734 <debuginfo_eip+0x21e>
        lline --;
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  100791:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100794:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100797:	39 c2                	cmp    %eax,%edx
  100799:	7c 40                	jl     1007db <debuginfo_eip+0x2c5>
  10079b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10079e:	89 c2                	mov    %eax,%edx
  1007a0:	89 d0                	mov    %edx,%eax
  1007a2:	01 c0                	add    %eax,%eax
  1007a4:	01 d0                	add    %edx,%eax
  1007a6:	c1 e0 02             	shl    $0x2,%eax
  1007a9:	03 45 f4             	add    -0xc(%ebp),%eax
  1007ac:	8b 10                	mov    (%eax),%edx
  1007ae:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1007b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007b4:	89 cb                	mov    %ecx,%ebx
  1007b6:	29 c3                	sub    %eax,%ebx
  1007b8:	89 d8                	mov    %ebx,%eax
  1007ba:	39 c2                	cmp    %eax,%edx
  1007bc:	73 1d                	jae    1007db <debuginfo_eip+0x2c5>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1007be:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007c1:	89 c2                	mov    %eax,%edx
  1007c3:	89 d0                	mov    %edx,%eax
  1007c5:	01 c0                	add    %eax,%eax
  1007c7:	01 d0                	add    %edx,%eax
  1007c9:	c1 e0 02             	shl    $0x2,%eax
  1007cc:	03 45 f4             	add    -0xc(%ebp),%eax
  1007cf:	8b 00                	mov    (%eax),%eax
  1007d1:	89 c2                	mov    %eax,%edx
  1007d3:	03 55 ec             	add    -0x14(%ebp),%edx
  1007d6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007d9:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1007db:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1007de:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1007e1:	39 c2                	cmp    %eax,%edx
  1007e3:	7d 46                	jge    10082b <debuginfo_eip+0x315>
        for (lline = lfun + 1;
  1007e5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1007e8:	83 c0 01             	add    $0x1,%eax
  1007eb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1007ee:	eb 18                	jmp    100808 <debuginfo_eip+0x2f2>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  1007f0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007f3:	8b 40 14             	mov    0x14(%eax),%eax
  1007f6:	8d 50 01             	lea    0x1(%eax),%edx
  1007f9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007fc:	89 50 14             	mov    %edx,0x14(%eax)
    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
  1007ff:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100802:	83 c0 01             	add    $0x1,%eax
  100805:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100808:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10080b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
  10080e:	39 c2                	cmp    %eax,%edx
  100810:	7d 19                	jge    10082b <debuginfo_eip+0x315>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100812:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100815:	89 c2                	mov    %eax,%edx
  100817:	89 d0                	mov    %edx,%eax
  100819:	01 c0                	add    %eax,%eax
  10081b:	01 d0                	add    %edx,%eax
  10081d:	c1 e0 02             	shl    $0x2,%eax
  100820:	03 45 f4             	add    -0xc(%ebp),%eax
  100823:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100827:	3c a0                	cmp    $0xa0,%al
  100829:	74 c5                	je     1007f0 <debuginfo_eip+0x2da>
             lline ++) {
            info->eip_fn_narg ++;
        }
    }
    return 0;
  10082b:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100830:	83 c4 54             	add    $0x54,%esp
  100833:	5b                   	pop    %ebx
  100834:	5d                   	pop    %ebp
  100835:	c3                   	ret    

00100836 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100836:	55                   	push   %ebp
  100837:	89 e5                	mov    %esp,%ebp
  100839:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  10083c:	c7 04 24 02 37 10 00 	movl   $0x103702,(%esp)
  100843:	e8 df fa ff ff       	call   100327 <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100848:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  10084f:	00 
  100850:	c7 04 24 1b 37 10 00 	movl   $0x10371b,(%esp)
  100857:	e8 cb fa ff ff       	call   100327 <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  10085c:	c7 44 24 04 17 36 10 	movl   $0x103617,0x4(%esp)
  100863:	00 
  100864:	c7 04 24 33 37 10 00 	movl   $0x103733,(%esp)
  10086b:	e8 b7 fa ff ff       	call   100327 <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  100870:	c7 44 24 04 18 ea 10 	movl   $0x10ea18,0x4(%esp)
  100877:	00 
  100878:	c7 04 24 4b 37 10 00 	movl   $0x10374b,(%esp)
  10087f:	e8 a3 fa ff ff       	call   100327 <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100884:	c7 44 24 04 20 fd 10 	movl   $0x10fd20,0x4(%esp)
  10088b:	00 
  10088c:	c7 04 24 63 37 10 00 	movl   $0x103763,(%esp)
  100893:	e8 8f fa ff ff       	call   100327 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  100898:	b8 20 fd 10 00       	mov    $0x10fd20,%eax
  10089d:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008a3:	b8 00 00 10 00       	mov    $0x100000,%eax
  1008a8:	89 d1                	mov    %edx,%ecx
  1008aa:	29 c1                	sub    %eax,%ecx
  1008ac:	89 c8                	mov    %ecx,%eax
  1008ae:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008b4:	85 c0                	test   %eax,%eax
  1008b6:	0f 48 c2             	cmovs  %edx,%eax
  1008b9:	c1 f8 0a             	sar    $0xa,%eax
  1008bc:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008c0:	c7 04 24 7c 37 10 00 	movl   $0x10377c,(%esp)
  1008c7:	e8 5b fa ff ff       	call   100327 <cprintf>
}
  1008cc:	c9                   	leave  
  1008cd:	c3                   	ret    

001008ce <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1008ce:	55                   	push   %ebp
  1008cf:	89 e5                	mov    %esp,%ebp
  1008d1:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1008d7:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1008da:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008de:	8b 45 08             	mov    0x8(%ebp),%eax
  1008e1:	89 04 24             	mov    %eax,(%esp)
  1008e4:	e8 2d fc ff ff       	call   100516 <debuginfo_eip>
  1008e9:	85 c0                	test   %eax,%eax
  1008eb:	74 15                	je     100902 <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1008ed:	8b 45 08             	mov    0x8(%ebp),%eax
  1008f0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008f4:	c7 04 24 a6 37 10 00 	movl   $0x1037a6,(%esp)
  1008fb:	e8 27 fa ff ff       	call   100327 <cprintf>
  100900:	eb 69                	jmp    10096b <print_debuginfo+0x9d>
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100902:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100909:	eb 1a                	jmp    100925 <print_debuginfo+0x57>
            fnname[j] = info.eip_fn_name[j];
  10090b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10090e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100911:	01 d0                	add    %edx,%eax
  100913:	0f b6 10             	movzbl (%eax),%edx
  100916:	8d 85 dc fe ff ff    	lea    -0x124(%ebp),%eax
  10091c:	03 45 f4             	add    -0xc(%ebp),%eax
  10091f:	88 10                	mov    %dl,(%eax)
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100921:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100925:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100928:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  10092b:	7f de                	jg     10090b <print_debuginfo+0x3d>
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
  10092d:	8d 85 dc fe ff ff    	lea    -0x124(%ebp),%eax
  100933:	03 45 f4             	add    -0xc(%ebp),%eax
  100936:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  100939:	8b 45 ec             	mov    -0x14(%ebp),%eax
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  10093c:	8b 55 08             	mov    0x8(%ebp),%edx
  10093f:	89 d1                	mov    %edx,%ecx
  100941:	29 c1                	sub    %eax,%ecx
  100943:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100946:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100949:	89 4c 24 10          	mov    %ecx,0x10(%esp)
                fnname, eip - info.eip_fn_addr);
  10094d:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100953:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100957:	89 54 24 08          	mov    %edx,0x8(%esp)
  10095b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10095f:	c7 04 24 c2 37 10 00 	movl   $0x1037c2,(%esp)
  100966:	e8 bc f9 ff ff       	call   100327 <cprintf>
                fnname, eip - info.eip_fn_addr);
    }
}
  10096b:	c9                   	leave  
  10096c:	c3                   	ret    

0010096d <read_eip>:

static __noinline uint32_t
read_eip(void) {
  10096d:	55                   	push   %ebp
  10096e:	89 e5                	mov    %esp,%ebp
  100970:	53                   	push   %ebx
  100971:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100974:	8b 5d 04             	mov    0x4(%ebp),%ebx
  100977:	89 5d f8             	mov    %ebx,-0x8(%ebp)
    return eip;
  10097a:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  10097d:	83 c4 10             	add    $0x10,%esp
  100980:	5b                   	pop    %ebx
  100981:	5d                   	pop    %ebp
  100982:	c3                   	ret    

00100983 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100983:	55                   	push   %ebp
  100984:	89 e5                	mov    %esp,%ebp
  100986:	57                   	push   %edi
  100987:	56                   	push   %esi
  100988:	53                   	push   %ebx
  100989:	83 ec 4c             	sub    $0x4c,%esp
    	cprintf("this a frame of stack\n");
  10098c:	c7 04 24 d4 37 10 00 	movl   $0x1037d4,(%esp)
  100993:	e8 8f f9 ff ff       	call   100327 <cprintf>
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100998:	89 eb                	mov    %ebp,%ebx
  10099a:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
    return ebp;
  10099d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
	uint32_t ebp = read_ebp();
  1009a0:	89 45 e0             	mov    %eax,-0x20(%ebp)
	uint32_t eip = read_eip();
  1009a3:	e8 c5 ff ff ff       	call   10096d <read_eip>
  1009a8:	89 45 dc             	mov    %eax,-0x24(%ebp)
	uint32_t arg1;
	uint32_t arg2;
	uint32_t arg3;
	uint32_t arg4;

	while(ebp != 0){
  1009ab:	e9 ec 00 00 00       	jmp    100a9c <print_stackframe+0x119>
	    memcpy(&arg1,ebp+8,4);
  1009b0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1009b3:	83 c0 08             	add    $0x8,%eax
  1009b6:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
  1009bd:	00 
  1009be:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009c2:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1009c5:	89 04 24             	mov    %eax,(%esp)
  1009c8:	e8 91 2b 00 00       	call   10355e <memcpy>
	    memcpy(&arg2,ebp+12,4);
  1009cd:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1009d0:	83 c0 0c             	add    $0xc,%eax
  1009d3:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
  1009da:	00 
  1009db:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009df:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1009e2:	89 04 24             	mov    %eax,(%esp)
  1009e5:	e8 74 2b 00 00       	call   10355e <memcpy>
	    memcpy(&arg3,ebp+16,4);
  1009ea:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1009ed:	83 c0 10             	add    $0x10,%eax
  1009f0:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
  1009f7:	00 
  1009f8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009fc:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1009ff:	89 04 24             	mov    %eax,(%esp)
  100a02:	e8 57 2b 00 00       	call   10355e <memcpy>
	    memcpy(&arg4,ebp+20,4);
  100a07:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100a0a:	83 c0 14             	add    $0x14,%eax
  100a0d:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
  100a14:	00 
  100a15:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a19:	8d 45 cc             	lea    -0x34(%ebp),%eax
  100a1c:	89 04 24             	mov    %eax,(%esp)
  100a1f:	e8 3a 2b 00 00       	call   10355e <memcpy>
	    cprintf("ebp: %x eip:%x args %x %x %x %x\n",ebp,eip,arg1,arg2,arg3,arg4);
  100a24:	8b 7d cc             	mov    -0x34(%ebp),%edi
  100a27:	8b 75 d0             	mov    -0x30(%ebp),%esi
  100a2a:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
  100a2d:	8b 4d d8             	mov    -0x28(%ebp),%ecx
  100a30:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100a33:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100a36:	89 7c 24 18          	mov    %edi,0x18(%esp)
  100a3a:	89 74 24 14          	mov    %esi,0x14(%esp)
  100a3e:	89 5c 24 10          	mov    %ebx,0x10(%esp)
  100a42:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100a46:	89 54 24 08          	mov    %edx,0x8(%esp)
  100a4a:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a4e:	c7 04 24 ec 37 10 00 	movl   $0x1037ec,(%esp)
  100a55:	e8 cd f8 ff ff       	call   100327 <cprintf>
    	    print_debuginfo(eip);
  100a5a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100a5d:	89 04 24             	mov    %eax,(%esp)
  100a60:	e8 69 fe ff ff       	call   1008ce <print_debuginfo>
            memcpy(&eip,ebp+4,4);
  100a65:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100a68:	83 c0 04             	add    $0x4,%eax
  100a6b:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
  100a72:	00 
  100a73:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a77:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100a7a:	89 04 24             	mov    %eax,(%esp)
  100a7d:	e8 dc 2a 00 00       	call   10355e <memcpy>
            memcpy(&ebp,ebp,4);
  100a82:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100a85:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
  100a8c:	00 
  100a8d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a91:	8d 45 e0             	lea    -0x20(%ebp),%eax
  100a94:	89 04 24             	mov    %eax,(%esp)
  100a97:	e8 c2 2a 00 00       	call   10355e <memcpy>
	uint32_t arg1;
	uint32_t arg2;
	uint32_t arg3;
	uint32_t arg4;

	while(ebp != 0){
  100a9c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100a9f:	85 c0                	test   %eax,%eax
  100aa1:	0f 85 09 ff ff ff    	jne    1009b0 <print_stackframe+0x2d>
	    cprintf("ebp: %x eip:%x args %x %x %x %x\n",ebp,eip,arg1,arg2,arg3,arg4);
    	    print_debuginfo(eip);
            memcpy(&eip,ebp+4,4);
            memcpy(&ebp,ebp,4);
	}
}
  100aa7:	83 c4 4c             	add    $0x4c,%esp
  100aaa:	5b                   	pop    %ebx
  100aab:	5e                   	pop    %esi
  100aac:	5f                   	pop    %edi
  100aad:	5d                   	pop    %ebp
  100aae:	c3                   	ret    
	...

00100ab0 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100ab0:	55                   	push   %ebp
  100ab1:	89 e5                	mov    %esp,%ebp
  100ab3:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100ab6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100abd:	eb 0d                	jmp    100acc <parse+0x1c>
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
            buf ++;
        }
    }
  100abf:	90                   	nop
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100ac0:	eb 0a                	jmp    100acc <parse+0x1c>
            *buf ++ = '\0';
  100ac2:	8b 45 08             	mov    0x8(%ebp),%eax
  100ac5:	c6 00 00             	movb   $0x0,(%eax)
  100ac8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100acc:	8b 45 08             	mov    0x8(%ebp),%eax
  100acf:	0f b6 00             	movzbl (%eax),%eax
  100ad2:	84 c0                	test   %al,%al
  100ad4:	74 1d                	je     100af3 <parse+0x43>
  100ad6:	8b 45 08             	mov    0x8(%ebp),%eax
  100ad9:	0f b6 00             	movzbl (%eax),%eax
  100adc:	0f be c0             	movsbl %al,%eax
  100adf:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ae3:	c7 04 24 90 38 10 00 	movl   $0x103890,(%esp)
  100aea:	e8 b5 27 00 00       	call   1032a4 <strchr>
  100aef:	85 c0                	test   %eax,%eax
  100af1:	75 cf                	jne    100ac2 <parse+0x12>
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
  100af3:	8b 45 08             	mov    0x8(%ebp),%eax
  100af6:	0f b6 00             	movzbl (%eax),%eax
  100af9:	84 c0                	test   %al,%al
  100afb:	74 5e                	je     100b5b <parse+0xab>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100afd:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100b01:	75 14                	jne    100b17 <parse+0x67>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100b03:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100b0a:	00 
  100b0b:	c7 04 24 95 38 10 00 	movl   $0x103895,(%esp)
  100b12:	e8 10 f8 ff ff       	call   100327 <cprintf>
        }
        argv[argc ++] = buf;
  100b17:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b1a:	c1 e0 02             	shl    $0x2,%eax
  100b1d:	03 45 0c             	add    0xc(%ebp),%eax
  100b20:	8b 55 08             	mov    0x8(%ebp),%edx
  100b23:	89 10                	mov    %edx,(%eax)
  100b25:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b29:	eb 04                	jmp    100b2f <parse+0x7f>
            buf ++;
  100b2b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        // save and scan past next arg
        if (argc == MAXARGS - 1) {
            cprintf("Too many arguments (max %d).\n", MAXARGS);
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b2f:	8b 45 08             	mov    0x8(%ebp),%eax
  100b32:	0f b6 00             	movzbl (%eax),%eax
  100b35:	84 c0                	test   %al,%al
  100b37:	74 86                	je     100abf <parse+0xf>
  100b39:	8b 45 08             	mov    0x8(%ebp),%eax
  100b3c:	0f b6 00             	movzbl (%eax),%eax
  100b3f:	0f be c0             	movsbl %al,%eax
  100b42:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b46:	c7 04 24 90 38 10 00 	movl   $0x103890,(%esp)
  100b4d:	e8 52 27 00 00       	call   1032a4 <strchr>
  100b52:	85 c0                	test   %eax,%eax
  100b54:	74 d5                	je     100b2b <parse+0x7b>
            buf ++;
        }
    }
  100b56:	e9 64 ff ff ff       	jmp    100abf <parse+0xf>
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
            break;
  100b5b:	90                   	nop
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
            buf ++;
        }
    }
    return argc;
  100b5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100b5f:	c9                   	leave  
  100b60:	c3                   	ret    

00100b61 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100b61:	55                   	push   %ebp
  100b62:	89 e5                	mov    %esp,%ebp
  100b64:	83 ec 68             	sub    $0x68,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100b67:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b6a:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b6e:	8b 45 08             	mov    0x8(%ebp),%eax
  100b71:	89 04 24             	mov    %eax,(%esp)
  100b74:	e8 37 ff ff ff       	call   100ab0 <parse>
  100b79:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100b7c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100b80:	75 0a                	jne    100b8c <runcmd+0x2b>
        return 0;
  100b82:	b8 00 00 00 00       	mov    $0x0,%eax
  100b87:	e9 85 00 00 00       	jmp    100c11 <runcmd+0xb0>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b8c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100b93:	eb 5c                	jmp    100bf1 <runcmd+0x90>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100b95:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100b98:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b9b:	89 d0                	mov    %edx,%eax
  100b9d:	01 c0                	add    %eax,%eax
  100b9f:	01 d0                	add    %edx,%eax
  100ba1:	c1 e0 02             	shl    $0x2,%eax
  100ba4:	05 00 e0 10 00       	add    $0x10e000,%eax
  100ba9:	8b 00                	mov    (%eax),%eax
  100bab:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100baf:	89 04 24             	mov    %eax,(%esp)
  100bb2:	e8 48 26 00 00       	call   1031ff <strcmp>
  100bb7:	85 c0                	test   %eax,%eax
  100bb9:	75 32                	jne    100bed <runcmd+0x8c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100bbb:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100bbe:	89 d0                	mov    %edx,%eax
  100bc0:	01 c0                	add    %eax,%eax
  100bc2:	01 d0                	add    %edx,%eax
  100bc4:	c1 e0 02             	shl    $0x2,%eax
  100bc7:	05 00 e0 10 00       	add    $0x10e000,%eax
  100bcc:	8b 50 08             	mov    0x8(%eax),%edx
  100bcf:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100bd2:	8d 48 ff             	lea    -0x1(%eax),%ecx
  100bd5:	8b 45 0c             	mov    0xc(%ebp),%eax
  100bd8:	89 44 24 08          	mov    %eax,0x8(%esp)
  100bdc:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100bdf:	83 c0 04             	add    $0x4,%eax
  100be2:	89 44 24 04          	mov    %eax,0x4(%esp)
  100be6:	89 0c 24             	mov    %ecx,(%esp)
  100be9:	ff d2                	call   *%edx
  100beb:	eb 24                	jmp    100c11 <runcmd+0xb0>
    int argc = parse(buf, argv);
    if (argc == 0) {
        return 0;
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100bed:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100bf1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bf4:	83 f8 02             	cmp    $0x2,%eax
  100bf7:	76 9c                	jbe    100b95 <runcmd+0x34>
        if (strcmp(commands[i].name, argv[0]) == 0) {
            return commands[i].func(argc - 1, argv + 1, tf);
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100bf9:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100bfc:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c00:	c7 04 24 b3 38 10 00 	movl   $0x1038b3,(%esp)
  100c07:	e8 1b f7 ff ff       	call   100327 <cprintf>
    return 0;
  100c0c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c11:	c9                   	leave  
  100c12:	c3                   	ret    

00100c13 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100c13:	55                   	push   %ebp
  100c14:	89 e5                	mov    %esp,%ebp
  100c16:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100c19:	c7 04 24 cc 38 10 00 	movl   $0x1038cc,(%esp)
  100c20:	e8 02 f7 ff ff       	call   100327 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100c25:	c7 04 24 f4 38 10 00 	movl   $0x1038f4,(%esp)
  100c2c:	e8 f6 f6 ff ff       	call   100327 <cprintf>

    if (tf != NULL) {
  100c31:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100c35:	74 0e                	je     100c45 <kmonitor+0x32>
        print_trapframe(tf);
  100c37:	8b 45 08             	mov    0x8(%ebp),%eax
  100c3a:	89 04 24             	mov    %eax,(%esp)
  100c3d:	e8 a6 0e 00 00       	call   101ae8 <print_trapframe>
  100c42:	eb 01                	jmp    100c45 <kmonitor+0x32>
        if ((buf = readline("K> ")) != NULL) {
            if (runcmd(buf, tf) < 0) {
                break;
            }
        }
    }
  100c44:	90                   	nop
        print_trapframe(tf);
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100c45:	c7 04 24 19 39 10 00 	movl   $0x103919,(%esp)
  100c4c:	e8 c7 f5 ff ff       	call   100218 <readline>
  100c51:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100c54:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100c58:	74 ea                	je     100c44 <kmonitor+0x31>
            if (runcmd(buf, tf) < 0) {
  100c5a:	8b 45 08             	mov    0x8(%ebp),%eax
  100c5d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c61:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c64:	89 04 24             	mov    %eax,(%esp)
  100c67:	e8 f5 fe ff ff       	call   100b61 <runcmd>
  100c6c:	85 c0                	test   %eax,%eax
  100c6e:	79 d4                	jns    100c44 <kmonitor+0x31>
                break;
  100c70:	90                   	nop
            }
        }
    }
}
  100c71:	c9                   	leave  
  100c72:	c3                   	ret    

00100c73 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100c73:	55                   	push   %ebp
  100c74:	89 e5                	mov    %esp,%ebp
  100c76:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c79:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c80:	eb 3f                	jmp    100cc1 <mon_help+0x4e>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100c82:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c85:	89 d0                	mov    %edx,%eax
  100c87:	01 c0                	add    %eax,%eax
  100c89:	01 d0                	add    %edx,%eax
  100c8b:	c1 e0 02             	shl    $0x2,%eax
  100c8e:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c93:	8b 48 04             	mov    0x4(%eax),%ecx
  100c96:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c99:	89 d0                	mov    %edx,%eax
  100c9b:	01 c0                	add    %eax,%eax
  100c9d:	01 d0                	add    %edx,%eax
  100c9f:	c1 e0 02             	shl    $0x2,%eax
  100ca2:	05 00 e0 10 00       	add    $0x10e000,%eax
  100ca7:	8b 00                	mov    (%eax),%eax
  100ca9:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100cad:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cb1:	c7 04 24 1d 39 10 00 	movl   $0x10391d,(%esp)
  100cb8:	e8 6a f6 ff ff       	call   100327 <cprintf>

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100cbd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100cc1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cc4:	83 f8 02             	cmp    $0x2,%eax
  100cc7:	76 b9                	jbe    100c82 <mon_help+0xf>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
    }
    return 0;
  100cc9:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100cce:	c9                   	leave  
  100ccf:	c3                   	ret    

00100cd0 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100cd0:	55                   	push   %ebp
  100cd1:	89 e5                	mov    %esp,%ebp
  100cd3:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100cd6:	e8 5b fb ff ff       	call   100836 <print_kerninfo>
    return 0;
  100cdb:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100ce0:	c9                   	leave  
  100ce1:	c3                   	ret    

00100ce2 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100ce2:	55                   	push   %ebp
  100ce3:	89 e5                	mov    %esp,%ebp
  100ce5:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100ce8:	e8 96 fc ff ff       	call   100983 <print_stackframe>
    return 0;
  100ced:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100cf2:	c9                   	leave  
  100cf3:	c3                   	ret    

00100cf4 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  100cf4:	55                   	push   %ebp
  100cf5:	89 e5                	mov    %esp,%ebp
  100cf7:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  100cfa:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  100cff:	85 c0                	test   %eax,%eax
  100d01:	75 4c                	jne    100d4f <__panic+0x5b>
        goto panic_dead;
    }
    is_panic = 1;
  100d03:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  100d0a:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  100d0d:	8d 55 14             	lea    0x14(%ebp),%edx
  100d10:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100d13:	89 10                	mov    %edx,(%eax)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100d15:	8b 45 0c             	mov    0xc(%ebp),%eax
  100d18:	89 44 24 08          	mov    %eax,0x8(%esp)
  100d1c:	8b 45 08             	mov    0x8(%ebp),%eax
  100d1f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d23:	c7 04 24 26 39 10 00 	movl   $0x103926,(%esp)
  100d2a:	e8 f8 f5 ff ff       	call   100327 <cprintf>
    vcprintf(fmt, ap);
  100d2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d32:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d36:	8b 45 10             	mov    0x10(%ebp),%eax
  100d39:	89 04 24             	mov    %eax,(%esp)
  100d3c:	e8 b3 f5 ff ff       	call   1002f4 <vcprintf>
    cprintf("\n");
  100d41:	c7 04 24 42 39 10 00 	movl   $0x103942,(%esp)
  100d48:	e8 da f5 ff ff       	call   100327 <cprintf>
  100d4d:	eb 01                	jmp    100d50 <__panic+0x5c>
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
    if (is_panic) {
        goto panic_dead;
  100d4f:	90                   	nop
    vcprintf(fmt, ap);
    cprintf("\n");
    va_end(ap);

panic_dead:
    intr_disable();
  100d50:	e8 c9 09 00 00       	call   10171e <intr_disable>
    while (1) {
        kmonitor(NULL);
  100d55:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100d5c:	e8 b2 fe ff ff       	call   100c13 <kmonitor>
    }
  100d61:	eb f2                	jmp    100d55 <__panic+0x61>

00100d63 <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100d63:	55                   	push   %ebp
  100d64:	89 e5                	mov    %esp,%ebp
  100d66:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100d69:	8d 55 14             	lea    0x14(%ebp),%edx
  100d6c:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100d6f:	89 10                	mov    %edx,(%eax)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100d71:	8b 45 0c             	mov    0xc(%ebp),%eax
  100d74:	89 44 24 08          	mov    %eax,0x8(%esp)
  100d78:	8b 45 08             	mov    0x8(%ebp),%eax
  100d7b:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d7f:	c7 04 24 44 39 10 00 	movl   $0x103944,(%esp)
  100d86:	e8 9c f5 ff ff       	call   100327 <cprintf>
    vcprintf(fmt, ap);
  100d8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d8e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d92:	8b 45 10             	mov    0x10(%ebp),%eax
  100d95:	89 04 24             	mov    %eax,(%esp)
  100d98:	e8 57 f5 ff ff       	call   1002f4 <vcprintf>
    cprintf("\n");
  100d9d:	c7 04 24 42 39 10 00 	movl   $0x103942,(%esp)
  100da4:	e8 7e f5 ff ff       	call   100327 <cprintf>
    va_end(ap);
}
  100da9:	c9                   	leave  
  100daa:	c3                   	ret    

00100dab <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100dab:	55                   	push   %ebp
  100dac:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100dae:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  100db3:	5d                   	pop    %ebp
  100db4:	c3                   	ret    
  100db5:	00 00                	add    %al,(%eax)
	...

00100db8 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100db8:	55                   	push   %ebp
  100db9:	89 e5                	mov    %esp,%ebp
  100dbb:	83 ec 28             	sub    $0x28,%esp
  100dbe:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100dc4:	c6 45 f5 34          	movb   $0x34,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100dc8:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100dcc:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100dd0:	ee                   	out    %al,(%dx)
  100dd1:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100dd7:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
  100ddb:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100ddf:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100de3:	ee                   	out    %al,(%dx)
  100de4:	66 c7 45 ee 40 00    	movw   $0x40,-0x12(%ebp)
  100dea:	c6 45 ed 2e          	movb   $0x2e,-0x13(%ebp)
  100dee:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100df2:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100df6:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100df7:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  100dfe:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100e01:	c7 04 24 62 39 10 00 	movl   $0x103962,(%esp)
  100e08:	e8 1a f5 ff ff       	call   100327 <cprintf>
    pic_enable(IRQ_TIMER);
  100e0d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100e14:	e8 63 09 00 00       	call   10177c <pic_enable>
}
  100e19:	c9                   	leave  
  100e1a:	c3                   	ret    
	...

00100e1c <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100e1c:	55                   	push   %ebp
  100e1d:	89 e5                	mov    %esp,%ebp
  100e1f:	53                   	push   %ebx
  100e20:	83 ec 14             	sub    $0x14,%esp
  100e23:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e29:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e2d:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  100e31:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100e35:	ec                   	in     (%dx),%al
  100e36:	89 c3                	mov    %eax,%ebx
  100e38:	88 5d f9             	mov    %bl,-0x7(%ebp)
    return data;
  100e3b:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e41:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100e45:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  100e49:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100e4d:	ec                   	in     (%dx),%al
  100e4e:	89 c3                	mov    %eax,%ebx
  100e50:	88 5d f5             	mov    %bl,-0xb(%ebp)
    return data;
  100e53:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e59:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100e5d:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  100e61:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100e65:	ec                   	in     (%dx),%al
  100e66:	89 c3                	mov    %eax,%ebx
  100e68:	88 5d f1             	mov    %bl,-0xf(%ebp)
    return data;
  100e6b:	66 c7 45 ee 84 00    	movw   $0x84,-0x12(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e71:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100e75:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  100e79:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100e7d:	ec                   	in     (%dx),%al
  100e7e:	89 c3                	mov    %eax,%ebx
  100e80:	88 5d ed             	mov    %bl,-0x13(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e83:	83 c4 14             	add    $0x14,%esp
  100e86:	5b                   	pop    %ebx
  100e87:	5d                   	pop    %ebp
  100e88:	c3                   	ret    

00100e89 <cga_init>:
static uint16_t addr_6845;

/* TEXT-mode CGA/VGA display output */

static void
cga_init(void) {
  100e89:	55                   	push   %ebp
  100e8a:	89 e5                	mov    %esp,%ebp
  100e8c:	53                   	push   %ebx
  100e8d:	83 ec 24             	sub    $0x24,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;
  100e90:	c7 45 f8 00 80 0b 00 	movl   $0xb8000,-0x8(%ebp)
    uint16_t was = *cp;
  100e97:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100e9a:	0f b7 00             	movzwl (%eax),%eax
  100e9d:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
    *cp = (uint16_t) 0xA55A;
  100ea1:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100ea4:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {
  100ea9:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100eac:	0f b7 00             	movzwl (%eax),%eax
  100eaf:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100eb3:	74 12                	je     100ec7 <cga_init+0x3e>
        cp = (uint16_t*)MONO_BUF;
  100eb5:	c7 45 f8 00 00 0b 00 	movl   $0xb0000,-0x8(%ebp)
        addr_6845 = MONO_BASE;
  100ebc:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100ec3:	b4 03 
  100ec5:	eb 13                	jmp    100eda <cga_init+0x51>
    } else {
        *cp = was;
  100ec7:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100eca:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100ece:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;
  100ed1:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100ed8:	d4 03 
    }

    // Extract cursor location
    uint32_t pos;
    outb(addr_6845, 14);
  100eda:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100ee1:	0f b7 c0             	movzwl %ax,%eax
  100ee4:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100ee8:	c6 45 ed 0e          	movb   $0xe,-0x13(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100eec:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100ef0:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100ef4:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;
  100ef5:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100efc:	83 c0 01             	add    $0x1,%eax
  100eff:	0f b7 c0             	movzwl %ax,%eax
  100f02:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f06:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f0a:	66 89 55 da          	mov    %dx,-0x26(%ebp)
  100f0e:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100f12:	ec                   	in     (%dx),%al
  100f13:	89 c3                	mov    %eax,%ebx
  100f15:	88 5d e9             	mov    %bl,-0x17(%ebp)
    return data;
  100f18:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f1c:	0f b6 c0             	movzbl %al,%eax
  100f1f:	c1 e0 08             	shl    $0x8,%eax
  100f22:	89 45 f0             	mov    %eax,-0x10(%ebp)
    outb(addr_6845, 15);
  100f25:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100f2c:	0f b7 c0             	movzwl %ax,%eax
  100f2f:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100f33:	c6 45 e5 0f          	movb   $0xf,-0x1b(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f37:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100f3b:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100f3f:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);
  100f40:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100f47:	83 c0 01             	add    $0x1,%eax
  100f4a:	0f b7 c0             	movzwl %ax,%eax
  100f4d:	66 89 45 e2          	mov    %ax,-0x1e(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f51:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f55:	66 89 55 da          	mov    %dx,-0x26(%ebp)
  100f59:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100f5d:	ec                   	in     (%dx),%al
  100f5e:	89 c3                	mov    %eax,%ebx
  100f60:	88 5d e1             	mov    %bl,-0x1f(%ebp)
    return data;
  100f63:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f67:	0f b6 c0             	movzbl %al,%eax
  100f6a:	09 45 f0             	or     %eax,-0x10(%ebp)

    crt_buf = (uint16_t*) cp;
  100f6d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100f70:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;
  100f75:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100f78:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100f7e:	83 c4 24             	add    $0x24,%esp
  100f81:	5b                   	pop    %ebx
  100f82:	5d                   	pop    %ebp
  100f83:	c3                   	ret    

00100f84 <serial_init>:

static bool serial_exists = 0;

//串口的初始化函数
static void
serial_init(void) {
  100f84:	55                   	push   %ebp
  100f85:	89 e5                	mov    %esp,%ebp
  100f87:	53                   	push   %ebx
  100f88:	83 ec 54             	sub    $0x54,%esp
  100f8b:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100f91:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f95:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100f99:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100f9d:	ee                   	out    %al,(%dx)
  100f9e:	66 c7 45 f2 fb 03    	movw   $0x3fb,-0xe(%ebp)
  100fa4:	c6 45 f1 80          	movb   $0x80,-0xf(%ebp)
  100fa8:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100fac:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100fb0:	ee                   	out    %al,(%dx)
  100fb1:	66 c7 45 ee f8 03    	movw   $0x3f8,-0x12(%ebp)
  100fb7:	c6 45 ed 0c          	movb   $0xc,-0x13(%ebp)
  100fbb:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100fbf:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100fc3:	ee                   	out    %al,(%dx)
  100fc4:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100fca:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
  100fce:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100fd2:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100fd6:	ee                   	out    %al,(%dx)
  100fd7:	66 c7 45 e6 fb 03    	movw   $0x3fb,-0x1a(%ebp)
  100fdd:	c6 45 e5 03          	movb   $0x3,-0x1b(%ebp)
  100fe1:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100fe5:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100fe9:	ee                   	out    %al,(%dx)
  100fea:	66 c7 45 e2 fc 03    	movw   $0x3fc,-0x1e(%ebp)
  100ff0:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
  100ff4:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100ff8:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100ffc:	ee                   	out    %al,(%dx)
  100ffd:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  101003:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
  101007:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  10100b:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  10100f:	ee                   	out    %al,(%dx)
  101010:	66 c7 45 da fd 03    	movw   $0x3fd,-0x26(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101016:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  10101a:	66 89 55 c6          	mov    %dx,-0x3a(%ebp)
  10101e:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
  101022:	ec                   	in     (%dx),%al
  101023:	89 c3                	mov    %eax,%ebx
  101025:	88 5d d9             	mov    %bl,-0x27(%ebp)
    return data;
  101028:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  10102c:	3c ff                	cmp    $0xff,%al
  10102e:	0f 95 c0             	setne  %al
  101031:	0f b6 c0             	movzbl %al,%eax
  101034:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  101039:	66 c7 45 d6 fa 03    	movw   $0x3fa,-0x2a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10103f:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  101043:	66 89 55 c6          	mov    %dx,-0x3a(%ebp)
  101047:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
  10104b:	ec                   	in     (%dx),%al
  10104c:	89 c3                	mov    %eax,%ebx
  10104e:	88 5d d5             	mov    %bl,-0x2b(%ebp)
    return data;
  101051:	66 c7 45 d2 f8 03    	movw   $0x3f8,-0x2e(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101057:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  10105b:	66 89 55 c6          	mov    %dx,-0x3a(%ebp)
  10105f:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
  101063:	ec                   	in     (%dx),%al
  101064:	89 c3                	mov    %eax,%ebx
  101066:	88 5d d1             	mov    %bl,-0x2f(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  101069:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  10106e:	85 c0                	test   %eax,%eax
  101070:	74 0c                	je     10107e <serial_init+0xfa>
        pic_enable(IRQ_COM1);
  101072:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  101079:	e8 fe 06 00 00       	call   10177c <pic_enable>
    }
}
  10107e:	83 c4 54             	add    $0x54,%esp
  101081:	5b                   	pop    %ebx
  101082:	5d                   	pop    %ebp
  101083:	c3                   	ret    

00101084 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  101084:	55                   	push   %ebp
  101085:	89 e5                	mov    %esp,%ebp
  101087:	53                   	push   %ebx
  101088:	83 ec 24             	sub    $0x24,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  10108b:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  101092:	eb 09                	jmp    10109d <lpt_putc_sub+0x19>
        delay();
  101094:	e8 83 fd ff ff       	call   100e1c <delay>
}

static void
lpt_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101099:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  10109d:	66 c7 45 f6 79 03    	movw   $0x379,-0xa(%ebp)
  1010a3:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1010a7:	66 89 55 da          	mov    %dx,-0x26(%ebp)
  1010ab:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  1010af:	ec                   	in     (%dx),%al
  1010b0:	89 c3                	mov    %eax,%ebx
  1010b2:	88 5d f5             	mov    %bl,-0xb(%ebp)
    return data;
  1010b5:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1010b9:	84 c0                	test   %al,%al
  1010bb:	78 09                	js     1010c6 <lpt_putc_sub+0x42>
  1010bd:	81 7d f8 ff 31 00 00 	cmpl   $0x31ff,-0x8(%ebp)
  1010c4:	7e ce                	jle    101094 <lpt_putc_sub+0x10>
        delay();
    }
    outb(LPTPORT + 0, c);
  1010c6:	8b 45 08             	mov    0x8(%ebp),%eax
  1010c9:	0f b6 c0             	movzbl %al,%eax
  1010cc:	66 c7 45 f2 78 03    	movw   $0x378,-0xe(%ebp)
  1010d2:	88 45 f1             	mov    %al,-0xf(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1010d5:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1010d9:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1010dd:	ee                   	out    %al,(%dx)
  1010de:	66 c7 45 ee 7a 03    	movw   $0x37a,-0x12(%ebp)
  1010e4:	c6 45 ed 0d          	movb   $0xd,-0x13(%ebp)
  1010e8:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1010ec:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1010f0:	ee                   	out    %al,(%dx)
  1010f1:	66 c7 45 ea 7a 03    	movw   $0x37a,-0x16(%ebp)
  1010f7:	c6 45 e9 08          	movb   $0x8,-0x17(%ebp)
  1010fb:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1010ff:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101103:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  101104:	83 c4 24             	add    $0x24,%esp
  101107:	5b                   	pop    %ebx
  101108:	5d                   	pop    %ebp
  101109:	c3                   	ret    

0010110a <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  10110a:	55                   	push   %ebp
  10110b:	89 e5                	mov    %esp,%ebp
  10110d:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  101110:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101114:	74 0d                	je     101123 <lpt_putc+0x19>
        lpt_putc_sub(c);
  101116:	8b 45 08             	mov    0x8(%ebp),%eax
  101119:	89 04 24             	mov    %eax,(%esp)
  10111c:	e8 63 ff ff ff       	call   101084 <lpt_putc_sub>
  101121:	eb 24                	jmp    101147 <lpt_putc+0x3d>
    }
    else {
        lpt_putc_sub('\b');
  101123:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10112a:	e8 55 ff ff ff       	call   101084 <lpt_putc_sub>
        lpt_putc_sub(' ');
  10112f:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101136:	e8 49 ff ff ff       	call   101084 <lpt_putc_sub>
        lpt_putc_sub('\b');
  10113b:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101142:	e8 3d ff ff ff       	call   101084 <lpt_putc_sub>
    }
}
  101147:	c9                   	leave  
  101148:	c3                   	ret    

00101149 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  101149:	55                   	push   %ebp
  10114a:	89 e5                	mov    %esp,%ebp
  10114c:	53                   	push   %ebx
  10114d:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  101150:	8b 45 08             	mov    0x8(%ebp),%eax
  101153:	b0 00                	mov    $0x0,%al
  101155:	85 c0                	test   %eax,%eax
  101157:	75 07                	jne    101160 <cga_putc+0x17>
        c |= 0x0700;
  101159:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  101160:	8b 45 08             	mov    0x8(%ebp),%eax
  101163:	25 ff 00 00 00       	and    $0xff,%eax
  101168:	83 f8 0a             	cmp    $0xa,%eax
  10116b:	74 4e                	je     1011bb <cga_putc+0x72>
  10116d:	83 f8 0d             	cmp    $0xd,%eax
  101170:	74 59                	je     1011cb <cga_putc+0x82>
  101172:	83 f8 08             	cmp    $0x8,%eax
  101175:	0f 85 8c 00 00 00    	jne    101207 <cga_putc+0xbe>
    case '\b':
        if (crt_pos > 0) {
  10117b:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101182:	66 85 c0             	test   %ax,%ax
  101185:	0f 84 a1 00 00 00    	je     10122c <cga_putc+0xe3>
            crt_pos --;
  10118b:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101192:	83 e8 01             	sub    $0x1,%eax
  101195:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  10119b:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011a0:	0f b7 15 64 ee 10 00 	movzwl 0x10ee64,%edx
  1011a7:	0f b7 d2             	movzwl %dx,%edx
  1011aa:	01 d2                	add    %edx,%edx
  1011ac:	01 c2                	add    %eax,%edx
  1011ae:	8b 45 08             	mov    0x8(%ebp),%eax
  1011b1:	b0 00                	mov    $0x0,%al
  1011b3:	83 c8 20             	or     $0x20,%eax
  1011b6:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  1011b9:	eb 71                	jmp    10122c <cga_putc+0xe3>
    case '\n':
        crt_pos += CRT_COLS;
  1011bb:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011c2:	83 c0 50             	add    $0x50,%eax
  1011c5:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  1011cb:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  1011d2:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  1011d9:	0f b7 c1             	movzwl %cx,%eax
  1011dc:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  1011e2:	c1 e8 10             	shr    $0x10,%eax
  1011e5:	89 c2                	mov    %eax,%edx
  1011e7:	66 c1 ea 06          	shr    $0x6,%dx
  1011eb:	89 d0                	mov    %edx,%eax
  1011ed:	c1 e0 02             	shl    $0x2,%eax
  1011f0:	01 d0                	add    %edx,%eax
  1011f2:	c1 e0 04             	shl    $0x4,%eax
  1011f5:	89 ca                	mov    %ecx,%edx
  1011f7:	66 29 c2             	sub    %ax,%dx
  1011fa:	89 d8                	mov    %ebx,%eax
  1011fc:	66 29 d0             	sub    %dx,%ax
  1011ff:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  101205:	eb 26                	jmp    10122d <cga_putc+0xe4>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  101207:	8b 15 60 ee 10 00    	mov    0x10ee60,%edx
  10120d:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101214:	0f b7 c8             	movzwl %ax,%ecx
  101217:	01 c9                	add    %ecx,%ecx
  101219:	01 d1                	add    %edx,%ecx
  10121b:	8b 55 08             	mov    0x8(%ebp),%edx
  10121e:	66 89 11             	mov    %dx,(%ecx)
  101221:	83 c0 01             	add    $0x1,%eax
  101224:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  10122a:	eb 01                	jmp    10122d <cga_putc+0xe4>
    case '\b':
        if (crt_pos > 0) {
            crt_pos --;
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
        }
        break;
  10122c:	90                   	nop
        crt_buf[crt_pos ++] = c;     // write the character
        break;
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  10122d:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101234:	66 3d cf 07          	cmp    $0x7cf,%ax
  101238:	76 5b                	jbe    101295 <cga_putc+0x14c>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  10123a:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10123f:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  101245:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10124a:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  101251:	00 
  101252:	89 54 24 04          	mov    %edx,0x4(%esp)
  101256:	89 04 24             	mov    %eax,(%esp)
  101259:	e8 4c 22 00 00       	call   1034aa <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10125e:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  101265:	eb 15                	jmp    10127c <cga_putc+0x133>
            crt_buf[i] = 0x0700 | ' ';
  101267:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10126c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10126f:	01 d2                	add    %edx,%edx
  101271:	01 d0                	add    %edx,%eax
  101273:	66 c7 00 20 07       	movw   $0x720,(%eax)

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101278:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10127c:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  101283:	7e e2                	jle    101267 <cga_putc+0x11e>
            crt_buf[i] = 0x0700 | ' ';
        }
        crt_pos -= CRT_COLS;
  101285:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10128c:	83 e8 50             	sub    $0x50,%eax
  10128f:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  101295:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  10129c:	0f b7 c0             	movzwl %ax,%eax
  10129f:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  1012a3:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
  1012a7:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1012ab:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1012af:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  1012b0:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1012b7:	66 c1 e8 08          	shr    $0x8,%ax
  1012bb:	0f b6 c0             	movzbl %al,%eax
  1012be:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  1012c5:	83 c2 01             	add    $0x1,%edx
  1012c8:	0f b7 d2             	movzwl %dx,%edx
  1012cb:	66 89 55 ee          	mov    %dx,-0x12(%ebp)
  1012cf:	88 45 ed             	mov    %al,-0x13(%ebp)
  1012d2:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1012d6:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1012da:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  1012db:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  1012e2:	0f b7 c0             	movzwl %ax,%eax
  1012e5:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  1012e9:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
  1012ed:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1012f1:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1012f5:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  1012f6:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1012fd:	0f b6 c0             	movzbl %al,%eax
  101300:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101307:	83 c2 01             	add    $0x1,%edx
  10130a:	0f b7 d2             	movzwl %dx,%edx
  10130d:	66 89 55 e6          	mov    %dx,-0x1a(%ebp)
  101311:	88 45 e5             	mov    %al,-0x1b(%ebp)
  101314:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101318:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10131c:	ee                   	out    %al,(%dx)
}
  10131d:	83 c4 34             	add    $0x34,%esp
  101320:	5b                   	pop    %ebx
  101321:	5d                   	pop    %ebp
  101322:	c3                   	ret    

00101323 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  101323:	55                   	push   %ebp
  101324:	89 e5                	mov    %esp,%ebp
  101326:	53                   	push   %ebx
  101327:	83 ec 14             	sub    $0x14,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  10132a:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  101331:	eb 09                	jmp    10133c <serial_putc_sub+0x19>
        delay();
  101333:	e8 e4 fa ff ff       	call   100e1c <delay>
}

static void
serial_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101338:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  10133c:	66 c7 45 f6 fd 03    	movw   $0x3fd,-0xa(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101342:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101346:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  10134a:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10134e:	ec                   	in     (%dx),%al
  10134f:	89 c3                	mov    %eax,%ebx
  101351:	88 5d f5             	mov    %bl,-0xb(%ebp)
    return data;
  101354:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101358:	0f b6 c0             	movzbl %al,%eax
  10135b:	83 e0 20             	and    $0x20,%eax
  10135e:	85 c0                	test   %eax,%eax
  101360:	75 09                	jne    10136b <serial_putc_sub+0x48>
  101362:	81 7d f8 ff 31 00 00 	cmpl   $0x31ff,-0x8(%ebp)
  101369:	7e c8                	jle    101333 <serial_putc_sub+0x10>
        delay();
    }
    outb(COM1 + COM_TX, c);
  10136b:	8b 45 08             	mov    0x8(%ebp),%eax
  10136e:	0f b6 c0             	movzbl %al,%eax
  101371:	66 c7 45 f2 f8 03    	movw   $0x3f8,-0xe(%ebp)
  101377:	88 45 f1             	mov    %al,-0xf(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10137a:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10137e:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101382:	ee                   	out    %al,(%dx)
}
  101383:	83 c4 14             	add    $0x14,%esp
  101386:	5b                   	pop    %ebx
  101387:	5d                   	pop    %ebp
  101388:	c3                   	ret    

00101389 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  101389:	55                   	push   %ebp
  10138a:	89 e5                	mov    %esp,%ebp
  10138c:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  10138f:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101393:	74 0d                	je     1013a2 <serial_putc+0x19>
        serial_putc_sub(c);
  101395:	8b 45 08             	mov    0x8(%ebp),%eax
  101398:	89 04 24             	mov    %eax,(%esp)
  10139b:	e8 83 ff ff ff       	call   101323 <serial_putc_sub>
  1013a0:	eb 24                	jmp    1013c6 <serial_putc+0x3d>
    }
    else {
        serial_putc_sub('\b');
  1013a2:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1013a9:	e8 75 ff ff ff       	call   101323 <serial_putc_sub>
        serial_putc_sub(' ');
  1013ae:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1013b5:	e8 69 ff ff ff       	call   101323 <serial_putc_sub>
        serial_putc_sub('\b');
  1013ba:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1013c1:	e8 5d ff ff ff       	call   101323 <serial_putc_sub>
    }
}
  1013c6:	c9                   	leave  
  1013c7:	c3                   	ret    

001013c8 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1013c8:	55                   	push   %ebp
  1013c9:	89 e5                	mov    %esp,%ebp
  1013cb:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  1013ce:	eb 32                	jmp    101402 <cons_intr+0x3a>
        if (c != 0) {
  1013d0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1013d4:	74 2c                	je     101402 <cons_intr+0x3a>
            cons.buf[cons.wpos ++] = c;
  1013d6:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1013db:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1013de:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
  1013e4:	83 c0 01             	add    $0x1,%eax
  1013e7:	a3 84 f0 10 00       	mov    %eax,0x10f084
            if (cons.wpos == CONSBUFSIZE) {
  1013ec:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1013f1:	3d 00 02 00 00       	cmp    $0x200,%eax
  1013f6:	75 0a                	jne    101402 <cons_intr+0x3a>
                cons.wpos = 0;
  1013f8:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  1013ff:	00 00 00 
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
    int c;
    while ((c = (*proc)()) != -1) {
  101402:	8b 45 08             	mov    0x8(%ebp),%eax
  101405:	ff d0                	call   *%eax
  101407:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10140a:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  10140e:	75 c0                	jne    1013d0 <cons_intr+0x8>
            if (cons.wpos == CONSBUFSIZE) {
                cons.wpos = 0;
            }
        }
    }
}
  101410:	c9                   	leave  
  101411:	c3                   	ret    

00101412 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  101412:	55                   	push   %ebp
  101413:	89 e5                	mov    %esp,%ebp
  101415:	53                   	push   %ebx
  101416:	83 ec 14             	sub    $0x14,%esp
  101419:	66 c7 45 f6 fd 03    	movw   $0x3fd,-0xa(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10141f:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101423:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  101427:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10142b:	ec                   	in     (%dx),%al
  10142c:	89 c3                	mov    %eax,%ebx
  10142e:	88 5d f5             	mov    %bl,-0xb(%ebp)
    return data;
  101431:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101435:	0f b6 c0             	movzbl %al,%eax
  101438:	83 e0 01             	and    $0x1,%eax
  10143b:	85 c0                	test   %eax,%eax
  10143d:	75 07                	jne    101446 <serial_proc_data+0x34>
        return -1;
  10143f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101444:	eb 32                	jmp    101478 <serial_proc_data+0x66>
  101446:	66 c7 45 f2 f8 03    	movw   $0x3f8,-0xe(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10144c:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101450:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  101454:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101458:	ec                   	in     (%dx),%al
  101459:	89 c3                	mov    %eax,%ebx
  10145b:	88 5d f1             	mov    %bl,-0xf(%ebp)
    return data;
  10145e:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  101462:	0f b6 c0             	movzbl %al,%eax
  101465:	89 45 f8             	mov    %eax,-0x8(%ebp)
    if (c == 127) {
  101468:	83 7d f8 7f          	cmpl   $0x7f,-0x8(%ebp)
  10146c:	75 07                	jne    101475 <serial_proc_data+0x63>
        c = '\b';
  10146e:	c7 45 f8 08 00 00 00 	movl   $0x8,-0x8(%ebp)
    }
    return c;
  101475:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  101478:	83 c4 14             	add    $0x14,%esp
  10147b:	5b                   	pop    %ebx
  10147c:	5d                   	pop    %ebp
  10147d:	c3                   	ret    

0010147e <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  10147e:	55                   	push   %ebp
  10147f:	89 e5                	mov    %esp,%ebp
  101481:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  101484:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101489:	85 c0                	test   %eax,%eax
  10148b:	74 0c                	je     101499 <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  10148d:	c7 04 24 12 14 10 00 	movl   $0x101412,(%esp)
  101494:	e8 2f ff ff ff       	call   1013c8 <cons_intr>
    }
}
  101499:	c9                   	leave  
  10149a:	c3                   	ret    

0010149b <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  10149b:	55                   	push   %ebp
  10149c:	89 e5                	mov    %esp,%ebp
  10149e:	53                   	push   %ebx
  10149f:	83 ec 44             	sub    $0x44,%esp
  1014a2:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1014a8:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  1014ac:	66 89 55 d6          	mov    %dx,-0x2a(%ebp)
  1014b0:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  1014b4:	ec                   	in     (%dx),%al
  1014b5:	89 c3                	mov    %eax,%ebx
  1014b7:	88 5d ef             	mov    %bl,-0x11(%ebp)
    return data;
  1014ba:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1014be:	0f b6 c0             	movzbl %al,%eax
  1014c1:	83 e0 01             	and    $0x1,%eax
  1014c4:	85 c0                	test   %eax,%eax
  1014c6:	75 0a                	jne    1014d2 <kbd_proc_data+0x37>
        return -1;
  1014c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1014cd:	e9 61 01 00 00       	jmp    101633 <kbd_proc_data+0x198>
  1014d2:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1014d8:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
  1014dc:	66 89 55 d6          	mov    %dx,-0x2a(%ebp)
  1014e0:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  1014e4:	ec                   	in     (%dx),%al
  1014e5:	89 c3                	mov    %eax,%ebx
  1014e7:	88 5d eb             	mov    %bl,-0x15(%ebp)
    return data;
  1014ea:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  1014ee:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  1014f1:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  1014f5:	75 17                	jne    10150e <kbd_proc_data+0x73>
        // E0 escape character
        shift |= E0ESC;
  1014f7:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014fc:	83 c8 40             	or     $0x40,%eax
  1014ff:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101504:	b8 00 00 00 00       	mov    $0x0,%eax
  101509:	e9 25 01 00 00       	jmp    101633 <kbd_proc_data+0x198>
    } else if (data & 0x80) {
  10150e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101512:	84 c0                	test   %al,%al
  101514:	79 47                	jns    10155d <kbd_proc_data+0xc2>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  101516:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10151b:	83 e0 40             	and    $0x40,%eax
  10151e:	85 c0                	test   %eax,%eax
  101520:	75 09                	jne    10152b <kbd_proc_data+0x90>
  101522:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101526:	83 e0 7f             	and    $0x7f,%eax
  101529:	eb 04                	jmp    10152f <kbd_proc_data+0x94>
  10152b:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10152f:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  101532:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101536:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  10153d:	83 c8 40             	or     $0x40,%eax
  101540:	0f b6 c0             	movzbl %al,%eax
  101543:	f7 d0                	not    %eax
  101545:	89 c2                	mov    %eax,%edx
  101547:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10154c:	21 d0                	and    %edx,%eax
  10154e:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101553:	b8 00 00 00 00       	mov    $0x0,%eax
  101558:	e9 d6 00 00 00       	jmp    101633 <kbd_proc_data+0x198>
    } else if (shift & E0ESC) {
  10155d:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101562:	83 e0 40             	and    $0x40,%eax
  101565:	85 c0                	test   %eax,%eax
  101567:	74 11                	je     10157a <kbd_proc_data+0xdf>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101569:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  10156d:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101572:	83 e0 bf             	and    $0xffffffbf,%eax
  101575:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  10157a:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10157e:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101585:	0f b6 d0             	movzbl %al,%edx
  101588:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10158d:	09 d0                	or     %edx,%eax
  10158f:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  101594:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101598:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  10159f:	0f b6 d0             	movzbl %al,%edx
  1015a2:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1015a7:	31 d0                	xor    %edx,%eax
  1015a9:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  1015ae:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1015b3:	83 e0 03             	and    $0x3,%eax
  1015b6:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  1015bd:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1015c1:	01 d0                	add    %edx,%eax
  1015c3:	0f b6 00             	movzbl (%eax),%eax
  1015c6:	0f b6 c0             	movzbl %al,%eax
  1015c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1015cc:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1015d1:	83 e0 08             	and    $0x8,%eax
  1015d4:	85 c0                	test   %eax,%eax
  1015d6:	74 22                	je     1015fa <kbd_proc_data+0x15f>
        if ('a' <= c && c <= 'z')
  1015d8:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1015dc:	7e 0c                	jle    1015ea <kbd_proc_data+0x14f>
  1015de:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1015e2:	7f 06                	jg     1015ea <kbd_proc_data+0x14f>
            c += 'A' - 'a';
  1015e4:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1015e8:	eb 10                	jmp    1015fa <kbd_proc_data+0x15f>
        else if ('A' <= c && c <= 'Z')
  1015ea:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1015ee:	7e 0a                	jle    1015fa <kbd_proc_data+0x15f>
  1015f0:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  1015f4:	7f 04                	jg     1015fa <kbd_proc_data+0x15f>
            c += 'a' - 'A';
  1015f6:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  1015fa:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1015ff:	f7 d0                	not    %eax
  101601:	83 e0 06             	and    $0x6,%eax
  101604:	85 c0                	test   %eax,%eax
  101606:	75 28                	jne    101630 <kbd_proc_data+0x195>
  101608:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  10160f:	75 1f                	jne    101630 <kbd_proc_data+0x195>
        cprintf("Rebooting!\n");
  101611:	c7 04 24 7d 39 10 00 	movl   $0x10397d,(%esp)
  101618:	e8 0a ed ff ff       	call   100327 <cprintf>
  10161d:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  101623:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101627:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  10162b:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  10162f:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  101630:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  101633:	83 c4 44             	add    $0x44,%esp
  101636:	5b                   	pop    %ebx
  101637:	5d                   	pop    %ebp
  101638:	c3                   	ret    

00101639 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101639:	55                   	push   %ebp
  10163a:	89 e5                	mov    %esp,%ebp
  10163c:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  10163f:	c7 04 24 9b 14 10 00 	movl   $0x10149b,(%esp)
  101646:	e8 7d fd ff ff       	call   1013c8 <cons_intr>
}
  10164b:	c9                   	leave  
  10164c:	c3                   	ret    

0010164d <kbd_init>:

static void
kbd_init(void) {
  10164d:	55                   	push   %ebp
  10164e:	89 e5                	mov    %esp,%ebp
  101650:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  101653:	e8 e1 ff ff ff       	call   101639 <kbd_intr>
    pic_enable(IRQ_KBD);
  101658:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  10165f:	e8 18 01 00 00       	call   10177c <pic_enable>
}
  101664:	c9                   	leave  
  101665:	c3                   	ret    

00101666 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101666:	55                   	push   %ebp
  101667:	89 e5                	mov    %esp,%ebp
  101669:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  10166c:	e8 18 f8 ff ff       	call   100e89 <cga_init>
    serial_init();
  101671:	e8 0e f9 ff ff       	call   100f84 <serial_init>
    kbd_init();
  101676:	e8 d2 ff ff ff       	call   10164d <kbd_init>
    if (!serial_exists) {
  10167b:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101680:	85 c0                	test   %eax,%eax
  101682:	75 0c                	jne    101690 <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  101684:	c7 04 24 89 39 10 00 	movl   $0x103989,(%esp)
  10168b:	e8 97 ec ff ff       	call   100327 <cprintf>
    }
}
  101690:	c9                   	leave  
  101691:	c3                   	ret    

00101692 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  101692:	55                   	push   %ebp
  101693:	89 e5                	mov    %esp,%ebp
  101695:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  101698:	8b 45 08             	mov    0x8(%ebp),%eax
  10169b:	89 04 24             	mov    %eax,(%esp)
  10169e:	e8 67 fa ff ff       	call   10110a <lpt_putc>
    cga_putc(c);
  1016a3:	8b 45 08             	mov    0x8(%ebp),%eax
  1016a6:	89 04 24             	mov    %eax,(%esp)
  1016a9:	e8 9b fa ff ff       	call   101149 <cga_putc>
    serial_putc(c);
  1016ae:	8b 45 08             	mov    0x8(%ebp),%eax
  1016b1:	89 04 24             	mov    %eax,(%esp)
  1016b4:	e8 d0 fc ff ff       	call   101389 <serial_putc>
}
  1016b9:	c9                   	leave  
  1016ba:	c3                   	ret    

001016bb <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1016bb:	55                   	push   %ebp
  1016bc:	89 e5                	mov    %esp,%ebp
  1016be:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1016c1:	e8 b8 fd ff ff       	call   10147e <serial_intr>
    kbd_intr();
  1016c6:	e8 6e ff ff ff       	call   101639 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1016cb:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  1016d1:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1016d6:	39 c2                	cmp    %eax,%edx
  1016d8:	74 35                	je     10170f <cons_getc+0x54>
        c = cons.buf[cons.rpos ++];
  1016da:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1016df:	0f b6 90 80 ee 10 00 	movzbl 0x10ee80(%eax),%edx
  1016e6:	0f b6 d2             	movzbl %dl,%edx
  1016e9:	89 55 f4             	mov    %edx,-0xc(%ebp)
  1016ec:	83 c0 01             	add    $0x1,%eax
  1016ef:	a3 80 f0 10 00       	mov    %eax,0x10f080
        if (cons.rpos == CONSBUFSIZE) {
  1016f4:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1016f9:	3d 00 02 00 00       	cmp    $0x200,%eax
  1016fe:	75 0a                	jne    10170a <cons_getc+0x4f>
            cons.rpos = 0;
  101700:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  101707:	00 00 00 
        }
        return c;
  10170a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10170d:	eb 05                	jmp    101714 <cons_getc+0x59>
    }
    return 0;
  10170f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  101714:	c9                   	leave  
  101715:	c3                   	ret    
	...

00101718 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  101718:	55                   	push   %ebp
  101719:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  10171b:	fb                   	sti    
    sti();
}
  10171c:	5d                   	pop    %ebp
  10171d:	c3                   	ret    

0010171e <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  10171e:	55                   	push   %ebp
  10171f:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  101721:	fa                   	cli    
    cli();
}
  101722:	5d                   	pop    %ebp
  101723:	c3                   	ret    

00101724 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101724:	55                   	push   %ebp
  101725:	89 e5                	mov    %esp,%ebp
  101727:	83 ec 14             	sub    $0x14,%esp
  10172a:	8b 45 08             	mov    0x8(%ebp),%eax
  10172d:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101731:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101735:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  10173b:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  101740:	85 c0                	test   %eax,%eax
  101742:	74 36                	je     10177a <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  101744:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101748:	0f b6 c0             	movzbl %al,%eax
  10174b:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  101751:	88 45 fd             	mov    %al,-0x3(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101754:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101758:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  10175c:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  10175d:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101761:	66 c1 e8 08          	shr    $0x8,%ax
  101765:	0f b6 c0             	movzbl %al,%eax
  101768:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  10176e:	88 45 f9             	mov    %al,-0x7(%ebp)
  101771:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101775:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101779:	ee                   	out    %al,(%dx)
    }
}
  10177a:	c9                   	leave  
  10177b:	c3                   	ret    

0010177c <pic_enable>:

void
pic_enable(unsigned int irq) {
  10177c:	55                   	push   %ebp
  10177d:	89 e5                	mov    %esp,%ebp
  10177f:	53                   	push   %ebx
  101780:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  101783:	8b 45 08             	mov    0x8(%ebp),%eax
  101786:	ba 01 00 00 00       	mov    $0x1,%edx
  10178b:	89 d3                	mov    %edx,%ebx
  10178d:	89 c1                	mov    %eax,%ecx
  10178f:	d3 e3                	shl    %cl,%ebx
  101791:	89 d8                	mov    %ebx,%eax
  101793:	89 c2                	mov    %eax,%edx
  101795:	f7 d2                	not    %edx
  101797:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  10179e:	21 d0                	and    %edx,%eax
  1017a0:	0f b7 c0             	movzwl %ax,%eax
  1017a3:	89 04 24             	mov    %eax,(%esp)
  1017a6:	e8 79 ff ff ff       	call   101724 <pic_setmask>
}
  1017ab:	83 c4 04             	add    $0x4,%esp
  1017ae:	5b                   	pop    %ebx
  1017af:	5d                   	pop    %ebp
  1017b0:	c3                   	ret    

001017b1 <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  1017b1:	55                   	push   %ebp
  1017b2:	89 e5                	mov    %esp,%ebp
  1017b4:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  1017b7:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  1017be:	00 00 00 
  1017c1:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  1017c7:	c6 45 fd ff          	movb   $0xff,-0x3(%ebp)
  1017cb:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1017cf:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1017d3:	ee                   	out    %al,(%dx)
  1017d4:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  1017da:	c6 45 f9 ff          	movb   $0xff,-0x7(%ebp)
  1017de:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1017e2:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1017e6:	ee                   	out    %al,(%dx)
  1017e7:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  1017ed:	c6 45 f5 11          	movb   $0x11,-0xb(%ebp)
  1017f1:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1017f5:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1017f9:	ee                   	out    %al,(%dx)
  1017fa:	66 c7 45 f2 21 00    	movw   $0x21,-0xe(%ebp)
  101800:	c6 45 f1 20          	movb   $0x20,-0xf(%ebp)
  101804:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101808:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10180c:	ee                   	out    %al,(%dx)
  10180d:	66 c7 45 ee 21 00    	movw   $0x21,-0x12(%ebp)
  101813:	c6 45 ed 04          	movb   $0x4,-0x13(%ebp)
  101817:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10181b:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10181f:	ee                   	out    %al,(%dx)
  101820:	66 c7 45 ea 21 00    	movw   $0x21,-0x16(%ebp)
  101826:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
  10182a:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10182e:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101832:	ee                   	out    %al,(%dx)
  101833:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  101839:	c6 45 e5 11          	movb   $0x11,-0x1b(%ebp)
  10183d:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101841:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101845:	ee                   	out    %al,(%dx)
  101846:	66 c7 45 e2 a1 00    	movw   $0xa1,-0x1e(%ebp)
  10184c:	c6 45 e1 28          	movb   $0x28,-0x1f(%ebp)
  101850:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101854:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101858:	ee                   	out    %al,(%dx)
  101859:	66 c7 45 de a1 00    	movw   $0xa1,-0x22(%ebp)
  10185f:	c6 45 dd 02          	movb   $0x2,-0x23(%ebp)
  101863:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101867:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  10186b:	ee                   	out    %al,(%dx)
  10186c:	66 c7 45 da a1 00    	movw   $0xa1,-0x26(%ebp)
  101872:	c6 45 d9 03          	movb   $0x3,-0x27(%ebp)
  101876:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  10187a:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  10187e:	ee                   	out    %al,(%dx)
  10187f:	66 c7 45 d6 20 00    	movw   $0x20,-0x2a(%ebp)
  101885:	c6 45 d5 68          	movb   $0x68,-0x2b(%ebp)
  101889:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  10188d:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  101891:	ee                   	out    %al,(%dx)
  101892:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  101898:	c6 45 d1 0a          	movb   $0xa,-0x2f(%ebp)
  10189c:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  1018a0:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  1018a4:	ee                   	out    %al,(%dx)
  1018a5:	66 c7 45 ce a0 00    	movw   $0xa0,-0x32(%ebp)
  1018ab:	c6 45 cd 68          	movb   $0x68,-0x33(%ebp)
  1018af:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  1018b3:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  1018b7:	ee                   	out    %al,(%dx)
  1018b8:	66 c7 45 ca a0 00    	movw   $0xa0,-0x36(%ebp)
  1018be:	c6 45 c9 0a          	movb   $0xa,-0x37(%ebp)
  1018c2:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1018c6:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1018ca:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1018cb:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1018d2:	66 83 f8 ff          	cmp    $0xffff,%ax
  1018d6:	74 12                	je     1018ea <pic_init+0x139>
        pic_setmask(irq_mask);
  1018d8:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1018df:	0f b7 c0             	movzwl %ax,%eax
  1018e2:	89 04 24             	mov    %eax,(%esp)
  1018e5:	e8 3a fe ff ff       	call   101724 <pic_setmask>
    }
}
  1018ea:	c9                   	leave  
  1018eb:	c3                   	ret    

001018ec <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  1018ec:	55                   	push   %ebp
  1018ed:	89 e5                	mov    %esp,%ebp
  1018ef:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  1018f2:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  1018f9:	00 
  1018fa:	c7 04 24 c0 39 10 00 	movl   $0x1039c0,(%esp)
  101901:	e8 21 ea ff ff       	call   100327 <cprintf>
    cprintf("so Easy!!");
  101906:	c7 04 24 ca 39 10 00 	movl   $0x1039ca,(%esp)
  10190d:	e8 15 ea ff ff       	call   100327 <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  101912:	c9                   	leave  
  101913:	c3                   	ret    

00101914 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101914:	55                   	push   %ebp
  101915:	89 e5                	mov    %esp,%ebp
  101917:	83 ec 10             	sub    $0x10,%esp
    extern uintptr_t __vectors[];//设置一个全局变量，便于以后使用
    int i = 0;
  10191a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    for(i = 0;i <= 255; i++)
  101921:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101928:	e9 c3 00 00 00       	jmp    1019f0 <idt_init+0xdc>
    { 
         //设置IDT表的操作
         SETGATE(idt[i],0,KERNEL_CS,__vectors[i],3);
  10192d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101930:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  101937:	89 c2                	mov    %eax,%edx
  101939:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10193c:	66 89 14 c5 a0 f0 10 	mov    %dx,0x10f0a0(,%eax,8)
  101943:	00 
  101944:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101947:	66 c7 04 c5 a2 f0 10 	movw   $0x8,0x10f0a2(,%eax,8)
  10194e:	00 08 00 
  101951:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101954:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  10195b:	00 
  10195c:	83 e2 e0             	and    $0xffffffe0,%edx
  10195f:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  101966:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101969:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101970:	00 
  101971:	83 e2 1f             	and    $0x1f,%edx
  101974:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  10197b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10197e:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101985:	00 
  101986:	83 e2 f0             	and    $0xfffffff0,%edx
  101989:	83 ca 0e             	or     $0xe,%edx
  10198c:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  101993:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101996:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  10199d:	00 
  10199e:	83 e2 ef             	and    $0xffffffef,%edx
  1019a1:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1019a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019ab:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1019b2:	00 
  1019b3:	83 ca 60             	or     $0x60,%edx
  1019b6:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1019bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019c0:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1019c7:	00 
  1019c8:	83 ca 80             	or     $0xffffff80,%edx
  1019cb:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1019d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019d5:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  1019dc:	c1 e8 10             	shr    $0x10,%eax
  1019df:	89 c2                	mov    %eax,%edx
  1019e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019e4:	66 89 14 c5 a6 f0 10 	mov    %dx,0x10f0a6(,%eax,8)
  1019eb:	00 
/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
    extern uintptr_t __vectors[];//设置一个全局变量，便于以后使用
    int i = 0;
    for(i = 0;i <= 255; i++)
  1019ec:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1019f0:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  1019f7:	0f 8e 30 ff ff ff    	jle    10192d <idt_init+0x19>
    { 
         //设置IDT表的操作
         SETGATE(idt[i],0,KERNEL_CS,__vectors[i],3);
    }

    SETGATE(idt[T_SYSCALL],i,KERNEL_CS,__vectors[T_SYSCALL],0);
  1019fd:	a1 e0 e7 10 00       	mov    0x10e7e0,%eax
  101a02:	66 a3 a0 f4 10 00    	mov    %ax,0x10f4a0
  101a08:	66 c7 05 a2 f4 10 00 	movw   $0x8,0x10f4a2
  101a0f:	08 00 
  101a11:	0f b6 05 a4 f4 10 00 	movzbl 0x10f4a4,%eax
  101a18:	83 e0 e0             	and    $0xffffffe0,%eax
  101a1b:	a2 a4 f4 10 00       	mov    %al,0x10f4a4
  101a20:	0f b6 05 a4 f4 10 00 	movzbl 0x10f4a4,%eax
  101a27:	83 e0 1f             	and    $0x1f,%eax
  101a2a:	a2 a4 f4 10 00       	mov    %al,0x10f4a4
  101a2f:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  101a33:	74 07                	je     101a3c <idt_init+0x128>
  101a35:	b8 0f 00 00 00       	mov    $0xf,%eax
  101a3a:	eb 05                	jmp    101a41 <idt_init+0x12d>
  101a3c:	b8 0e 00 00 00       	mov    $0xe,%eax
  101a41:	89 c2                	mov    %eax,%edx
  101a43:	83 e2 0f             	and    $0xf,%edx
  101a46:	0f b6 05 a5 f4 10 00 	movzbl 0x10f4a5,%eax
  101a4d:	83 e0 f0             	and    $0xfffffff0,%eax
  101a50:	09 d0                	or     %edx,%eax
  101a52:	a2 a5 f4 10 00       	mov    %al,0x10f4a5
  101a57:	0f b6 05 a5 f4 10 00 	movzbl 0x10f4a5,%eax
  101a5e:	83 e0 ef             	and    $0xffffffef,%eax
  101a61:	a2 a5 f4 10 00       	mov    %al,0x10f4a5
  101a66:	0f b6 05 a5 f4 10 00 	movzbl 0x10f4a5,%eax
  101a6d:	83 e0 9f             	and    $0xffffff9f,%eax
  101a70:	a2 a5 f4 10 00       	mov    %al,0x10f4a5
  101a75:	0f b6 05 a5 f4 10 00 	movzbl 0x10f4a5,%eax
  101a7c:	83 c8 80             	or     $0xffffff80,%eax
  101a7f:	a2 a5 f4 10 00       	mov    %al,0x10f4a5
  101a84:	a1 e0 e7 10 00       	mov    0x10e7e0,%eax
  101a89:	c1 e8 10             	shr    $0x10,%eax
  101a8c:	66 a3 a6 f4 10 00    	mov    %ax,0x10f4a6
  101a92:	c7 45 f8 60 e5 10 00 	movl   $0x10e560,-0x8(%ebp)
    return ebp;
}

static inline void
lidt(struct pseudodesc *pd) {
    asm volatile ("lidt (%0)" :: "r" (pd));
  101a99:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101a9c:	0f 01 18             	lidtl  (%eax)
      *     Can you see idt[256] in this file? Yes, it's IDT! you can use SETGATE macro to setup each item of IDT
      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using 'lidt' instruction.
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
}
  101a9f:	c9                   	leave  
  101aa0:	c3                   	ret    

00101aa1 <trapname>:

static const char *
trapname(int trapno) {
  101aa1:	55                   	push   %ebp
  101aa2:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101aa4:	8b 45 08             	mov    0x8(%ebp),%eax
  101aa7:	83 f8 13             	cmp    $0x13,%eax
  101aaa:	77 0c                	ja     101ab8 <trapname+0x17>
        return excnames[trapno];
  101aac:	8b 45 08             	mov    0x8(%ebp),%eax
  101aaf:	8b 04 85 20 3d 10 00 	mov    0x103d20(,%eax,4),%eax
  101ab6:	eb 18                	jmp    101ad0 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101ab8:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101abc:	7e 0d                	jle    101acb <trapname+0x2a>
  101abe:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101ac2:	7f 07                	jg     101acb <trapname+0x2a>
        return "Hardware Interrupt";
  101ac4:	b8 d4 39 10 00       	mov    $0x1039d4,%eax
  101ac9:	eb 05                	jmp    101ad0 <trapname+0x2f>
    }
    return "(unknown trap)";
  101acb:	b8 e7 39 10 00       	mov    $0x1039e7,%eax
}
  101ad0:	5d                   	pop    %ebp
  101ad1:	c3                   	ret    

00101ad2 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101ad2:	55                   	push   %ebp
  101ad3:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101ad5:	8b 45 08             	mov    0x8(%ebp),%eax
  101ad8:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101adc:	66 83 f8 08          	cmp    $0x8,%ax
  101ae0:	0f 94 c0             	sete   %al
  101ae3:	0f b6 c0             	movzbl %al,%eax
}
  101ae6:	5d                   	pop    %ebp
  101ae7:	c3                   	ret    

00101ae8 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101ae8:	55                   	push   %ebp
  101ae9:	89 e5                	mov    %esp,%ebp
  101aeb:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  101aee:	8b 45 08             	mov    0x8(%ebp),%eax
  101af1:	89 44 24 04          	mov    %eax,0x4(%esp)
  101af5:	c7 04 24 28 3a 10 00 	movl   $0x103a28,(%esp)
  101afc:	e8 26 e8 ff ff       	call   100327 <cprintf>
    print_regs(&tf->tf_regs);
  101b01:	8b 45 08             	mov    0x8(%ebp),%eax
  101b04:	89 04 24             	mov    %eax,(%esp)
  101b07:	e8 a1 01 00 00       	call   101cad <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101b0c:	8b 45 08             	mov    0x8(%ebp),%eax
  101b0f:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101b13:	0f b7 c0             	movzwl %ax,%eax
  101b16:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b1a:	c7 04 24 39 3a 10 00 	movl   $0x103a39,(%esp)
  101b21:	e8 01 e8 ff ff       	call   100327 <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101b26:	8b 45 08             	mov    0x8(%ebp),%eax
  101b29:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101b2d:	0f b7 c0             	movzwl %ax,%eax
  101b30:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b34:	c7 04 24 4c 3a 10 00 	movl   $0x103a4c,(%esp)
  101b3b:	e8 e7 e7 ff ff       	call   100327 <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101b40:	8b 45 08             	mov    0x8(%ebp),%eax
  101b43:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101b47:	0f b7 c0             	movzwl %ax,%eax
  101b4a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b4e:	c7 04 24 5f 3a 10 00 	movl   $0x103a5f,(%esp)
  101b55:	e8 cd e7 ff ff       	call   100327 <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101b5a:	8b 45 08             	mov    0x8(%ebp),%eax
  101b5d:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101b61:	0f b7 c0             	movzwl %ax,%eax
  101b64:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b68:	c7 04 24 72 3a 10 00 	movl   $0x103a72,(%esp)
  101b6f:	e8 b3 e7 ff ff       	call   100327 <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101b74:	8b 45 08             	mov    0x8(%ebp),%eax
  101b77:	8b 40 30             	mov    0x30(%eax),%eax
  101b7a:	89 04 24             	mov    %eax,(%esp)
  101b7d:	e8 1f ff ff ff       	call   101aa1 <trapname>
  101b82:	8b 55 08             	mov    0x8(%ebp),%edx
  101b85:	8b 52 30             	mov    0x30(%edx),%edx
  101b88:	89 44 24 08          	mov    %eax,0x8(%esp)
  101b8c:	89 54 24 04          	mov    %edx,0x4(%esp)
  101b90:	c7 04 24 85 3a 10 00 	movl   $0x103a85,(%esp)
  101b97:	e8 8b e7 ff ff       	call   100327 <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101b9c:	8b 45 08             	mov    0x8(%ebp),%eax
  101b9f:	8b 40 34             	mov    0x34(%eax),%eax
  101ba2:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ba6:	c7 04 24 97 3a 10 00 	movl   $0x103a97,(%esp)
  101bad:	e8 75 e7 ff ff       	call   100327 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101bb2:	8b 45 08             	mov    0x8(%ebp),%eax
  101bb5:	8b 40 38             	mov    0x38(%eax),%eax
  101bb8:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bbc:	c7 04 24 a6 3a 10 00 	movl   $0x103aa6,(%esp)
  101bc3:	e8 5f e7 ff ff       	call   100327 <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101bc8:	8b 45 08             	mov    0x8(%ebp),%eax
  101bcb:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101bcf:	0f b7 c0             	movzwl %ax,%eax
  101bd2:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bd6:	c7 04 24 b5 3a 10 00 	movl   $0x103ab5,(%esp)
  101bdd:	e8 45 e7 ff ff       	call   100327 <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101be2:	8b 45 08             	mov    0x8(%ebp),%eax
  101be5:	8b 40 40             	mov    0x40(%eax),%eax
  101be8:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bec:	c7 04 24 c8 3a 10 00 	movl   $0x103ac8,(%esp)
  101bf3:	e8 2f e7 ff ff       	call   100327 <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101bf8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101bff:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101c06:	eb 3e                	jmp    101c46 <print_trapframe+0x15e>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101c08:	8b 45 08             	mov    0x8(%ebp),%eax
  101c0b:	8b 50 40             	mov    0x40(%eax),%edx
  101c0e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101c11:	21 d0                	and    %edx,%eax
  101c13:	85 c0                	test   %eax,%eax
  101c15:	74 28                	je     101c3f <print_trapframe+0x157>
  101c17:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c1a:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101c21:	85 c0                	test   %eax,%eax
  101c23:	74 1a                	je     101c3f <print_trapframe+0x157>
            cprintf("%s,", IA32flags[i]);
  101c25:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c28:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101c2f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c33:	c7 04 24 d7 3a 10 00 	movl   $0x103ad7,(%esp)
  101c3a:	e8 e8 e6 ff ff       	call   100327 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101c3f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101c43:	d1 65 f0             	shll   -0x10(%ebp)
  101c46:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c49:	83 f8 17             	cmp    $0x17,%eax
  101c4c:	76 ba                	jbe    101c08 <print_trapframe+0x120>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101c4e:	8b 45 08             	mov    0x8(%ebp),%eax
  101c51:	8b 40 40             	mov    0x40(%eax),%eax
  101c54:	25 00 30 00 00       	and    $0x3000,%eax
  101c59:	c1 e8 0c             	shr    $0xc,%eax
  101c5c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c60:	c7 04 24 db 3a 10 00 	movl   $0x103adb,(%esp)
  101c67:	e8 bb e6 ff ff       	call   100327 <cprintf>

    if (!trap_in_kernel(tf)) {
  101c6c:	8b 45 08             	mov    0x8(%ebp),%eax
  101c6f:	89 04 24             	mov    %eax,(%esp)
  101c72:	e8 5b fe ff ff       	call   101ad2 <trap_in_kernel>
  101c77:	85 c0                	test   %eax,%eax
  101c79:	75 30                	jne    101cab <print_trapframe+0x1c3>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101c7b:	8b 45 08             	mov    0x8(%ebp),%eax
  101c7e:	8b 40 44             	mov    0x44(%eax),%eax
  101c81:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c85:	c7 04 24 e4 3a 10 00 	movl   $0x103ae4,(%esp)
  101c8c:	e8 96 e6 ff ff       	call   100327 <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101c91:	8b 45 08             	mov    0x8(%ebp),%eax
  101c94:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101c98:	0f b7 c0             	movzwl %ax,%eax
  101c9b:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c9f:	c7 04 24 f3 3a 10 00 	movl   $0x103af3,(%esp)
  101ca6:	e8 7c e6 ff ff       	call   100327 <cprintf>
    }
}
  101cab:	c9                   	leave  
  101cac:	c3                   	ret    

00101cad <print_regs>:

void
print_regs(struct pushregs *regs) {
  101cad:	55                   	push   %ebp
  101cae:	89 e5                	mov    %esp,%ebp
  101cb0:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101cb3:	8b 45 08             	mov    0x8(%ebp),%eax
  101cb6:	8b 00                	mov    (%eax),%eax
  101cb8:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cbc:	c7 04 24 06 3b 10 00 	movl   $0x103b06,(%esp)
  101cc3:	e8 5f e6 ff ff       	call   100327 <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101cc8:	8b 45 08             	mov    0x8(%ebp),%eax
  101ccb:	8b 40 04             	mov    0x4(%eax),%eax
  101cce:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cd2:	c7 04 24 15 3b 10 00 	movl   $0x103b15,(%esp)
  101cd9:	e8 49 e6 ff ff       	call   100327 <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101cde:	8b 45 08             	mov    0x8(%ebp),%eax
  101ce1:	8b 40 08             	mov    0x8(%eax),%eax
  101ce4:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ce8:	c7 04 24 24 3b 10 00 	movl   $0x103b24,(%esp)
  101cef:	e8 33 e6 ff ff       	call   100327 <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101cf4:	8b 45 08             	mov    0x8(%ebp),%eax
  101cf7:	8b 40 0c             	mov    0xc(%eax),%eax
  101cfa:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cfe:	c7 04 24 33 3b 10 00 	movl   $0x103b33,(%esp)
  101d05:	e8 1d e6 ff ff       	call   100327 <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101d0a:	8b 45 08             	mov    0x8(%ebp),%eax
  101d0d:	8b 40 10             	mov    0x10(%eax),%eax
  101d10:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d14:	c7 04 24 42 3b 10 00 	movl   $0x103b42,(%esp)
  101d1b:	e8 07 e6 ff ff       	call   100327 <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101d20:	8b 45 08             	mov    0x8(%ebp),%eax
  101d23:	8b 40 14             	mov    0x14(%eax),%eax
  101d26:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d2a:	c7 04 24 51 3b 10 00 	movl   $0x103b51,(%esp)
  101d31:	e8 f1 e5 ff ff       	call   100327 <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101d36:	8b 45 08             	mov    0x8(%ebp),%eax
  101d39:	8b 40 18             	mov    0x18(%eax),%eax
  101d3c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d40:	c7 04 24 60 3b 10 00 	movl   $0x103b60,(%esp)
  101d47:	e8 db e5 ff ff       	call   100327 <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101d4c:	8b 45 08             	mov    0x8(%ebp),%eax
  101d4f:	8b 40 1c             	mov    0x1c(%eax),%eax
  101d52:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d56:	c7 04 24 6f 3b 10 00 	movl   $0x103b6f,(%esp)
  101d5d:	e8 c5 e5 ff ff       	call   100327 <cprintf>
}
  101d62:	c9                   	leave  
  101d63:	c3                   	ret    

00101d64 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101d64:	55                   	push   %ebp
  101d65:	89 e5                	mov    %esp,%ebp
  101d67:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101d6a:	8b 45 08             	mov    0x8(%ebp),%eax
  101d6d:	8b 40 30             	mov    0x30(%eax),%eax
  101d70:	83 f8 2f             	cmp    $0x2f,%eax
  101d73:	77 1d                	ja     101d92 <trap_dispatch+0x2e>
  101d75:	83 f8 2e             	cmp    $0x2e,%eax
  101d78:	0f 83 f2 00 00 00    	jae    101e70 <trap_dispatch+0x10c>
  101d7e:	83 f8 21             	cmp    $0x21,%eax
  101d81:	74 73                	je     101df6 <trap_dispatch+0x92>
  101d83:	83 f8 24             	cmp    $0x24,%eax
  101d86:	74 48                	je     101dd0 <trap_dispatch+0x6c>
  101d88:	83 f8 20             	cmp    $0x20,%eax
  101d8b:	74 13                	je     101da0 <trap_dispatch+0x3c>
  101d8d:	e9 a6 00 00 00       	jmp    101e38 <trap_dispatch+0xd4>
  101d92:	83 e8 78             	sub    $0x78,%eax
  101d95:	83 f8 01             	cmp    $0x1,%eax
  101d98:	0f 87 9a 00 00 00    	ja     101e38 <trap_dispatch+0xd4>
  101d9e:	eb 7c                	jmp    101e1c <trap_dispatch+0xb8>
	/*
	 每次收到一个时钟中断，就把ticks加1
	 同时我们需要显示一个信息能够表示我们的操作
	 */
//	cprintf("I have changed the tick in to --------------------------------------------------------------------------------------------------------------------------------------------------");
	if(ticks == 100){
  101da0:	a1 08 f9 10 00       	mov    0x10f908,%eax
  101da5:	83 f8 64             	cmp    $0x64,%eax
  101da8:	75 14                	jne    101dbe <trap_dispatch+0x5a>
	    print_ticks();
  101daa:	e8 3d fb ff ff       	call   1018ec <print_ticks>
	    ticks = 0;
  101daf:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  101db6:	00 00 00 
	}else{
	    ticks ++;
	}
	break;
  101db9:	e9 b3 00 00 00       	jmp    101e71 <trap_dispatch+0x10d>
//	cprintf("I have changed the tick in to --------------------------------------------------------------------------------------------------------------------------------------------------");
	if(ticks == 100){
	    print_ticks();
	    ticks = 0;
	}else{
	    ticks ++;
  101dbe:	a1 08 f9 10 00       	mov    0x10f908,%eax
  101dc3:	83 c0 01             	add    $0x1,%eax
  101dc6:	a3 08 f9 10 00       	mov    %eax,0x10f908
	}
	break;
  101dcb:	e9 a1 00 00 00       	jmp    101e71 <trap_dispatch+0x10d>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101dd0:	e8 e6 f8 ff ff       	call   1016bb <cons_getc>
  101dd5:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101dd8:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101ddc:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101de0:	89 54 24 08          	mov    %edx,0x8(%esp)
  101de4:	89 44 24 04          	mov    %eax,0x4(%esp)
  101de8:	c7 04 24 7e 3b 10 00 	movl   $0x103b7e,(%esp)
  101def:	e8 33 e5 ff ff       	call   100327 <cprintf>
        break;
  101df4:	eb 7b                	jmp    101e71 <trap_dispatch+0x10d>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101df6:	e8 c0 f8 ff ff       	call   1016bb <cons_getc>
  101dfb:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101dfe:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101e02:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101e06:	89 54 24 08          	mov    %edx,0x8(%esp)
  101e0a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101e0e:	c7 04 24 90 3b 10 00 	movl   $0x103b90,(%esp)
  101e15:	e8 0d e5 ff ff       	call   100327 <cprintf>
        break;
  101e1a:	eb 55                	jmp    101e71 <trap_dispatch+0x10d>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101e1c:	c7 44 24 08 9f 3b 10 	movl   $0x103b9f,0x8(%esp)
  101e23:	00 
  101e24:	c7 44 24 04 bf 00 00 	movl   $0xbf,0x4(%esp)
  101e2b:	00 
  101e2c:	c7 04 24 af 3b 10 00 	movl   $0x103baf,(%esp)
  101e33:	e8 bc ee ff ff       	call   100cf4 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101e38:	8b 45 08             	mov    0x8(%ebp),%eax
  101e3b:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e3f:	0f b7 c0             	movzwl %ax,%eax
  101e42:	83 e0 03             	and    $0x3,%eax
  101e45:	85 c0                	test   %eax,%eax
  101e47:	75 28                	jne    101e71 <trap_dispatch+0x10d>
            print_trapframe(tf);
  101e49:	8b 45 08             	mov    0x8(%ebp),%eax
  101e4c:	89 04 24             	mov    %eax,(%esp)
  101e4f:	e8 94 fc ff ff       	call   101ae8 <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101e54:	c7 44 24 08 c0 3b 10 	movl   $0x103bc0,0x8(%esp)
  101e5b:	00 
  101e5c:	c7 44 24 04 c9 00 00 	movl   $0xc9,0x4(%esp)
  101e63:	00 
  101e64:	c7 04 24 af 3b 10 00 	movl   $0x103baf,(%esp)
  101e6b:	e8 84 ee ff ff       	call   100cf4 <__panic>
        panic("T_SWITCH_** ??\n");
        break;
    case IRQ_OFFSET + IRQ_IDE1:
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
  101e70:	90                   	nop
        if ((tf->tf_cs & 3) == 0) {
            print_trapframe(tf);
            panic("unexpected trap in kernel.\n");
        }
    }
}
  101e71:	c9                   	leave  
  101e72:	c3                   	ret    

00101e73 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101e73:	55                   	push   %ebp
  101e74:	89 e5                	mov    %esp,%ebp
  101e76:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101e79:	8b 45 08             	mov    0x8(%ebp),%eax
  101e7c:	89 04 24             	mov    %eax,(%esp)
  101e7f:	e8 e0 fe ff ff       	call   101d64 <trap_dispatch>
}
  101e84:	c9                   	leave  
  101e85:	c3                   	ret    
	...

00101e88 <__alltraps>:
    # 同时吧kenel里面的数据压栈
    # 把这个trapframe作为一个trapframe类型的参数传入到trap中，进行中断处理

    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  101e88:	1e                   	push   %ds
    pushl %es
  101e89:	06                   	push   %es
    pushl %fs
  101e8a:	0f a0                	push   %fs
    pushl %gs
  101e8c:	0f a8                	push   %gs
    pushal
  101e8e:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  101e8f:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  101e94:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  101e96:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  101e98:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  101e99:	e8 d5 ff ff ff       	call   101e73 <trap>
    # 注意，第一个eip是trapframe的eip，另外一个eip是call命令产生的eip，需要区分

    # pop the pushed stack pointer
    popl %esp
  101e9e:	5c                   	pop    %esp

00101e9f <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  101e9f:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  101ea0:	0f a9                	pop    %gs
    popl %fs
  101ea2:	0f a1                	pop    %fs
    popl %es
  101ea4:	07                   	pop    %es
    popl %ds
  101ea5:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  101ea6:	83 c4 08             	add    $0x8,%esp
    iret
  101ea9:	cf                   	iret   
	...

00101eac <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101eac:	6a 00                	push   $0x0
  pushl $0
  101eae:	6a 00                	push   $0x0
  jmp __alltraps
  101eb0:	e9 d3 ff ff ff       	jmp    101e88 <__alltraps>

00101eb5 <vector1>:
.globl vector1
vector1:
  pushl $0
  101eb5:	6a 00                	push   $0x0
  pushl $1
  101eb7:	6a 01                	push   $0x1
  jmp __alltraps
  101eb9:	e9 ca ff ff ff       	jmp    101e88 <__alltraps>

00101ebe <vector2>:
.globl vector2
vector2:
  pushl $0
  101ebe:	6a 00                	push   $0x0
  pushl $2
  101ec0:	6a 02                	push   $0x2
  jmp __alltraps
  101ec2:	e9 c1 ff ff ff       	jmp    101e88 <__alltraps>

00101ec7 <vector3>:
.globl vector3
vector3:
  pushl $0
  101ec7:	6a 00                	push   $0x0
  pushl $3
  101ec9:	6a 03                	push   $0x3
  jmp __alltraps
  101ecb:	e9 b8 ff ff ff       	jmp    101e88 <__alltraps>

00101ed0 <vector4>:
.globl vector4
vector4:
  pushl $0
  101ed0:	6a 00                	push   $0x0
  pushl $4
  101ed2:	6a 04                	push   $0x4
  jmp __alltraps
  101ed4:	e9 af ff ff ff       	jmp    101e88 <__alltraps>

00101ed9 <vector5>:
.globl vector5
vector5:
  pushl $0
  101ed9:	6a 00                	push   $0x0
  pushl $5
  101edb:	6a 05                	push   $0x5
  jmp __alltraps
  101edd:	e9 a6 ff ff ff       	jmp    101e88 <__alltraps>

00101ee2 <vector6>:
.globl vector6
vector6:
  pushl $0
  101ee2:	6a 00                	push   $0x0
  pushl $6
  101ee4:	6a 06                	push   $0x6
  jmp __alltraps
  101ee6:	e9 9d ff ff ff       	jmp    101e88 <__alltraps>

00101eeb <vector7>:
.globl vector7
vector7:
  pushl $0
  101eeb:	6a 00                	push   $0x0
  pushl $7
  101eed:	6a 07                	push   $0x7
  jmp __alltraps
  101eef:	e9 94 ff ff ff       	jmp    101e88 <__alltraps>

00101ef4 <vector8>:
.globl vector8
vector8:
  pushl $8
  101ef4:	6a 08                	push   $0x8
  jmp __alltraps
  101ef6:	e9 8d ff ff ff       	jmp    101e88 <__alltraps>

00101efb <vector9>:
.globl vector9
vector9:
  pushl $9
  101efb:	6a 09                	push   $0x9
  jmp __alltraps
  101efd:	e9 86 ff ff ff       	jmp    101e88 <__alltraps>

00101f02 <vector10>:
.globl vector10
vector10:
  pushl $10
  101f02:	6a 0a                	push   $0xa
  jmp __alltraps
  101f04:	e9 7f ff ff ff       	jmp    101e88 <__alltraps>

00101f09 <vector11>:
.globl vector11
vector11:
  pushl $11
  101f09:	6a 0b                	push   $0xb
  jmp __alltraps
  101f0b:	e9 78 ff ff ff       	jmp    101e88 <__alltraps>

00101f10 <vector12>:
.globl vector12
vector12:
  pushl $12
  101f10:	6a 0c                	push   $0xc
  jmp __alltraps
  101f12:	e9 71 ff ff ff       	jmp    101e88 <__alltraps>

00101f17 <vector13>:
.globl vector13
vector13:
  pushl $13
  101f17:	6a 0d                	push   $0xd
  jmp __alltraps
  101f19:	e9 6a ff ff ff       	jmp    101e88 <__alltraps>

00101f1e <vector14>:
.globl vector14
vector14:
  pushl $14
  101f1e:	6a 0e                	push   $0xe
  jmp __alltraps
  101f20:	e9 63 ff ff ff       	jmp    101e88 <__alltraps>

00101f25 <vector15>:
.globl vector15
vector15:
  pushl $0
  101f25:	6a 00                	push   $0x0
  pushl $15
  101f27:	6a 0f                	push   $0xf
  jmp __alltraps
  101f29:	e9 5a ff ff ff       	jmp    101e88 <__alltraps>

00101f2e <vector16>:
.globl vector16
vector16:
  pushl $0
  101f2e:	6a 00                	push   $0x0
  pushl $16
  101f30:	6a 10                	push   $0x10
  jmp __alltraps
  101f32:	e9 51 ff ff ff       	jmp    101e88 <__alltraps>

00101f37 <vector17>:
.globl vector17
vector17:
  pushl $17
  101f37:	6a 11                	push   $0x11
  jmp __alltraps
  101f39:	e9 4a ff ff ff       	jmp    101e88 <__alltraps>

00101f3e <vector18>:
.globl vector18
vector18:
  pushl $0
  101f3e:	6a 00                	push   $0x0
  pushl $18
  101f40:	6a 12                	push   $0x12
  jmp __alltraps
  101f42:	e9 41 ff ff ff       	jmp    101e88 <__alltraps>

00101f47 <vector19>:
.globl vector19
vector19:
  pushl $0
  101f47:	6a 00                	push   $0x0
  pushl $19
  101f49:	6a 13                	push   $0x13
  jmp __alltraps
  101f4b:	e9 38 ff ff ff       	jmp    101e88 <__alltraps>

00101f50 <vector20>:
.globl vector20
vector20:
  pushl $0
  101f50:	6a 00                	push   $0x0
  pushl $20
  101f52:	6a 14                	push   $0x14
  jmp __alltraps
  101f54:	e9 2f ff ff ff       	jmp    101e88 <__alltraps>

00101f59 <vector21>:
.globl vector21
vector21:
  pushl $0
  101f59:	6a 00                	push   $0x0
  pushl $21
  101f5b:	6a 15                	push   $0x15
  jmp __alltraps
  101f5d:	e9 26 ff ff ff       	jmp    101e88 <__alltraps>

00101f62 <vector22>:
.globl vector22
vector22:
  pushl $0
  101f62:	6a 00                	push   $0x0
  pushl $22
  101f64:	6a 16                	push   $0x16
  jmp __alltraps
  101f66:	e9 1d ff ff ff       	jmp    101e88 <__alltraps>

00101f6b <vector23>:
.globl vector23
vector23:
  pushl $0
  101f6b:	6a 00                	push   $0x0
  pushl $23
  101f6d:	6a 17                	push   $0x17
  jmp __alltraps
  101f6f:	e9 14 ff ff ff       	jmp    101e88 <__alltraps>

00101f74 <vector24>:
.globl vector24
vector24:
  pushl $0
  101f74:	6a 00                	push   $0x0
  pushl $24
  101f76:	6a 18                	push   $0x18
  jmp __alltraps
  101f78:	e9 0b ff ff ff       	jmp    101e88 <__alltraps>

00101f7d <vector25>:
.globl vector25
vector25:
  pushl $0
  101f7d:	6a 00                	push   $0x0
  pushl $25
  101f7f:	6a 19                	push   $0x19
  jmp __alltraps
  101f81:	e9 02 ff ff ff       	jmp    101e88 <__alltraps>

00101f86 <vector26>:
.globl vector26
vector26:
  pushl $0
  101f86:	6a 00                	push   $0x0
  pushl $26
  101f88:	6a 1a                	push   $0x1a
  jmp __alltraps
  101f8a:	e9 f9 fe ff ff       	jmp    101e88 <__alltraps>

00101f8f <vector27>:
.globl vector27
vector27:
  pushl $0
  101f8f:	6a 00                	push   $0x0
  pushl $27
  101f91:	6a 1b                	push   $0x1b
  jmp __alltraps
  101f93:	e9 f0 fe ff ff       	jmp    101e88 <__alltraps>

00101f98 <vector28>:
.globl vector28
vector28:
  pushl $0
  101f98:	6a 00                	push   $0x0
  pushl $28
  101f9a:	6a 1c                	push   $0x1c
  jmp __alltraps
  101f9c:	e9 e7 fe ff ff       	jmp    101e88 <__alltraps>

00101fa1 <vector29>:
.globl vector29
vector29:
  pushl $0
  101fa1:	6a 00                	push   $0x0
  pushl $29
  101fa3:	6a 1d                	push   $0x1d
  jmp __alltraps
  101fa5:	e9 de fe ff ff       	jmp    101e88 <__alltraps>

00101faa <vector30>:
.globl vector30
vector30:
  pushl $0
  101faa:	6a 00                	push   $0x0
  pushl $30
  101fac:	6a 1e                	push   $0x1e
  jmp __alltraps
  101fae:	e9 d5 fe ff ff       	jmp    101e88 <__alltraps>

00101fb3 <vector31>:
.globl vector31
vector31:
  pushl $0
  101fb3:	6a 00                	push   $0x0
  pushl $31
  101fb5:	6a 1f                	push   $0x1f
  jmp __alltraps
  101fb7:	e9 cc fe ff ff       	jmp    101e88 <__alltraps>

00101fbc <vector32>:
.globl vector32
vector32:
  pushl $0
  101fbc:	6a 00                	push   $0x0
  pushl $32
  101fbe:	6a 20                	push   $0x20
  jmp __alltraps
  101fc0:	e9 c3 fe ff ff       	jmp    101e88 <__alltraps>

00101fc5 <vector33>:
.globl vector33
vector33:
  pushl $0
  101fc5:	6a 00                	push   $0x0
  pushl $33
  101fc7:	6a 21                	push   $0x21
  jmp __alltraps
  101fc9:	e9 ba fe ff ff       	jmp    101e88 <__alltraps>

00101fce <vector34>:
.globl vector34
vector34:
  pushl $0
  101fce:	6a 00                	push   $0x0
  pushl $34
  101fd0:	6a 22                	push   $0x22
  jmp __alltraps
  101fd2:	e9 b1 fe ff ff       	jmp    101e88 <__alltraps>

00101fd7 <vector35>:
.globl vector35
vector35:
  pushl $0
  101fd7:	6a 00                	push   $0x0
  pushl $35
  101fd9:	6a 23                	push   $0x23
  jmp __alltraps
  101fdb:	e9 a8 fe ff ff       	jmp    101e88 <__alltraps>

00101fe0 <vector36>:
.globl vector36
vector36:
  pushl $0
  101fe0:	6a 00                	push   $0x0
  pushl $36
  101fe2:	6a 24                	push   $0x24
  jmp __alltraps
  101fe4:	e9 9f fe ff ff       	jmp    101e88 <__alltraps>

00101fe9 <vector37>:
.globl vector37
vector37:
  pushl $0
  101fe9:	6a 00                	push   $0x0
  pushl $37
  101feb:	6a 25                	push   $0x25
  jmp __alltraps
  101fed:	e9 96 fe ff ff       	jmp    101e88 <__alltraps>

00101ff2 <vector38>:
.globl vector38
vector38:
  pushl $0
  101ff2:	6a 00                	push   $0x0
  pushl $38
  101ff4:	6a 26                	push   $0x26
  jmp __alltraps
  101ff6:	e9 8d fe ff ff       	jmp    101e88 <__alltraps>

00101ffb <vector39>:
.globl vector39
vector39:
  pushl $0
  101ffb:	6a 00                	push   $0x0
  pushl $39
  101ffd:	6a 27                	push   $0x27
  jmp __alltraps
  101fff:	e9 84 fe ff ff       	jmp    101e88 <__alltraps>

00102004 <vector40>:
.globl vector40
vector40:
  pushl $0
  102004:	6a 00                	push   $0x0
  pushl $40
  102006:	6a 28                	push   $0x28
  jmp __alltraps
  102008:	e9 7b fe ff ff       	jmp    101e88 <__alltraps>

0010200d <vector41>:
.globl vector41
vector41:
  pushl $0
  10200d:	6a 00                	push   $0x0
  pushl $41
  10200f:	6a 29                	push   $0x29
  jmp __alltraps
  102011:	e9 72 fe ff ff       	jmp    101e88 <__alltraps>

00102016 <vector42>:
.globl vector42
vector42:
  pushl $0
  102016:	6a 00                	push   $0x0
  pushl $42
  102018:	6a 2a                	push   $0x2a
  jmp __alltraps
  10201a:	e9 69 fe ff ff       	jmp    101e88 <__alltraps>

0010201f <vector43>:
.globl vector43
vector43:
  pushl $0
  10201f:	6a 00                	push   $0x0
  pushl $43
  102021:	6a 2b                	push   $0x2b
  jmp __alltraps
  102023:	e9 60 fe ff ff       	jmp    101e88 <__alltraps>

00102028 <vector44>:
.globl vector44
vector44:
  pushl $0
  102028:	6a 00                	push   $0x0
  pushl $44
  10202a:	6a 2c                	push   $0x2c
  jmp __alltraps
  10202c:	e9 57 fe ff ff       	jmp    101e88 <__alltraps>

00102031 <vector45>:
.globl vector45
vector45:
  pushl $0
  102031:	6a 00                	push   $0x0
  pushl $45
  102033:	6a 2d                	push   $0x2d
  jmp __alltraps
  102035:	e9 4e fe ff ff       	jmp    101e88 <__alltraps>

0010203a <vector46>:
.globl vector46
vector46:
  pushl $0
  10203a:	6a 00                	push   $0x0
  pushl $46
  10203c:	6a 2e                	push   $0x2e
  jmp __alltraps
  10203e:	e9 45 fe ff ff       	jmp    101e88 <__alltraps>

00102043 <vector47>:
.globl vector47
vector47:
  pushl $0
  102043:	6a 00                	push   $0x0
  pushl $47
  102045:	6a 2f                	push   $0x2f
  jmp __alltraps
  102047:	e9 3c fe ff ff       	jmp    101e88 <__alltraps>

0010204c <vector48>:
.globl vector48
vector48:
  pushl $0
  10204c:	6a 00                	push   $0x0
  pushl $48
  10204e:	6a 30                	push   $0x30
  jmp __alltraps
  102050:	e9 33 fe ff ff       	jmp    101e88 <__alltraps>

00102055 <vector49>:
.globl vector49
vector49:
  pushl $0
  102055:	6a 00                	push   $0x0
  pushl $49
  102057:	6a 31                	push   $0x31
  jmp __alltraps
  102059:	e9 2a fe ff ff       	jmp    101e88 <__alltraps>

0010205e <vector50>:
.globl vector50
vector50:
  pushl $0
  10205e:	6a 00                	push   $0x0
  pushl $50
  102060:	6a 32                	push   $0x32
  jmp __alltraps
  102062:	e9 21 fe ff ff       	jmp    101e88 <__alltraps>

00102067 <vector51>:
.globl vector51
vector51:
  pushl $0
  102067:	6a 00                	push   $0x0
  pushl $51
  102069:	6a 33                	push   $0x33
  jmp __alltraps
  10206b:	e9 18 fe ff ff       	jmp    101e88 <__alltraps>

00102070 <vector52>:
.globl vector52
vector52:
  pushl $0
  102070:	6a 00                	push   $0x0
  pushl $52
  102072:	6a 34                	push   $0x34
  jmp __alltraps
  102074:	e9 0f fe ff ff       	jmp    101e88 <__alltraps>

00102079 <vector53>:
.globl vector53
vector53:
  pushl $0
  102079:	6a 00                	push   $0x0
  pushl $53
  10207b:	6a 35                	push   $0x35
  jmp __alltraps
  10207d:	e9 06 fe ff ff       	jmp    101e88 <__alltraps>

00102082 <vector54>:
.globl vector54
vector54:
  pushl $0
  102082:	6a 00                	push   $0x0
  pushl $54
  102084:	6a 36                	push   $0x36
  jmp __alltraps
  102086:	e9 fd fd ff ff       	jmp    101e88 <__alltraps>

0010208b <vector55>:
.globl vector55
vector55:
  pushl $0
  10208b:	6a 00                	push   $0x0
  pushl $55
  10208d:	6a 37                	push   $0x37
  jmp __alltraps
  10208f:	e9 f4 fd ff ff       	jmp    101e88 <__alltraps>

00102094 <vector56>:
.globl vector56
vector56:
  pushl $0
  102094:	6a 00                	push   $0x0
  pushl $56
  102096:	6a 38                	push   $0x38
  jmp __alltraps
  102098:	e9 eb fd ff ff       	jmp    101e88 <__alltraps>

0010209d <vector57>:
.globl vector57
vector57:
  pushl $0
  10209d:	6a 00                	push   $0x0
  pushl $57
  10209f:	6a 39                	push   $0x39
  jmp __alltraps
  1020a1:	e9 e2 fd ff ff       	jmp    101e88 <__alltraps>

001020a6 <vector58>:
.globl vector58
vector58:
  pushl $0
  1020a6:	6a 00                	push   $0x0
  pushl $58
  1020a8:	6a 3a                	push   $0x3a
  jmp __alltraps
  1020aa:	e9 d9 fd ff ff       	jmp    101e88 <__alltraps>

001020af <vector59>:
.globl vector59
vector59:
  pushl $0
  1020af:	6a 00                	push   $0x0
  pushl $59
  1020b1:	6a 3b                	push   $0x3b
  jmp __alltraps
  1020b3:	e9 d0 fd ff ff       	jmp    101e88 <__alltraps>

001020b8 <vector60>:
.globl vector60
vector60:
  pushl $0
  1020b8:	6a 00                	push   $0x0
  pushl $60
  1020ba:	6a 3c                	push   $0x3c
  jmp __alltraps
  1020bc:	e9 c7 fd ff ff       	jmp    101e88 <__alltraps>

001020c1 <vector61>:
.globl vector61
vector61:
  pushl $0
  1020c1:	6a 00                	push   $0x0
  pushl $61
  1020c3:	6a 3d                	push   $0x3d
  jmp __alltraps
  1020c5:	e9 be fd ff ff       	jmp    101e88 <__alltraps>

001020ca <vector62>:
.globl vector62
vector62:
  pushl $0
  1020ca:	6a 00                	push   $0x0
  pushl $62
  1020cc:	6a 3e                	push   $0x3e
  jmp __alltraps
  1020ce:	e9 b5 fd ff ff       	jmp    101e88 <__alltraps>

001020d3 <vector63>:
.globl vector63
vector63:
  pushl $0
  1020d3:	6a 00                	push   $0x0
  pushl $63
  1020d5:	6a 3f                	push   $0x3f
  jmp __alltraps
  1020d7:	e9 ac fd ff ff       	jmp    101e88 <__alltraps>

001020dc <vector64>:
.globl vector64
vector64:
  pushl $0
  1020dc:	6a 00                	push   $0x0
  pushl $64
  1020de:	6a 40                	push   $0x40
  jmp __alltraps
  1020e0:	e9 a3 fd ff ff       	jmp    101e88 <__alltraps>

001020e5 <vector65>:
.globl vector65
vector65:
  pushl $0
  1020e5:	6a 00                	push   $0x0
  pushl $65
  1020e7:	6a 41                	push   $0x41
  jmp __alltraps
  1020e9:	e9 9a fd ff ff       	jmp    101e88 <__alltraps>

001020ee <vector66>:
.globl vector66
vector66:
  pushl $0
  1020ee:	6a 00                	push   $0x0
  pushl $66
  1020f0:	6a 42                	push   $0x42
  jmp __alltraps
  1020f2:	e9 91 fd ff ff       	jmp    101e88 <__alltraps>

001020f7 <vector67>:
.globl vector67
vector67:
  pushl $0
  1020f7:	6a 00                	push   $0x0
  pushl $67
  1020f9:	6a 43                	push   $0x43
  jmp __alltraps
  1020fb:	e9 88 fd ff ff       	jmp    101e88 <__alltraps>

00102100 <vector68>:
.globl vector68
vector68:
  pushl $0
  102100:	6a 00                	push   $0x0
  pushl $68
  102102:	6a 44                	push   $0x44
  jmp __alltraps
  102104:	e9 7f fd ff ff       	jmp    101e88 <__alltraps>

00102109 <vector69>:
.globl vector69
vector69:
  pushl $0
  102109:	6a 00                	push   $0x0
  pushl $69
  10210b:	6a 45                	push   $0x45
  jmp __alltraps
  10210d:	e9 76 fd ff ff       	jmp    101e88 <__alltraps>

00102112 <vector70>:
.globl vector70
vector70:
  pushl $0
  102112:	6a 00                	push   $0x0
  pushl $70
  102114:	6a 46                	push   $0x46
  jmp __alltraps
  102116:	e9 6d fd ff ff       	jmp    101e88 <__alltraps>

0010211b <vector71>:
.globl vector71
vector71:
  pushl $0
  10211b:	6a 00                	push   $0x0
  pushl $71
  10211d:	6a 47                	push   $0x47
  jmp __alltraps
  10211f:	e9 64 fd ff ff       	jmp    101e88 <__alltraps>

00102124 <vector72>:
.globl vector72
vector72:
  pushl $0
  102124:	6a 00                	push   $0x0
  pushl $72
  102126:	6a 48                	push   $0x48
  jmp __alltraps
  102128:	e9 5b fd ff ff       	jmp    101e88 <__alltraps>

0010212d <vector73>:
.globl vector73
vector73:
  pushl $0
  10212d:	6a 00                	push   $0x0
  pushl $73
  10212f:	6a 49                	push   $0x49
  jmp __alltraps
  102131:	e9 52 fd ff ff       	jmp    101e88 <__alltraps>

00102136 <vector74>:
.globl vector74
vector74:
  pushl $0
  102136:	6a 00                	push   $0x0
  pushl $74
  102138:	6a 4a                	push   $0x4a
  jmp __alltraps
  10213a:	e9 49 fd ff ff       	jmp    101e88 <__alltraps>

0010213f <vector75>:
.globl vector75
vector75:
  pushl $0
  10213f:	6a 00                	push   $0x0
  pushl $75
  102141:	6a 4b                	push   $0x4b
  jmp __alltraps
  102143:	e9 40 fd ff ff       	jmp    101e88 <__alltraps>

00102148 <vector76>:
.globl vector76
vector76:
  pushl $0
  102148:	6a 00                	push   $0x0
  pushl $76
  10214a:	6a 4c                	push   $0x4c
  jmp __alltraps
  10214c:	e9 37 fd ff ff       	jmp    101e88 <__alltraps>

00102151 <vector77>:
.globl vector77
vector77:
  pushl $0
  102151:	6a 00                	push   $0x0
  pushl $77
  102153:	6a 4d                	push   $0x4d
  jmp __alltraps
  102155:	e9 2e fd ff ff       	jmp    101e88 <__alltraps>

0010215a <vector78>:
.globl vector78
vector78:
  pushl $0
  10215a:	6a 00                	push   $0x0
  pushl $78
  10215c:	6a 4e                	push   $0x4e
  jmp __alltraps
  10215e:	e9 25 fd ff ff       	jmp    101e88 <__alltraps>

00102163 <vector79>:
.globl vector79
vector79:
  pushl $0
  102163:	6a 00                	push   $0x0
  pushl $79
  102165:	6a 4f                	push   $0x4f
  jmp __alltraps
  102167:	e9 1c fd ff ff       	jmp    101e88 <__alltraps>

0010216c <vector80>:
.globl vector80
vector80:
  pushl $0
  10216c:	6a 00                	push   $0x0
  pushl $80
  10216e:	6a 50                	push   $0x50
  jmp __alltraps
  102170:	e9 13 fd ff ff       	jmp    101e88 <__alltraps>

00102175 <vector81>:
.globl vector81
vector81:
  pushl $0
  102175:	6a 00                	push   $0x0
  pushl $81
  102177:	6a 51                	push   $0x51
  jmp __alltraps
  102179:	e9 0a fd ff ff       	jmp    101e88 <__alltraps>

0010217e <vector82>:
.globl vector82
vector82:
  pushl $0
  10217e:	6a 00                	push   $0x0
  pushl $82
  102180:	6a 52                	push   $0x52
  jmp __alltraps
  102182:	e9 01 fd ff ff       	jmp    101e88 <__alltraps>

00102187 <vector83>:
.globl vector83
vector83:
  pushl $0
  102187:	6a 00                	push   $0x0
  pushl $83
  102189:	6a 53                	push   $0x53
  jmp __alltraps
  10218b:	e9 f8 fc ff ff       	jmp    101e88 <__alltraps>

00102190 <vector84>:
.globl vector84
vector84:
  pushl $0
  102190:	6a 00                	push   $0x0
  pushl $84
  102192:	6a 54                	push   $0x54
  jmp __alltraps
  102194:	e9 ef fc ff ff       	jmp    101e88 <__alltraps>

00102199 <vector85>:
.globl vector85
vector85:
  pushl $0
  102199:	6a 00                	push   $0x0
  pushl $85
  10219b:	6a 55                	push   $0x55
  jmp __alltraps
  10219d:	e9 e6 fc ff ff       	jmp    101e88 <__alltraps>

001021a2 <vector86>:
.globl vector86
vector86:
  pushl $0
  1021a2:	6a 00                	push   $0x0
  pushl $86
  1021a4:	6a 56                	push   $0x56
  jmp __alltraps
  1021a6:	e9 dd fc ff ff       	jmp    101e88 <__alltraps>

001021ab <vector87>:
.globl vector87
vector87:
  pushl $0
  1021ab:	6a 00                	push   $0x0
  pushl $87
  1021ad:	6a 57                	push   $0x57
  jmp __alltraps
  1021af:	e9 d4 fc ff ff       	jmp    101e88 <__alltraps>

001021b4 <vector88>:
.globl vector88
vector88:
  pushl $0
  1021b4:	6a 00                	push   $0x0
  pushl $88
  1021b6:	6a 58                	push   $0x58
  jmp __alltraps
  1021b8:	e9 cb fc ff ff       	jmp    101e88 <__alltraps>

001021bd <vector89>:
.globl vector89
vector89:
  pushl $0
  1021bd:	6a 00                	push   $0x0
  pushl $89
  1021bf:	6a 59                	push   $0x59
  jmp __alltraps
  1021c1:	e9 c2 fc ff ff       	jmp    101e88 <__alltraps>

001021c6 <vector90>:
.globl vector90
vector90:
  pushl $0
  1021c6:	6a 00                	push   $0x0
  pushl $90
  1021c8:	6a 5a                	push   $0x5a
  jmp __alltraps
  1021ca:	e9 b9 fc ff ff       	jmp    101e88 <__alltraps>

001021cf <vector91>:
.globl vector91
vector91:
  pushl $0
  1021cf:	6a 00                	push   $0x0
  pushl $91
  1021d1:	6a 5b                	push   $0x5b
  jmp __alltraps
  1021d3:	e9 b0 fc ff ff       	jmp    101e88 <__alltraps>

001021d8 <vector92>:
.globl vector92
vector92:
  pushl $0
  1021d8:	6a 00                	push   $0x0
  pushl $92
  1021da:	6a 5c                	push   $0x5c
  jmp __alltraps
  1021dc:	e9 a7 fc ff ff       	jmp    101e88 <__alltraps>

001021e1 <vector93>:
.globl vector93
vector93:
  pushl $0
  1021e1:	6a 00                	push   $0x0
  pushl $93
  1021e3:	6a 5d                	push   $0x5d
  jmp __alltraps
  1021e5:	e9 9e fc ff ff       	jmp    101e88 <__alltraps>

001021ea <vector94>:
.globl vector94
vector94:
  pushl $0
  1021ea:	6a 00                	push   $0x0
  pushl $94
  1021ec:	6a 5e                	push   $0x5e
  jmp __alltraps
  1021ee:	e9 95 fc ff ff       	jmp    101e88 <__alltraps>

001021f3 <vector95>:
.globl vector95
vector95:
  pushl $0
  1021f3:	6a 00                	push   $0x0
  pushl $95
  1021f5:	6a 5f                	push   $0x5f
  jmp __alltraps
  1021f7:	e9 8c fc ff ff       	jmp    101e88 <__alltraps>

001021fc <vector96>:
.globl vector96
vector96:
  pushl $0
  1021fc:	6a 00                	push   $0x0
  pushl $96
  1021fe:	6a 60                	push   $0x60
  jmp __alltraps
  102200:	e9 83 fc ff ff       	jmp    101e88 <__alltraps>

00102205 <vector97>:
.globl vector97
vector97:
  pushl $0
  102205:	6a 00                	push   $0x0
  pushl $97
  102207:	6a 61                	push   $0x61
  jmp __alltraps
  102209:	e9 7a fc ff ff       	jmp    101e88 <__alltraps>

0010220e <vector98>:
.globl vector98
vector98:
  pushl $0
  10220e:	6a 00                	push   $0x0
  pushl $98
  102210:	6a 62                	push   $0x62
  jmp __alltraps
  102212:	e9 71 fc ff ff       	jmp    101e88 <__alltraps>

00102217 <vector99>:
.globl vector99
vector99:
  pushl $0
  102217:	6a 00                	push   $0x0
  pushl $99
  102219:	6a 63                	push   $0x63
  jmp __alltraps
  10221b:	e9 68 fc ff ff       	jmp    101e88 <__alltraps>

00102220 <vector100>:
.globl vector100
vector100:
  pushl $0
  102220:	6a 00                	push   $0x0
  pushl $100
  102222:	6a 64                	push   $0x64
  jmp __alltraps
  102224:	e9 5f fc ff ff       	jmp    101e88 <__alltraps>

00102229 <vector101>:
.globl vector101
vector101:
  pushl $0
  102229:	6a 00                	push   $0x0
  pushl $101
  10222b:	6a 65                	push   $0x65
  jmp __alltraps
  10222d:	e9 56 fc ff ff       	jmp    101e88 <__alltraps>

00102232 <vector102>:
.globl vector102
vector102:
  pushl $0
  102232:	6a 00                	push   $0x0
  pushl $102
  102234:	6a 66                	push   $0x66
  jmp __alltraps
  102236:	e9 4d fc ff ff       	jmp    101e88 <__alltraps>

0010223b <vector103>:
.globl vector103
vector103:
  pushl $0
  10223b:	6a 00                	push   $0x0
  pushl $103
  10223d:	6a 67                	push   $0x67
  jmp __alltraps
  10223f:	e9 44 fc ff ff       	jmp    101e88 <__alltraps>

00102244 <vector104>:
.globl vector104
vector104:
  pushl $0
  102244:	6a 00                	push   $0x0
  pushl $104
  102246:	6a 68                	push   $0x68
  jmp __alltraps
  102248:	e9 3b fc ff ff       	jmp    101e88 <__alltraps>

0010224d <vector105>:
.globl vector105
vector105:
  pushl $0
  10224d:	6a 00                	push   $0x0
  pushl $105
  10224f:	6a 69                	push   $0x69
  jmp __alltraps
  102251:	e9 32 fc ff ff       	jmp    101e88 <__alltraps>

00102256 <vector106>:
.globl vector106
vector106:
  pushl $0
  102256:	6a 00                	push   $0x0
  pushl $106
  102258:	6a 6a                	push   $0x6a
  jmp __alltraps
  10225a:	e9 29 fc ff ff       	jmp    101e88 <__alltraps>

0010225f <vector107>:
.globl vector107
vector107:
  pushl $0
  10225f:	6a 00                	push   $0x0
  pushl $107
  102261:	6a 6b                	push   $0x6b
  jmp __alltraps
  102263:	e9 20 fc ff ff       	jmp    101e88 <__alltraps>

00102268 <vector108>:
.globl vector108
vector108:
  pushl $0
  102268:	6a 00                	push   $0x0
  pushl $108
  10226a:	6a 6c                	push   $0x6c
  jmp __alltraps
  10226c:	e9 17 fc ff ff       	jmp    101e88 <__alltraps>

00102271 <vector109>:
.globl vector109
vector109:
  pushl $0
  102271:	6a 00                	push   $0x0
  pushl $109
  102273:	6a 6d                	push   $0x6d
  jmp __alltraps
  102275:	e9 0e fc ff ff       	jmp    101e88 <__alltraps>

0010227a <vector110>:
.globl vector110
vector110:
  pushl $0
  10227a:	6a 00                	push   $0x0
  pushl $110
  10227c:	6a 6e                	push   $0x6e
  jmp __alltraps
  10227e:	e9 05 fc ff ff       	jmp    101e88 <__alltraps>

00102283 <vector111>:
.globl vector111
vector111:
  pushl $0
  102283:	6a 00                	push   $0x0
  pushl $111
  102285:	6a 6f                	push   $0x6f
  jmp __alltraps
  102287:	e9 fc fb ff ff       	jmp    101e88 <__alltraps>

0010228c <vector112>:
.globl vector112
vector112:
  pushl $0
  10228c:	6a 00                	push   $0x0
  pushl $112
  10228e:	6a 70                	push   $0x70
  jmp __alltraps
  102290:	e9 f3 fb ff ff       	jmp    101e88 <__alltraps>

00102295 <vector113>:
.globl vector113
vector113:
  pushl $0
  102295:	6a 00                	push   $0x0
  pushl $113
  102297:	6a 71                	push   $0x71
  jmp __alltraps
  102299:	e9 ea fb ff ff       	jmp    101e88 <__alltraps>

0010229e <vector114>:
.globl vector114
vector114:
  pushl $0
  10229e:	6a 00                	push   $0x0
  pushl $114
  1022a0:	6a 72                	push   $0x72
  jmp __alltraps
  1022a2:	e9 e1 fb ff ff       	jmp    101e88 <__alltraps>

001022a7 <vector115>:
.globl vector115
vector115:
  pushl $0
  1022a7:	6a 00                	push   $0x0
  pushl $115
  1022a9:	6a 73                	push   $0x73
  jmp __alltraps
  1022ab:	e9 d8 fb ff ff       	jmp    101e88 <__alltraps>

001022b0 <vector116>:
.globl vector116
vector116:
  pushl $0
  1022b0:	6a 00                	push   $0x0
  pushl $116
  1022b2:	6a 74                	push   $0x74
  jmp __alltraps
  1022b4:	e9 cf fb ff ff       	jmp    101e88 <__alltraps>

001022b9 <vector117>:
.globl vector117
vector117:
  pushl $0
  1022b9:	6a 00                	push   $0x0
  pushl $117
  1022bb:	6a 75                	push   $0x75
  jmp __alltraps
  1022bd:	e9 c6 fb ff ff       	jmp    101e88 <__alltraps>

001022c2 <vector118>:
.globl vector118
vector118:
  pushl $0
  1022c2:	6a 00                	push   $0x0
  pushl $118
  1022c4:	6a 76                	push   $0x76
  jmp __alltraps
  1022c6:	e9 bd fb ff ff       	jmp    101e88 <__alltraps>

001022cb <vector119>:
.globl vector119
vector119:
  pushl $0
  1022cb:	6a 00                	push   $0x0
  pushl $119
  1022cd:	6a 77                	push   $0x77
  jmp __alltraps
  1022cf:	e9 b4 fb ff ff       	jmp    101e88 <__alltraps>

001022d4 <vector120>:
.globl vector120
vector120:
  pushl $0
  1022d4:	6a 00                	push   $0x0
  pushl $120
  1022d6:	6a 78                	push   $0x78
  jmp __alltraps
  1022d8:	e9 ab fb ff ff       	jmp    101e88 <__alltraps>

001022dd <vector121>:
.globl vector121
vector121:
  pushl $0
  1022dd:	6a 00                	push   $0x0
  pushl $121
  1022df:	6a 79                	push   $0x79
  jmp __alltraps
  1022e1:	e9 a2 fb ff ff       	jmp    101e88 <__alltraps>

001022e6 <vector122>:
.globl vector122
vector122:
  pushl $0
  1022e6:	6a 00                	push   $0x0
  pushl $122
  1022e8:	6a 7a                	push   $0x7a
  jmp __alltraps
  1022ea:	e9 99 fb ff ff       	jmp    101e88 <__alltraps>

001022ef <vector123>:
.globl vector123
vector123:
  pushl $0
  1022ef:	6a 00                	push   $0x0
  pushl $123
  1022f1:	6a 7b                	push   $0x7b
  jmp __alltraps
  1022f3:	e9 90 fb ff ff       	jmp    101e88 <__alltraps>

001022f8 <vector124>:
.globl vector124
vector124:
  pushl $0
  1022f8:	6a 00                	push   $0x0
  pushl $124
  1022fa:	6a 7c                	push   $0x7c
  jmp __alltraps
  1022fc:	e9 87 fb ff ff       	jmp    101e88 <__alltraps>

00102301 <vector125>:
.globl vector125
vector125:
  pushl $0
  102301:	6a 00                	push   $0x0
  pushl $125
  102303:	6a 7d                	push   $0x7d
  jmp __alltraps
  102305:	e9 7e fb ff ff       	jmp    101e88 <__alltraps>

0010230a <vector126>:
.globl vector126
vector126:
  pushl $0
  10230a:	6a 00                	push   $0x0
  pushl $126
  10230c:	6a 7e                	push   $0x7e
  jmp __alltraps
  10230e:	e9 75 fb ff ff       	jmp    101e88 <__alltraps>

00102313 <vector127>:
.globl vector127
vector127:
  pushl $0
  102313:	6a 00                	push   $0x0
  pushl $127
  102315:	6a 7f                	push   $0x7f
  jmp __alltraps
  102317:	e9 6c fb ff ff       	jmp    101e88 <__alltraps>

0010231c <vector128>:
.globl vector128
vector128:
  pushl $0
  10231c:	6a 00                	push   $0x0
  pushl $128
  10231e:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102323:	e9 60 fb ff ff       	jmp    101e88 <__alltraps>

00102328 <vector129>:
.globl vector129
vector129:
  pushl $0
  102328:	6a 00                	push   $0x0
  pushl $129
  10232a:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  10232f:	e9 54 fb ff ff       	jmp    101e88 <__alltraps>

00102334 <vector130>:
.globl vector130
vector130:
  pushl $0
  102334:	6a 00                	push   $0x0
  pushl $130
  102336:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  10233b:	e9 48 fb ff ff       	jmp    101e88 <__alltraps>

00102340 <vector131>:
.globl vector131
vector131:
  pushl $0
  102340:	6a 00                	push   $0x0
  pushl $131
  102342:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  102347:	e9 3c fb ff ff       	jmp    101e88 <__alltraps>

0010234c <vector132>:
.globl vector132
vector132:
  pushl $0
  10234c:	6a 00                	push   $0x0
  pushl $132
  10234e:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  102353:	e9 30 fb ff ff       	jmp    101e88 <__alltraps>

00102358 <vector133>:
.globl vector133
vector133:
  pushl $0
  102358:	6a 00                	push   $0x0
  pushl $133
  10235a:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  10235f:	e9 24 fb ff ff       	jmp    101e88 <__alltraps>

00102364 <vector134>:
.globl vector134
vector134:
  pushl $0
  102364:	6a 00                	push   $0x0
  pushl $134
  102366:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  10236b:	e9 18 fb ff ff       	jmp    101e88 <__alltraps>

00102370 <vector135>:
.globl vector135
vector135:
  pushl $0
  102370:	6a 00                	push   $0x0
  pushl $135
  102372:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  102377:	e9 0c fb ff ff       	jmp    101e88 <__alltraps>

0010237c <vector136>:
.globl vector136
vector136:
  pushl $0
  10237c:	6a 00                	push   $0x0
  pushl $136
  10237e:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  102383:	e9 00 fb ff ff       	jmp    101e88 <__alltraps>

00102388 <vector137>:
.globl vector137
vector137:
  pushl $0
  102388:	6a 00                	push   $0x0
  pushl $137
  10238a:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  10238f:	e9 f4 fa ff ff       	jmp    101e88 <__alltraps>

00102394 <vector138>:
.globl vector138
vector138:
  pushl $0
  102394:	6a 00                	push   $0x0
  pushl $138
  102396:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  10239b:	e9 e8 fa ff ff       	jmp    101e88 <__alltraps>

001023a0 <vector139>:
.globl vector139
vector139:
  pushl $0
  1023a0:	6a 00                	push   $0x0
  pushl $139
  1023a2:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  1023a7:	e9 dc fa ff ff       	jmp    101e88 <__alltraps>

001023ac <vector140>:
.globl vector140
vector140:
  pushl $0
  1023ac:	6a 00                	push   $0x0
  pushl $140
  1023ae:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1023b3:	e9 d0 fa ff ff       	jmp    101e88 <__alltraps>

001023b8 <vector141>:
.globl vector141
vector141:
  pushl $0
  1023b8:	6a 00                	push   $0x0
  pushl $141
  1023ba:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1023bf:	e9 c4 fa ff ff       	jmp    101e88 <__alltraps>

001023c4 <vector142>:
.globl vector142
vector142:
  pushl $0
  1023c4:	6a 00                	push   $0x0
  pushl $142
  1023c6:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1023cb:	e9 b8 fa ff ff       	jmp    101e88 <__alltraps>

001023d0 <vector143>:
.globl vector143
vector143:
  pushl $0
  1023d0:	6a 00                	push   $0x0
  pushl $143
  1023d2:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1023d7:	e9 ac fa ff ff       	jmp    101e88 <__alltraps>

001023dc <vector144>:
.globl vector144
vector144:
  pushl $0
  1023dc:	6a 00                	push   $0x0
  pushl $144
  1023de:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1023e3:	e9 a0 fa ff ff       	jmp    101e88 <__alltraps>

001023e8 <vector145>:
.globl vector145
vector145:
  pushl $0
  1023e8:	6a 00                	push   $0x0
  pushl $145
  1023ea:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  1023ef:	e9 94 fa ff ff       	jmp    101e88 <__alltraps>

001023f4 <vector146>:
.globl vector146
vector146:
  pushl $0
  1023f4:	6a 00                	push   $0x0
  pushl $146
  1023f6:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  1023fb:	e9 88 fa ff ff       	jmp    101e88 <__alltraps>

00102400 <vector147>:
.globl vector147
vector147:
  pushl $0
  102400:	6a 00                	push   $0x0
  pushl $147
  102402:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  102407:	e9 7c fa ff ff       	jmp    101e88 <__alltraps>

0010240c <vector148>:
.globl vector148
vector148:
  pushl $0
  10240c:	6a 00                	push   $0x0
  pushl $148
  10240e:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  102413:	e9 70 fa ff ff       	jmp    101e88 <__alltraps>

00102418 <vector149>:
.globl vector149
vector149:
  pushl $0
  102418:	6a 00                	push   $0x0
  pushl $149
  10241a:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  10241f:	e9 64 fa ff ff       	jmp    101e88 <__alltraps>

00102424 <vector150>:
.globl vector150
vector150:
  pushl $0
  102424:	6a 00                	push   $0x0
  pushl $150
  102426:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  10242b:	e9 58 fa ff ff       	jmp    101e88 <__alltraps>

00102430 <vector151>:
.globl vector151
vector151:
  pushl $0
  102430:	6a 00                	push   $0x0
  pushl $151
  102432:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102437:	e9 4c fa ff ff       	jmp    101e88 <__alltraps>

0010243c <vector152>:
.globl vector152
vector152:
  pushl $0
  10243c:	6a 00                	push   $0x0
  pushl $152
  10243e:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  102443:	e9 40 fa ff ff       	jmp    101e88 <__alltraps>

00102448 <vector153>:
.globl vector153
vector153:
  pushl $0
  102448:	6a 00                	push   $0x0
  pushl $153
  10244a:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  10244f:	e9 34 fa ff ff       	jmp    101e88 <__alltraps>

00102454 <vector154>:
.globl vector154
vector154:
  pushl $0
  102454:	6a 00                	push   $0x0
  pushl $154
  102456:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  10245b:	e9 28 fa ff ff       	jmp    101e88 <__alltraps>

00102460 <vector155>:
.globl vector155
vector155:
  pushl $0
  102460:	6a 00                	push   $0x0
  pushl $155
  102462:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  102467:	e9 1c fa ff ff       	jmp    101e88 <__alltraps>

0010246c <vector156>:
.globl vector156
vector156:
  pushl $0
  10246c:	6a 00                	push   $0x0
  pushl $156
  10246e:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  102473:	e9 10 fa ff ff       	jmp    101e88 <__alltraps>

00102478 <vector157>:
.globl vector157
vector157:
  pushl $0
  102478:	6a 00                	push   $0x0
  pushl $157
  10247a:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  10247f:	e9 04 fa ff ff       	jmp    101e88 <__alltraps>

00102484 <vector158>:
.globl vector158
vector158:
  pushl $0
  102484:	6a 00                	push   $0x0
  pushl $158
  102486:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  10248b:	e9 f8 f9 ff ff       	jmp    101e88 <__alltraps>

00102490 <vector159>:
.globl vector159
vector159:
  pushl $0
  102490:	6a 00                	push   $0x0
  pushl $159
  102492:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  102497:	e9 ec f9 ff ff       	jmp    101e88 <__alltraps>

0010249c <vector160>:
.globl vector160
vector160:
  pushl $0
  10249c:	6a 00                	push   $0x0
  pushl $160
  10249e:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  1024a3:	e9 e0 f9 ff ff       	jmp    101e88 <__alltraps>

001024a8 <vector161>:
.globl vector161
vector161:
  pushl $0
  1024a8:	6a 00                	push   $0x0
  pushl $161
  1024aa:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1024af:	e9 d4 f9 ff ff       	jmp    101e88 <__alltraps>

001024b4 <vector162>:
.globl vector162
vector162:
  pushl $0
  1024b4:	6a 00                	push   $0x0
  pushl $162
  1024b6:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1024bb:	e9 c8 f9 ff ff       	jmp    101e88 <__alltraps>

001024c0 <vector163>:
.globl vector163
vector163:
  pushl $0
  1024c0:	6a 00                	push   $0x0
  pushl $163
  1024c2:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1024c7:	e9 bc f9 ff ff       	jmp    101e88 <__alltraps>

001024cc <vector164>:
.globl vector164
vector164:
  pushl $0
  1024cc:	6a 00                	push   $0x0
  pushl $164
  1024ce:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1024d3:	e9 b0 f9 ff ff       	jmp    101e88 <__alltraps>

001024d8 <vector165>:
.globl vector165
vector165:
  pushl $0
  1024d8:	6a 00                	push   $0x0
  pushl $165
  1024da:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1024df:	e9 a4 f9 ff ff       	jmp    101e88 <__alltraps>

001024e4 <vector166>:
.globl vector166
vector166:
  pushl $0
  1024e4:	6a 00                	push   $0x0
  pushl $166
  1024e6:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  1024eb:	e9 98 f9 ff ff       	jmp    101e88 <__alltraps>

001024f0 <vector167>:
.globl vector167
vector167:
  pushl $0
  1024f0:	6a 00                	push   $0x0
  pushl $167
  1024f2:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  1024f7:	e9 8c f9 ff ff       	jmp    101e88 <__alltraps>

001024fc <vector168>:
.globl vector168
vector168:
  pushl $0
  1024fc:	6a 00                	push   $0x0
  pushl $168
  1024fe:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  102503:	e9 80 f9 ff ff       	jmp    101e88 <__alltraps>

00102508 <vector169>:
.globl vector169
vector169:
  pushl $0
  102508:	6a 00                	push   $0x0
  pushl $169
  10250a:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  10250f:	e9 74 f9 ff ff       	jmp    101e88 <__alltraps>

00102514 <vector170>:
.globl vector170
vector170:
  pushl $0
  102514:	6a 00                	push   $0x0
  pushl $170
  102516:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  10251b:	e9 68 f9 ff ff       	jmp    101e88 <__alltraps>

00102520 <vector171>:
.globl vector171
vector171:
  pushl $0
  102520:	6a 00                	push   $0x0
  pushl $171
  102522:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102527:	e9 5c f9 ff ff       	jmp    101e88 <__alltraps>

0010252c <vector172>:
.globl vector172
vector172:
  pushl $0
  10252c:	6a 00                	push   $0x0
  pushl $172
  10252e:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102533:	e9 50 f9 ff ff       	jmp    101e88 <__alltraps>

00102538 <vector173>:
.globl vector173
vector173:
  pushl $0
  102538:	6a 00                	push   $0x0
  pushl $173
  10253a:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  10253f:	e9 44 f9 ff ff       	jmp    101e88 <__alltraps>

00102544 <vector174>:
.globl vector174
vector174:
  pushl $0
  102544:	6a 00                	push   $0x0
  pushl $174
  102546:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  10254b:	e9 38 f9 ff ff       	jmp    101e88 <__alltraps>

00102550 <vector175>:
.globl vector175
vector175:
  pushl $0
  102550:	6a 00                	push   $0x0
  pushl $175
  102552:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  102557:	e9 2c f9 ff ff       	jmp    101e88 <__alltraps>

0010255c <vector176>:
.globl vector176
vector176:
  pushl $0
  10255c:	6a 00                	push   $0x0
  pushl $176
  10255e:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  102563:	e9 20 f9 ff ff       	jmp    101e88 <__alltraps>

00102568 <vector177>:
.globl vector177
vector177:
  pushl $0
  102568:	6a 00                	push   $0x0
  pushl $177
  10256a:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  10256f:	e9 14 f9 ff ff       	jmp    101e88 <__alltraps>

00102574 <vector178>:
.globl vector178
vector178:
  pushl $0
  102574:	6a 00                	push   $0x0
  pushl $178
  102576:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  10257b:	e9 08 f9 ff ff       	jmp    101e88 <__alltraps>

00102580 <vector179>:
.globl vector179
vector179:
  pushl $0
  102580:	6a 00                	push   $0x0
  pushl $179
  102582:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  102587:	e9 fc f8 ff ff       	jmp    101e88 <__alltraps>

0010258c <vector180>:
.globl vector180
vector180:
  pushl $0
  10258c:	6a 00                	push   $0x0
  pushl $180
  10258e:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  102593:	e9 f0 f8 ff ff       	jmp    101e88 <__alltraps>

00102598 <vector181>:
.globl vector181
vector181:
  pushl $0
  102598:	6a 00                	push   $0x0
  pushl $181
  10259a:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  10259f:	e9 e4 f8 ff ff       	jmp    101e88 <__alltraps>

001025a4 <vector182>:
.globl vector182
vector182:
  pushl $0
  1025a4:	6a 00                	push   $0x0
  pushl $182
  1025a6:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1025ab:	e9 d8 f8 ff ff       	jmp    101e88 <__alltraps>

001025b0 <vector183>:
.globl vector183
vector183:
  pushl $0
  1025b0:	6a 00                	push   $0x0
  pushl $183
  1025b2:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  1025b7:	e9 cc f8 ff ff       	jmp    101e88 <__alltraps>

001025bc <vector184>:
.globl vector184
vector184:
  pushl $0
  1025bc:	6a 00                	push   $0x0
  pushl $184
  1025be:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1025c3:	e9 c0 f8 ff ff       	jmp    101e88 <__alltraps>

001025c8 <vector185>:
.globl vector185
vector185:
  pushl $0
  1025c8:	6a 00                	push   $0x0
  pushl $185
  1025ca:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1025cf:	e9 b4 f8 ff ff       	jmp    101e88 <__alltraps>

001025d4 <vector186>:
.globl vector186
vector186:
  pushl $0
  1025d4:	6a 00                	push   $0x0
  pushl $186
  1025d6:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1025db:	e9 a8 f8 ff ff       	jmp    101e88 <__alltraps>

001025e0 <vector187>:
.globl vector187
vector187:
  pushl $0
  1025e0:	6a 00                	push   $0x0
  pushl $187
  1025e2:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  1025e7:	e9 9c f8 ff ff       	jmp    101e88 <__alltraps>

001025ec <vector188>:
.globl vector188
vector188:
  pushl $0
  1025ec:	6a 00                	push   $0x0
  pushl $188
  1025ee:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  1025f3:	e9 90 f8 ff ff       	jmp    101e88 <__alltraps>

001025f8 <vector189>:
.globl vector189
vector189:
  pushl $0
  1025f8:	6a 00                	push   $0x0
  pushl $189
  1025fa:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  1025ff:	e9 84 f8 ff ff       	jmp    101e88 <__alltraps>

00102604 <vector190>:
.globl vector190
vector190:
  pushl $0
  102604:	6a 00                	push   $0x0
  pushl $190
  102606:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  10260b:	e9 78 f8 ff ff       	jmp    101e88 <__alltraps>

00102610 <vector191>:
.globl vector191
vector191:
  pushl $0
  102610:	6a 00                	push   $0x0
  pushl $191
  102612:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  102617:	e9 6c f8 ff ff       	jmp    101e88 <__alltraps>

0010261c <vector192>:
.globl vector192
vector192:
  pushl $0
  10261c:	6a 00                	push   $0x0
  pushl $192
  10261e:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102623:	e9 60 f8 ff ff       	jmp    101e88 <__alltraps>

00102628 <vector193>:
.globl vector193
vector193:
  pushl $0
  102628:	6a 00                	push   $0x0
  pushl $193
  10262a:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  10262f:	e9 54 f8 ff ff       	jmp    101e88 <__alltraps>

00102634 <vector194>:
.globl vector194
vector194:
  pushl $0
  102634:	6a 00                	push   $0x0
  pushl $194
  102636:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  10263b:	e9 48 f8 ff ff       	jmp    101e88 <__alltraps>

00102640 <vector195>:
.globl vector195
vector195:
  pushl $0
  102640:	6a 00                	push   $0x0
  pushl $195
  102642:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102647:	e9 3c f8 ff ff       	jmp    101e88 <__alltraps>

0010264c <vector196>:
.globl vector196
vector196:
  pushl $0
  10264c:	6a 00                	push   $0x0
  pushl $196
  10264e:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  102653:	e9 30 f8 ff ff       	jmp    101e88 <__alltraps>

00102658 <vector197>:
.globl vector197
vector197:
  pushl $0
  102658:	6a 00                	push   $0x0
  pushl $197
  10265a:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  10265f:	e9 24 f8 ff ff       	jmp    101e88 <__alltraps>

00102664 <vector198>:
.globl vector198
vector198:
  pushl $0
  102664:	6a 00                	push   $0x0
  pushl $198
  102666:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  10266b:	e9 18 f8 ff ff       	jmp    101e88 <__alltraps>

00102670 <vector199>:
.globl vector199
vector199:
  pushl $0
  102670:	6a 00                	push   $0x0
  pushl $199
  102672:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  102677:	e9 0c f8 ff ff       	jmp    101e88 <__alltraps>

0010267c <vector200>:
.globl vector200
vector200:
  pushl $0
  10267c:	6a 00                	push   $0x0
  pushl $200
  10267e:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  102683:	e9 00 f8 ff ff       	jmp    101e88 <__alltraps>

00102688 <vector201>:
.globl vector201
vector201:
  pushl $0
  102688:	6a 00                	push   $0x0
  pushl $201
  10268a:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  10268f:	e9 f4 f7 ff ff       	jmp    101e88 <__alltraps>

00102694 <vector202>:
.globl vector202
vector202:
  pushl $0
  102694:	6a 00                	push   $0x0
  pushl $202
  102696:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  10269b:	e9 e8 f7 ff ff       	jmp    101e88 <__alltraps>

001026a0 <vector203>:
.globl vector203
vector203:
  pushl $0
  1026a0:	6a 00                	push   $0x0
  pushl $203
  1026a2:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  1026a7:	e9 dc f7 ff ff       	jmp    101e88 <__alltraps>

001026ac <vector204>:
.globl vector204
vector204:
  pushl $0
  1026ac:	6a 00                	push   $0x0
  pushl $204
  1026ae:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  1026b3:	e9 d0 f7 ff ff       	jmp    101e88 <__alltraps>

001026b8 <vector205>:
.globl vector205
vector205:
  pushl $0
  1026b8:	6a 00                	push   $0x0
  pushl $205
  1026ba:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1026bf:	e9 c4 f7 ff ff       	jmp    101e88 <__alltraps>

001026c4 <vector206>:
.globl vector206
vector206:
  pushl $0
  1026c4:	6a 00                	push   $0x0
  pushl $206
  1026c6:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1026cb:	e9 b8 f7 ff ff       	jmp    101e88 <__alltraps>

001026d0 <vector207>:
.globl vector207
vector207:
  pushl $0
  1026d0:	6a 00                	push   $0x0
  pushl $207
  1026d2:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1026d7:	e9 ac f7 ff ff       	jmp    101e88 <__alltraps>

001026dc <vector208>:
.globl vector208
vector208:
  pushl $0
  1026dc:	6a 00                	push   $0x0
  pushl $208
  1026de:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1026e3:	e9 a0 f7 ff ff       	jmp    101e88 <__alltraps>

001026e8 <vector209>:
.globl vector209
vector209:
  pushl $0
  1026e8:	6a 00                	push   $0x0
  pushl $209
  1026ea:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  1026ef:	e9 94 f7 ff ff       	jmp    101e88 <__alltraps>

001026f4 <vector210>:
.globl vector210
vector210:
  pushl $0
  1026f4:	6a 00                	push   $0x0
  pushl $210
  1026f6:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  1026fb:	e9 88 f7 ff ff       	jmp    101e88 <__alltraps>

00102700 <vector211>:
.globl vector211
vector211:
  pushl $0
  102700:	6a 00                	push   $0x0
  pushl $211
  102702:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  102707:	e9 7c f7 ff ff       	jmp    101e88 <__alltraps>

0010270c <vector212>:
.globl vector212
vector212:
  pushl $0
  10270c:	6a 00                	push   $0x0
  pushl $212
  10270e:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102713:	e9 70 f7 ff ff       	jmp    101e88 <__alltraps>

00102718 <vector213>:
.globl vector213
vector213:
  pushl $0
  102718:	6a 00                	push   $0x0
  pushl $213
  10271a:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  10271f:	e9 64 f7 ff ff       	jmp    101e88 <__alltraps>

00102724 <vector214>:
.globl vector214
vector214:
  pushl $0
  102724:	6a 00                	push   $0x0
  pushl $214
  102726:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  10272b:	e9 58 f7 ff ff       	jmp    101e88 <__alltraps>

00102730 <vector215>:
.globl vector215
vector215:
  pushl $0
  102730:	6a 00                	push   $0x0
  pushl $215
  102732:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102737:	e9 4c f7 ff ff       	jmp    101e88 <__alltraps>

0010273c <vector216>:
.globl vector216
vector216:
  pushl $0
  10273c:	6a 00                	push   $0x0
  pushl $216
  10273e:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102743:	e9 40 f7 ff ff       	jmp    101e88 <__alltraps>

00102748 <vector217>:
.globl vector217
vector217:
  pushl $0
  102748:	6a 00                	push   $0x0
  pushl $217
  10274a:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  10274f:	e9 34 f7 ff ff       	jmp    101e88 <__alltraps>

00102754 <vector218>:
.globl vector218
vector218:
  pushl $0
  102754:	6a 00                	push   $0x0
  pushl $218
  102756:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  10275b:	e9 28 f7 ff ff       	jmp    101e88 <__alltraps>

00102760 <vector219>:
.globl vector219
vector219:
  pushl $0
  102760:	6a 00                	push   $0x0
  pushl $219
  102762:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102767:	e9 1c f7 ff ff       	jmp    101e88 <__alltraps>

0010276c <vector220>:
.globl vector220
vector220:
  pushl $0
  10276c:	6a 00                	push   $0x0
  pushl $220
  10276e:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  102773:	e9 10 f7 ff ff       	jmp    101e88 <__alltraps>

00102778 <vector221>:
.globl vector221
vector221:
  pushl $0
  102778:	6a 00                	push   $0x0
  pushl $221
  10277a:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  10277f:	e9 04 f7 ff ff       	jmp    101e88 <__alltraps>

00102784 <vector222>:
.globl vector222
vector222:
  pushl $0
  102784:	6a 00                	push   $0x0
  pushl $222
  102786:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  10278b:	e9 f8 f6 ff ff       	jmp    101e88 <__alltraps>

00102790 <vector223>:
.globl vector223
vector223:
  pushl $0
  102790:	6a 00                	push   $0x0
  pushl $223
  102792:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  102797:	e9 ec f6 ff ff       	jmp    101e88 <__alltraps>

0010279c <vector224>:
.globl vector224
vector224:
  pushl $0
  10279c:	6a 00                	push   $0x0
  pushl $224
  10279e:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  1027a3:	e9 e0 f6 ff ff       	jmp    101e88 <__alltraps>

001027a8 <vector225>:
.globl vector225
vector225:
  pushl $0
  1027a8:	6a 00                	push   $0x0
  pushl $225
  1027aa:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  1027af:	e9 d4 f6 ff ff       	jmp    101e88 <__alltraps>

001027b4 <vector226>:
.globl vector226
vector226:
  pushl $0
  1027b4:	6a 00                	push   $0x0
  pushl $226
  1027b6:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  1027bb:	e9 c8 f6 ff ff       	jmp    101e88 <__alltraps>

001027c0 <vector227>:
.globl vector227
vector227:
  pushl $0
  1027c0:	6a 00                	push   $0x0
  pushl $227
  1027c2:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1027c7:	e9 bc f6 ff ff       	jmp    101e88 <__alltraps>

001027cc <vector228>:
.globl vector228
vector228:
  pushl $0
  1027cc:	6a 00                	push   $0x0
  pushl $228
  1027ce:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  1027d3:	e9 b0 f6 ff ff       	jmp    101e88 <__alltraps>

001027d8 <vector229>:
.globl vector229
vector229:
  pushl $0
  1027d8:	6a 00                	push   $0x0
  pushl $229
  1027da:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1027df:	e9 a4 f6 ff ff       	jmp    101e88 <__alltraps>

001027e4 <vector230>:
.globl vector230
vector230:
  pushl $0
  1027e4:	6a 00                	push   $0x0
  pushl $230
  1027e6:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  1027eb:	e9 98 f6 ff ff       	jmp    101e88 <__alltraps>

001027f0 <vector231>:
.globl vector231
vector231:
  pushl $0
  1027f0:	6a 00                	push   $0x0
  pushl $231
  1027f2:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  1027f7:	e9 8c f6 ff ff       	jmp    101e88 <__alltraps>

001027fc <vector232>:
.globl vector232
vector232:
  pushl $0
  1027fc:	6a 00                	push   $0x0
  pushl $232
  1027fe:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102803:	e9 80 f6 ff ff       	jmp    101e88 <__alltraps>

00102808 <vector233>:
.globl vector233
vector233:
  pushl $0
  102808:	6a 00                	push   $0x0
  pushl $233
  10280a:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  10280f:	e9 74 f6 ff ff       	jmp    101e88 <__alltraps>

00102814 <vector234>:
.globl vector234
vector234:
  pushl $0
  102814:	6a 00                	push   $0x0
  pushl $234
  102816:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  10281b:	e9 68 f6 ff ff       	jmp    101e88 <__alltraps>

00102820 <vector235>:
.globl vector235
vector235:
  pushl $0
  102820:	6a 00                	push   $0x0
  pushl $235
  102822:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102827:	e9 5c f6 ff ff       	jmp    101e88 <__alltraps>

0010282c <vector236>:
.globl vector236
vector236:
  pushl $0
  10282c:	6a 00                	push   $0x0
  pushl $236
  10282e:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102833:	e9 50 f6 ff ff       	jmp    101e88 <__alltraps>

00102838 <vector237>:
.globl vector237
vector237:
  pushl $0
  102838:	6a 00                	push   $0x0
  pushl $237
  10283a:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  10283f:	e9 44 f6 ff ff       	jmp    101e88 <__alltraps>

00102844 <vector238>:
.globl vector238
vector238:
  pushl $0
  102844:	6a 00                	push   $0x0
  pushl $238
  102846:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  10284b:	e9 38 f6 ff ff       	jmp    101e88 <__alltraps>

00102850 <vector239>:
.globl vector239
vector239:
  pushl $0
  102850:	6a 00                	push   $0x0
  pushl $239
  102852:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102857:	e9 2c f6 ff ff       	jmp    101e88 <__alltraps>

0010285c <vector240>:
.globl vector240
vector240:
  pushl $0
  10285c:	6a 00                	push   $0x0
  pushl $240
  10285e:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  102863:	e9 20 f6 ff ff       	jmp    101e88 <__alltraps>

00102868 <vector241>:
.globl vector241
vector241:
  pushl $0
  102868:	6a 00                	push   $0x0
  pushl $241
  10286a:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  10286f:	e9 14 f6 ff ff       	jmp    101e88 <__alltraps>

00102874 <vector242>:
.globl vector242
vector242:
  pushl $0
  102874:	6a 00                	push   $0x0
  pushl $242
  102876:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  10287b:	e9 08 f6 ff ff       	jmp    101e88 <__alltraps>

00102880 <vector243>:
.globl vector243
vector243:
  pushl $0
  102880:	6a 00                	push   $0x0
  pushl $243
  102882:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  102887:	e9 fc f5 ff ff       	jmp    101e88 <__alltraps>

0010288c <vector244>:
.globl vector244
vector244:
  pushl $0
  10288c:	6a 00                	push   $0x0
  pushl $244
  10288e:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  102893:	e9 f0 f5 ff ff       	jmp    101e88 <__alltraps>

00102898 <vector245>:
.globl vector245
vector245:
  pushl $0
  102898:	6a 00                	push   $0x0
  pushl $245
  10289a:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  10289f:	e9 e4 f5 ff ff       	jmp    101e88 <__alltraps>

001028a4 <vector246>:
.globl vector246
vector246:
  pushl $0
  1028a4:	6a 00                	push   $0x0
  pushl $246
  1028a6:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  1028ab:	e9 d8 f5 ff ff       	jmp    101e88 <__alltraps>

001028b0 <vector247>:
.globl vector247
vector247:
  pushl $0
  1028b0:	6a 00                	push   $0x0
  pushl $247
  1028b2:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  1028b7:	e9 cc f5 ff ff       	jmp    101e88 <__alltraps>

001028bc <vector248>:
.globl vector248
vector248:
  pushl $0
  1028bc:	6a 00                	push   $0x0
  pushl $248
  1028be:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1028c3:	e9 c0 f5 ff ff       	jmp    101e88 <__alltraps>

001028c8 <vector249>:
.globl vector249
vector249:
  pushl $0
  1028c8:	6a 00                	push   $0x0
  pushl $249
  1028ca:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  1028cf:	e9 b4 f5 ff ff       	jmp    101e88 <__alltraps>

001028d4 <vector250>:
.globl vector250
vector250:
  pushl $0
  1028d4:	6a 00                	push   $0x0
  pushl $250
  1028d6:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  1028db:	e9 a8 f5 ff ff       	jmp    101e88 <__alltraps>

001028e0 <vector251>:
.globl vector251
vector251:
  pushl $0
  1028e0:	6a 00                	push   $0x0
  pushl $251
  1028e2:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  1028e7:	e9 9c f5 ff ff       	jmp    101e88 <__alltraps>

001028ec <vector252>:
.globl vector252
vector252:
  pushl $0
  1028ec:	6a 00                	push   $0x0
  pushl $252
  1028ee:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  1028f3:	e9 90 f5 ff ff       	jmp    101e88 <__alltraps>

001028f8 <vector253>:
.globl vector253
vector253:
  pushl $0
  1028f8:	6a 00                	push   $0x0
  pushl $253
  1028fa:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  1028ff:	e9 84 f5 ff ff       	jmp    101e88 <__alltraps>

00102904 <vector254>:
.globl vector254
vector254:
  pushl $0
  102904:	6a 00                	push   $0x0
  pushl $254
  102906:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  10290b:	e9 78 f5 ff ff       	jmp    101e88 <__alltraps>

00102910 <vector255>:
.globl vector255
vector255:
  pushl $0
  102910:	6a 00                	push   $0x0
  pushl $255
  102912:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102917:	e9 6c f5 ff ff       	jmp    101e88 <__alltraps>

0010291c <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  10291c:	55                   	push   %ebp
  10291d:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  10291f:	8b 45 08             	mov    0x8(%ebp),%eax
  102922:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102925:	b8 23 00 00 00       	mov    $0x23,%eax
  10292a:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  10292c:	b8 23 00 00 00       	mov    $0x23,%eax
  102931:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102933:	b8 10 00 00 00       	mov    $0x10,%eax
  102938:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  10293a:	b8 10 00 00 00       	mov    $0x10,%eax
  10293f:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102941:	b8 10 00 00 00       	mov    $0x10,%eax
  102946:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102948:	ea 4f 29 10 00 08 00 	ljmp   $0x8,$0x10294f
}
  10294f:	5d                   	pop    %ebp
  102950:	c3                   	ret    

00102951 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102951:	55                   	push   %ebp
  102952:	89 e5                	mov    %esp,%ebp
  102954:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102957:	b8 20 f9 10 00       	mov    $0x10f920,%eax
  10295c:	05 00 04 00 00       	add    $0x400,%eax
  102961:	a3 a4 f8 10 00       	mov    %eax,0x10f8a4
    ts.ts_ss0 = KERNEL_DS;
  102966:	66 c7 05 a8 f8 10 00 	movw   $0x10,0x10f8a8
  10296d:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  10296f:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  102976:	68 00 
  102978:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  10297d:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  102983:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102988:	c1 e8 10             	shr    $0x10,%eax
  10298b:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  102990:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102997:	83 e0 f0             	and    $0xfffffff0,%eax
  10299a:	83 c8 09             	or     $0x9,%eax
  10299d:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1029a2:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1029a9:	83 c8 10             	or     $0x10,%eax
  1029ac:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1029b1:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1029b8:	83 e0 9f             	and    $0xffffff9f,%eax
  1029bb:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1029c0:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1029c7:	83 c8 80             	or     $0xffffff80,%eax
  1029ca:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1029cf:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1029d6:	83 e0 f0             	and    $0xfffffff0,%eax
  1029d9:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1029de:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1029e5:	83 e0 ef             	and    $0xffffffef,%eax
  1029e8:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1029ed:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1029f4:	83 e0 df             	and    $0xffffffdf,%eax
  1029f7:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1029fc:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a03:	83 c8 40             	or     $0x40,%eax
  102a06:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a0b:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a12:	83 e0 7f             	and    $0x7f,%eax
  102a15:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a1a:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102a1f:	c1 e8 18             	shr    $0x18,%eax
  102a22:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  102a27:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a2e:	83 e0 ef             	and    $0xffffffef,%eax
  102a31:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102a36:	c7 04 24 10 ea 10 00 	movl   $0x10ea10,(%esp)
  102a3d:	e8 da fe ff ff       	call   10291c <lgdt>
  102a42:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
    asm volatile ("cli");
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102a48:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102a4c:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  102a4f:	c9                   	leave  
  102a50:	c3                   	ret    

00102a51 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102a51:	55                   	push   %ebp
  102a52:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102a54:	e8 f8 fe ff ff       	call   102951 <gdt_init>
}
  102a59:	5d                   	pop    %ebp
  102a5a:	c3                   	ret    
	...

00102a5c <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102a5c:	55                   	push   %ebp
  102a5d:	89 e5                	mov    %esp,%ebp
  102a5f:	56                   	push   %esi
  102a60:	53                   	push   %ebx
  102a61:	83 ec 60             	sub    $0x60,%esp
  102a64:	8b 45 10             	mov    0x10(%ebp),%eax
  102a67:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102a6a:	8b 45 14             	mov    0x14(%ebp),%eax
  102a6d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102a70:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102a73:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102a76:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102a79:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102a7c:	8b 45 18             	mov    0x18(%ebp),%eax
  102a7f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102a82:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102a85:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102a88:	89 45 c8             	mov    %eax,-0x38(%ebp)
  102a8b:	89 55 cc             	mov    %edx,-0x34(%ebp)
  102a8e:	8b 45 c8             	mov    -0x38(%ebp),%eax
  102a91:	8b 55 cc             	mov    -0x34(%ebp),%edx
  102a94:	89 d3                	mov    %edx,%ebx
  102a96:	89 c6                	mov    %eax,%esi
  102a98:	89 75 e0             	mov    %esi,-0x20(%ebp)
  102a9b:	89 5d f0             	mov    %ebx,-0x10(%ebp)
  102a9e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102aa1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102aa4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102aa8:	74 1c                	je     102ac6 <printnum+0x6a>
  102aaa:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102aad:	ba 00 00 00 00       	mov    $0x0,%edx
  102ab2:	f7 75 e4             	divl   -0x1c(%ebp)
  102ab5:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102ab8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102abb:	ba 00 00 00 00       	mov    $0x0,%edx
  102ac0:	f7 75 e4             	divl   -0x1c(%ebp)
  102ac3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102ac6:	8b 55 e0             	mov    -0x20(%ebp),%edx
  102ac9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102acc:	89 d6                	mov    %edx,%esi
  102ace:	89 c3                	mov    %eax,%ebx
  102ad0:	89 f0                	mov    %esi,%eax
  102ad2:	89 da                	mov    %ebx,%edx
  102ad4:	f7 75 e4             	divl   -0x1c(%ebp)
  102ad7:	89 d3                	mov    %edx,%ebx
  102ad9:	89 c6                	mov    %eax,%esi
  102adb:	89 75 e0             	mov    %esi,-0x20(%ebp)
  102ade:	89 5d dc             	mov    %ebx,-0x24(%ebp)
  102ae1:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102ae4:	89 45 c8             	mov    %eax,-0x38(%ebp)
  102ae7:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102aea:	89 55 c4             	mov    %edx,-0x3c(%ebp)
  102aed:	8b 45 c8             	mov    -0x38(%ebp),%eax
  102af0:	8b 55 c4             	mov    -0x3c(%ebp),%edx
  102af3:	89 c3                	mov    %eax,%ebx
  102af5:	89 d6                	mov    %edx,%esi
  102af7:	89 5d e8             	mov    %ebx,-0x18(%ebp)
  102afa:	89 75 ec             	mov    %esi,-0x14(%ebp)
  102afd:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102b00:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102b03:	8b 45 18             	mov    0x18(%ebp),%eax
  102b06:	ba 00 00 00 00       	mov    $0x0,%edx
  102b0b:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102b0e:	77 56                	ja     102b66 <printnum+0x10a>
  102b10:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102b13:	72 05                	jb     102b1a <printnum+0xbe>
  102b15:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  102b18:	77 4c                	ja     102b66 <printnum+0x10a>
        printnum(putch, putdat, result, base, width - 1, padc);
  102b1a:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102b1d:	8d 50 ff             	lea    -0x1(%eax),%edx
  102b20:	8b 45 20             	mov    0x20(%ebp),%eax
  102b23:	89 44 24 18          	mov    %eax,0x18(%esp)
  102b27:	89 54 24 14          	mov    %edx,0x14(%esp)
  102b2b:	8b 45 18             	mov    0x18(%ebp),%eax
  102b2e:	89 44 24 10          	mov    %eax,0x10(%esp)
  102b32:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102b35:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102b38:	89 44 24 08          	mov    %eax,0x8(%esp)
  102b3c:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102b40:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b43:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b47:	8b 45 08             	mov    0x8(%ebp),%eax
  102b4a:	89 04 24             	mov    %eax,(%esp)
  102b4d:	e8 0a ff ff ff       	call   102a5c <printnum>
  102b52:	eb 1c                	jmp    102b70 <printnum+0x114>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102b54:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b57:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b5b:	8b 45 20             	mov    0x20(%ebp),%eax
  102b5e:	89 04 24             	mov    %eax,(%esp)
  102b61:	8b 45 08             	mov    0x8(%ebp),%eax
  102b64:	ff d0                	call   *%eax
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
  102b66:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  102b6a:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102b6e:	7f e4                	jg     102b54 <printnum+0xf8>
            putch(padc, putdat);
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102b70:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102b73:	05 f0 3d 10 00       	add    $0x103df0,%eax
  102b78:	0f b6 00             	movzbl (%eax),%eax
  102b7b:	0f be c0             	movsbl %al,%eax
  102b7e:	8b 55 0c             	mov    0xc(%ebp),%edx
  102b81:	89 54 24 04          	mov    %edx,0x4(%esp)
  102b85:	89 04 24             	mov    %eax,(%esp)
  102b88:	8b 45 08             	mov    0x8(%ebp),%eax
  102b8b:	ff d0                	call   *%eax
}
  102b8d:	83 c4 60             	add    $0x60,%esp
  102b90:	5b                   	pop    %ebx
  102b91:	5e                   	pop    %esi
  102b92:	5d                   	pop    %ebp
  102b93:	c3                   	ret    

00102b94 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102b94:	55                   	push   %ebp
  102b95:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102b97:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102b9b:	7e 14                	jle    102bb1 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102b9d:	8b 45 08             	mov    0x8(%ebp),%eax
  102ba0:	8b 00                	mov    (%eax),%eax
  102ba2:	8d 48 08             	lea    0x8(%eax),%ecx
  102ba5:	8b 55 08             	mov    0x8(%ebp),%edx
  102ba8:	89 0a                	mov    %ecx,(%edx)
  102baa:	8b 50 04             	mov    0x4(%eax),%edx
  102bad:	8b 00                	mov    (%eax),%eax
  102baf:	eb 30                	jmp    102be1 <getuint+0x4d>
    }
    else if (lflag) {
  102bb1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102bb5:	74 16                	je     102bcd <getuint+0x39>
        return va_arg(*ap, unsigned long);
  102bb7:	8b 45 08             	mov    0x8(%ebp),%eax
  102bba:	8b 00                	mov    (%eax),%eax
  102bbc:	8d 48 04             	lea    0x4(%eax),%ecx
  102bbf:	8b 55 08             	mov    0x8(%ebp),%edx
  102bc2:	89 0a                	mov    %ecx,(%edx)
  102bc4:	8b 00                	mov    (%eax),%eax
  102bc6:	ba 00 00 00 00       	mov    $0x0,%edx
  102bcb:	eb 14                	jmp    102be1 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  102bcd:	8b 45 08             	mov    0x8(%ebp),%eax
  102bd0:	8b 00                	mov    (%eax),%eax
  102bd2:	8d 48 04             	lea    0x4(%eax),%ecx
  102bd5:	8b 55 08             	mov    0x8(%ebp),%edx
  102bd8:	89 0a                	mov    %ecx,(%edx)
  102bda:	8b 00                	mov    (%eax),%eax
  102bdc:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102be1:	5d                   	pop    %ebp
  102be2:	c3                   	ret    

00102be3 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102be3:	55                   	push   %ebp
  102be4:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102be6:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102bea:	7e 14                	jle    102c00 <getint+0x1d>
        return va_arg(*ap, long long);
  102bec:	8b 45 08             	mov    0x8(%ebp),%eax
  102bef:	8b 00                	mov    (%eax),%eax
  102bf1:	8d 48 08             	lea    0x8(%eax),%ecx
  102bf4:	8b 55 08             	mov    0x8(%ebp),%edx
  102bf7:	89 0a                	mov    %ecx,(%edx)
  102bf9:	8b 50 04             	mov    0x4(%eax),%edx
  102bfc:	8b 00                	mov    (%eax),%eax
  102bfe:	eb 30                	jmp    102c30 <getint+0x4d>
    }
    else if (lflag) {
  102c00:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102c04:	74 16                	je     102c1c <getint+0x39>
        return va_arg(*ap, long);
  102c06:	8b 45 08             	mov    0x8(%ebp),%eax
  102c09:	8b 00                	mov    (%eax),%eax
  102c0b:	8d 48 04             	lea    0x4(%eax),%ecx
  102c0e:	8b 55 08             	mov    0x8(%ebp),%edx
  102c11:	89 0a                	mov    %ecx,(%edx)
  102c13:	8b 00                	mov    (%eax),%eax
  102c15:	89 c2                	mov    %eax,%edx
  102c17:	c1 fa 1f             	sar    $0x1f,%edx
  102c1a:	eb 14                	jmp    102c30 <getint+0x4d>
    }
    else {
        return va_arg(*ap, int);
  102c1c:	8b 45 08             	mov    0x8(%ebp),%eax
  102c1f:	8b 00                	mov    (%eax),%eax
  102c21:	8d 48 04             	lea    0x4(%eax),%ecx
  102c24:	8b 55 08             	mov    0x8(%ebp),%edx
  102c27:	89 0a                	mov    %ecx,(%edx)
  102c29:	8b 00                	mov    (%eax),%eax
  102c2b:	89 c2                	mov    %eax,%edx
  102c2d:	c1 fa 1f             	sar    $0x1f,%edx
    }
}
  102c30:	5d                   	pop    %ebp
  102c31:	c3                   	ret    

00102c32 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102c32:	55                   	push   %ebp
  102c33:	89 e5                	mov    %esp,%ebp
  102c35:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  102c38:	8d 55 14             	lea    0x14(%ebp),%edx
  102c3b:	8d 45 f4             	lea    -0xc(%ebp),%eax
  102c3e:	89 10                	mov    %edx,(%eax)
    vprintfmt(putch, putdat, fmt, ap);
  102c40:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c43:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102c47:	8b 45 10             	mov    0x10(%ebp),%eax
  102c4a:	89 44 24 08          	mov    %eax,0x8(%esp)
  102c4e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c51:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c55:	8b 45 08             	mov    0x8(%ebp),%eax
  102c58:	89 04 24             	mov    %eax,(%esp)
  102c5b:	e8 02 00 00 00       	call   102c62 <vprintfmt>
    va_end(ap);
}
  102c60:	c9                   	leave  
  102c61:	c3                   	ret    

00102c62 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102c62:	55                   	push   %ebp
  102c63:	89 e5                	mov    %esp,%ebp
  102c65:	56                   	push   %esi
  102c66:	53                   	push   %ebx
  102c67:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102c6a:	eb 17                	jmp    102c83 <vprintfmt+0x21>
            if (ch == '\0') {
  102c6c:	85 db                	test   %ebx,%ebx
  102c6e:	0f 84 db 03 00 00    	je     10304f <vprintfmt+0x3ed>
                return;
            }
            putch(ch, putdat);
  102c74:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c77:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c7b:	89 1c 24             	mov    %ebx,(%esp)
  102c7e:	8b 45 08             	mov    0x8(%ebp),%eax
  102c81:	ff d0                	call   *%eax
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102c83:	8b 45 10             	mov    0x10(%ebp),%eax
  102c86:	0f b6 00             	movzbl (%eax),%eax
  102c89:	0f b6 d8             	movzbl %al,%ebx
  102c8c:	83 fb 25             	cmp    $0x25,%ebx
  102c8f:	0f 95 c0             	setne  %al
  102c92:	83 45 10 01          	addl   $0x1,0x10(%ebp)
  102c96:	84 c0                	test   %al,%al
  102c98:	75 d2                	jne    102c6c <vprintfmt+0xa>
            }
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
  102c9a:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102c9e:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102ca5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102ca8:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102cab:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102cb2:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102cb5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102cb8:	eb 04                	jmp    102cbe <vprintfmt+0x5c>
            goto process_precision;

        case '.':
            if (width < 0)
                width = 0;
            goto reswitch;
  102cba:	90                   	nop
  102cbb:	eb 01                	jmp    102cbe <vprintfmt+0x5c>
            goto reswitch;

        process_precision:
            if (width < 0)
                width = precision, precision = -1;
            goto reswitch;
  102cbd:	90                   	nop
        char padc = ' ';
        width = precision = -1;
        lflag = altflag = 0;

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102cbe:	8b 45 10             	mov    0x10(%ebp),%eax
  102cc1:	0f b6 00             	movzbl (%eax),%eax
  102cc4:	0f b6 d8             	movzbl %al,%ebx
  102cc7:	89 d8                	mov    %ebx,%eax
  102cc9:	83 45 10 01          	addl   $0x1,0x10(%ebp)
  102ccd:	83 e8 23             	sub    $0x23,%eax
  102cd0:	83 f8 55             	cmp    $0x55,%eax
  102cd3:	0f 87 45 03 00 00    	ja     10301e <vprintfmt+0x3bc>
  102cd9:	8b 04 85 14 3e 10 00 	mov    0x103e14(,%eax,4),%eax
  102ce0:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102ce2:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102ce6:	eb d6                	jmp    102cbe <vprintfmt+0x5c>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102ce8:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102cec:	eb d0                	jmp    102cbe <vprintfmt+0x5c>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102cee:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102cf5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102cf8:	89 d0                	mov    %edx,%eax
  102cfa:	c1 e0 02             	shl    $0x2,%eax
  102cfd:	01 d0                	add    %edx,%eax
  102cff:	01 c0                	add    %eax,%eax
  102d01:	01 d8                	add    %ebx,%eax
  102d03:	83 e8 30             	sub    $0x30,%eax
  102d06:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102d09:	8b 45 10             	mov    0x10(%ebp),%eax
  102d0c:	0f b6 00             	movzbl (%eax),%eax
  102d0f:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102d12:	83 fb 2f             	cmp    $0x2f,%ebx
  102d15:	7e 39                	jle    102d50 <vprintfmt+0xee>
  102d17:	83 fb 39             	cmp    $0x39,%ebx
  102d1a:	7f 34                	jg     102d50 <vprintfmt+0xee>
            padc = '0';
            goto reswitch;

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102d1c:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
  102d20:	eb d3                	jmp    102cf5 <vprintfmt+0x93>
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  102d22:	8b 45 14             	mov    0x14(%ebp),%eax
  102d25:	8d 50 04             	lea    0x4(%eax),%edx
  102d28:	89 55 14             	mov    %edx,0x14(%ebp)
  102d2b:	8b 00                	mov    (%eax),%eax
  102d2d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102d30:	eb 1f                	jmp    102d51 <vprintfmt+0xef>

        case '.':
            if (width < 0)
  102d32:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102d36:	79 82                	jns    102cba <vprintfmt+0x58>
                width = 0;
  102d38:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102d3f:	e9 76 ff ff ff       	jmp    102cba <vprintfmt+0x58>

        case '#':
            altflag = 1;
  102d44:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102d4b:	e9 6e ff ff ff       	jmp    102cbe <vprintfmt+0x5c>
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
            goto process_precision;
  102d50:	90                   	nop
        case '#':
            altflag = 1;
            goto reswitch;

        process_precision:
            if (width < 0)
  102d51:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102d55:	0f 89 62 ff ff ff    	jns    102cbd <vprintfmt+0x5b>
                width = precision, precision = -1;
  102d5b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102d5e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102d61:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102d68:	e9 50 ff ff ff       	jmp    102cbd <vprintfmt+0x5b>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102d6d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  102d71:	e9 48 ff ff ff       	jmp    102cbe <vprintfmt+0x5c>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  102d76:	8b 45 14             	mov    0x14(%ebp),%eax
  102d79:	8d 50 04             	lea    0x4(%eax),%edx
  102d7c:	89 55 14             	mov    %edx,0x14(%ebp)
  102d7f:	8b 00                	mov    (%eax),%eax
  102d81:	8b 55 0c             	mov    0xc(%ebp),%edx
  102d84:	89 54 24 04          	mov    %edx,0x4(%esp)
  102d88:	89 04 24             	mov    %eax,(%esp)
  102d8b:	8b 45 08             	mov    0x8(%ebp),%eax
  102d8e:	ff d0                	call   *%eax
            break;
  102d90:	e9 b4 02 00 00       	jmp    103049 <vprintfmt+0x3e7>

        // error message
        case 'e':
            err = va_arg(ap, int);
  102d95:	8b 45 14             	mov    0x14(%ebp),%eax
  102d98:	8d 50 04             	lea    0x4(%eax),%edx
  102d9b:	89 55 14             	mov    %edx,0x14(%ebp)
  102d9e:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  102da0:	85 db                	test   %ebx,%ebx
  102da2:	79 02                	jns    102da6 <vprintfmt+0x144>
                err = -err;
  102da4:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102da6:	83 fb 06             	cmp    $0x6,%ebx
  102da9:	7f 0b                	jg     102db6 <vprintfmt+0x154>
  102dab:	8b 34 9d d4 3d 10 00 	mov    0x103dd4(,%ebx,4),%esi
  102db2:	85 f6                	test   %esi,%esi
  102db4:	75 23                	jne    102dd9 <vprintfmt+0x177>
                printfmt(putch, putdat, "error %d", err);
  102db6:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  102dba:	c7 44 24 08 01 3e 10 	movl   $0x103e01,0x8(%esp)
  102dc1:	00 
  102dc2:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dc5:	89 44 24 04          	mov    %eax,0x4(%esp)
  102dc9:	8b 45 08             	mov    0x8(%ebp),%eax
  102dcc:	89 04 24             	mov    %eax,(%esp)
  102dcf:	e8 5e fe ff ff       	call   102c32 <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102dd4:	e9 70 02 00 00       	jmp    103049 <vprintfmt+0x3e7>
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
                printfmt(putch, putdat, "error %d", err);
            }
            else {
                printfmt(putch, putdat, "%s", p);
  102dd9:	89 74 24 0c          	mov    %esi,0xc(%esp)
  102ddd:	c7 44 24 08 0a 3e 10 	movl   $0x103e0a,0x8(%esp)
  102de4:	00 
  102de5:	8b 45 0c             	mov    0xc(%ebp),%eax
  102de8:	89 44 24 04          	mov    %eax,0x4(%esp)
  102dec:	8b 45 08             	mov    0x8(%ebp),%eax
  102def:	89 04 24             	mov    %eax,(%esp)
  102df2:	e8 3b fe ff ff       	call   102c32 <printfmt>
            }
            break;
  102df7:	e9 4d 02 00 00       	jmp    103049 <vprintfmt+0x3e7>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102dfc:	8b 45 14             	mov    0x14(%ebp),%eax
  102dff:	8d 50 04             	lea    0x4(%eax),%edx
  102e02:	89 55 14             	mov    %edx,0x14(%ebp)
  102e05:	8b 30                	mov    (%eax),%esi
  102e07:	85 f6                	test   %esi,%esi
  102e09:	75 05                	jne    102e10 <vprintfmt+0x1ae>
                p = "(null)";
  102e0b:	be 0d 3e 10 00       	mov    $0x103e0d,%esi
            }
            if (width > 0 && padc != '-') {
  102e10:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102e14:	7e 7c                	jle    102e92 <vprintfmt+0x230>
  102e16:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102e1a:	74 76                	je     102e92 <vprintfmt+0x230>
                for (width -= strnlen(p, precision); width > 0; width --) {
  102e1c:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  102e1f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102e22:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e26:	89 34 24             	mov    %esi,(%esp)
  102e29:	e8 21 03 00 00       	call   10314f <strnlen>
  102e2e:	89 da                	mov    %ebx,%edx
  102e30:	29 c2                	sub    %eax,%edx
  102e32:	89 d0                	mov    %edx,%eax
  102e34:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102e37:	eb 17                	jmp    102e50 <vprintfmt+0x1ee>
                    putch(padc, putdat);
  102e39:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  102e3d:	8b 55 0c             	mov    0xc(%ebp),%edx
  102e40:	89 54 24 04          	mov    %edx,0x4(%esp)
  102e44:	89 04 24             	mov    %eax,(%esp)
  102e47:	8b 45 08             	mov    0x8(%ebp),%eax
  102e4a:	ff d0                	call   *%eax
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
                p = "(null)";
            }
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
  102e4c:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102e50:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102e54:	7f e3                	jg     102e39 <vprintfmt+0x1d7>
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102e56:	eb 3a                	jmp    102e92 <vprintfmt+0x230>
                if (altflag && (ch < ' ' || ch > '~')) {
  102e58:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  102e5c:	74 1f                	je     102e7d <vprintfmt+0x21b>
  102e5e:	83 fb 1f             	cmp    $0x1f,%ebx
  102e61:	7e 05                	jle    102e68 <vprintfmt+0x206>
  102e63:	83 fb 7e             	cmp    $0x7e,%ebx
  102e66:	7e 15                	jle    102e7d <vprintfmt+0x21b>
                    putch('?', putdat);
  102e68:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e6b:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e6f:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  102e76:	8b 45 08             	mov    0x8(%ebp),%eax
  102e79:	ff d0                	call   *%eax
  102e7b:	eb 0f                	jmp    102e8c <vprintfmt+0x22a>
                }
                else {
                    putch(ch, putdat);
  102e7d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e80:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e84:	89 1c 24             	mov    %ebx,(%esp)
  102e87:	8b 45 08             	mov    0x8(%ebp),%eax
  102e8a:	ff d0                	call   *%eax
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102e8c:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102e90:	eb 01                	jmp    102e93 <vprintfmt+0x231>
  102e92:	90                   	nop
  102e93:	0f b6 06             	movzbl (%esi),%eax
  102e96:	0f be d8             	movsbl %al,%ebx
  102e99:	85 db                	test   %ebx,%ebx
  102e9b:	0f 95 c0             	setne  %al
  102e9e:	83 c6 01             	add    $0x1,%esi
  102ea1:	84 c0                	test   %al,%al
  102ea3:	74 29                	je     102ece <vprintfmt+0x26c>
  102ea5:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102ea9:	78 ad                	js     102e58 <vprintfmt+0x1f6>
  102eab:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  102eaf:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102eb3:	79 a3                	jns    102e58 <vprintfmt+0x1f6>
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102eb5:	eb 17                	jmp    102ece <vprintfmt+0x26c>
                putch(' ', putdat);
  102eb7:	8b 45 0c             	mov    0xc(%ebp),%eax
  102eba:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ebe:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  102ec5:	8b 45 08             	mov    0x8(%ebp),%eax
  102ec8:	ff d0                	call   *%eax
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102eca:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102ece:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102ed2:	7f e3                	jg     102eb7 <vprintfmt+0x255>
                putch(' ', putdat);
            }
            break;
  102ed4:	e9 70 01 00 00       	jmp    103049 <vprintfmt+0x3e7>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  102ed9:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102edc:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ee0:	8d 45 14             	lea    0x14(%ebp),%eax
  102ee3:	89 04 24             	mov    %eax,(%esp)
  102ee6:	e8 f8 fc ff ff       	call   102be3 <getint>
  102eeb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102eee:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  102ef1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ef4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102ef7:	85 d2                	test   %edx,%edx
  102ef9:	79 26                	jns    102f21 <vprintfmt+0x2bf>
                putch('-', putdat);
  102efb:	8b 45 0c             	mov    0xc(%ebp),%eax
  102efe:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f02:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  102f09:	8b 45 08             	mov    0x8(%ebp),%eax
  102f0c:	ff d0                	call   *%eax
                num = -(long long)num;
  102f0e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f11:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102f14:	f7 d8                	neg    %eax
  102f16:	83 d2 00             	adc    $0x0,%edx
  102f19:	f7 da                	neg    %edx
  102f1b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102f1e:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  102f21:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102f28:	e9 a8 00 00 00       	jmp    102fd5 <vprintfmt+0x373>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  102f2d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102f30:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f34:	8d 45 14             	lea    0x14(%ebp),%eax
  102f37:	89 04 24             	mov    %eax,(%esp)
  102f3a:	e8 55 fc ff ff       	call   102b94 <getuint>
  102f3f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102f42:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  102f45:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102f4c:	e9 84 00 00 00       	jmp    102fd5 <vprintfmt+0x373>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  102f51:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102f54:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f58:	8d 45 14             	lea    0x14(%ebp),%eax
  102f5b:	89 04 24             	mov    %eax,(%esp)
  102f5e:	e8 31 fc ff ff       	call   102b94 <getuint>
  102f63:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102f66:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  102f69:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  102f70:	eb 63                	jmp    102fd5 <vprintfmt+0x373>

        // pointer
        case 'p':
            putch('0', putdat);
  102f72:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f75:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f79:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  102f80:	8b 45 08             	mov    0x8(%ebp),%eax
  102f83:	ff d0                	call   *%eax
            putch('x', putdat);
  102f85:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f88:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f8c:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  102f93:	8b 45 08             	mov    0x8(%ebp),%eax
  102f96:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  102f98:	8b 45 14             	mov    0x14(%ebp),%eax
  102f9b:	8d 50 04             	lea    0x4(%eax),%edx
  102f9e:	89 55 14             	mov    %edx,0x14(%ebp)
  102fa1:	8b 00                	mov    (%eax),%eax
  102fa3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102fa6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  102fad:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  102fb4:	eb 1f                	jmp    102fd5 <vprintfmt+0x373>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  102fb6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102fb9:	89 44 24 04          	mov    %eax,0x4(%esp)
  102fbd:	8d 45 14             	lea    0x14(%ebp),%eax
  102fc0:	89 04 24             	mov    %eax,(%esp)
  102fc3:	e8 cc fb ff ff       	call   102b94 <getuint>
  102fc8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102fcb:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  102fce:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  102fd5:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  102fd9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102fdc:	89 54 24 18          	mov    %edx,0x18(%esp)
  102fe0:	8b 55 e8             	mov    -0x18(%ebp),%edx
  102fe3:	89 54 24 14          	mov    %edx,0x14(%esp)
  102fe7:	89 44 24 10          	mov    %eax,0x10(%esp)
  102feb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fee:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102ff1:	89 44 24 08          	mov    %eax,0x8(%esp)
  102ff5:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102ff9:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ffc:	89 44 24 04          	mov    %eax,0x4(%esp)
  103000:	8b 45 08             	mov    0x8(%ebp),%eax
  103003:	89 04 24             	mov    %eax,(%esp)
  103006:	e8 51 fa ff ff       	call   102a5c <printnum>
            break;
  10300b:	eb 3c                	jmp    103049 <vprintfmt+0x3e7>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  10300d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103010:	89 44 24 04          	mov    %eax,0x4(%esp)
  103014:	89 1c 24             	mov    %ebx,(%esp)
  103017:	8b 45 08             	mov    0x8(%ebp),%eax
  10301a:	ff d0                	call   *%eax
            break;
  10301c:	eb 2b                	jmp    103049 <vprintfmt+0x3e7>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  10301e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103021:	89 44 24 04          	mov    %eax,0x4(%esp)
  103025:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  10302c:	8b 45 08             	mov    0x8(%ebp),%eax
  10302f:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  103031:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103035:	eb 04                	jmp    10303b <vprintfmt+0x3d9>
  103037:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  10303b:	8b 45 10             	mov    0x10(%ebp),%eax
  10303e:	83 e8 01             	sub    $0x1,%eax
  103041:	0f b6 00             	movzbl (%eax),%eax
  103044:	3c 25                	cmp    $0x25,%al
  103046:	75 ef                	jne    103037 <vprintfmt+0x3d5>
                /* do nothing */;
            break;
  103048:	90                   	nop
        }
    }
  103049:	90                   	nop
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  10304a:	e9 34 fc ff ff       	jmp    102c83 <vprintfmt+0x21>
            if (ch == '\0') {
                return;
  10304f:	90                   	nop
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
  103050:	83 c4 40             	add    $0x40,%esp
  103053:	5b                   	pop    %ebx
  103054:	5e                   	pop    %esi
  103055:	5d                   	pop    %ebp
  103056:	c3                   	ret    

00103057 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  103057:	55                   	push   %ebp
  103058:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  10305a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10305d:	8b 40 08             	mov    0x8(%eax),%eax
  103060:	8d 50 01             	lea    0x1(%eax),%edx
  103063:	8b 45 0c             	mov    0xc(%ebp),%eax
  103066:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  103069:	8b 45 0c             	mov    0xc(%ebp),%eax
  10306c:	8b 10                	mov    (%eax),%edx
  10306e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103071:	8b 40 04             	mov    0x4(%eax),%eax
  103074:	39 c2                	cmp    %eax,%edx
  103076:	73 12                	jae    10308a <sprintputch+0x33>
        *b->buf ++ = ch;
  103078:	8b 45 0c             	mov    0xc(%ebp),%eax
  10307b:	8b 00                	mov    (%eax),%eax
  10307d:	8b 55 08             	mov    0x8(%ebp),%edx
  103080:	88 10                	mov    %dl,(%eax)
  103082:	8d 50 01             	lea    0x1(%eax),%edx
  103085:	8b 45 0c             	mov    0xc(%ebp),%eax
  103088:	89 10                	mov    %edx,(%eax)
    }
}
  10308a:	5d                   	pop    %ebp
  10308b:	c3                   	ret    

0010308c <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  10308c:	55                   	push   %ebp
  10308d:	89 e5                	mov    %esp,%ebp
  10308f:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  103092:	8d 55 14             	lea    0x14(%ebp),%edx
  103095:	8d 45 f0             	lea    -0x10(%ebp),%eax
  103098:	89 10                	mov    %edx,(%eax)
    cnt = vsnprintf(str, size, fmt, ap);
  10309a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10309d:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1030a1:	8b 45 10             	mov    0x10(%ebp),%eax
  1030a4:	89 44 24 08          	mov    %eax,0x8(%esp)
  1030a8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030ab:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030af:	8b 45 08             	mov    0x8(%ebp),%eax
  1030b2:	89 04 24             	mov    %eax,(%esp)
  1030b5:	e8 08 00 00 00       	call   1030c2 <vsnprintf>
  1030ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  1030bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1030c0:	c9                   	leave  
  1030c1:	c3                   	ret    

001030c2 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  1030c2:	55                   	push   %ebp
  1030c3:	89 e5                	mov    %esp,%ebp
  1030c5:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  1030c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1030cb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1030ce:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030d1:	83 e8 01             	sub    $0x1,%eax
  1030d4:	03 45 08             	add    0x8(%ebp),%eax
  1030d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1030da:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  1030e1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1030e5:	74 0a                	je     1030f1 <vsnprintf+0x2f>
  1030e7:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1030ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1030ed:	39 c2                	cmp    %eax,%edx
  1030ef:	76 07                	jbe    1030f8 <vsnprintf+0x36>
        return -E_INVAL;
  1030f1:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  1030f6:	eb 2a                	jmp    103122 <vsnprintf+0x60>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  1030f8:	8b 45 14             	mov    0x14(%ebp),%eax
  1030fb:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1030ff:	8b 45 10             	mov    0x10(%ebp),%eax
  103102:	89 44 24 08          	mov    %eax,0x8(%esp)
  103106:	8d 45 ec             	lea    -0x14(%ebp),%eax
  103109:	89 44 24 04          	mov    %eax,0x4(%esp)
  10310d:	c7 04 24 57 30 10 00 	movl   $0x103057,(%esp)
  103114:	e8 49 fb ff ff       	call   102c62 <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  103119:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10311c:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  10311f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103122:	c9                   	leave  
  103123:	c3                   	ret    

00103124 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  103124:	55                   	push   %ebp
  103125:	89 e5                	mov    %esp,%ebp
  103127:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  10312a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  103131:	eb 04                	jmp    103137 <strlen+0x13>
        cnt ++;
  103133:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
  103137:	8b 45 08             	mov    0x8(%ebp),%eax
  10313a:	0f b6 00             	movzbl (%eax),%eax
  10313d:	84 c0                	test   %al,%al
  10313f:	0f 95 c0             	setne  %al
  103142:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103146:	84 c0                	test   %al,%al
  103148:	75 e9                	jne    103133 <strlen+0xf>
        cnt ++;
    }
    return cnt;
  10314a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10314d:	c9                   	leave  
  10314e:	c3                   	ret    

0010314f <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  10314f:	55                   	push   %ebp
  103150:	89 e5                	mov    %esp,%ebp
  103152:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  103155:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  10315c:	eb 04                	jmp    103162 <strnlen+0x13>
        cnt ++;
  10315e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
  103162:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103165:	3b 45 0c             	cmp    0xc(%ebp),%eax
  103168:	73 13                	jae    10317d <strnlen+0x2e>
  10316a:	8b 45 08             	mov    0x8(%ebp),%eax
  10316d:	0f b6 00             	movzbl (%eax),%eax
  103170:	84 c0                	test   %al,%al
  103172:	0f 95 c0             	setne  %al
  103175:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103179:	84 c0                	test   %al,%al
  10317b:	75 e1                	jne    10315e <strnlen+0xf>
        cnt ++;
    }
    return cnt;
  10317d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  103180:	c9                   	leave  
  103181:	c3                   	ret    

00103182 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  103182:	55                   	push   %ebp
  103183:	89 e5                	mov    %esp,%ebp
  103185:	57                   	push   %edi
  103186:	56                   	push   %esi
  103187:	53                   	push   %ebx
  103188:	83 ec 24             	sub    $0x24,%esp
  10318b:	8b 45 08             	mov    0x8(%ebp),%eax
  10318e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103191:	8b 45 0c             	mov    0xc(%ebp),%eax
  103194:	89 45 ec             	mov    %eax,-0x14(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  103197:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10319a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10319d:	89 d6                	mov    %edx,%esi
  10319f:	89 c3                	mov    %eax,%ebx
  1031a1:	89 df                	mov    %ebx,%edi
  1031a3:	ac                   	lods   %ds:(%esi),%al
  1031a4:	aa                   	stos   %al,%es:(%edi)
  1031a5:	84 c0                	test   %al,%al
  1031a7:	75 fa                	jne    1031a3 <strcpy+0x21>
  1031a9:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1031ac:	89 fb                	mov    %edi,%ebx
  1031ae:	89 75 e8             	mov    %esi,-0x18(%ebp)
  1031b1:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
  1031b4:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1031b7:	89 45 e0             	mov    %eax,-0x20(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  1031ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  1031bd:	83 c4 24             	add    $0x24,%esp
  1031c0:	5b                   	pop    %ebx
  1031c1:	5e                   	pop    %esi
  1031c2:	5f                   	pop    %edi
  1031c3:	5d                   	pop    %ebp
  1031c4:	c3                   	ret    

001031c5 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  1031c5:	55                   	push   %ebp
  1031c6:	89 e5                	mov    %esp,%ebp
  1031c8:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  1031cb:	8b 45 08             	mov    0x8(%ebp),%eax
  1031ce:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  1031d1:	eb 21                	jmp    1031f4 <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  1031d3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031d6:	0f b6 10             	movzbl (%eax),%edx
  1031d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1031dc:	88 10                	mov    %dl,(%eax)
  1031de:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1031e1:	0f b6 00             	movzbl (%eax),%eax
  1031e4:	84 c0                	test   %al,%al
  1031e6:	74 04                	je     1031ec <strncpy+0x27>
            src ++;
  1031e8:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  1031ec:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1031f0:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
    char *p = dst;
    while (len > 0) {
  1031f4:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1031f8:	75 d9                	jne    1031d3 <strncpy+0xe>
        if ((*p = *src) != '\0') {
            src ++;
        }
        p ++, len --;
    }
    return dst;
  1031fa:	8b 45 08             	mov    0x8(%ebp),%eax
}
  1031fd:	c9                   	leave  
  1031fe:	c3                   	ret    

001031ff <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  1031ff:	55                   	push   %ebp
  103200:	89 e5                	mov    %esp,%ebp
  103202:	57                   	push   %edi
  103203:	56                   	push   %esi
  103204:	53                   	push   %ebx
  103205:	83 ec 24             	sub    $0x24,%esp
  103208:	8b 45 08             	mov    0x8(%ebp),%eax
  10320b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10320e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103211:	89 45 ec             	mov    %eax,-0x14(%ebp)
#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int
__strcmp(const char *s1, const char *s2) {
    int d0, d1, ret;
    asm volatile (
  103214:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103217:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10321a:	89 d6                	mov    %edx,%esi
  10321c:	89 c3                	mov    %eax,%ebx
  10321e:	89 df                	mov    %ebx,%edi
  103220:	ac                   	lods   %ds:(%esi),%al
  103221:	ae                   	scas   %es:(%edi),%al
  103222:	75 08                	jne    10322c <strcmp+0x2d>
  103224:	84 c0                	test   %al,%al
  103226:	75 f8                	jne    103220 <strcmp+0x21>
  103228:	31 c0                	xor    %eax,%eax
  10322a:	eb 04                	jmp    103230 <strcmp+0x31>
  10322c:	19 c0                	sbb    %eax,%eax
  10322e:	0c 01                	or     $0x1,%al
  103230:	89 fb                	mov    %edi,%ebx
  103232:	89 45 d0             	mov    %eax,-0x30(%ebp)
  103235:	8b 45 d0             	mov    -0x30(%ebp),%eax
  103238:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10323b:	89 75 e4             	mov    %esi,-0x1c(%ebp)
  10323e:	89 5d e0             	mov    %ebx,-0x20(%ebp)
            "orb $1, %%al;"
            "3:"
            : "=a" (ret), "=&S" (d0), "=&D" (d1)
            : "1" (s1), "2" (s2)
            : "memory");
    return ret;
  103241:	8b 45 e8             	mov    -0x18(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  103244:	83 c4 24             	add    $0x24,%esp
  103247:	5b                   	pop    %ebx
  103248:	5e                   	pop    %esi
  103249:	5f                   	pop    %edi
  10324a:	5d                   	pop    %ebp
  10324b:	c3                   	ret    

0010324c <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  10324c:	55                   	push   %ebp
  10324d:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  10324f:	eb 0c                	jmp    10325d <strncmp+0x11>
        n --, s1 ++, s2 ++;
  103251:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103255:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103259:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  10325d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103261:	74 1a                	je     10327d <strncmp+0x31>
  103263:	8b 45 08             	mov    0x8(%ebp),%eax
  103266:	0f b6 00             	movzbl (%eax),%eax
  103269:	84 c0                	test   %al,%al
  10326b:	74 10                	je     10327d <strncmp+0x31>
  10326d:	8b 45 08             	mov    0x8(%ebp),%eax
  103270:	0f b6 10             	movzbl (%eax),%edx
  103273:	8b 45 0c             	mov    0xc(%ebp),%eax
  103276:	0f b6 00             	movzbl (%eax),%eax
  103279:	38 c2                	cmp    %al,%dl
  10327b:	74 d4                	je     103251 <strncmp+0x5>
        n --, s1 ++, s2 ++;
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  10327d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103281:	74 1a                	je     10329d <strncmp+0x51>
  103283:	8b 45 08             	mov    0x8(%ebp),%eax
  103286:	0f b6 00             	movzbl (%eax),%eax
  103289:	0f b6 d0             	movzbl %al,%edx
  10328c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10328f:	0f b6 00             	movzbl (%eax),%eax
  103292:	0f b6 c0             	movzbl %al,%eax
  103295:	89 d1                	mov    %edx,%ecx
  103297:	29 c1                	sub    %eax,%ecx
  103299:	89 c8                	mov    %ecx,%eax
  10329b:	eb 05                	jmp    1032a2 <strncmp+0x56>
  10329d:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1032a2:	5d                   	pop    %ebp
  1032a3:	c3                   	ret    

001032a4 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  1032a4:	55                   	push   %ebp
  1032a5:	89 e5                	mov    %esp,%ebp
  1032a7:	83 ec 04             	sub    $0x4,%esp
  1032aa:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032ad:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  1032b0:	eb 14                	jmp    1032c6 <strchr+0x22>
        if (*s == c) {
  1032b2:	8b 45 08             	mov    0x8(%ebp),%eax
  1032b5:	0f b6 00             	movzbl (%eax),%eax
  1032b8:	3a 45 fc             	cmp    -0x4(%ebp),%al
  1032bb:	75 05                	jne    1032c2 <strchr+0x1e>
            return (char *)s;
  1032bd:	8b 45 08             	mov    0x8(%ebp),%eax
  1032c0:	eb 13                	jmp    1032d5 <strchr+0x31>
        }
        s ++;
  1032c2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
  1032c6:	8b 45 08             	mov    0x8(%ebp),%eax
  1032c9:	0f b6 00             	movzbl (%eax),%eax
  1032cc:	84 c0                	test   %al,%al
  1032ce:	75 e2                	jne    1032b2 <strchr+0xe>
        if (*s == c) {
            return (char *)s;
        }
        s ++;
    }
    return NULL;
  1032d0:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1032d5:	c9                   	leave  
  1032d6:	c3                   	ret    

001032d7 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  1032d7:	55                   	push   %ebp
  1032d8:	89 e5                	mov    %esp,%ebp
  1032da:	83 ec 04             	sub    $0x4,%esp
  1032dd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032e0:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  1032e3:	eb 0f                	jmp    1032f4 <strfind+0x1d>
        if (*s == c) {
  1032e5:	8b 45 08             	mov    0x8(%ebp),%eax
  1032e8:	0f b6 00             	movzbl (%eax),%eax
  1032eb:	3a 45 fc             	cmp    -0x4(%ebp),%al
  1032ee:	74 10                	je     103300 <strfind+0x29>
            break;
        }
        s ++;
  1032f0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
    while (*s != '\0') {
  1032f4:	8b 45 08             	mov    0x8(%ebp),%eax
  1032f7:	0f b6 00             	movzbl (%eax),%eax
  1032fa:	84 c0                	test   %al,%al
  1032fc:	75 e7                	jne    1032e5 <strfind+0xe>
  1032fe:	eb 01                	jmp    103301 <strfind+0x2a>
        if (*s == c) {
            break;
  103300:	90                   	nop
        }
        s ++;
    }
    return (char *)s;
  103301:	8b 45 08             	mov    0x8(%ebp),%eax
}
  103304:	c9                   	leave  
  103305:	c3                   	ret    

00103306 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  103306:	55                   	push   %ebp
  103307:	89 e5                	mov    %esp,%ebp
  103309:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  10330c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  103313:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  10331a:	eb 04                	jmp    103320 <strtol+0x1a>
        s ++;
  10331c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
strtol(const char *s, char **endptr, int base) {
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  103320:	8b 45 08             	mov    0x8(%ebp),%eax
  103323:	0f b6 00             	movzbl (%eax),%eax
  103326:	3c 20                	cmp    $0x20,%al
  103328:	74 f2                	je     10331c <strtol+0x16>
  10332a:	8b 45 08             	mov    0x8(%ebp),%eax
  10332d:	0f b6 00             	movzbl (%eax),%eax
  103330:	3c 09                	cmp    $0x9,%al
  103332:	74 e8                	je     10331c <strtol+0x16>
        s ++;
    }

    // plus/minus sign
    if (*s == '+') {
  103334:	8b 45 08             	mov    0x8(%ebp),%eax
  103337:	0f b6 00             	movzbl (%eax),%eax
  10333a:	3c 2b                	cmp    $0x2b,%al
  10333c:	75 06                	jne    103344 <strtol+0x3e>
        s ++;
  10333e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103342:	eb 15                	jmp    103359 <strtol+0x53>
    }
    else if (*s == '-') {
  103344:	8b 45 08             	mov    0x8(%ebp),%eax
  103347:	0f b6 00             	movzbl (%eax),%eax
  10334a:	3c 2d                	cmp    $0x2d,%al
  10334c:	75 0b                	jne    103359 <strtol+0x53>
        s ++, neg = 1;
  10334e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103352:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  103359:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10335d:	74 06                	je     103365 <strtol+0x5f>
  10335f:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  103363:	75 24                	jne    103389 <strtol+0x83>
  103365:	8b 45 08             	mov    0x8(%ebp),%eax
  103368:	0f b6 00             	movzbl (%eax),%eax
  10336b:	3c 30                	cmp    $0x30,%al
  10336d:	75 1a                	jne    103389 <strtol+0x83>
  10336f:	8b 45 08             	mov    0x8(%ebp),%eax
  103372:	83 c0 01             	add    $0x1,%eax
  103375:	0f b6 00             	movzbl (%eax),%eax
  103378:	3c 78                	cmp    $0x78,%al
  10337a:	75 0d                	jne    103389 <strtol+0x83>
        s += 2, base = 16;
  10337c:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  103380:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  103387:	eb 2a                	jmp    1033b3 <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  103389:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10338d:	75 17                	jne    1033a6 <strtol+0xa0>
  10338f:	8b 45 08             	mov    0x8(%ebp),%eax
  103392:	0f b6 00             	movzbl (%eax),%eax
  103395:	3c 30                	cmp    $0x30,%al
  103397:	75 0d                	jne    1033a6 <strtol+0xa0>
        s ++, base = 8;
  103399:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  10339d:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  1033a4:	eb 0d                	jmp    1033b3 <strtol+0xad>
    }
    else if (base == 0) {
  1033a6:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1033aa:	75 07                	jne    1033b3 <strtol+0xad>
        base = 10;
  1033ac:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  1033b3:	8b 45 08             	mov    0x8(%ebp),%eax
  1033b6:	0f b6 00             	movzbl (%eax),%eax
  1033b9:	3c 2f                	cmp    $0x2f,%al
  1033bb:	7e 1b                	jle    1033d8 <strtol+0xd2>
  1033bd:	8b 45 08             	mov    0x8(%ebp),%eax
  1033c0:	0f b6 00             	movzbl (%eax),%eax
  1033c3:	3c 39                	cmp    $0x39,%al
  1033c5:	7f 11                	jg     1033d8 <strtol+0xd2>
            dig = *s - '0';
  1033c7:	8b 45 08             	mov    0x8(%ebp),%eax
  1033ca:	0f b6 00             	movzbl (%eax),%eax
  1033cd:	0f be c0             	movsbl %al,%eax
  1033d0:	83 e8 30             	sub    $0x30,%eax
  1033d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1033d6:	eb 48                	jmp    103420 <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  1033d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1033db:	0f b6 00             	movzbl (%eax),%eax
  1033de:	3c 60                	cmp    $0x60,%al
  1033e0:	7e 1b                	jle    1033fd <strtol+0xf7>
  1033e2:	8b 45 08             	mov    0x8(%ebp),%eax
  1033e5:	0f b6 00             	movzbl (%eax),%eax
  1033e8:	3c 7a                	cmp    $0x7a,%al
  1033ea:	7f 11                	jg     1033fd <strtol+0xf7>
            dig = *s - 'a' + 10;
  1033ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1033ef:	0f b6 00             	movzbl (%eax),%eax
  1033f2:	0f be c0             	movsbl %al,%eax
  1033f5:	83 e8 57             	sub    $0x57,%eax
  1033f8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1033fb:	eb 23                	jmp    103420 <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  1033fd:	8b 45 08             	mov    0x8(%ebp),%eax
  103400:	0f b6 00             	movzbl (%eax),%eax
  103403:	3c 40                	cmp    $0x40,%al
  103405:	7e 38                	jle    10343f <strtol+0x139>
  103407:	8b 45 08             	mov    0x8(%ebp),%eax
  10340a:	0f b6 00             	movzbl (%eax),%eax
  10340d:	3c 5a                	cmp    $0x5a,%al
  10340f:	7f 2e                	jg     10343f <strtol+0x139>
            dig = *s - 'A' + 10;
  103411:	8b 45 08             	mov    0x8(%ebp),%eax
  103414:	0f b6 00             	movzbl (%eax),%eax
  103417:	0f be c0             	movsbl %al,%eax
  10341a:	83 e8 37             	sub    $0x37,%eax
  10341d:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  103420:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103423:	3b 45 10             	cmp    0x10(%ebp),%eax
  103426:	7d 16                	jge    10343e <strtol+0x138>
            break;
        }
        s ++, val = (val * base) + dig;
  103428:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  10342c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10342f:	0f af 45 10          	imul   0x10(%ebp),%eax
  103433:	03 45 f4             	add    -0xc(%ebp),%eax
  103436:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  103439:	e9 75 ff ff ff       	jmp    1033b3 <strtol+0xad>
        }
        else {
            break;
        }
        if (dig >= base) {
            break;
  10343e:	90                   	nop
        }
        s ++, val = (val * base) + dig;
        // we don't properly detect overflow!
    }

    if (endptr) {
  10343f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103443:	74 08                	je     10344d <strtol+0x147>
        *endptr = (char *) s;
  103445:	8b 45 0c             	mov    0xc(%ebp),%eax
  103448:	8b 55 08             	mov    0x8(%ebp),%edx
  10344b:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  10344d:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  103451:	74 07                	je     10345a <strtol+0x154>
  103453:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103456:	f7 d8                	neg    %eax
  103458:	eb 03                	jmp    10345d <strtol+0x157>
  10345a:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  10345d:	c9                   	leave  
  10345e:	c3                   	ret    

0010345f <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  10345f:	55                   	push   %ebp
  103460:	89 e5                	mov    %esp,%ebp
  103462:	57                   	push   %edi
  103463:	56                   	push   %esi
  103464:	53                   	push   %ebx
  103465:	83 ec 24             	sub    $0x24,%esp
  103468:	8b 45 0c             	mov    0xc(%ebp),%eax
  10346b:	88 45 d0             	mov    %al,-0x30(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  10346e:	0f be 45 d0          	movsbl -0x30(%ebp),%eax
  103472:	8b 55 08             	mov    0x8(%ebp),%edx
  103475:	89 55 f0             	mov    %edx,-0x10(%ebp)
  103478:	88 45 ef             	mov    %al,-0x11(%ebp)
  10347b:	8b 45 10             	mov    0x10(%ebp),%eax
  10347e:	89 45 e8             	mov    %eax,-0x18(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  103481:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  103484:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
  103488:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10348b:	89 ce                	mov    %ecx,%esi
  10348d:	89 d3                	mov    %edx,%ebx
  10348f:	89 f1                	mov    %esi,%ecx
  103491:	89 df                	mov    %ebx,%edi
  103493:	f3 aa                	rep stos %al,%es:(%edi)
  103495:	89 fb                	mov    %edi,%ebx
  103497:	89 ce                	mov    %ecx,%esi
  103499:	89 75 e4             	mov    %esi,-0x1c(%ebp)
  10349c:	89 5d e0             	mov    %ebx,-0x20(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  10349f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  1034a2:	83 c4 24             	add    $0x24,%esp
  1034a5:	5b                   	pop    %ebx
  1034a6:	5e                   	pop    %esi
  1034a7:	5f                   	pop    %edi
  1034a8:	5d                   	pop    %ebp
  1034a9:	c3                   	ret    

001034aa <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  1034aa:	55                   	push   %ebp
  1034ab:	89 e5                	mov    %esp,%ebp
  1034ad:	57                   	push   %edi
  1034ae:	56                   	push   %esi
  1034af:	53                   	push   %ebx
  1034b0:	83 ec 38             	sub    $0x38,%esp
  1034b3:	8b 45 08             	mov    0x8(%ebp),%eax
  1034b6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1034b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034bc:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1034bf:	8b 45 10             	mov    0x10(%ebp),%eax
  1034c2:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  1034c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1034c8:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  1034cb:	73 4e                	jae    10351b <memmove+0x71>
  1034cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1034d0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1034d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1034d6:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1034d9:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1034dc:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  1034df:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1034e2:	89 c1                	mov    %eax,%ecx
  1034e4:	c1 e9 02             	shr    $0x2,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  1034e7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1034ea:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1034ed:	89 4d c0             	mov    %ecx,-0x40(%ebp)
  1034f0:	89 d7                	mov    %edx,%edi
  1034f2:	89 c3                	mov    %eax,%ebx
  1034f4:	8b 4d c0             	mov    -0x40(%ebp),%ecx
  1034f7:	89 de                	mov    %ebx,%esi
  1034f9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1034fb:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  1034fe:	83 e1 03             	and    $0x3,%ecx
  103501:	74 02                	je     103505 <memmove+0x5b>
  103503:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103505:	89 f3                	mov    %esi,%ebx
  103507:	89 4d c0             	mov    %ecx,-0x40(%ebp)
  10350a:	8b 4d c0             	mov    -0x40(%ebp),%ecx
  10350d:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  103510:	89 7d d4             	mov    %edi,-0x2c(%ebp)
  103513:	89 5d d0             	mov    %ebx,-0x30(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  103516:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103519:	eb 3b                	jmp    103556 <memmove+0xac>
    asm volatile (
            "std;"
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  10351b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10351e:	83 e8 01             	sub    $0x1,%eax
  103521:	89 c2                	mov    %eax,%edx
  103523:	03 55 ec             	add    -0x14(%ebp),%edx
  103526:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103529:	83 e8 01             	sub    $0x1,%eax
  10352c:	03 45 f0             	add    -0x10(%ebp),%eax
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile (
  10352f:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  103532:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  103535:	89 d6                	mov    %edx,%esi
  103537:	89 c3                	mov    %eax,%ebx
  103539:	8b 4d bc             	mov    -0x44(%ebp),%ecx
  10353c:	89 df                	mov    %ebx,%edi
  10353e:	fd                   	std    
  10353f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103541:	fc                   	cld    
  103542:	89 fb                	mov    %edi,%ebx
  103544:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  103547:	8b 4d bc             	mov    -0x44(%ebp),%ecx
  10354a:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  10354d:	89 75 c8             	mov    %esi,-0x38(%ebp)
  103550:	89 5d c4             	mov    %ebx,-0x3c(%ebp)
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
            : "memory");
    return dst;
  103553:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  103556:	83 c4 38             	add    $0x38,%esp
  103559:	5b                   	pop    %ebx
  10355a:	5e                   	pop    %esi
  10355b:	5f                   	pop    %edi
  10355c:	5d                   	pop    %ebp
  10355d:	c3                   	ret    

0010355e <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  10355e:	55                   	push   %ebp
  10355f:	89 e5                	mov    %esp,%ebp
  103561:	57                   	push   %edi
  103562:	56                   	push   %esi
  103563:	53                   	push   %ebx
  103564:	83 ec 24             	sub    $0x24,%esp
  103567:	8b 45 08             	mov    0x8(%ebp),%eax
  10356a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10356d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103570:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103573:	8b 45 10             	mov    0x10(%ebp),%eax
  103576:	89 45 e8             	mov    %eax,-0x18(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  103579:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10357c:	89 c1                	mov    %eax,%ecx
  10357e:	c1 e9 02             	shr    $0x2,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  103581:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103584:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103587:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  10358a:	89 d7                	mov    %edx,%edi
  10358c:	89 c3                	mov    %eax,%ebx
  10358e:	8b 4d d0             	mov    -0x30(%ebp),%ecx
  103591:	89 de                	mov    %ebx,%esi
  103593:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  103595:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  103598:	83 e1 03             	and    $0x3,%ecx
  10359b:	74 02                	je     10359f <memcpy+0x41>
  10359d:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  10359f:	89 f3                	mov    %esi,%ebx
  1035a1:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  1035a4:	8b 4d d0             	mov    -0x30(%ebp),%ecx
  1035a7:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  1035aa:	89 7d e0             	mov    %edi,-0x20(%ebp)
  1035ad:	89 5d dc             	mov    %ebx,-0x24(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  1035b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  1035b3:	83 c4 24             	add    $0x24,%esp
  1035b6:	5b                   	pop    %ebx
  1035b7:	5e                   	pop    %esi
  1035b8:	5f                   	pop    %edi
  1035b9:	5d                   	pop    %ebp
  1035ba:	c3                   	ret    

001035bb <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  1035bb:	55                   	push   %ebp
  1035bc:	89 e5                	mov    %esp,%ebp
  1035be:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  1035c1:	8b 45 08             	mov    0x8(%ebp),%eax
  1035c4:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  1035c7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1035ca:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  1035cd:	eb 32                	jmp    103601 <memcmp+0x46>
        if (*s1 != *s2) {
  1035cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1035d2:	0f b6 10             	movzbl (%eax),%edx
  1035d5:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1035d8:	0f b6 00             	movzbl (%eax),%eax
  1035db:	38 c2                	cmp    %al,%dl
  1035dd:	74 1a                	je     1035f9 <memcmp+0x3e>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  1035df:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1035e2:	0f b6 00             	movzbl (%eax),%eax
  1035e5:	0f b6 d0             	movzbl %al,%edx
  1035e8:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1035eb:	0f b6 00             	movzbl (%eax),%eax
  1035ee:	0f b6 c0             	movzbl %al,%eax
  1035f1:	89 d1                	mov    %edx,%ecx
  1035f3:	29 c1                	sub    %eax,%ecx
  1035f5:	89 c8                	mov    %ecx,%eax
  1035f7:	eb 1c                	jmp    103615 <memcmp+0x5a>
        }
        s1 ++, s2 ++;
  1035f9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1035fd:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
    const char *s1 = (const char *)v1;
    const char *s2 = (const char *)v2;
    while (n -- > 0) {
  103601:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103605:	0f 95 c0             	setne  %al
  103608:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  10360c:	84 c0                	test   %al,%al
  10360e:	75 bf                	jne    1035cf <memcmp+0x14>
        if (*s1 != *s2) {
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
        }
        s1 ++, s2 ++;
    }
    return 0;
  103610:	b8 00 00 00 00       	mov    $0x0,%eax
}
  103615:	c9                   	leave  
  103616:	c3                   	ret    
