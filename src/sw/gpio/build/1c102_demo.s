
1c102_demo.elf:     file format elf32-loongarch
1c102_demo.elf


Disassembly of section .text:

1c000000 <_start>:
_start():
1c000000:	0015000d 	move	$r13,$r0
1c000004:	50002000 	b	32(0x20) # 1c000024 <LoopCopyDataInit>

1c000008 <CopyDataInit>:
CopyDataInit():
1c000008:	1438006f 	lu12i.w	$r15,114691(0x1c003)
1c00000c:	039f81ef 	ori	$r15,$r15,0x7e0
1c000010:	001035f0 	add.w	$r16,$r15,$r13
1c000014:	2880020f 	ld.w	$r15,$r16,0
1c000018:	00103590 	add.w	$r16,$r12,$r13
1c00001c:	2980020f 	st.w	$r15,$r16,0
1c000020:	028011ad 	addi.w	$r13,$r13,4(0x4)

1c000024 <LoopCopyDataInit>:
LoopCopyDataInit():
1c000024:	1500002c 	lu12i.w	$r12,-524287(0x80001)
1c000028:	0380018c 	ori	$r12,$r12,0x0
1c00002c:	1500002f 	lu12i.w	$r15,-524287(0x80001)
1c000030:	038001ef 	ori	$r15,$r15,0x0
1c000034:	0010358e 	add.w	$r14,$r12,$r13
1c000038:	5fffd1cf 	bne	$r14,$r15,-48(0x3ffd0) # 1c000008 <CopyDataInit>
1c00003c:	1500000c 	lu12i.w	$r12,-524288(0x80000)
1c000040:	0380018c 	ori	$r12,$r12,0x0
1c000044:	1500000d 	lu12i.w	$r13,-524288(0x80000)
1c000048:	038001ad 	ori	$r13,$r13,0x0
1c00004c:	580011ac 	beq	$r13,$r12,16(0x10) # 1c00005c <cpu_init_start>

1c000050 <LoopFillZerobss>:
LoopFillZerobss():
1c000050:	29800180 	st.w	$r0,$r12,0
1c000054:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c000058:	5ffff9ac 	bne	$r13,$r12,-8(0x3fff8) # 1c000050 <LoopFillZerobss>

1c00005c <cpu_init_start>:
cpu_init_start():
1c00005c:	1438002c 	lu12i.w	$r12,114689(0x1c001)
1c000060:	0400302c 	csrwr	$r12,0xc
1c000064:	0015000c 	move	$r12,$r0
1c000068:	0400102c 	csrwr	$r12,0x4
1c00006c:	1400002c 	lu12i.w	$r12,1(0x1)
1c000070:	03bffd8c 	ori	$r12,$r12,0xfff
1c000074:	0400118c 	csrxchg	$r12,$r12,0x4
1c000078:	15ffe3ec 	lu12i.w	$r12,-225(0xfff1f)
1c00007c:	03bffd8c 	ori	$r12,$r12,0xfff
1c000080:	0406442c 	csrwr	$r12,0x191
1c000084:	14eca06c 	lu12i.w	$r12,484611(0x76503)
1c000088:	0388418c 	ori	$r12,$r12,0x210
1c00008c:	0406402c 	csrwr	$r12,0x190
1c000090:	0380200c 	ori	$r12,$r0,0x8
1c000094:	04000180 	csrxchg	$r0,$r12,0x0
1c000098:	15000023 	lu12i.w	$r3,-524287(0x80001)
1c00009c:	03bdf063 	ori	$r3,$r3,0xf7c
1c0000a0:	5422f800 	bl	8952(0x22f8) # 1c002398 <main>
1c0000a4:	4c000020 	jirl	$r0,$r1,0

1c0000a8 <cpu_wait>:
cpu_wait():
1c0000a8:	06488000 	idle	0x0
1c0000ac:	4c000020 	jirl	$r0,$r1,0
	...

1c001000 <DEFAULT_INT_HANDLER>:
DEFAULT_INT_HANDLER():
1c001000:	0400c435 	csrwr	$r21,0x31
1c001004:	15000055 	lu12i.w	$r21,-524286(0x80002)
1c001008:	29bff2ac 	st.w	$r12,$r21,-4(0xffc)
1c00100c:	29bfe2ad 	st.w	$r13,$r21,-8(0xff8)
1c001010:	29bfd2ae 	st.w	$r14,$r21,-12(0xff4)
1c001014:	29bfc2af 	st.w	$r15,$r21,-16(0xff0)
1c001018:	29bfb2b0 	st.w	$r16,$r21,-20(0xfec)
1c00101c:	29bfa2b1 	st.w	$r17,$r21,-24(0xfe8)
1c001020:	29bf92b2 	st.w	$r18,$r21,-28(0xfe4)
1c001024:	29bf82b3 	st.w	$r19,$r21,-32(0xfe0)
1c001028:	29bf72b4 	st.w	$r20,$r21,-36(0xfdc)
1c00102c:	29bed2a4 	st.w	$r4,$r21,-76(0xfb4)
1c001030:	29bec2a5 	st.w	$r5,$r21,-80(0xfb0)
1c001034:	29beb2a6 	st.w	$r6,$r21,-84(0xfac)
1c001038:	29bea2a7 	st.w	$r7,$r21,-88(0xfa8)
1c00103c:	29be92a8 	st.w	$r8,$r21,-92(0xfa4)
1c001040:	29be82a9 	st.w	$r9,$r21,-96(0xfa0)
1c001044:	29be72aa 	st.w	$r10,$r21,-100(0xf9c)
1c001048:	29be62ab 	st.w	$r11,$r21,-104(0xf98)
1c00104c:	29be52a1 	st.w	$r1,$r21,-108(0xf94)
1c001050:	29be42a3 	st.w	$r3,$r21,-112(0xf90)
1c001054:	0400140c 	csrrd	$r12,0x5
1c001058:	036ef18d 	andi	$r13,$r12,0xbbc
1c00105c:	400065a0 	beqz	$r13,100(0x64) # 1c0010c0 <exception_core_check>

1c001060 <exception_pmu>:
exception_pmu():
1c001060:	0340118d 	andi	$r13,$r12,0x4
1c001064:	44002da0 	bnez	$r13,44(0x2c) # 1c001090 <wake_label>
1c001068:	0340218d 	andi	$r13,$r12,0x8
1c00106c:	44002da0 	bnez	$r13,44(0x2c) # 1c001098 <touch_label>
1c001070:	0340418d 	andi	$r13,$r12,0x10
1c001074:	44002da0 	bnez	$r13,44(0x2c) # 1c0010a0 <uart2_label>
1c001078:	0340818d 	andi	$r13,$r12,0x20
1c00107c:	44002da0 	bnez	$r13,44(0x2c) # 1c0010a8 <bcc_label>
1c001080:	0342018d 	andi	$r13,$r12,0x80
1c001084:	44002da0 	bnez	$r13,44(0x2c) # 1c0010b0 <exint_label>
1c001088:	0360018d 	andi	$r13,$r12,0x800
1c00108c:	44002da0 	bnez	$r13,44(0x2c) # 1c0010b8 <timer_label>

1c001090 <wake_label>:
wake_label():
1c001090:	541e1c00 	bl	7708(0x1e1c) # 1c002eac <TIMER_WAKE_INT>
1c001094:	50003c00 	b	60(0x3c) # 1c0010d0 <exception_exit>

1c001098 <touch_label>:
touch_label():
1c001098:	541e5c00 	bl	7772(0x1e5c) # 1c002ef4 <TOUCH>
1c00109c:	50003400 	b	52(0x34) # 1c0010d0 <exception_exit>

1c0010a0 <uart2_label>:
uart2_label():
1c0010a0:	541ee000 	bl	7904(0x1ee0) # 1c002f80 <UART2_INT>
1c0010a4:	50002c00 	b	44(0x2c) # 1c0010d0 <exception_exit>

1c0010a8 <bcc_label>:
bcc_label():
1c0010a8:	541f1400 	bl	7956(0x1f14) # 1c002fbc <BAT_FAIL>
1c0010ac:	50002400 	b	36(0x24) # 1c0010d0 <exception_exit>

1c0010b0 <exint_label>:
exint_label():
1c0010b0:	541d2c00 	bl	7468(0x1d2c) # 1c002ddc <ext_handler>
1c0010b4:	50001c00 	b	28(0x1c) # 1c0010d0 <exception_exit>

1c0010b8 <timer_label>:
timer_label():
1c0010b8:	5420c000 	bl	8384(0x20c0) # 1c003178 <TIMER_HANDLER>
1c0010bc:	50001400 	b	20(0x14) # 1c0010d0 <exception_exit>

1c0010c0 <exception_core_check>:
exception_core_check():
1c0010c0:	0341018d 	andi	$r13,$r12,0x40
1c0010c4:	40000da0 	beqz	$r13,12(0xc) # 1c0010d0 <exception_exit>
1c0010c8:	541fcc00 	bl	8140(0x1fcc) # 1c003094 <intc_handler>
1c0010cc:	50000400 	b	4(0x4) # 1c0010d0 <exception_exit>

1c0010d0 <exception_exit>:
exception_exit():
1c0010d0:	15000055 	lu12i.w	$r21,-524286(0x80002)
1c0010d4:	28bff2ac 	ld.w	$r12,$r21,-4(0xffc)
1c0010d8:	28bfe2ad 	ld.w	$r13,$r21,-8(0xff8)
1c0010dc:	28bfd2ae 	ld.w	$r14,$r21,-12(0xff4)
1c0010e0:	28bfc2af 	ld.w	$r15,$r21,-16(0xff0)
1c0010e4:	28bfb2b0 	ld.w	$r16,$r21,-20(0xfec)
1c0010e8:	28bfa2b1 	ld.w	$r17,$r21,-24(0xfe8)
1c0010ec:	28bf92b2 	ld.w	$r18,$r21,-28(0xfe4)
1c0010f0:	28bf82b3 	ld.w	$r19,$r21,-32(0xfe0)
1c0010f4:	28bf72b4 	ld.w	$r20,$r21,-36(0xfdc)
1c0010f8:	28bed2a4 	ld.w	$r4,$r21,-76(0xfb4)
1c0010fc:	28bec2a5 	ld.w	$r5,$r21,-80(0xfb0)
1c001100:	28beb2a6 	ld.w	$r6,$r21,-84(0xfac)
1c001104:	28bea2a7 	ld.w	$r7,$r21,-88(0xfa8)
1c001108:	28be92a8 	ld.w	$r8,$r21,-92(0xfa4)
1c00110c:	28be82a9 	ld.w	$r9,$r21,-96(0xfa0)
1c001110:	28be72aa 	ld.w	$r10,$r21,-100(0xf9c)
1c001114:	28be62ab 	ld.w	$r11,$r21,-104(0xf98)
1c001118:	28be52a1 	ld.w	$r1,$r21,-108(0xf94)
1c00111c:	28be42a3 	ld.w	$r3,$r21,-112(0xf90)
1c001120:	0400c415 	csrrd	$r21,0x31
1c001124:	06483800 	ertn

1c001128 <myputchar>:
myputchar():
1c001128:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c00112c:	29807061 	st.w	$r1,$r3,28(0x1c)
1c001130:	29806076 	st.w	$r22,$r3,24(0x18)
1c001134:	02808076 	addi.w	$r22,$r3,32(0x20)
1c001138:	0015008c 	move	$r12,$r4
1c00113c:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c001140:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c001144:	00150185 	move	$r5,$r12
1c001148:	157fd004 	lu12i.w	$r4,-262528(0xbfe80)
1c00114c:	54058c00 	bl	1420(0x58c) # 1c0016d8 <UART_SendData>
1c001150:	03400000 	andi	$r0,$r0,0x0
1c001154:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c001158:	28806076 	ld.w	$r22,$r3,24(0x18)
1c00115c:	02808063 	addi.w	$r3,$r3,32(0x20)
1c001160:	4c000020 	jirl	$r0,$r1,0

1c001164 <printbase>:
printbase():
1c001164:	02be4063 	addi.w	$r3,$r3,-112(0xf90)
1c001168:	2981b061 	st.w	$r1,$r3,108(0x6c)
1c00116c:	2981a076 	st.w	$r22,$r3,104(0x68)
1c001170:	0281c076 	addi.w	$r22,$r3,112(0x70)
1c001174:	29be72c4 	st.w	$r4,$r22,-100(0xf9c)
1c001178:	29be62c5 	st.w	$r5,$r22,-104(0xf98)
1c00117c:	29be52c6 	st.w	$r6,$r22,-108(0xf94)
1c001180:	29be42c7 	st.w	$r7,$r22,-112(0xf90)
1c001184:	28be42cc 	ld.w	$r12,$r22,-112(0xf90)
1c001188:	40002580 	beqz	$r12,36(0x24) # 1c0011ac <printbase+0x48>
1c00118c:	28be72cc 	ld.w	$r12,$r22,-100(0xf9c)
1c001190:	64001d80 	bge	$r12,$r0,28(0x1c) # 1c0011ac <printbase+0x48>
1c001194:	28be72cc 	ld.w	$r12,$r22,-100(0xf9c)
1c001198:	0011300c 	sub.w	$r12,$r0,$r12
1c00119c:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c0011a0:	0280b404 	addi.w	$r4,$r0,45(0x2d)
1c0011a4:	57ff87ff 	bl	-124(0xfffff84) # 1c001128 <myputchar>
1c0011a8:	50000c00 	b	12(0xc) # 1c0011b4 <printbase+0x50>
1c0011ac:	28be72cc 	ld.w	$r12,$r22,-100(0xf9c)
1c0011b0:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c0011b4:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c0011b8:	50005000 	b	80(0x50) # 1c001208 <printbase+0xa4>
1c0011bc:	28be52cc 	ld.w	$r12,$r22,-108(0xf94)
1c0011c0:	28bf92cd 	ld.w	$r13,$r22,-28(0xfe4)
1c0011c4:	0021b1ae 	mod.wu	$r14,$r13,$r12
1c0011c8:	5c000980 	bne	$r12,$r0,8(0x8) # 1c0011d0 <printbase+0x6c>
1c0011cc:	002a0007 	break	0x7
1c0011d0:	00005dcc 	ext.w.b	$r12,$r14
1c0011d4:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c0011d8:	02bfc2ce 	addi.w	$r14,$r22,-16(0xff0)
1c0011dc:	001035cd 	add.w	$r13,$r14,$r13
1c0011e0:	293ec1ac 	st.b	$r12,$r13,-80(0xfb0)
1c0011e4:	28be52cd 	ld.w	$r13,$r22,-108(0xf94)
1c0011e8:	28bf92ce 	ld.w	$r14,$r22,-28(0xfe4)
1c0011ec:	002135cc 	div.wu	$r12,$r14,$r13
1c0011f0:	5c0009a0 	bne	$r13,$r0,8(0x8) # 1c0011f8 <printbase+0x94>
1c0011f4:	002a0007 	break	0x7
1c0011f8:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c0011fc:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001200:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001204:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001208:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c00120c:	47ffb19f 	bnez	$r12,-80(0x7fffb0) # 1c0011bc <printbase+0x58>
1c001210:	28be62cc 	ld.w	$r12,$r22,-104(0xf98)
1c001214:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c001218:	28bfb2ce 	ld.w	$r14,$r22,-20(0xfec)
1c00121c:	001231ad 	slt	$r13,$r13,$r12
1c001220:	0013b5ce 	masknez	$r14,$r14,$r13
1c001224:	0013358c 	maskeqz	$r12,$r12,$r13
1c001228:	001531cc 	or	$r12,$r14,$r12
1c00122c:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c001230:	50007400 	b	116(0x74) # 1c0012a4 <printbase+0x140>
1c001234:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c001238:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00123c:	60001d8d 	blt	$r12,$r13,28(0x1c) # 1c001258 <printbase+0xf4>
1c001240:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001244:	02bffd8c 	addi.w	$r12,$r12,-1(0xfff)
1c001248:	02bfc2cd 	addi.w	$r13,$r22,-16(0xff0)
1c00124c:	001031ac 	add.w	$r12,$r13,$r12
1c001250:	283ec18c 	ld.b	$r12,$r12,-80(0xfb0)
1c001254:	50000800 	b	8(0x8) # 1c00125c <printbase+0xf8>
1c001258:	0015000c 	move	$r12,$r0
1c00125c:	29bf82cc 	st.w	$r12,$r22,-32(0xfe0)
1c001260:	28bf82cd 	ld.w	$r13,$r22,-32(0xfe0)
1c001264:	0280240c 	addi.w	$r12,$r0,9(0x9)
1c001268:	6000198d 	blt	$r12,$r13,24(0x18) # 1c001280 <printbase+0x11c>
1c00126c:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c001270:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001274:	0280c18c 	addi.w	$r12,$r12,48(0x30)
1c001278:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c00127c:	50001400 	b	20(0x14) # 1c001290 <printbase+0x12c>
1c001280:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c001284:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001288:	02815d8c 	addi.w	$r12,$r12,87(0x57)
1c00128c:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001290:	00150184 	move	$r4,$r12
1c001294:	57fe97ff 	bl	-364(0xffffe94) # 1c001128 <myputchar>
1c001298:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c00129c:	02bffd8c 	addi.w	$r12,$r12,-1(0xfff)
1c0012a0:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0012a4:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0012a8:	63ff8c0c 	blt	$r0,$r12,-116(0x3ff8c) # 1c001234 <printbase+0xd0>
1c0012ac:	0015000c 	move	$r12,$r0
1c0012b0:	00150184 	move	$r4,$r12
1c0012b4:	2881b061 	ld.w	$r1,$r3,108(0x6c)
1c0012b8:	2881a076 	ld.w	$r22,$r3,104(0x68)
1c0012bc:	0281c063 	addi.w	$r3,$r3,112(0x70)
1c0012c0:	4c000020 	jirl	$r0,$r1,0

1c0012c4 <ls1x_puts>:
ls1x_puts():
1c0012c4:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c0012c8:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c0012cc:	2980a076 	st.w	$r22,$r3,40(0x28)
1c0012d0:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c0012d4:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c0012d8:	50003000 	b	48(0x30) # 1c001308 <ls1x_puts+0x44>
1c0012dc:	283fbecd 	ld.b	$r13,$r22,-17(0xfef)
1c0012e0:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c0012e4:	5c000dac 	bne	$r13,$r12,12(0xc) # 1c0012f0 <ls1x_puts+0x2c>
1c0012e8:	02803404 	addi.w	$r4,$r0,13(0xd)
1c0012ec:	57fe3fff 	bl	-452(0xffffe3c) # 1c001128 <myputchar>
1c0012f0:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c0012f4:	00150184 	move	$r4,$r12
1c0012f8:	57fe33ff 	bl	-464(0xffffe30) # 1c001128 <myputchar>
1c0012fc:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001300:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001304:	29bf72cc 	st.w	$r12,$r22,-36(0xfdc)
1c001308:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c00130c:	2a00018c 	ld.bu	$r12,$r12,0
1c001310:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c001314:	283fbecc 	ld.b	$r12,$r22,-17(0xfef)
1c001318:	47ffc59f 	bnez	$r12,-60(0x7fffc4) # 1c0012dc <ls1x_puts+0x18>
1c00131c:	0015000c 	move	$r12,$r0
1c001320:	00150184 	move	$r4,$r12
1c001324:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c001328:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c00132c:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c001330:	4c000020 	jirl	$r0,$r1,0

1c001334 <myprintf>:
myprintf():
1c001334:	02be8063 	addi.w	$r3,$r3,-96(0xfa0)
1c001338:	2980f061 	st.w	$r1,$r3,60(0x3c)
1c00133c:	2980e076 	st.w	$r22,$r3,56(0x38)
1c001340:	02810076 	addi.w	$r22,$r3,64(0x40)
1c001344:	29bf32c4 	st.w	$r4,$r22,-52(0xfcc)
1c001348:	298012c5 	st.w	$r5,$r22,4(0x4)
1c00134c:	298022c6 	st.w	$r6,$r22,8(0x8)
1c001350:	298032c7 	st.w	$r7,$r22,12(0xc)
1c001354:	298042c8 	st.w	$r8,$r22,16(0x10)
1c001358:	298052c9 	st.w	$r9,$r22,20(0x14)
1c00135c:	298062ca 	st.w	$r10,$r22,24(0x18)
1c001360:	298072cb 	st.w	$r11,$r22,28(0x1c)
1c001364:	028082cc 	addi.w	$r12,$r22,32(0x20)
1c001368:	02bf918c 	addi.w	$r12,$r12,-28(0xfe4)
1c00136c:	29bf72cc 	st.w	$r12,$r22,-36(0xfdc)
1c001370:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001374:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c001378:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c00137c:	50033000 	b	816(0x330) # 1c0016ac <myprintf+0x378>
1c001380:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001384:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c001388:	001031ac 	add.w	$r12,$r13,$r12
1c00138c:	2a00018c 	ld.bu	$r12,$r12,0
1c001390:	293f8ecc 	st.b	$r12,$r22,-29(0xfe3)
1c001394:	283f8ecd 	ld.b	$r13,$r22,-29(0xfe3)
1c001398:	0280940c 	addi.w	$r12,$r0,37(0x25)
1c00139c:	5c02e5ac 	bne	$r13,$r12,740(0x2e4) # 1c001680 <myprintf+0x34c>
1c0013a0:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0013a4:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c0013a8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0013ac:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0013b0:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c0013b4:	001031ac 	add.w	$r12,$r13,$r12
1c0013b8:	2800018c 	ld.b	$r12,$r12,0
1c0013bc:	02bf6d8c 	addi.w	$r12,$r12,-37(0xfdb)
1c0013c0:	02814c0d 	addi.w	$r13,$r0,83(0x53)
1c0013c4:	6802adac 	bltu	$r13,$r12,684(0x2ac) # 1c001670 <myprintf+0x33c>
1c0013c8:	0040898d 	slli.w	$r13,$r12,0x2
1c0013cc:	1c00004c 	pcaddu12i	$r12,2(0x2)
1c0013d0:	02b7918c 	addi.w	$r12,$r12,-540(0xde4)
1c0013d4:	001031ac 	add.w	$r12,$r13,$r12
1c0013d8:	2880018c 	ld.w	$r12,$r12,0
1c0013dc:	4c000180 	jirl	$r0,$r12,0
1c0013e0:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0013e4:	2880018c 	ld.w	$r12,$r12,0
1c0013e8:	00150184 	move	$r4,$r12
1c0013ec:	57fedbff 	bl	-296(0xffffed8) # 1c0012c4 <ls1x_puts>
1c0013f0:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0013f4:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c0013f8:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0013fc:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001400:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001404:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001408:	50029800 	b	664(0x298) # 1c0016a0 <myprintf+0x36c>
1c00140c:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001410:	2880018c 	ld.w	$r12,$r12,0
1c001414:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001418:	00150184 	move	$r4,$r12
1c00141c:	57fd0fff 	bl	-756(0xffffd0c) # 1c001128 <myputchar>
1c001420:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001424:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c001428:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c00142c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001430:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001434:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001438:	50026800 	b	616(0x268) # 1c0016a0 <myprintf+0x36c>
1c00143c:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001440:	2880018c 	ld.w	$r12,$r12,0
1c001444:	00150007 	move	$r7,$r0
1c001448:	02802806 	addi.w	$r6,$r0,10(0xa)
1c00144c:	28bf92c5 	ld.w	$r5,$r22,-28(0xfe4)
1c001450:	00150184 	move	$r4,$r12
1c001454:	57fd13ff 	bl	-752(0xffffd10) # 1c001164 <printbase>
1c001458:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c00145c:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c001460:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c001464:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001468:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c00146c:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001470:	50023000 	b	560(0x230) # 1c0016a0 <myprintf+0x36c>
1c001474:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001478:	2880018c 	ld.w	$r12,$r12,0
1c00147c:	02800407 	addi.w	$r7,$r0,1(0x1)
1c001480:	02802806 	addi.w	$r6,$r0,10(0xa)
1c001484:	28bf92c5 	ld.w	$r5,$r22,-28(0xfe4)
1c001488:	00150184 	move	$r4,$r12
1c00148c:	57fcdbff 	bl	-808(0xffffcd8) # 1c001164 <printbase>
1c001490:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001494:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c001498:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c00149c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0014a0:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0014a4:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0014a8:	5001f800 	b	504(0x1f8) # 1c0016a0 <myprintf+0x36c>
1c0014ac:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0014b0:	2880018c 	ld.w	$r12,$r12,0
1c0014b4:	00150007 	move	$r7,$r0
1c0014b8:	02802006 	addi.w	$r6,$r0,8(0x8)
1c0014bc:	28bf92c5 	ld.w	$r5,$r22,-28(0xfe4)
1c0014c0:	00150184 	move	$r4,$r12
1c0014c4:	57fca3ff 	bl	-864(0xffffca0) # 1c001164 <printbase>
1c0014c8:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0014cc:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c0014d0:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0014d4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0014d8:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0014dc:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0014e0:	5001c000 	b	448(0x1c0) # 1c0016a0 <myprintf+0x36c>
1c0014e4:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0014e8:	2880018c 	ld.w	$r12,$r12,0
1c0014ec:	00150007 	move	$r7,$r0
1c0014f0:	02800806 	addi.w	$r6,$r0,2(0x2)
1c0014f4:	28bf92c5 	ld.w	$r5,$r22,-28(0xfe4)
1c0014f8:	00150184 	move	$r4,$r12
1c0014fc:	57fc6bff 	bl	-920(0xffffc68) # 1c001164 <printbase>
1c001500:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001504:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c001508:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c00150c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001510:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001514:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001518:	50018800 	b	392(0x188) # 1c0016a0 <myprintf+0x36c>
1c00151c:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001520:	2880018c 	ld.w	$r12,$r12,0
1c001524:	00150007 	move	$r7,$r0
1c001528:	02804006 	addi.w	$r6,$r0,16(0x10)
1c00152c:	28bf92c5 	ld.w	$r5,$r22,-28(0xfe4)
1c001530:	00150184 	move	$r4,$r12
1c001534:	57fc33ff 	bl	-976(0xffffc30) # 1c001164 <printbase>
1c001538:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c00153c:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c001540:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c001544:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001548:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c00154c:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001550:	50015000 	b	336(0x150) # 1c0016a0 <myprintf+0x36c>
1c001554:	02809404 	addi.w	$r4,$r0,37(0x25)
1c001558:	57fbd3ff 	bl	-1072(0xffffbd0) # 1c001128 <myputchar>
1c00155c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001560:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001564:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001568:	50013800 	b	312(0x138) # 1c0016a0 <myprintf+0x36c>
1c00156c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001570:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001574:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001578:	29bf92c0 	st.w	$r0,$r22,-28(0xfe4)
1c00157c:	50003c00 	b	60(0x3c) # 1c0015b8 <myprintf+0x284>
1c001580:	28bf92cd 	ld.w	$r13,$r22,-28(0xfe4)
1c001584:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c001588:	001c31ad 	mul.w	$r13,$r13,$r12
1c00158c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001590:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001594:	28bf32ce 	ld.w	$r14,$r22,-52(0xfcc)
1c001598:	001031cc 	add.w	$r12,$r14,$r12
1c00159c:	2800018c 	ld.b	$r12,$r12,0
1c0015a0:	02bf418c 	addi.w	$r12,$r12,-48(0xfd0)
1c0015a4:	001031ac 	add.w	$r12,$r13,$r12
1c0015a8:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c0015ac:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0015b0:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0015b4:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0015b8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0015bc:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0015c0:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c0015c4:	001031ac 	add.w	$r12,$r13,$r12
1c0015c8:	2800018d 	ld.b	$r13,$r12,0
1c0015cc:	0280c00c 	addi.w	$r12,$r0,48(0x30)
1c0015d0:	67fdd98d 	bge	$r12,$r13,-552(0x3fdd8) # 1c0013a8 <myprintf+0x74>
1c0015d4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0015d8:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0015dc:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c0015e0:	001031ac 	add.w	$r12,$r13,$r12
1c0015e4:	2800018d 	ld.b	$r13,$r12,0
1c0015e8:	0280e40c 	addi.w	$r12,$r0,57(0x39)
1c0015ec:	67ff958d 	bge	$r12,$r13,-108(0x3ff94) # 1c001580 <myprintf+0x24c>
1c0015f0:	53fdbbff 	b	-584(0xffffdb8) # 1c0013a8 <myprintf+0x74>
1c0015f4:	29bf92c0 	st.w	$r0,$r22,-28(0xfe4)
1c0015f8:	50003c00 	b	60(0x3c) # 1c001634 <myprintf+0x300>
1c0015fc:	28bf92cd 	ld.w	$r13,$r22,-28(0xfe4)
1c001600:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c001604:	001c31ad 	mul.w	$r13,$r13,$r12
1c001608:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00160c:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001610:	28bf32ce 	ld.w	$r14,$r22,-52(0xfcc)
1c001614:	001031cc 	add.w	$r12,$r14,$r12
1c001618:	2800018c 	ld.b	$r12,$r12,0
1c00161c:	02bf418c 	addi.w	$r12,$r12,-48(0xfd0)
1c001620:	001031ac 	add.w	$r12,$r13,$r12
1c001624:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c001628:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00162c:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001630:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001634:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001638:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c00163c:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c001640:	001031ac 	add.w	$r12,$r13,$r12
1c001644:	2800018d 	ld.b	$r13,$r12,0
1c001648:	0280c00c 	addi.w	$r12,$r0,48(0x30)
1c00164c:	67fd5d8d 	bge	$r12,$r13,-676(0x3fd5c) # 1c0013a8 <myprintf+0x74>
1c001650:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001654:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001658:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c00165c:	001031ac 	add.w	$r12,$r13,$r12
1c001660:	2800018d 	ld.b	$r13,$r12,0
1c001664:	0280e40c 	addi.w	$r12,$r0,57(0x39)
1c001668:	67ff958d 	bge	$r12,$r13,-108(0x3ff94) # 1c0015fc <myprintf+0x2c8>
1c00166c:	53fd3fff 	b	-708(0xffffd3c) # 1c0013a8 <myprintf+0x74>
1c001670:	02809404 	addi.w	$r4,$r0,37(0x25)
1c001674:	57fab7ff 	bl	-1356(0xffffab4) # 1c001128 <myputchar>
1c001678:	03400000 	andi	$r0,$r0,0x0
1c00167c:	50002400 	b	36(0x24) # 1c0016a0 <myprintf+0x36c>
1c001680:	283f8ecd 	ld.b	$r13,$r22,-29(0xfe3)
1c001684:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c001688:	5c000dac 	bne	$r13,$r12,12(0xc) # 1c001694 <myprintf+0x360>
1c00168c:	02803404 	addi.w	$r4,$r0,13(0xd)
1c001690:	57fa9bff 	bl	-1384(0xffffa98) # 1c001128 <myputchar>
1c001694:	2a3f8ecc 	ld.bu	$r12,$r22,-29(0xfe3)
1c001698:	00150184 	move	$r4,$r12
1c00169c:	57fa8fff 	bl	-1396(0xffffa8c) # 1c001128 <myputchar>
1c0016a0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0016a4:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0016a8:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0016ac:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0016b0:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c0016b4:	001031ac 	add.w	$r12,$r13,$r12
1c0016b8:	2800018c 	ld.b	$r12,$r12,0
1c0016bc:	47fcc59f 	bnez	$r12,-828(0x7ffcc4) # 1c001380 <myprintf+0x4c>
1c0016c0:	0015000c 	move	$r12,$r0
1c0016c4:	00150184 	move	$r4,$r12
1c0016c8:	2880f061 	ld.w	$r1,$r3,60(0x3c)
1c0016cc:	2880e076 	ld.w	$r22,$r3,56(0x38)
1c0016d0:	02818063 	addi.w	$r3,$r3,96(0x60)
1c0016d4:	4c000020 	jirl	$r0,$r1,0

1c0016d8 <UART_SendData>:
UART_SendData():
1c0016d8:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0016dc:	29807076 	st.w	$r22,$r3,28(0x1c)
1c0016e0:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0016e4:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c0016e8:	001500ac 	move	$r12,$r5
1c0016ec:	293faecc 	st.b	$r12,$r22,-21(0xfeb)
1c0016f0:	03400000 	andi	$r0,$r0,0x0
1c0016f4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0016f8:	2a00158c 	ld.bu	$r12,$r12,5(0x5)
1c0016fc:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001700:	0340818c 	andi	$r12,$r12,0x20
1c001704:	43fff19f 	beqz	$r12,-16(0x7ffff0) # 1c0016f4 <UART_SendData+0x1c>
1c001708:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00170c:	2a3faecd 	ld.bu	$r13,$r22,-21(0xfeb)
1c001710:	2900018d 	st.b	$r13,$r12,0
1c001714:	03400000 	andi	$r0,$r0,0x0
1c001718:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c00171c:	02808063 	addi.w	$r3,$r3,32(0x20)
1c001720:	4c000020 	jirl	$r0,$r1,0

1c001724 <EnableInt>:
EnableInt():
1c001724:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c001728:	29803076 	st.w	$r22,$r3,12(0xc)
1c00172c:	02804076 	addi.w	$r22,$r3,16(0x10)
1c001730:	0380100c 	ori	$r12,$r0,0x4
1c001734:	0400018c 	csrxchg	$r12,$r12,0x0
1c001738:	03400000 	andi	$r0,$r0,0x0
1c00173c:	28803076 	ld.w	$r22,$r3,12(0xc)
1c001740:	02804063 	addi.w	$r3,$r3,16(0x10)
1c001744:	4c000020 	jirl	$r0,$r1,0

1c001748 <Set_Timer_stop>:
Set_Timer_stop():
1c001748:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c00174c:	29803076 	st.w	$r22,$r3,12(0xc)
1c001750:	02804076 	addi.w	$r22,$r3,16(0x10)
1c001754:	04010420 	csrwr	$r0,0x41
1c001758:	03400000 	andi	$r0,$r0,0x0
1c00175c:	28803076 	ld.w	$r22,$r3,12(0xc)
1c001760:	02804063 	addi.w	$r3,$r3,16(0x10)
1c001764:	4c000020 	jirl	$r0,$r1,0

1c001768 <Set_Timer_clear>:
Set_Timer_clear():
1c001768:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c00176c:	29803076 	st.w	$r22,$r3,12(0xc)
1c001770:	02804076 	addi.w	$r22,$r3,16(0x10)
1c001774:	0380040c 	ori	$r12,$r0,0x1
1c001778:	0401102c 	csrwr	$r12,0x44
1c00177c:	03400000 	andi	$r0,$r0,0x0
1c001780:	28803076 	ld.w	$r22,$r3,12(0xc)
1c001784:	02804063 	addi.w	$r3,$r3,16(0x10)
1c001788:	4c000020 	jirl	$r0,$r1,0

1c00178c <gpio_init>:
gpio_init():
1c00178c:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c001790:	2980b076 	st.w	$r22,$r3,44(0x2c)
1c001794:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c001798:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c00179c:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c0017a0:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c0017a4:	02807c0c 	addi.w	$r12,$r0,31(0x1f)
1c0017a8:	6000698d 	blt	$r12,$r13,104(0x68) # 1c001810 <gpio_init+0x84>
1c0017ac:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0017b0:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0017b4:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c0017b8:	44003180 	bnez	$r12,48(0x30) # 1c0017e8 <gpio_init+0x5c>
1c0017bc:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0017c0:	2881018d 	ld.w	$r13,$r12,64(0x40)
1c0017c4:	0280040e 	addi.w	$r14,$r0,1(0x1)
1c0017c8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0017cc:	001731cc 	sll.w	$r12,$r14,$r12
1c0017d0:	0014300c 	nor	$r12,$r0,$r12
1c0017d4:	0015018e 	move	$r14,$r12
1c0017d8:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0017dc:	0014b9ad 	and	$r13,$r13,$r14
1c0017e0:	2981018d 	st.w	$r13,$r12,64(0x40)
1c0017e4:	50009000 	b	144(0x90) # 1c001874 <gpio_init+0xe8>
1c0017e8:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0017ec:	2881018d 	ld.w	$r13,$r12,64(0x40)
1c0017f0:	0280040e 	addi.w	$r14,$r0,1(0x1)
1c0017f4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0017f8:	001731cc 	sll.w	$r12,$r14,$r12
1c0017fc:	0015018e 	move	$r14,$r12
1c001800:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c001804:	001539ad 	or	$r13,$r13,$r14
1c001808:	2981018d 	st.w	$r13,$r12,64(0x40)
1c00180c:	50006800 	b	104(0x68) # 1c001874 <gpio_init+0xe8>
1c001810:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001814:	02bf818c 	addi.w	$r12,$r12,-32(0xfe0)
1c001818:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c00181c:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c001820:	44003180 	bnez	$r12,48(0x30) # 1c001850 <gpio_init+0xc4>
1c001824:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c001828:	2881418d 	ld.w	$r13,$r12,80(0x50)
1c00182c:	0280040e 	addi.w	$r14,$r0,1(0x1)
1c001830:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001834:	001731cc 	sll.w	$r12,$r14,$r12
1c001838:	0014300c 	nor	$r12,$r0,$r12
1c00183c:	0015018e 	move	$r14,$r12
1c001840:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c001844:	0014b9ad 	and	$r13,$r13,$r14
1c001848:	2981418d 	st.w	$r13,$r12,80(0x50)
1c00184c:	50002800 	b	40(0x28) # 1c001874 <gpio_init+0xe8>
1c001850:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c001854:	2881418d 	ld.w	$r13,$r12,80(0x50)
1c001858:	0280040e 	addi.w	$r14,$r0,1(0x1)
1c00185c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001860:	001731cc 	sll.w	$r12,$r14,$r12
1c001864:	0015018e 	move	$r14,$r12
1c001868:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00186c:	001539ad 	or	$r13,$r13,$r14
1c001870:	2981418d 	st.w	$r13,$r12,80(0x50)
1c001874:	03400000 	andi	$r0,$r0,0x0
1c001878:	2880b076 	ld.w	$r22,$r3,44(0x2c)
1c00187c:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c001880:	4c000020 	jirl	$r0,$r1,0

1c001884 <gpio_write>:
gpio_write():
1c001884:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c001888:	2980b076 	st.w	$r22,$r3,44(0x2c)
1c00188c:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c001890:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c001894:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c001898:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c00189c:	02807c0c 	addi.w	$r12,$r0,31(0x1f)
1c0018a0:	6000698d 	blt	$r12,$r13,104(0x68) # 1c001908 <gpio_write+0x84>
1c0018a4:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0018a8:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0018ac:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c0018b0:	44003180 	bnez	$r12,48(0x30) # 1c0018e0 <gpio_write+0x5c>
1c0018b4:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0018b8:	2881118d 	ld.w	$r13,$r12,68(0x44)
1c0018bc:	0280040e 	addi.w	$r14,$r0,1(0x1)
1c0018c0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0018c4:	001731cc 	sll.w	$r12,$r14,$r12
1c0018c8:	0014300c 	nor	$r12,$r0,$r12
1c0018cc:	0015018e 	move	$r14,$r12
1c0018d0:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0018d4:	0014b9ad 	and	$r13,$r13,$r14
1c0018d8:	2981118d 	st.w	$r13,$r12,68(0x44)
1c0018dc:	50009000 	b	144(0x90) # 1c00196c <gpio_write+0xe8>
1c0018e0:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0018e4:	2881118d 	ld.w	$r13,$r12,68(0x44)
1c0018e8:	0280040e 	addi.w	$r14,$r0,1(0x1)
1c0018ec:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0018f0:	001731cc 	sll.w	$r12,$r14,$r12
1c0018f4:	0015018e 	move	$r14,$r12
1c0018f8:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0018fc:	001539ad 	or	$r13,$r13,$r14
1c001900:	2981118d 	st.w	$r13,$r12,68(0x44)
1c001904:	50006800 	b	104(0x68) # 1c00196c <gpio_write+0xe8>
1c001908:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c00190c:	02bf818c 	addi.w	$r12,$r12,-32(0xfe0)
1c001910:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001914:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c001918:	44003180 	bnez	$r12,48(0x30) # 1c001948 <gpio_write+0xc4>
1c00191c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c001920:	2881518d 	ld.w	$r13,$r12,84(0x54)
1c001924:	0280040e 	addi.w	$r14,$r0,1(0x1)
1c001928:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00192c:	001731cc 	sll.w	$r12,$r14,$r12
1c001930:	0014300c 	nor	$r12,$r0,$r12
1c001934:	0015018e 	move	$r14,$r12
1c001938:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00193c:	0014b9ad 	and	$r13,$r13,$r14
1c001940:	2981518d 	st.w	$r13,$r12,84(0x54)
1c001944:	50002800 	b	40(0x28) # 1c00196c <gpio_write+0xe8>
1c001948:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00194c:	2881518d 	ld.w	$r13,$r12,84(0x54)
1c001950:	0280040e 	addi.w	$r14,$r0,1(0x1)
1c001954:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001958:	001731cc 	sll.w	$r12,$r14,$r12
1c00195c:	0015018e 	move	$r14,$r12
1c001960:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c001964:	001539ad 	or	$r13,$r13,$r14
1c001968:	2981518d 	st.w	$r13,$r12,84(0x54)
1c00196c:	03400000 	andi	$r0,$r0,0x0
1c001970:	2880b076 	ld.w	$r22,$r3,44(0x2c)
1c001974:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c001978:	4c000020 	jirl	$r0,$r1,0

1c00197c <EXTI_ClearITPendingBit>:
EXTI_ClearITPendingBit():
1c00197c:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c001980:	29807076 	st.w	$r22,$r3,28(0x1c)
1c001984:	02808076 	addi.w	$r22,$r3,32(0x20)
1c001988:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c00198c:	29bfa2c5 	st.w	$r5,$r22,-24(0xfe8)
1c001990:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001994:	2880318d 	ld.w	$r13,$r12,12(0xc)
1c001998:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c00199c:	001531ad 	or	$r13,$r13,$r12
1c0019a0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0019a4:	2980318d 	st.w	$r13,$r12,12(0xc)
1c0019a8:	03400000 	andi	$r0,$r0,0x0
1c0019ac:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c0019b0:	02808063 	addi.w	$r3,$r3,32(0x20)
1c0019b4:	4c000020 	jirl	$r0,$r1,0

1c0019b8 <WDG_DogFeed>:
WDG_DogFeed():
1c0019b8:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0019bc:	29803076 	st.w	$r22,$r3,12(0xc)
1c0019c0:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0019c4:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0019c8:	154ab4ad 	lu12i.w	$r13,-371291(0xa55a5)
1c0019cc:	0396a9ad 	ori	$r13,$r13,0x5aa
1c0019d0:	2980d18d 	st.w	$r13,$r12,52(0x34)
1c0019d4:	03400000 	andi	$r0,$r0,0x0
1c0019d8:	28803076 	ld.w	$r22,$r3,12(0xc)
1c0019dc:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0019e0:	4c000020 	jirl	$r0,$r1,0

1c0019e4 <TIM_GetITStatus>:
TIM_GetITStatus():
1c0019e4:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c0019e8:	2980b076 	st.w	$r22,$r3,44(0x2c)
1c0019ec:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c0019f0:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c0019f4:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c0019f8:	157fda0c 	lu12i.w	$r12,-262448(0xbfed0)
1c0019fc:	2880018d 	ld.w	$r13,$r12,0
1c001a00:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001a04:	0014b1ac 	and	$r12,$r13,$r12
1c001a08:	40001180 	beqz	$r12,16(0x10) # 1c001a18 <TIM_GetITStatus+0x34>
1c001a0c:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c001a10:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001a14:	50000800 	b	8(0x8) # 1c001a1c <TIM_GetITStatus+0x38>
1c001a18:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c001a1c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001a20:	00150184 	move	$r4,$r12
1c001a24:	2880b076 	ld.w	$r22,$r3,44(0x2c)
1c001a28:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c001a2c:	4c000020 	jirl	$r0,$r1,0

1c001a30 <TIM_ClearIT>:
TIM_ClearIT():
1c001a30:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c001a34:	29807076 	st.w	$r22,$r3,28(0x1c)
1c001a38:	02808076 	addi.w	$r22,$r3,32(0x20)
1c001a3c:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c001a40:	157fda0c 	lu12i.w	$r12,-262448(0xbfed0)
1c001a44:	2880018e 	ld.w	$r14,$r12,0
1c001a48:	157fda0c 	lu12i.w	$r12,-262448(0xbfed0)
1c001a4c:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c001a50:	001535cd 	or	$r13,$r14,$r13
1c001a54:	2980018d 	st.w	$r13,$r12,0
1c001a58:	157fd40c 	lu12i.w	$r12,-262496(0xbfea0)
1c001a5c:	03800d8c 	ori	$r12,$r12,0x3
1c001a60:	2a00018c 	ld.bu	$r12,$r12,0
1c001a64:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c001a68:	157fd40c 	lu12i.w	$r12,-262496(0xbfea0)
1c001a6c:	03800d8c 	ori	$r12,$r12,0x3
1c001a70:	038005ad 	ori	$r13,$r13,0x1
1c001a74:	006781ad 	bstrpick.w	$r13,$r13,0x7,0x0
1c001a78:	2900018d 	st.b	$r13,$r12,0
1c001a7c:	03400000 	andi	$r0,$r0,0x0
1c001a80:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c001a84:	02808063 	addi.w	$r3,$r3,32(0x20)
1c001a88:	4c000020 	jirl	$r0,$r1,0

1c001a8c <LCD_GPIO_Init>:
LCD_GPIO_Init():
1c001a8c:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c001a90:	29807061 	st.w	$r1,$r3,28(0x1c)
1c001a94:	29806076 	st.w	$r22,$r3,24(0x18)
1c001a98:	02808076 	addi.w	$r22,$r3,32(0x20)
1c001a9c:	02800405 	addi.w	$r5,$r0,1(0x1)
1c001aa0:	02809404 	addi.w	$r4,$r0,37(0x25)
1c001aa4:	57fcebff 	bl	-792(0xffffce8) # 1c00178c <gpio_init>
1c001aa8:	02800405 	addi.w	$r5,$r0,1(0x1)
1c001aac:	02809004 	addi.w	$r4,$r0,36(0x24)
1c001ab0:	57fcdfff 	bl	-804(0xffffcdc) # 1c00178c <gpio_init>
1c001ab4:	02800405 	addi.w	$r5,$r0,1(0x1)
1c001ab8:	02808c04 	addi.w	$r4,$r0,35(0x23)
1c001abc:	57fcd3ff 	bl	-816(0xffffcd0) # 1c00178c <gpio_init>
1c001ac0:	02800405 	addi.w	$r5,$r0,1(0x1)
1c001ac4:	02805004 	addi.w	$r4,$r0,20(0x14)
1c001ac8:	57fcc7ff 	bl	-828(0xffffcc4) # 1c00178c <gpio_init>
1c001acc:	02800405 	addi.w	$r5,$r0,1(0x1)
1c001ad0:	02804c04 	addi.w	$r4,$r0,19(0x13)
1c001ad4:	57fcbbff 	bl	-840(0xffffcb8) # 1c00178c <gpio_init>
1c001ad8:	02800405 	addi.w	$r5,$r0,1(0x1)
1c001adc:	02808804 	addi.w	$r4,$r0,34(0x22)
1c001ae0:	57fcafff 	bl	-852(0xffffcac) # 1c00178c <gpio_init>
1c001ae4:	14001c6c 	lu12i.w	$r12,227(0xe3)
1c001ae8:	03bf918c 	ori	$r12,$r12,0xfe4
1c001aec:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001af0:	50001400 	b	20(0x14) # 1c001b04 <LCD_GPIO_Init+0x78>
1c001af4:	03400000 	andi	$r0,$r0,0x0
1c001af8:	03400000 	andi	$r0,$r0,0x0
1c001afc:	03400000 	andi	$r0,$r0,0x0
1c001b00:	03400000 	andi	$r0,$r0,0x0
1c001b04:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001b08:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c001b0c:	29bfb2cd 	st.w	$r13,$r22,-20(0xfec)
1c001b10:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c001af4 <LCD_GPIO_Init+0x68>
1c001b14:	03400000 	andi	$r0,$r0,0x0
1c001b18:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c001b1c:	28806076 	ld.w	$r22,$r3,24(0x18)
1c001b20:	02808063 	addi.w	$r3,$r3,32(0x20)
1c001b24:	4c000020 	jirl	$r0,$r1,0

1c001b28 <SPI_WriteData>:
SPI_WriteData():
1c001b28:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c001b2c:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c001b30:	2980a076 	st.w	$r22,$r3,40(0x28)
1c001b34:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c001b38:	0015008c 	move	$r12,$r4
1c001b3c:	293f7ecc 	st.b	$r12,$r22,-33(0xfdf)
1c001b40:	293fbec0 	st.b	$r0,$r22,-17(0xfef)
1c001b44:	0280200c 	addi.w	$r12,$r0,8(0x8)
1c001b48:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c001b4c:	50005800 	b	88(0x58) # 1c001ba4 <SPI_WriteData+0x7c>
1c001b50:	283f7ecc 	ld.b	$r12,$r22,-33(0xfdf)
1c001b54:	64001580 	bge	$r12,$r0,20(0x14) # 1c001b68 <SPI_WriteData+0x40>
1c001b58:	02800405 	addi.w	$r5,$r0,1(0x1)
1c001b5c:	02809404 	addi.w	$r4,$r0,37(0x25)
1c001b60:	57fd27ff 	bl	-732(0xffffd24) # 1c001884 <gpio_write>
1c001b64:	50001000 	b	16(0x10) # 1c001b74 <SPI_WriteData+0x4c>
1c001b68:	00150005 	move	$r5,$r0
1c001b6c:	02809404 	addi.w	$r4,$r0,37(0x25)
1c001b70:	57fd17ff 	bl	-748(0xffffd14) # 1c001884 <gpio_write>
1c001b74:	00150005 	move	$r5,$r0
1c001b78:	02804c04 	addi.w	$r4,$r0,19(0x13)
1c001b7c:	57fd0bff 	bl	-760(0xffffd08) # 1c001884 <gpio_write>
1c001b80:	02800405 	addi.w	$r5,$r0,1(0x1)
1c001b84:	02804c04 	addi.w	$r4,$r0,19(0x13)
1c001b88:	57fcffff 	bl	-772(0xffffcfc) # 1c001884 <gpio_write>
1c001b8c:	2a3f7ecc 	ld.bu	$r12,$r22,-33(0xfdf)
1c001b90:	0040858c 	slli.w	$r12,$r12,0x1
1c001b94:	293f7ecc 	st.b	$r12,$r22,-33(0xfdf)
1c001b98:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c001b9c:	02bffd8c 	addi.w	$r12,$r12,-1(0xfff)
1c001ba0:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c001ba4:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c001ba8:	47ffa99f 	bnez	$r12,-88(0x7fffa8) # 1c001b50 <SPI_WriteData+0x28>
1c001bac:	03400000 	andi	$r0,$r0,0x0
1c001bb0:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c001bb4:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c001bb8:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c001bbc:	4c000020 	jirl	$r0,$r1,0

1c001bc0 <Lcd_WriteIndex>:
Lcd_WriteIndex():
1c001bc0:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c001bc4:	29807061 	st.w	$r1,$r3,28(0x1c)
1c001bc8:	29806076 	st.w	$r22,$r3,24(0x18)
1c001bcc:	02808076 	addi.w	$r22,$r3,32(0x20)
1c001bd0:	0015008c 	move	$r12,$r4
1c001bd4:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c001bd8:	00150005 	move	$r5,$r0
1c001bdc:	02808c04 	addi.w	$r4,$r0,35(0x23)
1c001be0:	57fca7ff 	bl	-860(0xffffca4) # 1c001884 <gpio_write>
1c001be4:	00150005 	move	$r5,$r0
1c001be8:	02809004 	addi.w	$r4,$r0,36(0x24)
1c001bec:	57fc9bff 	bl	-872(0xffffc98) # 1c001884 <gpio_write>
1c001bf0:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c001bf4:	00150184 	move	$r4,$r12
1c001bf8:	57ff33ff 	bl	-208(0xfffff30) # 1c001b28 <SPI_WriteData>
1c001bfc:	02800405 	addi.w	$r5,$r0,1(0x1)
1c001c00:	02808c04 	addi.w	$r4,$r0,35(0x23)
1c001c04:	57fc83ff 	bl	-896(0xffffc80) # 1c001884 <gpio_write>
1c001c08:	03400000 	andi	$r0,$r0,0x0
1c001c0c:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c001c10:	28806076 	ld.w	$r22,$r3,24(0x18)
1c001c14:	02808063 	addi.w	$r3,$r3,32(0x20)
1c001c18:	4c000020 	jirl	$r0,$r1,0

1c001c1c <Lcd_WriteData>:
Lcd_WriteData():
1c001c1c:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c001c20:	29807061 	st.w	$r1,$r3,28(0x1c)
1c001c24:	29806076 	st.w	$r22,$r3,24(0x18)
1c001c28:	02808076 	addi.w	$r22,$r3,32(0x20)
1c001c2c:	0015008c 	move	$r12,$r4
1c001c30:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c001c34:	00150005 	move	$r5,$r0
1c001c38:	02808c04 	addi.w	$r4,$r0,35(0x23)
1c001c3c:	57fc4bff 	bl	-952(0xffffc48) # 1c001884 <gpio_write>
1c001c40:	02800405 	addi.w	$r5,$r0,1(0x1)
1c001c44:	02809004 	addi.w	$r4,$r0,36(0x24)
1c001c48:	57fc3fff 	bl	-964(0xffffc3c) # 1c001884 <gpio_write>
1c001c4c:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c001c50:	00150184 	move	$r4,$r12
1c001c54:	57fed7ff 	bl	-300(0xffffed4) # 1c001b28 <SPI_WriteData>
1c001c58:	02800405 	addi.w	$r5,$r0,1(0x1)
1c001c5c:	02808c04 	addi.w	$r4,$r0,35(0x23)
1c001c60:	57fc27ff 	bl	-988(0xffffc24) # 1c001884 <gpio_write>
1c001c64:	03400000 	andi	$r0,$r0,0x0
1c001c68:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c001c6c:	28806076 	ld.w	$r22,$r3,24(0x18)
1c001c70:	02808063 	addi.w	$r3,$r3,32(0x20)
1c001c74:	4c000020 	jirl	$r0,$r1,0

1c001c78 <LCD_WriteData_16Bit>:
LCD_WriteData_16Bit():
1c001c78:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c001c7c:	29807061 	st.w	$r1,$r3,28(0x1c)
1c001c80:	29806076 	st.w	$r22,$r3,24(0x18)
1c001c84:	02808076 	addi.w	$r22,$r3,32(0x20)
1c001c88:	0015008c 	move	$r12,$r4
1c001c8c:	297fbacc 	st.h	$r12,$r22,-18(0xfee)
1c001c90:	00150005 	move	$r5,$r0
1c001c94:	02808c04 	addi.w	$r4,$r0,35(0x23)
1c001c98:	57fbefff 	bl	-1044(0xffffbec) # 1c001884 <gpio_write>
1c001c9c:	02800405 	addi.w	$r5,$r0,1(0x1)
1c001ca0:	02809004 	addi.w	$r4,$r0,36(0x24)
1c001ca4:	57fbe3ff 	bl	-1056(0xffffbe0) # 1c001884 <gpio_write>
1c001ca8:	2a7fbacc 	ld.hu	$r12,$r22,-18(0xfee)
1c001cac:	0044a18c 	srli.w	$r12,$r12,0x8
1c001cb0:	006f818c 	bstrpick.w	$r12,$r12,0xf,0x0
1c001cb4:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001cb8:	00150184 	move	$r4,$r12
1c001cbc:	57fe6fff 	bl	-404(0xffffe6c) # 1c001b28 <SPI_WriteData>
1c001cc0:	2a7fbacc 	ld.hu	$r12,$r22,-18(0xfee)
1c001cc4:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001cc8:	00150184 	move	$r4,$r12
1c001ccc:	57fe5fff 	bl	-420(0xffffe5c) # 1c001b28 <SPI_WriteData>
1c001cd0:	02800405 	addi.w	$r5,$r0,1(0x1)
1c001cd4:	02808c04 	addi.w	$r4,$r0,35(0x23)
1c001cd8:	57fbafff 	bl	-1108(0xffffbac) # 1c001884 <gpio_write>
1c001cdc:	03400000 	andi	$r0,$r0,0x0
1c001ce0:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c001ce4:	28806076 	ld.w	$r22,$r3,24(0x18)
1c001ce8:	02808063 	addi.w	$r3,$r3,32(0x20)
1c001cec:	4c000020 	jirl	$r0,$r1,0

1c001cf0 <Lcd_Reset>:
Lcd_Reset():
1c001cf0:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c001cf4:	29807061 	st.w	$r1,$r3,28(0x1c)
1c001cf8:	29806076 	st.w	$r22,$r3,24(0x18)
1c001cfc:	02808076 	addi.w	$r22,$r3,32(0x20)
1c001d00:	00150005 	move	$r5,$r0
1c001d04:	02805004 	addi.w	$r4,$r0,20(0x14)
1c001d08:	57fb7fff 	bl	-1156(0xffffb7c) # 1c001884 <gpio_write>
1c001d0c:	140002cc 	lu12i.w	$r12,22(0x16)
1c001d10:	03b3298c 	ori	$r12,$r12,0xcca
1c001d14:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001d18:	50001400 	b	20(0x14) # 1c001d2c <Lcd_Reset+0x3c>
1c001d1c:	03400000 	andi	$r0,$r0,0x0
1c001d20:	03400000 	andi	$r0,$r0,0x0
1c001d24:	03400000 	andi	$r0,$r0,0x0
1c001d28:	03400000 	andi	$r0,$r0,0x0
1c001d2c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001d30:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c001d34:	29bfb2cd 	st.w	$r13,$r22,-20(0xfec)
1c001d38:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c001d1c <Lcd_Reset+0x2c>
1c001d3c:	02800405 	addi.w	$r5,$r0,1(0x1)
1c001d40:	02805004 	addi.w	$r4,$r0,20(0x14)
1c001d44:	57fb43ff 	bl	-1216(0xffffb40) # 1c001884 <gpio_write>
1c001d48:	1400016c 	lu12i.w	$r12,11(0xb)
1c001d4c:	0399958c 	ori	$r12,$r12,0x665
1c001d50:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c001d54:	50001400 	b	20(0x14) # 1c001d68 <Lcd_Reset+0x78>
1c001d58:	03400000 	andi	$r0,$r0,0x0
1c001d5c:	03400000 	andi	$r0,$r0,0x0
1c001d60:	03400000 	andi	$r0,$r0,0x0
1c001d64:	03400000 	andi	$r0,$r0,0x0
1c001d68:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001d6c:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c001d70:	29bfa2cd 	st.w	$r13,$r22,-24(0xfe8)
1c001d74:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c001d58 <Lcd_Reset+0x68>
1c001d78:	03400000 	andi	$r0,$r0,0x0
1c001d7c:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c001d80:	28806076 	ld.w	$r22,$r3,24(0x18)
1c001d84:	02808063 	addi.w	$r3,$r3,32(0x20)
1c001d88:	4c000020 	jirl	$r0,$r1,0

1c001d8c <Lcd_Init>:
Lcd_Init():
1c001d8c:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c001d90:	29807061 	st.w	$r1,$r3,28(0x1c)
1c001d94:	29806076 	st.w	$r22,$r3,24(0x18)
1c001d98:	02808076 	addi.w	$r22,$r3,32(0x20)
1c001d9c:	57fcf3ff 	bl	-784(0xffffcf0) # 1c001a8c <LCD_GPIO_Init>
1c001da0:	57ff53ff 	bl	-176(0xfffff50) # 1c001cf0 <Lcd_Reset>
1c001da4:	1400016c 	lu12i.w	$r12,11(0xb)
1c001da8:	0399958c 	ori	$r12,$r12,0x665
1c001dac:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001db0:	50001400 	b	20(0x14) # 1c001dc4 <Lcd_Init+0x38>
1c001db4:	03400000 	andi	$r0,$r0,0x0
1c001db8:	03400000 	andi	$r0,$r0,0x0
1c001dbc:	03400000 	andi	$r0,$r0,0x0
1c001dc0:	03400000 	andi	$r0,$r0,0x0
1c001dc4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001dc8:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c001dcc:	29bfb2cd 	st.w	$r13,$r22,-20(0xfec)
1c001dd0:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c001db4 <Lcd_Init+0x28>
1c001dd4:	02804404 	addi.w	$r4,$r0,17(0x11)
1c001dd8:	57fdebff 	bl	-536(0xffffde8) # 1c001bc0 <Lcd_WriteIndex>
1c001ddc:	1400016c 	lu12i.w	$r12,11(0xb)
1c001de0:	0399958c 	ori	$r12,$r12,0x665
1c001de4:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c001de8:	50001400 	b	20(0x14) # 1c001dfc <Lcd_Init+0x70>
1c001dec:	03400000 	andi	$r0,$r0,0x0
1c001df0:	03400000 	andi	$r0,$r0,0x0
1c001df4:	03400000 	andi	$r0,$r0,0x0
1c001df8:	03400000 	andi	$r0,$r0,0x0
1c001dfc:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001e00:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c001e04:	29bfa2cd 	st.w	$r13,$r22,-24(0xfe8)
1c001e08:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c001dec <Lcd_Init+0x60>
1c001e0c:	0282c404 	addi.w	$r4,$r0,177(0xb1)
1c001e10:	57fdb3ff 	bl	-592(0xffffdb0) # 1c001bc0 <Lcd_WriteIndex>
1c001e14:	02800404 	addi.w	$r4,$r0,1(0x1)
1c001e18:	57fe07ff 	bl	-508(0xffffe04) # 1c001c1c <Lcd_WriteData>
1c001e1c:	0280b004 	addi.w	$r4,$r0,44(0x2c)
1c001e20:	57fdffff 	bl	-516(0xffffdfc) # 1c001c1c <Lcd_WriteData>
1c001e24:	0280b404 	addi.w	$r4,$r0,45(0x2d)
1c001e28:	57fdf7ff 	bl	-524(0xffffdf4) # 1c001c1c <Lcd_WriteData>
1c001e2c:	0282c804 	addi.w	$r4,$r0,178(0xb2)
1c001e30:	57fd93ff 	bl	-624(0xffffd90) # 1c001bc0 <Lcd_WriteIndex>
1c001e34:	02800404 	addi.w	$r4,$r0,1(0x1)
1c001e38:	57fde7ff 	bl	-540(0xffffde4) # 1c001c1c <Lcd_WriteData>
1c001e3c:	0280b004 	addi.w	$r4,$r0,44(0x2c)
1c001e40:	57fddfff 	bl	-548(0xffffddc) # 1c001c1c <Lcd_WriteData>
1c001e44:	0280b404 	addi.w	$r4,$r0,45(0x2d)
1c001e48:	57fdd7ff 	bl	-556(0xffffdd4) # 1c001c1c <Lcd_WriteData>
1c001e4c:	0282cc04 	addi.w	$r4,$r0,179(0xb3)
1c001e50:	57fd73ff 	bl	-656(0xffffd70) # 1c001bc0 <Lcd_WriteIndex>
1c001e54:	02800404 	addi.w	$r4,$r0,1(0x1)
1c001e58:	57fdc7ff 	bl	-572(0xffffdc4) # 1c001c1c <Lcd_WriteData>
1c001e5c:	0280b004 	addi.w	$r4,$r0,44(0x2c)
1c001e60:	57fdbfff 	bl	-580(0xffffdbc) # 1c001c1c <Lcd_WriteData>
1c001e64:	0280b404 	addi.w	$r4,$r0,45(0x2d)
1c001e68:	57fdb7ff 	bl	-588(0xffffdb4) # 1c001c1c <Lcd_WriteData>
1c001e6c:	02800404 	addi.w	$r4,$r0,1(0x1)
1c001e70:	57fdafff 	bl	-596(0xffffdac) # 1c001c1c <Lcd_WriteData>
1c001e74:	0280b004 	addi.w	$r4,$r0,44(0x2c)
1c001e78:	57fda7ff 	bl	-604(0xffffda4) # 1c001c1c <Lcd_WriteData>
1c001e7c:	0280b404 	addi.w	$r4,$r0,45(0x2d)
1c001e80:	57fd9fff 	bl	-612(0xffffd9c) # 1c001c1c <Lcd_WriteData>
1c001e84:	0282d004 	addi.w	$r4,$r0,180(0xb4)
1c001e88:	57fd3bff 	bl	-712(0xffffd38) # 1c001bc0 <Lcd_WriteIndex>
1c001e8c:	02801c04 	addi.w	$r4,$r0,7(0x7)
1c001e90:	57fd8fff 	bl	-628(0xffffd8c) # 1c001c1c <Lcd_WriteData>
1c001e94:	02830004 	addi.w	$r4,$r0,192(0xc0)
1c001e98:	57fd2bff 	bl	-728(0xffffd28) # 1c001bc0 <Lcd_WriteIndex>
1c001e9c:	02828804 	addi.w	$r4,$r0,162(0xa2)
1c001ea0:	57fd7fff 	bl	-644(0xffffd7c) # 1c001c1c <Lcd_WriteData>
1c001ea4:	02800804 	addi.w	$r4,$r0,2(0x2)
1c001ea8:	57fd77ff 	bl	-652(0xffffd74) # 1c001c1c <Lcd_WriteData>
1c001eac:	02821004 	addi.w	$r4,$r0,132(0x84)
1c001eb0:	57fd6fff 	bl	-660(0xffffd6c) # 1c001c1c <Lcd_WriteData>
1c001eb4:	02830404 	addi.w	$r4,$r0,193(0xc1)
1c001eb8:	57fd0bff 	bl	-760(0xffffd08) # 1c001bc0 <Lcd_WriteIndex>
1c001ebc:	02831404 	addi.w	$r4,$r0,197(0xc5)
1c001ec0:	57fd5fff 	bl	-676(0xffffd5c) # 1c001c1c <Lcd_WriteData>
1c001ec4:	02830804 	addi.w	$r4,$r0,194(0xc2)
1c001ec8:	57fcfbff 	bl	-776(0xffffcf8) # 1c001bc0 <Lcd_WriteIndex>
1c001ecc:	02802804 	addi.w	$r4,$r0,10(0xa)
1c001ed0:	57fd4fff 	bl	-692(0xffffd4c) # 1c001c1c <Lcd_WriteData>
1c001ed4:	00150004 	move	$r4,$r0
1c001ed8:	57fd47ff 	bl	-700(0xffffd44) # 1c001c1c <Lcd_WriteData>
1c001edc:	02830c04 	addi.w	$r4,$r0,195(0xc3)
1c001ee0:	57fce3ff 	bl	-800(0xffffce0) # 1c001bc0 <Lcd_WriteIndex>
1c001ee4:	02822804 	addi.w	$r4,$r0,138(0x8a)
1c001ee8:	57fd37ff 	bl	-716(0xffffd34) # 1c001c1c <Lcd_WriteData>
1c001eec:	0280a804 	addi.w	$r4,$r0,42(0x2a)
1c001ef0:	57fd2fff 	bl	-724(0xffffd2c) # 1c001c1c <Lcd_WriteData>
1c001ef4:	02831004 	addi.w	$r4,$r0,196(0xc4)
1c001ef8:	57fccbff 	bl	-824(0xffffcc8) # 1c001bc0 <Lcd_WriteIndex>
1c001efc:	02822804 	addi.w	$r4,$r0,138(0x8a)
1c001f00:	57fd1fff 	bl	-740(0xffffd1c) # 1c001c1c <Lcd_WriteData>
1c001f04:	0283b804 	addi.w	$r4,$r0,238(0xee)
1c001f08:	57fd17ff 	bl	-748(0xffffd14) # 1c001c1c <Lcd_WriteData>
1c001f0c:	02831404 	addi.w	$r4,$r0,197(0xc5)
1c001f10:	57fcb3ff 	bl	-848(0xffffcb0) # 1c001bc0 <Lcd_WriteIndex>
1c001f14:	02803804 	addi.w	$r4,$r0,14(0xe)
1c001f18:	57fd07ff 	bl	-764(0xffffd04) # 1c001c1c <Lcd_WriteData>
1c001f1c:	0280d804 	addi.w	$r4,$r0,54(0x36)
1c001f20:	57fca3ff 	bl	-864(0xffffca0) # 1c001bc0 <Lcd_WriteIndex>
1c001f24:	02818004 	addi.w	$r4,$r0,96(0x60)
1c001f28:	57fcf7ff 	bl	-780(0xffffcf4) # 1c001c1c <Lcd_WriteData>
1c001f2c:	02838004 	addi.w	$r4,$r0,224(0xe0)
1c001f30:	57fc93ff 	bl	-880(0xffffc90) # 1c001bc0 <Lcd_WriteIndex>
1c001f34:	02803c04 	addi.w	$r4,$r0,15(0xf)
1c001f38:	57fce7ff 	bl	-796(0xffffce4) # 1c001c1c <Lcd_WriteData>
1c001f3c:	02806804 	addi.w	$r4,$r0,26(0x1a)
1c001f40:	57fcdfff 	bl	-804(0xffffcdc) # 1c001c1c <Lcd_WriteData>
1c001f44:	02803c04 	addi.w	$r4,$r0,15(0xf)
1c001f48:	57fcd7ff 	bl	-812(0xffffcd4) # 1c001c1c <Lcd_WriteData>
1c001f4c:	02806004 	addi.w	$r4,$r0,24(0x18)
1c001f50:	57fccfff 	bl	-820(0xffffccc) # 1c001c1c <Lcd_WriteData>
1c001f54:	0280bc04 	addi.w	$r4,$r0,47(0x2f)
1c001f58:	57fcc7ff 	bl	-828(0xffffcc4) # 1c001c1c <Lcd_WriteData>
1c001f5c:	0280a004 	addi.w	$r4,$r0,40(0x28)
1c001f60:	57fcbfff 	bl	-836(0xffffcbc) # 1c001c1c <Lcd_WriteData>
1c001f64:	02808004 	addi.w	$r4,$r0,32(0x20)
1c001f68:	57fcb7ff 	bl	-844(0xffffcb4) # 1c001c1c <Lcd_WriteData>
1c001f6c:	02808804 	addi.w	$r4,$r0,34(0x22)
1c001f70:	57fcafff 	bl	-852(0xffffcac) # 1c001c1c <Lcd_WriteData>
1c001f74:	02807c04 	addi.w	$r4,$r0,31(0x1f)
1c001f78:	57fca7ff 	bl	-860(0xffffca4) # 1c001c1c <Lcd_WriteData>
1c001f7c:	02806c04 	addi.w	$r4,$r0,27(0x1b)
1c001f80:	57fc9fff 	bl	-868(0xffffc9c) # 1c001c1c <Lcd_WriteData>
1c001f84:	02808c04 	addi.w	$r4,$r0,35(0x23)
1c001f88:	57fc97ff 	bl	-876(0xffffc94) # 1c001c1c <Lcd_WriteData>
1c001f8c:	0280dc04 	addi.w	$r4,$r0,55(0x37)
1c001f90:	57fc8fff 	bl	-884(0xffffc8c) # 1c001c1c <Lcd_WriteData>
1c001f94:	00150004 	move	$r4,$r0
1c001f98:	57fc87ff 	bl	-892(0xffffc84) # 1c001c1c <Lcd_WriteData>
1c001f9c:	02801c04 	addi.w	$r4,$r0,7(0x7)
1c001fa0:	57fc7fff 	bl	-900(0xffffc7c) # 1c001c1c <Lcd_WriteData>
1c001fa4:	02800804 	addi.w	$r4,$r0,2(0x2)
1c001fa8:	57fc77ff 	bl	-908(0xffffc74) # 1c001c1c <Lcd_WriteData>
1c001fac:	02804004 	addi.w	$r4,$r0,16(0x10)
1c001fb0:	57fc6fff 	bl	-916(0xffffc6c) # 1c001c1c <Lcd_WriteData>
1c001fb4:	02838404 	addi.w	$r4,$r0,225(0xe1)
1c001fb8:	57fc0bff 	bl	-1016(0xffffc08) # 1c001bc0 <Lcd_WriteIndex>
1c001fbc:	02803c04 	addi.w	$r4,$r0,15(0xf)
1c001fc0:	57fc5fff 	bl	-932(0xffffc5c) # 1c001c1c <Lcd_WriteData>
1c001fc4:	02806c04 	addi.w	$r4,$r0,27(0x1b)
1c001fc8:	57fc57ff 	bl	-940(0xffffc54) # 1c001c1c <Lcd_WriteData>
1c001fcc:	02803c04 	addi.w	$r4,$r0,15(0xf)
1c001fd0:	57fc4fff 	bl	-948(0xffffc4c) # 1c001c1c <Lcd_WriteData>
1c001fd4:	02805c04 	addi.w	$r4,$r0,23(0x17)
1c001fd8:	57fc47ff 	bl	-956(0xffffc44) # 1c001c1c <Lcd_WriteData>
1c001fdc:	0280cc04 	addi.w	$r4,$r0,51(0x33)
1c001fe0:	57fc3fff 	bl	-964(0xffffc3c) # 1c001c1c <Lcd_WriteData>
1c001fe4:	0280b004 	addi.w	$r4,$r0,44(0x2c)
1c001fe8:	57fc37ff 	bl	-972(0xffffc34) # 1c001c1c <Lcd_WriteData>
1c001fec:	0280a404 	addi.w	$r4,$r0,41(0x29)
1c001ff0:	57fc2fff 	bl	-980(0xffffc2c) # 1c001c1c <Lcd_WriteData>
1c001ff4:	0280b804 	addi.w	$r4,$r0,46(0x2e)
1c001ff8:	57fc27ff 	bl	-988(0xffffc24) # 1c001c1c <Lcd_WriteData>
1c001ffc:	0280c004 	addi.w	$r4,$r0,48(0x30)
1c002000:	57fc1fff 	bl	-996(0xffffc1c) # 1c001c1c <Lcd_WriteData>
1c002004:	0280c004 	addi.w	$r4,$r0,48(0x30)
1c002008:	57fc17ff 	bl	-1004(0xffffc14) # 1c001c1c <Lcd_WriteData>
1c00200c:	0280e404 	addi.w	$r4,$r0,57(0x39)
1c002010:	57fc0fff 	bl	-1012(0xffffc0c) # 1c001c1c <Lcd_WriteData>
1c002014:	0280fc04 	addi.w	$r4,$r0,63(0x3f)
1c002018:	57fc07ff 	bl	-1020(0xffffc04) # 1c001c1c <Lcd_WriteData>
1c00201c:	00150004 	move	$r4,$r0
1c002020:	57fbffff 	bl	-1028(0xffffbfc) # 1c001c1c <Lcd_WriteData>
1c002024:	02801c04 	addi.w	$r4,$r0,7(0x7)
1c002028:	57fbf7ff 	bl	-1036(0xffffbf4) # 1c001c1c <Lcd_WriteData>
1c00202c:	02800c04 	addi.w	$r4,$r0,3(0x3)
1c002030:	57fbefff 	bl	-1044(0xffffbec) # 1c001c1c <Lcd_WriteData>
1c002034:	02804004 	addi.w	$r4,$r0,16(0x10)
1c002038:	57fbe7ff 	bl	-1052(0xffffbe4) # 1c001c1c <Lcd_WriteData>
1c00203c:	0280a804 	addi.w	$r4,$r0,42(0x2a)
1c002040:	57fb83ff 	bl	-1152(0xffffb80) # 1c001bc0 <Lcd_WriteIndex>
1c002044:	00150004 	move	$r4,$r0
1c002048:	57fbd7ff 	bl	-1068(0xffffbd4) # 1c001c1c <Lcd_WriteData>
1c00204c:	00150004 	move	$r4,$r0
1c002050:	57fbcfff 	bl	-1076(0xffffbcc) # 1c001c1c <Lcd_WriteData>
1c002054:	00150004 	move	$r4,$r0
1c002058:	57fbc7ff 	bl	-1084(0xffffbc4) # 1c001c1c <Lcd_WriteData>
1c00205c:	0281fc04 	addi.w	$r4,$r0,127(0x7f)
1c002060:	57fbbfff 	bl	-1092(0xffffbbc) # 1c001c1c <Lcd_WriteData>
1c002064:	0280ac04 	addi.w	$r4,$r0,43(0x2b)
1c002068:	57fb5bff 	bl	-1192(0xffffb58) # 1c001bc0 <Lcd_WriteIndex>
1c00206c:	00150004 	move	$r4,$r0
1c002070:	57fbafff 	bl	-1108(0xffffbac) # 1c001c1c <Lcd_WriteData>
1c002074:	00150004 	move	$r4,$r0
1c002078:	57fba7ff 	bl	-1116(0xffffba4) # 1c001c1c <Lcd_WriteData>
1c00207c:	00150004 	move	$r4,$r0
1c002080:	57fb9fff 	bl	-1124(0xffffb9c) # 1c001c1c <Lcd_WriteData>
1c002084:	02827c04 	addi.w	$r4,$r0,159(0x9f)
1c002088:	57fb97ff 	bl	-1132(0xffffb94) # 1c001c1c <Lcd_WriteData>
1c00208c:	0283c004 	addi.w	$r4,$r0,240(0xf0)
1c002090:	57fb33ff 	bl	-1232(0xffffb30) # 1c001bc0 <Lcd_WriteIndex>
1c002094:	02800404 	addi.w	$r4,$r0,1(0x1)
1c002098:	57fb87ff 	bl	-1148(0xffffb84) # 1c001c1c <Lcd_WriteData>
1c00209c:	0283d804 	addi.w	$r4,$r0,246(0xf6)
1c0020a0:	57fb23ff 	bl	-1248(0xffffb20) # 1c001bc0 <Lcd_WriteIndex>
1c0020a4:	00150004 	move	$r4,$r0
1c0020a8:	57fb77ff 	bl	-1164(0xffffb74) # 1c001c1c <Lcd_WriteData>
1c0020ac:	0280e804 	addi.w	$r4,$r0,58(0x3a)
1c0020b0:	57fb13ff 	bl	-1264(0xffffb10) # 1c001bc0 <Lcd_WriteIndex>
1c0020b4:	02801404 	addi.w	$r4,$r0,5(0x5)
1c0020b8:	57fb67ff 	bl	-1180(0xffffb64) # 1c001c1c <Lcd_WriteData>
1c0020bc:	0280a404 	addi.w	$r4,$r0,41(0x29)
1c0020c0:	57fb03ff 	bl	-1280(0xffffb00) # 1c001bc0 <Lcd_WriteIndex>
1c0020c4:	140001ec 	lu12i.w	$r12,15(0xf)
1c0020c8:	03bffd84 	ori	$r4,$r12,0xfff
1c0020cc:	54010c00 	bl	268(0x10c) # 1c0021d8 <Lcd_Clear>
1c0020d0:	03abc80c 	ori	$r12,$r0,0xaf2
1c0020d4:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c0020d8:	50001400 	b	20(0x14) # 1c0020ec <Lcd_Init+0x360>
1c0020dc:	03400000 	andi	$r0,$r0,0x0
1c0020e0:	03400000 	andi	$r0,$r0,0x0
1c0020e4:	03400000 	andi	$r0,$r0,0x0
1c0020e8:	03400000 	andi	$r0,$r0,0x0
1c0020ec:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c0020f0:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c0020f4:	29bf92cd 	st.w	$r13,$r22,-28(0xfe4)
1c0020f8:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c0020dc <Lcd_Init+0x350>
1c0020fc:	03400000 	andi	$r0,$r0,0x0
1c002100:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c002104:	28806076 	ld.w	$r22,$r3,24(0x18)
1c002108:	02808063 	addi.w	$r3,$r3,32(0x20)
1c00210c:	4c000020 	jirl	$r0,$r1,0

1c002110 <Lcd_SetRegion>:
Lcd_SetRegion():
1c002110:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002114:	29807061 	st.w	$r1,$r3,28(0x1c)
1c002118:	29806076 	st.w	$r22,$r3,24(0x18)
1c00211c:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002120:	0015008c 	move	$r12,$r4
1c002124:	001500af 	move	$r15,$r5
1c002128:	001500ce 	move	$r14,$r6
1c00212c:	001500ed 	move	$r13,$r7
1c002130:	297fbacc 	st.h	$r12,$r22,-18(0xfee)
1c002134:	001501ec 	move	$r12,$r15
1c002138:	297fb2cc 	st.h	$r12,$r22,-20(0xfec)
1c00213c:	001501cc 	move	$r12,$r14
1c002140:	297faacc 	st.h	$r12,$r22,-22(0xfea)
1c002144:	001501ac 	move	$r12,$r13
1c002148:	297fa2cc 	st.h	$r12,$r22,-24(0xfe8)
1c00214c:	0280a804 	addi.w	$r4,$r0,42(0x2a)
1c002150:	57fa73ff 	bl	-1424(0xffffa70) # 1c001bc0 <Lcd_WriteIndex>
1c002154:	00150004 	move	$r4,$r0
1c002158:	57fac7ff 	bl	-1340(0xffffac4) # 1c001c1c <Lcd_WriteData>
1c00215c:	2a7fbacc 	ld.hu	$r12,$r22,-18(0xfee)
1c002160:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c002164:	00150184 	move	$r4,$r12
1c002168:	57fab7ff 	bl	-1356(0xffffab4) # 1c001c1c <Lcd_WriteData>
1c00216c:	00150004 	move	$r4,$r0
1c002170:	57faafff 	bl	-1364(0xffffaac) # 1c001c1c <Lcd_WriteData>
1c002174:	2a7faacc 	ld.hu	$r12,$r22,-22(0xfea)
1c002178:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c00217c:	00150184 	move	$r4,$r12
1c002180:	57fa9fff 	bl	-1380(0xffffa9c) # 1c001c1c <Lcd_WriteData>
1c002184:	0280ac04 	addi.w	$r4,$r0,43(0x2b)
1c002188:	57fa3bff 	bl	-1480(0xffffa38) # 1c001bc0 <Lcd_WriteIndex>
1c00218c:	00150004 	move	$r4,$r0
1c002190:	57fa8fff 	bl	-1396(0xffffa8c) # 1c001c1c <Lcd_WriteData>
1c002194:	2a7fb2cc 	ld.hu	$r12,$r22,-20(0xfec)
1c002198:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c00219c:	00150184 	move	$r4,$r12
1c0021a0:	57fa7fff 	bl	-1412(0xffffa7c) # 1c001c1c <Lcd_WriteData>
1c0021a4:	00150004 	move	$r4,$r0
1c0021a8:	57fa77ff 	bl	-1420(0xffffa74) # 1c001c1c <Lcd_WriteData>
1c0021ac:	2a7fa2cc 	ld.hu	$r12,$r22,-24(0xfe8)
1c0021b0:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0021b4:	00150184 	move	$r4,$r12
1c0021b8:	57fa67ff 	bl	-1436(0xffffa64) # 1c001c1c <Lcd_WriteData>
1c0021bc:	0280b004 	addi.w	$r4,$r0,44(0x2c)
1c0021c0:	57fa03ff 	bl	-1536(0xffffa00) # 1c001bc0 <Lcd_WriteIndex>
1c0021c4:	03400000 	andi	$r0,$r0,0x0
1c0021c8:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c0021cc:	28806076 	ld.w	$r22,$r3,24(0x18)
1c0021d0:	02808063 	addi.w	$r3,$r3,32(0x20)
1c0021d4:	4c000020 	jirl	$r0,$r1,0

1c0021d8 <Lcd_Clear>:
Lcd_Clear():
1c0021d8:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c0021dc:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c0021e0:	2980a076 	st.w	$r22,$r3,40(0x28)
1c0021e4:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c0021e8:	0015008c 	move	$r12,$r4
1c0021ec:	297f7acc 	st.h	$r12,$r22,-34(0xfde)
1c0021f0:	0281fc07 	addi.w	$r7,$r0,127(0x7f)
1c0021f4:	02829c06 	addi.w	$r6,$r0,167(0xa7)
1c0021f8:	00150005 	move	$r5,$r0
1c0021fc:	00150004 	move	$r4,$r0
1c002200:	57ff13ff 	bl	-240(0xfffff10) # 1c002110 <Lcd_SetRegion>
1c002204:	0280b004 	addi.w	$r4,$r0,44(0x2c)
1c002208:	57f9bbff 	bl	-1608(0xffff9b8) # 1c001bc0 <Lcd_WriteIndex>
1c00220c:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c002210:	50003c00 	b	60(0x3c) # 1c00224c <Lcd_Clear+0x74>
1c002214:	29bfa2c0 	st.w	$r0,$r22,-24(0xfe8)
1c002218:	50001c00 	b	28(0x1c) # 1c002234 <Lcd_Clear+0x5c>
1c00221c:	2a7f7acc 	ld.hu	$r12,$r22,-34(0xfde)
1c002220:	00150184 	move	$r4,$r12
1c002224:	57fa57ff 	bl	-1452(0xffffa54) # 1c001c78 <LCD_WriteData_16Bit>
1c002228:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c00222c:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002230:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c002234:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c002238:	0281fc0c 	addi.w	$r12,$r0,127(0x7f)
1c00223c:	6fffe18d 	bgeu	$r12,$r13,-32(0x3ffe0) # 1c00221c <Lcd_Clear+0x44>
1c002240:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002244:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002248:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c00224c:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c002250:	02829c0c 	addi.w	$r12,$r0,167(0xa7)
1c002254:	6fffc18d 	bgeu	$r12,$r13,-64(0x3ffc0) # 1c002214 <Lcd_Clear+0x3c>
1c002258:	03400000 	andi	$r0,$r0,0x0
1c00225c:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c002260:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c002264:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c002268:	4c000020 	jirl	$r0,$r1,0

1c00226c <recv_dat_int>:
recv_dat_int():
1c00226c:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002270:	29807061 	st.w	$r1,$r3,28(0x1c)
1c002274:	29806076 	st.w	$r22,$r3,24(0x18)
1c002278:	02808076 	addi.w	$r22,$r3,32(0x20)
1c00227c:	0015008c 	move	$r12,$r4
1c002280:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c002284:	1cc7ffcc 	pcaddu12i	$r12,409598(0x63ffe)
1c002288:	02b5f18c 	addi.w	$r12,$r12,-644(0xd7c)
1c00228c:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c002290:	2980018d 	st.w	$r13,$r12,0
1c002294:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c002298:	00150185 	move	$r5,$r12
1c00229c:	1cc7ffc4 	pcaddu12i	$r4,409598(0x63ffe)
1c0022a0:	02b5a084 	addi.w	$r4,$r4,-664(0xd68)
1c0022a4:	54001800 	bl	24(0x18) # 1c0022bc <Buffer_write>
1c0022a8:	03400000 	andi	$r0,$r0,0x0
1c0022ac:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c0022b0:	28806076 	ld.w	$r22,$r3,24(0x18)
1c0022b4:	02808063 	addi.w	$r3,$r3,32(0x20)
1c0022b8:	4c000020 	jirl	$r0,$r1,0

1c0022bc <Buffer_write>:
Buffer_write():
1c0022bc:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0022c0:	29807076 	st.w	$r22,$r3,28(0x1c)
1c0022c4:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0022c8:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c0022cc:	001500ac 	move	$r12,$r5
1c0022d0:	293faecc 	st.b	$r12,$r22,-21(0xfeb)
1c0022d4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0022d8:	2880018c 	ld.w	$r12,$r12,0
1c0022dc:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c0022e0:	288031ad 	ld.w	$r13,$r13,12(0xc)
1c0022e4:	0010358c 	add.w	$r12,$r12,$r13
1c0022e8:	2a3faecd 	ld.bu	$r13,$r22,-21(0xfeb)
1c0022ec:	2900018d 	st.b	$r13,$r12,0
1c0022f0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0022f4:	2880318c 	ld.w	$r12,$r12,12(0xc)
1c0022f8:	0280058d 	addi.w	$r13,$r12,1(0x1)
1c0022fc:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002300:	2980318d 	st.w	$r13,$r12,12(0xc)
1c002304:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002308:	2880318d 	ld.w	$r13,$r12,12(0xc)
1c00230c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002310:	2880118c 	ld.w	$r12,$r12,4(0x4)
1c002314:	60000dac 	blt	$r13,$r12,12(0xc) # 1c002320 <Buffer_write+0x64>
1c002318:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00231c:	29803180 	st.w	$r0,$r12,12(0xc)
1c002320:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002324:	2880418c 	ld.w	$r12,$r12,16(0x10)
1c002328:	0280058d 	addi.w	$r13,$r12,1(0x1)
1c00232c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002330:	2980418d 	st.w	$r13,$r12,16(0x10)
1c002334:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002338:	2880418d 	ld.w	$r13,$r12,16(0x10)
1c00233c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002340:	2880118c 	ld.w	$r12,$r12,4(0x4)
1c002344:	6400458d 	bge	$r12,$r13,68(0x44) # 1c002388 <Buffer_write+0xcc>
1c002348:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00234c:	2880118d 	ld.w	$r13,$r12,4(0x4)
1c002350:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002354:	2980418d 	st.w	$r13,$r12,16(0x10)
1c002358:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00235c:	2880218c 	ld.w	$r12,$r12,8(0x8)
1c002360:	0280058d 	addi.w	$r13,$r12,1(0x1)
1c002364:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002368:	2980218d 	st.w	$r13,$r12,8(0x8)
1c00236c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002370:	2880218d 	ld.w	$r13,$r12,8(0x8)
1c002374:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002378:	2880118c 	ld.w	$r12,$r12,4(0x4)
1c00237c:	60000dac 	blt	$r13,$r12,12(0xc) # 1c002388 <Buffer_write+0xcc>
1c002380:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002384:	29802180 	st.w	$r0,$r12,8(0x8)
1c002388:	03400000 	andi	$r0,$r0,0x0
1c00238c:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c002390:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002394:	4c000020 	jirl	$r0,$r1,0

1c002398 <main>:
main():
1c002398:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c00239c:	29807061 	st.w	$r1,$r3,28(0x1c)
1c0023a0:	29806076 	st.w	$r22,$r3,24(0x18)
1c0023a4:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0023a8:	57f37fff 	bl	-3204(0xffff37c) # 1c001724 <EnableInt>
1c0023ac:	57f9e3ff 	bl	-1568(0xffff9e0) # 1c001d8c <Lcd_Init>
1c0023b0:	1400002c 	lu12i.w	$r12,1(0x1)
1c0023b4:	0388f98c 	ori	$r12,$r12,0x23e
1c0023b8:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0023bc:	50001400 	b	20(0x14) # 1c0023d0 <main+0x38>
1c0023c0:	03400000 	andi	$r0,$r0,0x0
1c0023c4:	03400000 	andi	$r0,$r0,0x0
1c0023c8:	03400000 	andi	$r0,$r0,0x0
1c0023cc:	03400000 	andi	$r0,$r0,0x0
1c0023d0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0023d4:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c0023d8:	29bfb2cd 	st.w	$r13,$r22,-20(0xfec)
1c0023dc:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c0023c0 <main+0x28>
1c0023e0:	02800405 	addi.w	$r5,$r0,1(0x1)
1c0023e4:	02808804 	addi.w	$r4,$r0,34(0x22)
1c0023e8:	57f49fff 	bl	-2916(0xffff49c) # 1c001884 <gpio_write>
1c0023ec:	14000e2c 	lu12i.w	$r12,113(0x71)
1c0023f0:	03bfc98c 	ori	$r12,$r12,0xff2
1c0023f4:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0023f8:	50001400 	b	20(0x14) # 1c00240c <main+0x74>
1c0023fc:	03400000 	andi	$r0,$r0,0x0
1c002400:	03400000 	andi	$r0,$r0,0x0
1c002404:	03400000 	andi	$r0,$r0,0x0
1c002408:	03400000 	andi	$r0,$r0,0x0
1c00240c:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c002410:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c002414:	29bfa2cd 	st.w	$r13,$r22,-24(0xfe8)
1c002418:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c0023fc <main+0x64>
1c00241c:	00150005 	move	$r5,$r0
1c002420:	02808804 	addi.w	$r4,$r0,34(0x22)
1c002424:	57f463ff 	bl	-2976(0xffff460) # 1c001884 <gpio_write>
1c002428:	14000e2c 	lu12i.w	$r12,113(0x71)
1c00242c:	03bfc98c 	ori	$r12,$r12,0xff2
1c002430:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c002434:	50001400 	b	20(0x14) # 1c002448 <main+0xb0>
1c002438:	03400000 	andi	$r0,$r0,0x0
1c00243c:	03400000 	andi	$r0,$r0,0x0
1c002440:	03400000 	andi	$r0,$r0,0x0
1c002444:	03400000 	andi	$r0,$r0,0x0
1c002448:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c00244c:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c002450:	29bf92cd 	st.w	$r13,$r22,-28(0xfe4)
1c002454:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c002438 <main+0xa0>
1c002458:	53ff8bff 	b	-120(0xfffff88) # 1c0023e0 <main+0x48>

1c00245c <exti_gpioa0_irq_handler>:
exti_gpioa0_irq_handler():
1c00245c:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c002460:	29803061 	st.w	$r1,$r3,12(0xc)
1c002464:	29802076 	st.w	$r22,$r3,8(0x8)
1c002468:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00246c:	1c000026 	pcaddu12i	$r6,1(0x1)
1c002470:	0281a0c6 	addi.w	$r6,$r6,104(0x68)
1c002474:	02804c05 	addi.w	$r5,$r0,19(0x13)
1c002478:	1c000024 	pcaddu12i	$r4,1(0x1)
1c00247c:	02ba2084 	addi.w	$r4,$r4,-376(0xe88)
1c002480:	57eeb7ff 	bl	-4428(0xfffeeb4) # 1c001334 <myprintf>
1c002484:	02800405 	addi.w	$r5,$r0,1(0x1)
1c002488:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00248c:	03808184 	ori	$r4,$r12,0x20
1c002490:	57f4efff 	bl	-2836(0xffff4ec) # 1c00197c <EXTI_ClearITPendingBit>
1c002494:	03400000 	andi	$r0,$r0,0x0
1c002498:	28803061 	ld.w	$r1,$r3,12(0xc)
1c00249c:	28802076 	ld.w	$r22,$r3,8(0x8)
1c0024a0:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0024a4:	4c000020 	jirl	$r0,$r1,0

1c0024a8 <exti_gpioa1_irq_handler>:
exti_gpioa1_irq_handler():
1c0024a8:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0024ac:	29803061 	st.w	$r1,$r3,12(0xc)
1c0024b0:	29802076 	st.w	$r22,$r3,8(0x8)
1c0024b4:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0024b8:	1c000026 	pcaddu12i	$r6,1(0x1)
1c0024bc:	0280d0c6 	addi.w	$r6,$r6,52(0x34)
1c0024c0:	02806005 	addi.w	$r5,$r0,24(0x18)
1c0024c4:	1c000024 	pcaddu12i	$r4,1(0x1)
1c0024c8:	02b8f084 	addi.w	$r4,$r4,-452(0xe3c)
1c0024cc:	57ee6bff 	bl	-4504(0xfffee68) # 1c001334 <myprintf>
1c0024d0:	02800805 	addi.w	$r5,$r0,2(0x2)
1c0024d4:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0024d8:	03808184 	ori	$r4,$r12,0x20
1c0024dc:	57f4a3ff 	bl	-2912(0xffff4a0) # 1c00197c <EXTI_ClearITPendingBit>
1c0024e0:	03400000 	andi	$r0,$r0,0x0
1c0024e4:	28803061 	ld.w	$r1,$r3,12(0xc)
1c0024e8:	28802076 	ld.w	$r22,$r3,8(0x8)
1c0024ec:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0024f0:	4c000020 	jirl	$r0,$r1,0

1c0024f4 <exti_gpioa2_irq_handler>:
exti_gpioa2_irq_handler():
1c0024f4:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0024f8:	29803061 	st.w	$r1,$r3,12(0xc)
1c0024fc:	29802076 	st.w	$r22,$r3,8(0x8)
1c002500:	02804076 	addi.w	$r22,$r3,16(0x10)
1c002504:	1c000026 	pcaddu12i	$r6,1(0x1)
1c002508:	028000c6 	addi.w	$r6,$r6,0
1c00250c:	02807405 	addi.w	$r5,$r0,29(0x1d)
1c002510:	1c000024 	pcaddu12i	$r4,1(0x1)
1c002514:	02b7c084 	addi.w	$r4,$r4,-528(0xdf0)
1c002518:	57ee1fff 	bl	-4580(0xfffee1c) # 1c001334 <myprintf>
1c00251c:	02801005 	addi.w	$r5,$r0,4(0x4)
1c002520:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002524:	03808184 	ori	$r4,$r12,0x20
1c002528:	57f457ff 	bl	-2988(0xffff454) # 1c00197c <EXTI_ClearITPendingBit>
1c00252c:	03400000 	andi	$r0,$r0,0x0
1c002530:	28803061 	ld.w	$r1,$r3,12(0xc)
1c002534:	28802076 	ld.w	$r22,$r3,8(0x8)
1c002538:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00253c:	4c000020 	jirl	$r0,$r1,0

1c002540 <exti_gpioa3_irq_handler>:
exti_gpioa3_irq_handler():
1c002540:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c002544:	29803061 	st.w	$r1,$r3,12(0xc)
1c002548:	29802076 	st.w	$r22,$r3,8(0x8)
1c00254c:	02804076 	addi.w	$r22,$r3,16(0x10)
1c002550:	1c000026 	pcaddu12i	$r6,1(0x1)
1c002554:	02bf30c6 	addi.w	$r6,$r6,-52(0xfcc)
1c002558:	02808805 	addi.w	$r5,$r0,34(0x22)
1c00255c:	1c000024 	pcaddu12i	$r4,1(0x1)
1c002560:	02b69084 	addi.w	$r4,$r4,-604(0xda4)
1c002564:	57edd3ff 	bl	-4656(0xfffedd0) # 1c001334 <myprintf>
1c002568:	02802005 	addi.w	$r5,$r0,8(0x8)
1c00256c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002570:	03808184 	ori	$r4,$r12,0x20
1c002574:	57f40bff 	bl	-3064(0xffff408) # 1c00197c <EXTI_ClearITPendingBit>
1c002578:	03400000 	andi	$r0,$r0,0x0
1c00257c:	28803061 	ld.w	$r1,$r3,12(0xc)
1c002580:	28802076 	ld.w	$r22,$r3,8(0x8)
1c002584:	02804063 	addi.w	$r3,$r3,16(0x10)
1c002588:	4c000020 	jirl	$r0,$r1,0

1c00258c <exti_gpioa4_irq_handler>:
exti_gpioa4_irq_handler():
1c00258c:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c002590:	29803061 	st.w	$r1,$r3,12(0xc)
1c002594:	29802076 	st.w	$r22,$r3,8(0x8)
1c002598:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00259c:	1c000026 	pcaddu12i	$r6,1(0x1)
1c0025a0:	02be60c6 	addi.w	$r6,$r6,-104(0xf98)
1c0025a4:	02809c05 	addi.w	$r5,$r0,39(0x27)
1c0025a8:	1c000024 	pcaddu12i	$r4,1(0x1)
1c0025ac:	02b56084 	addi.w	$r4,$r4,-680(0xd58)
1c0025b0:	57ed87ff 	bl	-4732(0xfffed84) # 1c001334 <myprintf>
1c0025b4:	02804005 	addi.w	$r5,$r0,16(0x10)
1c0025b8:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0025bc:	03808184 	ori	$r4,$r12,0x20
1c0025c0:	57f3bfff 	bl	-3140(0xffff3bc) # 1c00197c <EXTI_ClearITPendingBit>
1c0025c4:	03400000 	andi	$r0,$r0,0x0
1c0025c8:	28803061 	ld.w	$r1,$r3,12(0xc)
1c0025cc:	28802076 	ld.w	$r22,$r3,8(0x8)
1c0025d0:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0025d4:	4c000020 	jirl	$r0,$r1,0

1c0025d8 <exti_gpioa5_irq_handler>:
exti_gpioa5_irq_handler():
1c0025d8:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0025dc:	29803061 	st.w	$r1,$r3,12(0xc)
1c0025e0:	29802076 	st.w	$r22,$r3,8(0x8)
1c0025e4:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0025e8:	1c000026 	pcaddu12i	$r6,1(0x1)
1c0025ec:	02bd90c6 	addi.w	$r6,$r6,-156(0xf64)
1c0025f0:	0280b005 	addi.w	$r5,$r0,44(0x2c)
1c0025f4:	1c000024 	pcaddu12i	$r4,1(0x1)
1c0025f8:	02b43084 	addi.w	$r4,$r4,-756(0xd0c)
1c0025fc:	57ed3bff 	bl	-4808(0xfffed38) # 1c001334 <myprintf>
1c002600:	02808005 	addi.w	$r5,$r0,32(0x20)
1c002604:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002608:	03808184 	ori	$r4,$r12,0x20
1c00260c:	57f373ff 	bl	-3216(0xffff370) # 1c00197c <EXTI_ClearITPendingBit>
1c002610:	03400000 	andi	$r0,$r0,0x0
1c002614:	28803061 	ld.w	$r1,$r3,12(0xc)
1c002618:	28802076 	ld.w	$r22,$r3,8(0x8)
1c00261c:	02804063 	addi.w	$r3,$r3,16(0x10)
1c002620:	4c000020 	jirl	$r0,$r1,0

1c002624 <exti_gpioa6_irq_handler>:
exti_gpioa6_irq_handler():
1c002624:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c002628:	29803061 	st.w	$r1,$r3,12(0xc)
1c00262c:	29802076 	st.w	$r22,$r3,8(0x8)
1c002630:	02804076 	addi.w	$r22,$r3,16(0x10)
1c002634:	1c000026 	pcaddu12i	$r6,1(0x1)
1c002638:	02bcc0c6 	addi.w	$r6,$r6,-208(0xf30)
1c00263c:	0280c405 	addi.w	$r5,$r0,49(0x31)
1c002640:	1c000024 	pcaddu12i	$r4,1(0x1)
1c002644:	02b30084 	addi.w	$r4,$r4,-832(0xcc0)
1c002648:	57ecefff 	bl	-4884(0xfffecec) # 1c001334 <myprintf>
1c00264c:	02810005 	addi.w	$r5,$r0,64(0x40)
1c002650:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002654:	03808184 	ori	$r4,$r12,0x20
1c002658:	57f327ff 	bl	-3292(0xffff324) # 1c00197c <EXTI_ClearITPendingBit>
1c00265c:	03400000 	andi	$r0,$r0,0x0
1c002660:	28803061 	ld.w	$r1,$r3,12(0xc)
1c002664:	28802076 	ld.w	$r22,$r3,8(0x8)
1c002668:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00266c:	4c000020 	jirl	$r0,$r1,0

1c002670 <exti_gpioa7_irq_handler>:
exti_gpioa7_irq_handler():
1c002670:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c002674:	29803061 	st.w	$r1,$r3,12(0xc)
1c002678:	29802076 	st.w	$r22,$r3,8(0x8)
1c00267c:	02804076 	addi.w	$r22,$r3,16(0x10)
1c002680:	1c000026 	pcaddu12i	$r6,1(0x1)
1c002684:	02bbf0c6 	addi.w	$r6,$r6,-260(0xefc)
1c002688:	0280dc05 	addi.w	$r5,$r0,55(0x37)
1c00268c:	1c000024 	pcaddu12i	$r4,1(0x1)
1c002690:	02b1d084 	addi.w	$r4,$r4,-908(0xc74)
1c002694:	57eca3ff 	bl	-4960(0xfffeca0) # 1c001334 <myprintf>
1c002698:	02820005 	addi.w	$r5,$r0,128(0x80)
1c00269c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0026a0:	03808184 	ori	$r4,$r12,0x20
1c0026a4:	57f2dbff 	bl	-3368(0xffff2d8) # 1c00197c <EXTI_ClearITPendingBit>
1c0026a8:	03400000 	andi	$r0,$r0,0x0
1c0026ac:	28803061 	ld.w	$r1,$r3,12(0xc)
1c0026b0:	28802076 	ld.w	$r22,$r3,8(0x8)
1c0026b4:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0026b8:	4c000020 	jirl	$r0,$r1,0

1c0026bc <exti_gpiob0_irq_handler>:
exti_gpiob0_irq_handler():
1c0026bc:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0026c0:	29803061 	st.w	$r1,$r3,12(0xc)
1c0026c4:	29802076 	st.w	$r22,$r3,8(0x8)
1c0026c8:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0026cc:	1c000026 	pcaddu12i	$r6,1(0x1)
1c0026d0:	02bb20c6 	addi.w	$r6,$r6,-312(0xec8)
1c0026d4:	0280f005 	addi.w	$r5,$r0,60(0x3c)
1c0026d8:	1c000024 	pcaddu12i	$r4,1(0x1)
1c0026dc:	02b0a084 	addi.w	$r4,$r4,-984(0xc28)
1c0026e0:	57ec57ff 	bl	-5036(0xfffec54) # 1c001334 <myprintf>
1c0026e4:	02840005 	addi.w	$r5,$r0,256(0x100)
1c0026e8:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0026ec:	03808184 	ori	$r4,$r12,0x20
1c0026f0:	57f28fff 	bl	-3444(0xffff28c) # 1c00197c <EXTI_ClearITPendingBit>
1c0026f4:	03400000 	andi	$r0,$r0,0x0
1c0026f8:	28803061 	ld.w	$r1,$r3,12(0xc)
1c0026fc:	28802076 	ld.w	$r22,$r3,8(0x8)
1c002700:	02804063 	addi.w	$r3,$r3,16(0x10)
1c002704:	4c000020 	jirl	$r0,$r1,0

1c002708 <exti_gpiob1_irq_handler>:
exti_gpiob1_irq_handler():
1c002708:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c00270c:	29803061 	st.w	$r1,$r3,12(0xc)
1c002710:	29802076 	st.w	$r22,$r3,8(0x8)
1c002714:	02804076 	addi.w	$r22,$r3,16(0x10)
1c002718:	1c000026 	pcaddu12i	$r6,1(0x1)
1c00271c:	02ba50c6 	addi.w	$r6,$r6,-364(0xe94)
1c002720:	02810805 	addi.w	$r5,$r0,66(0x42)
1c002724:	1c000024 	pcaddu12i	$r4,1(0x1)
1c002728:	02af7084 	addi.w	$r4,$r4,-1060(0xbdc)
1c00272c:	57ec0bff 	bl	-5112(0xfffec08) # 1c001334 <myprintf>
1c002730:	02880005 	addi.w	$r5,$r0,512(0x200)
1c002734:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002738:	03808184 	ori	$r4,$r12,0x20
1c00273c:	57f243ff 	bl	-3520(0xffff240) # 1c00197c <EXTI_ClearITPendingBit>
1c002740:	03400000 	andi	$r0,$r0,0x0
1c002744:	28803061 	ld.w	$r1,$r3,12(0xc)
1c002748:	28802076 	ld.w	$r22,$r3,8(0x8)
1c00274c:	02804063 	addi.w	$r3,$r3,16(0x10)
1c002750:	4c000020 	jirl	$r0,$r1,0

1c002754 <exti_gpiob2_irq_handler>:
exti_gpiob2_irq_handler():
1c002754:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c002758:	29803061 	st.w	$r1,$r3,12(0xc)
1c00275c:	29802076 	st.w	$r22,$r3,8(0x8)
1c002760:	02804076 	addi.w	$r22,$r3,16(0x10)
1c002764:	1c000026 	pcaddu12i	$r6,1(0x1)
1c002768:	02b980c6 	addi.w	$r6,$r6,-416(0xe60)
1c00276c:	02812005 	addi.w	$r5,$r0,72(0x48)
1c002770:	1c000024 	pcaddu12i	$r4,1(0x1)
1c002774:	02ae4084 	addi.w	$r4,$r4,-1136(0xb90)
1c002778:	57ebbfff 	bl	-5188(0xfffebbc) # 1c001334 <myprintf>
1c00277c:	02900005 	addi.w	$r5,$r0,1024(0x400)
1c002780:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002784:	03808184 	ori	$r4,$r12,0x20
1c002788:	57f1f7ff 	bl	-3596(0xffff1f4) # 1c00197c <EXTI_ClearITPendingBit>
1c00278c:	03400000 	andi	$r0,$r0,0x0
1c002790:	28803061 	ld.w	$r1,$r3,12(0xc)
1c002794:	28802076 	ld.w	$r22,$r3,8(0x8)
1c002798:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00279c:	4c000020 	jirl	$r0,$r1,0

1c0027a0 <exti_gpiob3_irq_handler>:
exti_gpiob3_irq_handler():
1c0027a0:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0027a4:	29803061 	st.w	$r1,$r3,12(0xc)
1c0027a8:	29802076 	st.w	$r22,$r3,8(0x8)
1c0027ac:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0027b0:	1c000026 	pcaddu12i	$r6,1(0x1)
1c0027b4:	02b8b0c6 	addi.w	$r6,$r6,-468(0xe2c)
1c0027b8:	02813805 	addi.w	$r5,$r0,78(0x4e)
1c0027bc:	1c000024 	pcaddu12i	$r4,1(0x1)
1c0027c0:	02ad1084 	addi.w	$r4,$r4,-1212(0xb44)
1c0027c4:	57eb73ff 	bl	-5264(0xfffeb70) # 1c001334 <myprintf>
1c0027c8:	03a00005 	ori	$r5,$r0,0x800
1c0027cc:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0027d0:	03808184 	ori	$r4,$r12,0x20
1c0027d4:	57f1abff 	bl	-3672(0xffff1a8) # 1c00197c <EXTI_ClearITPendingBit>
1c0027d8:	03400000 	andi	$r0,$r0,0x0
1c0027dc:	28803061 	ld.w	$r1,$r3,12(0xc)
1c0027e0:	28802076 	ld.w	$r22,$r3,8(0x8)
1c0027e4:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0027e8:	4c000020 	jirl	$r0,$r1,0

1c0027ec <exti_gpiob4_irq_handler>:
exti_gpiob4_irq_handler():
1c0027ec:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0027f0:	29803061 	st.w	$r1,$r3,12(0xc)
1c0027f4:	29802076 	st.w	$r22,$r3,8(0x8)
1c0027f8:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0027fc:	1c000026 	pcaddu12i	$r6,1(0x1)
1c002800:	02b7e0c6 	addi.w	$r6,$r6,-520(0xdf8)
1c002804:	02814c05 	addi.w	$r5,$r0,83(0x53)
1c002808:	1c000024 	pcaddu12i	$r4,1(0x1)
1c00280c:	02abe084 	addi.w	$r4,$r4,-1288(0xaf8)
1c002810:	57eb27ff 	bl	-5340(0xfffeb24) # 1c001334 <myprintf>
1c002814:	14000025 	lu12i.w	$r5,1(0x1)
1c002818:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00281c:	03808184 	ori	$r4,$r12,0x20
1c002820:	57f15fff 	bl	-3748(0xffff15c) # 1c00197c <EXTI_ClearITPendingBit>
1c002824:	03400000 	andi	$r0,$r0,0x0
1c002828:	28803061 	ld.w	$r1,$r3,12(0xc)
1c00282c:	28802076 	ld.w	$r22,$r3,8(0x8)
1c002830:	02804063 	addi.w	$r3,$r3,16(0x10)
1c002834:	4c000020 	jirl	$r0,$r1,0

1c002838 <exti_gpiob5_irq_handler>:
exti_gpiob5_irq_handler():
1c002838:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c00283c:	29803061 	st.w	$r1,$r3,12(0xc)
1c002840:	29802076 	st.w	$r22,$r3,8(0x8)
1c002844:	02804076 	addi.w	$r22,$r3,16(0x10)
1c002848:	1c000026 	pcaddu12i	$r6,1(0x1)
1c00284c:	02b710c6 	addi.w	$r6,$r6,-572(0xdc4)
1c002850:	02816005 	addi.w	$r5,$r0,88(0x58)
1c002854:	1c000024 	pcaddu12i	$r4,1(0x1)
1c002858:	02aab084 	addi.w	$r4,$r4,-1364(0xaac)
1c00285c:	57eadbff 	bl	-5416(0xfffead8) # 1c001334 <myprintf>
1c002860:	14000045 	lu12i.w	$r5,2(0x2)
1c002864:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002868:	03808184 	ori	$r4,$r12,0x20
1c00286c:	57f113ff 	bl	-3824(0xffff110) # 1c00197c <EXTI_ClearITPendingBit>
1c002870:	03400000 	andi	$r0,$r0,0x0
1c002874:	28803061 	ld.w	$r1,$r3,12(0xc)
1c002878:	28802076 	ld.w	$r22,$r3,8(0x8)
1c00287c:	02804063 	addi.w	$r3,$r3,16(0x10)
1c002880:	4c000020 	jirl	$r0,$r1,0

1c002884 <exti_gpiob6_irq_handler>:
exti_gpiob6_irq_handler():
1c002884:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c002888:	29803061 	st.w	$r1,$r3,12(0xc)
1c00288c:	29802076 	st.w	$r22,$r3,8(0x8)
1c002890:	02804076 	addi.w	$r22,$r3,16(0x10)
1c002894:	1c000026 	pcaddu12i	$r6,1(0x1)
1c002898:	02b640c6 	addi.w	$r6,$r6,-624(0xd90)
1c00289c:	02817805 	addi.w	$r5,$r0,94(0x5e)
1c0028a0:	1c000024 	pcaddu12i	$r4,1(0x1)
1c0028a4:	02a98084 	addi.w	$r4,$r4,-1440(0xa60)
1c0028a8:	57ea8fff 	bl	-5492(0xfffea8c) # 1c001334 <myprintf>
1c0028ac:	14000085 	lu12i.w	$r5,4(0x4)
1c0028b0:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0028b4:	03808184 	ori	$r4,$r12,0x20
1c0028b8:	57f0c7ff 	bl	-3900(0xffff0c4) # 1c00197c <EXTI_ClearITPendingBit>
1c0028bc:	03400000 	andi	$r0,$r0,0x0
1c0028c0:	28803061 	ld.w	$r1,$r3,12(0xc)
1c0028c4:	28802076 	ld.w	$r22,$r3,8(0x8)
1c0028c8:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0028cc:	4c000020 	jirl	$r0,$r1,0

1c0028d0 <exti_gpiob7_irq_handler>:
exti_gpiob7_irq_handler():
1c0028d0:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0028d4:	29803061 	st.w	$r1,$r3,12(0xc)
1c0028d8:	29802076 	st.w	$r22,$r3,8(0x8)
1c0028dc:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0028e0:	1c000026 	pcaddu12i	$r6,1(0x1)
1c0028e4:	02b570c6 	addi.w	$r6,$r6,-676(0xd5c)
1c0028e8:	02819005 	addi.w	$r5,$r0,100(0x64)
1c0028ec:	1c000024 	pcaddu12i	$r4,1(0x1)
1c0028f0:	02a85084 	addi.w	$r4,$r4,-1516(0xa14)
1c0028f4:	57ea43ff 	bl	-5568(0xfffea40) # 1c001334 <myprintf>
1c0028f8:	14000105 	lu12i.w	$r5,8(0x8)
1c0028fc:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002900:	03808184 	ori	$r4,$r12,0x20
1c002904:	57f07bff 	bl	-3976(0xffff078) # 1c00197c <EXTI_ClearITPendingBit>
1c002908:	03400000 	andi	$r0,$r0,0x0
1c00290c:	28803061 	ld.w	$r1,$r3,12(0xc)
1c002910:	28802076 	ld.w	$r22,$r3,8(0x8)
1c002914:	02804063 	addi.w	$r3,$r3,16(0x10)
1c002918:	4c000020 	jirl	$r0,$r1,0

1c00291c <exti_gpioc0_irq_handler>:
exti_gpioc0_irq_handler():
1c00291c:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c002920:	29803061 	st.w	$r1,$r3,12(0xc)
1c002924:	29802076 	st.w	$r22,$r3,8(0x8)
1c002928:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00292c:	1c000026 	pcaddu12i	$r6,1(0x1)
1c002930:	02b4a0c6 	addi.w	$r6,$r6,-728(0xd28)
1c002934:	0281ac05 	addi.w	$r5,$r0,107(0x6b)
1c002938:	1c000024 	pcaddu12i	$r4,1(0x1)
1c00293c:	02a72084 	addi.w	$r4,$r4,-1592(0x9c8)
1c002940:	57e9f7ff 	bl	-5644(0xfffe9f4) # 1c001334 <myprintf>
1c002944:	14000205 	lu12i.w	$r5,16(0x10)
1c002948:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00294c:	03808184 	ori	$r4,$r12,0x20
1c002950:	57f02fff 	bl	-4052(0xffff02c) # 1c00197c <EXTI_ClearITPendingBit>
1c002954:	03400000 	andi	$r0,$r0,0x0
1c002958:	28803061 	ld.w	$r1,$r3,12(0xc)
1c00295c:	28802076 	ld.w	$r22,$r3,8(0x8)
1c002960:	02804063 	addi.w	$r3,$r3,16(0x10)
1c002964:	4c000020 	jirl	$r0,$r1,0

1c002968 <exti_gpioc1_irq_handler>:
exti_gpioc1_irq_handler():
1c002968:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c00296c:	29803061 	st.w	$r1,$r3,12(0xc)
1c002970:	29802076 	st.w	$r22,$r3,8(0x8)
1c002974:	02804076 	addi.w	$r22,$r3,16(0x10)
1c002978:	1c000026 	pcaddu12i	$r6,1(0x1)
1c00297c:	02b3d0c6 	addi.w	$r6,$r6,-780(0xcf4)
1c002980:	0281c405 	addi.w	$r5,$r0,113(0x71)
1c002984:	1c000024 	pcaddu12i	$r4,1(0x1)
1c002988:	02a5f084 	addi.w	$r4,$r4,-1668(0x97c)
1c00298c:	57e9abff 	bl	-5720(0xfffe9a8) # 1c001334 <myprintf>
1c002990:	14000405 	lu12i.w	$r5,32(0x20)
1c002994:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002998:	03808184 	ori	$r4,$r12,0x20
1c00299c:	57efe3ff 	bl	-4128(0xfffefe0) # 1c00197c <EXTI_ClearITPendingBit>
1c0029a0:	03400000 	andi	$r0,$r0,0x0
1c0029a4:	28803061 	ld.w	$r1,$r3,12(0xc)
1c0029a8:	28802076 	ld.w	$r22,$r3,8(0x8)
1c0029ac:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0029b0:	4c000020 	jirl	$r0,$r1,0

1c0029b4 <exti_gpioc2_irq_handler>:
exti_gpioc2_irq_handler():
1c0029b4:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0029b8:	29803061 	st.w	$r1,$r3,12(0xc)
1c0029bc:	29802076 	st.w	$r22,$r3,8(0x8)
1c0029c0:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0029c4:	1c000026 	pcaddu12i	$r6,1(0x1)
1c0029c8:	02b300c6 	addi.w	$r6,$r6,-832(0xcc0)
1c0029cc:	0281dc05 	addi.w	$r5,$r0,119(0x77)
1c0029d0:	1c000024 	pcaddu12i	$r4,1(0x1)
1c0029d4:	02a4c084 	addi.w	$r4,$r4,-1744(0x930)
1c0029d8:	57e95fff 	bl	-5796(0xfffe95c) # 1c001334 <myprintf>
1c0029dc:	14000805 	lu12i.w	$r5,64(0x40)
1c0029e0:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0029e4:	03808184 	ori	$r4,$r12,0x20
1c0029e8:	57ef97ff 	bl	-4204(0xfffef94) # 1c00197c <EXTI_ClearITPendingBit>
1c0029ec:	03400000 	andi	$r0,$r0,0x0
1c0029f0:	28803061 	ld.w	$r1,$r3,12(0xc)
1c0029f4:	28802076 	ld.w	$r22,$r3,8(0x8)
1c0029f8:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0029fc:	4c000020 	jirl	$r0,$r1,0

1c002a00 <exti_gpioc3_irq_handler>:
exti_gpioc3_irq_handler():
1c002a00:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c002a04:	29803061 	st.w	$r1,$r3,12(0xc)
1c002a08:	29802076 	st.w	$r22,$r3,8(0x8)
1c002a0c:	02804076 	addi.w	$r22,$r3,16(0x10)
1c002a10:	1c000026 	pcaddu12i	$r6,1(0x1)
1c002a14:	02b230c6 	addi.w	$r6,$r6,-884(0xc8c)
1c002a18:	0281f405 	addi.w	$r5,$r0,125(0x7d)
1c002a1c:	1c000024 	pcaddu12i	$r4,1(0x1)
1c002a20:	02a39084 	addi.w	$r4,$r4,-1820(0x8e4)
1c002a24:	57e913ff 	bl	-5872(0xfffe910) # 1c001334 <myprintf>
1c002a28:	14001005 	lu12i.w	$r5,128(0x80)
1c002a2c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002a30:	03808184 	ori	$r4,$r12,0x20
1c002a34:	57ef4bff 	bl	-4280(0xfffef48) # 1c00197c <EXTI_ClearITPendingBit>
1c002a38:	03400000 	andi	$r0,$r0,0x0
1c002a3c:	28803061 	ld.w	$r1,$r3,12(0xc)
1c002a40:	28802076 	ld.w	$r22,$r3,8(0x8)
1c002a44:	02804063 	addi.w	$r3,$r3,16(0x10)
1c002a48:	4c000020 	jirl	$r0,$r1,0

1c002a4c <exti_gpioc4_irq_handler>:
exti_gpioc4_irq_handler():
1c002a4c:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c002a50:	29803061 	st.w	$r1,$r3,12(0xc)
1c002a54:	29802076 	st.w	$r22,$r3,8(0x8)
1c002a58:	02804076 	addi.w	$r22,$r3,16(0x10)
1c002a5c:	1c000026 	pcaddu12i	$r6,1(0x1)
1c002a60:	02b160c6 	addi.w	$r6,$r6,-936(0xc58)
1c002a64:	02820c05 	addi.w	$r5,$r0,131(0x83)
1c002a68:	1c000024 	pcaddu12i	$r4,1(0x1)
1c002a6c:	02a26084 	addi.w	$r4,$r4,-1896(0x898)
1c002a70:	57e8c7ff 	bl	-5948(0xfffe8c4) # 1c001334 <myprintf>
1c002a74:	14002005 	lu12i.w	$r5,256(0x100)
1c002a78:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002a7c:	03808184 	ori	$r4,$r12,0x20
1c002a80:	57eeffff 	bl	-4356(0xfffeefc) # 1c00197c <EXTI_ClearITPendingBit>
1c002a84:	03400000 	andi	$r0,$r0,0x0
1c002a88:	28803061 	ld.w	$r1,$r3,12(0xc)
1c002a8c:	28802076 	ld.w	$r22,$r3,8(0x8)
1c002a90:	02804063 	addi.w	$r3,$r3,16(0x10)
1c002a94:	4c000020 	jirl	$r0,$r1,0

1c002a98 <exti_gpioc5_irq_handler>:
exti_gpioc5_irq_handler():
1c002a98:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c002a9c:	29803061 	st.w	$r1,$r3,12(0xc)
1c002aa0:	29802076 	st.w	$r22,$r3,8(0x8)
1c002aa4:	02804076 	addi.w	$r22,$r3,16(0x10)
1c002aa8:	1c000026 	pcaddu12i	$r6,1(0x1)
1c002aac:	02b090c6 	addi.w	$r6,$r6,-988(0xc24)
1c002ab0:	02822005 	addi.w	$r5,$r0,136(0x88)
1c002ab4:	1c000024 	pcaddu12i	$r4,1(0x1)
1c002ab8:	02a13084 	addi.w	$r4,$r4,-1972(0x84c)
1c002abc:	57e87bff 	bl	-6024(0xfffe878) # 1c001334 <myprintf>
1c002ac0:	14004005 	lu12i.w	$r5,512(0x200)
1c002ac4:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002ac8:	03808184 	ori	$r4,$r12,0x20
1c002acc:	57eeb3ff 	bl	-4432(0xfffeeb0) # 1c00197c <EXTI_ClearITPendingBit>
1c002ad0:	03400000 	andi	$r0,$r0,0x0
1c002ad4:	28803061 	ld.w	$r1,$r3,12(0xc)
1c002ad8:	28802076 	ld.w	$r22,$r3,8(0x8)
1c002adc:	02804063 	addi.w	$r3,$r3,16(0x10)
1c002ae0:	4c000020 	jirl	$r0,$r1,0

1c002ae4 <exti_gpioc6_irq_handler>:
exti_gpioc6_irq_handler():
1c002ae4:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c002ae8:	29803061 	st.w	$r1,$r3,12(0xc)
1c002aec:	29802076 	st.w	$r22,$r3,8(0x8)
1c002af0:	02804076 	addi.w	$r22,$r3,16(0x10)
1c002af4:	1c000026 	pcaddu12i	$r6,1(0x1)
1c002af8:	02afc0c6 	addi.w	$r6,$r6,-1040(0xbf0)
1c002afc:	02823405 	addi.w	$r5,$r0,141(0x8d)
1c002b00:	1c000024 	pcaddu12i	$r4,1(0x1)
1c002b04:	02a00084 	addi.w	$r4,$r4,-2048(0x800)
1c002b08:	57e82fff 	bl	-6100(0xfffe82c) # 1c001334 <myprintf>
1c002b0c:	14008005 	lu12i.w	$r5,1024(0x400)
1c002b10:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002b14:	03808184 	ori	$r4,$r12,0x20
1c002b18:	57ee67ff 	bl	-4508(0xfffee64) # 1c00197c <EXTI_ClearITPendingBit>
1c002b1c:	03400000 	andi	$r0,$r0,0x0
1c002b20:	28803061 	ld.w	$r1,$r3,12(0xc)
1c002b24:	28802076 	ld.w	$r22,$r3,8(0x8)
1c002b28:	02804063 	addi.w	$r3,$r3,16(0x10)
1c002b2c:	4c000020 	jirl	$r0,$r1,0

1c002b30 <exti_gpioc7_irq_handler>:
exti_gpioc7_irq_handler():
1c002b30:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c002b34:	29803061 	st.w	$r1,$r3,12(0xc)
1c002b38:	29802076 	st.w	$r22,$r3,8(0x8)
1c002b3c:	02804076 	addi.w	$r22,$r3,16(0x10)
1c002b40:	1c000026 	pcaddu12i	$r6,1(0x1)
1c002b44:	02aef0c6 	addi.w	$r6,$r6,-1092(0xbbc)
1c002b48:	02824c05 	addi.w	$r5,$r0,147(0x93)
1c002b4c:	1c000004 	pcaddu12i	$r4,0
1c002b50:	029ed084 	addi.w	$r4,$r4,1972(0x7b4)
1c002b54:	57e7e3ff 	bl	-6176(0xfffe7e0) # 1c001334 <myprintf>
1c002b58:	14010005 	lu12i.w	$r5,2048(0x800)
1c002b5c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002b60:	03808184 	ori	$r4,$r12,0x20
1c002b64:	57ee1bff 	bl	-4584(0xfffee18) # 1c00197c <EXTI_ClearITPendingBit>
1c002b68:	03400000 	andi	$r0,$r0,0x0
1c002b6c:	28803061 	ld.w	$r1,$r3,12(0xc)
1c002b70:	28802076 	ld.w	$r22,$r3,8(0x8)
1c002b74:	02804063 	addi.w	$r3,$r3,16(0x10)
1c002b78:	4c000020 	jirl	$r0,$r1,0

1c002b7c <exti_gpiod0_irq_handler>:
exti_gpiod0_irq_handler():
1c002b7c:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c002b80:	29803061 	st.w	$r1,$r3,12(0xc)
1c002b84:	29802076 	st.w	$r22,$r3,8(0x8)
1c002b88:	02804076 	addi.w	$r22,$r3,16(0x10)
1c002b8c:	1c000026 	pcaddu12i	$r6,1(0x1)
1c002b90:	02ae20c6 	addi.w	$r6,$r6,-1144(0xb88)
1c002b94:	02826405 	addi.w	$r5,$r0,153(0x99)
1c002b98:	1c000004 	pcaddu12i	$r4,0
1c002b9c:	029da084 	addi.w	$r4,$r4,1896(0x768)
1c002ba0:	57e797ff 	bl	-6252(0xfffe794) # 1c001334 <myprintf>
1c002ba4:	14020005 	lu12i.w	$r5,4096(0x1000)
1c002ba8:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002bac:	03808184 	ori	$r4,$r12,0x20
1c002bb0:	57edcfff 	bl	-4660(0xfffedcc) # 1c00197c <EXTI_ClearITPendingBit>
1c002bb4:	03400000 	andi	$r0,$r0,0x0
1c002bb8:	28803061 	ld.w	$r1,$r3,12(0xc)
1c002bbc:	28802076 	ld.w	$r22,$r3,8(0x8)
1c002bc0:	02804063 	addi.w	$r3,$r3,16(0x10)
1c002bc4:	4c000020 	jirl	$r0,$r1,0

1c002bc8 <exti_gpiod1_irq_handler>:
exti_gpiod1_irq_handler():
1c002bc8:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c002bcc:	29803061 	st.w	$r1,$r3,12(0xc)
1c002bd0:	29802076 	st.w	$r22,$r3,8(0x8)
1c002bd4:	02804076 	addi.w	$r22,$r3,16(0x10)
1c002bd8:	1c000026 	pcaddu12i	$r6,1(0x1)
1c002bdc:	02ad50c6 	addi.w	$r6,$r6,-1196(0xb54)
1c002be0:	02827c05 	addi.w	$r5,$r0,159(0x9f)
1c002be4:	1c000004 	pcaddu12i	$r4,0
1c002be8:	029c7084 	addi.w	$r4,$r4,1820(0x71c)
1c002bec:	57e74bff 	bl	-6328(0xfffe748) # 1c001334 <myprintf>
1c002bf0:	14040005 	lu12i.w	$r5,8192(0x2000)
1c002bf4:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002bf8:	03808184 	ori	$r4,$r12,0x20
1c002bfc:	57ed83ff 	bl	-4736(0xfffed80) # 1c00197c <EXTI_ClearITPendingBit>
1c002c00:	03400000 	andi	$r0,$r0,0x0
1c002c04:	28803061 	ld.w	$r1,$r3,12(0xc)
1c002c08:	28802076 	ld.w	$r22,$r3,8(0x8)
1c002c0c:	02804063 	addi.w	$r3,$r3,16(0x10)
1c002c10:	4c000020 	jirl	$r0,$r1,0

1c002c14 <exti_gpiod2_irq_handler>:
exti_gpiod2_irq_handler():
1c002c14:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c002c18:	29803061 	st.w	$r1,$r3,12(0xc)
1c002c1c:	29802076 	st.w	$r22,$r3,8(0x8)
1c002c20:	02804076 	addi.w	$r22,$r3,16(0x10)
1c002c24:	1c000026 	pcaddu12i	$r6,1(0x1)
1c002c28:	02ac80c6 	addi.w	$r6,$r6,-1248(0xb20)
1c002c2c:	02829405 	addi.w	$r5,$r0,165(0xa5)
1c002c30:	1c000004 	pcaddu12i	$r4,0
1c002c34:	029b4084 	addi.w	$r4,$r4,1744(0x6d0)
1c002c38:	57e6ffff 	bl	-6404(0xfffe6fc) # 1c001334 <myprintf>
1c002c3c:	14080005 	lu12i.w	$r5,16384(0x4000)
1c002c40:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002c44:	03808184 	ori	$r4,$r12,0x20
1c002c48:	57ed37ff 	bl	-4812(0xfffed34) # 1c00197c <EXTI_ClearITPendingBit>
1c002c4c:	03400000 	andi	$r0,$r0,0x0
1c002c50:	28803061 	ld.w	$r1,$r3,12(0xc)
1c002c54:	28802076 	ld.w	$r22,$r3,8(0x8)
1c002c58:	02804063 	addi.w	$r3,$r3,16(0x10)
1c002c5c:	4c000020 	jirl	$r0,$r1,0

1c002c60 <exti_gpiod3_irq_handler>:
exti_gpiod3_irq_handler():
1c002c60:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c002c64:	29803061 	st.w	$r1,$r3,12(0xc)
1c002c68:	29802076 	st.w	$r22,$r3,8(0x8)
1c002c6c:	02804076 	addi.w	$r22,$r3,16(0x10)
1c002c70:	1c000026 	pcaddu12i	$r6,1(0x1)
1c002c74:	02abb0c6 	addi.w	$r6,$r6,-1300(0xaec)
1c002c78:	0282ac05 	addi.w	$r5,$r0,171(0xab)
1c002c7c:	1c000004 	pcaddu12i	$r4,0
1c002c80:	029a1084 	addi.w	$r4,$r4,1668(0x684)
1c002c84:	57e6b3ff 	bl	-6480(0xfffe6b0) # 1c001334 <myprintf>
1c002c88:	14100005 	lu12i.w	$r5,32768(0x8000)
1c002c8c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002c90:	03808184 	ori	$r4,$r12,0x20
1c002c94:	57ecebff 	bl	-4888(0xfffece8) # 1c00197c <EXTI_ClearITPendingBit>
1c002c98:	03400000 	andi	$r0,$r0,0x0
1c002c9c:	28803061 	ld.w	$r1,$r3,12(0xc)
1c002ca0:	28802076 	ld.w	$r22,$r3,8(0x8)
1c002ca4:	02804063 	addi.w	$r3,$r3,16(0x10)
1c002ca8:	4c000020 	jirl	$r0,$r1,0

1c002cac <exti_gpiod4_irq_handler>:
exti_gpiod4_irq_handler():
1c002cac:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c002cb0:	29803061 	st.w	$r1,$r3,12(0xc)
1c002cb4:	29802076 	st.w	$r22,$r3,8(0x8)
1c002cb8:	02804076 	addi.w	$r22,$r3,16(0x10)
1c002cbc:	1c000026 	pcaddu12i	$r6,1(0x1)
1c002cc0:	02aae0c6 	addi.w	$r6,$r6,-1352(0xab8)
1c002cc4:	0282c405 	addi.w	$r5,$r0,177(0xb1)
1c002cc8:	1c000004 	pcaddu12i	$r4,0
1c002ccc:	0298e084 	addi.w	$r4,$r4,1592(0x638)
1c002cd0:	57e667ff 	bl	-6556(0xfffe664) # 1c001334 <myprintf>
1c002cd4:	14200005 	lu12i.w	$r5,65536(0x10000)
1c002cd8:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002cdc:	03808184 	ori	$r4,$r12,0x20
1c002ce0:	57ec9fff 	bl	-4964(0xfffec9c) # 1c00197c <EXTI_ClearITPendingBit>
1c002ce4:	03400000 	andi	$r0,$r0,0x0
1c002ce8:	28803061 	ld.w	$r1,$r3,12(0xc)
1c002cec:	28802076 	ld.w	$r22,$r3,8(0x8)
1c002cf0:	02804063 	addi.w	$r3,$r3,16(0x10)
1c002cf4:	4c000020 	jirl	$r0,$r1,0

1c002cf8 <exti_gpiod5_irq_handler>:
exti_gpiod5_irq_handler():
1c002cf8:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c002cfc:	29803061 	st.w	$r1,$r3,12(0xc)
1c002d00:	29802076 	st.w	$r22,$r3,8(0x8)
1c002d04:	02804076 	addi.w	$r22,$r3,16(0x10)
1c002d08:	1c000026 	pcaddu12i	$r6,1(0x1)
1c002d0c:	02aa10c6 	addi.w	$r6,$r6,-1404(0xa84)
1c002d10:	0282e005 	addi.w	$r5,$r0,184(0xb8)
1c002d14:	1c000004 	pcaddu12i	$r4,0
1c002d18:	0297b084 	addi.w	$r4,$r4,1516(0x5ec)
1c002d1c:	57e61bff 	bl	-6632(0xfffe618) # 1c001334 <myprintf>
1c002d20:	14400005 	lu12i.w	$r5,131072(0x20000)
1c002d24:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002d28:	03808184 	ori	$r4,$r12,0x20
1c002d2c:	57ec53ff 	bl	-5040(0xfffec50) # 1c00197c <EXTI_ClearITPendingBit>
1c002d30:	03400000 	andi	$r0,$r0,0x0
1c002d34:	28803061 	ld.w	$r1,$r3,12(0xc)
1c002d38:	28802076 	ld.w	$r22,$r3,8(0x8)
1c002d3c:	02804063 	addi.w	$r3,$r3,16(0x10)
1c002d40:	4c000020 	jirl	$r0,$r1,0

1c002d44 <exti_gpiod6_irq_handler>:
exti_gpiod6_irq_handler():
1c002d44:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c002d48:	29803061 	st.w	$r1,$r3,12(0xc)
1c002d4c:	29802076 	st.w	$r22,$r3,8(0x8)
1c002d50:	02804076 	addi.w	$r22,$r3,16(0x10)
1c002d54:	1c000026 	pcaddu12i	$r6,1(0x1)
1c002d58:	02a940c6 	addi.w	$r6,$r6,-1456(0xa50)
1c002d5c:	0282f805 	addi.w	$r5,$r0,190(0xbe)
1c002d60:	1c000004 	pcaddu12i	$r4,0
1c002d64:	02968084 	addi.w	$r4,$r4,1440(0x5a0)
1c002d68:	57e5cfff 	bl	-6708(0xfffe5cc) # 1c001334 <myprintf>
1c002d6c:	14800005 	lu12i.w	$r5,262144(0x40000)
1c002d70:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002d74:	03808184 	ori	$r4,$r12,0x20
1c002d78:	57ec07ff 	bl	-5116(0xfffec04) # 1c00197c <EXTI_ClearITPendingBit>
1c002d7c:	03400000 	andi	$r0,$r0,0x0
1c002d80:	28803061 	ld.w	$r1,$r3,12(0xc)
1c002d84:	28802076 	ld.w	$r22,$r3,8(0x8)
1c002d88:	02804063 	addi.w	$r3,$r3,16(0x10)
1c002d8c:	4c000020 	jirl	$r0,$r1,0

1c002d90 <exti_gpiod7_irq_handler>:
exti_gpiod7_irq_handler():
1c002d90:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c002d94:	29803061 	st.w	$r1,$r3,12(0xc)
1c002d98:	29802076 	st.w	$r22,$r3,8(0x8)
1c002d9c:	02804076 	addi.w	$r22,$r3,16(0x10)
1c002da0:	1c000026 	pcaddu12i	$r6,1(0x1)
1c002da4:	02a870c6 	addi.w	$r6,$r6,-1508(0xa1c)
1c002da8:	02831005 	addi.w	$r5,$r0,196(0xc4)
1c002dac:	1c000004 	pcaddu12i	$r4,0
1c002db0:	02955084 	addi.w	$r4,$r4,1364(0x554)
1c002db4:	57e583ff 	bl	-6784(0xfffe580) # 1c001334 <myprintf>
1c002db8:	15000005 	lu12i.w	$r5,-524288(0x80000)
1c002dbc:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002dc0:	03808184 	ori	$r4,$r12,0x20
1c002dc4:	57ebbbff 	bl	-5192(0xfffebb8) # 1c00197c <EXTI_ClearITPendingBit>
1c002dc8:	03400000 	andi	$r0,$r0,0x0
1c002dcc:	28803061 	ld.w	$r1,$r3,12(0xc)
1c002dd0:	28802076 	ld.w	$r22,$r3,8(0x8)
1c002dd4:	02804063 	addi.w	$r3,$r3,16(0x10)
1c002dd8:	4c000020 	jirl	$r0,$r1,0

1c002ddc <ext_handler>:
ext_handler():
1c002ddc:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002de0:	29807061 	st.w	$r1,$r3,28(0x1c)
1c002de4:	29806076 	st.w	$r22,$r3,24(0x18)
1c002de8:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002dec:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002df0:	0380f18c 	ori	$r12,$r12,0x3c
1c002df4:	1402000d 	lu12i.w	$r13,4096(0x1000)
1c002df8:	2980018d 	st.w	$r13,$r12,0
1c002dfc:	1c000026 	pcaddu12i	$r6,1(0x1)
1c002e00:	02a760c6 	addi.w	$r6,$r6,-1576(0x9d8)
1c002e04:	0283c005 	addi.w	$r5,$r0,240(0xf0)
1c002e08:	1c000004 	pcaddu12i	$r4,0
1c002e0c:	0293e084 	addi.w	$r4,$r4,1272(0x4f8)
1c002e10:	57e527ff 	bl	-6876(0xfffe524) # 1c001334 <myprintf>
1c002e14:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002e18:	0380818c 	ori	$r12,$r12,0x20
1c002e1c:	2880318c 	ld.w	$r12,$r12,12(0xc)
1c002e20:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c002e24:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002e28:	0380818c 	ori	$r12,$r12,0x20
1c002e2c:	2880018c 	ld.w	$r12,$r12,0
1c002e30:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c002e34:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c002e38:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c002e3c:	0014b1ac 	and	$r12,$r13,$r12
1c002e40:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c002e44:	03400000 	andi	$r0,$r0,0x0
1c002e48:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c002e4c:	50004000 	b	64(0x40) # 1c002e8c <ext_handler+0xb0>
1c002e50:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c002e54:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002e58:	0017b1ac 	srl.w	$r12,$r13,$r12
1c002e5c:	0340058c 	andi	$r12,$r12,0x1
1c002e60:	40002180 	beqz	$r12,32(0x20) # 1c002e80 <ext_handler+0xa4>
1c002e64:	1c00000d 	pcaddu12i	$r13,0
1c002e68:	0296b1ad 	addi.w	$r13,$r13,1452(0x5ac)
1c002e6c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002e70:	0040898c 	slli.w	$r12,$r12,0x2
1c002e74:	001031ac 	add.w	$r12,$r13,$r12
1c002e78:	2880018c 	ld.w	$r12,$r12,0
1c002e7c:	4c000181 	jirl	$r1,$r12,0
1c002e80:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002e84:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002e88:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c002e8c:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c002e90:	02807c0c 	addi.w	$r12,$r0,31(0x1f)
1c002e94:	6fffbd8d 	bgeu	$r12,$r13,-68(0x3ffbc) # 1c002e50 <ext_handler+0x74>
1c002e98:	03400000 	andi	$r0,$r0,0x0
1c002e9c:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c002ea0:	28806076 	ld.w	$r22,$r3,24(0x18)
1c002ea4:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002ea8:	4c000020 	jirl	$r0,$r1,0

1c002eac <TIMER_WAKE_INT>:
TIMER_WAKE_INT():
1c002eac:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002eb0:	29807061 	st.w	$r1,$r3,28(0x1c)
1c002eb4:	29806076 	st.w	$r22,$r3,24(0x18)
1c002eb8:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002ebc:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002ec0:	0380f18c 	ori	$r12,$r12,0x3c
1c002ec4:	1400020d 	lu12i.w	$r13,16(0x10)
1c002ec8:	2980018d 	st.w	$r13,$r12,0
1c002ecc:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002ed0:	0380118c 	ori	$r12,$r12,0x4
1c002ed4:	2880018c 	ld.w	$r12,$r12,0
1c002ed8:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c002edc:	57eadfff 	bl	-5412(0xfffeadc) # 1c0019b8 <WDG_DogFeed>
1c002ee0:	03400000 	andi	$r0,$r0,0x0
1c002ee4:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c002ee8:	28806076 	ld.w	$r22,$r3,24(0x18)
1c002eec:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002ef0:	4c000020 	jirl	$r0,$r1,0

1c002ef4 <TOUCH>:
TOUCH():
1c002ef4:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002ef8:	29807061 	st.w	$r1,$r3,28(0x1c)
1c002efc:	29806076 	st.w	$r22,$r3,24(0x18)
1c002f00:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002f04:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c002f08:	0380118c 	ori	$r12,$r12,0x4
1c002f0c:	2880018c 	ld.w	$r12,$r12,0
1c002f10:	0044c18c 	srli.w	$r12,$r12,0x10
1c002f14:	006f818c 	bstrpick.w	$r12,$r12,0xf,0x0
1c002f18:	037ffd8c 	andi	$r12,$r12,0xfff
1c002f1c:	297fbacc 	st.h	$r12,$r22,-18(0xfee)
1c002f20:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c002f24:	0380118c 	ori	$r12,$r12,0x4
1c002f28:	2880018c 	ld.w	$r12,$r12,0
1c002f2c:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c002f30:	03403d8c 	andi	$r12,$r12,0xf
1c002f34:	293fb6cc 	st.b	$r12,$r22,-19(0xfed)
1c002f38:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002f3c:	0380f18c 	ori	$r12,$r12,0x3c
1c002f40:	1400040d 	lu12i.w	$r13,32(0x20)
1c002f44:	2980018d 	st.w	$r13,$r12,0
1c002f48:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c002f4c:	0380118c 	ori	$r12,$r12,0x4
1c002f50:	02803c0d 	addi.w	$r13,$r0,15(0xf)
1c002f54:	2980018d 	st.w	$r13,$r12,0
1c002f58:	2a7fbacc 	ld.hu	$r12,$r22,-18(0xfee)
1c002f5c:	00150185 	move	$r5,$r12
1c002f60:	1c000004 	pcaddu12i	$r4,0
1c002f64:	028fa084 	addi.w	$r4,$r4,1000(0x3e8)
1c002f68:	57e3cfff 	bl	-7220(0xfffe3cc) # 1c001334 <myprintf>
1c002f6c:	03400000 	andi	$r0,$r0,0x0
1c002f70:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c002f74:	28806076 	ld.w	$r22,$r3,24(0x18)
1c002f78:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002f7c:	4c000020 	jirl	$r0,$r1,0

1c002f80 <UART2_INT>:
UART2_INT():
1c002f80:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002f84:	29807076 	st.w	$r22,$r3,28(0x1c)
1c002f88:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002f8c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002f90:	0380f18c 	ori	$r12,$r12,0x3c
1c002f94:	1400080d 	lu12i.w	$r13,64(0x40)
1c002f98:	2980018d 	st.w	$r13,$r12,0
1c002f9c:	157fd18c 	lu12i.w	$r12,-262516(0xbfe8c)
1c002fa0:	0380098c 	ori	$r12,$r12,0x2
1c002fa4:	2a00018c 	ld.bu	$r12,$r12,0
1c002fa8:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c002fac:	03400000 	andi	$r0,$r0,0x0
1c002fb0:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c002fb4:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002fb8:	4c000020 	jirl	$r0,$r1,0

1c002fbc <BAT_FAIL>:
BAT_FAIL():
1c002fbc:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002fc0:	29807061 	st.w	$r1,$r3,28(0x1c)
1c002fc4:	29806076 	st.w	$r22,$r3,24(0x18)
1c002fc8:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002fcc:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002fd0:	0380118c 	ori	$r12,$r12,0x4
1c002fd4:	2880018c 	ld.w	$r12,$r12,0
1c002fd8:	0044cd8c 	srli.w	$r12,$r12,0x13
1c002fdc:	03407d8c 	andi	$r12,$r12,0x1f
1c002fe0:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c002fe4:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002fe8:	0380118c 	ori	$r12,$r12,0x4
1c002fec:	2880018e 	ld.w	$r14,$r12,0
1c002ff0:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002ff4:	0380f18c 	ori	$r12,$r12,0x3c
1c002ff8:	1401f00d 	lu12i.w	$r13,3968(0xf80)
1c002ffc:	0014b5cd 	and	$r13,$r14,$r13
1c003000:	2980018d 	st.w	$r13,$r12,0
1c003004:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c003008:	0280400c 	addi.w	$r12,$r0,16(0x10)
1c00300c:	6800718d 	bltu	$r12,$r13,112(0x70) # 1c00307c <BAT_FAIL+0xc0>
1c003010:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003014:	0040898d 	slli.w	$r13,$r12,0x2
1c003018:	1c00000c 	pcaddu12i	$r12,0
1c00301c:	0291e18c 	addi.w	$r12,$r12,1144(0x478)
1c003020:	001031ac 	add.w	$r12,$r13,$r12
1c003024:	2880018c 	ld.w	$r12,$r12,0
1c003028:	4c000180 	jirl	$r0,$r12,0
1c00302c:	1c000004 	pcaddu12i	$r4,0
1c003030:	028cf084 	addi.w	$r4,$r4,828(0x33c)
1c003034:	57e303ff 	bl	-7424(0xfffe300) # 1c001334 <myprintf>
1c003038:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00303c:	0380118c 	ori	$r12,$r12,0x4
1c003040:	29800180 	st.w	$r0,$r12,0
1c003044:	50003c00 	b	60(0x3c) # 1c003080 <BAT_FAIL+0xc4>
1c003048:	1c000004 	pcaddu12i	$r4,0
1c00304c:	028d2084 	addi.w	$r4,$r4,840(0x348)
1c003050:	57e2e7ff 	bl	-7452(0xfffe2e4) # 1c001334 <myprintf>
1c003054:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c003058:	0380118c 	ori	$r12,$r12,0x4
1c00305c:	2880018e 	ld.w	$r14,$r12,0
1c003060:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c003064:	0380118c 	ori	$r12,$r12,0x4
1c003068:	15fffeed 	lu12i.w	$r13,-9(0xffff7)
1c00306c:	03bffdad 	ori	$r13,$r13,0xfff
1c003070:	0014b5cd 	and	$r13,$r14,$r13
1c003074:	2980018d 	st.w	$r13,$r12,0
1c003078:	50000800 	b	8(0x8) # 1c003080 <BAT_FAIL+0xc4>
1c00307c:	03400000 	andi	$r0,$r0,0x0
1c003080:	03400000 	andi	$r0,$r0,0x0
1c003084:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c003088:	28806076 	ld.w	$r22,$r3,24(0x18)
1c00308c:	02808063 	addi.w	$r3,$r3,32(0x20)
1c003090:	4c000020 	jirl	$r0,$r1,0

1c003094 <intc_handler>:
intc_handler():
1c003094:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c003098:	29807061 	st.w	$r1,$r3,28(0x1c)
1c00309c:	29806076 	st.w	$r22,$r3,24(0x18)
1c0030a0:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0030a4:	157fd40c 	lu12i.w	$r12,-262496(0xbfea0)
1c0030a8:	0380158c 	ori	$r12,$r12,0x5
1c0030ac:	2a00018c 	ld.bu	$r12,$r12,0
1c0030b0:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c0030b4:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c0030b8:	0340058c 	andi	$r12,$r12,0x1
1c0030bc:	40002980 	beqz	$r12,40(0x28) # 1c0030e4 <intc_handler+0x50>
1c0030c0:	02840004 	addi.w	$r4,$r0,256(0x100)
1c0030c4:	57e923ff 	bl	-5856(0xfffe920) # 1c0019e4 <TIM_GetITStatus>
1c0030c8:	0015008c 	move	$r12,$r4
1c0030cc:	40001980 	beqz	$r12,24(0x18) # 1c0030e4 <intc_handler+0x50>
1c0030d0:	02840004 	addi.w	$r4,$r0,256(0x100)
1c0030d4:	57e95fff 	bl	-5796(0xfffe95c) # 1c001a30 <TIM_ClearIT>
1c0030d8:	1c000004 	pcaddu12i	$r4,0
1c0030dc:	028b7084 	addi.w	$r4,$r4,732(0x2dc)
1c0030e0:	57e257ff 	bl	-7596(0xfffe254) # 1c001334 <myprintf>
1c0030e4:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c0030e8:	0340118c 	andi	$r12,$r12,0x4
1c0030ec:	40003580 	beqz	$r12,52(0x34) # 1c003120 <intc_handler+0x8c>
1c0030f0:	157fd10c 	lu12i.w	$r12,-262520(0xbfe88)
1c0030f4:	2a00018c 	ld.bu	$r12,$r12,0
1c0030f8:	293fbacc 	st.b	$r12,$r22,-18(0xfee)
1c0030fc:	2a3fbacc 	ld.bu	$r12,$r22,-18(0xfee)
1c003100:	00150185 	move	$r5,$r12
1c003104:	1c000004 	pcaddu12i	$r4,0
1c003108:	028b6084 	addi.w	$r4,$r4,728(0x2d8)
1c00310c:	57e22bff 	bl	-7640(0xfffe228) # 1c001334 <myprintf>
1c003110:	157fd40c 	lu12i.w	$r12,-262496(0xbfea0)
1c003114:	03800d8c 	ori	$r12,$r12,0x3
1c003118:	0280100d 	addi.w	$r13,$r0,4(0x4)
1c00311c:	2900018d 	st.b	$r13,$r12,0
1c003120:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c003124:	0340218c 	andi	$r12,$r12,0x8
1c003128:	40002d80 	beqz	$r12,44(0x2c) # 1c003154 <intc_handler+0xc0>
1c00312c:	157fd00c 	lu12i.w	$r12,-262528(0xbfe80)
1c003130:	2a00018c 	ld.bu	$r12,$r12,0
1c003134:	293fb6cc 	st.b	$r12,$r22,-19(0xfed)
1c003138:	2a3fb6cc 	ld.bu	$r12,$r22,-19(0xfed)
1c00313c:	00150184 	move	$r4,$r12
1c003140:	57f12fff 	bl	-3796(0xffff12c) # 1c00226c <recv_dat_int>
1c003144:	157fd40c 	lu12i.w	$r12,-262496(0xbfea0)
1c003148:	03800d8c 	ori	$r12,$r12,0x3
1c00314c:	0280200d 	addi.w	$r13,$r0,8(0x8)
1c003150:	2900018d 	st.b	$r13,$r12,0
1c003154:	157fd40c 	lu12i.w	$r12,-262496(0xbfea0)
1c003158:	03800d8c 	ori	$r12,$r12,0x3
1c00315c:	02bffc0d 	addi.w	$r13,$r0,-1(0xfff)
1c003160:	2900018d 	st.b	$r13,$r12,0
1c003164:	03400000 	andi	$r0,$r0,0x0
1c003168:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c00316c:	28806076 	ld.w	$r22,$r3,24(0x18)
1c003170:	02808063 	addi.w	$r3,$r3,32(0x20)
1c003174:	4c000020 	jirl	$r0,$r1,0

1c003178 <TIMER_HANDLER>:
TIMER_HANDLER():
1c003178:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c00317c:	29803061 	st.w	$r1,$r3,12(0xc)
1c003180:	29802076 	st.w	$r22,$r3,8(0x8)
1c003184:	02804076 	addi.w	$r22,$r3,16(0x10)
1c003188:	57e5e3ff 	bl	-6688(0xfffe5e0) # 1c001768 <Set_Timer_clear>
1c00318c:	1c000004 	pcaddu12i	$r4,0
1c003190:	02899084 	addi.w	$r4,$r4,612(0x264)
1c003194:	57e1a3ff 	bl	-7776(0xfffe1a0) # 1c001334 <myprintf>
1c003198:	57e5b3ff 	bl	-6736(0xfffe5b0) # 1c001748 <Set_Timer_stop>
1c00319c:	03400000 	andi	$r0,$r0,0x0
1c0031a0:	28803061 	ld.w	$r1,$r3,12(0xc)
1c0031a4:	28802076 	ld.w	$r22,$r3,8(0x8)
1c0031a8:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0031ac:	4c000020 	jirl	$r0,$r1,0

Disassembly of section .rodata:

1c0031b0 <Ext_IrqHandle-0x260>:
1c0031b0:	1c001554 	pcaddu12i	$r20,170(0xaa)
1c0031b4:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c0031b8:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c0031bc:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c0031c0:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c0031c4:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c0031c8:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c0031cc:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c0031d0:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c0031d4:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c0031d8:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c0031dc:	1c00156c 	pcaddu12i	$r12,171(0xab)
1c0031e0:	1c0015f4 	pcaddu12i	$r20,175(0xaf)
1c0031e4:	1c0015f4 	pcaddu12i	$r20,175(0xaf)
1c0031e8:	1c0015f4 	pcaddu12i	$r20,175(0xaf)
1c0031ec:	1c0015f4 	pcaddu12i	$r20,175(0xaf)
1c0031f0:	1c0015f4 	pcaddu12i	$r20,175(0xaf)
1c0031f4:	1c0015f4 	pcaddu12i	$r20,175(0xaf)
1c0031f8:	1c0015f4 	pcaddu12i	$r20,175(0xaf)
1c0031fc:	1c0015f4 	pcaddu12i	$r20,175(0xaf)
1c003200:	1c0015f4 	pcaddu12i	$r20,175(0xaf)
1c003204:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c003208:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c00320c:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c003210:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c003214:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c003218:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c00321c:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c003220:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c003224:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c003228:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c00322c:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c003230:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c003234:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c003238:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c00323c:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c003240:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c003244:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c003248:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c00324c:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c003250:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c003254:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c003258:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c00325c:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c003260:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c003264:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c003268:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c00326c:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c003270:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c003274:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c003278:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c00327c:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c003280:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c003284:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c003288:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c00328c:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c003290:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c003294:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c003298:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c00329c:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c0032a0:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c0032a4:	1c0014e4 	pcaddu12i	$r4,167(0xa7)
1c0032a8:	1c00140c 	pcaddu12i	$r12,160(0xa0)
1c0032ac:	1c001474 	pcaddu12i	$r20,163(0xa3)
1c0032b0:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c0032b4:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c0032b8:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c0032bc:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c0032c0:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c0032c4:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c0032c8:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c0032cc:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c0032d0:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c0032d4:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c0032d8:	1c0014ac 	pcaddu12i	$r12,165(0xa5)
1c0032dc:	1c00151c 	pcaddu12i	$r28,168(0xa8)
1c0032e0:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c0032e4:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c0032e8:	1c0013e0 	pcaddu12i	$r0,159(0x9f)
1c0032ec:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c0032f0:	1c00143c 	pcaddu12i	$r28,161(0xa1)
1c0032f4:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c0032f8:	1c001670 	pcaddu12i	$r16,179(0xb3)
1c0032fc:	1c00151c 	pcaddu12i	$r28,168(0xa8)
1c003300:	3c200a0d 	0x3c200a0d
1c003304:	696c2020 	bltu	$r1,$r0,93216(0x16c20) # 1c019f24 <_sidata+0x16744>
1c003308:	203a656e 	ll.w	$r14,$r11,14948(0x3a64)
1c00330c:	66206425 	bge	$r1,$r5,-122780(0x22064) # 1bfe5370 <_start-0x1ac90>
1c003310:	3a636e75 	0x3a636e75
1c003314:	20207325 	ll.w	$r5,$r25,8304(0x2070)
1c003318:	0a0d3e20 	0x0a0d3e20
1c00331c:	00000000 	0x00000000
1c003320:	2e2e2e0a 	0x2e2e2e0a
1c003324:	2e2e2e2e 	0x2e2e2e2e
1c003328:	2e2e2e2e 	0x2e2e2e2e
1c00332c:	4f532e2e 	jirl	$r14,$r17,-44244(0x3532c)
1c003330:	495f5446 	bceqz	$fcc2,1662804(0x195f54) # 1c199284 <_sidata+0x195aa4>
1c003334:	2e2e544e 	0x2e2e544e
1c003338:	2e2e2e2e 	0x2e2e2e2e
1c00333c:	2e2e2e2e 	0x2e2e2e2e
1c003340:	2e2e2e2e 	0x2e2e2e2e
1c003344:	00000d0a 	0x00000d0a
1c003348:	2d2d2d0a 	0x2d2d2d0a
1c00334c:	63756f74 	blt	$r27,$r20,-35476(0x3756c) # 1bffa8b8 <_start-0x5748>
1c003350:	746e4968 	0x746e4968
1c003354:	79654b3a 	0x79654b3a
1c003358:	6e616843 	bgeu	$r2,$r3,-106136(0x26168) # 1bfe94c0 <_start-0x16b40>
1c00335c:	3a6c656e 	0x3a6c656e
1c003360:	78257830 	0x78257830
1c003364:	0000000a 	0x0000000a
1c003368:	2e2e2e0a 	0x2e2e2e0a
1c00336c:	2e2e2e2e 	0x2e2e2e2e
1c003370:	2e2e2e2e 	0x2e2e2e2e
1c003374:	41422e2e 	beqz	$r17,3752492(0x39422c) # 1c3975a0 <_sidata+0x393dc0>
1c003378:	41465f54 	beqz	$r26,-3062180(0x51465c) # 1bd179d4 <_start-0x2e862c>
1c00337c:	2e2e4c49 	0x2e2e4c49
1c003380:	2e2e2e2e 	0x2e2e2e2e
1c003384:	2e2e2e2e 	0x2e2e2e2e
1c003388:	2e2e2e2e 	0x2e2e2e2e
1c00338c:	00000d0a 	0x00000d0a
1c003390:	2e2e2e0a 	0x2e2e2e0a
1c003394:	2e2e2e2e 	0x2e2e2e2e
1c003398:	2e2e2e2e 	0x2e2e2e2e
1c00339c:	44412e2e 	bnez	$r17,3686700(0x38412c) # 1c3874c8 <_sidata+0x383ce8>
1c0033a0:	2e2e2e43 	0x2e2e2e43
1c0033a4:	2e2e2e2e 	0x2e2e2e2e
1c0033a8:	2e2e2e2e 	0x2e2e2e2e
1c0033ac:	0a2e2e2e 	xvfmadd.d	$xr14,$xr17,$xr11,$xr28
1c0033b0:	0000000d 	0x0000000d
1c0033b4:	69726550 	bltu	$r10,$r16,94820(0x17264) # 1c01a618 <_sidata+0x16e38>
1c0033b8:	72656870 	0x72656870
1c0033bc:	20736c61 	ll.w	$r1,$r3,29548(0x736c)
1c0033c0:	656d6954 	bge	$r10,$r20,93544(0x16d68) # 1c01a128 <_sidata+0x16948>
1c0033c4:	6c632072 	bgeu	$r3,$r18,25376(0x6320) # 1c0096e4 <_sidata+0x5f04>
1c0033c8:	20726165 	ll.w	$r5,$r11,29280(0x7260)
1c0033cc:	65746e69 	bge	$r19,$r9,95340(0x1746c) # 1c01a838 <_sidata+0x17058>
1c0033d0:	70757272 	vmax.wu	$vr18,$vr19,$vr28
1c0033d4:	0a2e2e74 	xvfmadd.d	$xr20,$xr19,$xr11,$xr28
1c0033d8:	00000000 	0x00000000
1c0033dc:	74726175 	xvmin.b	$xr21,$xr11,$xr24
1c0033e0:	65722031 	bge	$r1,$r17,94752(0x17220) # 1c01a600 <_sidata+0x16e20>
1c0033e4:	303a7663 	0x303a7663
1c0033e8:	0a782578 	0x0a782578
1c0033ec:	00000000 	0x00000000
1c0033f0:	65726f43 	bge	$r26,$r3,94828(0x1726c) # 1c01a65c <_sidata+0x16e7c>
1c0033f4:	6d695420 	bgeu	$r1,$r0,92500(0x16954) # 1c019d48 <_sidata+0x16568>
1c0033f8:	63207265 	blt	$r19,$r5,-57232(0x32070) # 1bff5468 <_start-0xab98>
1c0033fc:	7261656c 	0x7261656c
1c003400:	746e6920 	0x746e6920
1c003404:	75727265 	0x75727265
1c003408:	2e2e7470 	0x2e2e7470
1c00340c:	0000000a 	0x0000000a

1c003410 <Ext_IrqHandle>:
1c003410:	1c00245c 	pcaddu12i	$r28,290(0x122)
1c003414:	1c0024a8 	pcaddu12i	$r8,293(0x125)
1c003418:	1c0024f4 	pcaddu12i	$r20,295(0x127)
1c00341c:	1c002540 	pcaddu12i	$r0,298(0x12a)
1c003420:	1c00258c 	pcaddu12i	$r12,300(0x12c)
1c003424:	1c0025d8 	pcaddu12i	$r24,302(0x12e)
1c003428:	1c002624 	pcaddu12i	$r4,305(0x131)
1c00342c:	1c002670 	pcaddu12i	$r16,307(0x133)
1c003430:	1c0026bc 	pcaddu12i	$r28,309(0x135)
1c003434:	1c002708 	pcaddu12i	$r8,312(0x138)
1c003438:	1c002754 	pcaddu12i	$r20,314(0x13a)
1c00343c:	1c0027a0 	pcaddu12i	$r0,317(0x13d)
1c003440:	1c0027ec 	pcaddu12i	$r12,319(0x13f)
1c003444:	1c002838 	pcaddu12i	$r24,321(0x141)
1c003448:	1c002884 	pcaddu12i	$r4,324(0x144)
1c00344c:	1c0028d0 	pcaddu12i	$r16,326(0x146)
1c003450:	1c00291c 	pcaddu12i	$r28,328(0x148)
1c003454:	1c002968 	pcaddu12i	$r8,331(0x14b)
1c003458:	1c0029b4 	pcaddu12i	$r20,333(0x14d)
1c00345c:	1c002a00 	pcaddu12i	$r0,336(0x150)
1c003460:	1c002a4c 	pcaddu12i	$r12,338(0x152)
1c003464:	1c002a98 	pcaddu12i	$r24,340(0x154)
1c003468:	1c002ae4 	pcaddu12i	$r4,343(0x157)
1c00346c:	1c002b30 	pcaddu12i	$r16,345(0x159)
1c003470:	1c002b7c 	pcaddu12i	$r28,347(0x15b)
1c003474:	1c002bc8 	pcaddu12i	$r8,350(0x15e)
1c003478:	1c002c14 	pcaddu12i	$r20,352(0x160)
1c00347c:	1c002c60 	pcaddu12i	$r0,355(0x163)
1c003480:	1c002cac 	pcaddu12i	$r12,357(0x165)
1c003484:	1c002cf8 	pcaddu12i	$r24,359(0x167)
1c003488:	1c002d44 	pcaddu12i	$r4,362(0x16a)
1c00348c:	1c002d90 	pcaddu12i	$r16,364(0x16c)
1c003490:	1c00307c 	pcaddu12i	$r28,387(0x183)
1c003494:	1c00302c 	pcaddu12i	$r12,385(0x181)
1c003498:	1c00307c 	pcaddu12i	$r28,387(0x183)
1c00349c:	1c00307c 	pcaddu12i	$r28,387(0x183)
1c0034a0:	1c00307c 	pcaddu12i	$r28,387(0x183)
1c0034a4:	1c00307c 	pcaddu12i	$r28,387(0x183)
1c0034a8:	1c00307c 	pcaddu12i	$r28,387(0x183)
1c0034ac:	1c00307c 	pcaddu12i	$r28,387(0x183)
1c0034b0:	1c00307c 	pcaddu12i	$r28,387(0x183)
1c0034b4:	1c00307c 	pcaddu12i	$r28,387(0x183)
1c0034b8:	1c00307c 	pcaddu12i	$r28,387(0x183)
1c0034bc:	1c00307c 	pcaddu12i	$r28,387(0x183)
1c0034c0:	1c00307c 	pcaddu12i	$r28,387(0x183)
1c0034c4:	1c00307c 	pcaddu12i	$r28,387(0x183)
1c0034c8:	1c00307c 	pcaddu12i	$r28,387(0x183)
1c0034cc:	1c00307c 	pcaddu12i	$r28,387(0x183)
1c0034d0:	1c003048 	pcaddu12i	$r8,386(0x182)

1c0034d4 <__FUNCTION__.1547>:
1c0034d4:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01a94c <_sidata+0x1716c>
1c0034d8:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a53c <_sidata+0x16d5c>
1c0034dc:	5f30616f 	bne	$r11,$r15,-53152(0x33060) # 1bff653c <_start-0x9ac4>
1c0034e0:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa650 <_start-0x59b0>
1c0034e4:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a344 <_sidata+0x6b64>
1c0034e8:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c0034ec <__FUNCTION__.1551>:
1c0034ec:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01a964 <_sidata+0x17184>
1c0034f0:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a554 <_sidata+0x16d74>
1c0034f4:	5f31616f 	bne	$r11,$r15,-52896(0x33160) # 1bff6654 <_start-0x99ac>
1c0034f8:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa668 <_start-0x5998>
1c0034fc:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a35c <_sidata+0x6b7c>
1c003500:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c003504 <__FUNCTION__.1555>:
1c003504:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01a97c <_sidata+0x1719c>
1c003508:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a56c <_sidata+0x16d8c>
1c00350c:	5f32616f 	bne	$r11,$r15,-52640(0x33260) # 1bff676c <_start-0x9894>
1c003510:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa680 <_start-0x5980>
1c003514:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a374 <_sidata+0x6b94>
1c003518:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00351c <__FUNCTION__.1559>:
1c00351c:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01a994 <_sidata+0x171b4>
1c003520:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a584 <_sidata+0x16da4>
1c003524:	5f33616f 	bne	$r11,$r15,-52384(0x33360) # 1bff6884 <_start-0x977c>
1c003528:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa698 <_start-0x5968>
1c00352c:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a38c <_sidata+0x6bac>
1c003530:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c003534 <__FUNCTION__.1563>:
1c003534:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01a9ac <_sidata+0x171cc>
1c003538:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a59c <_sidata+0x16dbc>
1c00353c:	5f34616f 	bne	$r11,$r15,-52128(0x33460) # 1bff699c <_start-0x9664>
1c003540:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa6b0 <_start-0x5950>
1c003544:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a3a4 <_sidata+0x6bc4>
1c003548:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00354c <__FUNCTION__.1567>:
1c00354c:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01a9c4 <_sidata+0x171e4>
1c003550:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a5b4 <_sidata+0x16dd4>
1c003554:	5f35616f 	bne	$r11,$r15,-51872(0x33560) # 1bff6ab4 <_start-0x954c>
1c003558:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa6c8 <_start-0x5938>
1c00355c:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a3bc <_sidata+0x6bdc>
1c003560:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c003564 <__FUNCTION__.1571>:
1c003564:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01a9dc <_sidata+0x171fc>
1c003568:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a5cc <_sidata+0x16dec>
1c00356c:	5f36616f 	bne	$r11,$r15,-51616(0x33660) # 1bff6bcc <_start-0x9434>
1c003570:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa6e0 <_start-0x5920>
1c003574:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a3d4 <_sidata+0x6bf4>
1c003578:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00357c <__FUNCTION__.1575>:
1c00357c:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01a9f4 <_sidata+0x17214>
1c003580:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a5e4 <_sidata+0x16e04>
1c003584:	5f37616f 	bne	$r11,$r15,-51360(0x33760) # 1bff6ce4 <_start-0x931c>
1c003588:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa6f8 <_start-0x5908>
1c00358c:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a3ec <_sidata+0x6c0c>
1c003590:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c003594 <__FUNCTION__.1579>:
1c003594:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01aa0c <_sidata+0x1722c>
1c003598:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a5fc <_sidata+0x16e1c>
1c00359c:	5f30626f 	bne	$r19,$r15,-53152(0x33060) # 1bff65fc <_start-0x9a04>
1c0035a0:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa710 <_start-0x58f0>
1c0035a4:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a404 <_sidata+0x6c24>
1c0035a8:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c0035ac <__FUNCTION__.1583>:
1c0035ac:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01aa24 <_sidata+0x17244>
1c0035b0:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a614 <_sidata+0x16e34>
1c0035b4:	5f31626f 	bne	$r19,$r15,-52896(0x33160) # 1bff6714 <_start-0x98ec>
1c0035b8:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa728 <_start-0x58d8>
1c0035bc:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a41c <_sidata+0x6c3c>
1c0035c0:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c0035c4 <__FUNCTION__.1587>:
1c0035c4:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01aa3c <_sidata+0x1725c>
1c0035c8:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a62c <_sidata+0x16e4c>
1c0035cc:	5f32626f 	bne	$r19,$r15,-52640(0x33260) # 1bff682c <_start-0x97d4>
1c0035d0:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa740 <_start-0x58c0>
1c0035d4:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a434 <_sidata+0x6c54>
1c0035d8:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c0035dc <__FUNCTION__.1591>:
1c0035dc:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01aa54 <_sidata+0x17274>
1c0035e0:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a644 <_sidata+0x16e64>
1c0035e4:	5f33626f 	bne	$r19,$r15,-52384(0x33360) # 1bff6944 <_start-0x96bc>
1c0035e8:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa758 <_start-0x58a8>
1c0035ec:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a44c <_sidata+0x6c6c>
1c0035f0:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c0035f4 <__FUNCTION__.1595>:
1c0035f4:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01aa6c <_sidata+0x1728c>
1c0035f8:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a65c <_sidata+0x16e7c>
1c0035fc:	5f34626f 	bne	$r19,$r15,-52128(0x33460) # 1bff6a5c <_start-0x95a4>
1c003600:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa770 <_start-0x5890>
1c003604:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a464 <_sidata+0x6c84>
1c003608:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00360c <__FUNCTION__.1599>:
1c00360c:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01aa84 <_sidata+0x172a4>
1c003610:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a674 <_sidata+0x16e94>
1c003614:	5f35626f 	bne	$r19,$r15,-51872(0x33560) # 1bff6b74 <_start-0x948c>
1c003618:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa788 <_start-0x5878>
1c00361c:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a47c <_sidata+0x6c9c>
1c003620:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c003624 <__FUNCTION__.1603>:
1c003624:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01aa9c <_sidata+0x172bc>
1c003628:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a68c <_sidata+0x16eac>
1c00362c:	5f36626f 	bne	$r19,$r15,-51616(0x33660) # 1bff6c8c <_start-0x9374>
1c003630:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa7a0 <_start-0x5860>
1c003634:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a494 <_sidata+0x6cb4>
1c003638:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00363c <__FUNCTION__.1607>:
1c00363c:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01aab4 <_sidata+0x172d4>
1c003640:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a6a4 <_sidata+0x16ec4>
1c003644:	5f37626f 	bne	$r19,$r15,-51360(0x33760) # 1bff6da4 <_start-0x925c>
1c003648:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa7b8 <_start-0x5848>
1c00364c:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a4ac <_sidata+0x6ccc>
1c003650:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c003654 <__FUNCTION__.1611>:
1c003654:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01aacc <_sidata+0x172ec>
1c003658:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a6bc <_sidata+0x16edc>
1c00365c:	5f30636f 	bne	$r27,$r15,-53152(0x33060) # 1bff66bc <_start-0x9944>
1c003660:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa7d0 <_start-0x5830>
1c003664:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a4c4 <_sidata+0x6ce4>
1c003668:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00366c <__FUNCTION__.1615>:
1c00366c:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01aae4 <_sidata+0x17304>
1c003670:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a6d4 <_sidata+0x16ef4>
1c003674:	5f31636f 	bne	$r27,$r15,-52896(0x33160) # 1bff67d4 <_start-0x982c>
1c003678:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa7e8 <_start-0x5818>
1c00367c:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a4dc <_sidata+0x6cfc>
1c003680:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c003684 <__FUNCTION__.1619>:
1c003684:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01aafc <_sidata+0x1731c>
1c003688:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a6ec <_sidata+0x16f0c>
1c00368c:	5f32636f 	bne	$r27,$r15,-52640(0x33260) # 1bff68ec <_start-0x9714>
1c003690:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa800 <_start-0x5800>
1c003694:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a4f4 <_sidata+0x6d14>
1c003698:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00369c <__FUNCTION__.1623>:
1c00369c:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01ab14 <_sidata+0x17334>
1c0036a0:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a704 <_sidata+0x16f24>
1c0036a4:	5f33636f 	bne	$r27,$r15,-52384(0x33360) # 1bff6a04 <_start-0x95fc>
1c0036a8:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa818 <_start-0x57e8>
1c0036ac:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a50c <_sidata+0x6d2c>
1c0036b0:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c0036b4 <__FUNCTION__.1627>:
1c0036b4:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01ab2c <_sidata+0x1734c>
1c0036b8:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a71c <_sidata+0x16f3c>
1c0036bc:	5f34636f 	bne	$r27,$r15,-52128(0x33460) # 1bff6b1c <_start-0x94e4>
1c0036c0:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa830 <_start-0x57d0>
1c0036c4:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a524 <_sidata+0x6d44>
1c0036c8:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c0036cc <__FUNCTION__.1631>:
1c0036cc:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01ab44 <_sidata+0x17364>
1c0036d0:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a734 <_sidata+0x16f54>
1c0036d4:	5f35636f 	bne	$r27,$r15,-51872(0x33560) # 1bff6c34 <_start-0x93cc>
1c0036d8:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa848 <_start-0x57b8>
1c0036dc:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a53c <_sidata+0x6d5c>
1c0036e0:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c0036e4 <__FUNCTION__.1635>:
1c0036e4:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01ab5c <_sidata+0x1737c>
1c0036e8:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a74c <_sidata+0x16f6c>
1c0036ec:	5f36636f 	bne	$r27,$r15,-51616(0x33660) # 1bff6d4c <_start-0x92b4>
1c0036f0:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa860 <_start-0x57a0>
1c0036f4:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a554 <_sidata+0x6d74>
1c0036f8:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c0036fc <__FUNCTION__.1639>:
1c0036fc:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01ab74 <_sidata+0x17394>
1c003700:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a764 <_sidata+0x16f84>
1c003704:	5f37636f 	bne	$r27,$r15,-51360(0x33760) # 1bff6e64 <_start-0x919c>
1c003708:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa878 <_start-0x5788>
1c00370c:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a56c <_sidata+0x6d8c>
1c003710:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c003714 <__FUNCTION__.1643>:
1c003714:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01ab8c <_sidata+0x173ac>
1c003718:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a77c <_sidata+0x16f9c>
1c00371c:	5f30646f 	bne	$r3,$r15,-53148(0x33064) # 1bff6780 <_start-0x9880>
1c003720:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa890 <_start-0x5770>
1c003724:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a584 <_sidata+0x6da4>
1c003728:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00372c <__FUNCTION__.1647>:
1c00372c:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01aba4 <_sidata+0x173c4>
1c003730:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a794 <_sidata+0x16fb4>
1c003734:	5f31646f 	bne	$r3,$r15,-52892(0x33164) # 1bff6898 <_start-0x9768>
1c003738:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa8a8 <_start-0x5758>
1c00373c:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a59c <_sidata+0x6dbc>
1c003740:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c003744 <__FUNCTION__.1651>:
1c003744:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01abbc <_sidata+0x173dc>
1c003748:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a7ac <_sidata+0x16fcc>
1c00374c:	5f32646f 	bne	$r3,$r15,-52636(0x33264) # 1bff69b0 <_start-0x9650>
1c003750:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa8c0 <_start-0x5740>
1c003754:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a5b4 <_sidata+0x6dd4>
1c003758:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00375c <__FUNCTION__.1655>:
1c00375c:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01abd4 <_sidata+0x173f4>
1c003760:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a7c4 <_sidata+0x16fe4>
1c003764:	5f33646f 	bne	$r3,$r15,-52380(0x33364) # 1bff6ac8 <_start-0x9538>
1c003768:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa8d8 <_start-0x5728>
1c00376c:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a5cc <_sidata+0x6dec>
1c003770:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c003774 <__FUNCTION__.1659>:
1c003774:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01abec <_sidata+0x1740c>
1c003778:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a7dc <_sidata+0x16ffc>
1c00377c:	5f34646f 	bne	$r3,$r15,-52124(0x33464) # 1bff6be0 <_start-0x9420>
1c003780:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa8f0 <_start-0x5710>
1c003784:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a5e4 <_sidata+0x6e04>
1c003788:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00378c <__FUNCTION__.1663>:
1c00378c:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01ac04 <_sidata+0x17424>
1c003790:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a7f4 <_sidata+0x17014>
1c003794:	5f35646f 	bne	$r3,$r15,-51868(0x33564) # 1bff6cf8 <_start-0x9308>
1c003798:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa908 <_start-0x56f8>
1c00379c:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a5fc <_sidata+0x6e1c>
1c0037a0:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c0037a4 <__FUNCTION__.1667>:
1c0037a4:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01ac1c <_sidata+0x1743c>
1c0037a8:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a80c <_sidata+0x1702c>
1c0037ac:	5f36646f 	bne	$r3,$r15,-51612(0x33664) # 1bff6e10 <_start-0x91f0>
1c0037b0:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa920 <_start-0x56e0>
1c0037b4:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a614 <_sidata+0x6e34>
1c0037b8:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c0037bc <__FUNCTION__.1671>:
1c0037bc:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c01ac34 <_sidata+0x17454>
1c0037c0:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c01a824 <_sidata+0x17044>
1c0037c4:	5f37646f 	bne	$r3,$r15,-51356(0x33764) # 1bff6f28 <_start-0x90d8>
1c0037c8:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1bffa938 <_start-0x56c8>
1c0037cc:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a62c <_sidata+0x6e4c>
1c0037d0:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c0037d4 <__FUNCTION__.1680>:
1c0037d4:	5f747865 	bne	$r3,$r5,-35720(0x37478) # 1bffac4c <_start-0x53b4>
1c0037d8:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c00a638 <_sidata+0x6e58>
1c0037dc:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

Disassembly of section .bss.g_recv_flag:

80000000 <g_recv_flag>:
80000000:	00000000 	0x00000000

Disassembly of section .bss.g_recvBuff:

80000004 <g_recvBuff>:
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	0x3a434347
   4:	4e472820 	jirl	$r0,$r1,-112856(0x24728)
   8:	38202955 	ldx.bu	$r21,$r10,$r10
   c:	302e332e 	vldrepl.w	$vr14,$r25,-464(0xe30)
	...
