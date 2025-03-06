
1c102_demo.elf:     file format elf32-loongarch
1c102_demo.elf


Disassembly of section .text:

1c000000 <_start>:
_start():
1c000000:	0015000d 	move	$r13,$r0
1c000004:	50002000 	b	32(0x20) # 1c000024 <LoopCopyDataInit>

1c000008 <CopyDataInit>:
CopyDataInit():
1c000008:	1438018f 	lu12i.w	$r15,114700(0x1c00c)
1c00000c:	039ac1ef 	ori	$r15,$r15,0x6b0
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
1c000030:	038731ef 	ori	$r15,$r15,0x1cc
1c000034:	0010358e 	add.w	$r14,$r12,$r13
1c000038:	5fffd1cf 	bne	$r14,$r15,-48(0x3ffd0) # 1c000008 <CopyDataInit>
1c00003c:	1500000c 	lu12i.w	$r12,-524288(0x80000)
1c000040:	0380018c 	ori	$r12,$r12,0x0
1c000044:	1500000d 	lu12i.w	$r13,-524288(0x80000)
1c000048:	038221ad 	ori	$r13,$r13,0x88
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
1c0000a0:	54545400 	bl	21588(0x5454) # 1c0054f4 <main>
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
1c001090:	54953800 	bl	38200(0x9538) # 1c00a5c8 <TIMER_WAKE_INT>
1c001094:	50003c00 	b	60(0x3c) # 1c0010d0 <exception_exit>

1c001098 <touch_label>:
touch_label():
1c001098:	54957800 	bl	38264(0x9578) # 1c00a610 <TOUCH>
1c00109c:	50003400 	b	52(0x34) # 1c0010d0 <exception_exit>

1c0010a0 <uart2_label>:
uart2_label():
1c0010a0:	5495fc00 	bl	38396(0x95fc) # 1c00a69c <UART2_INT>
1c0010a4:	50002c00 	b	44(0x2c) # 1c0010d0 <exception_exit>

1c0010a8 <bcc_label>:
bcc_label():
1c0010a8:	54963000 	bl	38448(0x9630) # 1c00a6d8 <BAT_FAIL>
1c0010ac:	50002400 	b	36(0x24) # 1c0010d0 <exception_exit>

1c0010b0 <exint_label>:
exint_label():
1c0010b0:	54944800 	bl	37960(0x9448) # 1c00a4f8 <ext_handler>
1c0010b4:	50001c00 	b	28(0x1c) # 1c0010d0 <exception_exit>

1c0010b8 <timer_label>:
timer_label():
1c0010b8:	549e3c00 	bl	40508(0x9e3c) # 1c00aef4 <TIMER_HANDLER>
1c0010bc:	50001400 	b	20(0x14) # 1c0010d0 <exception_exit>

1c0010c0 <exception_core_check>:
exception_core_check():
1c0010c0:	0341018d 	andi	$r13,$r12,0x40
1c0010c4:	40000da0 	beqz	$r13,12(0xc) # 1c0010d0 <exception_exit>
1c0010c8:	5496e800 	bl	38632(0x96e8) # 1c00a7b0 <intc_handler>
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

1c001128 <serial_out>:
serial_out():
1c001128:	157fd008 	lu12i.w	$r8,-262528(0xbfe80)
1c00112c:	2a001508 	ld.bu	$r8,$r8,5(0x5)
1c001130:	03408108 	andi	$r8,$r8,0x20
1c001134:	43fff51f 	beqz	$r8,-12(0x7ffff4) # 1c001128 <serial_out>
1c001138:	157fd00c 	lu12i.w	$r12,-262528(0xbfe80)
1c00113c:	29000184 	st.b	$r4,$r12,0
1c001140:	4c000020 	jirl	$r0,$r1,0

1c001144 <outputaddr>:
outputaddr():
1c001144:	02bff063 	addi.w	$r3,$r3,-4(0xffc)
1c001148:	29800061 	st.w	$r1,$r3,0
1c00114c:	1cc80006 	pcaddu12i	$r6,409600(0x64000)
1c001150:	28bae0c6 	ld.w	$r6,$r6,-328(0xeb8)
1c001154:	15e0000d 	lu12i.w	$r13,-65536(0xf0000)
1c001158:	0380200e 	ori	$r14,$r0,0x8
1c00115c:	0380700f 	ori	$r15,$r0,0x1c
1c001160:	03800085 	ori	$r5,$r4,0x0
1c001164:	58002dc0 	beq	$r14,$r0,44(0x2c) # 1c001190 <outputaddr+0x4c>
1c001168:	0014b4ac 	and	$r12,$r5,$r13
1c00116c:	0017bd8c 	srl.w	$r12,$r12,$r15
1c001170:	0010198c 	add.w	$r12,$r12,$r6
1c001174:	2a000190 	ld.bu	$r16,$r12,0
1c001178:	03800204 	ori	$r4,$r16,0x0
1c00117c:	57ffafff 	bl	-84(0xfffffac) # 1c001128 <serial_out>
1c001180:	004491ad 	srli.w	$r13,$r13,0x4
1c001184:	02bff1ef 	addi.w	$r15,$r15,-4(0xffc)
1c001188:	02bffdce 	addi.w	$r14,$r14,-1(0xfff)
1c00118c:	53ffdbff 	b	-40(0xfffffd8) # 1c001164 <outputaddr+0x20>
1c001190:	03802804 	ori	$r4,$r0,0xa
1c001194:	57ff97ff 	bl	-108(0xfffff94) # 1c001128 <serial_out>
1c001198:	28800061 	ld.w	$r1,$r3,0
1c00119c:	02801063 	addi.w	$r3,$r3,4(0x4)
1c0011a0:	4c000020 	jirl	$r0,$r1,0

1c0011a4 <outputstring>:
outputstring():
1c0011a4:	00150089 	move	$r9,$r4
1c0011a8:	2a00012c 	ld.bu	$r12,$r9,0
1c0011ac:	58002580 	beq	$r12,$r0,36(0x24) # 1c0011d0 <outputstring+0x2c>
1c0011b0:	157fd008 	lu12i.w	$r8,-262528(0xbfe80)
1c0011b4:	2a001508 	ld.bu	$r8,$r8,5(0x5)
1c0011b8:	03408108 	andi	$r8,$r8,0x20
1c0011bc:	43fff51f 	beqz	$r8,-12(0x7ffff4) # 1c0011b0 <outputstring+0xc>
1c0011c0:	157fd007 	lu12i.w	$r7,-262528(0xbfe80)
1c0011c4:	290000ec 	st.b	$r12,$r7,0
1c0011c8:	02800529 	addi.w	$r9,$r9,1(0x1)
1c0011cc:	53ffdfff 	b	-36(0xfffffdc) # 1c0011a8 <outputstring+0x4>
1c0011d0:	157fd008 	lu12i.w	$r8,-262528(0xbfe80)
1c0011d4:	2a001508 	ld.bu	$r8,$r8,5(0x5)
1c0011d8:	03410108 	andi	$r8,$r8,0x40
1c0011dc:	43fff51f 	beqz	$r8,-12(0x7ffff4) # 1c0011d0 <outputstring+0x2c>
1c0011e0:	4c000020 	jirl	$r0,$r1,0

1c0011e4 <cpu_sleep>:
cpu_sleep():
1c0011e4:	0400c435 	csrwr	$r21,0x31
1c0011e8:	15000055 	lu12i.w	$r21,-524286(0x80002)
1c0011ec:	29bff2ac 	st.w	$r12,$r21,-4(0xffc)
1c0011f0:	29bfe2ad 	st.w	$r13,$r21,-8(0xff8)
1c0011f4:	29bfd2ae 	st.w	$r14,$r21,-12(0xff4)
1c0011f8:	29bfc2af 	st.w	$r15,$r21,-16(0xff0)
1c0011fc:	29bfb2b0 	st.w	$r16,$r21,-20(0xfec)
1c001200:	29bfa2b1 	st.w	$r17,$r21,-24(0xfe8)
1c001204:	29bf92b2 	st.w	$r18,$r21,-28(0xfe4)
1c001208:	29bf82b3 	st.w	$r19,$r21,-32(0xfe0)
1c00120c:	29bf72b4 	st.w	$r20,$r21,-36(0xfdc)
1c001210:	29bf62b7 	st.w	$r23,$r21,-40(0xfd8)
1c001214:	29bf52b8 	st.w	$r24,$r21,-44(0xfd4)
1c001218:	29bf42b9 	st.w	$r25,$r21,-48(0xfd0)
1c00121c:	29bf32ba 	st.w	$r26,$r21,-52(0xfcc)
1c001220:	29bf22bb 	st.w	$r27,$r21,-56(0xfc8)
1c001224:	29bf12bc 	st.w	$r28,$r21,-60(0xfc4)
1c001228:	29bf02bd 	st.w	$r29,$r21,-64(0xfc0)
1c00122c:	29bef2be 	st.w	$r30,$r21,-68(0xfbc)
1c001230:	29bee2bf 	st.w	$r31,$r21,-72(0xfb8)
1c001234:	29bed2a4 	st.w	$r4,$r21,-76(0xfb4)
1c001238:	29bec2a5 	st.w	$r5,$r21,-80(0xfb0)
1c00123c:	29beb2a6 	st.w	$r6,$r21,-84(0xfac)
1c001240:	29bea2a7 	st.w	$r7,$r21,-88(0xfa8)
1c001244:	29be92a8 	st.w	$r8,$r21,-92(0xfa4)
1c001248:	29be82a9 	st.w	$r9,$r21,-96(0xfa0)
1c00124c:	29be72aa 	st.w	$r10,$r21,-100(0xf9c)
1c001250:	29be62ab 	st.w	$r11,$r21,-104(0xf98)
1c001254:	29be52a1 	st.w	$r1,$r21,-108(0xf94)
1c001258:	29be42a3 	st.w	$r3,$r21,-112(0xf90)
1c00125c:	29be32a2 	st.w	$r2,$r21,-116(0xf8c)
1c001260:	29be22b6 	st.w	$r22,$r21,-120(0xf88)
1c001264:	028002ac 	addi.w	$r12,$r21,0
1c001268:	0400c415 	csrrd	$r21,0x31
1c00126c:	29be1195 	st.w	$r21,$r12,-124(0xf84)
1c001270:	38720000 	dbar	0x0
1c001274:	157fd60d 	lu12i.w	$r13,-262480(0xbfeb0)
1c001278:	2880f1ac 	ld.w	$r12,$r13,60(0x3c)
1c00127c:	0340058c 	andi	$r12,$r12,0x1
1c001280:	43fff99f 	beqz	$r12,-8(0x7ffff8) # 1c001278 <cpu_sleep+0x94>
1c001284:	2980f1ac 	st.w	$r12,$r13,60(0x3c)
1c001288:	06488000 	idle	0x0

1c00128c <wakeup_reset>:
wakeup_reset():
1c00128c:	1cc80004 	pcaddu12i	$r4,409600(0x64000)
1c001290:	28baf084 	ld.w	$r4,$r4,-324(0xebc)
1c001294:	57ff13ff 	bl	-240(0xfffff10) # 1c0011a4 <outputstring>
1c001298:	15000055 	lu12i.w	$r21,-524286(0x80002)
1c00129c:	28bff2ac 	ld.w	$r12,$r21,-4(0xffc)
1c0012a0:	28bfe2ad 	ld.w	$r13,$r21,-8(0xff8)
1c0012a4:	28bfd2ae 	ld.w	$r14,$r21,-12(0xff4)
1c0012a8:	28bfc2af 	ld.w	$r15,$r21,-16(0xff0)
1c0012ac:	28bfb2b0 	ld.w	$r16,$r21,-20(0xfec)
1c0012b0:	28bfa2b1 	ld.w	$r17,$r21,-24(0xfe8)
1c0012b4:	28bf92b2 	ld.w	$r18,$r21,-28(0xfe4)
1c0012b8:	28bf82b3 	ld.w	$r19,$r21,-32(0xfe0)
1c0012bc:	28bf72b4 	ld.w	$r20,$r21,-36(0xfdc)
1c0012c0:	28bf62b7 	ld.w	$r23,$r21,-40(0xfd8)
1c0012c4:	28bf52b8 	ld.w	$r24,$r21,-44(0xfd4)
1c0012c8:	28bf42b9 	ld.w	$r25,$r21,-48(0xfd0)
1c0012cc:	28bf32ba 	ld.w	$r26,$r21,-52(0xfcc)
1c0012d0:	28bf22bb 	ld.w	$r27,$r21,-56(0xfc8)
1c0012d4:	28bf12bc 	ld.w	$r28,$r21,-60(0xfc4)
1c0012d8:	28bf02bd 	ld.w	$r29,$r21,-64(0xfc0)
1c0012dc:	28bef2be 	ld.w	$r30,$r21,-68(0xfbc)
1c0012e0:	28bee2bf 	ld.w	$r31,$r21,-72(0xfb8)
1c0012e4:	28bed2a4 	ld.w	$r4,$r21,-76(0xfb4)
1c0012e8:	28bec2a5 	ld.w	$r5,$r21,-80(0xfb0)
1c0012ec:	28beb2a6 	ld.w	$r6,$r21,-84(0xfac)
1c0012f0:	28bea2a7 	ld.w	$r7,$r21,-88(0xfa8)
1c0012f4:	28be92a8 	ld.w	$r8,$r21,-92(0xfa4)
1c0012f8:	28be82a9 	ld.w	$r9,$r21,-96(0xfa0)
1c0012fc:	28be72aa 	ld.w	$r10,$r21,-100(0xf9c)
1c001300:	28be62ab 	ld.w	$r11,$r21,-104(0xf98)
1c001304:	28be52a1 	ld.w	$r1,$r21,-108(0xf94)
1c001308:	28be42a3 	ld.w	$r3,$r21,-112(0xf90)
1c00130c:	28be32a2 	ld.w	$r2,$r21,-116(0xf8c)
1c001310:	28be22b6 	ld.w	$r22,$r21,-120(0xf88)
1c001314:	28be12b5 	ld.w	$r21,$r21,-124(0xf84)
1c001318:	0400c42c 	csrwr	$r12,0x31
1c00131c:	0380100c 	ori	$r12,$r0,0x4
1c001320:	0400018c 	csrxchg	$r12,$r12,0x0
1c001324:	0400c40c 	csrrd	$r12,0x31
1c001328:	4c000020 	jirl	$r0,$r1,0

1c00132c <AFIO_RemapConfig>:
AFIO_RemapConfig():
1c00132c:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c001330:	2980b076 	st.w	$r22,$r3,44(0x2c)
1c001334:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c001338:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c00133c:	001500ac 	move	$r12,$r5
1c001340:	29bf52c6 	st.w	$r6,$r22,-44(0xfd4)
1c001344:	297f6acc 	st.h	$r12,$r22,-38(0xfda)
1c001348:	29bf92c0 	st.w	$r0,$r22,-28(0xfe4)
1c00134c:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c001350:	29bf82c0 	st.w	$r0,$r22,-32(0xfe0)
1c001354:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001358:	2880018c 	ld.w	$r12,$r12,0
1c00135c:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001360:	293faec0 	st.b	$r0,$r22,-21(0xfeb)
1c001364:	50006c00 	b	108(0x6c) # 1c0013d0 <AFIO_RemapConfig+0xa4>
1c001368:	2a7f6acd 	ld.hu	$r13,$r22,-38(0xfda)
1c00136c:	2a3faecc 	ld.bu	$r12,$r22,-21(0xfeb)
1c001370:	001831ac 	sra.w	$r12,$r13,$r12
1c001374:	0340058c 	andi	$r12,$r12,0x1
1c001378:	40004d80 	beqz	$r12,76(0x4c) # 1c0013c4 <AFIO_RemapConfig+0x98>
1c00137c:	2a3faecc 	ld.bu	$r12,$r22,-21(0xfeb)
1c001380:	0040858c 	slli.w	$r12,$r12,0x1
1c001384:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c001388:	02800c0d 	addi.w	$r13,$r0,3(0x3)
1c00138c:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c001390:	001731ac 	sll.w	$r12,$r13,$r12
1c001394:	29bf82cc 	st.w	$r12,$r22,-32(0xfe0)
1c001398:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c00139c:	0014300c 	nor	$r12,$r0,$r12
1c0013a0:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c0013a4:	0014b1ac 	and	$r12,$r13,$r12
1c0013a8:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0013ac:	28bf52cd 	ld.w	$r13,$r22,-44(0xfd4)
1c0013b0:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c0013b4:	001731ac 	sll.w	$r12,$r13,$r12
1c0013b8:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c0013bc:	001531ac 	or	$r12,$r13,$r12
1c0013c0:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0013c4:	2a3faecc 	ld.bu	$r12,$r22,-21(0xfeb)
1c0013c8:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0013cc:	293faecc 	st.b	$r12,$r22,-21(0xfeb)
1c0013d0:	2a3faecd 	ld.bu	$r13,$r22,-21(0xfeb)
1c0013d4:	02803c0c 	addi.w	$r12,$r0,15(0xf)
1c0013d8:	6fff918d 	bgeu	$r12,$r13,-112(0x3ff90) # 1c001368 <AFIO_RemapConfig+0x3c>
1c0013dc:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0013e0:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c0013e4:	2980018d 	st.w	$r13,$r12,0
1c0013e8:	03400000 	andi	$r0,$r0,0x0
1c0013ec:	2880b076 	ld.w	$r22,$r3,44(0x2c)
1c0013f0:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c0013f4:	4c000020 	jirl	$r0,$r1,0

1c0013f8 <Spi_Write_Read_1to4>:
Spi_Write_Read_1to4():
1c0013f8:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c0013fc:	2980b076 	st.w	$r22,$r3,44(0x2c)
1c001400:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c001404:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c001408:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c00140c:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c001410:	50002800 	b	40(0x28) # 1c001438 <Spi_Write_Read_1to4+0x40>
1c001414:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c001418:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00141c:	001031ad 	add.w	$r13,$r13,$r12
1c001420:	157fce0c 	lu12i.w	$r12,-262544(0xbfe70)
1c001424:	2a0001ad 	ld.bu	$r13,$r13,0
1c001428:	2900098d 	st.b	$r13,$r12,2(0x2)
1c00142c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001430:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001434:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001438:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c00143c:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c001440:	6bffd5ac 	bltu	$r13,$r12,-44(0x3ffd4) # 1c001414 <Spi_Write_Read_1to4+0x1c>
1c001444:	03400000 	andi	$r0,$r0,0x0
1c001448:	157fce0c 	lu12i.w	$r12,-262544(0xbfe70)
1c00144c:	2a00058c 	ld.bu	$r12,$r12,1(0x1)
1c001450:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001454:	0340118c 	andi	$r12,$r12,0x4
1c001458:	43fff19f 	beqz	$r12,-16(0x7ffff0) # 1c001448 <Spi_Write_Read_1to4+0x50>
1c00145c:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c001460:	50002c00 	b	44(0x2c) # 1c00148c <Spi_Write_Read_1to4+0x94>
1c001464:	157fce0d 	lu12i.w	$r13,-262544(0xbfe70)
1c001468:	28bf72ce 	ld.w	$r14,$r22,-36(0xfdc)
1c00146c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001470:	001031cc 	add.w	$r12,$r14,$r12
1c001474:	2a0009ad 	ld.bu	$r13,$r13,2(0x2)
1c001478:	006781ad 	bstrpick.w	$r13,$r13,0x7,0x0
1c00147c:	2900018d 	st.b	$r13,$r12,0
1c001480:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001484:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001488:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c00148c:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c001490:	02bffd8c 	addi.w	$r12,$r12,-1(0xfff)
1c001494:	0015018d 	move	$r13,$r12
1c001498:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00149c:	6bffc98d 	bltu	$r12,$r13,-56(0x3ffc8) # 1c001464 <Spi_Write_Read_1to4+0x6c>
1c0014a0:	03400000 	andi	$r0,$r0,0x0
1c0014a4:	157fce0c 	lu12i.w	$r12,-262544(0xbfe70)
1c0014a8:	2a00058c 	ld.bu	$r12,$r12,1(0x1)
1c0014ac:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0014b0:	0340058c 	andi	$r12,$r12,0x1
1c0014b4:	47fff19f 	bnez	$r12,-16(0x7ffff0) # 1c0014a4 <Spi_Write_Read_1to4+0xac>
1c0014b8:	157fce0d 	lu12i.w	$r13,-262544(0xbfe70)
1c0014bc:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c0014c0:	02bffd8c 	addi.w	$r12,$r12,-1(0xfff)
1c0014c4:	28bf72ce 	ld.w	$r14,$r22,-36(0xfdc)
1c0014c8:	001031cc 	add.w	$r12,$r14,$r12
1c0014cc:	2a0009ad 	ld.bu	$r13,$r13,2(0x2)
1c0014d0:	006781ad 	bstrpick.w	$r13,$r13,0x7,0x0
1c0014d4:	2900018d 	st.b	$r13,$r12,0
1c0014d8:	03400000 	andi	$r0,$r0,0x0
1c0014dc:	2880b076 	ld.w	$r22,$r3,44(0x2c)
1c0014e0:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c0014e4:	4c000020 	jirl	$r0,$r1,0

1c0014e8 <Spi_Write_Read_N>:
Spi_Write_Read_N():
1c0014e8:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c0014ec:	2980b076 	st.w	$r22,$r3,44(0x2c)
1c0014f0:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c0014f4:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c0014f8:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c0014fc:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c001500:	50002800 	b	40(0x28) # 1c001528 <Spi_Write_Read_N+0x40>
1c001504:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c001508:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00150c:	001031ad 	add.w	$r13,$r13,$r12
1c001510:	157fce0c 	lu12i.w	$r12,-262544(0xbfe70)
1c001514:	2a0001ad 	ld.bu	$r13,$r13,0
1c001518:	2900098d 	st.b	$r13,$r12,2(0x2)
1c00151c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001520:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001524:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001528:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c00152c:	02800c0c 	addi.w	$r12,$r0,3(0x3)
1c001530:	6fffd58d 	bgeu	$r12,$r13,-44(0x3ffd4) # 1c001504 <Spi_Write_Read_N+0x1c>
1c001534:	29bfa2c0 	st.w	$r0,$r22,-24(0xfe8)
1c001538:	50006800 	b	104(0x68) # 1c0015a0 <Spi_Write_Read_N+0xb8>
1c00153c:	03400000 	andi	$r0,$r0,0x0
1c001540:	157fce0c 	lu12i.w	$r12,-262544(0xbfe70)
1c001544:	2a00058c 	ld.bu	$r12,$r12,1(0x1)
1c001548:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c00154c:	0340058c 	andi	$r12,$r12,0x1
1c001550:	47fff19f 	bnez	$r12,-16(0x7ffff0) # 1c001540 <Spi_Write_Read_N+0x58>
1c001554:	157fce0d 	lu12i.w	$r13,-262544(0xbfe70)
1c001558:	28bf72ce 	ld.w	$r14,$r22,-36(0xfdc)
1c00155c:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001560:	001031cc 	add.w	$r12,$r14,$r12
1c001564:	2a0009ad 	ld.bu	$r13,$r13,2(0x2)
1c001568:	006781ad 	bstrpick.w	$r13,$r13,0x7,0x0
1c00156c:	2900018d 	st.b	$r13,$r12,0
1c001570:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c001574:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001578:	001031ad 	add.w	$r13,$r13,$r12
1c00157c:	157fce0c 	lu12i.w	$r12,-262544(0xbfe70)
1c001580:	2a0001ad 	ld.bu	$r13,$r13,0
1c001584:	2900098d 	st.b	$r13,$r12,2(0x2)
1c001588:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00158c:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001590:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001594:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001598:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c00159c:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0015a0:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c0015a4:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c0015a8:	6bff95ac 	bltu	$r13,$r12,-108(0x3ff94) # 1c00153c <Spi_Write_Read_N+0x54>
1c0015ac:	50004400 	b	68(0x44) # 1c0015f0 <Spi_Write_Read_N+0x108>
1c0015b0:	03400000 	andi	$r0,$r0,0x0
1c0015b4:	157fce0c 	lu12i.w	$r12,-262544(0xbfe70)
1c0015b8:	2a00058c 	ld.bu	$r12,$r12,1(0x1)
1c0015bc:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0015c0:	0340058c 	andi	$r12,$r12,0x1
1c0015c4:	47fff19f 	bnez	$r12,-16(0x7ffff0) # 1c0015b4 <Spi_Write_Read_N+0xcc>
1c0015c8:	157fce0d 	lu12i.w	$r13,-262544(0xbfe70)
1c0015cc:	28bf72ce 	ld.w	$r14,$r22,-36(0xfdc)
1c0015d0:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0015d4:	001031cc 	add.w	$r12,$r14,$r12
1c0015d8:	2a0009ad 	ld.bu	$r13,$r13,2(0x2)
1c0015dc:	006781ad 	bstrpick.w	$r13,$r13,0x7,0x0
1c0015e0:	2900018d 	st.b	$r13,$r12,0
1c0015e4:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0015e8:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0015ec:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0015f0:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c0015f4:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c0015f8:	6bffb9ac 	bltu	$r13,$r12,-72(0x3ffb8) # 1c0015b0 <Spi_Write_Read_N+0xc8>
1c0015fc:	03400000 	andi	$r0,$r0,0x0
1c001600:	2880b076 	ld.w	$r22,$r3,44(0x2c)
1c001604:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c001608:	4c000020 	jirl	$r0,$r1,0

1c00160c <Spi_Cs_Down>:
Spi_Cs_Down():
1c00160c:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c001610:	29803076 	st.w	$r22,$r3,12(0xc)
1c001614:	02804076 	addi.w	$r22,$r3,16(0x10)
1c001618:	157fce0c 	lu12i.w	$r12,-262544(0xbfe70)
1c00161c:	2a00158c 	ld.bu	$r12,$r12,5(0x5)
1c001620:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c001624:	157fce0c 	lu12i.w	$r12,-262544(0xbfe70)
1c001628:	038005ad 	ori	$r13,$r13,0x1
1c00162c:	006781ad 	bstrpick.w	$r13,$r13,0x7,0x0
1c001630:	2900158d 	st.b	$r13,$r12,5(0x5)
1c001634:	157fce0c 	lu12i.w	$r12,-262544(0xbfe70)
1c001638:	2a00158c 	ld.bu	$r12,$r12,5(0x5)
1c00163c:	0067818e 	bstrpick.w	$r14,$r12,0x7,0x0
1c001640:	157fce0c 	lu12i.w	$r12,-262544(0xbfe70)
1c001644:	02bfbc0d 	addi.w	$r13,$r0,-17(0xfef)
1c001648:	0014b5cd 	and	$r13,$r14,$r13
1c00164c:	006781ad 	bstrpick.w	$r13,$r13,0x7,0x0
1c001650:	2900158d 	st.b	$r13,$r12,5(0x5)
1c001654:	03400000 	andi	$r0,$r0,0x0
1c001658:	28803076 	ld.w	$r22,$r3,12(0xc)
1c00165c:	02804063 	addi.w	$r3,$r3,16(0x10)
1c001660:	4c000020 	jirl	$r0,$r1,0

1c001664 <Spi_Cs_Up>:
Spi_Cs_Up():
1c001664:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c001668:	29803076 	st.w	$r22,$r3,12(0xc)
1c00166c:	02804076 	addi.w	$r22,$r3,16(0x10)
1c001670:	157fce0c 	lu12i.w	$r12,-262544(0xbfe70)
1c001674:	2a00158c 	ld.bu	$r12,$r12,5(0x5)
1c001678:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c00167c:	157fce0c 	lu12i.w	$r12,-262544(0xbfe70)
1c001680:	038005ad 	ori	$r13,$r13,0x1
1c001684:	006781ad 	bstrpick.w	$r13,$r13,0x7,0x0
1c001688:	2900158d 	st.b	$r13,$r12,5(0x5)
1c00168c:	157fce0c 	lu12i.w	$r12,-262544(0xbfe70)
1c001690:	2a00158c 	ld.bu	$r12,$r12,5(0x5)
1c001694:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c001698:	157fce0c 	lu12i.w	$r12,-262544(0xbfe70)
1c00169c:	038041ad 	ori	$r13,$r13,0x10
1c0016a0:	006781ad 	bstrpick.w	$r13,$r13,0x7,0x0
1c0016a4:	2900158d 	st.b	$r13,$r12,5(0x5)
1c0016a8:	03400000 	andi	$r0,$r0,0x0
1c0016ac:	28803076 	ld.w	$r22,$r3,12(0xc)
1c0016b0:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0016b4:	4c000020 	jirl	$r0,$r1,0

1c0016b8 <Spiflash_Rdsr>:
Spiflash_Rdsr():
1c0016b8:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0016bc:	29807061 	st.w	$r1,$r3,28(0x1c)
1c0016c0:	29806076 	st.w	$r22,$r3,24(0x18)
1c0016c4:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0016c8:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c0016cc:	0280140c 	addi.w	$r12,$r0,5(0x5)
1c0016d0:	293fb2cc 	st.b	$r12,$r22,-20(0xfec)
1c0016d4:	57ff3bff 	bl	-200(0xfffff38) # 1c00160c <Spi_Cs_Down>
1c0016d8:	02bfb2cc 	addi.w	$r12,$r22,-20(0xfec)
1c0016dc:	02800805 	addi.w	$r5,$r0,2(0x2)
1c0016e0:	00150184 	move	$r4,$r12
1c0016e4:	57fd17ff 	bl	-748(0xffffd14) # 1c0013f8 <Spi_Write_Read_1to4>
1c0016e8:	57ff7fff 	bl	-132(0xfffff7c) # 1c001664 <Spi_Cs_Up>
1c0016ec:	2a3fb6cc 	ld.bu	$r12,$r22,-19(0xfed)
1c0016f0:	00150184 	move	$r4,$r12
1c0016f4:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c0016f8:	28806076 	ld.w	$r22,$r3,24(0x18)
1c0016fc:	02808063 	addi.w	$r3,$r3,32(0x20)
1c001700:	4c000020 	jirl	$r0,$r1,0

1c001704 <Spiflash_Wait_Wip_Zero>:
Spiflash_Wait_Wip_Zero():
1c001704:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c001708:	29803061 	st.w	$r1,$r3,12(0xc)
1c00170c:	29802076 	st.w	$r22,$r3,8(0x8)
1c001710:	02804076 	addi.w	$r22,$r3,16(0x10)
1c001714:	03400000 	andi	$r0,$r0,0x0
1c001718:	57ffa3ff 	bl	-96(0xfffffa0) # 1c0016b8 <Spiflash_Rdsr>
1c00171c:	0015008c 	move	$r12,$r4
1c001720:	0340058c 	andi	$r12,$r12,0x1
1c001724:	47fff59f 	bnez	$r12,-12(0x7ffff4) # 1c001718 <Spiflash_Wait_Wip_Zero+0x14>
1c001728:	03400000 	andi	$r0,$r0,0x0
1c00172c:	28803061 	ld.w	$r1,$r3,12(0xc)
1c001730:	28802076 	ld.w	$r22,$r3,8(0x8)
1c001734:	02804063 	addi.w	$r3,$r3,16(0x10)
1c001738:	4c000020 	jirl	$r0,$r1,0

1c00173c <Spiflash_Wren>:
Spiflash_Wren():
1c00173c:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c001740:	29807061 	st.w	$r1,$r3,28(0x1c)
1c001744:	29806076 	st.w	$r22,$r3,24(0x18)
1c001748:	02808076 	addi.w	$r22,$r3,32(0x20)
1c00174c:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c001750:	0280180c 	addi.w	$r12,$r0,6(0x6)
1c001754:	293fb2cc 	st.b	$r12,$r22,-20(0xfec)
1c001758:	57ffafff 	bl	-84(0xfffffac) # 1c001704 <Spiflash_Wait_Wip_Zero>
1c00175c:	57feb3ff 	bl	-336(0xffffeb0) # 1c00160c <Spi_Cs_Down>
1c001760:	02bfb2cc 	addi.w	$r12,$r22,-20(0xfec)
1c001764:	02800405 	addi.w	$r5,$r0,1(0x1)
1c001768:	00150184 	move	$r4,$r12
1c00176c:	57fc8fff 	bl	-884(0xffffc8c) # 1c0013f8 <Spi_Write_Read_1to4>
1c001770:	57fef7ff 	bl	-268(0xffffef4) # 1c001664 <Spi_Cs_Up>
1c001774:	03400000 	andi	$r0,$r0,0x0
1c001778:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c00177c:	28806076 	ld.w	$r22,$r3,24(0x18)
1c001780:	02808063 	addi.w	$r3,$r3,32(0x20)
1c001784:	4c000020 	jirl	$r0,$r1,0

1c001788 <Spiflash_Rdid>:
Spiflash_Rdid():
1c001788:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c00178c:	29807061 	st.w	$r1,$r3,28(0x1c)
1c001790:	29806076 	st.w	$r22,$r3,24(0x18)
1c001794:	02808076 	addi.w	$r22,$r3,32(0x20)
1c001798:	02be400c 	addi.w	$r12,$r0,-112(0xf90)
1c00179c:	293fb2cc 	st.b	$r12,$r22,-20(0xfec)
1c0017a0:	293fb6c0 	st.b	$r0,$r22,-19(0xfed)
1c0017a4:	293fbac0 	st.b	$r0,$r22,-18(0xfee)
1c0017a8:	293fbec0 	st.b	$r0,$r22,-17(0xfef)
1c0017ac:	57fe63ff 	bl	-416(0xffffe60) # 1c00160c <Spi_Cs_Down>
1c0017b0:	02bfb2cc 	addi.w	$r12,$r22,-20(0xfec)
1c0017b4:	02801005 	addi.w	$r5,$r0,4(0x4)
1c0017b8:	00150184 	move	$r4,$r12
1c0017bc:	57fc3fff 	bl	-964(0xffffc3c) # 1c0013f8 <Spi_Write_Read_1to4>
1c0017c0:	02bfb2cc 	addi.w	$r12,$r22,-20(0xfec)
1c0017c4:	02800805 	addi.w	$r5,$r0,2(0x2)
1c0017c8:	00150184 	move	$r4,$r12
1c0017cc:	57fc2fff 	bl	-980(0xffffc2c) # 1c0013f8 <Spi_Write_Read_1to4>
1c0017d0:	57fe97ff 	bl	-364(0xffffe94) # 1c001664 <Spi_Cs_Up>
1c0017d4:	02bfb2cc 	addi.w	$r12,$r22,-20(0xfec)
1c0017d8:	2a40018c 	ld.hu	$r12,$r12,0
1c0017dc:	00150184 	move	$r4,$r12
1c0017e0:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c0017e4:	28806076 	ld.w	$r22,$r3,24(0x18)
1c0017e8:	02808063 	addi.w	$r3,$r3,32(0x20)
1c0017ec:	4c000020 	jirl	$r0,$r1,0

1c0017f0 <Spiflash_Block64k_Erase>:
Spiflash_Block64k_Erase():
1c0017f0:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c0017f4:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c0017f8:	2980a076 	st.w	$r22,$r3,40(0x28)
1c0017fc:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c001800:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c001804:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c001808:	02bf600c 	addi.w	$r12,$r0,-40(0xfd8)
1c00180c:	293fb2cc 	st.b	$r12,$r22,-20(0xfec)
1c001810:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001814:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001818:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c00181c:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001820:	0044a18c 	srli.w	$r12,$r12,0x8
1c001824:	29bf72cc 	st.w	$r12,$r22,-36(0xfdc)
1c001828:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c00182c:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001830:	293fbacc 	st.b	$r12,$r22,-18(0xfee)
1c001834:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001838:	0044a18c 	srli.w	$r12,$r12,0x8
1c00183c:	29bf72cc 	st.w	$r12,$r22,-36(0xfdc)
1c001840:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001844:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001848:	293fb6cc 	st.b	$r12,$r22,-19(0xfed)
1c00184c:	57fef3ff 	bl	-272(0xffffef0) # 1c00173c <Spiflash_Wren>
1c001850:	57fdbfff 	bl	-580(0xffffdbc) # 1c00160c <Spi_Cs_Down>
1c001854:	02bfb2cc 	addi.w	$r12,$r22,-20(0xfec)
1c001858:	02801005 	addi.w	$r5,$r0,4(0x4)
1c00185c:	00150184 	move	$r4,$r12
1c001860:	57fb9bff 	bl	-1128(0xffffb98) # 1c0013f8 <Spi_Write_Read_1to4>
1c001864:	57fe03ff 	bl	-512(0xffffe00) # 1c001664 <Spi_Cs_Up>
1c001868:	57fe9fff 	bl	-356(0xffffe9c) # 1c001704 <Spiflash_Wait_Wip_Zero>
1c00186c:	03400000 	andi	$r0,$r0,0x0
1c001870:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c001874:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c001878:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c00187c:	4c000020 	jirl	$r0,$r1,0

1c001880 <Spiflash_Page_Program>:
Spiflash_Page_Program():
1c001880:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c001884:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c001888:	2980a076 	st.w	$r22,$r3,40(0x28)
1c00188c:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c001890:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c001894:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c001898:	29bf52c6 	st.w	$r6,$r22,-44(0xfd4)
1c00189c:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c0018a0:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c0018a4:	293fb2cc 	st.b	$r12,$r22,-20(0xfec)
1c0018a8:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0018ac:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0018b0:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c0018b4:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0018b8:	0044a18c 	srli.w	$r12,$r12,0x8
1c0018bc:	29bf72cc 	st.w	$r12,$r22,-36(0xfdc)
1c0018c0:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0018c4:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0018c8:	293fbacc 	st.b	$r12,$r22,-18(0xfee)
1c0018cc:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0018d0:	0044a18c 	srli.w	$r12,$r12,0x8
1c0018d4:	29bf72cc 	st.w	$r12,$r22,-36(0xfdc)
1c0018d8:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0018dc:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0018e0:	293fb6cc 	st.b	$r12,$r22,-19(0xfed)
1c0018e4:	57fe5bff 	bl	-424(0xffffe58) # 1c00173c <Spiflash_Wren>
1c0018e8:	57fd27ff 	bl	-732(0xffffd24) # 1c00160c <Spi_Cs_Down>
1c0018ec:	02bfb2cc 	addi.w	$r12,$r22,-20(0xfec)
1c0018f0:	02801005 	addi.w	$r5,$r0,4(0x4)
1c0018f4:	00150184 	move	$r4,$r12
1c0018f8:	57fb03ff 	bl	-1280(0xffffb00) # 1c0013f8 <Spi_Write_Read_1to4>
1c0018fc:	28bf52c5 	ld.w	$r5,$r22,-44(0xfd4)
1c001900:	28bf62c4 	ld.w	$r4,$r22,-40(0xfd8)
1c001904:	57fbe7ff 	bl	-1052(0xffffbe4) # 1c0014e8 <Spi_Write_Read_N>
1c001908:	57fd5fff 	bl	-676(0xffffd5c) # 1c001664 <Spi_Cs_Up>
1c00190c:	57fdfbff 	bl	-520(0xffffdf8) # 1c001704 <Spiflash_Wait_Wip_Zero>
1c001910:	03400000 	andi	$r0,$r0,0x0
1c001914:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c001918:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c00191c:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c001920:	4c000020 	jirl	$r0,$r1,0

1c001924 <Spiflash_Read_Bytes>:
Spiflash_Read_Bytes():
1c001924:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c001928:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c00192c:	2980a076 	st.w	$r22,$r3,40(0x28)
1c001930:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c001934:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c001938:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c00193c:	29bf52c6 	st.w	$r6,$r22,-44(0xfd4)
1c001940:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c001944:	02800c0c 	addi.w	$r12,$r0,3(0x3)
1c001948:	293fb2cc 	st.b	$r12,$r22,-20(0xfec)
1c00194c:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001950:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001954:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c001958:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c00195c:	0044a18c 	srli.w	$r12,$r12,0x8
1c001960:	29bf72cc 	st.w	$r12,$r22,-36(0xfdc)
1c001964:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001968:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c00196c:	293fbacc 	st.b	$r12,$r22,-18(0xfee)
1c001970:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001974:	0044a18c 	srli.w	$r12,$r12,0x8
1c001978:	29bf72cc 	st.w	$r12,$r22,-36(0xfdc)
1c00197c:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001980:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001984:	293fb6cc 	st.b	$r12,$r22,-19(0xfed)
1c001988:	57fc87ff 	bl	-892(0xffffc84) # 1c00160c <Spi_Cs_Down>
1c00198c:	02bfb2cc 	addi.w	$r12,$r22,-20(0xfec)
1c001990:	02801005 	addi.w	$r5,$r0,4(0x4)
1c001994:	00150184 	move	$r4,$r12
1c001998:	57fa63ff 	bl	-1440(0xffffa60) # 1c0013f8 <Spi_Write_Read_1to4>
1c00199c:	28bf52c5 	ld.w	$r5,$r22,-44(0xfd4)
1c0019a0:	28bf62c4 	ld.w	$r4,$r22,-40(0xfd8)
1c0019a4:	57fb47ff 	bl	-1212(0xffffb44) # 1c0014e8 <Spi_Write_Read_N>
1c0019a8:	57fcbfff 	bl	-836(0xffffcbc) # 1c001664 <Spi_Cs_Up>
1c0019ac:	03400000 	andi	$r0,$r0,0x0
1c0019b0:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c0019b4:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c0019b8:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c0019bc:	4c000020 	jirl	$r0,$r1,0

1c0019c0 <myputchar>:
myputchar():
1c0019c0:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0019c4:	29807061 	st.w	$r1,$r3,28(0x1c)
1c0019c8:	29806076 	st.w	$r22,$r3,24(0x18)
1c0019cc:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0019d0:	0015008c 	move	$r12,$r4
1c0019d4:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c0019d8:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c0019dc:	00150185 	move	$r5,$r12
1c0019e0:	157fd004 	lu12i.w	$r4,-262528(0xbfe80)
1c0019e4:	54063c00 	bl	1596(0x63c) # 1c002020 <UART_SendData>
1c0019e8:	03400000 	andi	$r0,$r0,0x0
1c0019ec:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c0019f0:	28806076 	ld.w	$r22,$r3,24(0x18)
1c0019f4:	02808063 	addi.w	$r3,$r3,32(0x20)
1c0019f8:	4c000020 	jirl	$r0,$r1,0

1c0019fc <printbase>:
printbase():
1c0019fc:	02be4063 	addi.w	$r3,$r3,-112(0xf90)
1c001a00:	2981b061 	st.w	$r1,$r3,108(0x6c)
1c001a04:	2981a076 	st.w	$r22,$r3,104(0x68)
1c001a08:	0281c076 	addi.w	$r22,$r3,112(0x70)
1c001a0c:	29be72c4 	st.w	$r4,$r22,-100(0xf9c)
1c001a10:	29be62c5 	st.w	$r5,$r22,-104(0xf98)
1c001a14:	29be52c6 	st.w	$r6,$r22,-108(0xf94)
1c001a18:	29be42c7 	st.w	$r7,$r22,-112(0xf90)
1c001a1c:	28be42cc 	ld.w	$r12,$r22,-112(0xf90)
1c001a20:	40002580 	beqz	$r12,36(0x24) # 1c001a44 <printbase+0x48>
1c001a24:	28be72cc 	ld.w	$r12,$r22,-100(0xf9c)
1c001a28:	64001d80 	bge	$r12,$r0,28(0x1c) # 1c001a44 <printbase+0x48>
1c001a2c:	28be72cc 	ld.w	$r12,$r22,-100(0xf9c)
1c001a30:	0011300c 	sub.w	$r12,$r0,$r12
1c001a34:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c001a38:	0280b404 	addi.w	$r4,$r0,45(0x2d)
1c001a3c:	57ff87ff 	bl	-124(0xfffff84) # 1c0019c0 <myputchar>
1c001a40:	50000c00 	b	12(0xc) # 1c001a4c <printbase+0x50>
1c001a44:	28be72cc 	ld.w	$r12,$r22,-100(0xf9c)
1c001a48:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c001a4c:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c001a50:	50005000 	b	80(0x50) # 1c001aa0 <printbase+0xa4>
1c001a54:	28be52cc 	ld.w	$r12,$r22,-108(0xf94)
1c001a58:	28bf92cd 	ld.w	$r13,$r22,-28(0xfe4)
1c001a5c:	0021b1ae 	mod.wu	$r14,$r13,$r12
1c001a60:	5c000980 	bne	$r12,$r0,8(0x8) # 1c001a68 <printbase+0x6c>
1c001a64:	002a0007 	break	0x7
1c001a68:	00005dcc 	ext.w.b	$r12,$r14
1c001a6c:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c001a70:	02bfc2ce 	addi.w	$r14,$r22,-16(0xff0)
1c001a74:	001035cd 	add.w	$r13,$r14,$r13
1c001a78:	293ec1ac 	st.b	$r12,$r13,-80(0xfb0)
1c001a7c:	28be52cd 	ld.w	$r13,$r22,-108(0xf94)
1c001a80:	28bf92ce 	ld.w	$r14,$r22,-28(0xfe4)
1c001a84:	002135cc 	div.wu	$r12,$r14,$r13
1c001a88:	5c0009a0 	bne	$r13,$r0,8(0x8) # 1c001a90 <printbase+0x94>
1c001a8c:	002a0007 	break	0x7
1c001a90:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c001a94:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001a98:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001a9c:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001aa0:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c001aa4:	47ffb19f 	bnez	$r12,-80(0x7fffb0) # 1c001a54 <printbase+0x58>
1c001aa8:	28be62cc 	ld.w	$r12,$r22,-104(0xf98)
1c001aac:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c001ab0:	28bfb2ce 	ld.w	$r14,$r22,-20(0xfec)
1c001ab4:	001231ad 	slt	$r13,$r13,$r12
1c001ab8:	0013b5ce 	masknez	$r14,$r14,$r13
1c001abc:	0013358c 	maskeqz	$r12,$r12,$r13
1c001ac0:	001531cc 	or	$r12,$r14,$r12
1c001ac4:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c001ac8:	50007400 	b	116(0x74) # 1c001b3c <printbase+0x140>
1c001acc:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c001ad0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001ad4:	60001d8d 	blt	$r12,$r13,28(0x1c) # 1c001af0 <printbase+0xf4>
1c001ad8:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001adc:	02bffd8c 	addi.w	$r12,$r12,-1(0xfff)
1c001ae0:	02bfc2cd 	addi.w	$r13,$r22,-16(0xff0)
1c001ae4:	001031ac 	add.w	$r12,$r13,$r12
1c001ae8:	283ec18c 	ld.b	$r12,$r12,-80(0xfb0)
1c001aec:	50000800 	b	8(0x8) # 1c001af4 <printbase+0xf8>
1c001af0:	0015000c 	move	$r12,$r0
1c001af4:	29bf82cc 	st.w	$r12,$r22,-32(0xfe0)
1c001af8:	28bf82cd 	ld.w	$r13,$r22,-32(0xfe0)
1c001afc:	0280240c 	addi.w	$r12,$r0,9(0x9)
1c001b00:	6000198d 	blt	$r12,$r13,24(0x18) # 1c001b18 <printbase+0x11c>
1c001b04:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c001b08:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001b0c:	0280c18c 	addi.w	$r12,$r12,48(0x30)
1c001b10:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001b14:	50001400 	b	20(0x14) # 1c001b28 <printbase+0x12c>
1c001b18:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c001b1c:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001b20:	02815d8c 	addi.w	$r12,$r12,87(0x57)
1c001b24:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001b28:	00150184 	move	$r4,$r12
1c001b2c:	57fe97ff 	bl	-364(0xffffe94) # 1c0019c0 <myputchar>
1c001b30:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001b34:	02bffd8c 	addi.w	$r12,$r12,-1(0xfff)
1c001b38:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c001b3c:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001b40:	63ff8c0c 	blt	$r0,$r12,-116(0x3ff8c) # 1c001acc <printbase+0xd0>
1c001b44:	0015000c 	move	$r12,$r0
1c001b48:	00150184 	move	$r4,$r12
1c001b4c:	2881b061 	ld.w	$r1,$r3,108(0x6c)
1c001b50:	2881a076 	ld.w	$r22,$r3,104(0x68)
1c001b54:	0281c063 	addi.w	$r3,$r3,112(0x70)
1c001b58:	4c000020 	jirl	$r0,$r1,0

1c001b5c <ls1x_puts>:
ls1x_puts():
1c001b5c:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c001b60:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c001b64:	2980a076 	st.w	$r22,$r3,40(0x28)
1c001b68:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c001b6c:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c001b70:	50003000 	b	48(0x30) # 1c001ba0 <ls1x_puts+0x44>
1c001b74:	283fbecd 	ld.b	$r13,$r22,-17(0xfef)
1c001b78:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c001b7c:	5c000dac 	bne	$r13,$r12,12(0xc) # 1c001b88 <ls1x_puts+0x2c>
1c001b80:	02803404 	addi.w	$r4,$r0,13(0xd)
1c001b84:	57fe3fff 	bl	-452(0xffffe3c) # 1c0019c0 <myputchar>
1c001b88:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c001b8c:	00150184 	move	$r4,$r12
1c001b90:	57fe33ff 	bl	-464(0xffffe30) # 1c0019c0 <myputchar>
1c001b94:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001b98:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001b9c:	29bf72cc 	st.w	$r12,$r22,-36(0xfdc)
1c001ba0:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001ba4:	2a00018c 	ld.bu	$r12,$r12,0
1c001ba8:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c001bac:	283fbecc 	ld.b	$r12,$r22,-17(0xfef)
1c001bb0:	47ffc59f 	bnez	$r12,-60(0x7fffc4) # 1c001b74 <ls1x_puts+0x18>
1c001bb4:	0015000c 	move	$r12,$r0
1c001bb8:	00150184 	move	$r4,$r12
1c001bbc:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c001bc0:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c001bc4:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c001bc8:	4c000020 	jirl	$r0,$r1,0

1c001bcc <myprintf>:
myprintf():
1c001bcc:	02be8063 	addi.w	$r3,$r3,-96(0xfa0)
1c001bd0:	2980f061 	st.w	$r1,$r3,60(0x3c)
1c001bd4:	2980e076 	st.w	$r22,$r3,56(0x38)
1c001bd8:	02810076 	addi.w	$r22,$r3,64(0x40)
1c001bdc:	29bf32c4 	st.w	$r4,$r22,-52(0xfcc)
1c001be0:	298012c5 	st.w	$r5,$r22,4(0x4)
1c001be4:	298022c6 	st.w	$r6,$r22,8(0x8)
1c001be8:	298032c7 	st.w	$r7,$r22,12(0xc)
1c001bec:	298042c8 	st.w	$r8,$r22,16(0x10)
1c001bf0:	298052c9 	st.w	$r9,$r22,20(0x14)
1c001bf4:	298062ca 	st.w	$r10,$r22,24(0x18)
1c001bf8:	298072cb 	st.w	$r11,$r22,28(0x1c)
1c001bfc:	028082cc 	addi.w	$r12,$r22,32(0x20)
1c001c00:	02bf918c 	addi.w	$r12,$r12,-28(0xfe4)
1c001c04:	29bf72cc 	st.w	$r12,$r22,-36(0xfdc)
1c001c08:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001c0c:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c001c10:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c001c14:	50033000 	b	816(0x330) # 1c001f44 <myprintf+0x378>
1c001c18:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001c1c:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c001c20:	001031ac 	add.w	$r12,$r13,$r12
1c001c24:	2a00018c 	ld.bu	$r12,$r12,0
1c001c28:	293f8ecc 	st.b	$r12,$r22,-29(0xfe3)
1c001c2c:	283f8ecd 	ld.b	$r13,$r22,-29(0xfe3)
1c001c30:	0280940c 	addi.w	$r12,$r0,37(0x25)
1c001c34:	5c02e5ac 	bne	$r13,$r12,740(0x2e4) # 1c001f18 <myprintf+0x34c>
1c001c38:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c001c3c:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c001c40:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001c44:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001c48:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c001c4c:	001031ac 	add.w	$r12,$r13,$r12
1c001c50:	2800018c 	ld.b	$r12,$r12,0
1c001c54:	02bf6d8c 	addi.w	$r12,$r12,-37(0xfdb)
1c001c58:	02814c0d 	addi.w	$r13,$r0,83(0x53)
1c001c5c:	6802adac 	bltu	$r13,$r12,684(0x2ac) # 1c001f08 <myprintf+0x33c>
1c001c60:	0040898d 	slli.w	$r13,$r12,0x2
1c001c64:	1c00012c 	pcaddu12i	$r12,9(0x9)
1c001c68:	028be18c 	addi.w	$r12,$r12,760(0x2f8)
1c001c6c:	001031ac 	add.w	$r12,$r13,$r12
1c001c70:	2880018c 	ld.w	$r12,$r12,0
1c001c74:	4c000180 	jirl	$r0,$r12,0
1c001c78:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001c7c:	2880018c 	ld.w	$r12,$r12,0
1c001c80:	00150184 	move	$r4,$r12
1c001c84:	57fedbff 	bl	-296(0xffffed8) # 1c001b5c <ls1x_puts>
1c001c88:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001c8c:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c001c90:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c001c94:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001c98:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001c9c:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001ca0:	50029800 	b	664(0x298) # 1c001f38 <myprintf+0x36c>
1c001ca4:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001ca8:	2880018c 	ld.w	$r12,$r12,0
1c001cac:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001cb0:	00150184 	move	$r4,$r12
1c001cb4:	57fd0fff 	bl	-756(0xffffd0c) # 1c0019c0 <myputchar>
1c001cb8:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001cbc:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c001cc0:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c001cc4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001cc8:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001ccc:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001cd0:	50026800 	b	616(0x268) # 1c001f38 <myprintf+0x36c>
1c001cd4:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001cd8:	2880018c 	ld.w	$r12,$r12,0
1c001cdc:	00150007 	move	$r7,$r0
1c001ce0:	02802806 	addi.w	$r6,$r0,10(0xa)
1c001ce4:	28bf92c5 	ld.w	$r5,$r22,-28(0xfe4)
1c001ce8:	00150184 	move	$r4,$r12
1c001cec:	57fd13ff 	bl	-752(0xffffd10) # 1c0019fc <printbase>
1c001cf0:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001cf4:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c001cf8:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c001cfc:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001d00:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001d04:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001d08:	50023000 	b	560(0x230) # 1c001f38 <myprintf+0x36c>
1c001d0c:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001d10:	2880018c 	ld.w	$r12,$r12,0
1c001d14:	02800407 	addi.w	$r7,$r0,1(0x1)
1c001d18:	02802806 	addi.w	$r6,$r0,10(0xa)
1c001d1c:	28bf92c5 	ld.w	$r5,$r22,-28(0xfe4)
1c001d20:	00150184 	move	$r4,$r12
1c001d24:	57fcdbff 	bl	-808(0xffffcd8) # 1c0019fc <printbase>
1c001d28:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001d2c:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c001d30:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c001d34:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001d38:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001d3c:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001d40:	5001f800 	b	504(0x1f8) # 1c001f38 <myprintf+0x36c>
1c001d44:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001d48:	2880018c 	ld.w	$r12,$r12,0
1c001d4c:	00150007 	move	$r7,$r0
1c001d50:	02802006 	addi.w	$r6,$r0,8(0x8)
1c001d54:	28bf92c5 	ld.w	$r5,$r22,-28(0xfe4)
1c001d58:	00150184 	move	$r4,$r12
1c001d5c:	57fca3ff 	bl	-864(0xffffca0) # 1c0019fc <printbase>
1c001d60:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001d64:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c001d68:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c001d6c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001d70:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001d74:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001d78:	5001c000 	b	448(0x1c0) # 1c001f38 <myprintf+0x36c>
1c001d7c:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001d80:	2880018c 	ld.w	$r12,$r12,0
1c001d84:	00150007 	move	$r7,$r0
1c001d88:	02800806 	addi.w	$r6,$r0,2(0x2)
1c001d8c:	28bf92c5 	ld.w	$r5,$r22,-28(0xfe4)
1c001d90:	00150184 	move	$r4,$r12
1c001d94:	57fc6bff 	bl	-920(0xffffc68) # 1c0019fc <printbase>
1c001d98:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001d9c:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c001da0:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c001da4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001da8:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001dac:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001db0:	50018800 	b	392(0x188) # 1c001f38 <myprintf+0x36c>
1c001db4:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001db8:	2880018c 	ld.w	$r12,$r12,0
1c001dbc:	00150007 	move	$r7,$r0
1c001dc0:	02804006 	addi.w	$r6,$r0,16(0x10)
1c001dc4:	28bf92c5 	ld.w	$r5,$r22,-28(0xfe4)
1c001dc8:	00150184 	move	$r4,$r12
1c001dcc:	57fc33ff 	bl	-976(0xffffc30) # 1c0019fc <printbase>
1c001dd0:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c001dd4:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c001dd8:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c001ddc:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001de0:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001de4:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001de8:	50015000 	b	336(0x150) # 1c001f38 <myprintf+0x36c>
1c001dec:	02809404 	addi.w	$r4,$r0,37(0x25)
1c001df0:	57fbd3ff 	bl	-1072(0xffffbd0) # 1c0019c0 <myputchar>
1c001df4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001df8:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001dfc:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001e00:	50013800 	b	312(0x138) # 1c001f38 <myprintf+0x36c>
1c001e04:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001e08:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001e0c:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001e10:	29bf92c0 	st.w	$r0,$r22,-28(0xfe4)
1c001e14:	50003c00 	b	60(0x3c) # 1c001e50 <myprintf+0x284>
1c001e18:	28bf92cd 	ld.w	$r13,$r22,-28(0xfe4)
1c001e1c:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c001e20:	001c31ad 	mul.w	$r13,$r13,$r12
1c001e24:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001e28:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001e2c:	28bf32ce 	ld.w	$r14,$r22,-52(0xfcc)
1c001e30:	001031cc 	add.w	$r12,$r14,$r12
1c001e34:	2800018c 	ld.b	$r12,$r12,0
1c001e38:	02bf418c 	addi.w	$r12,$r12,-48(0xfd0)
1c001e3c:	001031ac 	add.w	$r12,$r13,$r12
1c001e40:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c001e44:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001e48:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001e4c:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001e50:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001e54:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001e58:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c001e5c:	001031ac 	add.w	$r12,$r13,$r12
1c001e60:	2800018d 	ld.b	$r13,$r12,0
1c001e64:	0280c00c 	addi.w	$r12,$r0,48(0x30)
1c001e68:	67fdd98d 	bge	$r12,$r13,-552(0x3fdd8) # 1c001c40 <myprintf+0x74>
1c001e6c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001e70:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001e74:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c001e78:	001031ac 	add.w	$r12,$r13,$r12
1c001e7c:	2800018d 	ld.b	$r13,$r12,0
1c001e80:	0280e40c 	addi.w	$r12,$r0,57(0x39)
1c001e84:	67ff958d 	bge	$r12,$r13,-108(0x3ff94) # 1c001e18 <myprintf+0x24c>
1c001e88:	53fdbbff 	b	-584(0xffffdb8) # 1c001c40 <myprintf+0x74>
1c001e8c:	29bf92c0 	st.w	$r0,$r22,-28(0xfe4)
1c001e90:	50003c00 	b	60(0x3c) # 1c001ecc <myprintf+0x300>
1c001e94:	28bf92cd 	ld.w	$r13,$r22,-28(0xfe4)
1c001e98:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c001e9c:	001c31ad 	mul.w	$r13,$r13,$r12
1c001ea0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001ea4:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001ea8:	28bf32ce 	ld.w	$r14,$r22,-52(0xfcc)
1c001eac:	001031cc 	add.w	$r12,$r14,$r12
1c001eb0:	2800018c 	ld.b	$r12,$r12,0
1c001eb4:	02bf418c 	addi.w	$r12,$r12,-48(0xfd0)
1c001eb8:	001031ac 	add.w	$r12,$r13,$r12
1c001ebc:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c001ec0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001ec4:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001ec8:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001ecc:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001ed0:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001ed4:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c001ed8:	001031ac 	add.w	$r12,$r13,$r12
1c001edc:	2800018d 	ld.b	$r13,$r12,0
1c001ee0:	0280c00c 	addi.w	$r12,$r0,48(0x30)
1c001ee4:	67fd5d8d 	bge	$r12,$r13,-676(0x3fd5c) # 1c001c40 <myprintf+0x74>
1c001ee8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001eec:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001ef0:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c001ef4:	001031ac 	add.w	$r12,$r13,$r12
1c001ef8:	2800018d 	ld.b	$r13,$r12,0
1c001efc:	0280e40c 	addi.w	$r12,$r0,57(0x39)
1c001f00:	67ff958d 	bge	$r12,$r13,-108(0x3ff94) # 1c001e94 <myprintf+0x2c8>
1c001f04:	53fd3fff 	b	-708(0xffffd3c) # 1c001c40 <myprintf+0x74>
1c001f08:	02809404 	addi.w	$r4,$r0,37(0x25)
1c001f0c:	57fab7ff 	bl	-1356(0xffffab4) # 1c0019c0 <myputchar>
1c001f10:	03400000 	andi	$r0,$r0,0x0
1c001f14:	50002400 	b	36(0x24) # 1c001f38 <myprintf+0x36c>
1c001f18:	283f8ecd 	ld.b	$r13,$r22,-29(0xfe3)
1c001f1c:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c001f20:	5c000dac 	bne	$r13,$r12,12(0xc) # 1c001f2c <myprintf+0x360>
1c001f24:	02803404 	addi.w	$r4,$r0,13(0xd)
1c001f28:	57fa9bff 	bl	-1384(0xffffa98) # 1c0019c0 <myputchar>
1c001f2c:	2a3f8ecc 	ld.bu	$r12,$r22,-29(0xfe3)
1c001f30:	00150184 	move	$r4,$r12
1c001f34:	57fa8fff 	bl	-1396(0xffffa8c) # 1c0019c0 <myputchar>
1c001f38:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001f3c:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c001f40:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c001f44:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c001f48:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c001f4c:	001031ac 	add.w	$r12,$r13,$r12
1c001f50:	2800018c 	ld.b	$r12,$r12,0
1c001f54:	47fcc59f 	bnez	$r12,-828(0x7ffcc4) # 1c001c18 <myprintf+0x4c>
1c001f58:	0015000c 	move	$r12,$r0
1c001f5c:	00150184 	move	$r4,$r12
1c001f60:	2880f061 	ld.w	$r1,$r3,60(0x3c)
1c001f64:	2880e076 	ld.w	$r22,$r3,56(0x38)
1c001f68:	02818063 	addi.w	$r3,$r3,96(0x60)
1c001f6c:	4c000020 	jirl	$r0,$r1,0

1c001f70 <Uart_init>:
Uart_init():
1c001f70:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c001f74:	2980b076 	st.w	$r22,$r3,44(0x2c)
1c001f78:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c001f7c:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c001f80:	293fbec0 	st.b	$r0,$r22,-17(0xfef)
1c001f84:	29bfa2c0 	st.w	$r0,$r22,-24(0xfe8)
1c001f88:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001f8c:	02800c0d 	addi.w	$r13,$r0,3(0x3)
1c001f90:	29000d8d 	st.b	$r13,$r12,3(0x3)
1c001f94:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001f98:	2a000d8c 	ld.bu	$r12,$r12,3(0x3)
1c001f9c:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c001fa0:	02be000c 	addi.w	$r12,$r0,-128(0xf80)
1c001fa4:	001531ac 	or	$r12,$r13,$r12
1c001fa8:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c001fac:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001fb0:	29000d8d 	st.b	$r13,$r12,3(0x3)
1c001fb4:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001fb8:	02bf280d 	addi.w	$r13,$r0,-54(0xfca)
1c001fbc:	2900098d 	st.b	$r13,$r12,2(0x2)
1c001fc0:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001fc4:	0280140d 	addi.w	$r13,$r0,5(0x5)
1c001fc8:	2900018d 	st.b	$r13,$r12,0
1c001fcc:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001fd0:	29000580 	st.b	$r0,$r12,1(0x1)
1c001fd4:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001fd8:	2a000d8c 	ld.bu	$r12,$r12,3(0x3)
1c001fdc:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c001fe0:	0341fd8c 	andi	$r12,$r12,0x7f
1c001fe4:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c001fe8:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001fec:	29000d8d 	st.b	$r13,$r12,3(0x3)
1c001ff0:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001ff4:	29000580 	st.b	$r0,$r12,1(0x1)
1c001ff8:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c001ffc:	0280180d 	addi.w	$r13,$r0,6(0x6)
1c002000:	2900098d 	st.b	$r13,$r12,2(0x2)
1c002004:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c002008:	2a00018c 	ld.bu	$r12,$r12,0
1c00200c:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c002010:	03400000 	andi	$r0,$r0,0x0
1c002014:	2880b076 	ld.w	$r22,$r3,44(0x2c)
1c002018:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c00201c:	4c000020 	jirl	$r0,$r1,0

1c002020 <UART_SendData>:
UART_SendData():
1c002020:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002024:	29807076 	st.w	$r22,$r3,28(0x1c)
1c002028:	02808076 	addi.w	$r22,$r3,32(0x20)
1c00202c:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c002030:	001500ac 	move	$r12,$r5
1c002034:	293faecc 	st.b	$r12,$r22,-21(0xfeb)
1c002038:	03400000 	andi	$r0,$r0,0x0
1c00203c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002040:	2a00158c 	ld.bu	$r12,$r12,5(0x5)
1c002044:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c002048:	0340818c 	andi	$r12,$r12,0x20
1c00204c:	43fff19f 	beqz	$r12,-16(0x7ffff0) # 1c00203c <UART_SendData+0x1c>
1c002050:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002054:	2a3faecd 	ld.bu	$r13,$r22,-21(0xfeb)
1c002058:	2900018d 	st.b	$r13,$r12,0
1c00205c:	03400000 	andi	$r0,$r0,0x0
1c002060:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c002064:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002068:	4c000020 	jirl	$r0,$r1,0

1c00206c <DisableInt>:
DisableInt():
1c00206c:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c002070:	29803076 	st.w	$r22,$r3,12(0xc)
1c002074:	02804076 	addi.w	$r22,$r3,16(0x10)
1c002078:	0380100c 	ori	$r12,$r0,0x4
1c00207c:	04000180 	csrxchg	$r0,$r12,0x0
1c002080:	03400000 	andi	$r0,$r0,0x0
1c002084:	28803076 	ld.w	$r22,$r3,12(0xc)
1c002088:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00208c:	4c000020 	jirl	$r0,$r1,0

1c002090 <EnableInt>:
EnableInt():
1c002090:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c002094:	29803076 	st.w	$r22,$r3,12(0xc)
1c002098:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00209c:	0380100c 	ori	$r12,$r0,0x4
1c0020a0:	0400018c 	csrxchg	$r12,$r12,0x0
1c0020a4:	03400000 	andi	$r0,$r0,0x0
1c0020a8:	28803076 	ld.w	$r22,$r3,12(0xc)
1c0020ac:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0020b0:	4c000020 	jirl	$r0,$r1,0

1c0020b4 <Set_Timer_stop>:
Set_Timer_stop():
1c0020b4:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0020b8:	29803076 	st.w	$r22,$r3,12(0xc)
1c0020bc:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0020c0:	04010420 	csrwr	$r0,0x41
1c0020c4:	03400000 	andi	$r0,$r0,0x0
1c0020c8:	28803076 	ld.w	$r22,$r3,12(0xc)
1c0020cc:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0020d0:	4c000020 	jirl	$r0,$r1,0

1c0020d4 <Set_Timer_clear>:
Set_Timer_clear():
1c0020d4:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0020d8:	29803076 	st.w	$r22,$r3,12(0xc)
1c0020dc:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0020e0:	0380040c 	ori	$r12,$r0,0x1
1c0020e4:	0401102c 	csrwr	$r12,0x44
1c0020e8:	03400000 	andi	$r0,$r0,0x0
1c0020ec:	28803076 	ld.w	$r22,$r3,12(0xc)
1c0020f0:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0020f4:	4c000020 	jirl	$r0,$r1,0

1c0020f8 <Set_Timer_Init>:
Set_Timer_Init():
1c0020f8:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0020fc:	29807076 	st.w	$r22,$r3,28(0x1c)
1c002100:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002104:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c002108:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c00210c:	0401040c 	csrrd	$r12,0x41
1c002110:	03800dac 	ori	$r12,$r13,0x3
1c002114:	0401042c 	csrwr	$r12,0x41
1c002118:	03400000 	andi	$r0,$r0,0x0
1c00211c:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c002120:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002124:	4c000020 	jirl	$r0,$r1,0

1c002128 <Wake_Set>:
Wake_Set():
1c002128:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c00212c:	2980b076 	st.w	$r22,$r3,44(0x2c)
1c002130:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c002134:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c002138:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c00213c:	40006980 	beqz	$r12,104(0x68) # 1c0021a4 <Wake_Set+0x7c>
1c002140:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c002144:	0040a18c 	slli.w	$r12,$r12,0x8
1c002148:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c00214c:	29bfa2c0 	st.w	$r0,$r22,-24(0xfe8)
1c002150:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002154:	0380218c 	ori	$r12,$r12,0x8
1c002158:	2880018d 	ld.w	$r13,$r12,0
1c00215c:	14001fec 	lu12i.w	$r12,255(0xff)
1c002160:	03bffd8c 	ori	$r12,$r12,0xfff
1c002164:	0014b1ac 	and	$r12,$r13,$r12
1c002168:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c00216c:	001031ac 	add.w	$r12,$r13,$r12
1c002170:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c002174:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002178:	0380318c 	ori	$r12,$r12,0xc
1c00217c:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c002180:	2980018d 	st.w	$r13,$r12,0
1c002184:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002188:	0380118c 	ori	$r12,$r12,0x4
1c00218c:	2880018d 	ld.w	$r13,$r12,0
1c002190:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c002194:	0380118c 	ori	$r12,$r12,0x4
1c002198:	038601ad 	ori	$r13,$r13,0x180
1c00219c:	2980018d 	st.w	$r13,$r12,0
1c0021a0:	50002400 	b	36(0x24) # 1c0021c4 <Wake_Set+0x9c>
1c0021a4:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0021a8:	0380118c 	ori	$r12,$r12,0x4
1c0021ac:	2880018e 	ld.w	$r14,$r12,0
1c0021b0:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0021b4:	0380118c 	ori	$r12,$r12,0x4
1c0021b8:	02b9fc0d 	addi.w	$r13,$r0,-385(0xe7f)
1c0021bc:	0014b5cd 	and	$r13,$r14,$r13
1c0021c0:	2980018d 	st.w	$r13,$r12,0
1c0021c4:	03400000 	andi	$r0,$r0,0x0
1c0021c8:	2880b076 	ld.w	$r22,$r3,44(0x2c)
1c0021cc:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c0021d0:	4c000020 	jirl	$r0,$r1,0

1c0021d4 <soc_myputchar>:
soc_myputchar():
1c0021d4:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c0021d8:	2980b076 	st.w	$r22,$r3,44(0x2c)
1c0021dc:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c0021e0:	0015008c 	move	$r12,$r4
1c0021e4:	293f7ecc 	st.b	$r12,$r22,-33(0xfdf)
1c0021e8:	157fd10c 	lu12i.w	$r12,-262520(0xbfe88)
1c0021ec:	0380118c 	ori	$r12,$r12,0x4
1c0021f0:	2880018c 	ld.w	$r12,$r12,0
1c0021f4:	00005d8c 	ext.w.b	$r12,$r12
1c0021f8:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c0021fc:	03400000 	andi	$r0,$r0,0x0
1c002200:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c002204:	00005d8c 	ext.w.b	$r12,$r12
1c002208:	0340098d 	andi	$r13,$r12,0x2
1c00220c:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c002210:	5bfff1ac 	beq	$r13,$r12,-16(0x3fff0) # 1c002200 <soc_myputchar+0x2c>
1c002214:	157fd10c 	lu12i.w	$r12,-262520(0xbfe88)
1c002218:	2a3f7ecd 	ld.bu	$r13,$r22,-33(0xfdf)
1c00221c:	2980018d 	st.w	$r13,$r12,0
1c002220:	03400000 	andi	$r0,$r0,0x0
1c002224:	2880b076 	ld.w	$r22,$r3,44(0x2c)
1c002228:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c00222c:	4c000020 	jirl	$r0,$r1,0

1c002230 <soc_puts>:
soc_puts():
1c002230:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c002234:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c002238:	2980a076 	st.w	$r22,$r3,40(0x28)
1c00223c:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c002240:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c002244:	50003000 	b	48(0x30) # 1c002274 <soc_puts+0x44>
1c002248:	283fbecd 	ld.b	$r13,$r22,-17(0xfef)
1c00224c:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c002250:	5c000dac 	bne	$r13,$r12,12(0xc) # 1c00225c <soc_puts+0x2c>
1c002254:	02803404 	addi.w	$r4,$r0,13(0xd)
1c002258:	57ff7fff 	bl	-132(0xfffff7c) # 1c0021d4 <soc_myputchar>
1c00225c:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c002260:	00150184 	move	$r4,$r12
1c002264:	57ff73ff 	bl	-144(0xfffff70) # 1c0021d4 <soc_myputchar>
1c002268:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c00226c:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002270:	29bf72cc 	st.w	$r12,$r22,-36(0xfdc)
1c002274:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c002278:	2a00018c 	ld.bu	$r12,$r12,0
1c00227c:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c002280:	283fbecc 	ld.b	$r12,$r22,-17(0xfef)
1c002284:	47ffc59f 	bnez	$r12,-60(0x7fffc4) # 1c002248 <soc_puts+0x18>
1c002288:	0015000c 	move	$r12,$r0
1c00228c:	00150184 	move	$r4,$r12
1c002290:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c002294:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c002298:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c00229c:	4c000020 	jirl	$r0,$r1,0

1c0022a0 <soc_printbase>:
soc_printbase():
1c0022a0:	02be4063 	addi.w	$r3,$r3,-112(0xf90)
1c0022a4:	2981b061 	st.w	$r1,$r3,108(0x6c)
1c0022a8:	2981a076 	st.w	$r22,$r3,104(0x68)
1c0022ac:	0281c076 	addi.w	$r22,$r3,112(0x70)
1c0022b0:	29be72c4 	st.w	$r4,$r22,-100(0xf9c)
1c0022b4:	29be62c5 	st.w	$r5,$r22,-104(0xf98)
1c0022b8:	29be52c6 	st.w	$r6,$r22,-108(0xf94)
1c0022bc:	29be42c7 	st.w	$r7,$r22,-112(0xf90)
1c0022c0:	28be42cc 	ld.w	$r12,$r22,-112(0xf90)
1c0022c4:	40002580 	beqz	$r12,36(0x24) # 1c0022e8 <soc_printbase+0x48>
1c0022c8:	28be72cc 	ld.w	$r12,$r22,-100(0xf9c)
1c0022cc:	64001d80 	bge	$r12,$r0,28(0x1c) # 1c0022e8 <soc_printbase+0x48>
1c0022d0:	28be72cc 	ld.w	$r12,$r22,-100(0xf9c)
1c0022d4:	0011300c 	sub.w	$r12,$r0,$r12
1c0022d8:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c0022dc:	0280b404 	addi.w	$r4,$r0,45(0x2d)
1c0022e0:	57fef7ff 	bl	-268(0xffffef4) # 1c0021d4 <soc_myputchar>
1c0022e4:	50000c00 	b	12(0xc) # 1c0022f0 <soc_printbase+0x50>
1c0022e8:	28be72cc 	ld.w	$r12,$r22,-100(0xf9c)
1c0022ec:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c0022f0:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c0022f4:	50005000 	b	80(0x50) # 1c002344 <soc_printbase+0xa4>
1c0022f8:	28be52cc 	ld.w	$r12,$r22,-108(0xf94)
1c0022fc:	28bf92cd 	ld.w	$r13,$r22,-28(0xfe4)
1c002300:	0021b1ae 	mod.wu	$r14,$r13,$r12
1c002304:	5c000980 	bne	$r12,$r0,8(0x8) # 1c00230c <soc_printbase+0x6c>
1c002308:	002a0007 	break	0x7
1c00230c:	00005dcc 	ext.w.b	$r12,$r14
1c002310:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c002314:	02bfc2ce 	addi.w	$r14,$r22,-16(0xff0)
1c002318:	001035cd 	add.w	$r13,$r14,$r13
1c00231c:	293ec1ac 	st.b	$r12,$r13,-80(0xfb0)
1c002320:	28be52cd 	ld.w	$r13,$r22,-108(0xf94)
1c002324:	28bf92ce 	ld.w	$r14,$r22,-28(0xfe4)
1c002328:	002135cc 	div.wu	$r12,$r14,$r13
1c00232c:	5c0009a0 	bne	$r13,$r0,8(0x8) # 1c002334 <soc_printbase+0x94>
1c002330:	002a0007 	break	0x7
1c002334:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c002338:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00233c:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002340:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c002344:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c002348:	47ffb19f 	bnez	$r12,-80(0x7fffb0) # 1c0022f8 <soc_printbase+0x58>
1c00234c:	28be62cc 	ld.w	$r12,$r22,-104(0xf98)
1c002350:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c002354:	28bfb2ce 	ld.w	$r14,$r22,-20(0xfec)
1c002358:	001231ad 	slt	$r13,$r13,$r12
1c00235c:	0013b5ce 	masknez	$r14,$r14,$r13
1c002360:	0013358c 	maskeqz	$r12,$r12,$r13
1c002364:	001531cc 	or	$r12,$r14,$r12
1c002368:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c00236c:	50007400 	b	116(0x74) # 1c0023e0 <soc_printbase+0x140>
1c002370:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c002374:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002378:	60001d8d 	blt	$r12,$r13,28(0x1c) # 1c002394 <soc_printbase+0xf4>
1c00237c:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c002380:	02bffd8c 	addi.w	$r12,$r12,-1(0xfff)
1c002384:	02bfc2cd 	addi.w	$r13,$r22,-16(0xff0)
1c002388:	001031ac 	add.w	$r12,$r13,$r12
1c00238c:	283ec18c 	ld.b	$r12,$r12,-80(0xfb0)
1c002390:	50000800 	b	8(0x8) # 1c002398 <soc_printbase+0xf8>
1c002394:	0015000c 	move	$r12,$r0
1c002398:	29bf82cc 	st.w	$r12,$r22,-32(0xfe0)
1c00239c:	28bf82cd 	ld.w	$r13,$r22,-32(0xfe0)
1c0023a0:	0280240c 	addi.w	$r12,$r0,9(0x9)
1c0023a4:	6000198d 	blt	$r12,$r13,24(0x18) # 1c0023bc <soc_printbase+0x11c>
1c0023a8:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c0023ac:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0023b0:	0280c18c 	addi.w	$r12,$r12,48(0x30)
1c0023b4:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0023b8:	50001400 	b	20(0x14) # 1c0023cc <soc_printbase+0x12c>
1c0023bc:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c0023c0:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0023c4:	02815d8c 	addi.w	$r12,$r12,87(0x57)
1c0023c8:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0023cc:	00150184 	move	$r4,$r12
1c0023d0:	57fe07ff 	bl	-508(0xffffe04) # 1c0021d4 <soc_myputchar>
1c0023d4:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0023d8:	02bffd8c 	addi.w	$r12,$r12,-1(0xfff)
1c0023dc:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0023e0:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0023e4:	63ff8c0c 	blt	$r0,$r12,-116(0x3ff8c) # 1c002370 <soc_printbase+0xd0>
1c0023e8:	0015000c 	move	$r12,$r0
1c0023ec:	00150184 	move	$r4,$r12
1c0023f0:	2881b061 	ld.w	$r1,$r3,108(0x6c)
1c0023f4:	2881a076 	ld.w	$r22,$r3,104(0x68)
1c0023f8:	0281c063 	addi.w	$r3,$r3,112(0x70)
1c0023fc:	4c000020 	jirl	$r0,$r1,0

1c002400 <soc_myprintf>:
soc_myprintf():
1c002400:	02be8063 	addi.w	$r3,$r3,-96(0xfa0)
1c002404:	2980f061 	st.w	$r1,$r3,60(0x3c)
1c002408:	2980e076 	st.w	$r22,$r3,56(0x38)
1c00240c:	02810076 	addi.w	$r22,$r3,64(0x40)
1c002410:	29bf32c4 	st.w	$r4,$r22,-52(0xfcc)
1c002414:	298012c5 	st.w	$r5,$r22,4(0x4)
1c002418:	298022c6 	st.w	$r6,$r22,8(0x8)
1c00241c:	298032c7 	st.w	$r7,$r22,12(0xc)
1c002420:	298042c8 	st.w	$r8,$r22,16(0x10)
1c002424:	298052c9 	st.w	$r9,$r22,20(0x14)
1c002428:	298062ca 	st.w	$r10,$r22,24(0x18)
1c00242c:	298072cb 	st.w	$r11,$r22,28(0x1c)
1c002430:	028082cc 	addi.w	$r12,$r22,32(0x20)
1c002434:	02bf918c 	addi.w	$r12,$r12,-28(0xfe4)
1c002438:	29bf62cc 	st.w	$r12,$r22,-40(0xfd8)
1c00243c:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c002440:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c002444:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c002448:	50038000 	b	896(0x380) # 1c0027c8 <soc_myprintf+0x3c8>
1c00244c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002450:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c002454:	001031ac 	add.w	$r12,$r13,$r12
1c002458:	2a00018c 	ld.bu	$r12,$r12,0
1c00245c:	293f7ecc 	st.b	$r12,$r22,-33(0xfdf)
1c002460:	283f7ecd 	ld.b	$r13,$r22,-33(0xfdf)
1c002464:	0280940c 	addi.w	$r12,$r0,37(0x25)
1c002468:	5c02e5ac 	bne	$r13,$r12,740(0x2e4) # 1c00274c <soc_myprintf+0x34c>
1c00246c:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c002470:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c002474:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002478:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c00247c:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c002480:	001031ac 	add.w	$r12,$r13,$r12
1c002484:	2800018c 	ld.b	$r12,$r12,0
1c002488:	02bf6d8c 	addi.w	$r12,$r12,-37(0xfdb)
1c00248c:	02814c0d 	addi.w	$r13,$r0,83(0x53)
1c002490:	6802adac 	bltu	$r13,$r12,684(0x2ac) # 1c00273c <soc_myprintf+0x33c>
1c002494:	0040898d 	slli.w	$r13,$r12,0x2
1c002498:	1c00012c 	pcaddu12i	$r12,9(0x9)
1c00249c:	02b0518c 	addi.w	$r12,$r12,-1004(0xc14)
1c0024a0:	001031ac 	add.w	$r12,$r13,$r12
1c0024a4:	2880018c 	ld.w	$r12,$r12,0
1c0024a8:	4c000180 	jirl	$r0,$r12,0
1c0024ac:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0024b0:	2880018c 	ld.w	$r12,$r12,0
1c0024b4:	00150184 	move	$r4,$r12
1c0024b8:	57fd7bff 	bl	-648(0xffffd78) # 1c002230 <soc_puts>
1c0024bc:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0024c0:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c0024c4:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0024c8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0024cc:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0024d0:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0024d4:	50029800 	b	664(0x298) # 1c00276c <soc_myprintf+0x36c>
1c0024d8:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0024dc:	2880018c 	ld.w	$r12,$r12,0
1c0024e0:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0024e4:	00150184 	move	$r4,$r12
1c0024e8:	57fcefff 	bl	-788(0xffffcec) # 1c0021d4 <soc_myputchar>
1c0024ec:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0024f0:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c0024f4:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0024f8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0024fc:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002500:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c002504:	50026800 	b	616(0x268) # 1c00276c <soc_myprintf+0x36c>
1c002508:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c00250c:	2880018c 	ld.w	$r12,$r12,0
1c002510:	00150007 	move	$r7,$r0
1c002514:	02802806 	addi.w	$r6,$r0,10(0xa)
1c002518:	28bf92c5 	ld.w	$r5,$r22,-28(0xfe4)
1c00251c:	00150184 	move	$r4,$r12
1c002520:	57fd83ff 	bl	-640(0xffffd80) # 1c0022a0 <soc_printbase>
1c002524:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c002528:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c00252c:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c002530:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002534:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002538:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c00253c:	50023000 	b	560(0x230) # 1c00276c <soc_myprintf+0x36c>
1c002540:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c002544:	2880018c 	ld.w	$r12,$r12,0
1c002548:	02800407 	addi.w	$r7,$r0,1(0x1)
1c00254c:	02802806 	addi.w	$r6,$r0,10(0xa)
1c002550:	28bf92c5 	ld.w	$r5,$r22,-28(0xfe4)
1c002554:	00150184 	move	$r4,$r12
1c002558:	57fd4bff 	bl	-696(0xffffd48) # 1c0022a0 <soc_printbase>
1c00255c:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c002560:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c002564:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c002568:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00256c:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002570:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c002574:	5001f800 	b	504(0x1f8) # 1c00276c <soc_myprintf+0x36c>
1c002578:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c00257c:	2880018c 	ld.w	$r12,$r12,0
1c002580:	00150007 	move	$r7,$r0
1c002584:	02802006 	addi.w	$r6,$r0,8(0x8)
1c002588:	28bf92c5 	ld.w	$r5,$r22,-28(0xfe4)
1c00258c:	00150184 	move	$r4,$r12
1c002590:	57fd13ff 	bl	-752(0xffffd10) # 1c0022a0 <soc_printbase>
1c002594:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c002598:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c00259c:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0025a0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0025a4:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0025a8:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0025ac:	5001c000 	b	448(0x1c0) # 1c00276c <soc_myprintf+0x36c>
1c0025b0:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0025b4:	2880018c 	ld.w	$r12,$r12,0
1c0025b8:	00150007 	move	$r7,$r0
1c0025bc:	02800806 	addi.w	$r6,$r0,2(0x2)
1c0025c0:	28bf92c5 	ld.w	$r5,$r22,-28(0xfe4)
1c0025c4:	00150184 	move	$r4,$r12
1c0025c8:	57fcdbff 	bl	-808(0xffffcd8) # 1c0022a0 <soc_printbase>
1c0025cc:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0025d0:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c0025d4:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0025d8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0025dc:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0025e0:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0025e4:	50018800 	b	392(0x188) # 1c00276c <soc_myprintf+0x36c>
1c0025e8:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0025ec:	2880018c 	ld.w	$r12,$r12,0
1c0025f0:	00150007 	move	$r7,$r0
1c0025f4:	02804006 	addi.w	$r6,$r0,16(0x10)
1c0025f8:	28bf92c5 	ld.w	$r5,$r22,-28(0xfe4)
1c0025fc:	00150184 	move	$r4,$r12
1c002600:	57fca3ff 	bl	-864(0xffffca0) # 1c0022a0 <soc_printbase>
1c002604:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c002608:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c00260c:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c002610:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002614:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002618:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c00261c:	50015000 	b	336(0x150) # 1c00276c <soc_myprintf+0x36c>
1c002620:	02809404 	addi.w	$r4,$r0,37(0x25)
1c002624:	57fbb3ff 	bl	-1104(0xffffbb0) # 1c0021d4 <soc_myputchar>
1c002628:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00262c:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002630:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c002634:	50013800 	b	312(0x138) # 1c00276c <soc_myprintf+0x36c>
1c002638:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00263c:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002640:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c002644:	29bf92c0 	st.w	$r0,$r22,-28(0xfe4)
1c002648:	50003c00 	b	60(0x3c) # 1c002684 <soc_myprintf+0x284>
1c00264c:	28bf92cd 	ld.w	$r13,$r22,-28(0xfe4)
1c002650:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c002654:	001c31ad 	mul.w	$r13,$r13,$r12
1c002658:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00265c:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002660:	28bf32ce 	ld.w	$r14,$r22,-52(0xfcc)
1c002664:	001031cc 	add.w	$r12,$r14,$r12
1c002668:	2800018c 	ld.b	$r12,$r12,0
1c00266c:	02bf418c 	addi.w	$r12,$r12,-48(0xfd0)
1c002670:	001031ac 	add.w	$r12,$r13,$r12
1c002674:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c002678:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00267c:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002680:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c002684:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002688:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c00268c:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c002690:	001031ac 	add.w	$r12,$r13,$r12
1c002694:	2800018d 	ld.b	$r13,$r12,0
1c002698:	0280c00c 	addi.w	$r12,$r0,48(0x30)
1c00269c:	67fdd98d 	bge	$r12,$r13,-552(0x3fdd8) # 1c002474 <soc_myprintf+0x74>
1c0026a0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0026a4:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0026a8:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c0026ac:	001031ac 	add.w	$r12,$r13,$r12
1c0026b0:	2800018d 	ld.b	$r13,$r12,0
1c0026b4:	0280e40c 	addi.w	$r12,$r0,57(0x39)
1c0026b8:	67ff958d 	bge	$r12,$r13,-108(0x3ff94) # 1c00264c <soc_myprintf+0x24c>
1c0026bc:	53fdbbff 	b	-584(0xffffdb8) # 1c002474 <soc_myprintf+0x74>
1c0026c0:	29bf92c0 	st.w	$r0,$r22,-28(0xfe4)
1c0026c4:	50003c00 	b	60(0x3c) # 1c002700 <soc_myprintf+0x300>
1c0026c8:	28bf92cd 	ld.w	$r13,$r22,-28(0xfe4)
1c0026cc:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c0026d0:	001c31ad 	mul.w	$r13,$r13,$r12
1c0026d4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0026d8:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0026dc:	28bf32ce 	ld.w	$r14,$r22,-52(0xfcc)
1c0026e0:	001031cc 	add.w	$r12,$r14,$r12
1c0026e4:	2800018c 	ld.b	$r12,$r12,0
1c0026e8:	02bf418c 	addi.w	$r12,$r12,-48(0xfd0)
1c0026ec:	001031ac 	add.w	$r12,$r13,$r12
1c0026f0:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c0026f4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0026f8:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0026fc:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c002700:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002704:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002708:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c00270c:	001031ac 	add.w	$r12,$r13,$r12
1c002710:	2800018d 	ld.b	$r13,$r12,0
1c002714:	0280c00c 	addi.w	$r12,$r0,48(0x30)
1c002718:	67fd5d8d 	bge	$r12,$r13,-676(0x3fd5c) # 1c002474 <soc_myprintf+0x74>
1c00271c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002720:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c002724:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c002728:	001031ac 	add.w	$r12,$r13,$r12
1c00272c:	2800018d 	ld.b	$r13,$r12,0
1c002730:	0280e40c 	addi.w	$r12,$r0,57(0x39)
1c002734:	67ff958d 	bge	$r12,$r13,-108(0x3ff94) # 1c0026c8 <soc_myprintf+0x2c8>
1c002738:	53fd3fff 	b	-708(0xffffd3c) # 1c002474 <soc_myprintf+0x74>
1c00273c:	02809404 	addi.w	$r4,$r0,37(0x25)
1c002740:	57fa97ff 	bl	-1388(0xffffa94) # 1c0021d4 <soc_myputchar>
1c002744:	03400000 	andi	$r0,$r0,0x0
1c002748:	50002400 	b	36(0x24) # 1c00276c <soc_myprintf+0x36c>
1c00274c:	283f7ecd 	ld.b	$r13,$r22,-33(0xfdf)
1c002750:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c002754:	5c000dac 	bne	$r13,$r12,12(0xc) # 1c002760 <soc_myprintf+0x360>
1c002758:	02803404 	addi.w	$r4,$r0,13(0xd)
1c00275c:	57fa7bff 	bl	-1416(0xffffa78) # 1c0021d4 <soc_myputchar>
1c002760:	2a3f7ecc 	ld.bu	$r12,$r22,-33(0xfdf)
1c002764:	00150184 	move	$r4,$r12
1c002768:	57fa6fff 	bl	-1428(0xffffa6c) # 1c0021d4 <soc_myputchar>
1c00276c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002770:	40004d80 	beqz	$r12,76(0x4c) # 1c0027bc <soc_myprintf+0x3bc>
1c002774:	28bfb2ce 	ld.w	$r14,$r22,-20(0xfec)
1c002778:	02803c0d 	addi.w	$r13,$r0,15(0xf)
1c00277c:	0020b5cc 	mod.w	$r12,$r14,$r13
1c002780:	5c0009a0 	bne	$r13,$r0,8(0x8) # 1c002788 <soc_myprintf+0x388>
1c002784:	002a0007 	break	0x7
1c002788:	44003580 	bnez	$r12,52(0x34) # 1c0027bc <soc_myprintf+0x3bc>
1c00278c:	140000ac 	lu12i.w	$r12,5(0x5)
1c002790:	03accd8c 	ori	$r12,$r12,0xb33
1c002794:	29bf82cc 	st.w	$r12,$r22,-32(0xfe0)
1c002798:	50001400 	b	20(0x14) # 1c0027ac <soc_myprintf+0x3ac>
1c00279c:	03400000 	andi	$r0,$r0,0x0
1c0027a0:	03400000 	andi	$r0,$r0,0x0
1c0027a4:	03400000 	andi	$r0,$r0,0x0
1c0027a8:	03400000 	andi	$r0,$r0,0x0
1c0027ac:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c0027b0:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c0027b4:	29bf82cd 	st.w	$r13,$r22,-32(0xfe0)
1c0027b8:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c00279c <soc_myprintf+0x39c>
1c0027bc:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0027c0:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0027c4:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0027c8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0027cc:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c0027d0:	001031ac 	add.w	$r12,$r13,$r12
1c0027d4:	2800018c 	ld.b	$r12,$r12,0
1c0027d8:	47fc759f 	bnez	$r12,-908(0x7ffc74) # 1c00244c <soc_myprintf+0x4c>
1c0027dc:	0015000c 	move	$r12,$r0
1c0027e0:	00150184 	move	$r4,$r12
1c0027e4:	2880f061 	ld.w	$r1,$r3,60(0x3c)
1c0027e8:	2880e076 	ld.w	$r22,$r3,56(0x38)
1c0027ec:	02818063 	addi.w	$r3,$r3,96(0x60)
1c0027f0:	4c000020 	jirl	$r0,$r1,0

1c0027f4 <get_count>:
get_count():
1c0027f4:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0027f8:	29807076 	st.w	$r22,$r3,28(0x1c)
1c0027fc:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002800:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c002804:	0000600c 	rdtimel.w	$r12,$r0
1c002808:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c00280c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002810:	00150184 	move	$r4,$r12
1c002814:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c002818:	02808063 	addi.w	$r3,$r3,32(0x20)
1c00281c:	4c000020 	jirl	$r0,$r1,0

1c002820 <open_count>:
open_count():
1c002820:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c002824:	29803076 	st.w	$r22,$r3,12(0xc)
1c002828:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00282c:	0380400c 	ori	$r12,$r0,0x10
1c002830:	0402bd80 	csrxchg	$r0,$r12,0xaf
1c002834:	03400000 	andi	$r0,$r0,0x0
1c002838:	28803076 	ld.w	$r22,$r3,12(0xc)
1c00283c:	02804063 	addi.w	$r3,$r3,16(0x10)
1c002840:	4c000020 	jirl	$r0,$r1,0

1c002844 <close_count>:
close_count():
1c002844:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c002848:	29803076 	st.w	$r22,$r3,12(0xc)
1c00284c:	02804076 	addi.w	$r22,$r3,16(0x10)
1c002850:	0380400c 	ori	$r12,$r0,0x10
1c002854:	0402bd8c 	csrxchg	$r12,$r12,0xaf
1c002858:	03400000 	andi	$r0,$r0,0x0
1c00285c:	28803076 	ld.w	$r22,$r3,12(0xc)
1c002860:	02804063 	addi.w	$r3,$r3,16(0x10)
1c002864:	4c000020 	jirl	$r0,$r1,0

1c002868 <start_count>:
start_count():
1c002868:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c00286c:	29807061 	st.w	$r1,$r3,28(0x1c)
1c002870:	29806076 	st.w	$r22,$r3,24(0x18)
1c002874:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002878:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c00287c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002880:	29800180 	st.w	$r0,$r12,0
1c002884:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002888:	29801180 	st.w	$r0,$r12,4(0x4)
1c00288c:	57ff6bff 	bl	-152(0xfffff68) # 1c0027f4 <get_count>
1c002890:	0015008d 	move	$r13,$r4
1c002894:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002898:	2980018d 	st.w	$r13,$r12,0
1c00289c:	03400000 	andi	$r0,$r0,0x0
1c0028a0:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c0028a4:	28806076 	ld.w	$r22,$r3,24(0x18)
1c0028a8:	02808063 	addi.w	$r3,$r3,32(0x20)
1c0028ac:	4c000020 	jirl	$r0,$r1,0

1c0028b0 <stop_count>:
stop_count():
1c0028b0:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c0028b4:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c0028b8:	2980a076 	st.w	$r22,$r3,40(0x28)
1c0028bc:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c0028c0:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c0028c4:	57ff33ff 	bl	-208(0xfffff30) # 1c0027f4 <get_count>
1c0028c8:	0015008d 	move	$r13,$r4
1c0028cc:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0028d0:	2980118d 	st.w	$r13,$r12,4(0x4)
1c0028d4:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0028d8:	2880118d 	ld.w	$r13,$r12,4(0x4)
1c0028dc:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0028e0:	2880018c 	ld.w	$r12,$r12,0
1c0028e4:	68001dac 	bltu	$r13,$r12,28(0x1c) # 1c002900 <stop_count+0x50>
1c0028e8:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0028ec:	2880118d 	ld.w	$r13,$r12,4(0x4)
1c0028f0:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0028f4:	2880018c 	ld.w	$r12,$r12,0
1c0028f8:	001131ac 	sub.w	$r12,$r13,$r12
1c0028fc:	50002800 	b	40(0x28) # 1c002924 <stop_count+0x74>
1c002900:	02bffc0c 	addi.w	$r12,$r0,-1(0xfff)
1c002904:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c002908:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c00290c:	2880018c 	ld.w	$r12,$r12,0
1c002910:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c002914:	001131ad 	sub.w	$r13,$r13,$r12
1c002918:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c00291c:	2880118c 	ld.w	$r12,$r12,4(0x4)
1c002920:	001031ac 	add.w	$r12,$r13,$r12
1c002924:	00150184 	move	$r4,$r12
1c002928:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c00292c:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c002930:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c002934:	4c000020 	jirl	$r0,$r1,0

1c002938 <delay_cycle>:
delay_cycle():
1c002938:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c00293c:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c002940:	2980a076 	st.w	$r22,$r3,40(0x28)
1c002944:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c002948:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c00294c:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c002950:	29bf92c0 	st.w	$r0,$r22,-28(0xfe4)
1c002954:	29bfa2c0 	st.w	$r0,$r22,-24(0xfe8)
1c002958:	57fecbff 	bl	-312(0xffffec8) # 1c002820 <open_count>
1c00295c:	02bf92cc 	addi.w	$r12,$r22,-28(0xfe4)
1c002960:	00150184 	move	$r4,$r12
1c002964:	57ff07ff 	bl	-252(0xfffff04) # 1c002868 <start_count>
1c002968:	50001400 	b	20(0x14) # 1c00297c <delay_cycle+0x44>
1c00296c:	02bf92cc 	addi.w	$r12,$r22,-28(0xfe4)
1c002970:	00150184 	move	$r4,$r12
1c002974:	57ff3fff 	bl	-196(0xfffff3c) # 1c0028b0 <stop_count>
1c002978:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c00297c:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c002980:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c002984:	6bffe9ac 	bltu	$r13,$r12,-24(0x3ffe8) # 1c00296c <delay_cycle+0x34>
1c002988:	57febfff 	bl	-324(0xffffebc) # 1c002844 <close_count>
1c00298c:	03400000 	andi	$r0,$r0,0x0
1c002990:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c002994:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c002998:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c00299c:	4c000020 	jirl	$r0,$r1,0

1c0029a0 <delay_us>:
delay_us():
1c0029a0:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0029a4:	29807061 	st.w	$r1,$r3,28(0x1c)
1c0029a8:	29806076 	st.w	$r22,$r3,24(0x18)
1c0029ac:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0029b0:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c0029b4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0029b8:	00408d8c 	slli.w	$r12,$r12,0x3
1c0029bc:	00150184 	move	$r4,$r12
1c0029c0:	57ff7bff 	bl	-136(0xfffff78) # 1c002938 <delay_cycle>
1c0029c4:	03400000 	andi	$r0,$r0,0x0
1c0029c8:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c0029cc:	28806076 	ld.w	$r22,$r3,24(0x18)
1c0029d0:	02808063 	addi.w	$r3,$r3,32(0x20)
1c0029d4:	4c000020 	jirl	$r0,$r1,0

1c0029d8 <delay_ms>:
delay_ms():
1c0029d8:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0029dc:	29807061 	st.w	$r1,$r3,28(0x1c)
1c0029e0:	29806076 	st.w	$r22,$r3,24(0x18)
1c0029e4:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0029e8:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c0029ec:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c0029f0:	1400002c 	lu12i.w	$r12,1(0x1)
1c0029f4:	03bd018c 	ori	$r12,$r12,0xf40
1c0029f8:	001c31ac 	mul.w	$r12,$r13,$r12
1c0029fc:	00150184 	move	$r4,$r12
1c002a00:	57ff3bff 	bl	-200(0xfffff38) # 1c002938 <delay_cycle>
1c002a04:	03400000 	andi	$r0,$r0,0x0
1c002a08:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c002a0c:	28806076 	ld.w	$r22,$r3,24(0x18)
1c002a10:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002a14:	4c000020 	jirl	$r0,$r1,0

1c002a18 <delay_s>:
delay_s():
1c002a18:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002a1c:	29807061 	st.w	$r1,$r3,28(0x1c)
1c002a20:	29806076 	st.w	$r22,$r3,24(0x18)
1c002a24:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002a28:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c002a2c:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c002a30:	028fa00c 	addi.w	$r12,$r0,1000(0x3e8)
1c002a34:	001c31ac 	mul.w	$r12,$r13,$r12
1c002a38:	00150184 	move	$r4,$r12
1c002a3c:	57ff9fff 	bl	-100(0xfffff9c) # 1c0029d8 <delay_ms>
1c002a40:	03400000 	andi	$r0,$r0,0x0
1c002a44:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c002a48:	28806076 	ld.w	$r22,$r3,24(0x18)
1c002a4c:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002a50:	4c000020 	jirl	$r0,$r1,0

1c002a54 <strcmp>:
strcmp():
1c002a54:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002a58:	29807076 	st.w	$r22,$r3,28(0x1c)
1c002a5c:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002a60:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c002a64:	29bfa2c5 	st.w	$r5,$r22,-24(0xfe8)
1c002a68:	50002000 	b	32(0x20) # 1c002a88 <strcmp+0x34>
1c002a6c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002a70:	0280058d 	addi.w	$r13,$r12,1(0x1)
1c002a74:	29bfb2cd 	st.w	$r13,$r22,-20(0xfec)
1c002a78:	2800018c 	ld.b	$r12,$r12,0
1c002a7c:	44000d80 	bnez	$r12,12(0xc) # 1c002a88 <strcmp+0x34>
1c002a80:	0015000c 	move	$r12,$r0
1c002a84:	50004400 	b	68(0x44) # 1c002ac8 <strcmp+0x74>
1c002a88:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002a8c:	2800018d 	ld.b	$r13,$r12,0
1c002a90:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c002a94:	0280058e 	addi.w	$r14,$r12,1(0x1)
1c002a98:	29bfa2ce 	st.w	$r14,$r22,-24(0xfe8)
1c002a9c:	2800018c 	ld.b	$r12,$r12,0
1c002aa0:	5bffcdac 	beq	$r13,$r12,-52(0x3ffcc) # 1c002a6c <strcmp+0x18>
1c002aa4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002aa8:	2a00018c 	ld.bu	$r12,$r12,0
1c002aac:	0015018d 	move	$r13,$r12
1c002ab0:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c002ab4:	02bffd8c 	addi.w	$r12,$r12,-1(0xfff)
1c002ab8:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c002abc:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c002ac0:	2a00018c 	ld.bu	$r12,$r12,0
1c002ac4:	001131ac 	sub.w	$r12,$r13,$r12
1c002ac8:	00150184 	move	$r4,$r12
1c002acc:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c002ad0:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002ad4:	4c000020 	jirl	$r0,$r1,0

1c002ad8 <Set_Blood_1>:
Set_Blood_1():
1c002ad8:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002adc:	29807076 	st.w	$r22,$r3,28(0x1c)
1c002ae0:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002ae4:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c002ae8:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002aec:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c002af0:	2980218d 	st.w	$r13,$r12,8(0x8)
1c002af4:	03400000 	andi	$r0,$r0,0x0
1c002af8:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c002afc:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002b00:	4c000020 	jirl	$r0,$r1,0

1c002b04 <Set_Blood_2>:
Set_Blood_2():
1c002b04:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002b08:	29807076 	st.w	$r22,$r3,28(0x1c)
1c002b0c:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002b10:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c002b14:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002b18:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c002b1c:	2980318d 	st.w	$r13,$r12,12(0xc)
1c002b20:	03400000 	andi	$r0,$r0,0x0
1c002b24:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c002b28:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002b2c:	4c000020 	jirl	$r0,$r1,0

1c002b30 <Set_Energy_1>:
Set_Energy_1():
1c002b30:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002b34:	29807076 	st.w	$r22,$r3,28(0x1c)
1c002b38:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002b3c:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c002b40:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002b44:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c002b48:	2980418d 	st.w	$r13,$r12,16(0x10)
1c002b4c:	03400000 	andi	$r0,$r0,0x0
1c002b50:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c002b54:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002b58:	4c000020 	jirl	$r0,$r1,0

1c002b5c <Set_Energy_2>:
Set_Energy_2():
1c002b5c:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002b60:	29807076 	st.w	$r22,$r3,28(0x1c)
1c002b64:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002b68:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c002b6c:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002b70:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c002b74:	2980518d 	st.w	$r13,$r12,20(0x14)
1c002b78:	03400000 	andi	$r0,$r0,0x0
1c002b7c:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c002b80:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002b84:	4c000020 	jirl	$r0,$r1,0

1c002b88 <Set_Energy_count_1>:
Set_Energy_count_1():
1c002b88:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002b8c:	29807076 	st.w	$r22,$r3,28(0x1c)
1c002b90:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002b94:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c002b98:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002b9c:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c002ba0:	2980618d 	st.w	$r13,$r12,24(0x18)
1c002ba4:	03400000 	andi	$r0,$r0,0x0
1c002ba8:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c002bac:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002bb0:	4c000020 	jirl	$r0,$r1,0

1c002bb4 <Set_Energy_count_2>:
Set_Energy_count_2():
1c002bb4:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002bb8:	29807076 	st.w	$r22,$r3,28(0x1c)
1c002bbc:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002bc0:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c002bc4:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002bc8:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c002bcc:	2980718d 	st.w	$r13,$r12,28(0x1c)
1c002bd0:	03400000 	andi	$r0,$r0,0x0
1c002bd4:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c002bd8:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002bdc:	4c000020 	jirl	$r0,$r1,0

1c002be0 <Set_Player1_x>:
Set_Player1_x():
1c002be0:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002be4:	29807076 	st.w	$r22,$r3,28(0x1c)
1c002be8:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002bec:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c002bf0:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002bf4:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c002bf8:	2980818d 	st.w	$r13,$r12,32(0x20)
1c002bfc:	03400000 	andi	$r0,$r0,0x0
1c002c00:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c002c04:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002c08:	4c000020 	jirl	$r0,$r1,0

1c002c0c <Set_Player1_y>:
Set_Player1_y():
1c002c0c:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002c10:	29807076 	st.w	$r22,$r3,28(0x1c)
1c002c14:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002c18:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c002c1c:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002c20:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c002c24:	2980918d 	st.w	$r13,$r12,36(0x24)
1c002c28:	03400000 	andi	$r0,$r0,0x0
1c002c2c:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c002c30:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002c34:	4c000020 	jirl	$r0,$r1,0

1c002c38 <Set_Prop1_y>:
Set_Prop1_y():
1c002c38:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002c3c:	29807076 	st.w	$r22,$r3,28(0x1c)
1c002c40:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002c44:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c002c48:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002c4c:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c002c50:	2980b18d 	st.w	$r13,$r12,44(0x2c)
1c002c54:	03400000 	andi	$r0,$r0,0x0
1c002c58:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c002c5c:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002c60:	4c000020 	jirl	$r0,$r1,0

1c002c64 <Set_Player2_x>:
Set_Player2_x():
1c002c64:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002c68:	29807076 	st.w	$r22,$r3,28(0x1c)
1c002c6c:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002c70:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c002c74:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002c78:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c002c7c:	2980c18d 	st.w	$r13,$r12,48(0x30)
1c002c80:	03400000 	andi	$r0,$r0,0x0
1c002c84:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c002c88:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002c8c:	4c000020 	jirl	$r0,$r1,0

1c002c90 <Set_Player2_y>:
Set_Player2_y():
1c002c90:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002c94:	29807076 	st.w	$r22,$r3,28(0x1c)
1c002c98:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002c9c:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c002ca0:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002ca4:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c002ca8:	2980d18d 	st.w	$r13,$r12,52(0x34)
1c002cac:	03400000 	andi	$r0,$r0,0x0
1c002cb0:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c002cb4:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002cb8:	4c000020 	jirl	$r0,$r1,0

1c002cbc <Set_Prop2_x>:
Set_Prop2_x():
1c002cbc:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002cc0:	29807076 	st.w	$r22,$r3,28(0x1c)
1c002cc4:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002cc8:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c002ccc:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002cd0:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c002cd4:	2980e18d 	st.w	$r13,$r12,56(0x38)
1c002cd8:	03400000 	andi	$r0,$r0,0x0
1c002cdc:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c002ce0:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002ce4:	4c000020 	jirl	$r0,$r1,0

1c002ce8 <Set_Prop2_y>:
Set_Prop2_y():
1c002ce8:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002cec:	29807076 	st.w	$r22,$r3,28(0x1c)
1c002cf0:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002cf4:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c002cf8:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002cfc:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c002d00:	2980f18d 	st.w	$r13,$r12,60(0x3c)
1c002d04:	03400000 	andi	$r0,$r0,0x0
1c002d08:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c002d0c:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002d10:	4c000020 	jirl	$r0,$r1,0

1c002d14 <Set_Player1_direction>:
Set_Player1_direction():
1c002d14:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002d18:	29807076 	st.w	$r22,$r3,28(0x1c)
1c002d1c:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002d20:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c002d24:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002d28:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c002d2c:	2981018d 	st.w	$r13,$r12,64(0x40)
1c002d30:	03400000 	andi	$r0,$r0,0x0
1c002d34:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c002d38:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002d3c:	4c000020 	jirl	$r0,$r1,0

1c002d40 <Set_Player2_direction>:
Set_Player2_direction():
1c002d40:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002d44:	29807076 	st.w	$r22,$r3,28(0x1c)
1c002d48:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002d4c:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c002d50:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002d54:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c002d58:	2981118d 	st.w	$r13,$r12,68(0x44)
1c002d5c:	03400000 	andi	$r0,$r0,0x0
1c002d60:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c002d64:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002d68:	4c000020 	jirl	$r0,$r1,0

1c002d6c <Set_Audio>:
Set_Audio():
1c002d6c:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002d70:	29807076 	st.w	$r22,$r3,28(0x1c)
1c002d74:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002d78:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c002d7c:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c002d80:	0280340c 	addi.w	$r12,$r0,13(0xd)
1c002d84:	6800f18d 	bltu	$r12,$r13,240(0xf0) # 1c002e74 <Set_Audio+0x108>
1c002d88:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002d8c:	0040898d 	slli.w	$r13,$r12,0x2
1c002d90:	1c00010c 	pcaddu12i	$r12,8(0x8)
1c002d94:	0291b18c 	addi.w	$r12,$r12,1132(0x46c)
1c002d98:	001031ac 	add.w	$r12,$r13,$r12
1c002d9c:	2880018c 	ld.w	$r12,$r12,0
1c002da0:	4c000180 	jirl	$r0,$r12,0
1c002da4:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002da8:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c002dac:	2982618d 	st.w	$r13,$r12,152(0x98)
1c002db0:	5000c800 	b	200(0xc8) # 1c002e78 <Set_Audio+0x10c>
1c002db4:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002db8:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c002dbc:	2982718d 	st.w	$r13,$r12,156(0x9c)
1c002dc0:	5000b800 	b	184(0xb8) # 1c002e78 <Set_Audio+0x10c>
1c002dc4:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002dc8:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c002dcc:	2982818d 	st.w	$r13,$r12,160(0xa0)
1c002dd0:	5000a800 	b	168(0xa8) # 1c002e78 <Set_Audio+0x10c>
1c002dd4:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002dd8:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c002ddc:	2982918d 	st.w	$r13,$r12,164(0xa4)
1c002de0:	50009800 	b	152(0x98) # 1c002e78 <Set_Audio+0x10c>
1c002de4:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002de8:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c002dec:	2982a18d 	st.w	$r13,$r12,168(0xa8)
1c002df0:	50008800 	b	136(0x88) # 1c002e78 <Set_Audio+0x10c>
1c002df4:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002df8:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c002dfc:	2982b18d 	st.w	$r13,$r12,172(0xac)
1c002e00:	50007800 	b	120(0x78) # 1c002e78 <Set_Audio+0x10c>
1c002e04:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002e08:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c002e0c:	2982c18d 	st.w	$r13,$r12,176(0xb0)
1c002e10:	50006800 	b	104(0x68) # 1c002e78 <Set_Audio+0x10c>
1c002e14:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002e18:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c002e1c:	2982d18d 	st.w	$r13,$r12,180(0xb4)
1c002e20:	50005800 	b	88(0x58) # 1c002e78 <Set_Audio+0x10c>
1c002e24:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002e28:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c002e2c:	2982e18d 	st.w	$r13,$r12,184(0xb8)
1c002e30:	50004800 	b	72(0x48) # 1c002e78 <Set_Audio+0x10c>
1c002e34:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002e38:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c002e3c:	2982f18d 	st.w	$r13,$r12,188(0xbc)
1c002e40:	50003800 	b	56(0x38) # 1c002e78 <Set_Audio+0x10c>
1c002e44:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002e48:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c002e4c:	2983018d 	st.w	$r13,$r12,192(0xc0)
1c002e50:	50002800 	b	40(0x28) # 1c002e78 <Set_Audio+0x10c>
1c002e54:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002e58:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c002e5c:	2983118d 	st.w	$r13,$r12,196(0xc4)
1c002e60:	50001800 	b	24(0x18) # 1c002e78 <Set_Audio+0x10c>
1c002e64:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002e68:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c002e6c:	2983218d 	st.w	$r13,$r12,200(0xc8)
1c002e70:	50000800 	b	8(0x8) # 1c002e78 <Set_Audio+0x10c>
1c002e74:	03400000 	andi	$r0,$r0,0x0
1c002e78:	03400000 	andi	$r0,$r0,0x0
1c002e7c:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c002e80:	02808063 	addi.w	$r3,$r3,32(0x20)
1c002e84:	4c000020 	jirl	$r0,$r1,0

1c002e88 <Set_video>:
Set_video():
1c002e88:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c002e8c:	29807076 	st.w	$r22,$r3,28(0x1c)
1c002e90:	02808076 	addi.w	$r22,$r3,32(0x20)
1c002e94:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c002e98:	29bfa2c5 	st.w	$r5,$r22,-24(0xfe8)
1c002e9c:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c002ea0:	0280500c 	addi.w	$r12,$r0,20(0x14)
1c002ea4:	6801618d 	bltu	$r12,$r13,352(0x160) # 1c003004 <Set_video+0x17c>
1c002ea8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c002eac:	0040898d 	slli.w	$r13,$r12,0x2
1c002eb0:	1c00010c 	pcaddu12i	$r12,8(0x8)
1c002eb4:	028e118c 	addi.w	$r12,$r12,900(0x384)
1c002eb8:	001031ac 	add.w	$r12,$r13,$r12
1c002ebc:	2880018c 	ld.w	$r12,$r12,0
1c002ec0:	4c000180 	jirl	$r0,$r12,0
1c002ec4:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002ec8:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c002ecc:	2981218d 	st.w	$r13,$r12,72(0x48)
1c002ed0:	50013800 	b	312(0x138) # 1c003008 <Set_video+0x180>
1c002ed4:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002ed8:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c002edc:	2981318d 	st.w	$r13,$r12,76(0x4c)
1c002ee0:	50012800 	b	296(0x128) # 1c003008 <Set_video+0x180>
1c002ee4:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002ee8:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c002eec:	2981418d 	st.w	$r13,$r12,80(0x50)
1c002ef0:	50011800 	b	280(0x118) # 1c003008 <Set_video+0x180>
1c002ef4:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002ef8:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c002efc:	2981518d 	st.w	$r13,$r12,84(0x54)
1c002f00:	50010800 	b	264(0x108) # 1c003008 <Set_video+0x180>
1c002f04:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002f08:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c002f0c:	2981618d 	st.w	$r13,$r12,88(0x58)
1c002f10:	5000f800 	b	248(0xf8) # 1c003008 <Set_video+0x180>
1c002f14:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002f18:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c002f1c:	2981718d 	st.w	$r13,$r12,92(0x5c)
1c002f20:	5000e800 	b	232(0xe8) # 1c003008 <Set_video+0x180>
1c002f24:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002f28:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c002f2c:	2981818d 	st.w	$r13,$r12,96(0x60)
1c002f30:	5000d800 	b	216(0xd8) # 1c003008 <Set_video+0x180>
1c002f34:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002f38:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c002f3c:	2981918d 	st.w	$r13,$r12,100(0x64)
1c002f40:	5000c800 	b	200(0xc8) # 1c003008 <Set_video+0x180>
1c002f44:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002f48:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c002f4c:	2981a18d 	st.w	$r13,$r12,104(0x68)
1c002f50:	5000b800 	b	184(0xb8) # 1c003008 <Set_video+0x180>
1c002f54:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002f58:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c002f5c:	2981b18d 	st.w	$r13,$r12,108(0x6c)
1c002f60:	5000a800 	b	168(0xa8) # 1c003008 <Set_video+0x180>
1c002f64:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002f68:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c002f6c:	2981c18d 	st.w	$r13,$r12,112(0x70)
1c002f70:	50009800 	b	152(0x98) # 1c003008 <Set_video+0x180>
1c002f74:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002f78:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c002f7c:	2981d18d 	st.w	$r13,$r12,116(0x74)
1c002f80:	50008800 	b	136(0x88) # 1c003008 <Set_video+0x180>
1c002f84:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002f88:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c002f8c:	2981e18d 	st.w	$r13,$r12,120(0x78)
1c002f90:	50007800 	b	120(0x78) # 1c003008 <Set_video+0x180>
1c002f94:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002f98:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c002f9c:	2981f18d 	st.w	$r13,$r12,124(0x7c)
1c002fa0:	50006800 	b	104(0x68) # 1c003008 <Set_video+0x180>
1c002fa4:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002fa8:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c002fac:	2982018d 	st.w	$r13,$r12,128(0x80)
1c002fb0:	50005800 	b	88(0x58) # 1c003008 <Set_video+0x180>
1c002fb4:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002fb8:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c002fbc:	2982118d 	st.w	$r13,$r12,132(0x84)
1c002fc0:	50004800 	b	72(0x48) # 1c003008 <Set_video+0x180>
1c002fc4:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002fc8:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c002fcc:	2982218d 	st.w	$r13,$r12,136(0x88)
1c002fd0:	50003800 	b	56(0x38) # 1c003008 <Set_video+0x180>
1c002fd4:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002fd8:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c002fdc:	2982318d 	st.w	$r13,$r12,140(0x8c)
1c002fe0:	50002800 	b	40(0x28) # 1c003008 <Set_video+0x180>
1c002fe4:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002fe8:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c002fec:	2982418d 	st.w	$r13,$r12,144(0x90)
1c002ff0:	50001800 	b	24(0x18) # 1c003008 <Set_video+0x180>
1c002ff4:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c002ff8:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c002ffc:	2982518d 	st.w	$r13,$r12,148(0x94)
1c003000:	50000800 	b	8(0x8) # 1c003008 <Set_video+0x180>
1c003004:	03400000 	andi	$r0,$r0,0x0
1c003008:	03400000 	andi	$r0,$r0,0x0
1c00300c:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c003010:	02808063 	addi.w	$r3,$r3,32(0x20)
1c003014:	4c000020 	jirl	$r0,$r1,0

1c003018 <Read_Key_output>:
Read_Key_output():
1c003018:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c00301c:	29807076 	st.w	$r22,$r3,28(0x1c)
1c003020:	02808076 	addi.w	$r22,$r3,32(0x20)
1c003024:	157fde0c 	lu12i.w	$r12,-262416(0xbfef0)
1c003028:	2883a18c 	ld.w	$r12,$r12,232(0xe8)
1c00302c:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c003030:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003034:	00150184 	move	$r4,$r12
1c003038:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c00303c:	02808063 	addi.w	$r3,$r3,32(0x20)
1c003040:	4c000020 	jirl	$r0,$r1,0

1c003044 <Rtc_Read>:
Rtc_Read():
1c003044:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c003048:	2980b076 	st.w	$r22,$r3,44(0x2c)
1c00304c:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c003050:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c003054:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c003058:	29bfa2c0 	st.w	$r0,$r22,-24(0xfe8)
1c00305c:	157fd70c 	lu12i.w	$r12,-262472(0xbfeb8)
1c003060:	0380318c 	ori	$r12,$r12,0xc
1c003064:	2880018c 	ld.w	$r12,$r12,0
1c003068:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c00306c:	157fd70c 	lu12i.w	$r12,-262472(0xbfeb8)
1c003070:	0380218c 	ori	$r12,$r12,0x8
1c003074:	2880018c 	ld.w	$r12,$r12,0
1c003078:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c00307c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003080:	0044a58c 	srli.w	$r12,$r12,0x9
1c003084:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c003088:	0341fd8c 	andi	$r12,$r12,0x7f
1c00308c:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c003090:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003094:	2900158d 	st.b	$r13,$r12,5(0x5)
1c003098:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00309c:	0044958c 	srli.w	$r12,$r12,0x5
1c0030a0:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0030a4:	03403d8c 	andi	$r12,$r12,0xf
1c0030a8:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c0030ac:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0030b0:	2900118d 	st.b	$r13,$r12,4(0x4)
1c0030b4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0030b8:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0030bc:	03407d8c 	andi	$r12,$r12,0x1f
1c0030c0:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c0030c4:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0030c8:	29000d8d 	st.b	$r13,$r12,3(0x3)
1c0030cc:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0030d0:	0044c18c 	srli.w	$r12,$r12,0x10
1c0030d4:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0030d8:	03407d8c 	andi	$r12,$r12,0x1f
1c0030dc:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c0030e0:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0030e4:	2900098d 	st.b	$r13,$r12,2(0x2)
1c0030e8:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0030ec:	0044a98c 	srli.w	$r12,$r12,0xa
1c0030f0:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0030f4:	0340fd8c 	andi	$r12,$r12,0x3f
1c0030f8:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c0030fc:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003100:	2900058d 	st.b	$r13,$r12,1(0x1)
1c003104:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c003108:	0044918c 	srli.w	$r12,$r12,0x4
1c00310c:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c003110:	0340fd8c 	andi	$r12,$r12,0x3f
1c003114:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c003118:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c00311c:	2900018d 	st.b	$r13,$r12,0
1c003120:	03400000 	andi	$r0,$r0,0x0
1c003124:	2880b076 	ld.w	$r22,$r3,44(0x2c)
1c003128:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c00312c:	4c000020 	jirl	$r0,$r1,0

1c003130 <Rtc_Write>:
Rtc_Write():
1c003130:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c003134:	29807076 	st.w	$r22,$r3,28(0x1c)
1c003138:	02808076 	addi.w	$r22,$r3,32(0x20)
1c00313c:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c003140:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003144:	2a00118d 	ld.bu	$r13,$r12,4(0x4)
1c003148:	0280300c 	addi.w	$r12,$r0,12(0xc)
1c00314c:	6800118d 	bltu	$r12,$r13,16(0x10) # 1c00315c <Rtc_Write+0x2c>
1c003150:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003154:	2a00118c 	ld.bu	$r12,$r12,4(0x4)
1c003158:	44001180 	bnez	$r12,16(0x10) # 1c003168 <Rtc_Write+0x38>
1c00315c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003160:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c003164:	2900118d 	st.b	$r13,$r12,4(0x4)
1c003168:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00316c:	2a000d8d 	ld.bu	$r13,$r12,3(0x3)
1c003170:	02807c0c 	addi.w	$r12,$r0,31(0x1f)
1c003174:	6800118d 	bltu	$r12,$r13,16(0x10) # 1c003184 <Rtc_Write+0x54>
1c003178:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00317c:	2a000d8c 	ld.bu	$r12,$r12,3(0x3)
1c003180:	44001180 	bnez	$r12,16(0x10) # 1c003190 <Rtc_Write+0x60>
1c003184:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003188:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c00318c:	29000d8d 	st.b	$r13,$r12,3(0x3)
1c003190:	157fd70c 	lu12i.w	$r12,-262472(0xbfeb8)
1c003194:	1410000d 	lu12i.w	$r13,32768(0x8000)
1c003198:	2980018d 	st.w	$r13,$r12,0
1c00319c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0031a0:	2a00098d 	ld.bu	$r13,$r12,2(0x2)
1c0031a4:	0280600c 	addi.w	$r12,$r0,24(0x18)
1c0031a8:	0021b1ae 	mod.wu	$r14,$r13,$r12
1c0031ac:	5c000980 	bne	$r12,$r0,8(0x8) # 1c0031b4 <Rtc_Write+0x84>
1c0031b0:	002a0007 	break	0x7
1c0031b4:	006781cc 	bstrpick.w	$r12,$r14,0x7,0x0
1c0031b8:	0040c18d 	slli.w	$r13,$r12,0x10
1c0031bc:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0031c0:	2a00058e 	ld.bu	$r14,$r12,1(0x1)
1c0031c4:	0280f00c 	addi.w	$r12,$r0,60(0x3c)
1c0031c8:	0021b1cf 	mod.wu	$r15,$r14,$r12
1c0031cc:	5c000980 	bne	$r12,$r0,8(0x8) # 1c0031d4 <Rtc_Write+0xa4>
1c0031d0:	002a0007 	break	0x7
1c0031d4:	006781ec 	bstrpick.w	$r12,$r15,0x7,0x0
1c0031d8:	0040a98c 	slli.w	$r12,$r12,0xa
1c0031dc:	001531ad 	or	$r13,$r13,$r12
1c0031e0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0031e4:	2a00018e 	ld.bu	$r14,$r12,0
1c0031e8:	0280f00c 	addi.w	$r12,$r0,60(0x3c)
1c0031ec:	0021b1cf 	mod.wu	$r15,$r14,$r12
1c0031f0:	5c000980 	bne	$r12,$r0,8(0x8) # 1c0031f8 <Rtc_Write+0xc8>
1c0031f4:	002a0007 	break	0x7
1c0031f8:	006781ec 	bstrpick.w	$r12,$r15,0x7,0x0
1c0031fc:	0040918c 	slli.w	$r12,$r12,0x4
1c003200:	001531ac 	or	$r12,$r13,$r12
1c003204:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c003208:	2a0019ae 	ld.bu	$r14,$r13,6(0x6)
1c00320c:	0281900d 	addi.w	$r13,$r0,100(0x64)
1c003210:	0021b5cf 	mod.wu	$r15,$r14,$r13
1c003214:	5c0009a0 	bne	$r13,$r0,8(0x8) # 1c00321c <Rtc_Write+0xec>
1c003218:	002a0007 	break	0x7
1c00321c:	006781ed 	bstrpick.w	$r13,$r15,0x7,0x0
1c003220:	0015358d 	or	$r13,$r12,$r13
1c003224:	157fd70c 	lu12i.w	$r12,-262472(0xbfeb8)
1c003228:	0380218c 	ori	$r12,$r12,0x8
1c00322c:	2980018d 	st.w	$r13,$r12,0
1c003230:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003234:	2a00158c 	ld.bu	$r12,$r12,5(0x5)
1c003238:	0040a58d 	slli.w	$r13,$r12,0x9
1c00323c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003240:	2a00118e 	ld.bu	$r14,$r12,4(0x4)
1c003244:	0280340c 	addi.w	$r12,$r0,13(0xd)
1c003248:	0021b1cf 	mod.wu	$r15,$r14,$r12
1c00324c:	5c000980 	bne	$r12,$r0,8(0x8) # 1c003254 <Rtc_Write+0x124>
1c003250:	002a0007 	break	0x7
1c003254:	006781ec 	bstrpick.w	$r12,$r15,0x7,0x0
1c003258:	0040958c 	slli.w	$r12,$r12,0x5
1c00325c:	001531ad 	or	$r13,$r13,$r12
1c003260:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003264:	2a000d8c 	ld.bu	$r12,$r12,3(0x3)
1c003268:	03407d8c 	andi	$r12,$r12,0x1f
1c00326c:	001531ad 	or	$r13,$r13,$r12
1c003270:	157fd70c 	lu12i.w	$r12,-262472(0xbfeb8)
1c003274:	0380318c 	ori	$r12,$r12,0xc
1c003278:	2980018d 	st.w	$r13,$r12,0
1c00327c:	157fd70c 	lu12i.w	$r12,-262472(0xbfeb8)
1c003280:	0380118c 	ori	$r12,$r12,0x4
1c003284:	1500000d 	lu12i.w	$r13,-524288(0x80000)
1c003288:	2980018d 	st.w	$r13,$r12,0
1c00328c:	03400000 	andi	$r0,$r0,0x0
1c003290:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c003294:	02808063 	addi.w	$r3,$r3,32(0x20)
1c003298:	4c000020 	jirl	$r0,$r1,0

1c00329c <RtcUpdateData>:
RtcUpdateData():
1c00329c:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0032a0:	29807061 	st.w	$r1,$r3,28(0x1c)
1c0032a4:	29806076 	st.w	$r22,$r3,24(0x18)
1c0032a8:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0032ac:	0015008c 	move	$r12,$r4
1c0032b0:	29bfa2c5 	st.w	$r5,$r22,-24(0xfe8)
1c0032b4:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c0032b8:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c0032bc:	40001180 	beqz	$r12,16(0x10) # 1c0032cc <RtcUpdateData+0x30>
1c0032c0:	28bfa2c4 	ld.w	$r4,$r22,-24(0xfe8)
1c0032c4:	57fd83ff 	bl	-640(0xffffd80) # 1c003044 <Rtc_Read>
1c0032c8:	50000c00 	b	12(0xc) # 1c0032d4 <RtcUpdateData+0x38>
1c0032cc:	28bfa2c4 	ld.w	$r4,$r22,-24(0xfe8)
1c0032d0:	57fe63ff 	bl	-416(0xffffe60) # 1c003130 <Rtc_Write>
1c0032d4:	03400000 	andi	$r0,$r0,0x0
1c0032d8:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c0032dc:	28806076 	ld.w	$r22,$r3,24(0x18)
1c0032e0:	02808063 	addi.w	$r3,$r3,32(0x20)
1c0032e4:	4c000020 	jirl	$r0,$r1,0

1c0032e8 <gpio_init>:
gpio_init():
1c0032e8:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c0032ec:	2980b076 	st.w	$r22,$r3,44(0x2c)
1c0032f0:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c0032f4:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c0032f8:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c0032fc:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c003300:	02807c0c 	addi.w	$r12,$r0,31(0x1f)
1c003304:	6000698d 	blt	$r12,$r13,104(0x68) # 1c00336c <gpio_init+0x84>
1c003308:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c00330c:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c003310:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c003314:	44003180 	bnez	$r12,48(0x30) # 1c003344 <gpio_init+0x5c>
1c003318:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00331c:	2881018d 	ld.w	$r13,$r12,64(0x40)
1c003320:	0280040e 	addi.w	$r14,$r0,1(0x1)
1c003324:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003328:	001731cc 	sll.w	$r12,$r14,$r12
1c00332c:	0014300c 	nor	$r12,$r0,$r12
1c003330:	0015018e 	move	$r14,$r12
1c003334:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c003338:	0014b9ad 	and	$r13,$r13,$r14
1c00333c:	2981018d 	st.w	$r13,$r12,64(0x40)
1c003340:	50009000 	b	144(0x90) # 1c0033d0 <gpio_init+0xe8>
1c003344:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c003348:	2881018d 	ld.w	$r13,$r12,64(0x40)
1c00334c:	0280040e 	addi.w	$r14,$r0,1(0x1)
1c003350:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003354:	001731cc 	sll.w	$r12,$r14,$r12
1c003358:	0015018e 	move	$r14,$r12
1c00335c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c003360:	001539ad 	or	$r13,$r13,$r14
1c003364:	2981018d 	st.w	$r13,$r12,64(0x40)
1c003368:	50006800 	b	104(0x68) # 1c0033d0 <gpio_init+0xe8>
1c00336c:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003370:	02bf818c 	addi.w	$r12,$r12,-32(0xfe0)
1c003374:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c003378:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c00337c:	44003180 	bnez	$r12,48(0x30) # 1c0033ac <gpio_init+0xc4>
1c003380:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c003384:	2881418d 	ld.w	$r13,$r12,80(0x50)
1c003388:	0280040e 	addi.w	$r14,$r0,1(0x1)
1c00338c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003390:	001731cc 	sll.w	$r12,$r14,$r12
1c003394:	0014300c 	nor	$r12,$r0,$r12
1c003398:	0015018e 	move	$r14,$r12
1c00339c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0033a0:	0014b9ad 	and	$r13,$r13,$r14
1c0033a4:	2981418d 	st.w	$r13,$r12,80(0x50)
1c0033a8:	50002800 	b	40(0x28) # 1c0033d0 <gpio_init+0xe8>
1c0033ac:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0033b0:	2881418d 	ld.w	$r13,$r12,80(0x50)
1c0033b4:	0280040e 	addi.w	$r14,$r0,1(0x1)
1c0033b8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0033bc:	001731cc 	sll.w	$r12,$r14,$r12
1c0033c0:	0015018e 	move	$r14,$r12
1c0033c4:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0033c8:	001539ad 	or	$r13,$r13,$r14
1c0033cc:	2981418d 	st.w	$r13,$r12,80(0x50)
1c0033d0:	03400000 	andi	$r0,$r0,0x0
1c0033d4:	2880b076 	ld.w	$r22,$r3,44(0x2c)
1c0033d8:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c0033dc:	4c000020 	jirl	$r0,$r1,0

1c0033e0 <gpio_write>:
gpio_write():
1c0033e0:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c0033e4:	2980b076 	st.w	$r22,$r3,44(0x2c)
1c0033e8:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c0033ec:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c0033f0:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c0033f4:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c0033f8:	02807c0c 	addi.w	$r12,$r0,31(0x1f)
1c0033fc:	6000698d 	blt	$r12,$r13,104(0x68) # 1c003464 <gpio_write+0x84>
1c003400:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003404:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c003408:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c00340c:	44003180 	bnez	$r12,48(0x30) # 1c00343c <gpio_write+0x5c>
1c003410:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c003414:	2881118d 	ld.w	$r13,$r12,68(0x44)
1c003418:	0280040e 	addi.w	$r14,$r0,1(0x1)
1c00341c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003420:	001731cc 	sll.w	$r12,$r14,$r12
1c003424:	0014300c 	nor	$r12,$r0,$r12
1c003428:	0015018e 	move	$r14,$r12
1c00342c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c003430:	0014b9ad 	and	$r13,$r13,$r14
1c003434:	2981118d 	st.w	$r13,$r12,68(0x44)
1c003438:	50009000 	b	144(0x90) # 1c0034c8 <gpio_write+0xe8>
1c00343c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c003440:	2881118d 	ld.w	$r13,$r12,68(0x44)
1c003444:	0280040e 	addi.w	$r14,$r0,1(0x1)
1c003448:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00344c:	001731cc 	sll.w	$r12,$r14,$r12
1c003450:	0015018e 	move	$r14,$r12
1c003454:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c003458:	001539ad 	or	$r13,$r13,$r14
1c00345c:	2981118d 	st.w	$r13,$r12,68(0x44)
1c003460:	50006800 	b	104(0x68) # 1c0034c8 <gpio_write+0xe8>
1c003464:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003468:	02bf818c 	addi.w	$r12,$r12,-32(0xfe0)
1c00346c:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c003470:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c003474:	44003180 	bnez	$r12,48(0x30) # 1c0034a4 <gpio_write+0xc4>
1c003478:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00347c:	2881518d 	ld.w	$r13,$r12,84(0x54)
1c003480:	0280040e 	addi.w	$r14,$r0,1(0x1)
1c003484:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003488:	001731cc 	sll.w	$r12,$r14,$r12
1c00348c:	0014300c 	nor	$r12,$r0,$r12
1c003490:	0015018e 	move	$r14,$r12
1c003494:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c003498:	0014b9ad 	and	$r13,$r13,$r14
1c00349c:	2981518d 	st.w	$r13,$r12,84(0x54)
1c0034a0:	50002800 	b	40(0x28) # 1c0034c8 <gpio_write+0xe8>
1c0034a4:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0034a8:	2881518d 	ld.w	$r13,$r12,84(0x54)
1c0034ac:	0280040e 	addi.w	$r14,$r0,1(0x1)
1c0034b0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0034b4:	001731cc 	sll.w	$r12,$r14,$r12
1c0034b8:	0015018e 	move	$r14,$r12
1c0034bc:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0034c0:	001539ad 	or	$r13,$r13,$r14
1c0034c4:	2981518d 	st.w	$r13,$r12,84(0x54)
1c0034c8:	03400000 	andi	$r0,$r0,0x0
1c0034cc:	2880b076 	ld.w	$r22,$r3,44(0x2c)
1c0034d0:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c0034d4:	4c000020 	jirl	$r0,$r1,0

1c0034d8 <gpio_read>:
gpio_read():
1c0034d8:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c0034dc:	2980b076 	st.w	$r22,$r3,44(0x2c)
1c0034e0:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c0034e4:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c0034e8:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c0034ec:	02807c0c 	addi.w	$r12,$r0,31(0x1f)
1c0034f0:	6000458d 	blt	$r12,$r13,68(0x44) # 1c003534 <gpio_read+0x5c>
1c0034f4:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0034f8:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0034fc:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c003500:	2881218c 	ld.w	$r12,$r12,72(0x48)
1c003504:	0280040e 	addi.w	$r14,$r0,1(0x1)
1c003508:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c00350c:	001735cd 	sll.w	$r13,$r14,$r13
1c003510:	0014b58c 	and	$r12,$r12,$r13
1c003514:	0280040e 	addi.w	$r14,$r0,1(0x1)
1c003518:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c00351c:	001735cd 	sll.w	$r13,$r14,$r13
1c003520:	5c000d8d 	bne	$r12,$r13,12(0xc) # 1c00352c <gpio_read+0x54>
1c003524:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c003528:	50004c00 	b	76(0x4c) # 1c003574 <gpio_read+0x9c>
1c00352c:	0015000c 	move	$r12,$r0
1c003530:	50004400 	b	68(0x44) # 1c003574 <gpio_read+0x9c>
1c003534:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003538:	02bf818c 	addi.w	$r12,$r12,-32(0xfe0)
1c00353c:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c003540:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c003544:	2881618c 	ld.w	$r12,$r12,88(0x58)
1c003548:	0280040e 	addi.w	$r14,$r0,1(0x1)
1c00354c:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c003550:	001735cd 	sll.w	$r13,$r14,$r13
1c003554:	0014b58c 	and	$r12,$r12,$r13
1c003558:	0280040e 	addi.w	$r14,$r0,1(0x1)
1c00355c:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c003560:	001735cd 	sll.w	$r13,$r14,$r13
1c003564:	5c000d8d 	bne	$r12,$r13,12(0xc) # 1c003570 <gpio_read+0x98>
1c003568:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c00356c:	50000800 	b	8(0x8) # 1c003574 <gpio_read+0x9c>
1c003570:	0015000c 	move	$r12,$r0
1c003574:	00150184 	move	$r4,$r12
1c003578:	2880b076 	ld.w	$r22,$r3,44(0x2c)
1c00357c:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c003580:	4c000020 	jirl	$r0,$r1,0

1c003584 <PS2_Init>:
PS2_Init():
1c003584:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c003588:	29803061 	st.w	$r1,$r3,12(0xc)
1c00358c:	29802076 	st.w	$r22,$r3,8(0x8)
1c003590:	02804076 	addi.w	$r22,$r3,16(0x10)
1c003594:	00150005 	move	$r5,$r0
1c003598:	02800404 	addi.w	$r4,$r0,1(0x1)
1c00359c:	57fd4fff 	bl	-692(0xffffd4c) # 1c0032e8 <gpio_init>
1c0035a0:	02800405 	addi.w	$r5,$r0,1(0x1)
1c0035a4:	02803404 	addi.w	$r4,$r0,13(0xd)
1c0035a8:	57fd43ff 	bl	-704(0xffffd40) # 1c0032e8 <gpio_init>
1c0035ac:	02800405 	addi.w	$r5,$r0,1(0x1)
1c0035b0:	02804804 	addi.w	$r4,$r0,18(0x12)
1c0035b4:	57fd37ff 	bl	-716(0xffffd34) # 1c0032e8 <gpio_init>
1c0035b8:	02800405 	addi.w	$r5,$r0,1(0x1)
1c0035bc:	02804c04 	addi.w	$r4,$r0,19(0x13)
1c0035c0:	57fd2bff 	bl	-728(0xffffd28) # 1c0032e8 <gpio_init>
1c0035c4:	03400000 	andi	$r0,$r0,0x0
1c0035c8:	28803061 	ld.w	$r1,$r3,12(0xc)
1c0035cc:	28802076 	ld.w	$r22,$r3,8(0x8)
1c0035d0:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0035d4:	4c000020 	jirl	$r0,$r1,0

1c0035d8 <PS2_Cmd>:
PS2_Cmd():
1c0035d8:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c0035dc:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c0035e0:	2980a076 	st.w	$r22,$r3,40(0x28)
1c0035e4:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c0035e8:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c0035ec:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0035f0:	29bf82cc 	st.w	$r12,$r22,-32(0xfe0)
1c0035f4:	1cc7ffac 	pcaddu12i	$r12,409597(0x63ffd)
1c0035f8:	02aa518c 	addi.w	$r12,$r12,-1388(0xa94)
1c0035fc:	29801180 	st.w	$r0,$r12,4(0x4)
1c003600:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c003604:	29bf82cc 	st.w	$r12,$r22,-32(0xfe0)
1c003608:	5000e800 	b	232(0xe8) # 1c0036f0 <PS2_Cmd+0x118>
1c00360c:	28bf82cd 	ld.w	$r13,$r22,-32(0xfe0)
1c003610:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003614:	0014b1ac 	and	$r12,$r13,$r12
1c003618:	40001580 	beqz	$r12,20(0x14) # 1c00362c <PS2_Cmd+0x54>
1c00361c:	02800405 	addi.w	$r5,$r0,1(0x1)
1c003620:	02803404 	addi.w	$r4,$r0,13(0xd)
1c003624:	57fdbfff 	bl	-580(0xffffdbc) # 1c0033e0 <gpio_write>
1c003628:	50001000 	b	16(0x10) # 1c003638 <PS2_Cmd+0x60>
1c00362c:	00150005 	move	$r5,$r0
1c003630:	02803404 	addi.w	$r4,$r0,13(0xd)
1c003634:	57fdafff 	bl	-596(0xffffdac) # 1c0033e0 <gpio_write>
1c003638:	02800405 	addi.w	$r5,$r0,1(0x1)
1c00363c:	02804c04 	addi.w	$r4,$r0,19(0x13)
1c003640:	57fda3ff 	bl	-608(0xffffda0) # 1c0033e0 <gpio_write>
1c003644:	0280140c 	addi.w	$r12,$r0,5(0x5)
1c003648:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c00364c:	50001400 	b	20(0x14) # 1c003660 <PS2_Cmd+0x88>
1c003650:	03400000 	andi	$r0,$r0,0x0
1c003654:	03400000 	andi	$r0,$r0,0x0
1c003658:	03400000 	andi	$r0,$r0,0x0
1c00365c:	03400000 	andi	$r0,$r0,0x0
1c003660:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003664:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c003668:	29bfb2cd 	st.w	$r13,$r22,-20(0xfec)
1c00366c:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c003650 <PS2_Cmd+0x78>
1c003670:	00150005 	move	$r5,$r0
1c003674:	02804c04 	addi.w	$r4,$r0,19(0x13)
1c003678:	57fd6bff 	bl	-664(0xffffd68) # 1c0033e0 <gpio_write>
1c00367c:	0280140c 	addi.w	$r12,$r0,5(0x5)
1c003680:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c003684:	50001400 	b	20(0x14) # 1c003698 <PS2_Cmd+0xc0>
1c003688:	03400000 	andi	$r0,$r0,0x0
1c00368c:	03400000 	andi	$r0,$r0,0x0
1c003690:	03400000 	andi	$r0,$r0,0x0
1c003694:	03400000 	andi	$r0,$r0,0x0
1c003698:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c00369c:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c0036a0:	29bfa2cd 	st.w	$r13,$r22,-24(0xfe8)
1c0036a4:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c003688 <PS2_Cmd+0xb0>
1c0036a8:	02800405 	addi.w	$r5,$r0,1(0x1)
1c0036ac:	02804c04 	addi.w	$r4,$r0,19(0x13)
1c0036b0:	57fd33ff 	bl	-720(0xffffd30) # 1c0033e0 <gpio_write>
1c0036b4:	02800404 	addi.w	$r4,$r0,1(0x1)
1c0036b8:	57fe23ff 	bl	-480(0xffffe20) # 1c0034d8 <gpio_read>
1c0036bc:	0015008c 	move	$r12,$r4
1c0036c0:	40002580 	beqz	$r12,36(0x24) # 1c0036e4 <PS2_Cmd+0x10c>
1c0036c4:	1cc7ffac 	pcaddu12i	$r12,409597(0x63ffd)
1c0036c8:	02a7118c 	addi.w	$r12,$r12,-1596(0x9c4)
1c0036cc:	2880118d 	ld.w	$r13,$r12,4(0x4)
1c0036d0:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c0036d4:	001531ad 	or	$r13,$r13,$r12
1c0036d8:	1cc7ffac 	pcaddu12i	$r12,409597(0x63ffd)
1c0036dc:	02a6c18c 	addi.w	$r12,$r12,-1616(0x9b0)
1c0036e0:	2980118d 	st.w	$r13,$r12,4(0x4)
1c0036e4:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c0036e8:	0040858c 	slli.w	$r12,$r12,0x1
1c0036ec:	29bf82cc 	st.w	$r12,$r22,-32(0xfe0)
1c0036f0:	28bf82cd 	ld.w	$r13,$r22,-32(0xfe0)
1c0036f4:	0283fc0c 	addi.w	$r12,$r0,255(0xff)
1c0036f8:	6fff158d 	bgeu	$r12,$r13,-236(0x3ff14) # 1c00360c <PS2_Cmd+0x34>
1c0036fc:	02803c0c 	addi.w	$r12,$r0,15(0xf)
1c003700:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c003704:	50001400 	b	20(0x14) # 1c003718 <PS2_Cmd+0x140>
1c003708:	03400000 	andi	$r0,$r0,0x0
1c00370c:	03400000 	andi	$r0,$r0,0x0
1c003710:	03400000 	andi	$r0,$r0,0x0
1c003714:	03400000 	andi	$r0,$r0,0x0
1c003718:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c00371c:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c003720:	29bf92cd 	st.w	$r13,$r22,-28(0xfe4)
1c003724:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c003708 <PS2_Cmd+0x130>
1c003728:	03400000 	andi	$r0,$r0,0x0
1c00372c:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c003730:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c003734:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c003738:	4c000020 	jirl	$r0,$r1,0

1c00373c <PS2_ReadData>:
PS2_ReadData():
1c00373c:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c003740:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c003744:	2980a076 	st.w	$r22,$r3,40(0x28)
1c003748:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c00374c:	29bf82c0 	st.w	$r0,$r22,-32(0xfe0)
1c003750:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c003754:	29bf72cc 	st.w	$r12,$r22,-36(0xfdc)
1c003758:	00150005 	move	$r5,$r0
1c00375c:	02804804 	addi.w	$r4,$r0,18(0x12)
1c003760:	57fc83ff 	bl	-896(0xffffc80) # 1c0033e0 <gpio_write>
1c003764:	1cc7ffcc 	pcaddu12i	$r12,409598(0x63ffe)
1c003768:	02a8118c 	addi.w	$r12,$r12,-1532(0xa04)
1c00376c:	2880018c 	ld.w	$r12,$r12,0
1c003770:	00150184 	move	$r4,$r12
1c003774:	57fe67ff 	bl	-412(0xffffe64) # 1c0035d8 <PS2_Cmd>
1c003778:	1cc7ffcc 	pcaddu12i	$r12,409598(0x63ffe)
1c00377c:	02a7c18c 	addi.w	$r12,$r12,-1552(0x9f0)
1c003780:	2880118c 	ld.w	$r12,$r12,4(0x4)
1c003784:	00150184 	move	$r4,$r12
1c003788:	57fe53ff 	bl	-432(0xffffe50) # 1c0035d8 <PS2_Cmd>
1c00378c:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c003790:	29bf82cc 	st.w	$r12,$r22,-32(0xfe0)
1c003794:	50012400 	b	292(0x124) # 1c0038b8 <PS2_ReadData+0x17c>
1c003798:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c00379c:	29bf72cc 	st.w	$r12,$r22,-36(0xfdc)
1c0037a0:	5000d400 	b	212(0xd4) # 1c003874 <PS2_ReadData+0x138>
1c0037a4:	02800405 	addi.w	$r5,$r0,1(0x1)
1c0037a8:	02804c04 	addi.w	$r4,$r0,19(0x13)
1c0037ac:	57fc37ff 	bl	-972(0xffffc34) # 1c0033e0 <gpio_write>
1c0037b0:	0280140c 	addi.w	$r12,$r0,5(0x5)
1c0037b4:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0037b8:	50001400 	b	20(0x14) # 1c0037cc <PS2_ReadData+0x90>
1c0037bc:	03400000 	andi	$r0,$r0,0x0
1c0037c0:	03400000 	andi	$r0,$r0,0x0
1c0037c4:	03400000 	andi	$r0,$r0,0x0
1c0037c8:	03400000 	andi	$r0,$r0,0x0
1c0037cc:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0037d0:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c0037d4:	29bfb2cd 	st.w	$r13,$r22,-20(0xfec)
1c0037d8:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c0037bc <PS2_ReadData+0x80>
1c0037dc:	00150005 	move	$r5,$r0
1c0037e0:	02804c04 	addi.w	$r4,$r0,19(0x13)
1c0037e4:	57fbffff 	bl	-1028(0xffffbfc) # 1c0033e0 <gpio_write>
1c0037e8:	0280140c 	addi.w	$r12,$r0,5(0x5)
1c0037ec:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0037f0:	50001400 	b	20(0x14) # 1c003804 <PS2_ReadData+0xc8>
1c0037f4:	03400000 	andi	$r0,$r0,0x0
1c0037f8:	03400000 	andi	$r0,$r0,0x0
1c0037fc:	03400000 	andi	$r0,$r0,0x0
1c003800:	03400000 	andi	$r0,$r0,0x0
1c003804:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c003808:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c00380c:	29bfa2cd 	st.w	$r13,$r22,-24(0xfe8)
1c003810:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c0037f4 <PS2_ReadData+0xb8>
1c003814:	02800405 	addi.w	$r5,$r0,1(0x1)
1c003818:	02804c04 	addi.w	$r4,$r0,19(0x13)
1c00381c:	57fbc7ff 	bl	-1084(0xffffbc4) # 1c0033e0 <gpio_write>
1c003820:	02800404 	addi.w	$r4,$r0,1(0x1)
1c003824:	57fcb7ff 	bl	-844(0xffffcb4) # 1c0034d8 <gpio_read>
1c003828:	0015008c 	move	$r12,$r4
1c00382c:	40003d80 	beqz	$r12,60(0x3c) # 1c003868 <PS2_ReadData+0x12c>
1c003830:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c003834:	1cc7ffad 	pcaddu12i	$r13,409597(0x63ffd)
1c003838:	02a151ad 	addi.w	$r13,$r13,-1964(0x854)
1c00383c:	0040898c 	slli.w	$r12,$r12,0x2
1c003840:	001031ac 	add.w	$r12,$r13,$r12
1c003844:	2880018e 	ld.w	$r14,$r12,0
1c003848:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c00384c:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c003850:	001535cd 	or	$r13,$r14,$r13
1c003854:	1cc7ffae 	pcaddu12i	$r14,409597(0x63ffd)
1c003858:	02a0d1ce 	addi.w	$r14,$r14,-1996(0x834)
1c00385c:	0040898c 	slli.w	$r12,$r12,0x2
1c003860:	001031cc 	add.w	$r12,$r14,$r12
1c003864:	2980018d 	st.w	$r13,$r12,0
1c003868:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c00386c:	0040858c 	slli.w	$r12,$r12,0x1
1c003870:	29bf72cc 	st.w	$r12,$r22,-36(0xfdc)
1c003874:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c003878:	0283fc0c 	addi.w	$r12,$r0,255(0xff)
1c00387c:	6fff298d 	bgeu	$r12,$r13,-216(0x3ff28) # 1c0037a4 <PS2_ReadData+0x68>
1c003880:	02803c0c 	addi.w	$r12,$r0,15(0xf)
1c003884:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c003888:	50001400 	b	20(0x14) # 1c00389c <PS2_ReadData+0x160>
1c00388c:	03400000 	andi	$r0,$r0,0x0
1c003890:	03400000 	andi	$r0,$r0,0x0
1c003894:	03400000 	andi	$r0,$r0,0x0
1c003898:	03400000 	andi	$r0,$r0,0x0
1c00389c:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c0038a0:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c0038a4:	29bf92cd 	st.w	$r13,$r22,-28(0xfe4)
1c0038a8:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c00388c <PS2_ReadData+0x150>
1c0038ac:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c0038b0:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0038b4:	29bf82cc 	st.w	$r12,$r22,-32(0xfe0)
1c0038b8:	28bf82cd 	ld.w	$r13,$r22,-32(0xfe0)
1c0038bc:	0280200c 	addi.w	$r12,$r0,8(0x8)
1c0038c0:	6ffed98d 	bgeu	$r12,$r13,-296(0x3fed8) # 1c003798 <PS2_ReadData+0x5c>
1c0038c4:	02800405 	addi.w	$r5,$r0,1(0x1)
1c0038c8:	02804804 	addi.w	$r4,$r0,18(0x12)
1c0038cc:	57fb17ff 	bl	-1260(0xffffb14) # 1c0033e0 <gpio_write>
1c0038d0:	03400000 	andi	$r0,$r0,0x0
1c0038d4:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c0038d8:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c0038dc:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c0038e0:	4c000020 	jirl	$r0,$r1,0

1c0038e4 <PS2_DataKey>:
PS2_DataKey():
1c0038e4:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0038e8:	29807061 	st.w	$r1,$r3,28(0x1c)
1c0038ec:	29806076 	st.w	$r22,$r3,24(0x18)
1c0038f0:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0038f4:	5400b400 	bl	180(0xb4) # 1c0039a8 <PS2_ClearData>
1c0038f8:	57fe47ff 	bl	-444(0xffffe44) # 1c00373c <PS2_ReadData>
1c0038fc:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c003900:	029e318c 	addi.w	$r12,$r12,1932(0x78c)
1c003904:	2880418c 	ld.w	$r12,$r12,16(0x10)
1c003908:	0040a18d 	slli.w	$r13,$r12,0x8
1c00390c:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c003910:	029df18c 	addi.w	$r12,$r12,1916(0x77c)
1c003914:	2880318c 	ld.w	$r12,$r12,12(0xc)
1c003918:	001531ad 	or	$r13,$r13,$r12
1c00391c:	1cc7ffac 	pcaddu12i	$r12,409597(0x63ffd)
1c003920:	289ec18c 	ld.w	$r12,$r12,1968(0x7b0)
1c003924:	2980018d 	st.w	$r13,$r12,0
1c003928:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c00392c:	50005800 	b	88(0x58) # 1c003984 <PS2_DataKey+0xa0>
1c003930:	1cc7ffcd 	pcaddu12i	$r13,409598(0x63ffe)
1c003934:	02a101ad 	addi.w	$r13,$r13,-1984(0x840)
1c003938:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00393c:	0040898c 	slli.w	$r12,$r12,0x2
1c003940:	001031ac 	add.w	$r12,$r13,$r12
1c003944:	2880018c 	ld.w	$r12,$r12,0
1c003948:	02bffd8c 	addi.w	$r12,$r12,-1(0xfff)
1c00394c:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c003950:	001731ac 	sll.w	$r12,$r13,$r12
1c003954:	0015018d 	move	$r13,$r12
1c003958:	1cc7ffac 	pcaddu12i	$r12,409597(0x63ffd)
1c00395c:	289dd18c 	ld.w	$r12,$r12,1908(0x774)
1c003960:	2880018c 	ld.w	$r12,$r12,0
1c003964:	0014b1ac 	and	$r12,$r13,$r12
1c003968:	44001180 	bnez	$r12,16(0x10) # 1c003978 <PS2_DataKey+0x94>
1c00396c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003970:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c003974:	50002000 	b	32(0x20) # 1c003994 <PS2_DataKey+0xb0>
1c003978:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00397c:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c003980:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c003984:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c003988:	02803c0c 	addi.w	$r12,$r0,15(0xf)
1c00398c:	6fffa58d 	bgeu	$r12,$r13,-92(0x3ffa4) # 1c003930 <PS2_DataKey+0x4c>
1c003990:	0015000c 	move	$r12,$r0
1c003994:	00150184 	move	$r4,$r12
1c003998:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c00399c:	28806076 	ld.w	$r22,$r3,24(0x18)
1c0039a0:	02808063 	addi.w	$r3,$r3,32(0x20)
1c0039a4:	4c000020 	jirl	$r0,$r1,0

1c0039a8 <PS2_ClearData>:
PS2_ClearData():
1c0039a8:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0039ac:	29807076 	st.w	$r22,$r3,28(0x1c)
1c0039b0:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0039b4:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c0039b8:	50002800 	b	40(0x28) # 1c0039e0 <PS2_ClearData+0x38>
1c0039bc:	1cc7ff8d 	pcaddu12i	$r13,409596(0x63ffc)
1c0039c0:	029b31ad 	addi.w	$r13,$r13,1740(0x6cc)
1c0039c4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0039c8:	0040898c 	slli.w	$r12,$r12,0x2
1c0039cc:	001031ac 	add.w	$r12,$r13,$r12
1c0039d0:	29800180 	st.w	$r0,$r12,0
1c0039d4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0039d8:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0039dc:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0039e0:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c0039e4:	0280200c 	addi.w	$r12,$r0,8(0x8)
1c0039e8:	6fffd58d 	bgeu	$r12,$r13,-44(0x3ffd4) # 1c0039bc <PS2_ClearData+0x14>
1c0039ec:	03400000 	andi	$r0,$r0,0x0
1c0039f0:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c0039f4:	02808063 	addi.w	$r3,$r3,32(0x20)
1c0039f8:	4c000020 	jirl	$r0,$r1,0

1c0039fc <PS2_ShortPoll>:
PS2_ShortPoll():
1c0039fc:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c003a00:	29807061 	st.w	$r1,$r3,28(0x1c)
1c003a04:	29806076 	st.w	$r22,$r3,24(0x18)
1c003a08:	02808076 	addi.w	$r22,$r3,32(0x20)
1c003a0c:	00150005 	move	$r5,$r0
1c003a10:	02804804 	addi.w	$r4,$r0,18(0x12)
1c003a14:	57f9cfff 	bl	-1588(0xffff9cc) # 1c0033e0 <gpio_write>
1c003a18:	02803c0c 	addi.w	$r12,$r0,15(0xf)
1c003a1c:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c003a20:	50001400 	b	20(0x14) # 1c003a34 <PS2_ShortPoll+0x38>
1c003a24:	03400000 	andi	$r0,$r0,0x0
1c003a28:	03400000 	andi	$r0,$r0,0x0
1c003a2c:	03400000 	andi	$r0,$r0,0x0
1c003a30:	03400000 	andi	$r0,$r0,0x0
1c003a34:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003a38:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c003a3c:	29bfb2cd 	st.w	$r13,$r22,-20(0xfec)
1c003a40:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c003a24 <PS2_ShortPoll+0x28>
1c003a44:	02800404 	addi.w	$r4,$r0,1(0x1)
1c003a48:	57fb93ff 	bl	-1136(0xffffb90) # 1c0035d8 <PS2_Cmd>
1c003a4c:	02810804 	addi.w	$r4,$r0,66(0x42)
1c003a50:	57fb8bff 	bl	-1144(0xffffb88) # 1c0035d8 <PS2_Cmd>
1c003a54:	00150004 	move	$r4,$r0
1c003a58:	57fb83ff 	bl	-1152(0xffffb80) # 1c0035d8 <PS2_Cmd>
1c003a5c:	00150004 	move	$r4,$r0
1c003a60:	57fb7bff 	bl	-1160(0xffffb78) # 1c0035d8 <PS2_Cmd>
1c003a64:	00150004 	move	$r4,$r0
1c003a68:	57fb73ff 	bl	-1168(0xffffb70) # 1c0035d8 <PS2_Cmd>
1c003a6c:	02800405 	addi.w	$r5,$r0,1(0x1)
1c003a70:	02804804 	addi.w	$r4,$r0,18(0x12)
1c003a74:	57f96fff 	bl	-1684(0xffff96c) # 1c0033e0 <gpio_write>
1c003a78:	02803c0c 	addi.w	$r12,$r0,15(0xf)
1c003a7c:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c003a80:	50001400 	b	20(0x14) # 1c003a94 <PS2_ShortPoll+0x98>
1c003a84:	03400000 	andi	$r0,$r0,0x0
1c003a88:	03400000 	andi	$r0,$r0,0x0
1c003a8c:	03400000 	andi	$r0,$r0,0x0
1c003a90:	03400000 	andi	$r0,$r0,0x0
1c003a94:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c003a98:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c003a9c:	29bfa2cd 	st.w	$r13,$r22,-24(0xfe8)
1c003aa0:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c003a84 <PS2_ShortPoll+0x88>
1c003aa4:	03400000 	andi	$r0,$r0,0x0
1c003aa8:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c003aac:	28806076 	ld.w	$r22,$r3,24(0x18)
1c003ab0:	02808063 	addi.w	$r3,$r3,32(0x20)
1c003ab4:	4c000020 	jirl	$r0,$r1,0

1c003ab8 <PS2_EnterConfing>:
PS2_EnterConfing():
1c003ab8:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c003abc:	29807061 	st.w	$r1,$r3,28(0x1c)
1c003ac0:	29806076 	st.w	$r22,$r3,24(0x18)
1c003ac4:	02808076 	addi.w	$r22,$r3,32(0x20)
1c003ac8:	00150005 	move	$r5,$r0
1c003acc:	02804804 	addi.w	$r4,$r0,18(0x12)
1c003ad0:	57f913ff 	bl	-1776(0xffff910) # 1c0033e0 <gpio_write>
1c003ad4:	02803c0c 	addi.w	$r12,$r0,15(0xf)
1c003ad8:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c003adc:	50001400 	b	20(0x14) # 1c003af0 <PS2_EnterConfing+0x38>
1c003ae0:	03400000 	andi	$r0,$r0,0x0
1c003ae4:	03400000 	andi	$r0,$r0,0x0
1c003ae8:	03400000 	andi	$r0,$r0,0x0
1c003aec:	03400000 	andi	$r0,$r0,0x0
1c003af0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003af4:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c003af8:	29bfb2cd 	st.w	$r13,$r22,-20(0xfec)
1c003afc:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c003ae0 <PS2_EnterConfing+0x28>
1c003b00:	02800404 	addi.w	$r4,$r0,1(0x1)
1c003b04:	57fad7ff 	bl	-1324(0xffffad4) # 1c0035d8 <PS2_Cmd>
1c003b08:	02810c04 	addi.w	$r4,$r0,67(0x43)
1c003b0c:	57facfff 	bl	-1332(0xffffacc) # 1c0035d8 <PS2_Cmd>
1c003b10:	00150004 	move	$r4,$r0
1c003b14:	57fac7ff 	bl	-1340(0xffffac4) # 1c0035d8 <PS2_Cmd>
1c003b18:	02800404 	addi.w	$r4,$r0,1(0x1)
1c003b1c:	57fabfff 	bl	-1348(0xffffabc) # 1c0035d8 <PS2_Cmd>
1c003b20:	00150004 	move	$r4,$r0
1c003b24:	57fab7ff 	bl	-1356(0xffffab4) # 1c0035d8 <PS2_Cmd>
1c003b28:	00150004 	move	$r4,$r0
1c003b2c:	57faafff 	bl	-1364(0xffffaac) # 1c0035d8 <PS2_Cmd>
1c003b30:	00150004 	move	$r4,$r0
1c003b34:	57faa7ff 	bl	-1372(0xffffaa4) # 1c0035d8 <PS2_Cmd>
1c003b38:	00150004 	move	$r4,$r0
1c003b3c:	57fa9fff 	bl	-1380(0xffffa9c) # 1c0035d8 <PS2_Cmd>
1c003b40:	00150004 	move	$r4,$r0
1c003b44:	57fa97ff 	bl	-1388(0xffffa94) # 1c0035d8 <PS2_Cmd>
1c003b48:	02800405 	addi.w	$r5,$r0,1(0x1)
1c003b4c:	02804804 	addi.w	$r4,$r0,18(0x12)
1c003b50:	57f893ff 	bl	-1904(0xffff890) # 1c0033e0 <gpio_write>
1c003b54:	02803c0c 	addi.w	$r12,$r0,15(0xf)
1c003b58:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c003b5c:	50001400 	b	20(0x14) # 1c003b70 <PS2_EnterConfing+0xb8>
1c003b60:	03400000 	andi	$r0,$r0,0x0
1c003b64:	03400000 	andi	$r0,$r0,0x0
1c003b68:	03400000 	andi	$r0,$r0,0x0
1c003b6c:	03400000 	andi	$r0,$r0,0x0
1c003b70:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c003b74:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c003b78:	29bfa2cd 	st.w	$r13,$r22,-24(0xfe8)
1c003b7c:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c003b60 <PS2_EnterConfing+0xa8>
1c003b80:	03400000 	andi	$r0,$r0,0x0
1c003b84:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c003b88:	28806076 	ld.w	$r22,$r3,24(0x18)
1c003b8c:	02808063 	addi.w	$r3,$r3,32(0x20)
1c003b90:	4c000020 	jirl	$r0,$r1,0

1c003b94 <PS2_TurnOnAnalogMode>:
PS2_TurnOnAnalogMode():
1c003b94:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c003b98:	29807061 	st.w	$r1,$r3,28(0x1c)
1c003b9c:	29806076 	st.w	$r22,$r3,24(0x18)
1c003ba0:	02808076 	addi.w	$r22,$r3,32(0x20)
1c003ba4:	00150005 	move	$r5,$r0
1c003ba8:	02804804 	addi.w	$r4,$r0,18(0x12)
1c003bac:	57f837ff 	bl	-1996(0xffff834) # 1c0033e0 <gpio_write>
1c003bb0:	02800404 	addi.w	$r4,$r0,1(0x1)
1c003bb4:	57fa27ff 	bl	-1500(0xffffa24) # 1c0035d8 <PS2_Cmd>
1c003bb8:	02811004 	addi.w	$r4,$r0,68(0x44)
1c003bbc:	57fa1fff 	bl	-1508(0xffffa1c) # 1c0035d8 <PS2_Cmd>
1c003bc0:	00150004 	move	$r4,$r0
1c003bc4:	57fa17ff 	bl	-1516(0xffffa14) # 1c0035d8 <PS2_Cmd>
1c003bc8:	02800404 	addi.w	$r4,$r0,1(0x1)
1c003bcc:	57fa0fff 	bl	-1524(0xffffa0c) # 1c0035d8 <PS2_Cmd>
1c003bd0:	0283b804 	addi.w	$r4,$r0,238(0xee)
1c003bd4:	57fa07ff 	bl	-1532(0xffffa04) # 1c0035d8 <PS2_Cmd>
1c003bd8:	00150004 	move	$r4,$r0
1c003bdc:	57f9ffff 	bl	-1540(0xffff9fc) # 1c0035d8 <PS2_Cmd>
1c003be0:	00150004 	move	$r4,$r0
1c003be4:	57f9f7ff 	bl	-1548(0xffff9f4) # 1c0035d8 <PS2_Cmd>
1c003be8:	00150004 	move	$r4,$r0
1c003bec:	57f9efff 	bl	-1556(0xffff9ec) # 1c0035d8 <PS2_Cmd>
1c003bf0:	00150004 	move	$r4,$r0
1c003bf4:	57f9e7ff 	bl	-1564(0xffff9e4) # 1c0035d8 <PS2_Cmd>
1c003bf8:	02800405 	addi.w	$r5,$r0,1(0x1)
1c003bfc:	02804804 	addi.w	$r4,$r0,18(0x12)
1c003c00:	57f7e3ff 	bl	-2080(0xffff7e0) # 1c0033e0 <gpio_write>
1c003c04:	02803c0c 	addi.w	$r12,$r0,15(0xf)
1c003c08:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c003c0c:	50001400 	b	20(0x14) # 1c003c20 <PS2_TurnOnAnalogMode+0x8c>
1c003c10:	03400000 	andi	$r0,$r0,0x0
1c003c14:	03400000 	andi	$r0,$r0,0x0
1c003c18:	03400000 	andi	$r0,$r0,0x0
1c003c1c:	03400000 	andi	$r0,$r0,0x0
1c003c20:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003c24:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c003c28:	29bfb2cd 	st.w	$r13,$r22,-20(0xfec)
1c003c2c:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c003c10 <PS2_TurnOnAnalogMode+0x7c>
1c003c30:	03400000 	andi	$r0,$r0,0x0
1c003c34:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c003c38:	28806076 	ld.w	$r22,$r3,24(0x18)
1c003c3c:	02808063 	addi.w	$r3,$r3,32(0x20)
1c003c40:	4c000020 	jirl	$r0,$r1,0

1c003c44 <PS2_VibrationMode>:
PS2_VibrationMode():
1c003c44:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c003c48:	29807061 	st.w	$r1,$r3,28(0x1c)
1c003c4c:	29806076 	st.w	$r22,$r3,24(0x18)
1c003c50:	02808076 	addi.w	$r22,$r3,32(0x20)
1c003c54:	00150005 	move	$r5,$r0
1c003c58:	02804804 	addi.w	$r4,$r0,18(0x12)
1c003c5c:	57f787ff 	bl	-2172(0xffff784) # 1c0033e0 <gpio_write>
1c003c60:	02803c0c 	addi.w	$r12,$r0,15(0xf)
1c003c64:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c003c68:	50001400 	b	20(0x14) # 1c003c7c <PS2_VibrationMode+0x38>
1c003c6c:	03400000 	andi	$r0,$r0,0x0
1c003c70:	03400000 	andi	$r0,$r0,0x0
1c003c74:	03400000 	andi	$r0,$r0,0x0
1c003c78:	03400000 	andi	$r0,$r0,0x0
1c003c7c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003c80:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c003c84:	29bfb2cd 	st.w	$r13,$r22,-20(0xfec)
1c003c88:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c003c6c <PS2_VibrationMode+0x28>
1c003c8c:	02800404 	addi.w	$r4,$r0,1(0x1)
1c003c90:	57f94bff 	bl	-1720(0xffff948) # 1c0035d8 <PS2_Cmd>
1c003c94:	02813404 	addi.w	$r4,$r0,77(0x4d)
1c003c98:	57f943ff 	bl	-1728(0xffff940) # 1c0035d8 <PS2_Cmd>
1c003c9c:	00150004 	move	$r4,$r0
1c003ca0:	57f93bff 	bl	-1736(0xffff938) # 1c0035d8 <PS2_Cmd>
1c003ca4:	00150004 	move	$r4,$r0
1c003ca8:	57f933ff 	bl	-1744(0xffff930) # 1c0035d8 <PS2_Cmd>
1c003cac:	02800404 	addi.w	$r4,$r0,1(0x1)
1c003cb0:	57f92bff 	bl	-1752(0xffff928) # 1c0035d8 <PS2_Cmd>
1c003cb4:	02800405 	addi.w	$r5,$r0,1(0x1)
1c003cb8:	02804804 	addi.w	$r4,$r0,18(0x12)
1c003cbc:	57f727ff 	bl	-2268(0xffff724) # 1c0033e0 <gpio_write>
1c003cc0:	02803c0c 	addi.w	$r12,$r0,15(0xf)
1c003cc4:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c003cc8:	50001400 	b	20(0x14) # 1c003cdc <PS2_VibrationMode+0x98>
1c003ccc:	03400000 	andi	$r0,$r0,0x0
1c003cd0:	03400000 	andi	$r0,$r0,0x0
1c003cd4:	03400000 	andi	$r0,$r0,0x0
1c003cd8:	03400000 	andi	$r0,$r0,0x0
1c003cdc:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c003ce0:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c003ce4:	29bfa2cd 	st.w	$r13,$r22,-24(0xfe8)
1c003ce8:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c003ccc <PS2_VibrationMode+0x88>
1c003cec:	03400000 	andi	$r0,$r0,0x0
1c003cf0:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c003cf4:	28806076 	ld.w	$r22,$r3,24(0x18)
1c003cf8:	02808063 	addi.w	$r3,$r3,32(0x20)
1c003cfc:	4c000020 	jirl	$r0,$r1,0

1c003d00 <PS2_ExitConfing>:
PS2_ExitConfing():
1c003d00:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c003d04:	29807061 	st.w	$r1,$r3,28(0x1c)
1c003d08:	29806076 	st.w	$r22,$r3,24(0x18)
1c003d0c:	02808076 	addi.w	$r22,$r3,32(0x20)
1c003d10:	00150005 	move	$r5,$r0
1c003d14:	02804804 	addi.w	$r4,$r0,18(0x12)
1c003d18:	57f6cbff 	bl	-2360(0xffff6c8) # 1c0033e0 <gpio_write>
1c003d1c:	02803c0c 	addi.w	$r12,$r0,15(0xf)
1c003d20:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c003d24:	50001400 	b	20(0x14) # 1c003d38 <PS2_ExitConfing+0x38>
1c003d28:	03400000 	andi	$r0,$r0,0x0
1c003d2c:	03400000 	andi	$r0,$r0,0x0
1c003d30:	03400000 	andi	$r0,$r0,0x0
1c003d34:	03400000 	andi	$r0,$r0,0x0
1c003d38:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003d3c:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c003d40:	29bfb2cd 	st.w	$r13,$r22,-20(0xfec)
1c003d44:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c003d28 <PS2_ExitConfing+0x28>
1c003d48:	02800404 	addi.w	$r4,$r0,1(0x1)
1c003d4c:	57f88fff 	bl	-1908(0xffff88c) # 1c0035d8 <PS2_Cmd>
1c003d50:	02810c04 	addi.w	$r4,$r0,67(0x43)
1c003d54:	57f887ff 	bl	-1916(0xffff884) # 1c0035d8 <PS2_Cmd>
1c003d58:	00150004 	move	$r4,$r0
1c003d5c:	57f87fff 	bl	-1924(0xffff87c) # 1c0035d8 <PS2_Cmd>
1c003d60:	00150004 	move	$r4,$r0
1c003d64:	57f877ff 	bl	-1932(0xffff874) # 1c0035d8 <PS2_Cmd>
1c003d68:	02816804 	addi.w	$r4,$r0,90(0x5a)
1c003d6c:	57f86fff 	bl	-1940(0xffff86c) # 1c0035d8 <PS2_Cmd>
1c003d70:	02816804 	addi.w	$r4,$r0,90(0x5a)
1c003d74:	57f867ff 	bl	-1948(0xffff864) # 1c0035d8 <PS2_Cmd>
1c003d78:	02816804 	addi.w	$r4,$r0,90(0x5a)
1c003d7c:	57f85fff 	bl	-1956(0xffff85c) # 1c0035d8 <PS2_Cmd>
1c003d80:	02816804 	addi.w	$r4,$r0,90(0x5a)
1c003d84:	57f857ff 	bl	-1964(0xffff854) # 1c0035d8 <PS2_Cmd>
1c003d88:	02816804 	addi.w	$r4,$r0,90(0x5a)
1c003d8c:	57f84fff 	bl	-1972(0xffff84c) # 1c0035d8 <PS2_Cmd>
1c003d90:	02800405 	addi.w	$r5,$r0,1(0x1)
1c003d94:	02804804 	addi.w	$r4,$r0,18(0x12)
1c003d98:	57f64bff 	bl	-2488(0xffff648) # 1c0033e0 <gpio_write>
1c003d9c:	02803c0c 	addi.w	$r12,$r0,15(0xf)
1c003da0:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c003da4:	50001400 	b	20(0x14) # 1c003db8 <PS2_ExitConfing+0xb8>
1c003da8:	03400000 	andi	$r0,$r0,0x0
1c003dac:	03400000 	andi	$r0,$r0,0x0
1c003db0:	03400000 	andi	$r0,$r0,0x0
1c003db4:	03400000 	andi	$r0,$r0,0x0
1c003db8:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c003dbc:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c003dc0:	29bfa2cd 	st.w	$r13,$r22,-24(0xfe8)
1c003dc4:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c003da8 <PS2_ExitConfing+0xa8>
1c003dc8:	03400000 	andi	$r0,$r0,0x0
1c003dcc:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c003dd0:	28806076 	ld.w	$r22,$r3,24(0x18)
1c003dd4:	02808063 	addi.w	$r3,$r3,32(0x20)
1c003dd8:	4c000020 	jirl	$r0,$r1,0

1c003ddc <PS2_SetInit>:
PS2_SetInit():
1c003ddc:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c003de0:	29803061 	st.w	$r1,$r3,12(0xc)
1c003de4:	29802076 	st.w	$r22,$r3,8(0x8)
1c003de8:	02804076 	addi.w	$r22,$r3,16(0x10)
1c003dec:	57fc13ff 	bl	-1008(0xffffc10) # 1c0039fc <PS2_ShortPoll>
1c003df0:	57fc0fff 	bl	-1012(0xffffc0c) # 1c0039fc <PS2_ShortPoll>
1c003df4:	57fc0bff 	bl	-1016(0xffffc08) # 1c0039fc <PS2_ShortPoll>
1c003df8:	57fcc3ff 	bl	-832(0xffffcc0) # 1c003ab8 <PS2_EnterConfing>
1c003dfc:	57fd9bff 	bl	-616(0xffffd98) # 1c003b94 <PS2_TurnOnAnalogMode>
1c003e00:	57fe47ff 	bl	-444(0xffffe44) # 1c003c44 <PS2_VibrationMode>
1c003e04:	57feffff 	bl	-260(0xffffefc) # 1c003d00 <PS2_ExitConfing>
1c003e08:	03400000 	andi	$r0,$r0,0x0
1c003e0c:	28803061 	ld.w	$r1,$r3,12(0xc)
1c003e10:	28802076 	ld.w	$r22,$r3,8(0x8)
1c003e14:	02804063 	addi.w	$r3,$r3,16(0x10)
1c003e18:	4c000020 	jirl	$r0,$r1,0

1c003e1c <EXTI_Init>:
EXTI_Init():
1c003e1c:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c003e20:	2980b076 	st.w	$r22,$r3,44(0x2c)
1c003e24:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c003e28:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c003e2c:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c003e30:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c003e34:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c003e38:	2880318c 	ld.w	$r12,$r12,12(0xc)
1c003e3c:	40014180 	beqz	$r12,320(0x140) # 1c003f7c <EXTI_Init+0x160>
1c003e40:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c003e44:	0380118c 	ori	$r12,$r12,0x4
1c003e48:	2880018e 	ld.w	$r14,$r12,0
1c003e4c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c003e50:	0380118c 	ori	$r12,$r12,0x4
1c003e54:	15fbffed 	lu12i.w	$r13,-8193(0xfdfff)
1c003e58:	03bffdad 	ori	$r13,$r13,0xfff
1c003e5c:	0014b5cd 	and	$r13,$r14,$r13
1c003e60:	2980018d 	st.w	$r13,$r12,0
1c003e64:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c003e68:	0380118c 	ori	$r12,$r12,0x4
1c003e6c:	2880018e 	ld.w	$r14,$r12,0
1c003e70:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c003e74:	0380118c 	ori	$r12,$r12,0x4
1c003e78:	1404000d 	lu12i.w	$r13,8192(0x2000)
1c003e7c:	001535cd 	or	$r13,$r14,$r13
1c003e80:	2980018d 	st.w	$r13,$r12,0
1c003e84:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c003e88:	2880118c 	ld.w	$r12,$r12,4(0x4)
1c003e8c:	44002980 	bnez	$r12,40(0x28) # 1c003eb4 <EXTI_Init+0x98>
1c003e90:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003e94:	2880218d 	ld.w	$r13,$r12,8(0x8)
1c003e98:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c003e9c:	2880018c 	ld.w	$r12,$r12,0
1c003ea0:	0014300c 	nor	$r12,$r0,$r12
1c003ea4:	0014b1ad 	and	$r13,$r13,$r12
1c003ea8:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003eac:	2980218d 	st.w	$r13,$r12,8(0x8)
1c003eb0:	50002000 	b	32(0x20) # 1c003ed0 <EXTI_Init+0xb4>
1c003eb4:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003eb8:	2880218d 	ld.w	$r13,$r12,8(0x8)
1c003ebc:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c003ec0:	2880018c 	ld.w	$r12,$r12,0
1c003ec4:	001531ad 	or	$r13,$r13,$r12
1c003ec8:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003ecc:	2980218d 	st.w	$r13,$r12,8(0x8)
1c003ed0:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003ed4:	2880018d 	ld.w	$r13,$r12,0
1c003ed8:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c003edc:	2880018c 	ld.w	$r12,$r12,0
1c003ee0:	001531ad 	or	$r13,$r13,$r12
1c003ee4:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003ee8:	2980018d 	st.w	$r13,$r12,0
1c003eec:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003ef0:	2880118d 	ld.w	$r13,$r12,4(0x4)
1c003ef4:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c003ef8:	2880018c 	ld.w	$r12,$r12,0
1c003efc:	0014300c 	nor	$r12,$r0,$r12
1c003f00:	0014b1ad 	and	$r13,$r13,$r12
1c003f04:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003f08:	2980118d 	st.w	$r13,$r12,4(0x4)
1c003f0c:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c003f10:	2880218d 	ld.w	$r13,$r12,8(0x8)
1c003f14:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c003f18:	5c0025ac 	bne	$r13,$r12,36(0x24) # 1c003f3c <EXTI_Init+0x120>
1c003f1c:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003f20:	2880118d 	ld.w	$r13,$r12,4(0x4)
1c003f24:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c003f28:	2880018c 	ld.w	$r12,$r12,0
1c003f2c:	001531ad 	or	$r13,$r13,$r12
1c003f30:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003f34:	2980118d 	st.w	$r13,$r12,4(0x4)
1c003f38:	50002400 	b	36(0x24) # 1c003f5c <EXTI_Init+0x140>
1c003f3c:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003f40:	2880118d 	ld.w	$r13,$r12,4(0x4)
1c003f44:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c003f48:	2880018c 	ld.w	$r12,$r12,0
1c003f4c:	0014300c 	nor	$r12,$r0,$r12
1c003f50:	0014b1ad 	and	$r13,$r13,$r12
1c003f54:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003f58:	2980118d 	st.w	$r13,$r12,4(0x4)
1c003f5c:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003f60:	2880318d 	ld.w	$r13,$r12,12(0xc)
1c003f64:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c003f68:	2880018c 	ld.w	$r12,$r12,0
1c003f6c:	001531ad 	or	$r13,$r13,$r12
1c003f70:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003f74:	2980318d 	st.w	$r13,$r12,12(0xc)
1c003f78:	50002400 	b	36(0x24) # 1c003f9c <EXTI_Init+0x180>
1c003f7c:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003f80:	2880018d 	ld.w	$r13,$r12,0
1c003f84:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c003f88:	2880018c 	ld.w	$r12,$r12,0
1c003f8c:	0014300c 	nor	$r12,$r0,$r12
1c003f90:	0014b1ad 	and	$r13,$r13,$r12
1c003f94:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c003f98:	2980018d 	st.w	$r13,$r12,0
1c003f9c:	03400000 	andi	$r0,$r0,0x0
1c003fa0:	2880b076 	ld.w	$r22,$r3,44(0x2c)
1c003fa4:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c003fa8:	4c000020 	jirl	$r0,$r1,0

1c003fac <EXTI_StructInit>:
EXTI_StructInit():
1c003fac:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c003fb0:	29807076 	st.w	$r22,$r3,28(0x1c)
1c003fb4:	02808076 	addi.w	$r22,$r3,32(0x20)
1c003fb8:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c003fbc:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003fc0:	29800180 	st.w	$r0,$r12,0
1c003fc4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003fc8:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c003fcc:	2980118d 	st.w	$r13,$r12,4(0x4)
1c003fd0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003fd4:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c003fd8:	2980218d 	st.w	$r13,$r12,8(0x8)
1c003fdc:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c003fe0:	29803180 	st.w	$r0,$r12,12(0xc)
1c003fe4:	03400000 	andi	$r0,$r0,0x0
1c003fe8:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c003fec:	02808063 	addi.w	$r3,$r3,32(0x20)
1c003ff0:	4c000020 	jirl	$r0,$r1,0

1c003ff4 <EXTI_ClearITPendingBit>:
EXTI_ClearITPendingBit():
1c003ff4:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c003ff8:	29807076 	st.w	$r22,$r3,28(0x1c)
1c003ffc:	02808076 	addi.w	$r22,$r3,32(0x20)
1c004000:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c004004:	29bfa2c5 	st.w	$r5,$r22,-24(0xfe8)
1c004008:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00400c:	2880318d 	ld.w	$r13,$r12,12(0xc)
1c004010:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c004014:	001531ad 	or	$r13,$r13,$r12
1c004018:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00401c:	2980318d 	st.w	$r13,$r12,12(0xc)
1c004020:	03400000 	andi	$r0,$r0,0x0
1c004024:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c004028:	02808063 	addi.w	$r3,$r3,32(0x20)
1c00402c:	4c000020 	jirl	$r0,$r1,0

1c004030 <WDG_SetWatchDog>:
WDG_SetWatchDog():
1c004030:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c004034:	29807076 	st.w	$r22,$r3,28(0x1c)
1c004038:	02808076 	addi.w	$r22,$r3,32(0x20)
1c00403c:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c004040:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004044:	154ab4ad 	lu12i.w	$r13,-371291(0xa55a5)
1c004048:	0396a9ad 	ori	$r13,$r13,0x5aa
1c00404c:	2980d18d 	st.w	$r13,$r12,52(0x34)
1c004050:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004054:	0014300c 	nor	$r12,$r0,$r12
1c004058:	0040c18e 	slli.w	$r14,$r12,0x10
1c00405c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004060:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c004064:	001535cd 	or	$r13,$r14,$r13
1c004068:	2980c18d 	st.w	$r13,$r12,48(0x30)
1c00406c:	03400000 	andi	$r0,$r0,0x0
1c004070:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c004074:	02808063 	addi.w	$r3,$r3,32(0x20)
1c004078:	4c000020 	jirl	$r0,$r1,0

1c00407c <WDG_DogFeed>:
WDG_DogFeed():
1c00407c:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c004080:	29803076 	st.w	$r22,$r3,12(0xc)
1c004084:	02804076 	addi.w	$r22,$r3,16(0x10)
1c004088:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00408c:	154ab4ad 	lu12i.w	$r13,-371291(0xa55a5)
1c004090:	0396a9ad 	ori	$r13,$r13,0x5aa
1c004094:	2980d18d 	st.w	$r13,$r12,52(0x34)
1c004098:	03400000 	andi	$r0,$r0,0x0
1c00409c:	28803076 	ld.w	$r22,$r3,12(0xc)
1c0040a0:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0040a4:	4c000020 	jirl	$r0,$r1,0

1c0040a8 <I2C_Init>:
I2C_Init():
1c0040a8:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c0040ac:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c0040b0:	2980a076 	st.w	$r22,$r3,40(0x28)
1c0040b4:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c0040b8:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c0040bc:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c0040c0:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c0040c4:	1400f42c 	lu12i.w	$r12,1953(0x7a1)
1c0040c8:	0388018c 	ori	$r12,$r12,0x200
1c0040cc:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0040d0:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0040d4:	0280800d 	addi.w	$r13,$r0,32(0x20)
1c0040d8:	2900098d 	st.b	$r13,$r12,2(0x2)
1c0040dc:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c0040e0:	2880018d 	ld.w	$r13,$r12,0
1c0040e4:	28bfa2ce 	ld.w	$r14,$r22,-24(0xfe8)
1c0040e8:	002135cc 	div.wu	$r12,$r14,$r13
1c0040ec:	5c0009a0 	bne	$r13,$r0,8(0x8) # 1c0040f4 <I2C_Init+0x4c>
1c0040f0:	002a0007 	break	0x7
1c0040f4:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0040f8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0040fc:	0044898c 	srli.w	$r12,$r12,0x2
1c004100:	02bffd8c 	addi.w	$r12,$r12,-1(0xfff)
1c004104:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c004108:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00410c:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c004110:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c004114:	2900018d 	st.b	$r13,$r12,0
1c004118:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00411c:	0044a18c 	srli.w	$r12,$r12,0x8
1c004120:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c004124:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c004128:	2900058d 	st.b	$r13,$r12,1(0x1)
1c00412c:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c004130:	2a00118d 	ld.bu	$r13,$r12,4(0x4)
1c004134:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c004138:	2a00198c 	ld.bu	$r12,$r12,6(0x6)
1c00413c:	001531ac 	or	$r12,$r13,$r12
1c004140:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c004144:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c004148:	2a001d8c 	ld.bu	$r12,$r12,7(0x7)
1c00414c:	001531ac 	or	$r12,$r13,$r12
1c004150:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c004154:	02be000c 	addi.w	$r12,$r0,-128(0xf80)
1c004158:	001531ac 	or	$r12,$r13,$r12
1c00415c:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c004160:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c004164:	2900098d 	st.b	$r13,$r12,2(0x2)
1c004168:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c00416c:	2a00198c 	ld.bu	$r12,$r12,6(0x6)
1c004170:	40001180 	beqz	$r12,16(0x10) # 1c004180 <I2C_Init+0xd8>
1c004174:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c004178:	0280100d 	addi.w	$r13,$r0,4(0x4)
1c00417c:	2900118d 	st.b	$r13,$r12,4(0x4)
1c004180:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c004184:	2a00158d 	ld.bu	$r13,$r12,5(0x5)
1c004188:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c00418c:	29001d8d 	st.b	$r13,$r12,7(0x7)
1c004190:	157fd204 	lu12i.w	$r4,-262512(0xbfe90)
1c004194:	54023c00 	bl	572(0x23c) # 1c0043d0 <I2C_wait>
1c004198:	03400000 	andi	$r0,$r0,0x0
1c00419c:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c0041a0:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c0041a4:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c0041a8:	4c000020 	jirl	$r0,$r1,0

1c0041ac <I2C_StructInit>:
I2C_StructInit():
1c0041ac:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0041b0:	29807076 	st.w	$r22,$r3,28(0x1c)
1c0041b4:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0041b8:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c0041bc:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0041c0:	1400030d 	lu12i.w	$r13,24(0x18)
1c0041c4:	039a81ad 	ori	$r13,$r13,0x6a0
1c0041c8:	2980018d 	st.w	$r13,$r12,0
1c0041cc:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0041d0:	0280800d 	addi.w	$r13,$r0,32(0x20)
1c0041d4:	2900118d 	st.b	$r13,$r12,4(0x4)
1c0041d8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0041dc:	0280a80d 	addi.w	$r13,$r0,42(0x2a)
1c0041e0:	2900158d 	st.b	$r13,$r12,5(0x5)
1c0041e4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0041e8:	0280080d 	addi.w	$r13,$r0,2(0x2)
1c0041ec:	2900198d 	st.b	$r13,$r12,6(0x6)
1c0041f0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0041f4:	29001d80 	st.b	$r0,$r12,7(0x7)
1c0041f8:	03400000 	andi	$r0,$r0,0x0
1c0041fc:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c004200:	02808063 	addi.w	$r3,$r3,32(0x20)
1c004204:	4c000020 	jirl	$r0,$r1,0

1c004208 <I2C_GenerateSTOP>:
I2C_GenerateSTOP():
1c004208:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c00420c:	29807076 	st.w	$r22,$r3,28(0x1c)
1c004210:	02808076 	addi.w	$r22,$r3,32(0x20)
1c004214:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c004218:	29bfa2c5 	st.w	$r5,$r22,-24(0xfe8)
1c00421c:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c004220:	40002580 	beqz	$r12,36(0x24) # 1c004244 <I2C_GenerateSTOP+0x3c>
1c004224:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004228:	2a00118c 	ld.bu	$r12,$r12,4(0x4)
1c00422c:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c004230:	0381018c 	ori	$r12,$r12,0x40
1c004234:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c004238:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00423c:	2900118d 	st.b	$r13,$r12,4(0x4)
1c004240:	50002400 	b	36(0x24) # 1c004264 <I2C_GenerateSTOP+0x5c>
1c004244:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004248:	2a00118c 	ld.bu	$r12,$r12,4(0x4)
1c00424c:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c004250:	02befc0c 	addi.w	$r12,$r0,-65(0xfbf)
1c004254:	0014b1ac 	and	$r12,$r13,$r12
1c004258:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c00425c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004260:	2900118d 	st.b	$r13,$r12,4(0x4)
1c004264:	03400000 	andi	$r0,$r0,0x0
1c004268:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c00426c:	02808063 	addi.w	$r3,$r3,32(0x20)
1c004270:	4c000020 	jirl	$r0,$r1,0

1c004274 <I2C_SendData>:
I2C_SendData():
1c004274:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c004278:	29807061 	st.w	$r1,$r3,28(0x1c)
1c00427c:	29806076 	st.w	$r22,$r3,24(0x18)
1c004280:	02808076 	addi.w	$r22,$r3,32(0x20)
1c004284:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c004288:	001500ac 	move	$r12,$r5
1c00428c:	293faecc 	st.b	$r12,$r22,-21(0xfeb)
1c004290:	28bfb2c4 	ld.w	$r4,$r22,-20(0xfec)
1c004294:	54018400 	bl	388(0x184) # 1c004418 <I2C_Unlock>
1c004298:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00429c:	2a3faecd 	ld.bu	$r13,$r22,-21(0xfeb)
1c0042a0:	29000d8d 	st.b	$r13,$r12,3(0x3)
1c0042a4:	157fd20c 	lu12i.w	$r12,-262512(0xbfe90)
1c0042a8:	0280400d 	addi.w	$r13,$r0,16(0x10)
1c0042ac:	2900118d 	st.b	$r13,$r12,4(0x4)
1c0042b0:	03400000 	andi	$r0,$r0,0x0
1c0042b4:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c0042b8:	28806076 	ld.w	$r22,$r3,24(0x18)
1c0042bc:	02808063 	addi.w	$r3,$r3,32(0x20)
1c0042c0:	4c000020 	jirl	$r0,$r1,0

1c0042c4 <I2C_ReceiveData>:
I2C_ReceiveData():
1c0042c4:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0042c8:	29807061 	st.w	$r1,$r3,28(0x1c)
1c0042cc:	29806076 	st.w	$r22,$r3,24(0x18)
1c0042d0:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0042d4:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c0042d8:	29bfa2c5 	st.w	$r5,$r22,-24(0xfe8)
1c0042dc:	29bf92c6 	st.w	$r6,$r22,-28(0xfe4)
1c0042e0:	28bfb2c4 	ld.w	$r4,$r22,-20(0xfec)
1c0042e4:	54013400 	bl	308(0x134) # 1c004418 <I2C_Unlock>
1c0042e8:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0042ec:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c0042f0:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c0042f4:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0042f8:	001531ac 	or	$r12,$r13,$r12
1c0042fc:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c004300:	0380818c 	ori	$r12,$r12,0x20
1c004304:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c004308:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00430c:	2900118d 	st.b	$r13,$r12,4(0x4)
1c004310:	03400000 	andi	$r0,$r0,0x0
1c004314:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c004318:	28806076 	ld.w	$r22,$r3,24(0x18)
1c00431c:	02808063 	addi.w	$r3,$r3,32(0x20)
1c004320:	4c000020 	jirl	$r0,$r1,0

1c004324 <I2C_Send7bitAddress>:
I2C_Send7bitAddress():
1c004324:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c004328:	29807061 	st.w	$r1,$r3,28(0x1c)
1c00432c:	29806076 	st.w	$r22,$r3,24(0x18)
1c004330:	02808076 	addi.w	$r22,$r3,32(0x20)
1c004334:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c004338:	001500ac 	move	$r12,$r5
1c00433c:	001500cd 	move	$r13,$r6
1c004340:	293faecc 	st.b	$r12,$r22,-21(0xfeb)
1c004344:	001501ac 	move	$r12,$r13
1c004348:	293faacc 	st.b	$r12,$r22,-22(0xfea)
1c00434c:	28bfb2c4 	ld.w	$r4,$r22,-20(0xfec)
1c004350:	5400c800 	bl	200(0xc8) # 1c004418 <I2C_Unlock>
1c004354:	2a3faacc 	ld.bu	$r12,$r22,-22(0xfea)
1c004358:	40002980 	beqz	$r12,40(0x28) # 1c004380 <I2C_Send7bitAddress+0x5c>
1c00435c:	2a3faecc 	ld.bu	$r12,$r22,-21(0xfeb)
1c004360:	0380058c 	ori	$r12,$r12,0x1
1c004364:	293faecc 	st.b	$r12,$r22,-21(0xfeb)
1c004368:	2a3faecc 	ld.bu	$r12,$r22,-21(0xfeb)
1c00436c:	00150185 	move	$r5,$r12
1c004370:	1c0000e4 	pcaddu12i	$r4,7(0x7)
1c004374:	02bc6084 	addi.w	$r4,$r4,-232(0xf18)
1c004378:	57d857ff 	bl	-10156(0xfffd854) # 1c001bcc <myprintf>
1c00437c:	50002800 	b	40(0x28) # 1c0043a4 <I2C_Send7bitAddress+0x80>
1c004380:	2a3faecd 	ld.bu	$r13,$r22,-21(0xfeb)
1c004384:	02bff80c 	addi.w	$r12,$r0,-2(0xffe)
1c004388:	0014b1ac 	and	$r12,$r13,$r12
1c00438c:	293faecc 	st.b	$r12,$r22,-21(0xfeb)
1c004390:	2a3faecc 	ld.bu	$r12,$r22,-21(0xfeb)
1c004394:	00150185 	move	$r5,$r12
1c004398:	1c0000e4 	pcaddu12i	$r4,7(0x7)
1c00439c:	02bc3084 	addi.w	$r4,$r4,-244(0xf0c)
1c0043a0:	57d82fff 	bl	-10196(0xfffd82c) # 1c001bcc <myprintf>
1c0043a4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0043a8:	2a3faecd 	ld.bu	$r13,$r22,-21(0xfeb)
1c0043ac:	29000d8d 	st.b	$r13,$r12,3(0x3)
1c0043b0:	157fd20c 	lu12i.w	$r12,-262512(0xbfe90)
1c0043b4:	02be400d 	addi.w	$r13,$r0,-112(0xf90)
1c0043b8:	2900118d 	st.b	$r13,$r12,4(0x4)
1c0043bc:	03400000 	andi	$r0,$r0,0x0
1c0043c0:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c0043c4:	28806076 	ld.w	$r22,$r3,24(0x18)
1c0043c8:	02808063 	addi.w	$r3,$r3,32(0x20)
1c0043cc:	4c000020 	jirl	$r0,$r1,0

1c0043d0 <I2C_wait>:
I2C_wait():
1c0043d0:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c0043d4:	2980b076 	st.w	$r22,$r3,44(0x2c)
1c0043d8:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c0043dc:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c0043e0:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0043e4:	2a00118c 	ld.bu	$r12,$r12,4(0x4)
1c0043e8:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c0043ec:	50001000 	b	16(0x10) # 1c0043fc <I2C_wait+0x2c>
1c0043f0:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0043f4:	2a00118c 	ld.bu	$r12,$r12,4(0x4)
1c0043f8:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c0043fc:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c004400:	0340098c 	andi	$r12,$r12,0x2
1c004404:	47ffed9f 	bnez	$r12,-20(0x7fffec) # 1c0043f0 <I2C_wait+0x20>
1c004408:	03400000 	andi	$r0,$r0,0x0
1c00440c:	2880b076 	ld.w	$r22,$r3,44(0x2c)
1c004410:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c004414:	4c000020 	jirl	$r0,$r1,0

1c004418 <I2C_Unlock>:
I2C_Unlock():
1c004418:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c00441c:	2980b076 	st.w	$r22,$r3,44(0x2c)
1c004420:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c004424:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c004428:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c00442c:	2a00118c 	ld.bu	$r12,$r12,4(0x4)
1c004430:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c004434:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c004438:	0340118c 	andi	$r12,$r12,0x4
1c00443c:	40002180 	beqz	$r12,32(0x20) # 1c00445c <I2C_Unlock+0x44>
1c004440:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c004444:	2a00118c 	ld.bu	$r12,$r12,4(0x4)
1c004448:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c00444c:	0380118c 	ori	$r12,$r12,0x4
1c004450:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c004454:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c004458:	2900118d 	st.b	$r13,$r12,4(0x4)
1c00445c:	03400000 	andi	$r0,$r0,0x0
1c004460:	2880b076 	ld.w	$r22,$r3,44(0x2c)
1c004464:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c004468:	4c000020 	jirl	$r0,$r1,0

1c00446c <CAT24_Write>:
CAT24_Write():
1c00446c:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c004470:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c004474:	2980a076 	st.w	$r22,$r3,40(0x28)
1c004478:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c00447c:	0015008c 	move	$r12,$r4
1c004480:	001500ad 	move	$r13,$r5
1c004484:	297f7acc 	st.h	$r12,$r22,-34(0xfde)
1c004488:	001501ac 	move	$r12,$r13
1c00448c:	293f76cc 	st.b	$r12,$r22,-35(0xfdd)
1c004490:	2a7f7acc 	ld.hu	$r12,$r22,-34(0xfde)
1c004494:	035ffd8c 	andi	$r12,$r12,0x7ff
1c004498:	297f7acc 	st.h	$r12,$r22,-34(0xfde)
1c00449c:	2a7f7acc 	ld.hu	$r12,$r22,-34(0xfde)
1c0044a0:	00449d8c 	srli.w	$r12,$r12,0x7
1c0044a4:	006f818c 	bstrpick.w	$r12,$r12,0xf,0x0
1c0044a8:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0044ac:	02be818c 	addi.w	$r12,$r12,-96(0xfa0)
1c0044b0:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c0044b4:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c0044b8:	2a3f76cd 	ld.bu	$r13,$r22,-35(0xfdd)
1c0044bc:	001501a6 	move	$r6,$r13
1c0044c0:	00150185 	move	$r5,$r12
1c0044c4:	1c0000e4 	pcaddu12i	$r4,7(0x7)
1c0044c8:	02b7e084 	addi.w	$r4,$r4,-520(0xdf8)
1c0044cc:	57d703ff 	bl	-10496(0xfffd700) # 1c001bcc <myprintf>
1c0044d0:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c0044d4:	00150006 	move	$r6,$r0
1c0044d8:	00150185 	move	$r5,$r12
1c0044dc:	157fd204 	lu12i.w	$r4,-262512(0xbfe90)
1c0044e0:	57fe47ff 	bl	-444(0xffffe44) # 1c004324 <I2C_Send7bitAddress>
1c0044e4:	157fd204 	lu12i.w	$r4,-262512(0xbfe90)
1c0044e8:	57feebff 	bl	-280(0xffffee8) # 1c0043d0 <I2C_wait>
1c0044ec:	157fd20c 	lu12i.w	$r12,-262512(0xbfe90)
1c0044f0:	2a00118c 	ld.bu	$r12,$r12,4(0x4)
1c0044f4:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0044f8:	00005d8c 	ext.w.b	$r12,$r12
1c0044fc:	64001180 	bge	$r12,$r0,16(0x10) # 1c00450c <CAT24_Write+0xa0>
1c004500:	1c0000e4 	pcaddu12i	$r4,7(0x7)
1c004504:	02b79084 	addi.w	$r4,$r4,-540(0xde4)
1c004508:	57d6c7ff 	bl	-10556(0xfffd6c4) # 1c001bcc <myprintf>
1c00450c:	2a7f7acc 	ld.hu	$r12,$r22,-34(0xfde)
1c004510:	0343fd8c 	andi	$r12,$r12,0xff
1c004514:	297f7acc 	st.h	$r12,$r22,-34(0xfde)
1c004518:	2a7f7acc 	ld.hu	$r12,$r22,-34(0xfde)
1c00451c:	00150185 	move	$r5,$r12
1c004520:	1c0000e4 	pcaddu12i	$r4,7(0x7)
1c004524:	02b76084 	addi.w	$r4,$r4,-552(0xdd8)
1c004528:	57d6a7ff 	bl	-10588(0xfffd6a4) # 1c001bcc <myprintf>
1c00452c:	2a7f7acc 	ld.hu	$r12,$r22,-34(0xfde)
1c004530:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c004534:	00150185 	move	$r5,$r12
1c004538:	157fd204 	lu12i.w	$r4,-262512(0xbfe90)
1c00453c:	57fd3bff 	bl	-712(0xffffd38) # 1c004274 <I2C_SendData>
1c004540:	157fd204 	lu12i.w	$r4,-262512(0xbfe90)
1c004544:	57fe8fff 	bl	-372(0xffffe8c) # 1c0043d0 <I2C_wait>
1c004548:	157fd20c 	lu12i.w	$r12,-262512(0xbfe90)
1c00454c:	2a00118c 	ld.bu	$r12,$r12,4(0x4)
1c004550:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c004554:	00005d8c 	ext.w.b	$r12,$r12
1c004558:	64001180 	bge	$r12,$r0,16(0x10) # 1c004568 <CAT24_Write+0xfc>
1c00455c:	1c0000e4 	pcaddu12i	$r4,7(0x7)
1c004560:	02b62084 	addi.w	$r4,$r4,-632(0xd88)
1c004564:	57d66bff 	bl	-10648(0xfffd668) # 1c001bcc <myprintf>
1c004568:	2a3f76cc 	ld.bu	$r12,$r22,-35(0xfdd)
1c00456c:	00150185 	move	$r5,$r12
1c004570:	157fd204 	lu12i.w	$r4,-262512(0xbfe90)
1c004574:	57fd03ff 	bl	-768(0xffffd00) # 1c004274 <I2C_SendData>
1c004578:	157fd204 	lu12i.w	$r4,-262512(0xbfe90)
1c00457c:	57fe57ff 	bl	-428(0xffffe54) # 1c0043d0 <I2C_wait>
1c004580:	157fd20c 	lu12i.w	$r12,-262512(0xbfe90)
1c004584:	2a00118c 	ld.bu	$r12,$r12,4(0x4)
1c004588:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c00458c:	00005d8c 	ext.w.b	$r12,$r12
1c004590:	64001180 	bge	$r12,$r0,16(0x10) # 1c0045a0 <CAT24_Write+0x134>
1c004594:	1c0000e4 	pcaddu12i	$r4,7(0x7)
1c004598:	02b54084 	addi.w	$r4,$r4,-688(0xd50)
1c00459c:	57d633ff 	bl	-10704(0xfffd630) # 1c001bcc <myprintf>
1c0045a0:	02800405 	addi.w	$r5,$r0,1(0x1)
1c0045a4:	157fd204 	lu12i.w	$r4,-262512(0xbfe90)
1c0045a8:	57fc63ff 	bl	-928(0xffffc60) # 1c004208 <I2C_GenerateSTOP>
1c0045ac:	157fd204 	lu12i.w	$r4,-262512(0xbfe90)
1c0045b0:	57fe23ff 	bl	-480(0xffffe20) # 1c0043d0 <I2C_wait>
1c0045b4:	03400000 	andi	$r0,$r0,0x0
1c0045b8:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c0045bc:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c0045c0:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c0045c4:	4c000020 	jirl	$r0,$r1,0

1c0045c8 <CAT24_Read>:
CAT24_Read():
1c0045c8:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c0045cc:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c0045d0:	2980a076 	st.w	$r22,$r3,40(0x28)
1c0045d4:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c0045d8:	0015008c 	move	$r12,$r4
1c0045dc:	297f7acc 	st.h	$r12,$r22,-34(0xfde)
1c0045e0:	2a7f7acc 	ld.hu	$r12,$r22,-34(0xfde)
1c0045e4:	035ffd8c 	andi	$r12,$r12,0x7ff
1c0045e8:	297f7acc 	st.h	$r12,$r22,-34(0xfde)
1c0045ec:	2a7f7acc 	ld.hu	$r12,$r22,-34(0xfde)
1c0045f0:	00449d8c 	srli.w	$r12,$r12,0x7
1c0045f4:	006f818c 	bstrpick.w	$r12,$r12,0xf,0x0
1c0045f8:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0045fc:	02be818c 	addi.w	$r12,$r12,-96(0xfa0)
1c004600:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c004604:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c004608:	00150185 	move	$r5,$r12
1c00460c:	1c0000e4 	pcaddu12i	$r4,7(0x7)
1c004610:	02b3e084 	addi.w	$r4,$r4,-776(0xcf8)
1c004614:	57d5bbff 	bl	-10824(0xfffd5b8) # 1c001bcc <myprintf>
1c004618:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c00461c:	00150006 	move	$r6,$r0
1c004620:	00150185 	move	$r5,$r12
1c004624:	157fd204 	lu12i.w	$r4,-262512(0xbfe90)
1c004628:	57fcffff 	bl	-772(0xffffcfc) # 1c004324 <I2C_Send7bitAddress>
1c00462c:	157fd204 	lu12i.w	$r4,-262512(0xbfe90)
1c004630:	57fda3ff 	bl	-608(0xffffda0) # 1c0043d0 <I2C_wait>
1c004634:	157fd20c 	lu12i.w	$r12,-262512(0xbfe90)
1c004638:	2a00118c 	ld.bu	$r12,$r12,4(0x4)
1c00463c:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c004640:	00005d8c 	ext.w.b	$r12,$r12
1c004644:	64001180 	bge	$r12,$r0,16(0x10) # 1c004654 <CAT24_Read+0x8c>
1c004648:	1c0000e4 	pcaddu12i	$r4,7(0x7)
1c00464c:	02b36084 	addi.w	$r4,$r4,-808(0xcd8)
1c004650:	57d57fff 	bl	-10884(0xfffd57c) # 1c001bcc <myprintf>
1c004654:	2a7f7acc 	ld.hu	$r12,$r22,-34(0xfde)
1c004658:	00150185 	move	$r5,$r12
1c00465c:	1c0000e4 	pcaddu12i	$r4,7(0x7)
1c004660:	02b34084 	addi.w	$r4,$r4,-816(0xcd0)
1c004664:	57d56bff 	bl	-10904(0xfffd568) # 1c001bcc <myprintf>
1c004668:	2a7f7acc 	ld.hu	$r12,$r22,-34(0xfde)
1c00466c:	0343fd8c 	andi	$r12,$r12,0xff
1c004670:	297f7acc 	st.h	$r12,$r22,-34(0xfde)
1c004674:	2a7f7acc 	ld.hu	$r12,$r22,-34(0xfde)
1c004678:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c00467c:	00150185 	move	$r5,$r12
1c004680:	157fd204 	lu12i.w	$r4,-262512(0xbfe90)
1c004684:	57fbf3ff 	bl	-1040(0xffffbf0) # 1c004274 <I2C_SendData>
1c004688:	157fd204 	lu12i.w	$r4,-262512(0xbfe90)
1c00468c:	57fd47ff 	bl	-700(0xffffd44) # 1c0043d0 <I2C_wait>
1c004690:	157fd20c 	lu12i.w	$r12,-262512(0xbfe90)
1c004694:	2a00118c 	ld.bu	$r12,$r12,4(0x4)
1c004698:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c00469c:	00005d8c 	ext.w.b	$r12,$r12
1c0046a0:	64001180 	bge	$r12,$r0,16(0x10) # 1c0046b0 <CAT24_Read+0xe8>
1c0046a4:	1c0000e4 	pcaddu12i	$r4,7(0x7)
1c0046a8:	02b1f084 	addi.w	$r4,$r4,-900(0xc7c)
1c0046ac:	57d523ff 	bl	-10976(0xfffd520) # 1c001bcc <myprintf>
1c0046b0:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c0046b4:	02800406 	addi.w	$r6,$r0,1(0x1)
1c0046b8:	00150185 	move	$r5,$r12
1c0046bc:	157fd204 	lu12i.w	$r4,-262512(0xbfe90)
1c0046c0:	57fc67ff 	bl	-924(0xffffc64) # 1c004324 <I2C_Send7bitAddress>
1c0046c4:	157fd204 	lu12i.w	$r4,-262512(0xbfe90)
1c0046c8:	57fd0bff 	bl	-760(0xffffd08) # 1c0043d0 <I2C_wait>
1c0046cc:	157fd20c 	lu12i.w	$r12,-262512(0xbfe90)
1c0046d0:	2a00118c 	ld.bu	$r12,$r12,4(0x4)
1c0046d4:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0046d8:	00005d8c 	ext.w.b	$r12,$r12
1c0046dc:	64001180 	bge	$r12,$r0,16(0x10) # 1c0046ec <CAT24_Read+0x124>
1c0046e0:	1c0000e4 	pcaddu12i	$r4,7(0x7)
1c0046e4:	02b10084 	addi.w	$r4,$r4,-960(0xc40)
1c0046e8:	57d4e7ff 	bl	-11036(0xfffd4e4) # 1c001bcc <myprintf>
1c0046ec:	02810006 	addi.w	$r6,$r0,64(0x40)
1c0046f0:	02802005 	addi.w	$r5,$r0,8(0x8)
1c0046f4:	157fd204 	lu12i.w	$r4,-262512(0xbfe90)
1c0046f8:	57fbcfff 	bl	-1076(0xffffbcc) # 1c0042c4 <I2C_ReceiveData>
1c0046fc:	157fd204 	lu12i.w	$r4,-262512(0xbfe90)
1c004700:	57fcd3ff 	bl	-816(0xffffcd0) # 1c0043d0 <I2C_wait>
1c004704:	157fd20c 	lu12i.w	$r12,-262512(0xbfe90)
1c004708:	2a000d8c 	ld.bu	$r12,$r12,3(0x3)
1c00470c:	293fbacc 	st.b	$r12,$r22,-18(0xfee)
1c004710:	2a3fbacc 	ld.bu	$r12,$r22,-18(0xfee)
1c004714:	00150184 	move	$r4,$r12
1c004718:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c00471c:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c004720:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c004724:	4c000020 	jirl	$r0,$r1,0

1c004728 <dma_reset>:
dma_reset():
1c004728:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c00472c:	29807076 	st.w	$r22,$r3,28(0x1c)
1c004730:	02808076 	addi.w	$r22,$r3,32(0x20)
1c004734:	157fd80c 	lu12i.w	$r12,-262464(0xbfec0)
1c004738:	0380218c 	ori	$r12,$r12,0x8
1c00473c:	1500000d 	lu12i.w	$r13,-524288(0x80000)
1c004740:	2980018d 	st.w	$r13,$r12,0
1c004744:	157fd80c 	lu12i.w	$r12,-262464(0xbfec0)
1c004748:	0380218c 	ori	$r12,$r12,0x8
1c00474c:	2880018c 	ld.w	$r12,$r12,0
1c004750:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c004754:	50001400 	b	20(0x14) # 1c004768 <dma_reset+0x40>
1c004758:	157fd80c 	lu12i.w	$r12,-262464(0xbfec0)
1c00475c:	0380218c 	ori	$r12,$r12,0x8
1c004760:	2880018c 	ld.w	$r12,$r12,0
1c004764:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c004768:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c00476c:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c004770:	5fffe9ac 	bne	$r13,$r12,-24(0x3ffe8) # 1c004758 <dma_reset+0x30>
1c004774:	03400000 	andi	$r0,$r0,0x0
1c004778:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c00477c:	02808063 	addi.w	$r3,$r3,32(0x20)
1c004780:	4c000020 	jirl	$r0,$r1,0

1c004784 <dma_start>:
dma_start():
1c004784:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c004788:	2980b076 	st.w	$r22,$r3,44(0x2c)
1c00478c:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c004790:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c004794:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c004798:	29bf52c6 	st.w	$r6,$r22,-44(0xfd4)
1c00479c:	157fd80c 	lu12i.w	$r12,-262464(0xbfec0)
1c0047a0:	0380218c 	ori	$r12,$r12,0x8
1c0047a4:	2880018c 	ld.w	$r12,$r12,0
1c0047a8:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0047ac:	50001400 	b	20(0x14) # 1c0047c0 <dma_start+0x3c>
1c0047b0:	157fd80c 	lu12i.w	$r12,-262464(0xbfec0)
1c0047b4:	0380218c 	ori	$r12,$r12,0x8
1c0047b8:	2880018c 	ld.w	$r12,$r12,0
1c0047bc:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0047c0:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c0047c4:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0047c8:	5fffe9ac 	bne	$r13,$r12,-24(0x3ffe8) # 1c0047b0 <dma_start+0x2c>
1c0047cc:	157fd80c 	lu12i.w	$r12,-262464(0xbfec0)
1c0047d0:	28bf72ce 	ld.w	$r14,$r22,-36(0xfdc)
1c0047d4:	143fffed 	lu12i.w	$r13,131071(0x1ffff)
1c0047d8:	03bffdad 	ori	$r13,$r13,0xfff
1c0047dc:	0014b5cd 	and	$r13,$r14,$r13
1c0047e0:	2980018d 	st.w	$r13,$r12,0
1c0047e4:	157fd80c 	lu12i.w	$r12,-262464(0xbfec0)
1c0047e8:	0380118c 	ori	$r12,$r12,0x4
1c0047ec:	28bf62cd 	ld.w	$r13,$r22,-40(0xfd8)
1c0047f0:	2980018d 	st.w	$r13,$r12,0
1c0047f4:	28bf52cd 	ld.w	$r13,$r22,-44(0xfd4)
1c0047f8:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0047fc:	5c0019ac 	bne	$r13,$r12,24(0x18) # 1c004814 <dma_start+0x90>
1c004800:	157fd80c 	lu12i.w	$r12,-262464(0xbfec0)
1c004804:	0380218c 	ori	$r12,$r12,0x8
1c004808:	02800c0d 	addi.w	$r13,$r0,3(0x3)
1c00480c:	2980018d 	st.w	$r13,$r12,0
1c004810:	50001400 	b	20(0x14) # 1c004824 <dma_start+0xa0>
1c004814:	157fd80c 	lu12i.w	$r12,-262464(0xbfec0)
1c004818:	0380218c 	ori	$r12,$r12,0x8
1c00481c:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c004820:	2980018d 	st.w	$r13,$r12,0
1c004824:	03400000 	andi	$r0,$r0,0x0
1c004828:	2880b076 	ld.w	$r22,$r3,44(0x2c)
1c00482c:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c004830:	4c000020 	jirl	$r0,$r1,0

1c004834 <Touch_CountBaseInit>:
Touch_CountBaseInit():
1c004834:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c004838:	29807076 	st.w	$r22,$r3,28(0x1c)
1c00483c:	02808076 	addi.w	$r22,$r3,32(0x20)
1c004840:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c004844:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004848:	2a00018c 	ld.bu	$r12,$r12,0
1c00484c:	0040e18d 	slli.w	$r13,$r12,0x18
1c004850:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004854:	2a00058c 	ld.bu	$r12,$r12,1(0x1)
1c004858:	0040c18c 	slli.w	$r12,$r12,0x10
1c00485c:	001531ad 	or	$r13,$r13,$r12
1c004860:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004864:	2a00098c 	ld.bu	$r12,$r12,2(0x2)
1c004868:	0040bd8e 	slli.w	$r14,$r12,0xf
1c00486c:	140001ec 	lu12i.w	$r12,15(0xf)
1c004870:	03bffd8c 	ori	$r12,$r12,0xfff
1c004874:	0014b1cc 	and	$r12,$r14,$r12
1c004878:	001531ad 	or	$r13,$r13,$r12
1c00487c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004880:	2a000d8c 	ld.bu	$r12,$r12,3(0x3)
1c004884:	0040a18e 	slli.w	$r14,$r12,0x8
1c004888:	1400002c 	lu12i.w	$r12,1(0x1)
1c00488c:	03bc018c 	ori	$r12,$r12,0xf00
1c004890:	0014b1cc 	and	$r12,$r14,$r12
1c004894:	001531ad 	or	$r13,$r13,$r12
1c004898:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00489c:	2a00118c 	ld.bu	$r12,$r12,4(0x4)
1c0048a0:	03403d8c 	andi	$r12,$r12,0xf
1c0048a4:	001531ad 	or	$r13,$r13,$r12
1c0048a8:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c0048ac:	0380218c 	ori	$r12,$r12,0x8
1c0048b0:	2980018d 	st.w	$r13,$r12,0
1c0048b4:	03400000 	andi	$r0,$r0,0x0
1c0048b8:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c0048bc:	02808063 	addi.w	$r3,$r3,32(0x20)
1c0048c0:	4c000020 	jirl	$r0,$r1,0

1c0048c4 <Touch_PerformInit>:
Touch_PerformInit():
1c0048c4:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0048c8:	29807076 	st.w	$r22,$r3,28(0x1c)
1c0048cc:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0048d0:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c0048d4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0048d8:	2a00018c 	ld.bu	$r12,$r12,0
1c0048dc:	0040e18d 	slli.w	$r13,$r12,0x18
1c0048e0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0048e4:	2a00058c 	ld.bu	$r12,$r12,1(0x1)
1c0048e8:	0040d98e 	slli.w	$r14,$r12,0x16
1c0048ec:	1401800c 	lu12i.w	$r12,3072(0xc00)
1c0048f0:	0014b1cc 	and	$r12,$r14,$r12
1c0048f4:	001531ad 	or	$r13,$r13,$r12
1c0048f8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0048fc:	2a00098c 	ld.bu	$r12,$r12,2(0x2)
1c004900:	0040c18e 	slli.w	$r14,$r12,0x10
1c004904:	14007e0c 	lu12i.w	$r12,1008(0x3f0)
1c004908:	0014b1cc 	and	$r12,$r14,$r12
1c00490c:	001531ad 	or	$r13,$r13,$r12
1c004910:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004914:	2a000d8c 	ld.bu	$r12,$r12,3(0x3)
1c004918:	0040a18c 	slli.w	$r12,$r12,0x8
1c00491c:	037c018c 	andi	$r12,$r12,0xf00
1c004920:	001531ac 	or	$r12,$r13,$r12
1c004924:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c004928:	2a0011ad 	ld.bu	$r13,$r13,4(0x4)
1c00492c:	0015358d 	or	$r13,$r12,$r13
1c004930:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c004934:	0380318c 	ori	$r12,$r12,0xc
1c004938:	2980018d 	st.w	$r13,$r12,0
1c00493c:	03400000 	andi	$r0,$r0,0x0
1c004940:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c004944:	02808063 	addi.w	$r3,$r3,32(0x20)
1c004948:	4c000020 	jirl	$r0,$r1,0

1c00494c <Touch_ControlConfig>:
Touch_ControlConfig():
1c00494c:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c004950:	29807076 	st.w	$r22,$r3,28(0x1c)
1c004954:	02808076 	addi.w	$r22,$r3,32(0x20)
1c004958:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c00495c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004960:	2a40018c 	ld.hu	$r12,$r12,0
1c004964:	0040c18d 	slli.w	$r13,$r12,0x10
1c004968:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00496c:	2a00098c 	ld.bu	$r12,$r12,2(0x2)
1c004970:	0040bd8e 	slli.w	$r14,$r12,0xf
1c004974:	140001ec 	lu12i.w	$r12,15(0xf)
1c004978:	03bffd8c 	ori	$r12,$r12,0xfff
1c00497c:	0014b1cc 	and	$r12,$r14,$r12
1c004980:	001531ad 	or	$r13,$r13,$r12
1c004984:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004988:	2a000d8c 	ld.bu	$r12,$r12,3(0x3)
1c00498c:	0040b18e 	slli.w	$r14,$r12,0xc
1c004990:	140000ec 	lu12i.w	$r12,7(0x7)
1c004994:	0014b1cc 	and	$r12,$r14,$r12
1c004998:	001531ad 	or	$r13,$r13,$r12
1c00499c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0049a0:	2a00118c 	ld.bu	$r12,$r12,4(0x4)
1c0049a4:	0040ad8c 	slli.w	$r12,$r12,0xb
1c0049a8:	0360018c 	andi	$r12,$r12,0x800
1c0049ac:	001531ad 	or	$r13,$r13,$r12
1c0049b0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0049b4:	2a00158c 	ld.bu	$r12,$r12,5(0x5)
1c0049b8:	0040a18c 	slli.w	$r12,$r12,0x8
1c0049bc:	034c018c 	andi	$r12,$r12,0x300
1c0049c0:	001531ad 	or	$r13,$r13,$r12
1c0049c4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0049c8:	2a00198c 	ld.bu	$r12,$r12,6(0x6)
1c0049cc:	0040918c 	slli.w	$r12,$r12,0x4
1c0049d0:	0343fd8c 	andi	$r12,$r12,0xff
1c0049d4:	001531ad 	or	$r13,$r13,$r12
1c0049d8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0049dc:	2a001d8c 	ld.bu	$r12,$r12,7(0x7)
1c0049e0:	0040858c 	slli.w	$r12,$r12,0x1
1c0049e4:	0340098c 	andi	$r12,$r12,0x2
1c0049e8:	001531ad 	or	$r13,$r13,$r12
1c0049ec:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0049f0:	2a00218c 	ld.bu	$r12,$r12,8(0x8)
1c0049f4:	0340058c 	andi	$r12,$r12,0x1
1c0049f8:	001531ad 	or	$r13,$r13,$r12
1c0049fc:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c004a00:	2980018d 	st.w	$r13,$r12,0
1c004a04:	03400000 	andi	$r0,$r0,0x0
1c004a08:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c004a0c:	02808063 	addi.w	$r3,$r3,32(0x20)
1c004a10:	4c000020 	jirl	$r0,$r1,0

1c004a14 <TOUCH_Cmd>:
TOUCH_Cmd():
1c004a14:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c004a18:	29807076 	st.w	$r22,$r3,28(0x1c)
1c004a1c:	02808076 	addi.w	$r22,$r3,32(0x20)
1c004a20:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c004a24:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004a28:	40002580 	beqz	$r12,36(0x24) # 1c004a4c <TOUCH_Cmd+0x38>
1c004a2c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004a30:	0380118c 	ori	$r12,$r12,0x4
1c004a34:	2880018d 	ld.w	$r13,$r12,0
1c004a38:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004a3c:	0380118c 	ori	$r12,$r12,0x4
1c004a40:	038801ad 	ori	$r13,$r13,0x200
1c004a44:	2980018d 	st.w	$r13,$r12,0
1c004a48:	50002400 	b	36(0x24) # 1c004a6c <TOUCH_Cmd+0x58>
1c004a4c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004a50:	0380118c 	ori	$r12,$r12,0x4
1c004a54:	2880018e 	ld.w	$r14,$r12,0
1c004a58:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c004a5c:	0380118c 	ori	$r12,$r12,0x4
1c004a60:	02b7fc0d 	addi.w	$r13,$r0,-513(0xdff)
1c004a64:	0014b5cd 	and	$r13,$r14,$r13
1c004a68:	2980018d 	st.w	$r13,$r12,0
1c004a6c:	03400000 	andi	$r0,$r0,0x0
1c004a70:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c004a74:	02808063 	addi.w	$r3,$r3,32(0x20)
1c004a78:	4c000020 	jirl	$r0,$r1,0

1c004a7c <TOUCH_GetBaseVal>:
TOUCH_GetBaseVal():
1c004a7c:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c004a80:	29807076 	st.w	$r22,$r3,28(0x1c)
1c004a84:	02808076 	addi.w	$r22,$r3,32(0x20)
1c004a88:	0015008c 	move	$r12,$r4
1c004a8c:	297fbacc 	st.h	$r12,$r22,-18(0xfee)
1c004a90:	2a7fbacc 	ld.hu	$r12,$r22,-18(0xfee)
1c004a94:	0040898c 	slli.w	$r12,$r12,0x2
1c004a98:	0015018d 	move	$r13,$r12
1c004a9c:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c004aa0:	0381018c 	ori	$r12,$r12,0x40
1c004aa4:	001031ac 	add.w	$r12,$r13,$r12
1c004aa8:	2880018c 	ld.w	$r12,$r12,0
1c004aac:	006f818c 	bstrpick.w	$r12,$r12,0xf,0x0
1c004ab0:	037ffd8c 	andi	$r12,$r12,0xfff
1c004ab4:	006f818c 	bstrpick.w	$r12,$r12,0xf,0x0
1c004ab8:	00150184 	move	$r4,$r12
1c004abc:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c004ac0:	02808063 	addi.w	$r3,$r3,32(0x20)
1c004ac4:	4c000020 	jirl	$r0,$r1,0

1c004ac8 <TOUCH_GetCountValue>:
TOUCH_GetCountValue():
1c004ac8:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c004acc:	29807076 	st.w	$r22,$r3,28(0x1c)
1c004ad0:	02808076 	addi.w	$r22,$r3,32(0x20)
1c004ad4:	0015008c 	move	$r12,$r4
1c004ad8:	297fbacc 	st.h	$r12,$r22,-18(0xfee)
1c004adc:	2a7fbacc 	ld.hu	$r12,$r22,-18(0xfee)
1c004ae0:	0040898c 	slli.w	$r12,$r12,0x2
1c004ae4:	0015018d 	move	$r13,$r12
1c004ae8:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c004aec:	0382018c 	ori	$r12,$r12,0x80
1c004af0:	001031ac 	add.w	$r12,$r13,$r12
1c004af4:	2880018c 	ld.w	$r12,$r12,0
1c004af8:	006f818c 	bstrpick.w	$r12,$r12,0xf,0x0
1c004afc:	037ffd8c 	andi	$r12,$r12,0xfff
1c004b00:	006f818c 	bstrpick.w	$r12,$r12,0xf,0x0
1c004b04:	00150184 	move	$r4,$r12
1c004b08:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c004b0c:	02808063 	addi.w	$r3,$r3,32(0x20)
1c004b10:	4c000020 	jirl	$r0,$r1,0

1c004b14 <TOUCH_EnablePollScan>:
TOUCH_EnablePollScan():
1c004b14:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c004b18:	29803076 	st.w	$r22,$r3,12(0xc)
1c004b1c:	02804076 	addi.w	$r22,$r3,16(0x10)
1c004b20:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c004b24:	2880018d 	ld.w	$r13,$r12,0
1c004b28:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c004b2c:	038009ad 	ori	$r13,$r13,0x2
1c004b30:	2980018d 	st.w	$r13,$r12,0
1c004b34:	03400000 	andi	$r0,$r0,0x0
1c004b38:	28803076 	ld.w	$r22,$r3,12(0xc)
1c004b3c:	02804063 	addi.w	$r3,$r3,16(0x10)
1c004b40:	4c000020 	jirl	$r0,$r1,0

1c004b44 <TOUCH_EnableSingleScan>:
TOUCH_EnableSingleScan():
1c004b44:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c004b48:	29803076 	st.w	$r22,$r3,12(0xc)
1c004b4c:	02804076 	addi.w	$r22,$r3,16(0x10)
1c004b50:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c004b54:	2880018d 	ld.w	$r13,$r12,0
1c004b58:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c004b5c:	038005ad 	ori	$r13,$r13,0x1
1c004b60:	2980018d 	st.w	$r13,$r12,0
1c004b64:	03400000 	andi	$r0,$r0,0x0
1c004b68:	28803076 	ld.w	$r22,$r3,12(0xc)
1c004b6c:	02804063 	addi.w	$r3,$r3,16(0x10)
1c004b70:	4c000020 	jirl	$r0,$r1,0

1c004b74 <TOUCH_SetDownTh>:
TOUCH_SetDownTh():
1c004b74:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c004b78:	29807076 	st.w	$r22,$r3,28(0x1c)
1c004b7c:	02808076 	addi.w	$r22,$r3,32(0x20)
1c004b80:	0015008c 	move	$r12,$r4
1c004b84:	001500ad 	move	$r13,$r5
1c004b88:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c004b8c:	001501ac 	move	$r12,$r13
1c004b90:	293fbacc 	st.b	$r12,$r22,-18(0xfee)
1c004b94:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c004b98:	0040898c 	slli.w	$r12,$r12,0x2
1c004b9c:	0015018d 	move	$r13,$r12
1c004ba0:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c004ba4:	0381018c 	ori	$r12,$r12,0x40
1c004ba8:	001031ac 	add.w	$r12,$r13,$r12
1c004bac:	2880018c 	ld.w	$r12,$r12,0
1c004bb0:	037ffd8c 	andi	$r12,$r12,0xfff
1c004bb4:	2a3fbacd 	ld.bu	$r13,$r22,-18(0xfee)
1c004bb8:	0040e1ad 	slli.w	$r13,$r13,0x18
1c004bbc:	001501ae 	move	$r14,$r13
1c004bc0:	2a3fbecd 	ld.bu	$r13,$r22,-17(0xfef)
1c004bc4:	004089ad 	slli.w	$r13,$r13,0x2
1c004bc8:	001501af 	move	$r15,$r13
1c004bcc:	157fd68d 	lu12i.w	$r13,-262476(0xbfeb4)
1c004bd0:	038101ad 	ori	$r13,$r13,0x40
1c004bd4:	001035ed 	add.w	$r13,$r15,$r13
1c004bd8:	0015398c 	or	$r12,$r12,$r14
1c004bdc:	298001ac 	st.w	$r12,$r13,0
1c004be0:	03400000 	andi	$r0,$r0,0x0
1c004be4:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c004be8:	02808063 	addi.w	$r3,$r3,32(0x20)
1c004bec:	4c000020 	jirl	$r0,$r1,0

1c004bf0 <TOUCH_SetChnAttr>:
TOUCH_SetChnAttr():
1c004bf0:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c004bf4:	29807076 	st.w	$r22,$r3,28(0x1c)
1c004bf8:	02808076 	addi.w	$r22,$r3,32(0x20)
1c004bfc:	0015008c 	move	$r12,$r4
1c004c00:	001500ad 	move	$r13,$r5
1c004c04:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c004c08:	001501ac 	move	$r12,$r13
1c004c0c:	293fbacc 	st.b	$r12,$r22,-18(0xfee)
1c004c10:	2a3fbacc 	ld.bu	$r12,$r22,-18(0xfee)
1c004c14:	0040e18c 	slli.w	$r12,$r12,0x18
1c004c18:	0015018e 	move	$r14,$r12
1c004c1c:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c004c20:	0040898c 	slli.w	$r12,$r12,0x2
1c004c24:	0015018d 	move	$r13,$r12
1c004c28:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c004c2c:	0382018c 	ori	$r12,$r12,0x80
1c004c30:	001031ac 	add.w	$r12,$r13,$r12
1c004c34:	2880018c 	ld.w	$r12,$r12,0
1c004c38:	037ffd8c 	andi	$r12,$r12,0xfff
1c004c3c:	2a3fbecd 	ld.bu	$r13,$r22,-17(0xfef)
1c004c40:	004089ad 	slli.w	$r13,$r13,0x2
1c004c44:	001501af 	move	$r15,$r13
1c004c48:	157fd68d 	lu12i.w	$r13,-262476(0xbfeb4)
1c004c4c:	038101ad 	ori	$r13,$r13,0x40
1c004c50:	001035ed 	add.w	$r13,$r15,$r13
1c004c54:	001531cc 	or	$r12,$r14,$r12
1c004c58:	298001ac 	st.w	$r12,$r13,0
1c004c5c:	03400000 	andi	$r0,$r0,0x0
1c004c60:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c004c64:	02808063 	addi.w	$r3,$r3,32(0x20)
1c004c68:	4c000020 	jirl	$r0,$r1,0

1c004c6c <TOUCH_SetAllChnAttr>:
TOUCH_SetAllChnAttr():
1c004c6c:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c004c70:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c004c74:	2980a076 	st.w	$r22,$r3,40(0x28)
1c004c78:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c004c7c:	0015008c 	move	$r12,$r4
1c004c80:	293f7ecc 	st.b	$r12,$r22,-33(0xfdf)
1c004c84:	297fbac0 	st.h	$r0,$r22,-18(0xfee)
1c004c88:	50002800 	b	40(0x28) # 1c004cb0 <TOUCH_SetAllChnAttr+0x44>
1c004c8c:	2a7fbacc 	ld.hu	$r12,$r22,-18(0xfee)
1c004c90:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c004c94:	2a3f7ecd 	ld.bu	$r13,$r22,-33(0xfdf)
1c004c98:	001501a5 	move	$r5,$r13
1c004c9c:	00150184 	move	$r4,$r12
1c004ca0:	57ff53ff 	bl	-176(0xfffff50) # 1c004bf0 <TOUCH_SetChnAttr>
1c004ca4:	2a7fbacc 	ld.hu	$r12,$r22,-18(0xfee)
1c004ca8:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c004cac:	297fbacc 	st.h	$r12,$r22,-18(0xfee)
1c004cb0:	2a7fbacd 	ld.hu	$r13,$r22,-18(0xfee)
1c004cb4:	02802c0c 	addi.w	$r12,$r0,11(0xb)
1c004cb8:	6fffd58d 	bgeu	$r12,$r13,-44(0x3ffd4) # 1c004c8c <TOUCH_SetAllChnAttr+0x20>
1c004cbc:	03400000 	andi	$r0,$r0,0x0
1c004cc0:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c004cc4:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c004cc8:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c004ccc:	4c000020 	jirl	$r0,$r1,0

1c004cd0 <TOUCH_Init>:
TOUCH_Init():
1c004cd0:	02bf0063 	addi.w	$r3,$r3,-64(0xfc0)
1c004cd4:	2980f061 	st.w	$r1,$r3,60(0x3c)
1c004cd8:	2980e076 	st.w	$r22,$r3,56(0x38)
1c004cdc:	02810076 	addi.w	$r22,$r3,64(0x40)
1c004ce0:	0015008c 	move	$r12,$r4
1c004ce4:	293f3ecc 	st.b	$r12,$r22,-49(0xfcf)
1c004ce8:	0281400c 	addi.w	$r12,$r0,80(0x50)
1c004cec:	293fa2cc 	st.b	$r12,$r22,-24(0xfe8)
1c004cf0:	0280400c 	addi.w	$r12,$r0,16(0x10)
1c004cf4:	293fa6cc 	st.b	$r12,$r22,-23(0xfe9)
1c004cf8:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c004cfc:	293faacc 	st.b	$r12,$r22,-22(0xfea)
1c004d00:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c004d04:	293faecc 	st.b	$r12,$r22,-21(0xfeb)
1c004d08:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c004d0c:	293fb2cc 	st.b	$r12,$r22,-20(0xfec)
1c004d10:	02bfa2cc 	addi.w	$r12,$r22,-24(0xfe8)
1c004d14:	00150184 	move	$r4,$r12
1c004d18:	57fb1fff 	bl	-1252(0xffffb1c) # 1c004834 <Touch_CountBaseInit>
1c004d1c:	02800c0c 	addi.w	$r12,$r0,3(0x3)
1c004d20:	293f82cc 	st.b	$r12,$r22,-32(0xfe0)
1c004d24:	293f86c0 	st.b	$r0,$r22,-31(0xfe1)
1c004d28:	0280200c 	addi.w	$r12,$r0,8(0x8)
1c004d2c:	293f8acc 	st.b	$r12,$r22,-30(0xfe2)
1c004d30:	0280200c 	addi.w	$r12,$r0,8(0x8)
1c004d34:	293f8ecc 	st.b	$r12,$r22,-29(0xfe3)
1c004d38:	02bffc0c 	addi.w	$r12,$r0,-1(0xfff)
1c004d3c:	293f92cc 	st.b	$r12,$r22,-28(0xfe4)
1c004d40:	02bf82cc 	addi.w	$r12,$r22,-32(0xfe0)
1c004d44:	00150184 	move	$r4,$r12
1c004d48:	57fb7fff 	bl	-1156(0xffffb7c) # 1c0048c4 <Touch_PerformInit>
1c004d4c:	03bffc0c 	ori	$r12,$r0,0xfff
1c004d50:	297f52cc 	st.h	$r12,$r22,-44(0xfd4)
1c004d54:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c004d58:	293f5acc 	st.b	$r12,$r22,-42(0xfd6)
1c004d5c:	02800c0c 	addi.w	$r12,$r0,3(0x3)
1c004d60:	293f5ecc 	st.b	$r12,$r22,-41(0xfd7)
1c004d64:	293f62c0 	st.b	$r0,$r22,-40(0xfd8)
1c004d68:	02800c0c 	addi.w	$r12,$r0,3(0x3)
1c004d6c:	293f66cc 	st.b	$r12,$r22,-39(0xfd9)
1c004d70:	02800c0c 	addi.w	$r12,$r0,3(0x3)
1c004d74:	293f6acc 	st.b	$r12,$r22,-38(0xfda)
1c004d78:	293f6ec0 	st.b	$r0,$r22,-37(0xfdb)
1c004d7c:	293f72c0 	st.b	$r0,$r22,-36(0xfdc)
1c004d80:	02bf52cc 	addi.w	$r12,$r22,-44(0xfd4)
1c004d84:	00150184 	move	$r4,$r12
1c004d88:	57fbc7ff 	bl	-1084(0xffffbc4) # 1c00494c <Touch_ControlConfig>
1c004d8c:	57fdbbff 	bl	-584(0xffffdb8) # 1c004b44 <TOUCH_EnableSingleScan>
1c004d90:	03400000 	andi	$r0,$r0,0x0
1c004d94:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c004d98:	2880018c 	ld.w	$r12,$r12,0
1c004d9c:	0340058c 	andi	$r12,$r12,0x1
1c004da0:	47fff59f 	bnez	$r12,-12(0x7ffff4) # 1c004d94 <TOUCH_Init+0xc4>
1c004da4:	2a3f3ecc 	ld.bu	$r12,$r22,-49(0xfcf)
1c004da8:	00150184 	move	$r4,$r12
1c004dac:	57fec3ff 	bl	-320(0xffffec0) # 1c004c6c <TOUCH_SetAllChnAttr>
1c004db0:	02800404 	addi.w	$r4,$r0,1(0x1)
1c004db4:	57fc63ff 	bl	-928(0xffffc60) # 1c004a14 <TOUCH_Cmd>
1c004db8:	03400000 	andi	$r0,$r0,0x0
1c004dbc:	2880f061 	ld.w	$r1,$r3,60(0x3c)
1c004dc0:	2880e076 	ld.w	$r22,$r3,56(0x38)
1c004dc4:	02810063 	addi.w	$r3,$r3,64(0x40)
1c004dc8:	4c000020 	jirl	$r0,$r1,0

1c004dcc <Printf_CountVal>:
Printf_CountVal():
1c004dcc:	02bec063 	addi.w	$r3,$r3,-80(0xfb0)
1c004dd0:	29813061 	st.w	$r1,$r3,76(0x4c)
1c004dd4:	29812076 	st.w	$r22,$r3,72(0x48)
1c004dd8:	02814076 	addi.w	$r22,$r3,80(0x50)
1c004ddc:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c004de0:	50003c00 	b	60(0x3c) # 1c004e1c <Printf_CountVal+0x50>
1c004de4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004de8:	006f818c 	bstrpick.w	$r12,$r12,0xf,0x0
1c004dec:	00150184 	move	$r4,$r12
1c004df0:	57fcdbff 	bl	-808(0xffffcd8) # 1c004ac8 <TOUCH_GetCountValue>
1c004df4:	0015008c 	move	$r12,$r4
1c004df8:	0015018d 	move	$r13,$r12
1c004dfc:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004e00:	0040898c 	slli.w	$r12,$r12,0x2
1c004e04:	02bfc2ce 	addi.w	$r14,$r22,-16(0xff0)
1c004e08:	001031cc 	add.w	$r12,$r14,$r12
1c004e0c:	29bf218d 	st.w	$r13,$r12,-56(0xfc8)
1c004e10:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004e14:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c004e18:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c004e1c:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c004e20:	02802c0c 	addi.w	$r12,$r0,11(0xb)
1c004e24:	67ffc18d 	bge	$r12,$r13,-64(0x3ffc0) # 1c004de4 <Printf_CountVal+0x18>
1c004e28:	1c0000c4 	pcaddu12i	$r4,6(0x6)
1c004e2c:	02966084 	addi.w	$r4,$r4,1432(0x598)
1c004e30:	57cd9fff 	bl	-12900(0xfffcd9c) # 1c001bcc <myprintf>
1c004e34:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c004e38:	50003400 	b	52(0x34) # 1c004e6c <Printf_CountVal+0xa0>
1c004e3c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004e40:	0040898c 	slli.w	$r12,$r12,0x2
1c004e44:	02bfc2cd 	addi.w	$r13,$r22,-16(0xff0)
1c004e48:	001031ac 	add.w	$r12,$r13,$r12
1c004e4c:	28bf218c 	ld.w	$r12,$r12,-56(0xfc8)
1c004e50:	00150185 	move	$r5,$r12
1c004e54:	1c0000c4 	pcaddu12i	$r4,6(0x6)
1c004e58:	02952084 	addi.w	$r4,$r4,1352(0x548)
1c004e5c:	57cd73ff 	bl	-12944(0xfffcd70) # 1c001bcc <myprintf>
1c004e60:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004e64:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c004e68:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c004e6c:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c004e70:	02802c0c 	addi.w	$r12,$r0,11(0xb)
1c004e74:	67ffc98d 	bge	$r12,$r13,-56(0x3ffc8) # 1c004e3c <Printf_CountVal+0x70>
1c004e78:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c004e7c:	0380118c 	ori	$r12,$r12,0x4
1c004e80:	2880018c 	ld.w	$r12,$r12,0
1c004e84:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c004e88:	03403d8c 	andi	$r12,$r12,0xf
1c004e8c:	293faecc 	st.b	$r12,$r22,-21(0xfeb)
1c004e90:	2a3faecc 	ld.bu	$r12,$r22,-21(0xfeb)
1c004e94:	00150185 	move	$r5,$r12
1c004e98:	1c0000c4 	pcaddu12i	$r4,6(0x6)
1c004e9c:	0294c084 	addi.w	$r4,$r4,1328(0x530)
1c004ea0:	57cd2fff 	bl	-13012(0xfffcd2c) # 1c001bcc <myprintf>
1c004ea4:	03400000 	andi	$r0,$r0,0x0
1c004ea8:	28813061 	ld.w	$r1,$r3,76(0x4c)
1c004eac:	28812076 	ld.w	$r22,$r3,72(0x48)
1c004eb0:	02814063 	addi.w	$r3,$r3,80(0x50)
1c004eb4:	4c000020 	jirl	$r0,$r1,0

1c004eb8 <TIM_Init>:
TIM_Init():
1c004eb8:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c004ebc:	29807076 	st.w	$r22,$r3,28(0x1c)
1c004ec0:	02808076 	addi.w	$r22,$r3,32(0x20)
1c004ec4:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c004ec8:	157fda0c 	lu12i.w	$r12,-262448(0xbfed0)
1c004ecc:	29800180 	st.w	$r0,$r12,0
1c004ed0:	157fda0c 	lu12i.w	$r12,-262448(0xbfed0)
1c004ed4:	0380118c 	ori	$r12,$r12,0x4
1c004ed8:	29800180 	st.w	$r0,$r12,0
1c004edc:	157fda0c 	lu12i.w	$r12,-262448(0xbfed0)
1c004ee0:	0380218c 	ori	$r12,$r12,0x8
1c004ee4:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c004ee8:	288011ad 	ld.w	$r13,$r13,4(0x4)
1c004eec:	2980018d 	st.w	$r13,$r12,0
1c004ef0:	157fda0c 	lu12i.w	$r12,-262448(0xbfed0)
1c004ef4:	0380318c 	ori	$r12,$r12,0xc
1c004ef8:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c004efc:	288021ad 	ld.w	$r13,$r13,8(0x8)
1c004f00:	2980018d 	st.w	$r13,$r12,0
1c004f04:	157fda0c 	lu12i.w	$r12,-262448(0xbfed0)
1c004f08:	2880018e 	ld.w	$r14,$r12,0
1c004f0c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004f10:	2880518d 	ld.w	$r13,$r12,20(0x14)
1c004f14:	157fda0c 	lu12i.w	$r12,-262448(0xbfed0)
1c004f18:	001535cd 	or	$r13,$r14,$r13
1c004f1c:	2980018d 	st.w	$r13,$r12,0
1c004f20:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004f24:	2880518c 	ld.w	$r12,$r12,20(0x14)
1c004f28:	40002180 	beqz	$r12,32(0x20) # 1c004f48 <TIM_Init+0x90>
1c004f2c:	157fd40c 	lu12i.w	$r12,-262496(0xbfea0)
1c004f30:	2a00018c 	ld.bu	$r12,$r12,0
1c004f34:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c004f38:	157fd40c 	lu12i.w	$r12,-262496(0xbfea0)
1c004f3c:	038005ad 	ori	$r13,$r13,0x1
1c004f40:	006781ad 	bstrpick.w	$r13,$r13,0x7,0x0
1c004f44:	2900018d 	st.b	$r13,$r12,0
1c004f48:	157fda0c 	lu12i.w	$r12,-262448(0xbfed0)
1c004f4c:	2880018e 	ld.w	$r14,$r12,0
1c004f50:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004f54:	2880418d 	ld.w	$r13,$r12,16(0x10)
1c004f58:	157fda0c 	lu12i.w	$r12,-262448(0xbfed0)
1c004f5c:	001535cd 	or	$r13,$r14,$r13
1c004f60:	2980018d 	st.w	$r13,$r12,0
1c004f64:	157fda0c 	lu12i.w	$r12,-262448(0xbfed0)
1c004f68:	2880018e 	ld.w	$r14,$r12,0
1c004f6c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004f70:	2880618d 	ld.w	$r13,$r12,24(0x18)
1c004f74:	157fda0c 	lu12i.w	$r12,-262448(0xbfed0)
1c004f78:	001535cd 	or	$r13,$r14,$r13
1c004f7c:	2980018d 	st.w	$r13,$r12,0
1c004f80:	03400000 	andi	$r0,$r0,0x0
1c004f84:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c004f88:	02808063 	addi.w	$r3,$r3,32(0x20)
1c004f8c:	4c000020 	jirl	$r0,$r1,0

1c004f90 <TIM_StructInit>:
TIM_StructInit():
1c004f90:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c004f94:	29807076 	st.w	$r22,$r3,28(0x1c)
1c004f98:	02808076 	addi.w	$r22,$r3,32(0x20)
1c004f9c:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c004fa0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004fa4:	1400f42d 	lu12i.w	$r13,1953(0x7a1)
1c004fa8:	038801ad 	ori	$r13,$r13,0x200
1c004fac:	2980018d 	st.w	$r13,$r12,0
1c004fb0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004fb4:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c004fb8:	2980618d 	st.w	$r13,$r12,24(0x18)
1c004fbc:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004fc0:	0280080d 	addi.w	$r13,$r0,2(0x2)
1c004fc4:	2980518d 	st.w	$r13,$r12,20(0x14)
1c004fc8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004fcc:	0280100d 	addi.w	$r13,$r0,4(0x4)
1c004fd0:	2980418d 	st.w	$r13,$r12,16(0x10)
1c004fd4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004fd8:	1400002d 	lu12i.w	$r13,1(0x1)
1c004fdc:	03bcfdad 	ori	$r13,$r13,0xf3f
1c004fe0:	2980118d 	st.w	$r13,$r12,4(0x4)
1c004fe4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004fe8:	1400026d 	lu12i.w	$r13,19(0x13)
1c004fec:	03a201ad 	ori	$r13,$r13,0x880
1c004ff0:	2980218d 	st.w	$r13,$r12,8(0x8)
1c004ff4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c004ff8:	29803180 	st.w	$r0,$r12,12(0xc)
1c004ffc:	03400000 	andi	$r0,$r0,0x0
1c005000:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c005004:	02808063 	addi.w	$r3,$r3,32(0x20)
1c005008:	4c000020 	jirl	$r0,$r1,0

1c00500c <TIM_Cmd>:
TIM_Cmd():
1c00500c:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c005010:	29807076 	st.w	$r22,$r3,28(0x1c)
1c005014:	02808076 	addi.w	$r22,$r3,32(0x20)
1c005018:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c00501c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c005020:	40001d80 	beqz	$r12,28(0x1c) # 1c00503c <TIM_Cmd+0x30>
1c005024:	157fda0c 	lu12i.w	$r12,-262448(0xbfed0)
1c005028:	2880018d 	ld.w	$r13,$r12,0
1c00502c:	157fda0c 	lu12i.w	$r12,-262448(0xbfed0)
1c005030:	038005ad 	ori	$r13,$r13,0x1
1c005034:	2980018d 	st.w	$r13,$r12,0
1c005038:	50001800 	b	24(0x18) # 1c005050 <TIM_Cmd+0x44>
1c00503c:	157fda0c 	lu12i.w	$r12,-262448(0xbfed0)
1c005040:	2880018d 	ld.w	$r13,$r12,0
1c005044:	157fda0c 	lu12i.w	$r12,-262448(0xbfed0)
1c005048:	0343f9ad 	andi	$r13,$r13,0xfe
1c00504c:	2980018d 	st.w	$r13,$r12,0
1c005050:	03400000 	andi	$r0,$r0,0x0
1c005054:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c005058:	02808063 	addi.w	$r3,$r3,32(0x20)
1c00505c:	4c000020 	jirl	$r0,$r1,0

1c005060 <TIM_ITConfig>:
TIM_ITConfig():
1c005060:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c005064:	29807076 	st.w	$r22,$r3,28(0x1c)
1c005068:	02808076 	addi.w	$r22,$r3,32(0x20)
1c00506c:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c005070:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c005074:	40003980 	beqz	$r12,56(0x38) # 1c0050ac <TIM_ITConfig+0x4c>
1c005078:	157fda0c 	lu12i.w	$r12,-262448(0xbfed0)
1c00507c:	2880018d 	ld.w	$r13,$r12,0
1c005080:	157fda0c 	lu12i.w	$r12,-262448(0xbfed0)
1c005084:	038009ad 	ori	$r13,$r13,0x2
1c005088:	2980018d 	st.w	$r13,$r12,0
1c00508c:	157fd40c 	lu12i.w	$r12,-262496(0xbfea0)
1c005090:	2a00018c 	ld.bu	$r12,$r12,0
1c005094:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c005098:	157fd40c 	lu12i.w	$r12,-262496(0xbfea0)
1c00509c:	038005ad 	ori	$r13,$r13,0x1
1c0050a0:	006781ad 	bstrpick.w	$r13,$r13,0x7,0x0
1c0050a4:	2900018d 	st.b	$r13,$r12,0
1c0050a8:	50003800 	b	56(0x38) # 1c0050e0 <TIM_ITConfig+0x80>
1c0050ac:	157fda0c 	lu12i.w	$r12,-262448(0xbfed0)
1c0050b0:	2880018d 	ld.w	$r13,$r12,0
1c0050b4:	157fda0c 	lu12i.w	$r12,-262448(0xbfed0)
1c0050b8:	0343f5ad 	andi	$r13,$r13,0xfd
1c0050bc:	2980018d 	st.w	$r13,$r12,0
1c0050c0:	157fd40c 	lu12i.w	$r12,-262496(0xbfea0)
1c0050c4:	2a00018c 	ld.bu	$r12,$r12,0
1c0050c8:	0067818e 	bstrpick.w	$r14,$r12,0x7,0x0
1c0050cc:	157fd40c 	lu12i.w	$r12,-262496(0xbfea0)
1c0050d0:	02bff80d 	addi.w	$r13,$r0,-2(0xffe)
1c0050d4:	0014b5cd 	and	$r13,$r14,$r13
1c0050d8:	006781ad 	bstrpick.w	$r13,$r13,0x7,0x0
1c0050dc:	2900018d 	st.b	$r13,$r12,0
1c0050e0:	03400000 	andi	$r0,$r0,0x0
1c0050e4:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c0050e8:	02808063 	addi.w	$r3,$r3,32(0x20)
1c0050ec:	4c000020 	jirl	$r0,$r1,0

1c0050f0 <TIM_GetITStatus>:
TIM_GetITStatus():
1c0050f0:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c0050f4:	2980b076 	st.w	$r22,$r3,44(0x2c)
1c0050f8:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c0050fc:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c005100:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c005104:	157fda0c 	lu12i.w	$r12,-262448(0xbfed0)
1c005108:	2880018d 	ld.w	$r13,$r12,0
1c00510c:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c005110:	0014b1ac 	and	$r12,$r13,$r12
1c005114:	40001180 	beqz	$r12,16(0x10) # 1c005124 <TIM_GetITStatus+0x34>
1c005118:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c00511c:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c005120:	50000800 	b	8(0x8) # 1c005128 <TIM_GetITStatus+0x38>
1c005124:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c005128:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00512c:	00150184 	move	$r4,$r12
1c005130:	2880b076 	ld.w	$r22,$r3,44(0x2c)
1c005134:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c005138:	4c000020 	jirl	$r0,$r1,0

1c00513c <TIM_ClearIT>:
TIM_ClearIT():
1c00513c:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c005140:	29807076 	st.w	$r22,$r3,28(0x1c)
1c005144:	02808076 	addi.w	$r22,$r3,32(0x20)
1c005148:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c00514c:	157fda0c 	lu12i.w	$r12,-262448(0xbfed0)
1c005150:	2880018e 	ld.w	$r14,$r12,0
1c005154:	157fda0c 	lu12i.w	$r12,-262448(0xbfed0)
1c005158:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c00515c:	001535cd 	or	$r13,$r14,$r13
1c005160:	2980018d 	st.w	$r13,$r12,0
1c005164:	157fd40c 	lu12i.w	$r12,-262496(0xbfea0)
1c005168:	03800d8c 	ori	$r12,$r12,0x3
1c00516c:	2a00018c 	ld.bu	$r12,$r12,0
1c005170:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c005174:	157fd40c 	lu12i.w	$r12,-262496(0xbfea0)
1c005178:	03800d8c 	ori	$r12,$r12,0x3
1c00517c:	038005ad 	ori	$r13,$r13,0x1
1c005180:	006781ad 	bstrpick.w	$r13,$r13,0x7,0x0
1c005184:	2900018d 	st.b	$r13,$r12,0
1c005188:	03400000 	andi	$r0,$r0,0x0
1c00518c:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c005190:	02808063 	addi.w	$r3,$r3,32(0x20)
1c005194:	4c000020 	jirl	$r0,$r1,0

1c005198 <recv_dat_int>:
recv_dat_int():
1c005198:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c00519c:	29807061 	st.w	$r1,$r3,28(0x1c)
1c0051a0:	29806076 	st.w	$r22,$r3,24(0x18)
1c0051a4:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0051a8:	0015008c 	move	$r12,$r4
1c0051ac:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c0051b0:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0051b4:	02bbf18c 	addi.w	$r12,$r12,-260(0xefc)
1c0051b8:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c0051bc:	2980018d 	st.w	$r13,$r12,0
1c0051c0:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c0051c4:	00150185 	move	$r5,$r12
1c0051c8:	1cc7ff64 	pcaddu12i	$r4,409595(0x63ffb)
1c0051cc:	02bba084 	addi.w	$r4,$r4,-280(0xee8)
1c0051d0:	54001800 	bl	24(0x18) # 1c0051e8 <Buffer_write>
1c0051d4:	03400000 	andi	$r0,$r0,0x0
1c0051d8:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c0051dc:	28806076 	ld.w	$r22,$r3,24(0x18)
1c0051e0:	02808063 	addi.w	$r3,$r3,32(0x20)
1c0051e4:	4c000020 	jirl	$r0,$r1,0

1c0051e8 <Buffer_write>:
Buffer_write():
1c0051e8:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0051ec:	29807076 	st.w	$r22,$r3,28(0x1c)
1c0051f0:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0051f4:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c0051f8:	001500ac 	move	$r12,$r5
1c0051fc:	293faecc 	st.b	$r12,$r22,-21(0xfeb)
1c005200:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c005204:	2880018c 	ld.w	$r12,$r12,0
1c005208:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c00520c:	288031ad 	ld.w	$r13,$r13,12(0xc)
1c005210:	0010358c 	add.w	$r12,$r12,$r13
1c005214:	2a3faecd 	ld.bu	$r13,$r22,-21(0xfeb)
1c005218:	2900018d 	st.b	$r13,$r12,0
1c00521c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c005220:	2880318c 	ld.w	$r12,$r12,12(0xc)
1c005224:	0280058d 	addi.w	$r13,$r12,1(0x1)
1c005228:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00522c:	2980318d 	st.w	$r13,$r12,12(0xc)
1c005230:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c005234:	2880318d 	ld.w	$r13,$r12,12(0xc)
1c005238:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00523c:	2880118c 	ld.w	$r12,$r12,4(0x4)
1c005240:	60000dac 	blt	$r13,$r12,12(0xc) # 1c00524c <Buffer_write+0x64>
1c005244:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c005248:	29803180 	st.w	$r0,$r12,12(0xc)
1c00524c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c005250:	2880418c 	ld.w	$r12,$r12,16(0x10)
1c005254:	0280058d 	addi.w	$r13,$r12,1(0x1)
1c005258:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00525c:	2980418d 	st.w	$r13,$r12,16(0x10)
1c005260:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c005264:	2880418d 	ld.w	$r13,$r12,16(0x10)
1c005268:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00526c:	2880118c 	ld.w	$r12,$r12,4(0x4)
1c005270:	6400458d 	bge	$r12,$r13,68(0x44) # 1c0052b4 <Buffer_write+0xcc>
1c005274:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c005278:	2880118d 	ld.w	$r13,$r12,4(0x4)
1c00527c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c005280:	2980418d 	st.w	$r13,$r12,16(0x10)
1c005284:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c005288:	2880218c 	ld.w	$r12,$r12,8(0x8)
1c00528c:	0280058d 	addi.w	$r13,$r12,1(0x1)
1c005290:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c005294:	2980218d 	st.w	$r13,$r12,8(0x8)
1c005298:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00529c:	2880218d 	ld.w	$r13,$r12,8(0x8)
1c0052a0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0052a4:	2880118c 	ld.w	$r12,$r12,4(0x4)
1c0052a8:	60000dac 	blt	$r13,$r12,12(0xc) # 1c0052b4 <Buffer_write+0xcc>
1c0052ac:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0052b0:	29802180 	st.w	$r0,$r12,8(0x8)
1c0052b4:	03400000 	andi	$r0,$r0,0x0
1c0052b8:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c0052bc:	02808063 	addi.w	$r3,$r3,32(0x20)
1c0052c0:	4c000020 	jirl	$r0,$r1,0

1c0052c4 <do_exit>:
do_exit():
1c0052c4:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0052c8:	29807076 	st.w	$r22,$r3,28(0x1c)
1c0052cc:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0052d0:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c0052d4:	29bfa2c5 	st.w	$r5,$r22,-24(0xfe8)
1c0052d8:	03400000 	andi	$r0,$r0,0x0
1c0052dc:	00150184 	move	$r4,$r12
1c0052e0:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c0052e4:	02808063 	addi.w	$r3,$r3,32(0x20)
1c0052e8:	4c000020 	jirl	$r0,$r1,0

1c0052ec <do_help>:
do_help():
1c0052ec:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c0052f0:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c0052f4:	2980a076 	st.w	$r22,$r3,40(0x28)
1c0052f8:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c0052fc:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c005300:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c005304:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c005308:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c00530c:	580015ac 	beq	$r13,$r12,20(0x14) # 1c005320 <do_help+0x34>
1c005310:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c005314:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c005318:	580091ac 	beq	$r13,$r12,144(0x90) # 1c0053a8 <do_help+0xbc>
1c00531c:	5001ac00 	b	428(0x1ac) # 1c0054c8 <do_help+0x1dc>
1c005320:	1c0000c4 	pcaddu12i	$r4,6(0x6)
1c005324:	02977084 	addi.w	$r4,$r4,1500(0x5dc)
1c005328:	57c8a7ff 	bl	-14172(0xfffc8a4) # 1c001bcc <myprintf>
1c00532c:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c005330:	50004400 	b	68(0x44) # 1c005374 <do_help+0x88>
1c005334:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c005338:	0280058e 	addi.w	$r14,$r12,1(0x1)
1c00533c:	1c0000cd 	pcaddu12i	$r13,6(0x6)
1c005340:	028f81ad 	addi.w	$r13,$r13,992(0x3e0)
1c005344:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c005348:	0040918c 	slli.w	$r12,$r12,0x4
1c00534c:	001031ac 	add.w	$r12,$r13,$r12
1c005350:	2880018c 	ld.w	$r12,$r12,0
1c005354:	00150186 	move	$r6,$r12
1c005358:	001501c5 	move	$r5,$r14
1c00535c:	1c0000c4 	pcaddu12i	$r4,6(0x6)
1c005360:	0296c084 	addi.w	$r4,$r4,1456(0x5b0)
1c005364:	57c86bff 	bl	-14232(0xfffc868) # 1c001bcc <myprintf>
1c005368:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00536c:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c005370:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c005374:	1c0000cd 	pcaddu12i	$r13,6(0x6)
1c005378:	028ea1ad 	addi.w	$r13,$r13,936(0x3a8)
1c00537c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c005380:	0040918c 	slli.w	$r12,$r12,0x4
1c005384:	001031ac 	add.w	$r12,$r13,$r12
1c005388:	2880018c 	ld.w	$r12,$r12,0
1c00538c:	00150185 	move	$r5,$r12
1c005390:	1c0000c4 	pcaddu12i	$r4,6(0x6)
1c005394:	028df084 	addi.w	$r4,$r4,892(0x37c)
1c005398:	57d6bfff 	bl	-10564(0xfffd6bc) # 1c002a54 <strcmp>
1c00539c:	0015008c 	move	$r12,$r4
1c0053a0:	47ff959f 	bnez	$r12,-108(0x7fff94) # 1c005334 <do_help+0x48>
1c0053a4:	50013800 	b	312(0x138) # 1c0054dc <do_help+0x1f0>
1c0053a8:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c0053ac:	2880118c 	ld.w	$r12,$r12,4(0x4)
1c0053b0:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0053b4:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c0053b8:	5000a000 	b	160(0xa0) # 1c005458 <do_help+0x16c>
1c0053bc:	1c0000cd 	pcaddu12i	$r13,6(0x6)
1c0053c0:	028d81ad 	addi.w	$r13,$r13,864(0x360)
1c0053c4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0053c8:	0040918c 	slli.w	$r12,$r12,0x4
1c0053cc:	001031ac 	add.w	$r12,$r13,$r12
1c0053d0:	2880018c 	ld.w	$r12,$r12,0
1c0053d4:	00150185 	move	$r5,$r12
1c0053d8:	28bfa2c4 	ld.w	$r4,$r22,-24(0xfe8)
1c0053dc:	57d67bff 	bl	-10632(0xfffd678) # 1c002a54 <strcmp>
1c0053e0:	0015008c 	move	$r12,$r4
1c0053e4:	44006980 	bnez	$r12,104(0x68) # 1c00544c <do_help+0x160>
1c0053e8:	1c0000cd 	pcaddu12i	$r13,6(0x6)
1c0053ec:	028cd1ad 	addi.w	$r13,$r13,820(0x334)
1c0053f0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0053f4:	0040918c 	slli.w	$r12,$r12,0x4
1c0053f8:	001031ac 	add.w	$r12,$r13,$r12
1c0053fc:	2880018e 	ld.w	$r14,$r12,0
1c005400:	1c0000cd 	pcaddu12i	$r13,6(0x6)
1c005404:	028c71ad 	addi.w	$r13,$r13,796(0x31c)
1c005408:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00540c:	0040918c 	slli.w	$r12,$r12,0x4
1c005410:	001031ac 	add.w	$r12,$r13,$r12
1c005414:	2880218f 	ld.w	$r15,$r12,8(0x8)
1c005418:	1c0000cd 	pcaddu12i	$r13,6(0x6)
1c00541c:	028c11ad 	addi.w	$r13,$r13,772(0x304)
1c005420:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c005424:	0040918c 	slli.w	$r12,$r12,0x4
1c005428:	001031ac 	add.w	$r12,$r13,$r12
1c00542c:	2880318c 	ld.w	$r12,$r12,12(0xc)
1c005430:	00150187 	move	$r7,$r12
1c005434:	001501e6 	move	$r6,$r15
1c005438:	001501c5 	move	$r5,$r14
1c00543c:	1c0000c4 	pcaddu12i	$r4,6(0x6)
1c005440:	02937084 	addi.w	$r4,$r4,1244(0x4dc)
1c005444:	57c78bff 	bl	-14456(0xfffc788) # 1c001bcc <myprintf>
1c005448:	50004000 	b	64(0x40) # 1c005488 <do_help+0x19c>
1c00544c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c005450:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c005454:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c005458:	1c0000cd 	pcaddu12i	$r13,6(0x6)
1c00545c:	028b11ad 	addi.w	$r13,$r13,708(0x2c4)
1c005460:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c005464:	0040918c 	slli.w	$r12,$r12,0x4
1c005468:	001031ac 	add.w	$r12,$r13,$r12
1c00546c:	2880018c 	ld.w	$r12,$r12,0
1c005470:	00150185 	move	$r5,$r12
1c005474:	1c0000c4 	pcaddu12i	$r4,6(0x6)
1c005478:	028a6084 	addi.w	$r4,$r4,664(0x298)
1c00547c:	57d5dbff 	bl	-10792(0xfffd5d8) # 1c002a54 <strcmp>
1c005480:	0015008c 	move	$r12,$r4
1c005484:	47ff399f 	bnez	$r12,-200(0x7fff38) # 1c0053bc <do_help+0xd0>
1c005488:	1c0000cd 	pcaddu12i	$r13,6(0x6)
1c00548c:	028a51ad 	addi.w	$r13,$r13,660(0x294)
1c005490:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c005494:	0040918c 	slli.w	$r12,$r12,0x4
1c005498:	001031ac 	add.w	$r12,$r13,$r12
1c00549c:	2880018c 	ld.w	$r12,$r12,0
1c0054a0:	00150185 	move	$r5,$r12
1c0054a4:	1c0000c4 	pcaddu12i	$r4,6(0x6)
1c0054a8:	0289a084 	addi.w	$r4,$r4,616(0x268)
1c0054ac:	57d5abff 	bl	-10840(0xfffd5a8) # 1c002a54 <strcmp>
1c0054b0:	0015008c 	move	$r12,$r4
1c0054b4:	44002580 	bnez	$r12,36(0x24) # 1c0054d8 <do_help+0x1ec>
1c0054b8:	1c0000c4 	pcaddu12i	$r4,6(0x6)
1c0054bc:	0291b084 	addi.w	$r4,$r4,1132(0x46c)
1c0054c0:	57c70fff 	bl	-14580(0xfffc70c) # 1c001bcc <myprintf>
1c0054c4:	50001400 	b	20(0x14) # 1c0054d8 <do_help+0x1ec>
1c0054c8:	1c0000c4 	pcaddu12i	$r4,6(0x6)
1c0054cc:	0291f084 	addi.w	$r4,$r4,1148(0x47c)
1c0054d0:	57c6ffff 	bl	-14596(0xfffc6fc) # 1c001bcc <myprintf>
1c0054d4:	50000800 	b	8(0x8) # 1c0054dc <do_help+0x1f0>
1c0054d8:	03400000 	andi	$r0,$r0,0x0
1c0054dc:	0015000c 	move	$r12,$r0
1c0054e0:	00150184 	move	$r4,$r12
1c0054e4:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c0054e8:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c0054ec:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c0054f0:	4c000020 	jirl	$r0,$r1,0

1c0054f4 <main>:
main():
1c0054f4:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c0054f8:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c0054fc:	2980a076 	st.w	$r22,$r3,40(0x28)
1c005500:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c005504:	57cb8fff 	bl	-13428(0xfffcb8c) # 1c002090 <EnableInt>
1c005508:	57e07fff 	bl	-8068(0xfffe07c) # 1c003584 <PS2_Init>
1c00550c:	57e8d3ff 	bl	-5936(0xfffe8d0) # 1c003ddc <PS2_SetInit>
1c005510:	157fd10c 	lu12i.w	$r12,-262520(0xbfe88)
1c005514:	0380118c 	ori	$r12,$r12,0x4
1c005518:	0280140d 	addi.w	$r13,$r0,5(0x5)
1c00551c:	2980018d 	st.w	$r13,$r12,0
1c005520:	140038ec 	lu12i.w	$r12,455(0x1c7)
1c005524:	03bf1d8c 	ori	$r12,$r12,0xfc7
1c005528:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c00552c:	50001400 	b	20(0x14) # 1c005540 <main+0x4c>
1c005530:	03400000 	andi	$r0,$r0,0x0
1c005534:	03400000 	andi	$r0,$r0,0x0
1c005538:	03400000 	andi	$r0,$r0,0x0
1c00553c:	03400000 	andi	$r0,$r0,0x0
1c005540:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c005544:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c005548:	29bfb2cd 	st.w	$r13,$r22,-20(0xfec)
1c00554c:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c005530 <main+0x3c>
1c005550:	1c0000c4 	pcaddu12i	$r4,6(0x6)
1c005554:	02904084 	addi.w	$r4,$r4,1040(0x410)
1c005558:	57ceabff 	bl	-12632(0xfffcea8) # 1c002400 <soc_myprintf>
1c00555c:	140000ac 	lu12i.w	$r12,5(0x5)
1c005560:	03accd8c 	ori	$r12,$r12,0xb33
1c005564:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c005568:	50001400 	b	20(0x14) # 1c00557c <main+0x88>
1c00556c:	03400000 	andi	$r0,$r0,0x0
1c005570:	03400000 	andi	$r0,$r0,0x0
1c005574:	03400000 	andi	$r0,$r0,0x0
1c005578:	03400000 	andi	$r0,$r0,0x0
1c00557c:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c005580:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c005584:	29bfa2cd 	st.w	$r13,$r22,-24(0xfe8)
1c005588:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c00556c <main+0x78>
1c00558c:	1c0000cc 	pcaddu12i	$r12,6(0x6)
1c005590:	028f618c 	addi.w	$r12,$r12,984(0x3d8)
1c005594:	29bf72cc 	st.w	$r12,$r22,-36(0xfdc)
1c005598:	28bf72c5 	ld.w	$r5,$r22,-36(0xfdc)
1c00559c:	1c0000c4 	pcaddu12i	$r4,6(0x6)
1c0055a0:	028f4084 	addi.w	$r4,$r4,976(0x3d0)
1c0055a4:	57ce5fff 	bl	-12708(0xfffce5c) # 1c002400 <soc_myprintf>
1c0055a8:	140000ac 	lu12i.w	$r12,5(0x5)
1c0055ac:	03accd8c 	ori	$r12,$r12,0xb33
1c0055b0:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c0055b4:	50001400 	b	20(0x14) # 1c0055c8 <main+0xd4>
1c0055b8:	03400000 	andi	$r0,$r0,0x0
1c0055bc:	03400000 	andi	$r0,$r0,0x0
1c0055c0:	03400000 	andi	$r0,$r0,0x0
1c0055c4:	03400000 	andi	$r0,$r0,0x0
1c0055c8:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c0055cc:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c0055d0:	29bf92cd 	st.w	$r13,$r22,-28(0xfe4)
1c0055d4:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c0055b8 <main+0xc4>
1c0055d8:	57e30fff 	bl	-7412(0xfffe30c) # 1c0038e4 <PS2_DataKey>
1c0055dc:	0015008c 	move	$r12,$r4
1c0055e0:	293f6ecc 	st.b	$r12,$r22,-37(0xfdb)
1c0055e4:	2a3f6ecc 	ld.bu	$r12,$r22,-37(0xfdb)
1c0055e8:	40004980 	beqz	$r12,72(0x48) # 1c005630 <main+0x13c>
1c0055ec:	2a3f6ecc 	ld.bu	$r12,$r22,-37(0xfdb)
1c0055f0:	00150185 	move	$r5,$r12
1c0055f4:	1c0000c4 	pcaddu12i	$r4,6(0x6)
1c0055f8:	028e1084 	addi.w	$r4,$r4,900(0x384)
1c0055fc:	57ce07ff 	bl	-12796(0xfffce04) # 1c002400 <soc_myprintf>
1c005600:	140000ac 	lu12i.w	$r12,5(0x5)
1c005604:	03accd8c 	ori	$r12,$r12,0xb33
1c005608:	29bf82cc 	st.w	$r12,$r22,-32(0xfe0)
1c00560c:	50001400 	b	20(0x14) # 1c005620 <main+0x12c>
1c005610:	03400000 	andi	$r0,$r0,0x0
1c005614:	03400000 	andi	$r0,$r0,0x0
1c005618:	03400000 	andi	$r0,$r0,0x0
1c00561c:	03400000 	andi	$r0,$r0,0x0
1c005620:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c005624:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c005628:	29bf82cd 	st.w	$r13,$r22,-32(0xfe0)
1c00562c:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c005610 <main+0x11c>
1c005630:	54001400 	bl	20(0x14) # 1c005644 <Game_Flag>
1c005634:	540d9400 	bl	3476(0xd94) # 1c0063c8 <Game_Enable>
1c005638:	54162800 	bl	5672(0x1628) # 1c006c60 <Game_Data>
1c00563c:	541e6800 	bl	7784(0x1e68) # 1c0074a4 <Set_Data>
1c005640:	53ff9bff 	b	-104(0xfffff98) # 1c0055d8 <main+0xe4>

1c005644 <Game_Flag>:
Game_Flag():
1c005644:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c005648:	29803076 	st.w	$r22,$r3,12(0xc)
1c00564c:	02804076 	addi.w	$r22,$r3,16(0x10)
1c005650:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c005654:	28a7318c 	ld.w	$r12,$r12,-1588(0x9cc)
1c005658:	2880018c 	ld.w	$r12,$r12,0
1c00565c:	4400cd80 	bnez	$r12,204(0xcc) # 1c005728 <Game_Flag+0xe4>
1c005660:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c005664:	28a6d18c 	ld.w	$r12,$r12,-1612(0x9b4)
1c005668:	2880018c 	ld.w	$r12,$r12,0
1c00566c:	4400bd80 	bnez	$r12,188(0xbc) # 1c005728 <Game_Flag+0xe4>
1c005670:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c005674:	28ab718c 	ld.w	$r12,$r12,-1316(0xadc)
1c005678:	2880018c 	ld.w	$r12,$r12,0
1c00567c:	4400ad80 	bnez	$r12,172(0xac) # 1c005728 <Game_Flag+0xe4>
1c005680:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c005684:	28a9518c 	ld.w	$r12,$r12,-1452(0xa54)
1c005688:	2880018d 	ld.w	$r13,$r12,0
1c00568c:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c005690:	5c0099ac 	bne	$r13,$r12,152(0x98) # 1c005728 <Game_Flag+0xe4>
1c005694:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c005698:	28a6118c 	ld.w	$r12,$r12,-1660(0x984)
1c00569c:	2880018c 	ld.w	$r12,$r12,0
1c0056a0:	44008980 	bnez	$r12,136(0x88) # 1c005728 <Game_Flag+0xe4>
1c0056a4:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c0056a8:	28a6718c 	ld.w	$r12,$r12,-1636(0x99c)
1c0056ac:	2880018c 	ld.w	$r12,$r12,0
1c0056b0:	44007980 	bnez	$r12,120(0x78) # 1c005728 <Game_Flag+0xe4>
1c0056b4:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c0056b8:	28aaa18c 	ld.w	$r12,$r12,-1368(0xaa8)
1c0056bc:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c0056c0:	2980018d 	st.w	$r13,$r12,0
1c0056c4:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c0056c8:	28a5618c 	ld.w	$r12,$r12,-1704(0x958)
1c0056cc:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c0056d0:	2980018d 	st.w	$r13,$r12,0
1c0056d4:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c0056d8:	28a5118c 	ld.w	$r12,$r12,-1724(0x944)
1c0056dc:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c0056e0:	2980018d 	st.w	$r13,$r12,0
1c0056e4:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c0056e8:	28a9418c 	ld.w	$r12,$r12,-1456(0xa50)
1c0056ec:	0282080d 	addi.w	$r13,$r0,130(0x82)
1c0056f0:	2980018d 	st.w	$r13,$r12,0
1c0056f4:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c0056f8:	28a5018c 	ld.w	$r12,$r12,-1728(0x940)
1c0056fc:	02801c0d 	addi.w	$r13,$r0,7(0x7)
1c005700:	2980018d 	st.w	$r13,$r12,0
1c005704:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c005708:	28a8218c 	ld.w	$r12,$r12,-1528(0xa08)
1c00570c:	0280080d 	addi.w	$r13,$r0,2(0x2)
1c005710:	2980018d 	st.w	$r13,$r12,0
1c005714:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c005718:	28a6a18c 	ld.w	$r12,$r12,-1624(0x9a8)
1c00571c:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c005720:	2980018d 	st.w	$r13,$r12,0
1c005724:	50001000 	b	16(0x10) # 1c005734 <Game_Flag+0xf0>
1c005728:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c00572c:	28a8d18c 	ld.w	$r12,$r12,-1484(0xa34)
1c005730:	29800180 	st.w	$r0,$r12,0
1c005734:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c005738:	28a3a18c 	ld.w	$r12,$r12,-1816(0x8e8)
1c00573c:	2880018c 	ld.w	$r12,$r12,0
1c005740:	4400cd80 	bnez	$r12,204(0xcc) # 1c00580c <Game_Flag+0x1c8>
1c005744:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c005748:	28a3418c 	ld.w	$r12,$r12,-1840(0x8d0)
1c00574c:	2880018c 	ld.w	$r12,$r12,0
1c005750:	4400bd80 	bnez	$r12,188(0xbc) # 1c00580c <Game_Flag+0x1c8>
1c005754:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c005758:	28a7e18c 	ld.w	$r12,$r12,-1544(0x9f8)
1c00575c:	2880018c 	ld.w	$r12,$r12,0
1c005760:	4400ad80 	bnez	$r12,172(0xac) # 1c00580c <Game_Flag+0x1c8>
1c005764:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c005768:	28a8018c 	ld.w	$r12,$r12,-1536(0xa00)
1c00576c:	2880018d 	ld.w	$r13,$r12,0
1c005770:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c005774:	5c0099ac 	bne	$r13,$r12,152(0x98) # 1c00580c <Game_Flag+0x1c8>
1c005778:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c00577c:	28a6c18c 	ld.w	$r12,$r12,-1616(0x9b0)
1c005780:	2880018c 	ld.w	$r12,$r12,0
1c005784:	44008980 	bnez	$r12,136(0x88) # 1c00580c <Game_Flag+0x1c8>
1c005788:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c00578c:	28a2e18c 	ld.w	$r12,$r12,-1864(0x8b8)
1c005790:	2880018c 	ld.w	$r12,$r12,0
1c005794:	44007980 	bnez	$r12,120(0x78) # 1c00580c <Game_Flag+0x1c8>
1c005798:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c00579c:	28a6e18c 	ld.w	$r12,$r12,-1608(0x9b8)
1c0057a0:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c0057a4:	2980018d 	st.w	$r13,$r12,0
1c0057a8:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c0057ac:	28a1d18c 	ld.w	$r12,$r12,-1932(0x874)
1c0057b0:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c0057b4:	2980018d 	st.w	$r13,$r12,0
1c0057b8:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c0057bc:	28a5c18c 	ld.w	$r12,$r12,-1680(0x970)
1c0057c0:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c0057c4:	2980018d 	st.w	$r13,$r12,0
1c0057c8:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c0057cc:	28a5b18c 	ld.w	$r12,$r12,-1684(0x96c)
1c0057d0:	0282a80d 	addi.w	$r13,$r0,170(0xaa)
1c0057d4:	2980018d 	st.w	$r13,$r12,0
1c0057d8:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c0057dc:	28a1718c 	ld.w	$r12,$r12,-1956(0x85c)
1c0057e0:	0280300d 	addi.w	$r13,$r0,12(0xc)
1c0057e4:	2980018d 	st.w	$r13,$r12,0
1c0057e8:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c0057ec:	28a4918c 	ld.w	$r12,$r12,-1756(0x924)
1c0057f0:	0280080d 	addi.w	$r13,$r0,2(0x2)
1c0057f4:	2980018d 	st.w	$r13,$r12,0
1c0057f8:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c0057fc:	28a3118c 	ld.w	$r12,$r12,-1852(0x8c4)
1c005800:	0280080d 	addi.w	$r13,$r0,2(0x2)
1c005804:	2980018d 	st.w	$r13,$r12,0
1c005808:	50001000 	b	16(0x10) # 1c005818 <Game_Flag+0x1d4>
1c00580c:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c005810:	28a5118c 	ld.w	$r12,$r12,-1724(0x944)
1c005814:	29800180 	st.w	$r0,$r12,0
1c005818:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c00581c:	28a0118c 	ld.w	$r12,$r12,-2044(0x804)
1c005820:	2880018c 	ld.w	$r12,$r12,0
1c005824:	4400cd80 	bnez	$r12,204(0xcc) # 1c0058f0 <Game_Flag+0x2ac>
1c005828:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c00582c:	289fb18c 	ld.w	$r12,$r12,2028(0x7ec)
1c005830:	2880018c 	ld.w	$r12,$r12,0
1c005834:	4400bd80 	bnez	$r12,188(0xbc) # 1c0058f0 <Game_Flag+0x2ac>
1c005838:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c00583c:	28a4518c 	ld.w	$r12,$r12,-1772(0x914)
1c005840:	2880018c 	ld.w	$r12,$r12,0
1c005844:	4400ad80 	bnez	$r12,172(0xac) # 1c0058f0 <Game_Flag+0x2ac>
1c005848:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c00584c:	289fd18c 	ld.w	$r12,$r12,2036(0x7f4)
1c005850:	2880018d 	ld.w	$r13,$r12,0
1c005854:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c005858:	5c0099ac 	bne	$r13,$r12,152(0x98) # 1c0058f0 <Game_Flag+0x2ac>
1c00585c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005860:	289f418c 	ld.w	$r12,$r12,2000(0x7d0)
1c005864:	2880018c 	ld.w	$r12,$r12,0
1c005868:	44008980 	bnez	$r12,136(0x88) # 1c0058f0 <Game_Flag+0x2ac>
1c00586c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005870:	289f518c 	ld.w	$r12,$r12,2004(0x7d4)
1c005874:	2880018c 	ld.w	$r12,$r12,0
1c005878:	44007980 	bnez	$r12,120(0x78) # 1c0058f0 <Game_Flag+0x2ac>
1c00587c:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c005880:	28a1c18c 	ld.w	$r12,$r12,-1936(0x870)
1c005884:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c005888:	2980018d 	st.w	$r13,$r12,0
1c00588c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005890:	289e418c 	ld.w	$r12,$r12,1936(0x790)
1c005894:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c005898:	2980018d 	st.w	$r13,$r12,0
1c00589c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0058a0:	289e418c 	ld.w	$r12,$r12,1936(0x790)
1c0058a4:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c0058a8:	2980018d 	st.w	$r13,$r12,0
1c0058ac:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c0058b0:	28a2218c 	ld.w	$r12,$r12,-1912(0x888)
1c0058b4:	0282080d 	addi.w	$r13,$r0,130(0x82)
1c0058b8:	2980018d 	st.w	$r13,$r12,0
1c0058bc:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0058c0:	289de18c 	ld.w	$r12,$r12,1912(0x778)
1c0058c4:	02801c0d 	addi.w	$r13,$r0,7(0x7)
1c0058c8:	2980018d 	st.w	$r13,$r12,0
1c0058cc:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c0058d0:	28a1018c 	ld.w	$r12,$r12,-1984(0x840)
1c0058d4:	0280080d 	addi.w	$r13,$r0,2(0x2)
1c0058d8:	2980018d 	st.w	$r13,$r12,0
1c0058dc:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0058e0:	289f818c 	ld.w	$r12,$r12,2016(0x7e0)
1c0058e4:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c0058e8:	2980018d 	st.w	$r13,$r12,0
1c0058ec:	50001000 	b	16(0x10) # 1c0058fc <Game_Flag+0x2b8>
1c0058f0:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0058f4:	289ff18c 	ld.w	$r12,$r12,2044(0x7fc)
1c0058f8:	29800180 	st.w	$r0,$r12,0
1c0058fc:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005900:	289c818c 	ld.w	$r12,$r12,1824(0x720)
1c005904:	2880018c 	ld.w	$r12,$r12,0
1c005908:	4400cd80 	bnez	$r12,204(0xcc) # 1c0059d4 <Game_Flag+0x390>
1c00590c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005910:	289c218c 	ld.w	$r12,$r12,1800(0x708)
1c005914:	2880018c 	ld.w	$r12,$r12,0
1c005918:	4400bd80 	bnez	$r12,188(0xbc) # 1c0059d4 <Game_Flag+0x390>
1c00591c:	1cc7ff8c 	pcaddu12i	$r12,409596(0x63ffc)
1c005920:	28a0c18c 	ld.w	$r12,$r12,-2000(0x830)
1c005924:	2880018c 	ld.w	$r12,$r12,0
1c005928:	4400ad80 	bnez	$r12,172(0xac) # 1c0059d4 <Game_Flag+0x390>
1c00592c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005930:	289f218c 	ld.w	$r12,$r12,1992(0x7c8)
1c005934:	2880018d 	ld.w	$r13,$r12,0
1c005938:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c00593c:	5c0099ac 	bne	$r13,$r12,152(0x98) # 1c0059d4 <Game_Flag+0x390>
1c005940:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005944:	289db18c 	ld.w	$r12,$r12,1900(0x76c)
1c005948:	2880018c 	ld.w	$r12,$r12,0
1c00594c:	44008980 	bnez	$r12,136(0x88) # 1c0059d4 <Game_Flag+0x390>
1c005950:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005954:	289bc18c 	ld.w	$r12,$r12,1776(0x6f0)
1c005958:	2880018c 	ld.w	$r12,$r12,0
1c00595c:	44007980 	bnez	$r12,120(0x78) # 1c0059d4 <Game_Flag+0x390>
1c005960:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005964:	289d018c 	ld.w	$r12,$r12,1856(0x740)
1c005968:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c00596c:	2980018d 	st.w	$r13,$r12,0
1c005970:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005974:	289ab18c 	ld.w	$r12,$r12,1708(0x6ac)
1c005978:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c00597c:	2980018d 	st.w	$r13,$r12,0
1c005980:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005984:	289cb18c 	ld.w	$r12,$r12,1836(0x72c)
1c005988:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c00598c:	2980018d 	st.w	$r13,$r12,0
1c005990:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005994:	289e918c 	ld.w	$r12,$r12,1956(0x7a4)
1c005998:	0282a80d 	addi.w	$r13,$r0,170(0xaa)
1c00599c:	2980018d 	st.w	$r13,$r12,0
1c0059a0:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0059a4:	289a518c 	ld.w	$r12,$r12,1684(0x694)
1c0059a8:	0280300d 	addi.w	$r13,$r0,12(0xc)
1c0059ac:	2980018d 	st.w	$r13,$r12,0
1c0059b0:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0059b4:	289d718c 	ld.w	$r12,$r12,1884(0x75c)
1c0059b8:	0280080d 	addi.w	$r13,$r0,2(0x2)
1c0059bc:	2980018d 	st.w	$r13,$r12,0
1c0059c0:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0059c4:	289bf18c 	ld.w	$r12,$r12,1788(0x6fc)
1c0059c8:	0280080d 	addi.w	$r13,$r0,2(0x2)
1c0059cc:	2980018d 	st.w	$r13,$r12,0
1c0059d0:	50001000 	b	16(0x10) # 1c0059e0 <Game_Flag+0x39c>
1c0059d4:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0059d8:	289b318c 	ld.w	$r12,$r12,1740(0x6cc)
1c0059dc:	29800180 	st.w	$r0,$r12,0
1c0059e0:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0059e4:	2898f18c 	ld.w	$r12,$r12,1596(0x63c)
1c0059e8:	2880018c 	ld.w	$r12,$r12,0
1c0059ec:	4400bd80 	bnez	$r12,188(0xbc) # 1c005aa8 <Game_Flag+0x464>
1c0059f0:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0059f4:	2898918c 	ld.w	$r12,$r12,1572(0x624)
1c0059f8:	2880018c 	ld.w	$r12,$r12,0
1c0059fc:	4400ad80 	bnez	$r12,172(0xac) # 1c005aa8 <Game_Flag+0x464>
1c005a00:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005a04:	289d318c 	ld.w	$r12,$r12,1868(0x74c)
1c005a08:	2880018c 	ld.w	$r12,$r12,0
1c005a0c:	44009d80 	bnez	$r12,156(0x9c) # 1c005aa8 <Game_Flag+0x464>
1c005a10:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005a14:	2898e18c 	ld.w	$r12,$r12,1592(0x638)
1c005a18:	2880018d 	ld.w	$r13,$r12,0
1c005a1c:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c005a20:	5c0089ac 	bne	$r13,$r12,136(0x88) # 1c005aa8 <Game_Flag+0x464>
1c005a24:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005a28:	289b618c 	ld.w	$r12,$r12,1752(0x6d8)
1c005a2c:	2880018c 	ld.w	$r12,$r12,0
1c005a30:	6400780c 	bge	$r0,$r12,120(0x78) # 1c005aa8 <Game_Flag+0x464>
1c005a34:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005a38:	2898318c 	ld.w	$r12,$r12,1548(0x60c)
1c005a3c:	2880018c 	ld.w	$r12,$r12,0
1c005a40:	44006980 	bnez	$r12,104(0x68) # 1c005aa8 <Game_Flag+0x464>
1c005a44:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005a48:	2899018c 	ld.w	$r12,$r12,1600(0x640)
1c005a4c:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c005a50:	2980018d 	st.w	$r13,$r12,0
1c005a54:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005a58:	2897218c 	ld.w	$r12,$r12,1480(0x5c8)
1c005a5c:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c005a60:	2980018d 	st.w	$r13,$r12,0
1c005a64:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005a68:	289b418c 	ld.w	$r12,$r12,1744(0x6d0)
1c005a6c:	028f9c0d 	addi.w	$r13,$r0,999(0x3e7)
1c005a70:	2980018d 	st.w	$r13,$r12,0
1c005a74:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005a78:	2897018c 	ld.w	$r12,$r12,1472(0x5c0)
1c005a7c:	0280780d 	addi.w	$r13,$r0,30(0x1e)
1c005a80:	2980018d 	st.w	$r13,$r12,0
1c005a84:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005a88:	289a218c 	ld.w	$r12,$r12,1672(0x688)
1c005a8c:	0280080d 	addi.w	$r13,$r0,2(0x2)
1c005a90:	2980018d 	st.w	$r13,$r12,0
1c005a94:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005a98:	2898a18c 	ld.w	$r12,$r12,1576(0x628)
1c005a9c:	02800c0d 	addi.w	$r13,$r0,3(0x3)
1c005aa0:	2980018d 	st.w	$r13,$r12,0
1c005aa4:	50001000 	b	16(0x10) # 1c005ab4 <Game_Flag+0x470>
1c005aa8:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005aac:	2897718c 	ld.w	$r12,$r12,1500(0x5dc)
1c005ab0:	29800180 	st.w	$r0,$r12,0
1c005ab4:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005ab8:	2895a18c 	ld.w	$r12,$r12,1384(0x568)
1c005abc:	2880018c 	ld.w	$r12,$r12,0
1c005ac0:	44005d80 	bnez	$r12,92(0x5c) # 1c005b1c <Game_Flag+0x4d8>
1c005ac4:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005ac8:	2895418c 	ld.w	$r12,$r12,1360(0x550)
1c005acc:	2880018c 	ld.w	$r12,$r12,0
1c005ad0:	44004d80 	bnez	$r12,76(0x4c) # 1c005b1c <Game_Flag+0x4d8>
1c005ad4:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005ad8:	2899318c 	ld.w	$r12,$r12,1612(0x64c)
1c005adc:	2880018c 	ld.w	$r12,$r12,0
1c005ae0:	44003d80 	bnez	$r12,60(0x3c) # 1c005b1c <Game_Flag+0x4d8>
1c005ae4:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005ae8:	2897018c 	ld.w	$r12,$r12,1472(0x5c0)
1c005aec:	2880018d 	ld.w	$r13,$r12,0
1c005af0:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c005af4:	5c0029ac 	bne	$r13,$r12,40(0x28) # 1c005b1c <Game_Flag+0x4d8>
1c005af8:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005afc:	2895218c 	ld.w	$r12,$r12,1352(0x548)
1c005b00:	2880018c 	ld.w	$r12,$r12,0
1c005b04:	44001980 	bnez	$r12,24(0x18) # 1c005b1c <Game_Flag+0x4d8>
1c005b08:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005b0c:	2899318c 	ld.w	$r12,$r12,1612(0x64c)
1c005b10:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c005b14:	2980018d 	st.w	$r13,$r12,0
1c005b18:	50001000 	b	16(0x10) # 1c005b28 <Game_Flag+0x4e4>
1c005b1c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005b20:	2898e18c 	ld.w	$r12,$r12,1592(0x638)
1c005b24:	29800180 	st.w	$r0,$r12,0
1c005b28:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005b2c:	2893d18c 	ld.w	$r12,$r12,1268(0x4f4)
1c005b30:	2880018c 	ld.w	$r12,$r12,0
1c005b34:	44004d80 	bnez	$r12,76(0x4c) # 1c005b80 <Game_Flag+0x53c>
1c005b38:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005b3c:	2898518c 	ld.w	$r12,$r12,1556(0x614)
1c005b40:	2880018c 	ld.w	$r12,$r12,0
1c005b44:	44003d80 	bnez	$r12,60(0x3c) # 1c005b80 <Game_Flag+0x53c>
1c005b48:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005b4c:	2894a18c 	ld.w	$r12,$r12,1320(0x528)
1c005b50:	2880018d 	ld.w	$r13,$r12,0
1c005b54:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c005b58:	5c0029ac 	bne	$r13,$r12,40(0x28) # 1c005b80 <Game_Flag+0x53c>
1c005b5c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005b60:	2893918c 	ld.w	$r12,$r12,1252(0x4e4)
1c005b64:	2880018c 	ld.w	$r12,$r12,0
1c005b68:	44001980 	bnez	$r12,24(0x18) # 1c005b80 <Game_Flag+0x53c>
1c005b6c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005b70:	2892a18c 	ld.w	$r12,$r12,1192(0x4a8)
1c005b74:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c005b78:	2980018d 	st.w	$r13,$r12,0
1c005b7c:	50001000 	b	16(0x10) # 1c005b8c <Game_Flag+0x548>
1c005b80:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005b84:	2892518c 	ld.w	$r12,$r12,1172(0x494)
1c005b88:	29800180 	st.w	$r0,$r12,0
1c005b8c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005b90:	2892418c 	ld.w	$r12,$r12,1168(0x490)
1c005b94:	2880018c 	ld.w	$r12,$r12,0
1c005b98:	44009180 	bnez	$r12,144(0x90) # 1c005c28 <Game_Flag+0x5e4>
1c005b9c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005ba0:	2891e18c 	ld.w	$r12,$r12,1144(0x478)
1c005ba4:	2880018c 	ld.w	$r12,$r12,0
1c005ba8:	44008180 	bnez	$r12,128(0x80) # 1c005c28 <Game_Flag+0x5e4>
1c005bac:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005bb0:	2895d18c 	ld.w	$r12,$r12,1396(0x574)
1c005bb4:	2880018d 	ld.w	$r13,$r12,0
1c005bb8:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c005bbc:	5c006dac 	bne	$r13,$r12,108(0x6c) # 1c005c28 <Game_Flag+0x5e4>
1c005bc0:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005bc4:	2892518c 	ld.w	$r12,$r12,1172(0x494)
1c005bc8:	2880018d 	ld.w	$r13,$r12,0
1c005bcc:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005bd0:	2893418c 	ld.w	$r12,$r12,1232(0x4d0)
1c005bd4:	2880018c 	ld.w	$r12,$r12,0
1c005bd8:	001131ad 	sub.w	$r13,$r13,$r12
1c005bdc:	0281fc0c 	addi.w	$r12,$r0,127(0x7f)
1c005be0:	6000298d 	blt	$r12,$r13,40(0x28) # 1c005c08 <Game_Flag+0x5c4>
1c005be4:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005be8:	2892e18c 	ld.w	$r12,$r12,1208(0x4b8)
1c005bec:	2880018d 	ld.w	$r13,$r12,0
1c005bf0:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005bf4:	2891918c 	ld.w	$r12,$r12,1124(0x464)
1c005bf8:	2880018c 	ld.w	$r12,$r12,0
1c005bfc:	001131ad 	sub.w	$r13,$r13,$r12
1c005c00:	0281fc0c 	addi.w	$r12,$r0,127(0x7f)
1c005c04:	6400258d 	bge	$r12,$r13,36(0x24) # 1c005c28 <Game_Flag+0x5e4>
1c005c08:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005c0c:	2890e18c 	ld.w	$r12,$r12,1080(0x438)
1c005c10:	2880018c 	ld.w	$r12,$r12,0
1c005c14:	44001580 	bnez	$r12,20(0x14) # 1c005c28 <Game_Flag+0x5e4>
1c005c18:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005c1c:	2894d18c 	ld.w	$r12,$r12,1332(0x534)
1c005c20:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c005c24:	2980018d 	st.w	$r13,$r12,0
1c005c28:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005c2c:	2893d18c 	ld.w	$r12,$r12,1268(0x4f4)
1c005c30:	2880018c 	ld.w	$r12,$r12,0
1c005c34:	4400dd80 	bnez	$r12,220(0xdc) # 1c005d10 <Game_Flag+0x6cc>
1c005c38:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005c3c:	288f618c 	ld.w	$r12,$r12,984(0x3d8)
1c005c40:	2880018c 	ld.w	$r12,$r12,0
1c005c44:	4400cd80 	bnez	$r12,204(0xcc) # 1c005d10 <Game_Flag+0x6cc>
1c005c48:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005c4c:	2890818c 	ld.w	$r12,$r12,1056(0x420)
1c005c50:	2880018c 	ld.w	$r12,$r12,0
1c005c54:	4400bd80 	bnez	$r12,188(0xbc) # 1c005d10 <Game_Flag+0x6cc>
1c005c58:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005c5c:	288fd18c 	ld.w	$r12,$r12,1012(0x3f4)
1c005c60:	2880018d 	ld.w	$r13,$r12,0
1c005c64:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c005c68:	5c00a9ac 	bne	$r13,$r12,168(0xa8) # 1c005d10 <Game_Flag+0x6cc>
1c005c6c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005c70:	2892e18c 	ld.w	$r12,$r12,1208(0x4b8)
1c005c74:	2880018c 	ld.w	$r12,$r12,0
1c005c78:	44009980 	bnez	$r12,152(0x98) # 1c005d10 <Game_Flag+0x6cc>
1c005c7c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005c80:	2892218c 	ld.w	$r12,$r12,1160(0x488)
1c005c84:	2880018c 	ld.w	$r12,$r12,0
1c005c88:	44008980 	bnez	$r12,136(0x88) # 1c005d10 <Game_Flag+0x6cc>
1c005c8c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005c90:	2893418c 	ld.w	$r12,$r12,1232(0x4d0)
1c005c94:	2880018c 	ld.w	$r12,$r12,0
1c005c98:	44007980 	bnez	$r12,120(0x78) # 1c005d10 <Game_Flag+0x6cc>
1c005c9c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005ca0:	288f818c 	ld.w	$r12,$r12,992(0x3e0)
1c005ca4:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c005ca8:	2980018d 	st.w	$r13,$r12,0
1c005cac:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005cb0:	2891c18c 	ld.w	$r12,$r12,1136(0x470)
1c005cb4:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c005cb8:	2980018d 	st.w	$r13,$r12,0
1c005cbc:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005cc0:	2891a18c 	ld.w	$r12,$r12,1128(0x468)
1c005cc4:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c005cc8:	2980018d 	st.w	$r13,$r12,0
1c005ccc:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005cd0:	2891318c 	ld.w	$r12,$r12,1100(0x44c)
1c005cd4:	0282080d 	addi.w	$r13,$r0,130(0x82)
1c005cd8:	2980018d 	st.w	$r13,$r12,0
1c005cdc:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005ce0:	288d718c 	ld.w	$r12,$r12,860(0x35c)
1c005ce4:	02801c0d 	addi.w	$r13,$r0,7(0x7)
1c005ce8:	2980018d 	st.w	$r13,$r12,0
1c005cec:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005cf0:	2891518c 	ld.w	$r12,$r12,1108(0x454)
1c005cf4:	0280080d 	addi.w	$r13,$r0,2(0x2)
1c005cf8:	2980018d 	st.w	$r13,$r12,0
1c005cfc:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005d00:	288f818c 	ld.w	$r12,$r12,992(0x3e0)
1c005d04:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c005d08:	2980018d 	st.w	$r13,$r12,0
1c005d0c:	50001000 	b	16(0x10) # 1c005d1c <Game_Flag+0x6d8>
1c005d10:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005d14:	288db18c 	ld.w	$r12,$r12,876(0x36c)
1c005d18:	29800180 	st.w	$r0,$r12,0
1c005d1c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005d20:	2890018c 	ld.w	$r12,$r12,1024(0x400)
1c005d24:	2880018c 	ld.w	$r12,$r12,0
1c005d28:	4400dd80 	bnez	$r12,220(0xdc) # 1c005e04 <Game_Flag+0x7c0>
1c005d2c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005d30:	288b918c 	ld.w	$r12,$r12,740(0x2e4)
1c005d34:	2880018c 	ld.w	$r12,$r12,0
1c005d38:	4400cd80 	bnez	$r12,204(0xcc) # 1c005e04 <Game_Flag+0x7c0>
1c005d3c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005d40:	288cb18c 	ld.w	$r12,$r12,812(0x32c)
1c005d44:	2880018c 	ld.w	$r12,$r12,0
1c005d48:	4400bd80 	bnez	$r12,188(0xbc) # 1c005e04 <Game_Flag+0x7c0>
1c005d4c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005d50:	288ef18c 	ld.w	$r12,$r12,956(0x3bc)
1c005d54:	2880018d 	ld.w	$r13,$r12,0
1c005d58:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c005d5c:	5c00a9ac 	bne	$r13,$r12,168(0xa8) # 1c005e04 <Game_Flag+0x7c0>
1c005d60:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005d64:	288c818c 	ld.w	$r12,$r12,800(0x320)
1c005d68:	2880018c 	ld.w	$r12,$r12,0
1c005d6c:	44009980 	bnez	$r12,152(0x98) # 1c005e04 <Game_Flag+0x7c0>
1c005d70:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005d74:	288e518c 	ld.w	$r12,$r12,916(0x394)
1c005d78:	2880018c 	ld.w	$r12,$r12,0
1c005d7c:	44008980 	bnez	$r12,136(0x88) # 1c005e04 <Game_Flag+0x7c0>
1c005d80:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005d84:	288f418c 	ld.w	$r12,$r12,976(0x3d0)
1c005d88:	2880018c 	ld.w	$r12,$r12,0
1c005d8c:	44007980 	bnez	$r12,120(0x78) # 1c005e04 <Game_Flag+0x7c0>
1c005d90:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005d94:	288cd18c 	ld.w	$r12,$r12,820(0x334)
1c005d98:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c005d9c:	2980018d 	st.w	$r13,$r12,0
1c005da0:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005da4:	288df18c 	ld.w	$r12,$r12,892(0x37c)
1c005da8:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c005dac:	2980018d 	st.w	$r13,$r12,0
1c005db0:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005db4:	288b418c 	ld.w	$r12,$r12,720(0x2d0)
1c005db8:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c005dbc:	2980018d 	st.w	$r13,$r12,0
1c005dc0:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005dc4:	288d618c 	ld.w	$r12,$r12,856(0x358)
1c005dc8:	0282a80d 	addi.w	$r13,$r0,170(0xaa)
1c005dcc:	2980018d 	st.w	$r13,$r12,0
1c005dd0:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005dd4:	2889a18c 	ld.w	$r12,$r12,616(0x268)
1c005dd8:	0280300d 	addi.w	$r13,$r0,12(0xc)
1c005ddc:	2980018d 	st.w	$r13,$r12,0
1c005de0:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005de4:	288d818c 	ld.w	$r12,$r12,864(0x360)
1c005de8:	0280080d 	addi.w	$r13,$r0,2(0x2)
1c005dec:	2980018d 	st.w	$r13,$r12,0
1c005df0:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005df4:	288bb18c 	ld.w	$r12,$r12,748(0x2ec)
1c005df8:	0280080d 	addi.w	$r13,$r0,2(0x2)
1c005dfc:	2980018d 	st.w	$r13,$r12,0
1c005e00:	50001000 	b	16(0x10) # 1c005e10 <Game_Flag+0x7cc>
1c005e04:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005e08:	288b018c 	ld.w	$r12,$r12,704(0x2c0)
1c005e0c:	29800180 	st.w	$r0,$r12,0
1c005e10:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005e14:	288c318c 	ld.w	$r12,$r12,780(0x30c)
1c005e18:	2880018c 	ld.w	$r12,$r12,0
1c005e1c:	4400dd80 	bnez	$r12,220(0xdc) # 1c005ef8 <Game_Flag+0x8b4>
1c005e20:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005e24:	2887c18c 	ld.w	$r12,$r12,496(0x1f0)
1c005e28:	2880018c 	ld.w	$r12,$r12,0
1c005e2c:	4400cd80 	bnez	$r12,204(0xcc) # 1c005ef8 <Game_Flag+0x8b4>
1c005e30:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005e34:	2888e18c 	ld.w	$r12,$r12,568(0x238)
1c005e38:	2880018c 	ld.w	$r12,$r12,0
1c005e3c:	4400bd80 	bnez	$r12,188(0xbc) # 1c005ef8 <Game_Flag+0x8b4>
1c005e40:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005e44:	2889318c 	ld.w	$r12,$r12,588(0x24c)
1c005e48:	2880018d 	ld.w	$r13,$r12,0
1c005e4c:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c005e50:	5c00a9ac 	bne	$r13,$r12,168(0xa8) # 1c005ef8 <Game_Flag+0x8b4>
1c005e54:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005e58:	2888f18c 	ld.w	$r12,$r12,572(0x23c)
1c005e5c:	2880018c 	ld.w	$r12,$r12,0
1c005e60:	44009980 	bnez	$r12,152(0x98) # 1c005ef8 <Game_Flag+0x8b4>
1c005e64:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005e68:	288a818c 	ld.w	$r12,$r12,672(0x2a0)
1c005e6c:	2880018c 	ld.w	$r12,$r12,0
1c005e70:	44008980 	bnez	$r12,136(0x88) # 1c005ef8 <Game_Flag+0x8b4>
1c005e74:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005e78:	2889e18c 	ld.w	$r12,$r12,632(0x278)
1c005e7c:	2880018c 	ld.w	$r12,$r12,0
1c005e80:	44007980 	bnez	$r12,120(0x78) # 1c005ef8 <Game_Flag+0x8b4>
1c005e84:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005e88:	2887018c 	ld.w	$r12,$r12,448(0x1c0)
1c005e8c:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c005e90:	2980018d 	st.w	$r13,$r12,0
1c005e94:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005e98:	288a218c 	ld.w	$r12,$r12,648(0x288)
1c005e9c:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c005ea0:	2980018d 	st.w	$r13,$r12,0
1c005ea4:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005ea8:	2887b18c 	ld.w	$r12,$r12,492(0x1ec)
1c005eac:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c005eb0:	2980018d 	st.w	$r13,$r12,0
1c005eb4:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005eb8:	2889918c 	ld.w	$r12,$r12,612(0x264)
1c005ebc:	0282080d 	addi.w	$r13,$r0,130(0x82)
1c005ec0:	2980018d 	st.w	$r13,$r12,0
1c005ec4:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005ec8:	2885d18c 	ld.w	$r12,$r12,372(0x174)
1c005ecc:	02801c0d 	addi.w	$r13,$r0,7(0x7)
1c005ed0:	2980018d 	st.w	$r13,$r12,0
1c005ed4:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005ed8:	2889b18c 	ld.w	$r12,$r12,620(0x26c)
1c005edc:	0280080d 	addi.w	$r13,$r0,2(0x2)
1c005ee0:	2980018d 	st.w	$r13,$r12,0
1c005ee4:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005ee8:	2887e18c 	ld.w	$r12,$r12,504(0x1f8)
1c005eec:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c005ef0:	2980018d 	st.w	$r13,$r12,0
1c005ef4:	50001000 	b	16(0x10) # 1c005f04 <Game_Flag+0x8c0>
1c005ef8:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005efc:	2885318c 	ld.w	$r12,$r12,332(0x14c)
1c005f00:	29800180 	st.w	$r0,$r12,0
1c005f04:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005f08:	2888618c 	ld.w	$r12,$r12,536(0x218)
1c005f0c:	2880018c 	ld.w	$r12,$r12,0
1c005f10:	4400dd80 	bnez	$r12,220(0xdc) # 1c005fec <Game_Flag+0x9a8>
1c005f14:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005f18:	2883f18c 	ld.w	$r12,$r12,252(0xfc)
1c005f1c:	2880018c 	ld.w	$r12,$r12,0
1c005f20:	4400cd80 	bnez	$r12,204(0xcc) # 1c005fec <Game_Flag+0x9a8>
1c005f24:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005f28:	2885118c 	ld.w	$r12,$r12,324(0x144)
1c005f2c:	2880018c 	ld.w	$r12,$r12,0
1c005f30:	4400bd80 	bnez	$r12,188(0xbc) # 1c005fec <Game_Flag+0x9a8>
1c005f34:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005f38:	2885918c 	ld.w	$r12,$r12,356(0x164)
1c005f3c:	2880018d 	ld.w	$r13,$r12,0
1c005f40:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c005f44:	5c00a9ac 	bne	$r13,$r12,168(0xa8) # 1c005fec <Game_Flag+0x9a8>
1c005f48:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005f4c:	2887d18c 	ld.w	$r12,$r12,500(0x1f4)
1c005f50:	2880018c 	ld.w	$r12,$r12,0
1c005f54:	44009980 	bnez	$r12,152(0x98) # 1c005fec <Game_Flag+0x9a8>
1c005f58:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005f5c:	2886b18c 	ld.w	$r12,$r12,428(0x1ac)
1c005f60:	2880018c 	ld.w	$r12,$r12,0
1c005f64:	44008980 	bnez	$r12,136(0x88) # 1c005fec <Game_Flag+0x9a8>
1c005f68:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005f6c:	2884e18c 	ld.w	$r12,$r12,312(0x138)
1c005f70:	2880018c 	ld.w	$r12,$r12,0
1c005f74:	44007980 	bnez	$r12,120(0x78) # 1c005fec <Game_Flag+0x9a8>
1c005f78:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005f7c:	2885a18c 	ld.w	$r12,$r12,360(0x168)
1c005f80:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c005f84:	2980018d 	st.w	$r13,$r12,0
1c005f88:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005f8c:	2886518c 	ld.w	$r12,$r12,404(0x194)
1c005f90:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c005f94:	2980018d 	st.w	$r13,$r12,0
1c005f98:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005f9c:	2886918c 	ld.w	$r12,$r12,420(0x1a4)
1c005fa0:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c005fa4:	2980018d 	st.w	$r13,$r12,0
1c005fa8:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005fac:	2885c18c 	ld.w	$r12,$r12,368(0x170)
1c005fb0:	0282a80d 	addi.w	$r13,$r0,170(0xaa)
1c005fb4:	2980018d 	st.w	$r13,$r12,0
1c005fb8:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005fbc:	2882018c 	ld.w	$r12,$r12,128(0x80)
1c005fc0:	0280300d 	addi.w	$r13,$r0,12(0xc)
1c005fc4:	2980018d 	st.w	$r13,$r12,0
1c005fc8:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005fcc:	2885e18c 	ld.w	$r12,$r12,376(0x178)
1c005fd0:	0280080d 	addi.w	$r13,$r0,2(0x2)
1c005fd4:	2980018d 	st.w	$r13,$r12,0
1c005fd8:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005fdc:	2884118c 	ld.w	$r12,$r12,260(0x104)
1c005fe0:	0280080d 	addi.w	$r13,$r0,2(0x2)
1c005fe4:	2980018d 	st.w	$r13,$r12,0
1c005fe8:	50001000 	b	16(0x10) # 1c005ff8 <Game_Flag+0x9b4>
1c005fec:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005ff0:	2883d18c 	ld.w	$r12,$r12,244(0xf4)
1c005ff4:	29800180 	st.w	$r0,$r12,0
1c005ff8:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c005ffc:	2884918c 	ld.w	$r12,$r12,292(0x124)
1c006000:	2880018c 	ld.w	$r12,$r12,0
1c006004:	4400cd80 	bnez	$r12,204(0xcc) # 1c0060d0 <Game_Flag+0xa8c>
1c006008:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c00600c:	2880218c 	ld.w	$r12,$r12,8(0x8)
1c006010:	2880018c 	ld.w	$r12,$r12,0
1c006014:	4400bd80 	bnez	$r12,188(0xbc) # 1c0060d0 <Game_Flag+0xa8c>
1c006018:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c00601c:	2881418c 	ld.w	$r12,$r12,80(0x50)
1c006020:	2880018c 	ld.w	$r12,$r12,0
1c006024:	4400ad80 	bnez	$r12,172(0xac) # 1c0060d0 <Game_Flag+0xa8c>
1c006028:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c00602c:	2882a18c 	ld.w	$r12,$r12,168(0xa8)
1c006030:	2880018d 	ld.w	$r13,$r12,0
1c006034:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c006038:	5c0099ac 	bne	$r13,$r12,152(0x98) # 1c0060d0 <Game_Flag+0xa8c>
1c00603c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006040:	2884718c 	ld.w	$r12,$r12,284(0x11c)
1c006044:	2880018c 	ld.w	$r12,$r12,0
1c006048:	6400880c 	bge	$r0,$r12,136(0x88) # 1c0060d0 <Game_Flag+0xa8c>
1c00604c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006050:	2882e18c 	ld.w	$r12,$r12,184(0xb8)
1c006054:	2880018c 	ld.w	$r12,$r12,0
1c006058:	44007980 	bnez	$r12,120(0x78) # 1c0060d0 <Game_Flag+0xa8c>
1c00605c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006060:	2880a18c 	ld.w	$r12,$r12,40(0x28)
1c006064:	2880018c 	ld.w	$r12,$r12,0
1c006068:	44006980 	bnez	$r12,104(0x68) # 1c0060d0 <Game_Flag+0xa8c>
1c00606c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006070:	2881218c 	ld.w	$r12,$r12,72(0x48)
1c006074:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c006078:	2980018d 	st.w	$r13,$r12,0
1c00607c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006080:	2882818c 	ld.w	$r12,$r12,160(0xa0)
1c006084:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c006088:	2980018d 	st.w	$r13,$r12,0
1c00608c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006090:	2882318c 	ld.w	$r12,$r12,140(0x8c)
1c006094:	028f9c0d 	addi.w	$r13,$r0,999(0x3e7)
1c006098:	2980018d 	st.w	$r13,$r12,0
1c00609c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0060a0:	28be718c 	ld.w	$r12,$r12,-100(0xf9c)
1c0060a4:	0280780d 	addi.w	$r13,$r0,30(0x1e)
1c0060a8:	2980018d 	st.w	$r13,$r12,0
1c0060ac:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0060b0:	2882518c 	ld.w	$r12,$r12,148(0x94)
1c0060b4:	0280080d 	addi.w	$r13,$r0,2(0x2)
1c0060b8:	2980018d 	st.w	$r13,$r12,0
1c0060bc:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0060c0:	2880818c 	ld.w	$r12,$r12,32(0x20)
1c0060c4:	02800c0d 	addi.w	$r13,$r0,3(0x3)
1c0060c8:	2980018d 	st.w	$r13,$r12,0
1c0060cc:	50001000 	b	16(0x10) # 1c0060dc <Game_Flag+0xa98>
1c0060d0:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0060d4:	28bf918c 	ld.w	$r12,$r12,-28(0xfe4)
1c0060d8:	29800180 	st.w	$r0,$r12,0
1c0060dc:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0060e0:	2881018c 	ld.w	$r12,$r12,64(0x40)
1c0060e4:	2880018c 	ld.w	$r12,$r12,0
1c0060e8:	44005d80 	bnez	$r12,92(0x5c) # 1c006144 <Game_Flag+0xb00>
1c0060ec:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0060f0:	28bc918c 	ld.w	$r12,$r12,-220(0xf24)
1c0060f4:	2880018c 	ld.w	$r12,$r12,0
1c0060f8:	44004d80 	bnez	$r12,76(0x4c) # 1c006144 <Game_Flag+0xb00>
1c0060fc:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006100:	28bf718c 	ld.w	$r12,$r12,-36(0xfdc)
1c006104:	2880018c 	ld.w	$r12,$r12,0
1c006108:	44003d80 	bnez	$r12,60(0x3c) # 1c006144 <Game_Flag+0xb00>
1c00610c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006110:	2880e18c 	ld.w	$r12,$r12,56(0x38)
1c006114:	2880018d 	ld.w	$r13,$r12,0
1c006118:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c00611c:	5c0029ac 	bne	$r13,$r12,40(0x28) # 1c006144 <Game_Flag+0xb00>
1c006120:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006124:	28bf918c 	ld.w	$r12,$r12,-28(0xfe4)
1c006128:	2880018c 	ld.w	$r12,$r12,0
1c00612c:	44001980 	bnez	$r12,24(0x18) # 1c006144 <Game_Flag+0xb00>
1c006130:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006134:	28be018c 	ld.w	$r12,$r12,-128(0xf80)
1c006138:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c00613c:	2980018d 	st.w	$r13,$r12,0
1c006140:	50001000 	b	16(0x10) # 1c006150 <Game_Flag+0xb0c>
1c006144:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006148:	28bdb18c 	ld.w	$r12,$r12,-148(0xf6c)
1c00614c:	29800180 	st.w	$r0,$r12,0
1c006150:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006154:	28bf318c 	ld.w	$r12,$r12,-52(0xfcc)
1c006158:	2880018c 	ld.w	$r12,$r12,0
1c00615c:	44004d80 	bnez	$r12,76(0x4c) # 1c0061a8 <Game_Flag+0xb64>
1c006160:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006164:	28bc218c 	ld.w	$r12,$r12,-248(0xf08)
1c006168:	2880018c 	ld.w	$r12,$r12,0
1c00616c:	44003d80 	bnez	$r12,60(0x3c) # 1c0061a8 <Game_Flag+0xb64>
1c006170:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006174:	28be418c 	ld.w	$r12,$r12,-112(0xf90)
1c006178:	2880018d 	ld.w	$r13,$r12,0
1c00617c:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c006180:	5c0029ac 	bne	$r13,$r12,40(0x28) # 1c0061a8 <Game_Flag+0xb64>
1c006184:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006188:	28be018c 	ld.w	$r12,$r12,-128(0xf80)
1c00618c:	2880018c 	ld.w	$r12,$r12,0
1c006190:	44001980 	bnez	$r12,24(0x18) # 1c0061a8 <Game_Flag+0xb64>
1c006194:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006198:	28b9f18c 	ld.w	$r12,$r12,-388(0xe7c)
1c00619c:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c0061a0:	2980018d 	st.w	$r13,$r12,0
1c0061a4:	50001000 	b	16(0x10) # 1c0061b4 <Game_Flag+0xb70>
1c0061a8:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0061ac:	28b9a18c 	ld.w	$r12,$r12,-408(0xe68)
1c0061b0:	29800180 	st.w	$r0,$r12,0
1c0061b4:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0061b8:	28bda18c 	ld.w	$r12,$r12,-152(0xf68)
1c0061bc:	2880018c 	ld.w	$r12,$r12,0
1c0061c0:	44009180 	bnez	$r12,144(0x90) # 1c006250 <Game_Flag+0xc0c>
1c0061c4:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0061c8:	28b9318c 	ld.w	$r12,$r12,-436(0xe4c)
1c0061cc:	2880018c 	ld.w	$r12,$r12,0
1c0061d0:	44008180 	bnez	$r12,128(0x80) # 1c006250 <Game_Flag+0xc0c>
1c0061d4:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0061d8:	28bc118c 	ld.w	$r12,$r12,-252(0xf04)
1c0061dc:	2880018d 	ld.w	$r13,$r12,0
1c0061e0:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0061e4:	5c006dac 	bne	$r13,$r12,108(0x6c) # 1c006250 <Game_Flag+0xc0c>
1c0061e8:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0061ec:	28b9b18c 	ld.w	$r12,$r12,-404(0xe6c)
1c0061f0:	2880018d 	ld.w	$r13,$r12,0
1c0061f4:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0061f8:	28baa18c 	ld.w	$r12,$r12,-344(0xea8)
1c0061fc:	2880018c 	ld.w	$r12,$r12,0
1c006200:	001131ad 	sub.w	$r13,$r13,$r12
1c006204:	0281fc0c 	addi.w	$r12,$r0,127(0x7f)
1c006208:	6000298d 	blt	$r12,$r13,40(0x28) # 1c006230 <Game_Flag+0xbec>
1c00620c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006210:	28ba418c 	ld.w	$r12,$r12,-368(0xe90)
1c006214:	2880018d 	ld.w	$r13,$r12,0
1c006218:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c00621c:	28b8f18c 	ld.w	$r12,$r12,-452(0xe3c)
1c006220:	2880018c 	ld.w	$r12,$r12,0
1c006224:	001131ad 	sub.w	$r13,$r13,$r12
1c006228:	0281fc0c 	addi.w	$r12,$r0,127(0x7f)
1c00622c:	6400258d 	bge	$r12,$r13,36(0x24) # 1c006250 <Game_Flag+0xc0c>
1c006230:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006234:	28bb518c 	ld.w	$r12,$r12,-300(0xed4)
1c006238:	2880018c 	ld.w	$r12,$r12,0
1c00623c:	44001580 	bnez	$r12,20(0x14) # 1c006250 <Game_Flag+0xc0c>
1c006240:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006244:	28b8a18c 	ld.w	$r12,$r12,-472(0xe28)
1c006248:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c00624c:	2980018d 	st.w	$r13,$r12,0
1c006250:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006254:	28bbc18c 	ld.w	$r12,$r12,-272(0xef0)
1c006258:	2880018d 	ld.w	$r13,$r12,0
1c00625c:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c006260:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c006270 <Game_Flag+0xc2c>
1c006264:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006268:	28bb718c 	ld.w	$r12,$r12,-292(0xedc)
1c00626c:	29800180 	st.w	$r0,$r12,0
1c006270:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006274:	28bb418c 	ld.w	$r12,$r12,-304(0xed0)
1c006278:	2880018d 	ld.w	$r13,$r12,0
1c00627c:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c006280:	5c0015ac 	bne	$r13,$r12,20(0x14) # 1c006294 <Game_Flag+0xc50>
1c006284:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006288:	28baf18c 	ld.w	$r12,$r12,-324(0xebc)
1c00628c:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c006290:	2980018d 	st.w	$r13,$r12,0
1c006294:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006298:	28b9e18c 	ld.w	$r12,$r12,-392(0xe78)
1c00629c:	2880018d 	ld.w	$r13,$r12,0
1c0062a0:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0062a4:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c0062b4 <Game_Flag+0xc70>
1c0062a8:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0062ac:	28b9918c 	ld.w	$r12,$r12,-412(0xe64)
1c0062b0:	29800180 	st.w	$r0,$r12,0
1c0062b4:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0062b8:	28b9618c 	ld.w	$r12,$r12,-424(0xe58)
1c0062bc:	2880018d 	ld.w	$r13,$r12,0
1c0062c0:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c0062c4:	5c0015ac 	bne	$r13,$r12,20(0x14) # 1c0062d8 <Game_Flag+0xc94>
1c0062c8:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0062cc:	28b9118c 	ld.w	$r12,$r12,-444(0xe44)
1c0062d0:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c0062d4:	2980018d 	st.w	$r13,$r12,0
1c0062d8:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0062dc:	28b5118c 	ld.w	$r12,$r12,-700(0xd44)
1c0062e0:	2880018c 	ld.w	$r12,$r12,0
1c0062e4:	44005980 	bnez	$r12,88(0x58) # 1c00633c <Game_Flag+0xcf8>
1c0062e8:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0062ec:	28b4b18c 	ld.w	$r12,$r12,-724(0xd2c)
1c0062f0:	2880018c 	ld.w	$r12,$r12,0
1c0062f4:	44004980 	bnez	$r12,72(0x48) # 1c00633c <Game_Flag+0xcf8>
1c0062f8:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0062fc:	28b9518c 	ld.w	$r12,$r12,-428(0xe54)
1c006300:	2880018c 	ld.w	$r12,$r12,0
1c006304:	44003980 	bnez	$r12,56(0x38) # 1c00633c <Game_Flag+0xcf8>
1c006308:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c00630c:	28b6718c 	ld.w	$r12,$r12,-612(0xd9c)
1c006310:	2880018c 	ld.w	$r12,$r12,0
1c006314:	44002980 	bnez	$r12,40(0x28) # 1c00633c <Game_Flag+0xcf8>
1c006318:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c00631c:	28b4a18c 	ld.w	$r12,$r12,-728(0xd28)
1c006320:	2880018c 	ld.w	$r12,$r12,0
1c006324:	44001980 	bnez	$r12,24(0x18) # 1c00633c <Game_Flag+0xcf8>
1c006328:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c00632c:	28b6f18c 	ld.w	$r12,$r12,-580(0xdbc)
1c006330:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c006334:	2980018d 	st.w	$r13,$r12,0
1c006338:	50001000 	b	16(0x10) # 1c006348 <Game_Flag+0xd04>
1c00633c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006340:	28b6a18c 	ld.w	$r12,$r12,-600(0xda8)
1c006344:	29800180 	st.w	$r0,$r12,0
1c006348:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c00634c:	28b7518c 	ld.w	$r12,$r12,-556(0xdd4)
1c006350:	2880018c 	ld.w	$r12,$r12,0
1c006354:	44005980 	bnez	$r12,88(0x58) # 1c0063ac <Game_Flag+0xd68>
1c006358:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c00635c:	28b2e18c 	ld.w	$r12,$r12,-840(0xcb8)
1c006360:	2880018c 	ld.w	$r12,$r12,0
1c006364:	44004980 	bnez	$r12,72(0x48) # 1c0063ac <Game_Flag+0xd68>
1c006368:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c00636c:	28b4018c 	ld.w	$r12,$r12,-768(0xd00)
1c006370:	2880018c 	ld.w	$r12,$r12,0
1c006374:	44003980 	bnez	$r12,56(0x38) # 1c0063ac <Game_Flag+0xd68>
1c006378:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c00637c:	28b7318c 	ld.w	$r12,$r12,-564(0xdcc)
1c006380:	2880018c 	ld.w	$r12,$r12,0
1c006384:	44002980 	bnez	$r12,40(0x28) # 1c0063ac <Game_Flag+0xd68>
1c006388:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c00638c:	28b5f18c 	ld.w	$r12,$r12,-644(0xd7c)
1c006390:	2880018c 	ld.w	$r12,$r12,0
1c006394:	44001980 	bnez	$r12,24(0x18) # 1c0063ac <Game_Flag+0xd68>
1c006398:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c00639c:	28b6518c 	ld.w	$r12,$r12,-620(0xd94)
1c0063a0:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c0063a4:	2980018d 	st.w	$r13,$r12,0
1c0063a8:	50001000 	b	16(0x10) # 1c0063b8 <Game_Flag+0xd74>
1c0063ac:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0063b0:	28b6018c 	ld.w	$r12,$r12,-640(0xd80)
1c0063b4:	29800180 	st.w	$r0,$r12,0
1c0063b8:	03400000 	andi	$r0,$r0,0x0
1c0063bc:	28803076 	ld.w	$r22,$r3,12(0xc)
1c0063c0:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0063c4:	4c000020 	jirl	$r0,$r1,0

1c0063c8 <Game_Enable>:
Game_Enable():
1c0063c8:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0063cc:	29807061 	st.w	$r1,$r3,28(0x1c)
1c0063d0:	29806076 	st.w	$r22,$r3,24(0x18)
1c0063d4:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0063d8:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0063dc:	28b5f18c 	ld.w	$r12,$r12,-644(0xd7c)
1c0063e0:	2880018d 	ld.w	$r13,$r12,0
1c0063e4:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0063e8:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c0063f8 <Game_Enable+0x30>
1c0063ec:	02800405 	addi.w	$r5,$r0,1(0x1)
1c0063f0:	02800404 	addi.w	$r4,$r0,1(0x1)
1c0063f4:	57ca97ff 	bl	-13676(0xfffca94) # 1c002e88 <Set_video>
1c0063f8:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0063fc:	28b0718c 	ld.w	$r12,$r12,-996(0xc1c)
1c006400:	2880018d 	ld.w	$r13,$r12,0
1c006404:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c006408:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c006418 <Game_Enable+0x50>
1c00640c:	02800405 	addi.w	$r5,$r0,1(0x1)
1c006410:	02800804 	addi.w	$r4,$r0,2(0x2)
1c006414:	57ca77ff 	bl	-13708(0xfffca74) # 1c002e88 <Set_video>
1c006418:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c00641c:	28b5118c 	ld.w	$r12,$r12,-700(0xd44)
1c006420:	2880018d 	ld.w	$r13,$r12,0
1c006424:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c006428:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c006438 <Game_Enable+0x70>
1c00642c:	02800405 	addi.w	$r5,$r0,1(0x1)
1c006430:	02800c04 	addi.w	$r4,$r0,3(0x3)
1c006434:	57ca57ff 	bl	-13740(0xfffca54) # 1c002e88 <Set_video>
1c006438:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c00643c:	28b4618c 	ld.w	$r12,$r12,-744(0xd18)
1c006440:	2880018d 	ld.w	$r13,$r12,0
1c006444:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c006448:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c006458 <Game_Enable+0x90>
1c00644c:	02800405 	addi.w	$r5,$r0,1(0x1)
1c006450:	02801004 	addi.w	$r4,$r0,4(0x4)
1c006454:	57ca37ff 	bl	-13772(0xfffca34) # 1c002e88 <Set_video>
1c006458:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c00645c:	28b2518c 	ld.w	$r12,$r12,-876(0xc94)
1c006460:	2880018d 	ld.w	$r13,$r12,0
1c006464:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c006468:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c006478 <Game_Enable+0xb0>
1c00646c:	02800405 	addi.w	$r5,$r0,1(0x1)
1c006470:	02801404 	addi.w	$r4,$r0,5(0x5)
1c006474:	57ca17ff 	bl	-13804(0xfffca14) # 1c002e88 <Set_video>
1c006478:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c00647c:	28b0a18c 	ld.w	$r12,$r12,-984(0xc28)
1c006480:	2880018d 	ld.w	$r13,$r12,0
1c006484:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c006488:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c006498 <Game_Enable+0xd0>
1c00648c:	02800405 	addi.w	$r5,$r0,1(0x1)
1c006490:	02801804 	addi.w	$r4,$r0,6(0x6)
1c006494:	57c9f7ff 	bl	-13836(0xfffc9f4) # 1c002e88 <Set_video>
1c006498:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c00649c:	28b2d18c 	ld.w	$r12,$r12,-844(0xcb4)
1c0064a0:	2880018d 	ld.w	$r13,$r12,0
1c0064a4:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0064a8:	5c01e5ac 	bne	$r13,$r12,484(0x1e4) # 1c00668c <Game_Enable+0x2c4>
1c0064ac:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0064b0:	28afc18c 	ld.w	$r12,$r12,-1040(0xbf0)
1c0064b4:	2880018d 	ld.w	$r13,$r12,0
1c0064b8:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0064bc:	28ae718c 	ld.w	$r12,$r12,-1124(0xb9c)
1c0064c0:	2880018c 	ld.w	$r12,$r12,0
1c0064c4:	001131ad 	sub.w	$r13,$r13,$r12
1c0064c8:	0281fc0c 	addi.w	$r12,$r0,127(0x7f)
1c0064cc:	6400298d 	bge	$r12,$r13,40(0x28) # 1c0064f4 <Game_Enable+0x12c>
1c0064d0:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0064d4:	28ae118c 	ld.w	$r12,$r12,-1148(0xb84)
1c0064d8:	2880018d 	ld.w	$r13,$r12,0
1c0064dc:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0064e0:	28af018c 	ld.w	$r12,$r12,-1088(0xbc0)
1c0064e4:	2880018c 	ld.w	$r12,$r12,0
1c0064e8:	001131ad 	sub.w	$r13,$r13,$r12
1c0064ec:	0281fc0c 	addi.w	$r12,$r0,127(0x7f)
1c0064f0:	6000618d 	blt	$r12,$r13,96(0x60) # 1c006550 <Game_Enable+0x188>
1c0064f4:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0064f8:	28b1118c 	ld.w	$r12,$r12,-956(0xc44)
1c0064fc:	2880018d 	ld.w	$r13,$r12,0
1c006500:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006504:	28afe18c 	ld.w	$r12,$r12,-1032(0xbf8)
1c006508:	2880018c 	ld.w	$r12,$r12,0
1c00650c:	001131ad 	sub.w	$r13,$r13,$r12
1c006510:	0283000c 	addi.w	$r12,$r0,192(0xc0)
1c006514:	64003d8d 	bge	$r12,$r13,60(0x3c) # 1c006550 <Game_Enable+0x188>
1c006518:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c00651c:	28ad518c 	ld.w	$r12,$r12,-1196(0xb54)
1c006520:	2880018d 	ld.w	$r13,$r12,0
1c006524:	02823c0c 	addi.w	$r12,$r0,143(0x8f)
1c006528:	6400298d 	bge	$r12,$r13,40(0x28) # 1c006550 <Game_Enable+0x188>
1c00652c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006530:	28b0a18c 	ld.w	$r12,$r12,-984(0xc28)
1c006534:	2880018d 	ld.w	$r13,$r12,0
1c006538:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c00653c:	5c0015ac 	bne	$r13,$r12,20(0x14) # 1c006550 <Game_Enable+0x188>
1c006540:	02800405 	addi.w	$r5,$r0,1(0x1)
1c006544:	02800404 	addi.w	$r4,$r0,1(0x1)
1c006548:	57c943ff 	bl	-14016(0xfffc940) # 1c002e88 <Set_video>
1c00654c:	50011400 	b	276(0x114) # 1c006660 <Game_Enable+0x298>
1c006550:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006554:	28ad318c 	ld.w	$r12,$r12,-1204(0xb4c)
1c006558:	2880018d 	ld.w	$r13,$r12,0
1c00655c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006560:	28abe18c 	ld.w	$r12,$r12,-1288(0xaf8)
1c006564:	2880018c 	ld.w	$r12,$r12,0
1c006568:	001131ad 	sub.w	$r13,$r13,$r12
1c00656c:	0281fc0c 	addi.w	$r12,$r0,127(0x7f)
1c006570:	6400298d 	bge	$r12,$r13,40(0x28) # 1c006598 <Game_Enable+0x1d0>
1c006574:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006578:	28ab818c 	ld.w	$r12,$r12,-1312(0xae0)
1c00657c:	2880018d 	ld.w	$r13,$r12,0
1c006580:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006584:	28ac718c 	ld.w	$r12,$r12,-1252(0xb1c)
1c006588:	2880018c 	ld.w	$r12,$r12,0
1c00658c:	001131ad 	sub.w	$r13,$r13,$r12
1c006590:	0281fc0c 	addi.w	$r12,$r0,127(0x7f)
1c006594:	60005d8d 	blt	$r12,$r13,92(0x5c) # 1c0065f0 <Game_Enable+0x228>
1c006598:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c00659c:	28ae818c 	ld.w	$r12,$r12,-1120(0xba0)
1c0065a0:	2880018d 	ld.w	$r13,$r12,0
1c0065a4:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0065a8:	28ad518c 	ld.w	$r12,$r12,-1196(0xb54)
1c0065ac:	2880018c 	ld.w	$r12,$r12,0
1c0065b0:	001131ad 	sub.w	$r13,$r13,$r12
1c0065b4:	0283000c 	addi.w	$r12,$r0,192(0xc0)
1c0065b8:	6400398d 	bge	$r12,$r13,56(0x38) # 1c0065f0 <Game_Enable+0x228>
1c0065bc:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0065c0:	28aac18c 	ld.w	$r12,$r12,-1360(0xab0)
1c0065c4:	2880018d 	ld.w	$r13,$r12,0
1c0065c8:	02823c0c 	addi.w	$r12,$r0,143(0x8f)
1c0065cc:	6400258d 	bge	$r12,$r13,36(0x24) # 1c0065f0 <Game_Enable+0x228>
1c0065d0:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0065d4:	28ae118c 	ld.w	$r12,$r12,-1148(0xb84)
1c0065d8:	2880018c 	ld.w	$r12,$r12,0
1c0065dc:	44001580 	bnez	$r12,20(0x14) # 1c0065f0 <Game_Enable+0x228>
1c0065e0:	00150005 	move	$r5,$r0
1c0065e4:	02800404 	addi.w	$r4,$r0,1(0x1)
1c0065e8:	57c8a3ff 	bl	-14176(0xfffc8a0) # 1c002e88 <Set_video>
1c0065ec:	50007400 	b	116(0x74) # 1c006660 <Game_Enable+0x298>
1c0065f0:	02800405 	addi.w	$r5,$r0,1(0x1)
1c0065f4:	02801c04 	addi.w	$r4,$r0,7(0x7)
1c0065f8:	57c893ff 	bl	-14192(0xfffc890) # 1c002e88 <Set_video>
1c0065fc:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006600:	28ac518c 	ld.w	$r12,$r12,-1260(0xb14)
1c006604:	2880018c 	ld.w	$r12,$r12,0
1c006608:	02be718d 	addi.w	$r13,$r12,-100(0xf9c)
1c00660c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006610:	28ac118c 	ld.w	$r12,$r12,-1276(0xb04)
1c006614:	2880018c 	ld.w	$r12,$r12,0
1c006618:	02be718c 	addi.w	$r12,$r12,-100(0xf9c)
1c00661c:	001c31ad 	mul.w	$r13,$r13,$r12
1c006620:	0280600c 	addi.w	$r12,$r0,24(0x18)
1c006624:	001c31ae 	mul.w	$r14,$r13,$r12
1c006628:	0281900c 	addi.w	$r12,$r0,100(0x64)
1c00662c:	002031cd 	div.w	$r13,$r14,$r12
1c006630:	5c000980 	bne	$r12,$r0,8(0x8) # 1c006638 <Game_Enable+0x270>
1c006634:	002a0007 	break	0x7
1c006638:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c00663c:	28ab018c 	ld.w	$r12,$r12,-1344(0xac0)
1c006640:	2980018d 	st.w	$r13,$r12,0
1c006644:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006648:	28a8a18c 	ld.w	$r12,$r12,-1496(0xa28)
1c00664c:	2880018c 	ld.w	$r12,$r12,0
1c006650:	0280058d 	addi.w	$r13,$r12,1(0x1)
1c006654:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006658:	28a8618c 	ld.w	$r12,$r12,-1512(0xa18)
1c00665c:	2980018d 	st.w	$r13,$r12,0
1c006660:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006664:	28a8318c 	ld.w	$r12,$r12,-1524(0xa0c)
1c006668:	2880018d 	ld.w	$r13,$r12,0
1c00666c:	0283240c 	addi.w	$r12,$r0,201(0xc9)
1c006670:	5c001dac 	bne	$r13,$r12,28(0x1c) # 1c00668c <Game_Enable+0x2c4>
1c006674:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006678:	28a7e18c 	ld.w	$r12,$r12,-1544(0x9f8)
1c00667c:	29800180 	st.w	$r0,$r12,0
1c006680:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006684:	28ab318c 	ld.w	$r12,$r12,-1332(0xacc)
1c006688:	29800180 	st.w	$r0,$r12,0
1c00668c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006690:	28a6d18c 	ld.w	$r12,$r12,-1612(0x9b4)
1c006694:	2880018d 	ld.w	$r13,$r12,0
1c006698:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c00669c:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c0066ac <Game_Enable+0x2e4>
1c0066a0:	02800405 	addi.w	$r5,$r0,1(0x1)
1c0066a4:	02802004 	addi.w	$r4,$r0,8(0x8)
1c0066a8:	57c7e3ff 	bl	-14368(0xfffc7e0) # 1c002e88 <Set_video>
1c0066ac:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0066b0:	28a7618c 	ld.w	$r12,$r12,-1576(0x9d8)
1c0066b4:	2880018d 	ld.w	$r13,$r12,0
1c0066b8:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0066bc:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c0066cc <Game_Enable+0x304>
1c0066c0:	02800405 	addi.w	$r5,$r0,1(0x1)
1c0066c4:	02802404 	addi.w	$r4,$r0,9(0x9)
1c0066c8:	57c7c3ff 	bl	-14400(0xfffc7c0) # 1c002e88 <Set_video>
1c0066cc:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0066d0:	28a5918c 	ld.w	$r12,$r12,-1692(0x964)
1c0066d4:	2880018d 	ld.w	$r13,$r12,0
1c0066d8:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0066dc:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c0066ec <Game_Enable+0x324>
1c0066e0:	02800405 	addi.w	$r5,$r0,1(0x1)
1c0066e4:	02802804 	addi.w	$r4,$r0,10(0xa)
1c0066e8:	57c7a3ff 	bl	-14432(0xfffc7a0) # 1c002e88 <Set_video>
1c0066ec:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0066f0:	28a7e18c 	ld.w	$r12,$r12,-1544(0x9f8)
1c0066f4:	2880018d 	ld.w	$r13,$r12,0
1c0066f8:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0066fc:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c00670c <Game_Enable+0x344>
1c006700:	00150005 	move	$r5,$r0
1c006704:	02800404 	addi.w	$r4,$r0,1(0x1)
1c006708:	57c783ff 	bl	-14464(0xfffc780) # 1c002e88 <Set_video>
1c00670c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006710:	28a6918c 	ld.w	$r12,$r12,-1628(0x9a4)
1c006714:	2880018d 	ld.w	$r13,$r12,0
1c006718:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c00671c:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c00672c <Game_Enable+0x364>
1c006720:	02800405 	addi.w	$r5,$r0,1(0x1)
1c006724:	02802c04 	addi.w	$r4,$r0,11(0xb)
1c006728:	57c763ff 	bl	-14496(0xfffc760) # 1c002e88 <Set_video>
1c00672c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006730:	28a3918c 	ld.w	$r12,$r12,-1820(0x8e4)
1c006734:	2880018d 	ld.w	$r13,$r12,0
1c006738:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c00673c:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c00674c <Game_Enable+0x384>
1c006740:	02800405 	addi.w	$r5,$r0,1(0x1)
1c006744:	02803004 	addi.w	$r4,$r0,12(0xc)
1c006748:	57c743ff 	bl	-14528(0xfffc740) # 1c002e88 <Set_video>
1c00674c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006750:	28a4c18c 	ld.w	$r12,$r12,-1744(0x930)
1c006754:	2880018d 	ld.w	$r13,$r12,0
1c006758:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c00675c:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c00676c <Game_Enable+0x3a4>
1c006760:	02800405 	addi.w	$r5,$r0,1(0x1)
1c006764:	02803404 	addi.w	$r4,$r0,13(0xd)
1c006768:	57c723ff 	bl	-14560(0xfffc720) # 1c002e88 <Set_video>
1c00676c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006770:	28a5618c 	ld.w	$r12,$r12,-1704(0x958)
1c006774:	2880018d 	ld.w	$r13,$r12,0
1c006778:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c00677c:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c00678c <Game_Enable+0x3c4>
1c006780:	02800405 	addi.w	$r5,$r0,1(0x1)
1c006784:	02803804 	addi.w	$r4,$r0,14(0xe)
1c006788:	57c703ff 	bl	-14592(0xfffc700) # 1c002e88 <Set_video>
1c00678c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006790:	28a2e18c 	ld.w	$r12,$r12,-1864(0x8b8)
1c006794:	2880018d 	ld.w	$r13,$r12,0
1c006798:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c00679c:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c0067ac <Game_Enable+0x3e4>
1c0067a0:	02800405 	addi.w	$r5,$r0,1(0x1)
1c0067a4:	02803c04 	addi.w	$r4,$r0,15(0xf)
1c0067a8:	57c6e3ff 	bl	-14624(0xfffc6e0) # 1c002e88 <Set_video>
1c0067ac:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0067b0:	28a4d18c 	ld.w	$r12,$r12,-1740(0x934)
1c0067b4:	2880018d 	ld.w	$r13,$r12,0
1c0067b8:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0067bc:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c0067cc <Game_Enable+0x404>
1c0067c0:	02800405 	addi.w	$r5,$r0,1(0x1)
1c0067c4:	02804004 	addi.w	$r4,$r0,16(0x10)
1c0067c8:	57c6c3ff 	bl	-14656(0xfffc6c0) # 1c002e88 <Set_video>
1c0067cc:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0067d0:	28a2718c 	ld.w	$r12,$r12,-1892(0x89c)
1c0067d4:	2880018d 	ld.w	$r13,$r12,0
1c0067d8:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0067dc:	5c01e5ac 	bne	$r13,$r12,484(0x1e4) # 1c0069c0 <Game_Enable+0x5f8>
1c0067e0:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0067e4:	28a2f18c 	ld.w	$r12,$r12,-1860(0x8bc)
1c0067e8:	2880018d 	ld.w	$r13,$r12,0
1c0067ec:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0067f0:	28a1a18c 	ld.w	$r12,$r12,-1944(0x868)
1c0067f4:	2880018c 	ld.w	$r12,$r12,0
1c0067f8:	001131ad 	sub.w	$r13,$r13,$r12
1c0067fc:	0281fc0c 	addi.w	$r12,$r0,127(0x7f)
1c006800:	6400298d 	bge	$r12,$r13,40(0x28) # 1c006828 <Game_Enable+0x460>
1c006804:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006808:	28a1418c 	ld.w	$r12,$r12,-1968(0x850)
1c00680c:	2880018d 	ld.w	$r13,$r12,0
1c006810:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006814:	28a2318c 	ld.w	$r12,$r12,-1908(0x88c)
1c006818:	2880018c 	ld.w	$r12,$r12,0
1c00681c:	001131ad 	sub.w	$r13,$r13,$r12
1c006820:	0281fc0c 	addi.w	$r12,$r0,127(0x7f)
1c006824:	6000618d 	blt	$r12,$r13,96(0x60) # 1c006884 <Game_Enable+0x4bc>
1c006828:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c00682c:	28a3418c 	ld.w	$r12,$r12,-1840(0x8d0)
1c006830:	2880018d 	ld.w	$r13,$r12,0
1c006834:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006838:	28a4118c 	ld.w	$r12,$r12,-1788(0x904)
1c00683c:	2880018c 	ld.w	$r12,$r12,0
1c006840:	001131ad 	sub.w	$r13,$r13,$r12
1c006844:	0283000c 	addi.w	$r12,$r0,192(0xc0)
1c006848:	64003d8d 	bge	$r12,$r13,60(0x3c) # 1c006884 <Game_Enable+0x4bc>
1c00684c:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006850:	28a3118c 	ld.w	$r12,$r12,-1852(0x8c4)
1c006854:	2880018d 	ld.w	$r13,$r12,0
1c006858:	02823c0c 	addi.w	$r12,$r0,143(0x8f)
1c00685c:	6400298d 	bge	$r12,$r13,40(0x28) # 1c006884 <Game_Enable+0x4bc>
1c006860:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006864:	28a1418c 	ld.w	$r12,$r12,-1968(0x850)
1c006868:	2880018d 	ld.w	$r13,$r12,0
1c00686c:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c006870:	5c0015ac 	bne	$r13,$r12,20(0x14) # 1c006884 <Game_Enable+0x4bc>
1c006874:	02800405 	addi.w	$r5,$r0,1(0x1)
1c006878:	02802c04 	addi.w	$r4,$r0,11(0xb)
1c00687c:	57c60fff 	bl	-14836(0xfffc60c) # 1c002e88 <Set_video>
1c006880:	50011400 	b	276(0x114) # 1c006994 <Game_Enable+0x5cc>
1c006884:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c006888:	28a0618c 	ld.w	$r12,$r12,-2024(0x818)
1c00688c:	2880018d 	ld.w	$r13,$r12,0
1c006890:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006894:	289f118c 	ld.w	$r12,$r12,1988(0x7c4)
1c006898:	2880018c 	ld.w	$r12,$r12,0
1c00689c:	001131ad 	sub.w	$r13,$r13,$r12
1c0068a0:	0281fc0c 	addi.w	$r12,$r0,127(0x7f)
1c0068a4:	6400298d 	bge	$r12,$r13,40(0x28) # 1c0068cc <Game_Enable+0x504>
1c0068a8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0068ac:	289eb18c 	ld.w	$r12,$r12,1964(0x7ac)
1c0068b0:	2880018d 	ld.w	$r13,$r12,0
1c0068b4:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0068b8:	289fa18c 	ld.w	$r12,$r12,2024(0x7e8)
1c0068bc:	2880018c 	ld.w	$r12,$r12,0
1c0068c0:	001131ad 	sub.w	$r13,$r13,$r12
1c0068c4:	0281fc0c 	addi.w	$r12,$r0,127(0x7f)
1c0068c8:	60005d8d 	blt	$r12,$r13,92(0x5c) # 1c006924 <Game_Enable+0x55c>
1c0068cc:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0068d0:	28a0b18c 	ld.w	$r12,$r12,-2004(0x82c)
1c0068d4:	2880018d 	ld.w	$r13,$r12,0
1c0068d8:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0068dc:	28a1818c 	ld.w	$r12,$r12,-1952(0x860)
1c0068e0:	2880018c 	ld.w	$r12,$r12,0
1c0068e4:	001131ad 	sub.w	$r13,$r13,$r12
1c0068e8:	0283000c 	addi.w	$r12,$r0,192(0xc0)
1c0068ec:	6400398d 	bge	$r12,$r13,56(0x38) # 1c006924 <Game_Enable+0x55c>
1c0068f0:	1cc7ff6c 	pcaddu12i	$r12,409595(0x63ffb)
1c0068f4:	28a0818c 	ld.w	$r12,$r12,-2016(0x820)
1c0068f8:	2880018d 	ld.w	$r13,$r12,0
1c0068fc:	02823c0c 	addi.w	$r12,$r0,143(0x8f)
1c006900:	6400258d 	bge	$r12,$r13,36(0x24) # 1c006924 <Game_Enable+0x55c>
1c006904:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006908:	289eb18c 	ld.w	$r12,$r12,1964(0x7ac)
1c00690c:	2880018c 	ld.w	$r12,$r12,0
1c006910:	44001580 	bnez	$r12,20(0x14) # 1c006924 <Game_Enable+0x55c>
1c006914:	00150005 	move	$r5,$r0
1c006918:	02802c04 	addi.w	$r4,$r0,11(0xb)
1c00691c:	57c56fff 	bl	-14996(0xfffc56c) # 1c002e88 <Set_video>
1c006920:	50007400 	b	116(0x74) # 1c006994 <Game_Enable+0x5cc>
1c006924:	02800405 	addi.w	$r5,$r0,1(0x1)
1c006928:	02804404 	addi.w	$r4,$r0,17(0x11)
1c00692c:	57c55fff 	bl	-15012(0xfffc55c) # 1c002e88 <Set_video>
1c006930:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006934:	289f818c 	ld.w	$r12,$r12,2016(0x7e0)
1c006938:	2880018c 	ld.w	$r12,$r12,0
1c00693c:	02be718d 	addi.w	$r13,$r12,-100(0xf9c)
1c006940:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006944:	289f418c 	ld.w	$r12,$r12,2000(0x7d0)
1c006948:	2880018c 	ld.w	$r12,$r12,0
1c00694c:	02be718c 	addi.w	$r12,$r12,-100(0xf9c)
1c006950:	001c31ad 	mul.w	$r13,$r13,$r12
1c006954:	0280600c 	addi.w	$r12,$r0,24(0x18)
1c006958:	001c31ae 	mul.w	$r14,$r13,$r12
1c00695c:	0281900c 	addi.w	$r12,$r0,100(0x64)
1c006960:	002031cd 	div.w	$r13,$r14,$r12
1c006964:	5c000980 	bne	$r12,$r0,8(0x8) # 1c00696c <Game_Enable+0x5a4>
1c006968:	002a0007 	break	0x7
1c00696c:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006970:	289f318c 	ld.w	$r12,$r12,1996(0x7cc)
1c006974:	2980018d 	st.w	$r13,$r12,0
1c006978:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c00697c:	289e618c 	ld.w	$r12,$r12,1944(0x798)
1c006980:	2880018c 	ld.w	$r12,$r12,0
1c006984:	0280058d 	addi.w	$r13,$r12,1(0x1)
1c006988:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c00698c:	289e218c 	ld.w	$r12,$r12,1928(0x788)
1c006990:	2980018d 	st.w	$r13,$r12,0
1c006994:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006998:	289df18c 	ld.w	$r12,$r12,1916(0x77c)
1c00699c:	2880018d 	ld.w	$r13,$r12,0
1c0069a0:	0283240c 	addi.w	$r12,$r0,201(0xc9)
1c0069a4:	5c001dac 	bne	$r13,$r12,28(0x1c) # 1c0069c0 <Game_Enable+0x5f8>
1c0069a8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0069ac:	289da18c 	ld.w	$r12,$r12,1896(0x768)
1c0069b0:	29800180 	st.w	$r0,$r12,0
1c0069b4:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0069b8:	289ad18c 	ld.w	$r12,$r12,1716(0x6b4)
1c0069bc:	29800180 	st.w	$r0,$r12,0
1c0069c0:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0069c4:	289d118c 	ld.w	$r12,$r12,1860(0x744)
1c0069c8:	2880018d 	ld.w	$r13,$r12,0
1c0069cc:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0069d0:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c0069e0 <Game_Enable+0x618>
1c0069d4:	02800405 	addi.w	$r5,$r0,1(0x1)
1c0069d8:	02804804 	addi.w	$r4,$r0,18(0x12)
1c0069dc:	57c4afff 	bl	-15188(0xfffc4ac) # 1c002e88 <Set_video>
1c0069e0:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0069e4:	289b518c 	ld.w	$r12,$r12,1748(0x6d4)
1c0069e8:	2880018d 	ld.w	$r13,$r12,0
1c0069ec:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0069f0:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c006a00 <Game_Enable+0x638>
1c0069f4:	02800405 	addi.w	$r5,$r0,1(0x1)
1c0069f8:	02804c04 	addi.w	$r4,$r0,19(0x13)
1c0069fc:	57c48fff 	bl	-15220(0xfffc48c) # 1c002e88 <Set_video>
1c006a00:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006a04:	2899418c 	ld.w	$r12,$r12,1616(0x650)
1c006a08:	2880018d 	ld.w	$r13,$r12,0
1c006a0c:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c006a10:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c006a20 <Game_Enable+0x658>
1c006a14:	02800405 	addi.w	$r5,$r0,1(0x1)
1c006a18:	02805004 	addi.w	$r4,$r0,20(0x14)
1c006a1c:	57c46fff 	bl	-15252(0xfffc46c) # 1c002e88 <Set_video>
1c006a20:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006a24:	289c318c 	ld.w	$r12,$r12,1804(0x70c)
1c006a28:	2880018d 	ld.w	$r13,$r12,0
1c006a2c:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c006a30:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c006a40 <Game_Enable+0x678>
1c006a34:	00150005 	move	$r5,$r0
1c006a38:	02802c04 	addi.w	$r4,$r0,11(0xb)
1c006a3c:	57c44fff 	bl	-15284(0xfffc44c) # 1c002e88 <Set_video>
1c006a40:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006a44:	2898018c 	ld.w	$r12,$r12,1536(0x600)
1c006a48:	2880018d 	ld.w	$r13,$r12,0
1c006a4c:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c006a50:	5c003dac 	bne	$r13,$r12,60(0x3c) # 1c006a8c <Game_Enable+0x6c4>
1c006a54:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006a58:	289a218c 	ld.w	$r12,$r12,1672(0x688)
1c006a5c:	2880018c 	ld.w	$r12,$r12,0
1c006a60:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c006a64:	5800118d 	beq	$r12,$r13,16(0x10) # 1c006a74 <Game_Enable+0x6ac>
1c006a68:	0280080d 	addi.w	$r13,$r0,2(0x2)
1c006a6c:	5800158d 	beq	$r12,$r13,20(0x14) # 1c006a80 <Game_Enable+0x6b8>
1c006a70:	50002000 	b	32(0x20) # 1c006a90 <Game_Enable+0x6c8>
1c006a74:	02801404 	addi.w	$r4,$r0,5(0x5)
1c006a78:	57c2f7ff 	bl	-15628(0xfffc2f4) # 1c002d6c <Set_Audio>
1c006a7c:	50001400 	b	20(0x14) # 1c006a90 <Game_Enable+0x6c8>
1c006a80:	02801804 	addi.w	$r4,$r0,6(0x6)
1c006a84:	57c2ebff 	bl	-15640(0xfffc2e8) # 1c002d6c <Set_Audio>
1c006a88:	50000800 	b	8(0x8) # 1c006a90 <Game_Enable+0x6c8>
1c006a8c:	03400000 	andi	$r0,$r0,0x0
1c006a90:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006a94:	2899d18c 	ld.w	$r12,$r12,1652(0x674)
1c006a98:	2880018d 	ld.w	$r13,$r12,0
1c006a9c:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c006aa0:	5c003dac 	bne	$r13,$r12,60(0x3c) # 1c006adc <Game_Enable+0x714>
1c006aa4:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006aa8:	2898618c 	ld.w	$r12,$r12,1560(0x618)
1c006aac:	2880018c 	ld.w	$r12,$r12,0
1c006ab0:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c006ab4:	5800118d 	beq	$r12,$r13,16(0x10) # 1c006ac4 <Game_Enable+0x6fc>
1c006ab8:	0280080d 	addi.w	$r13,$r0,2(0x2)
1c006abc:	5800158d 	beq	$r12,$r13,20(0x14) # 1c006ad0 <Game_Enable+0x708>
1c006ac0:	50002000 	b	32(0x20) # 1c006ae0 <Game_Enable+0x718>
1c006ac4:	02800c04 	addi.w	$r4,$r0,3(0x3)
1c006ac8:	57c2a7ff 	bl	-15708(0xfffc2a4) # 1c002d6c <Set_Audio>
1c006acc:	50001400 	b	20(0x14) # 1c006ae0 <Game_Enable+0x718>
1c006ad0:	02801004 	addi.w	$r4,$r0,4(0x4)
1c006ad4:	57c29bff 	bl	-15720(0xfffc298) # 1c002d6c <Set_Audio>
1c006ad8:	50000800 	b	8(0x8) # 1c006ae0 <Game_Enable+0x718>
1c006adc:	03400000 	andi	$r0,$r0,0x0
1c006ae0:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006ae4:	2896918c 	ld.w	$r12,$r12,1444(0x5a4)
1c006ae8:	2880018d 	ld.w	$r13,$r12,0
1c006aec:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c006af0:	5c000dac 	bne	$r13,$r12,12(0xc) # 1c006afc <Game_Enable+0x734>
1c006af4:	02802c04 	addi.w	$r4,$r0,11(0xb)
1c006af8:	57c277ff 	bl	-15756(0xfffc274) # 1c002d6c <Set_Audio>
1c006afc:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006b00:	2896e18c 	ld.w	$r12,$r12,1464(0x5b8)
1c006b04:	2880018d 	ld.w	$r13,$r12,0
1c006b08:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c006b0c:	5c000dac 	bne	$r13,$r12,12(0xc) # 1c006b18 <Game_Enable+0x750>
1c006b10:	02802804 	addi.w	$r4,$r0,10(0xa)
1c006b14:	57c25bff 	bl	-15784(0xfffc258) # 1c002d6c <Set_Audio>
1c006b18:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006b1c:	2894618c 	ld.w	$r12,$r12,1304(0x518)
1c006b20:	2880018d 	ld.w	$r13,$r12,0
1c006b24:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c006b28:	5c000dac 	bne	$r13,$r12,12(0xc) # 1c006b34 <Game_Enable+0x76c>
1c006b2c:	02802404 	addi.w	$r4,$r0,9(0x9)
1c006b30:	57c23fff 	bl	-15812(0xfffc23c) # 1c002d6c <Set_Audio>
1c006b34:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006b38:	2894718c 	ld.w	$r12,$r12,1308(0x51c)
1c006b3c:	2880018d 	ld.w	$r13,$r12,0
1c006b40:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c006b44:	5c000dac 	bne	$r13,$r12,12(0xc) # 1c006b50 <Game_Enable+0x788>
1c006b48:	02802004 	addi.w	$r4,$r0,8(0x8)
1c006b4c:	57c223ff 	bl	-15840(0xfffc220) # 1c002d6c <Set_Audio>
1c006b50:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006b54:	2898418c 	ld.w	$r12,$r12,1552(0x610)
1c006b58:	2880018c 	ld.w	$r12,$r12,0
1c006b5c:	40001580 	beqz	$r12,20(0x14) # 1c006b70 <Game_Enable+0x7a8>
1c006b60:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006b64:	2896218c 	ld.w	$r12,$r12,1416(0x588)
1c006b68:	2880018c 	ld.w	$r12,$r12,0
1c006b6c:	44003d80 	bnez	$r12,60(0x3c) # 1c006ba8 <Game_Enable+0x7e0>
1c006b70:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006b74:	2894118c 	ld.w	$r12,$r12,1284(0x504)
1c006b78:	2880018d 	ld.w	$r13,$r12,0
1c006b7c:	0280a00c 	addi.w	$r12,$r0,40(0x28)
1c006b80:	6000298d 	blt	$r12,$r13,40(0x28) # 1c006ba8 <Game_Enable+0x7e0>
1c006b84:	02803404 	addi.w	$r4,$r0,13(0xd)
1c006b88:	57c1e7ff 	bl	-15900(0xfffc1e4) # 1c002d6c <Set_Audio>
1c006b8c:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006b90:	2893a18c 	ld.w	$r12,$r12,1256(0x4e8)
1c006b94:	2880018c 	ld.w	$r12,$r12,0
1c006b98:	0280058d 	addi.w	$r13,$r12,1(0x1)
1c006b9c:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006ba0:	2893618c 	ld.w	$r12,$r12,1240(0x4d8)
1c006ba4:	2980018d 	st.w	$r13,$r12,0
1c006ba8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006bac:	2893418c 	ld.w	$r12,$r12,1232(0x4d0)
1c006bb0:	2880018d 	ld.w	$r13,$r12,0
1c006bb4:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c006bb8:	5c0095ac 	bne	$r13,$r12,148(0x94) # 1c006c4c <Game_Enable+0x884>
1c006bbc:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006bc0:	2892718c 	ld.w	$r12,$r12,1180(0x49c)
1c006bc4:	2880018c 	ld.w	$r12,$r12,0
1c006bc8:	44008580 	bnez	$r12,132(0x84) # 1c006c4c <Game_Enable+0x884>
1c006bcc:	140005ac 	lu12i.w	$r12,45(0x2d)
1c006bd0:	03a6518c 	ori	$r12,$r12,0x994
1c006bd4:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c006bd8:	50001400 	b	20(0x14) # 1c006bec <Game_Enable+0x824>
1c006bdc:	03400000 	andi	$r0,$r0,0x0
1c006be0:	03400000 	andi	$r0,$r0,0x0
1c006be4:	03400000 	andi	$r0,$r0,0x0
1c006be8:	03400000 	andi	$r0,$r0,0x0
1c006bec:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c006bf0:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c006bf4:	29bfb2cd 	st.w	$r13,$r22,-20(0xfec)
1c006bf8:	47ffe59f 	bnez	$r12,-28(0x7fffe4) # 1c006bdc <Game_Enable+0x814>
1c006bfc:	02803004 	addi.w	$r4,$r0,12(0xc)
1c006c00:	57c16fff 	bl	-16020(0xfffc16c) # 1c002d6c <Set_Audio>
1c006c04:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006c08:	2892f18c 	ld.w	$r12,$r12,1212(0x4bc)
1c006c0c:	2880018c 	ld.w	$r12,$r12,0
1c006c10:	0280058d 	addi.w	$r13,$r12,1(0x1)
1c006c14:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006c18:	2892b18c 	ld.w	$r12,$r12,1196(0x4ac)
1c006c1c:	2980018d 	st.w	$r13,$r12,0
1c006c20:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006c24:	2892818c 	ld.w	$r12,$r12,1184(0x4a0)
1c006c28:	2880018d 	ld.w	$r13,$r12,0
1c006c2c:	0280140c 	addi.w	$r12,$r0,5(0x5)
1c006c30:	5c001dac 	bne	$r13,$r12,28(0x1c) # 1c006c4c <Game_Enable+0x884>
1c006c34:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006c38:	2890918c 	ld.w	$r12,$r12,1060(0x424)
1c006c3c:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c006c40:	2980018d 	st.w	$r13,$r12,0
1c006c44:	02800404 	addi.w	$r4,$r0,1(0x1)
1c006c48:	57c127ff 	bl	-16092(0xfffc124) # 1c002d6c <Set_Audio>
1c006c4c:	03400000 	andi	$r0,$r0,0x0
1c006c50:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c006c54:	28806076 	ld.w	$r22,$r3,24(0x18)
1c006c58:	02808063 	addi.w	$r3,$r3,32(0x20)
1c006c5c:	4c000020 	jirl	$r0,$r1,0

1c006c60 <Game_Data>:
Game_Data():
1c006c60:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c006c64:	29803076 	st.w	$r22,$r3,12(0xc)
1c006c68:	02804076 	addi.w	$r22,$r3,16(0x10)
1c006c6c:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006c70:	2893a18c 	ld.w	$r12,$r12,1256(0x4e8)
1c006c74:	2880018d 	ld.w	$r13,$r12,0
1c006c78:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c006c7c:	5c00b9ac 	bne	$r13,$r12,184(0xb8) # 1c006d34 <Game_Data+0xd4>
1c006c80:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006c84:	2890a18c 	ld.w	$r12,$r12,1064(0x428)
1c006c88:	2880018d 	ld.w	$r13,$r12,0
1c006c8c:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c006c90:	5c00a5ac 	bne	$r13,$r12,164(0xa4) # 1c006d34 <Game_Data+0xd4>
1c006c94:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006c98:	288f018c 	ld.w	$r12,$r12,960(0x3c0)
1c006c9c:	2880018d 	ld.w	$r13,$r12,0
1c006ca0:	0287fc0c 	addi.w	$r12,$r0,511(0x1ff)
1c006ca4:	6000918d 	blt	$r12,$r13,144(0x90) # 1c006d34 <Game_Data+0xd4>
1c006ca8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006cac:	288df18c 	ld.w	$r12,$r12,892(0x37c)
1c006cb0:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c006cb4:	2980018d 	st.w	$r13,$r12,0
1c006cb8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006cbc:	2892018c 	ld.w	$r12,$r12,1152(0x480)
1c006cc0:	2880018c 	ld.w	$r12,$r12,0
1c006cc4:	02bd098d 	addi.w	$r13,$r12,-190(0xf42)
1c006cc8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006ccc:	2890c18c 	ld.w	$r12,$r12,1072(0x430)
1c006cd0:	2880018c 	ld.w	$r12,$r12,0
1c006cd4:	6000458d 	blt	$r12,$r13,68(0x44) # 1c006d18 <Game_Data+0xb8>
1c006cd8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006cdc:	288f118c 	ld.w	$r12,$r12,964(0x3c4)
1c006ce0:	2880018c 	ld.w	$r12,$r12,0
1c006ce4:	02be018d 	addi.w	$r13,$r12,-128(0xf80)
1c006ce8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006cec:	288db18c 	ld.w	$r12,$r12,876(0x36c)
1c006cf0:	2880018c 	ld.w	$r12,$r12,0
1c006cf4:	6000258d 	blt	$r12,$r13,36(0x24) # 1c006d18 <Game_Data+0xb8>
1c006cf8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006cfc:	288e918c 	ld.w	$r12,$r12,932(0x3a4)
1c006d00:	2880018c 	ld.w	$r12,$r12,0
1c006d04:	02be058d 	addi.w	$r13,$r12,-127(0xf81)
1c006d08:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006d0c:	288d318c 	ld.w	$r12,$r12,844(0x34c)
1c006d10:	2880018c 	ld.w	$r12,$r12,0
1c006d14:	6000218d 	blt	$r12,$r13,32(0x20) # 1c006d34 <Game_Data+0xd4>
1c006d18:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006d1c:	288cf18c 	ld.w	$r12,$r12,828(0x33c)
1c006d20:	2880018c 	ld.w	$r12,$r12,0
1c006d24:	0280058d 	addi.w	$r13,$r12,1(0x1)
1c006d28:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006d2c:	288cb18c 	ld.w	$r12,$r12,812(0x32c)
1c006d30:	2980018d 	st.w	$r13,$r12,0
1c006d34:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006d38:	2890818c 	ld.w	$r12,$r12,1056(0x420)
1c006d3c:	2880018d 	ld.w	$r13,$r12,0
1c006d40:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c006d44:	5c00b1ac 	bne	$r13,$r12,176(0xb0) # 1c006df4 <Game_Data+0x194>
1c006d48:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006d4c:	288b618c 	ld.w	$r12,$r12,728(0x2d8)
1c006d50:	2880018d 	ld.w	$r13,$r12,0
1c006d54:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c006d58:	5c009dac 	bne	$r13,$r12,156(0x9c) # 1c006df4 <Game_Data+0x194>
1c006d5c:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006d60:	288be18c 	ld.w	$r12,$r12,760(0x2f8)
1c006d64:	2880018c 	ld.w	$r12,$r12,0
1c006d68:	64008c0c 	bge	$r0,$r12,140(0x8c) # 1c006df4 <Game_Data+0x194>
1c006d6c:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006d70:	288ae18c 	ld.w	$r12,$r12,696(0x2b8)
1c006d74:	29800180 	st.w	$r0,$r12,0
1c006d78:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006d7c:	288f018c 	ld.w	$r12,$r12,960(0x3c0)
1c006d80:	2880018c 	ld.w	$r12,$r12,0
1c006d84:	02bd098d 	addi.w	$r13,$r12,-190(0xf42)
1c006d88:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006d8c:	288dc18c 	ld.w	$r12,$r12,880(0x370)
1c006d90:	2880018c 	ld.w	$r12,$r12,0
1c006d94:	6000458d 	blt	$r12,$r13,68(0x44) # 1c006dd8 <Game_Data+0x178>
1c006d98:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006d9c:	288c118c 	ld.w	$r12,$r12,772(0x304)
1c006da0:	2880018c 	ld.w	$r12,$r12,0
1c006da4:	0282018d 	addi.w	$r13,$r12,128(0x80)
1c006da8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006dac:	288ab18c 	ld.w	$r12,$r12,684(0x2ac)
1c006db0:	2880018c 	ld.w	$r12,$r12,0
1c006db4:	600025ac 	blt	$r13,$r12,36(0x24) # 1c006dd8 <Game_Data+0x178>
1c006db8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006dbc:	288b918c 	ld.w	$r12,$r12,740(0x2e4)
1c006dc0:	2880018c 	ld.w	$r12,$r12,0
1c006dc4:	0281fd8d 	addi.w	$r13,$r12,127(0x7f)
1c006dc8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006dcc:	288a318c 	ld.w	$r12,$r12,652(0x28c)
1c006dd0:	2880018c 	ld.w	$r12,$r12,0
1c006dd4:	600021ac 	blt	$r13,$r12,32(0x20) # 1c006df4 <Game_Data+0x194>
1c006dd8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006ddc:	2889f18c 	ld.w	$r12,$r12,636(0x27c)
1c006de0:	2880018c 	ld.w	$r12,$r12,0
1c006de4:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c006de8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006dec:	2889b18c 	ld.w	$r12,$r12,620(0x26c)
1c006df0:	2980018d 	st.w	$r13,$r12,0
1c006df4:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006df8:	2889318c 	ld.w	$r12,$r12,588(0x24c)
1c006dfc:	2880018c 	ld.w	$r12,$r12,0
1c006e00:	44001580 	bnez	$r12,20(0x14) # 1c006e14 <Game_Data+0x1b4>
1c006e04:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006e08:	2888b18c 	ld.w	$r12,$r12,556(0x22c)
1c006e0c:	2880018c 	ld.w	$r12,$r12,0
1c006e10:	40016980 	beqz	$r12,360(0x168) # 1c006f78 <Game_Data+0x318>
1c006e14:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006e18:	2888518c 	ld.w	$r12,$r12,532(0x214)
1c006e1c:	2880018c 	ld.w	$r12,$r12,0
1c006e20:	44015980 	bnez	$r12,344(0x158) # 1c006f78 <Game_Data+0x318>
1c006e24:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006e28:	288c718c 	ld.w	$r12,$r12,796(0x31c)
1c006e2c:	2880018d 	ld.w	$r13,$r12,0
1c006e30:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c006e34:	5c0145ac 	bne	$r13,$r12,324(0x144) # 1c006f78 <Game_Data+0x318>
1c006e38:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006e3c:	288ca18c 	ld.w	$r12,$r12,808(0x328)
1c006e40:	2880018d 	ld.w	$r13,$r12,0
1c006e44:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006e48:	2887d18c 	ld.w	$r12,$r12,500(0x1f4)
1c006e4c:	2880018c 	ld.w	$r12,$r12,0
1c006e50:	001131ad 	sub.w	$r13,$r13,$r12
1c006e54:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006e58:	288c318c 	ld.w	$r12,$r12,780(0x30c)
1c006e5c:	2980018d 	st.w	$r13,$r12,0
1c006e60:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006e64:	288c018c 	ld.w	$r12,$r12,768(0x300)
1c006e68:	2880018c 	ld.w	$r12,$r12,0
1c006e6c:	64001180 	bge	$r12,$r0,16(0x10) # 1c006e7c <Game_Data+0x21c>
1c006e70:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006e74:	288bc18c 	ld.w	$r12,$r12,752(0x2f0)
1c006e78:	29800180 	st.w	$r0,$r12,0
1c006e7c:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006e80:	2886b18c 	ld.w	$r12,$r12,428(0x1ac)
1c006e84:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c006e88:	2980018d 	st.w	$r13,$r12,0
1c006e8c:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006e90:	2888218c 	ld.w	$r12,$r12,520(0x208)
1c006e94:	2880018d 	ld.w	$r13,$r12,0
1c006e98:	0281900c 	addi.w	$r12,$r0,100(0x64)
1c006e9c:	5c0019ac 	bne	$r13,$r12,24(0x18) # 1c006eb4 <Game_Data+0x254>
1c006ea0:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006ea4:	2889718c 	ld.w	$r12,$r12,604(0x25c)
1c006ea8:	2880018d 	ld.w	$r13,$r12,0
1c006eac:	02800c0c 	addi.w	$r12,$r0,3(0x3)
1c006eb0:	580045ac 	beq	$r13,$r12,68(0x44) # 1c006ef4 <Game_Data+0x294>
1c006eb4:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006eb8:	2885618c 	ld.w	$r12,$r12,344(0x158)
1c006ebc:	2880018c 	ld.w	$r12,$r12,0
1c006ec0:	44003580 	bnez	$r12,52(0x34) # 1c006ef4 <Game_Data+0x294>
1c006ec4:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006ec8:	2885d18c 	ld.w	$r12,$r12,372(0x174)
1c006ecc:	2880018d 	ld.w	$r13,$r12,0
1c006ed0:	02800c0c 	addi.w	$r12,$r0,3(0x3)
1c006ed4:	001c31ad 	mul.w	$r13,$r13,$r12
1c006ed8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006edc:	2886f18c 	ld.w	$r12,$r12,444(0x1bc)
1c006ee0:	2880018c 	ld.w	$r12,$r12,0
1c006ee4:	001031ad 	add.w	$r13,$r13,$r12
1c006ee8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006eec:	2886b18c 	ld.w	$r12,$r12,428(0x1ac)
1c006ef0:	2980018d 	st.w	$r13,$r12,0
1c006ef4:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006ef8:	2887718c 	ld.w	$r12,$r12,476(0x1dc)
1c006efc:	2880018d 	ld.w	$r13,$r12,0
1c006f00:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c006f04:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c006f14 <Game_Data+0x2b4>
1c006f08:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006f0c:	2884c18c 	ld.w	$r12,$r12,304(0x130)
1c006f10:	29800180 	st.w	$r0,$r12,0
1c006f14:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006f18:	2886d18c 	ld.w	$r12,$r12,436(0x1b4)
1c006f1c:	2880018d 	ld.w	$r13,$r12,0
1c006f20:	0281900c 	addi.w	$r12,$r0,100(0x64)
1c006f24:	5c0019ac 	bne	$r13,$r12,24(0x18) # 1c006f3c <Game_Data+0x2dc>
1c006f28:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006f2c:	2888c18c 	ld.w	$r12,$r12,560(0x230)
1c006f30:	2880018d 	ld.w	$r13,$r12,0
1c006f34:	02800c0c 	addi.w	$r12,$r0,3(0x3)
1c006f38:	580041ac 	beq	$r13,$r12,64(0x40) # 1c006f78 <Game_Data+0x318>
1c006f3c:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006f40:	2883318c 	ld.w	$r12,$r12,204(0xcc)
1c006f44:	2880018c 	ld.w	$r12,$r12,0
1c006f48:	44003180 	bnez	$r12,48(0x30) # 1c006f78 <Game_Data+0x318>
1c006f4c:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006f50:	2883b18c 	ld.w	$r12,$r12,236(0xec)
1c006f54:	2880018c 	ld.w	$r12,$r12,0
1c006f58:	0040898d 	slli.w	$r13,$r12,0x2
1c006f5c:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006f60:	2885b18c 	ld.w	$r12,$r12,364(0x16c)
1c006f64:	2880018c 	ld.w	$r12,$r12,0
1c006f68:	001031ad 	add.w	$r13,$r13,$r12
1c006f6c:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006f70:	2885718c 	ld.w	$r12,$r12,348(0x15c)
1c006f74:	2980018d 	st.w	$r13,$r12,0
1c006f78:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006f7c:	2883418c 	ld.w	$r12,$r12,208(0xd0)
1c006f80:	2880018d 	ld.w	$r13,$r12,0
1c006f84:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c006f88:	5c0051ac 	bne	$r13,$r12,80(0x50) # 1c006fd8 <Game_Data+0x378>
1c006f8c:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006f90:	2882018c 	ld.w	$r12,$r12,128(0x80)
1c006f94:	2880018c 	ld.w	$r12,$r12,0
1c006f98:	44004180 	bnez	$r12,64(0x40) # 1c006fd8 <Game_Data+0x378>
1c006f9c:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006fa0:	2885818c 	ld.w	$r12,$r12,352(0x160)
1c006fa4:	2880018c 	ld.w	$r12,$r12,0
1c006fa8:	6400300c 	bge	$r0,$r12,48(0x30) # 1c006fd8 <Game_Data+0x378>
1c006fac:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006fb0:	2885418c 	ld.w	$r12,$r12,336(0x150)
1c006fb4:	2880018c 	ld.w	$r12,$r12,0
1c006fb8:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c006fbc:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006fc0:	2885018c 	ld.w	$r12,$r12,320(0x140)
1c006fc4:	2980018d 	st.w	$r13,$r12,0
1c006fc8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006fcc:	2881118c 	ld.w	$r12,$r12,68(0x44)
1c006fd0:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c006fd4:	2980018d 	st.w	$r13,$r12,0
1c006fd8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006fdc:	2883618c 	ld.w	$r12,$r12,216(0xd8)
1c006fe0:	2880018d 	ld.w	$r13,$r12,0
1c006fe4:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c006fe8:	5c00b9ac 	bne	$r13,$r12,184(0xb8) # 1c0070a0 <Game_Data+0x440>
1c006fec:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c006ff0:	2881e18c 	ld.w	$r12,$r12,120(0x78)
1c006ff4:	2880018d 	ld.w	$r13,$r12,0
1c006ff8:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c006ffc:	5c00a5ac 	bne	$r13,$r12,164(0xa4) # 1c0070a0 <Game_Data+0x440>
1c007000:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007004:	2882718c 	ld.w	$r12,$r12,156(0x9c)
1c007008:	2880018d 	ld.w	$r13,$r12,0
1c00700c:	0287fc0c 	addi.w	$r12,$r0,511(0x1ff)
1c007010:	6000918d 	blt	$r12,$r13,144(0x90) # 1c0070a0 <Game_Data+0x440>
1c007014:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007018:	2881318c 	ld.w	$r12,$r12,76(0x4c)
1c00701c:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c007020:	2980018d 	st.w	$r13,$r12,0
1c007024:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007028:	2883518c 	ld.w	$r12,$r12,212(0xd4)
1c00702c:	2880018c 	ld.w	$r12,$r12,0
1c007030:	02bd098d 	addi.w	$r13,$r12,-190(0xf42)
1c007034:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007038:	2884118c 	ld.w	$r12,$r12,260(0x104)
1c00703c:	2880018c 	ld.w	$r12,$r12,0
1c007040:	6000458d 	blt	$r12,$r13,68(0x44) # 1c007084 <Game_Data+0x424>
1c007044:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007048:	2880418c 	ld.w	$r12,$r12,16(0x10)
1c00704c:	2880018c 	ld.w	$r12,$r12,0
1c007050:	02be018d 	addi.w	$r13,$r12,-128(0xf80)
1c007054:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007058:	2881218c 	ld.w	$r12,$r12,72(0x48)
1c00705c:	2880018c 	ld.w	$r12,$r12,0
1c007060:	6000258d 	blt	$r12,$r13,36(0x24) # 1c007084 <Game_Data+0x424>
1c007064:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007068:	28bfc18c 	ld.w	$r12,$r12,-16(0xff0)
1c00706c:	2880018c 	ld.w	$r12,$r12,0
1c007070:	02be058d 	addi.w	$r13,$r12,-127(0xf81)
1c007074:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007078:	2880a18c 	ld.w	$r12,$r12,40(0x28)
1c00707c:	2880018c 	ld.w	$r12,$r12,0
1c007080:	6000218d 	blt	$r12,$r13,32(0x20) # 1c0070a0 <Game_Data+0x440>
1c007084:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007088:	2880618c 	ld.w	$r12,$r12,24(0x18)
1c00708c:	2880018c 	ld.w	$r12,$r12,0
1c007090:	0280058d 	addi.w	$r13,$r12,1(0x1)
1c007094:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007098:	2880218c 	ld.w	$r12,$r12,8(0x8)
1c00709c:	2980018d 	st.w	$r13,$r12,0
1c0070a0:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0070a4:	2880418c 	ld.w	$r12,$r12,16(0x10)
1c0070a8:	2880018d 	ld.w	$r13,$r12,0
1c0070ac:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0070b0:	5c00b1ac 	bne	$r13,$r12,176(0xb0) # 1c007160 <Game_Data+0x500>
1c0070b4:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0070b8:	28bea18c 	ld.w	$r12,$r12,-88(0xfa8)
1c0070bc:	2880018d 	ld.w	$r13,$r12,0
1c0070c0:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0070c4:	5c009dac 	bne	$r13,$r12,156(0x9c) # 1c007160 <Game_Data+0x500>
1c0070c8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0070cc:	28bf518c 	ld.w	$r12,$r12,-44(0xfd4)
1c0070d0:	2880018c 	ld.w	$r12,$r12,0
1c0070d4:	64008c0c 	bge	$r0,$r12,140(0x8c) # 1c007160 <Game_Data+0x500>
1c0070d8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0070dc:	28be218c 	ld.w	$r12,$r12,-120(0xf88)
1c0070e0:	29800180 	st.w	$r0,$r12,0
1c0070e4:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0070e8:	2880518c 	ld.w	$r12,$r12,20(0x14)
1c0070ec:	2880018c 	ld.w	$r12,$r12,0
1c0070f0:	02bd098d 	addi.w	$r13,$r12,-190(0xf42)
1c0070f4:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0070f8:	2881118c 	ld.w	$r12,$r12,68(0x44)
1c0070fc:	2880018c 	ld.w	$r12,$r12,0
1c007100:	6000458d 	blt	$r12,$r13,68(0x44) # 1c007144 <Game_Data+0x4e4>
1c007104:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007108:	28bd418c 	ld.w	$r12,$r12,-176(0xf50)
1c00710c:	2880018c 	ld.w	$r12,$r12,0
1c007110:	0282018d 	addi.w	$r13,$r12,128(0x80)
1c007114:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007118:	28be218c 	ld.w	$r12,$r12,-120(0xf88)
1c00711c:	2880018c 	ld.w	$r12,$r12,0
1c007120:	600025ac 	blt	$r13,$r12,36(0x24) # 1c007144 <Game_Data+0x4e4>
1c007124:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007128:	28bcc18c 	ld.w	$r12,$r12,-208(0xf30)
1c00712c:	2880018c 	ld.w	$r12,$r12,0
1c007130:	0281fd8d 	addi.w	$r13,$r12,127(0x7f)
1c007134:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007138:	28bda18c 	ld.w	$r12,$r12,-152(0xf68)
1c00713c:	2880018c 	ld.w	$r12,$r12,0
1c007140:	600021ac 	blt	$r13,$r12,32(0x20) # 1c007160 <Game_Data+0x500>
1c007144:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007148:	28bd618c 	ld.w	$r12,$r12,-168(0xf58)
1c00714c:	2880018c 	ld.w	$r12,$r12,0
1c007150:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c007154:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007158:	28bd218c 	ld.w	$r12,$r12,-184(0xf48)
1c00715c:	2980018d 	st.w	$r13,$r12,0
1c007160:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007164:	28be918c 	ld.w	$r12,$r12,-92(0xfa4)
1c007168:	2880018c 	ld.w	$r12,$r12,0
1c00716c:	44001580 	bnez	$r12,20(0x14) # 1c007180 <Game_Data+0x520>
1c007170:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007174:	28bb818c 	ld.w	$r12,$r12,-288(0xee0)
1c007178:	2880018c 	ld.w	$r12,$r12,0
1c00717c:	40016980 	beqz	$r12,360(0x168) # 1c0072e4 <Game_Data+0x684>
1c007180:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007184:	28bdc18c 	ld.w	$r12,$r12,-144(0xf70)
1c007188:	2880018c 	ld.w	$r12,$r12,0
1c00718c:	44015980 	bnez	$r12,344(0x158) # 1c0072e4 <Game_Data+0x684>
1c007190:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007194:	28bdf18c 	ld.w	$r12,$r12,-132(0xf7c)
1c007198:	2880018d 	ld.w	$r13,$r12,0
1c00719c:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0071a0:	5c0145ac 	bne	$r13,$r12,324(0x144) # 1c0072e4 <Game_Data+0x684>
1c0071a4:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0071a8:	28bd118c 	ld.w	$r12,$r12,-188(0xf44)
1c0071ac:	2880018d 	ld.w	$r13,$r12,0
1c0071b0:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0071b4:	28ba118c 	ld.w	$r12,$r12,-380(0xe84)
1c0071b8:	2880018c 	ld.w	$r12,$r12,0
1c0071bc:	001131ad 	sub.w	$r13,$r13,$r12
1c0071c0:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0071c4:	28bca18c 	ld.w	$r12,$r12,-216(0xf28)
1c0071c8:	2980018d 	st.w	$r13,$r12,0
1c0071cc:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0071d0:	28bc718c 	ld.w	$r12,$r12,-228(0xf1c)
1c0071d4:	2880018c 	ld.w	$r12,$r12,0
1c0071d8:	64001180 	bge	$r12,$r0,16(0x10) # 1c0071e8 <Game_Data+0x588>
1c0071dc:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0071e0:	28bc318c 	ld.w	$r12,$r12,-244(0xf0c)
1c0071e4:	29800180 	st.w	$r0,$r12,0
1c0071e8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0071ec:	28bc218c 	ld.w	$r12,$r12,-248(0xf08)
1c0071f0:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c0071f4:	2980018d 	st.w	$r13,$r12,0
1c0071f8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0071fc:	28bb418c 	ld.w	$r12,$r12,-304(0xed0)
1c007200:	2880018d 	ld.w	$r13,$r12,0
1c007204:	0281900c 	addi.w	$r12,$r0,100(0x64)
1c007208:	5c0019ac 	bne	$r13,$r12,24(0x18) # 1c007220 <Game_Data+0x5c0>
1c00720c:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007210:	28bd318c 	ld.w	$r12,$r12,-180(0xf4c)
1c007214:	2880018d 	ld.w	$r13,$r12,0
1c007218:	02800c0c 	addi.w	$r12,$r0,3(0x3)
1c00721c:	580045ac 	beq	$r13,$r12,68(0x44) # 1c007260 <Game_Data+0x600>
1c007220:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007224:	28b7a18c 	ld.w	$r12,$r12,-536(0xde8)
1c007228:	2880018c 	ld.w	$r12,$r12,0
1c00722c:	44003580 	bnez	$r12,52(0x34) # 1c007260 <Game_Data+0x600>
1c007230:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007234:	28b8118c 	ld.w	$r12,$r12,-508(0xe04)
1c007238:	2880018d 	ld.w	$r13,$r12,0
1c00723c:	02800c0c 	addi.w	$r12,$r0,3(0x3)
1c007240:	001c31ad 	mul.w	$r13,$r13,$r12
1c007244:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007248:	28ba118c 	ld.w	$r12,$r12,-380(0xe84)
1c00724c:	2880018c 	ld.w	$r12,$r12,0
1c007250:	001031ad 	add.w	$r13,$r13,$r12
1c007254:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007258:	28b9d18c 	ld.w	$r12,$r12,-396(0xe74)
1c00725c:	2980018d 	st.w	$r13,$r12,0
1c007260:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007264:	28b7a18c 	ld.w	$r12,$r12,-536(0xde8)
1c007268:	2880018d 	ld.w	$r13,$r12,0
1c00726c:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c007270:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c007280 <Game_Data+0x620>
1c007274:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007278:	28b7018c 	ld.w	$r12,$r12,-576(0xdc0)
1c00727c:	29800180 	st.w	$r0,$r12,0
1c007280:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007284:	28b8518c 	ld.w	$r12,$r12,-492(0xe14)
1c007288:	2880018d 	ld.w	$r13,$r12,0
1c00728c:	0281900c 	addi.w	$r12,$r0,100(0x64)
1c007290:	5c0019ac 	bne	$r13,$r12,24(0x18) # 1c0072a8 <Game_Data+0x648>
1c007294:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007298:	28b9a18c 	ld.w	$r12,$r12,-408(0xe68)
1c00729c:	2880018d 	ld.w	$r13,$r12,0
1c0072a0:	02800c0c 	addi.w	$r12,$r0,3(0x3)
1c0072a4:	580041ac 	beq	$r13,$r12,64(0x40) # 1c0072e4 <Game_Data+0x684>
1c0072a8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0072ac:	28b5918c 	ld.w	$r12,$r12,-668(0xd64)
1c0072b0:	2880018c 	ld.w	$r12,$r12,0
1c0072b4:	44003180 	bnez	$r12,48(0x30) # 1c0072e4 <Game_Data+0x684>
1c0072b8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0072bc:	28b5f18c 	ld.w	$r12,$r12,-644(0xd7c)
1c0072c0:	2880018c 	ld.w	$r12,$r12,0
1c0072c4:	0040898d 	slli.w	$r13,$r12,0x2
1c0072c8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0072cc:	28b7318c 	ld.w	$r12,$r12,-564(0xdcc)
1c0072d0:	2880018c 	ld.w	$r12,$r12,0
1c0072d4:	001031ad 	add.w	$r13,$r13,$r12
1c0072d8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0072dc:	28b6f18c 	ld.w	$r12,$r12,-580(0xdbc)
1c0072e0:	2980018d 	st.w	$r13,$r12,0
1c0072e4:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0072e8:	28b7b18c 	ld.w	$r12,$r12,-532(0xdec)
1c0072ec:	2880018d 	ld.w	$r13,$r12,0
1c0072f0:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0072f4:	5c0051ac 	bne	$r13,$r12,80(0x50) # 1c007344 <Game_Data+0x6e4>
1c0072f8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0072fc:	28b4418c 	ld.w	$r12,$r12,-752(0xd10)
1c007300:	2880018c 	ld.w	$r12,$r12,0
1c007304:	44004180 	bnez	$r12,64(0x40) # 1c007344 <Game_Data+0x6e4>
1c007308:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c00730c:	28b9418c 	ld.w	$r12,$r12,-432(0xe50)
1c007310:	2880018c 	ld.w	$r12,$r12,0
1c007314:	6400300c 	bge	$r0,$r12,48(0x30) # 1c007344 <Game_Data+0x6e4>
1c007318:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c00731c:	28b9018c 	ld.w	$r12,$r12,-448(0xe40)
1c007320:	2880018c 	ld.w	$r12,$r12,0
1c007324:	02bffd8d 	addi.w	$r13,$r12,-1(0xfff)
1c007328:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c00732c:	28b8c18c 	ld.w	$r12,$r12,-464(0xe30)
1c007330:	2980018d 	st.w	$r13,$r12,0
1c007334:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007338:	28b3518c 	ld.w	$r12,$r12,-812(0xcd4)
1c00733c:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c007340:	2980018d 	st.w	$r13,$r12,0
1c007344:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007348:	28b5418c 	ld.w	$r12,$r12,-688(0xd50)
1c00734c:	2880018d 	ld.w	$r13,$r12,0
1c007350:	02818c0c 	addi.w	$r12,$r0,99(0x63)
1c007354:	6400518d 	bge	$r12,$r13,80(0x50) # 1c0073a4 <Game_Data+0x744>
1c007358:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c00735c:	28b6918c 	ld.w	$r12,$r12,-604(0xda4)
1c007360:	2880018d 	ld.w	$r13,$r12,0
1c007364:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c007368:	60003d8d 	blt	$r12,$r13,60(0x3c) # 1c0073a4 <Game_Data+0x744>
1c00736c:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007370:	28b4a18c 	ld.w	$r12,$r12,-728(0xd28)
1c007374:	2880018c 	ld.w	$r12,$r12,0
1c007378:	02be718d 	addi.w	$r13,$r12,-100(0xf9c)
1c00737c:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007380:	28b4618c 	ld.w	$r12,$r12,-744(0xd18)
1c007384:	2980018d 	st.w	$r13,$r12,0
1c007388:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c00738c:	28b5d18c 	ld.w	$r12,$r12,-652(0xd74)
1c007390:	2880018c 	ld.w	$r12,$r12,0
1c007394:	0280058d 	addi.w	$r13,$r12,1(0x1)
1c007398:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c00739c:	28b5918c 	ld.w	$r12,$r12,-668(0xd64)
1c0073a0:	2980018d 	st.w	$r13,$r12,0
1c0073a4:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0073a8:	28b3c18c 	ld.w	$r12,$r12,-784(0xcf0)
1c0073ac:	2880018d 	ld.w	$r13,$r12,0
1c0073b0:	02818c0c 	addi.w	$r12,$r0,99(0x63)
1c0073b4:	6400398d 	bge	$r12,$r13,56(0x38) # 1c0073ec <Game_Data+0x78c>
1c0073b8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0073bc:	28b5118c 	ld.w	$r12,$r12,-700(0xd44)
1c0073c0:	2880018d 	ld.w	$r13,$r12,0
1c0073c4:	02800c0c 	addi.w	$r12,$r0,3(0x3)
1c0073c8:	5c0025ac 	bne	$r13,$r12,36(0x24) # 1c0073ec <Game_Data+0x78c>
1c0073cc:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0073d0:	28b3218c 	ld.w	$r12,$r12,-824(0xcc8)
1c0073d4:	0281900d 	addi.w	$r13,$r0,100(0x64)
1c0073d8:	2980018d 	st.w	$r13,$r12,0
1c0073dc:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0073e0:	28b4818c 	ld.w	$r12,$r12,-736(0xd20)
1c0073e4:	02800c0d 	addi.w	$r13,$r0,3(0x3)
1c0073e8:	2980018d 	st.w	$r13,$r12,0
1c0073ec:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0073f0:	28b3718c 	ld.w	$r12,$r12,-804(0xcdc)
1c0073f4:	2880018d 	ld.w	$r13,$r12,0
1c0073f8:	02818c0c 	addi.w	$r12,$r0,99(0x63)
1c0073fc:	6400518d 	bge	$r12,$r13,80(0x50) # 1c00744c <Game_Data+0x7ec>
1c007400:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007404:	28b5618c 	ld.w	$r12,$r12,-680(0xd58)
1c007408:	2880018d 	ld.w	$r13,$r12,0
1c00740c:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c007410:	60003d8d 	blt	$r12,$r13,60(0x3c) # 1c00744c <Game_Data+0x7ec>
1c007414:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007418:	28b2d18c 	ld.w	$r12,$r12,-844(0xcb4)
1c00741c:	2880018c 	ld.w	$r12,$r12,0
1c007420:	02be718d 	addi.w	$r13,$r12,-100(0xf9c)
1c007424:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007428:	28b2918c 	ld.w	$r12,$r12,-860(0xca4)
1c00742c:	2980018d 	st.w	$r13,$r12,0
1c007430:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007434:	28b4a18c 	ld.w	$r12,$r12,-728(0xd28)
1c007438:	2880018c 	ld.w	$r12,$r12,0
1c00743c:	0280058d 	addi.w	$r13,$r12,1(0x1)
1c007440:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007444:	28b4618c 	ld.w	$r12,$r12,-744(0xd18)
1c007448:	2980018d 	st.w	$r13,$r12,0
1c00744c:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007450:	28b1f18c 	ld.w	$r12,$r12,-900(0xc7c)
1c007454:	2880018d 	ld.w	$r13,$r12,0
1c007458:	02818c0c 	addi.w	$r12,$r0,99(0x63)
1c00745c:	6400398d 	bge	$r12,$r13,56(0x38) # 1c007494 <Game_Data+0x834>
1c007460:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007464:	28b3e18c 	ld.w	$r12,$r12,-776(0xcf8)
1c007468:	2880018d 	ld.w	$r13,$r12,0
1c00746c:	02800c0c 	addi.w	$r12,$r0,3(0x3)
1c007470:	5c0025ac 	bne	$r13,$r12,36(0x24) # 1c007494 <Game_Data+0x834>
1c007474:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007478:	28b1518c 	ld.w	$r12,$r12,-940(0xc54)
1c00747c:	0281900d 	addi.w	$r13,$r0,100(0x64)
1c007480:	2980018d 	st.w	$r13,$r12,0
1c007484:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007488:	28b3518c 	ld.w	$r12,$r12,-812(0xcd4)
1c00748c:	02800c0d 	addi.w	$r13,$r0,3(0x3)
1c007490:	2980018d 	st.w	$r13,$r12,0
1c007494:	03400000 	andi	$r0,$r0,0x0
1c007498:	28803076 	ld.w	$r22,$r3,12(0xc)
1c00749c:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0074a0:	4c000020 	jirl	$r0,$r1,0

1c0074a4 <Set_Data>:
Set_Data():
1c0074a4:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0074a8:	29803061 	st.w	$r1,$r3,12(0xc)
1c0074ac:	29802076 	st.w	$r22,$r3,8(0x8)
1c0074b0:	02804076 	addi.w	$r22,$r3,16(0x10)
1c0074b4:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0074b8:	28b2b18c 	ld.w	$r12,$r12,-852(0xcac)
1c0074bc:	2880018c 	ld.w	$r12,$r12,0
1c0074c0:	00150184 	move	$r4,$r12
1c0074c4:	57b617ff 	bl	-18924(0xfffb614) # 1c002ad8 <Set_Blood_1>
1c0074c8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0074cc:	28b0818c 	ld.w	$r12,$r12,-992(0xc20)
1c0074d0:	2880018c 	ld.w	$r12,$r12,0
1c0074d4:	00150184 	move	$r4,$r12
1c0074d8:	57b62fff 	bl	-18900(0xfffb62c) # 1c002b04 <Set_Blood_2>
1c0074dc:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0074e0:	28aee18c 	ld.w	$r12,$r12,-1096(0xbb8)
1c0074e4:	2880018c 	ld.w	$r12,$r12,0
1c0074e8:	00150184 	move	$r4,$r12
1c0074ec:	57b647ff 	bl	-18876(0xfffb644) # 1c002b30 <Set_Energy_1>
1c0074f0:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0074f4:	28af618c 	ld.w	$r12,$r12,-1064(0xbd8)
1c0074f8:	2880018c 	ld.w	$r12,$r12,0
1c0074fc:	00150184 	move	$r4,$r12
1c007500:	57b65fff 	bl	-18852(0xfffb65c) # 1c002b5c <Set_Energy_2>
1c007504:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007508:	28afe18c 	ld.w	$r12,$r12,-1032(0xbf8)
1c00750c:	2880018c 	ld.w	$r12,$r12,0
1c007510:	00150184 	move	$r4,$r12
1c007514:	57b677ff 	bl	-18828(0xfffb674) # 1c002b88 <Set_Energy_count_1>
1c007518:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c00751c:	28b1018c 	ld.w	$r12,$r12,-960(0xc40)
1c007520:	2880018c 	ld.w	$r12,$r12,0
1c007524:	00150184 	move	$r4,$r12
1c007528:	57b68fff 	bl	-18804(0xfffb68c) # 1c002bb4 <Set_Energy_count_2>
1c00752c:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007530:	28aca18c 	ld.w	$r12,$r12,-1240(0xb28)
1c007534:	2880018c 	ld.w	$r12,$r12,0
1c007538:	00150184 	move	$r4,$r12
1c00753c:	57b6a7ff 	bl	-18780(0xfffb6a4) # 1c002be0 <Set_Player1_x>
1c007540:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007544:	28aee18c 	ld.w	$r12,$r12,-1096(0xbb8)
1c007548:	2880018c 	ld.w	$r12,$r12,0
1c00754c:	00150184 	move	$r4,$r12
1c007550:	57b6bfff 	bl	-18756(0xfffb6bc) # 1c002c0c <Set_Player1_y>
1c007554:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007558:	28af718c 	ld.w	$r12,$r12,-1060(0xbdc)
1c00755c:	2880018c 	ld.w	$r12,$r12,0
1c007560:	00150184 	move	$r4,$r12
1c007564:	57b6d7ff 	bl	-18732(0xfffb6d4) # 1c002c38 <Set_Prop1_y>
1c007568:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c00756c:	28acd18c 	ld.w	$r12,$r12,-1228(0xb34)
1c007570:	2880018c 	ld.w	$r12,$r12,0
1c007574:	00150184 	move	$r4,$r12
1c007578:	57b6efff 	bl	-18708(0xfffb6ec) # 1c002c64 <Set_Player2_x>
1c00757c:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007580:	28aef18c 	ld.w	$r12,$r12,-1092(0xbbc)
1c007584:	2880018c 	ld.w	$r12,$r12,0
1c007588:	00150184 	move	$r4,$r12
1c00758c:	57b707ff 	bl	-18684(0xfffb704) # 1c002c90 <Set_Player2_y>
1c007590:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c007594:	28ae118c 	ld.w	$r12,$r12,-1148(0xb84)
1c007598:	2880018c 	ld.w	$r12,$r12,0
1c00759c:	00150184 	move	$r4,$r12
1c0075a0:	57b71fff 	bl	-18660(0xfffb71c) # 1c002cbc <Set_Prop2_x>
1c0075a4:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0075a8:	28ac518c 	ld.w	$r12,$r12,-1260(0xb14)
1c0075ac:	2880018c 	ld.w	$r12,$r12,0
1c0075b0:	00150184 	move	$r4,$r12
1c0075b4:	57b737ff 	bl	-18636(0xfffb734) # 1c002ce8 <Set_Prop2_y>
1c0075b8:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0075bc:	28a9b18c 	ld.w	$r12,$r12,-1428(0xa6c)
1c0075c0:	2880018c 	ld.w	$r12,$r12,0
1c0075c4:	00150184 	move	$r4,$r12
1c0075c8:	57b74fff 	bl	-18612(0xfffb74c) # 1c002d14 <Set_Player1_direction>
1c0075cc:	1cc7ff4c 	pcaddu12i	$r12,409594(0x63ffa)
1c0075d0:	28aa518c 	ld.w	$r12,$r12,-1388(0xa94)
1c0075d4:	2880018c 	ld.w	$r12,$r12,0
1c0075d8:	00150184 	move	$r4,$r12
1c0075dc:	57b767ff 	bl	-18588(0xfffb764) # 1c002d40 <Set_Player2_direction>
1c0075e0:	03400000 	andi	$r0,$r0,0x0
1c0075e4:	28803061 	ld.w	$r1,$r3,12(0xc)
1c0075e8:	28802076 	ld.w	$r22,$r3,8(0x8)
1c0075ec:	02804063 	addi.w	$r3,$r3,16(0x10)
1c0075f0:	4c000020 	jirl	$r0,$r1,0

1c0075f4 <do_nothing>:
do_nothing():
1c0075f4:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c0075f8:	29803076 	st.w	$r22,$r3,12(0xc)
1c0075fc:	02804076 	addi.w	$r22,$r3,16(0x10)
1c007600:	0015000c 	move	$r12,$r0
1c007604:	00150184 	move	$r4,$r12
1c007608:	28803076 	ld.w	$r22,$r3,12(0xc)
1c00760c:	02804063 	addi.w	$r3,$r3,16(0x10)
1c007610:	4c000020 	jirl	$r0,$r1,0

1c007614 <do_d1>:
do_d1():
1c007614:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c007618:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c00761c:	2980a076 	st.w	$r22,$r3,40(0x28)
1c007620:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c007624:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c007628:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c00762c:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c007630:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c007634:	6400118d 	bge	$r12,$r13,16(0x10) # 1c007644 <do_d1+0x30>
1c007638:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c00763c:	02800c0c 	addi.w	$r12,$r0,3(0x3)
1c007640:	6400198d 	bge	$r12,$r13,24(0x18) # 1c007658 <do_d1+0x44>
1c007644:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007648:	028d1084 	addi.w	$r4,$r4,836(0x344)
1c00764c:	57a583ff 	bl	-23168(0xfffa580) # 1c001bcc <myprintf>
1c007650:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c007654:	5000c000 	b	192(0xc0) # 1c007714 <do_d1+0x100>
1c007658:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c00765c:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c007660:	2880018c 	ld.w	$r12,$r12,0
1c007664:	00150184 	move	$r4,$r12
1c007668:	5402fc00 	bl	764(0x2fc) # 1c007964 <str2num>
1c00766c:	29bf92c4 	st.w	$r4,$r22,-28(0xfe4)
1c007670:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c007674:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c007678:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c007688 <do_d1+0x74>
1c00767c:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c007680:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c007684:	50002000 	b	32(0x20) # 1c0076a4 <do_d1+0x90>
1c007688:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c00768c:	0280218c 	addi.w	$r12,$r12,8(0x8)
1c007690:	2880018c 	ld.w	$r12,$r12,0
1c007694:	00150184 	move	$r4,$r12
1c007698:	5402cc00 	bl	716(0x2cc) # 1c007964 <str2num>
1c00769c:	0015008c 	move	$r12,$r4
1c0076a0:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0076a4:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c0076a8:	50005c00 	b	92(0x5c) # 1c007704 <do_d1+0xf0>
1c0076ac:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0076b0:	03401d8c 	andi	$r12,$r12,0x7
1c0076b4:	44002180 	bnez	$r12,32(0x20) # 1c0076d4 <do_d1+0xc0>
1c0076b8:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c0076bc:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c0076c0:	001031ac 	add.w	$r12,$r13,$r12
1c0076c4:	00150185 	move	$r5,$r12
1c0076c8:	1c000084 	pcaddu12i	$r4,4(0x4)
1c0076cc:	028b8084 	addi.w	$r4,$r4,736(0x2e0)
1c0076d0:	57a4ffff 	bl	-23300(0xfffa4fc) # 1c001bcc <myprintf>
1c0076d4:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c0076d8:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c0076dc:	001031ac 	add.w	$r12,$r13,$r12
1c0076e0:	2a00018c 	ld.bu	$r12,$r12,0
1c0076e4:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0076e8:	00150185 	move	$r5,$r12
1c0076ec:	1c000084 	pcaddu12i	$r4,4(0x4)
1c0076f0:	028b2084 	addi.w	$r4,$r4,712(0x2c8)
1c0076f4:	57a4dbff 	bl	-23336(0xfffa4d8) # 1c001bcc <myprintf>
1c0076f8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0076fc:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c007700:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c007704:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c007708:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c00770c:	63ffa1ac 	blt	$r13,$r12,-96(0x3ffa0) # 1c0076ac <do_d1+0x98>
1c007710:	0015000c 	move	$r12,$r0
1c007714:	00150184 	move	$r4,$r12
1c007718:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c00771c:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c007720:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c007724:	4c000020 	jirl	$r0,$r1,0

1c007728 <do_d4>:
do_d4():
1c007728:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c00772c:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c007730:	2980a076 	st.w	$r22,$r3,40(0x28)
1c007734:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c007738:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c00773c:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c007740:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c007744:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c007748:	6400118d 	bge	$r12,$r13,16(0x10) # 1c007758 <do_d4+0x30>
1c00774c:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c007750:	02800c0c 	addi.w	$r12,$r0,3(0x3)
1c007754:	6400198d 	bge	$r12,$r13,24(0x18) # 1c00776c <do_d4+0x44>
1c007758:	1c000084 	pcaddu12i	$r4,4(0x4)
1c00775c:	02899084 	addi.w	$r4,$r4,612(0x264)
1c007760:	57a46fff 	bl	-23444(0xfffa46c) # 1c001bcc <myprintf>
1c007764:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c007768:	5000cc00 	b	204(0xcc) # 1c007834 <do_d4+0x10c>
1c00776c:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c007770:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c007774:	2880018c 	ld.w	$r12,$r12,0
1c007778:	00150184 	move	$r4,$r12
1c00777c:	5401e800 	bl	488(0x1e8) # 1c007964 <str2num>
1c007780:	29bf92c4 	st.w	$r4,$r22,-28(0xfe4)
1c007784:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c007788:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c00778c:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c00779c <do_d4+0x74>
1c007790:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c007794:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c007798:	50002000 	b	32(0x20) # 1c0077b8 <do_d4+0x90>
1c00779c:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c0077a0:	0280218c 	addi.w	$r12,$r12,8(0x8)
1c0077a4:	2880018c 	ld.w	$r12,$r12,0
1c0077a8:	00150184 	move	$r4,$r12
1c0077ac:	5401b800 	bl	440(0x1b8) # 1c007964 <str2num>
1c0077b0:	0015008c 	move	$r12,$r4
1c0077b4:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0077b8:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c0077bc:	50006800 	b	104(0x68) # 1c007824 <do_d4+0xfc>
1c0077c0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0077c4:	03400d8c 	andi	$r12,$r12,0x3
1c0077c8:	44002980 	bnez	$r12,40(0x28) # 1c0077f0 <do_d4+0xc8>
1c0077cc:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0077d0:	0040898c 	slli.w	$r12,$r12,0x2
1c0077d4:	0015018d 	move	$r13,$r12
1c0077d8:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c0077dc:	001031ac 	add.w	$r12,$r13,$r12
1c0077e0:	00150185 	move	$r5,$r12
1c0077e4:	1c000084 	pcaddu12i	$r4,4(0x4)
1c0077e8:	0287d084 	addi.w	$r4,$r4,500(0x1f4)
1c0077ec:	57a3e3ff 	bl	-23584(0xfffa3e0) # 1c001bcc <myprintf>
1c0077f0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0077f4:	0040898c 	slli.w	$r12,$r12,0x2
1c0077f8:	0015018d 	move	$r13,$r12
1c0077fc:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c007800:	001031ac 	add.w	$r12,$r13,$r12
1c007804:	2880018c 	ld.w	$r12,$r12,0
1c007808:	00150185 	move	$r5,$r12
1c00780c:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007810:	02876084 	addi.w	$r4,$r4,472(0x1d8)
1c007814:	57a3bbff 	bl	-23624(0xfffa3b8) # 1c001bcc <myprintf>
1c007818:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00781c:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c007820:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c007824:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c007828:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c00782c:	63ff95ac 	blt	$r13,$r12,-108(0x3ff94) # 1c0077c0 <do_d4+0x98>
1c007830:	0015000c 	move	$r12,$r0
1c007834:	00150184 	move	$r4,$r12
1c007838:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c00783c:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c007840:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c007844:	4c000020 	jirl	$r0,$r1,0

1c007848 <do_m1>:
do_m1():
1c007848:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c00784c:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c007850:	2980a076 	st.w	$r22,$r3,40(0x28)
1c007854:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c007858:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c00785c:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c007860:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c007864:	02800c0c 	addi.w	$r12,$r0,3(0x3)
1c007868:	580019ac 	beq	$r13,$r12,24(0x18) # 1c007880 <do_m1+0x38>
1c00786c:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007870:	02860084 	addi.w	$r4,$r4,384(0x180)
1c007874:	57a35bff 	bl	-23720(0xfffa358) # 1c001bcc <myprintf>
1c007878:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c00787c:	50004800 	b	72(0x48) # 1c0078c4 <do_m1+0x7c>
1c007880:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c007884:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c007888:	2880018c 	ld.w	$r12,$r12,0
1c00788c:	00150184 	move	$r4,$r12
1c007890:	5400d400 	bl	212(0xd4) # 1c007964 <str2num>
1c007894:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c007898:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c00789c:	0280218c 	addi.w	$r12,$r12,8(0x8)
1c0078a0:	2880018c 	ld.w	$r12,$r12,0
1c0078a4:	00150184 	move	$r4,$r12
1c0078a8:	5400bc00 	bl	188(0xbc) # 1c007964 <str2num>
1c0078ac:	0015008c 	move	$r12,$r4
1c0078b0:	293faecc 	st.b	$r12,$r22,-21(0xfeb)
1c0078b4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0078b8:	2a3faecd 	ld.bu	$r13,$r22,-21(0xfeb)
1c0078bc:	2900018d 	st.b	$r13,$r12,0
1c0078c0:	0015000c 	move	$r12,$r0
1c0078c4:	00150184 	move	$r4,$r12
1c0078c8:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c0078cc:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c0078d0:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c0078d4:	4c000020 	jirl	$r0,$r1,0

1c0078d8 <do_m4>:
do_m4():
1c0078d8:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c0078dc:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c0078e0:	2980a076 	st.w	$r22,$r3,40(0x28)
1c0078e4:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c0078e8:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c0078ec:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c0078f0:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c0078f4:	02800c0c 	addi.w	$r12,$r0,3(0x3)
1c0078f8:	580019ac 	beq	$r13,$r12,24(0x18) # 1c007910 <do_m4+0x38>
1c0078fc:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007900:	02844084 	addi.w	$r4,$r4,272(0x110)
1c007904:	57a2cbff 	bl	-23864(0xfffa2c8) # 1c001bcc <myprintf>
1c007908:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c00790c:	50004400 	b	68(0x44) # 1c007950 <do_m4+0x78>
1c007910:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c007914:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c007918:	2880018c 	ld.w	$r12,$r12,0
1c00791c:	00150184 	move	$r4,$r12
1c007920:	54004400 	bl	68(0x44) # 1c007964 <str2num>
1c007924:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c007928:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c00792c:	0280218c 	addi.w	$r12,$r12,8(0x8)
1c007930:	2880018c 	ld.w	$r12,$r12,0
1c007934:	00150184 	move	$r4,$r12
1c007938:	54002c00 	bl	44(0x2c) # 1c007964 <str2num>
1c00793c:	29bfa2c4 	st.w	$r4,$r22,-24(0xfe8)
1c007940:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c007944:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c007948:	2980018d 	st.w	$r13,$r12,0
1c00794c:	0015000c 	move	$r12,$r0
1c007950:	00150184 	move	$r4,$r12
1c007954:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c007958:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c00795c:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c007960:	4c000020 	jirl	$r0,$r1,0

1c007964 <str2num>:
str2num():
1c007964:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c007968:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c00796c:	2980a076 	st.w	$r22,$r3,40(0x28)
1c007970:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c007974:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c007978:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c00797c:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c007980:	2a00018d 	ld.bu	$r13,$r12,0
1c007984:	0280c00c 	addi.w	$r12,$r0,48(0x30)
1c007988:	5c0041ac 	bne	$r13,$r12,64(0x40) # 1c0079c8 <str2num+0x64>
1c00798c:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c007990:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c007994:	2a00018d 	ld.bu	$r13,$r12,0
1c007998:	0281e00c 	addi.w	$r12,$r0,120(0x78)
1c00799c:	580019ac 	beq	$r13,$r12,24(0x18) # 1c0079b4 <str2num+0x50>
1c0079a0:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0079a4:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0079a8:	2a00018d 	ld.bu	$r13,$r12,0
1c0079ac:	0281600c 	addi.w	$r12,$r0,88(0x58)
1c0079b0:	5c0019ac 	bne	$r13,$r12,24(0x18) # 1c0079c8 <str2num+0x64>
1c0079b4:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c0079b8:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c0079bc:	0280400c 	addi.w	$r12,$r0,16(0x10)
1c0079c0:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0079c4:	50003400 	b	52(0x34) # 1c0079f8 <str2num+0x94>
1c0079c8:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0079cc:	2a00018d 	ld.bu	$r13,$r12,0
1c0079d0:	0280c00c 	addi.w	$r12,$r0,48(0x30)
1c0079d4:	5c0019ac 	bne	$r13,$r12,24(0x18) # 1c0079ec <str2num+0x88>
1c0079d8:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0079dc:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c0079e0:	0280200c 	addi.w	$r12,$r0,8(0x8)
1c0079e4:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0079e8:	50016400 	b	356(0x164) # 1c007b4c <str2num+0x1e8>
1c0079ec:	29bf92c0 	st.w	$r0,$r22,-28(0xfe4)
1c0079f0:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c0079f4:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0079f8:	50015400 	b	340(0x154) # 1c007b4c <str2num+0x1e8>
1c0079fc:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c007a00:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c007a04:	001031ac 	add.w	$r12,$r13,$r12
1c007a08:	2a00018c 	ld.bu	$r12,$r12,0
1c007a0c:	29bf82cc 	st.w	$r12,$r22,-32(0xfe0)
1c007a10:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c007a14:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c007a18:	5800ddac 	beq	$r13,$r12,220(0xdc) # 1c007af4 <str2num+0x190>
1c007a1c:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c007a20:	0280400c 	addi.w	$r12,$r0,16(0x10)
1c007a24:	580015ac 	beq	$r13,$r12,20(0x14) # 1c007a38 <str2num+0xd4>
1c007a28:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c007a2c:	0280200c 	addi.w	$r12,$r0,8(0x8)
1c007a30:	5800c5ac 	beq	$r13,$r12,196(0xc4) # 1c007af4 <str2num+0x190>
1c007a34:	50010c00 	b	268(0x10c) # 1c007b40 <str2num+0x1dc>
1c007a38:	28bf82cd 	ld.w	$r13,$r22,-32(0xfe0)
1c007a3c:	0280bc0c 	addi.w	$r12,$r0,47(0x2f)
1c007a40:	6c00318d 	bgeu	$r12,$r13,48(0x30) # 1c007a70 <str2num+0x10c>
1c007a44:	28bf82cd 	ld.w	$r13,$r22,-32(0xfe0)
1c007a48:	0280e40c 	addi.w	$r12,$r0,57(0x39)
1c007a4c:	6800258d 	bltu	$r12,$r13,36(0x24) # 1c007a70 <str2num+0x10c>
1c007a50:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c007a54:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c007a58:	001c31ad 	mul.w	$r13,$r13,$r12
1c007a5c:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c007a60:	001031ac 	add.w	$r12,$r13,$r12
1c007a64:	02bf418c 	addi.w	$r12,$r12,-48(0xfd0)
1c007a68:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c007a6c:	50008400 	b	132(0x84) # 1c007af0 <str2num+0x18c>
1c007a70:	28bf82cd 	ld.w	$r13,$r22,-32(0xfe0)
1c007a74:	0281800c 	addi.w	$r12,$r0,96(0x60)
1c007a78:	6c00318d 	bgeu	$r12,$r13,48(0x30) # 1c007aa8 <str2num+0x144>
1c007a7c:	28bf82cd 	ld.w	$r13,$r22,-32(0xfe0)
1c007a80:	0281980c 	addi.w	$r12,$r0,102(0x66)
1c007a84:	6800258d 	bltu	$r12,$r13,36(0x24) # 1c007aa8 <str2num+0x144>
1c007a88:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c007a8c:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c007a90:	001c31ad 	mul.w	$r13,$r13,$r12
1c007a94:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c007a98:	001031ac 	add.w	$r12,$r13,$r12
1c007a9c:	02bea58c 	addi.w	$r12,$r12,-87(0xfa9)
1c007aa0:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c007aa4:	50004c00 	b	76(0x4c) # 1c007af0 <str2num+0x18c>
1c007aa8:	28bf82cd 	ld.w	$r13,$r22,-32(0xfe0)
1c007aac:	0281000c 	addi.w	$r12,$r0,64(0x40)
1c007ab0:	6c00318d 	bgeu	$r12,$r13,48(0x30) # 1c007ae0 <str2num+0x17c>
1c007ab4:	28bf82cd 	ld.w	$r13,$r22,-32(0xfe0)
1c007ab8:	0281180c 	addi.w	$r12,$r0,70(0x46)
1c007abc:	6800258d 	bltu	$r12,$r13,36(0x24) # 1c007ae0 <str2num+0x17c>
1c007ac0:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c007ac4:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c007ac8:	001c31ad 	mul.w	$r13,$r13,$r12
1c007acc:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c007ad0:	001031ac 	add.w	$r12,$r13,$r12
1c007ad4:	02bf258c 	addi.w	$r12,$r12,-55(0xfc9)
1c007ad8:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c007adc:	50001400 	b	20(0x14) # 1c007af0 <str2num+0x18c>
1c007ae0:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007ae4:	02bd3084 	addi.w	$r4,$r4,-180(0xf4c)
1c007ae8:	57a0e7ff 	bl	-24348(0xfffa0e4) # 1c001bcc <myprintf>
1c007aec:	50005400 	b	84(0x54) # 1c007b40 <str2num+0x1dc>
1c007af0:	50005000 	b	80(0x50) # 1c007b40 <str2num+0x1dc>
1c007af4:	28bf82cd 	ld.w	$r13,$r22,-32(0xfe0)
1c007af8:	0280bc0c 	addi.w	$r12,$r0,47(0x2f)
1c007afc:	6c00358d 	bgeu	$r12,$r13,52(0x34) # 1c007b30 <str2num+0x1cc>
1c007b00:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c007b04:	0280c18c 	addi.w	$r12,$r12,48(0x30)
1c007b08:	28bf82cd 	ld.w	$r13,$r22,-32(0xfe0)
1c007b0c:	6c0025ac 	bgeu	$r13,$r12,36(0x24) # 1c007b30 <str2num+0x1cc>
1c007b10:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c007b14:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c007b18:	001c31ad 	mul.w	$r13,$r13,$r12
1c007b1c:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c007b20:	001031ac 	add.w	$r12,$r13,$r12
1c007b24:	02bf418c 	addi.w	$r12,$r12,-48(0xfd0)
1c007b28:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c007b2c:	50001000 	b	16(0x10) # 1c007b3c <str2num+0x1d8>
1c007b30:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007b34:	02bc5084 	addi.w	$r4,$r4,-236(0xf14)
1c007b38:	57a097ff 	bl	-24428(0xfffa094) # 1c001bcc <myprintf>
1c007b3c:	03400000 	andi	$r0,$r0,0x0
1c007b40:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c007b44:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c007b48:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c007b4c:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c007b50:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c007b54:	001031ac 	add.w	$r12,$r13,$r12
1c007b58:	2a00018c 	ld.bu	$r12,$r12,0
1c007b5c:	47fea19f 	bnez	$r12,-352(0x7ffea0) # 1c0079fc <str2num+0x98>
1c007b60:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c007b64:	00150184 	move	$r4,$r12
1c007b68:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c007b6c:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c007b70:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c007b74:	4c000020 	jirl	$r0,$r1,0

1c007b78 <v_play>:
v_play():
1c007b78:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c007b7c:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c007b80:	2980a076 	st.w	$r22,$r3,40(0x28)
1c007b84:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c007b88:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c007b8c:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c007b90:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c007b94:	02800c0c 	addi.w	$r12,$r0,3(0x3)
1c007b98:	580019ac 	beq	$r13,$r12,24(0x18) # 1c007bb0 <v_play+0x38>
1c007b9c:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007ba0:	02baf084 	addi.w	$r4,$r4,-324(0xebc)
1c007ba4:	57a02bff 	bl	-24536(0xfffa028) # 1c001bcc <myprintf>
1c007ba8:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c007bac:	50006400 	b	100(0x64) # 1c007c10 <v_play+0x98>
1c007bb0:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c007bb4:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c007bb8:	2880018c 	ld.w	$r12,$r12,0
1c007bbc:	00150184 	move	$r4,$r12
1c007bc0:	57fda7ff 	bl	-604(0xffffda4) # 1c007964 <str2num>
1c007bc4:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c007bc8:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c007bcc:	0280218c 	addi.w	$r12,$r12,8(0x8)
1c007bd0:	2880018c 	ld.w	$r12,$r12,0
1c007bd4:	00150184 	move	$r4,$r12
1c007bd8:	57fd8fff 	bl	-628(0xffffd8c) # 1c007964 <str2num>
1c007bdc:	29bfa2c4 	st.w	$r4,$r22,-24(0xfe8)
1c007be0:	57cb4bff 	bl	-13496(0xfffcb48) # 1c004728 <dma_reset>
1c007be4:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007be8:	02ba4084 	addi.w	$r4,$r4,-368(0xe90)
1c007bec:	579fe3ff 	bl	-24608(0xfff9fe0) # 1c001bcc <myprintf>
1c007bf0:	02800406 	addi.w	$r6,$r0,1(0x1)
1c007bf4:	28bfa2c5 	ld.w	$r5,$r22,-24(0xfe8)
1c007bf8:	28bfb2c4 	ld.w	$r4,$r22,-20(0xfec)
1c007bfc:	57cb8bff 	bl	-13432(0xfffcb88) # 1c004784 <dma_start>
1c007c00:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007c04:	02ba4084 	addi.w	$r4,$r4,-368(0xe90)
1c007c08:	579fc7ff 	bl	-24636(0xfff9fc4) # 1c001bcc <myprintf>
1c007c0c:	0015000c 	move	$r12,$r0
1c007c10:	00150184 	move	$r4,$r12
1c007c14:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c007c18:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c007c1c:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c007c20:	4c000020 	jirl	$r0,$r1,0

1c007c24 <touch_reg_show>:
touch_reg_show():
1c007c24:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c007c28:	29807061 	st.w	$r1,$r3,28(0x1c)
1c007c2c:	29806076 	st.w	$r22,$r3,24(0x18)
1c007c30:	02808076 	addi.w	$r22,$r3,32(0x20)
1c007c34:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007c38:	02b9d084 	addi.w	$r4,$r4,-396(0xe74)
1c007c3c:	579f93ff 	bl	-24688(0xfff9f90) # 1c001bcc <myprintf>
1c007c40:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c007c44:	2880018c 	ld.w	$r12,$r12,0
1c007c48:	00150185 	move	$r5,$r12
1c007c4c:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007c50:	02b9a084 	addi.w	$r4,$r4,-408(0xe68)
1c007c54:	579f7bff 	bl	-24712(0xfff9f78) # 1c001bcc <myprintf>
1c007c58:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c007c5c:	0380218c 	ori	$r12,$r12,0x8
1c007c60:	2880018c 	ld.w	$r12,$r12,0
1c007c64:	00150185 	move	$r5,$r12
1c007c68:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007c6c:	02b98084 	addi.w	$r4,$r4,-416(0xe60)
1c007c70:	579f5fff 	bl	-24740(0xfff9f5c) # 1c001bcc <myprintf>
1c007c74:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c007c78:	0380318c 	ori	$r12,$r12,0xc
1c007c7c:	2880018c 	ld.w	$r12,$r12,0
1c007c80:	00150185 	move	$r5,$r12
1c007c84:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007c88:	02b96084 	addi.w	$r4,$r4,-424(0xe58)
1c007c8c:	579f43ff 	bl	-24768(0xfff9f40) # 1c001bcc <myprintf>
1c007c90:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007c94:	02b98084 	addi.w	$r4,$r4,-416(0xe60)
1c007c98:	579f37ff 	bl	-24780(0xfff9f34) # 1c001bcc <myprintf>
1c007c9c:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c007ca0:	50006000 	b	96(0x60) # 1c007d00 <touch_reg_show+0xdc>
1c007ca4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c007ca8:	0040898c 	slli.w	$r12,$r12,0x2
1c007cac:	0015018d 	move	$r13,$r12
1c007cb0:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c007cb4:	0381018c 	ori	$r12,$r12,0x40
1c007cb8:	001031ac 	add.w	$r12,$r13,$r12
1c007cbc:	2880018d 	ld.w	$r13,$r12,0
1c007cc0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c007cc4:	0040898c 	slli.w	$r12,$r12,0x2
1c007cc8:	0015018e 	move	$r14,$r12
1c007ccc:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c007cd0:	0382018c 	ori	$r12,$r12,0x80
1c007cd4:	001031cc 	add.w	$r12,$r14,$r12
1c007cd8:	2880018c 	ld.w	$r12,$r12,0
1c007cdc:	00150187 	move	$r7,$r12
1c007ce0:	001501a6 	move	$r6,$r13
1c007ce4:	28bfb2c5 	ld.w	$r5,$r22,-20(0xfec)
1c007ce8:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007cec:	02b8a084 	addi.w	$r4,$r4,-472(0xe28)
1c007cf0:	579edfff 	bl	-24868(0xfff9edc) # 1c001bcc <myprintf>
1c007cf4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c007cf8:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c007cfc:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c007d00:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c007d04:	02802c0c 	addi.w	$r12,$r0,11(0xb)
1c007d08:	67ff9d8d 	bge	$r12,$r13,-100(0x3ff9c) # 1c007ca4 <touch_reg_show+0x80>
1c007d0c:	0015000c 	move	$r12,$r0
1c007d10:	00150184 	move	$r4,$r12
1c007d14:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c007d18:	28806076 	ld.w	$r22,$r3,24(0x18)
1c007d1c:	02808063 	addi.w	$r3,$r3,32(0x20)
1c007d20:	4c000020 	jirl	$r0,$r1,0

1c007d24 <touch_value_show>:
touch_value_show():
1c007d24:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c007d28:	29807061 	st.w	$r1,$r3,28(0x1c)
1c007d2c:	29806076 	st.w	$r22,$r3,24(0x18)
1c007d30:	02808076 	addi.w	$r22,$r3,32(0x20)
1c007d34:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007d38:	02b7d084 	addi.w	$r4,$r4,-524(0xdf4)
1c007d3c:	579e93ff 	bl	-24944(0xfff9e90) # 1c001bcc <myprintf>
1c007d40:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007d44:	02b8c084 	addi.w	$r4,$r4,-464(0xe30)
1c007d48:	579e87ff 	bl	-24956(0xfff9e84) # 1c001bcc <myprintf>
1c007d4c:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c007d50:	50003400 	b	52(0x34) # 1c007d84 <touch_value_show+0x60>
1c007d54:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c007d58:	006f818c 	bstrpick.w	$r12,$r12,0xf,0x0
1c007d5c:	00150184 	move	$r4,$r12
1c007d60:	57cd1fff 	bl	-13028(0xfffcd1c) # 1c004a7c <TOUCH_GetBaseVal>
1c007d64:	0015008c 	move	$r12,$r4
1c007d68:	00150185 	move	$r5,$r12
1c007d6c:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007d70:	02b83084 	addi.w	$r4,$r4,-500(0xe0c)
1c007d74:	579e5bff 	bl	-25000(0xfff9e58) # 1c001bcc <myprintf>
1c007d78:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c007d7c:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c007d80:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c007d84:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c007d88:	02802c0c 	addi.w	$r12,$r0,11(0xb)
1c007d8c:	67ffc98d 	bge	$r12,$r13,-56(0x3ffc8) # 1c007d54 <touch_value_show+0x30>
1c007d90:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007d94:	02b7c084 	addi.w	$r4,$r4,-528(0xdf0)
1c007d98:	579e37ff 	bl	-25036(0xfff9e34) # 1c001bcc <myprintf>
1c007d9c:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c007da0:	50003400 	b	52(0x34) # 1c007dd4 <touch_value_show+0xb0>
1c007da4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c007da8:	006f818c 	bstrpick.w	$r12,$r12,0xf,0x0
1c007dac:	00150184 	move	$r4,$r12
1c007db0:	57cd1bff 	bl	-13032(0xfffcd18) # 1c004ac8 <TOUCH_GetCountValue>
1c007db4:	0015008c 	move	$r12,$r4
1c007db8:	00150185 	move	$r5,$r12
1c007dbc:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007dc0:	02b6f084 	addi.w	$r4,$r4,-580(0xdbc)
1c007dc4:	579e0bff 	bl	-25080(0xfff9e08) # 1c001bcc <myprintf>
1c007dc8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c007dcc:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c007dd0:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c007dd4:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c007dd8:	02802c0c 	addi.w	$r12,$r0,11(0xb)
1c007ddc:	67ffc98d 	bge	$r12,$r13,-56(0x3ffc8) # 1c007da4 <touch_value_show+0x80>
1c007de0:	0015000c 	move	$r12,$r0
1c007de4:	00150184 	move	$r4,$r12
1c007de8:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c007dec:	28806076 	ld.w	$r22,$r3,24(0x18)
1c007df0:	02808063 	addi.w	$r3,$r3,32(0x20)
1c007df4:	4c000020 	jirl	$r0,$r1,0

1c007df8 <touch_test>:
touch_test():
1c007df8:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c007dfc:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c007e00:	2980a076 	st.w	$r22,$r3,40(0x28)
1c007e04:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c007e08:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c007e0c:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c007e10:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c007e14:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c007e18:	2880018c 	ld.w	$r12,$r12,0
1c007e1c:	00150185 	move	$r5,$r12
1c007e20:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007e24:	02b5a084 	addi.w	$r4,$r4,-664(0xd68)
1c007e28:	57ac2fff 	bl	-21460(0xfffac2c) # 1c002a54 <strcmp>
1c007e2c:	0015008c 	move	$r12,$r4
1c007e30:	44005d80 	bnez	$r12,92(0x5c) # 1c007e8c <touch_test+0x94>
1c007e34:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c007e38:	02800c0c 	addi.w	$r12,$r0,3(0x3)
1c007e3c:	580019ac 	beq	$r13,$r12,24(0x18) # 1c007e54 <touch_test+0x5c>
1c007e40:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007e44:	02b54084 	addi.w	$r4,$r4,-688(0xd50)
1c007e48:	579d87ff 	bl	-25212(0xfff9d84) # 1c001bcc <myprintf>
1c007e4c:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c007e50:	50024800 	b	584(0x248) # 1c008098 <touch_test+0x2a0>
1c007e54:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007e58:	02b55084 	addi.w	$r4,$r4,-684(0xd54)
1c007e5c:	579d73ff 	bl	-25232(0xfff9d70) # 1c001bcc <myprintf>
1c007e60:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c007e64:	0280218c 	addi.w	$r12,$r12,8(0x8)
1c007e68:	2880018c 	ld.w	$r12,$r12,0
1c007e6c:	00150184 	move	$r4,$r12
1c007e70:	57faf7ff 	bl	-1292(0xffffaf4) # 1c007964 <str2num>
1c007e74:	0015008c 	move	$r12,$r4
1c007e78:	293fbacc 	st.b	$r12,$r22,-18(0xfee)
1c007e7c:	2a3fbacc 	ld.bu	$r12,$r22,-18(0xfee)
1c007e80:	00150184 	move	$r4,$r12
1c007e84:	57ce4fff 	bl	-12724(0xfffce4c) # 1c004cd0 <TOUCH_Init>
1c007e88:	50020c00 	b	524(0x20c) # 1c008094 <touch_test+0x29c>
1c007e8c:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c007e90:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c007e94:	2880018c 	ld.w	$r12,$r12,0
1c007e98:	00150185 	move	$r5,$r12
1c007e9c:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007ea0:	02b47084 	addi.w	$r4,$r4,-740(0xd1c)
1c007ea4:	57abb3ff 	bl	-21584(0xfffabb0) # 1c002a54 <strcmp>
1c007ea8:	0015008c 	move	$r12,$r4
1c007eac:	0240058c 	sltui	$r12,$r12,1(0x1)
1c007eb0:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c007eb4:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c007eb8:	03c0098c 	xori	$r12,$r12,0x2
1c007ebc:	0240058c 	sltui	$r12,$r12,1(0x1)
1c007ec0:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c007ec4:	0014b1ac 	and	$r12,$r13,$r12
1c007ec8:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c007ecc:	40001d80 	beqz	$r12,28(0x1c) # 1c007ee8 <touch_test+0xf0>
1c007ed0:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007ed4:	02b3c084 	addi.w	$r4,$r4,-784(0xcf0)
1c007ed8:	579cf7ff 	bl	-25356(0xfff9cf4) # 1c001bcc <myprintf>
1c007edc:	57cc6bff 	bl	-13208(0xfffcc68) # 1c004b44 <TOUCH_EnableSingleScan>
1c007ee0:	57ceefff 	bl	-12564(0xfffceec) # 1c004dcc <Printf_CountVal>
1c007ee4:	5001b000 	b	432(0x1b0) # 1c008094 <touch_test+0x29c>
1c007ee8:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c007eec:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c007ef0:	2880018c 	ld.w	$r12,$r12,0
1c007ef4:	00150185 	move	$r5,$r12
1c007ef8:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007efc:	02b36084 	addi.w	$r4,$r4,-808(0xcd8)
1c007f00:	57ab57ff 	bl	-21676(0xfffab54) # 1c002a54 <strcmp>
1c007f04:	0015008c 	move	$r12,$r4
1c007f08:	4400c580 	bnez	$r12,196(0xc4) # 1c007fcc <touch_test+0x1d4>
1c007f0c:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007f10:	02b33084 	addi.w	$r4,$r4,-820(0xccc)
1c007f14:	579cbbff 	bl	-25416(0xfff9cb8) # 1c001bcc <myprintf>
1c007f18:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c007f1c:	0280218c 	addi.w	$r12,$r12,8(0x8)
1c007f20:	2880018c 	ld.w	$r12,$r12,0
1c007f24:	00150184 	move	$r4,$r12
1c007f28:	57fa3fff 	bl	-1476(0xffffa3c) # 1c007964 <str2num>
1c007f2c:	0015008c 	move	$r12,$r4
1c007f30:	293fb6cc 	st.b	$r12,$r22,-19(0xfed)
1c007f34:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c007f38:	02800c0c 	addi.w	$r12,$r0,3(0x3)
1c007f3c:	5c003dac 	bne	$r13,$r12,60(0x3c) # 1c007f78 <touch_test+0x180>
1c007f40:	293fbec0 	st.b	$r0,$r22,-17(0xfef)
1c007f44:	50002400 	b	36(0x24) # 1c007f68 <touch_test+0x170>
1c007f48:	2a3fb6cd 	ld.bu	$r13,$r22,-19(0xfed)
1c007f4c:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c007f50:	001501a5 	move	$r5,$r13
1c007f54:	00150184 	move	$r4,$r12
1c007f58:	57cc1fff 	bl	-13284(0xfffcc1c) # 1c004b74 <TOUCH_SetDownTh>
1c007f5c:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c007f60:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c007f64:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c007f68:	2a3fbecd 	ld.bu	$r13,$r22,-17(0xfef)
1c007f6c:	02802c0c 	addi.w	$r12,$r0,11(0xb)
1c007f70:	6fffd98d 	bgeu	$r12,$r13,-40(0x3ffd8) # 1c007f48 <touch_test+0x150>
1c007f74:	50012000 	b	288(0x120) # 1c008094 <touch_test+0x29c>
1c007f78:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c007f7c:	0280100c 	addi.w	$r12,$r0,4(0x4)
1c007f80:	5c0039ac 	bne	$r13,$r12,56(0x38) # 1c007fb8 <touch_test+0x1c0>
1c007f84:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c007f88:	0280318c 	addi.w	$r12,$r12,12(0xc)
1c007f8c:	2880018c 	ld.w	$r12,$r12,0
1c007f90:	00150184 	move	$r4,$r12
1c007f94:	57f9d3ff 	bl	-1584(0xffff9d0) # 1c007964 <str2num>
1c007f98:	0015008c 	move	$r12,$r4
1c007f9c:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c007fa0:	2a3fb6cd 	ld.bu	$r13,$r22,-19(0xfed)
1c007fa4:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c007fa8:	001501a5 	move	$r5,$r13
1c007fac:	00150184 	move	$r4,$r12
1c007fb0:	57cbc7ff 	bl	-13372(0xfffcbc4) # 1c004b74 <TOUCH_SetDownTh>
1c007fb4:	5000e000 	b	224(0xe0) # 1c008094 <touch_test+0x29c>
1c007fb8:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007fbc:	02b0c084 	addi.w	$r4,$r4,-976(0xc30)
1c007fc0:	579c0fff 	bl	-25588(0xfff9c0c) # 1c001bcc <myprintf>
1c007fc4:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c007fc8:	5000d000 	b	208(0xd0) # 1c008098 <touch_test+0x2a0>
1c007fcc:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c007fd0:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c007fd4:	2880018c 	ld.w	$r12,$r12,0
1c007fd8:	00150185 	move	$r5,$r12
1c007fdc:	1c000084 	pcaddu12i	$r4,4(0x4)
1c007fe0:	02b0c084 	addi.w	$r4,$r4,-976(0xc30)
1c007fe4:	57aa73ff 	bl	-21904(0xfffaa70) # 1c002a54 <strcmp>
1c007fe8:	0015008c 	move	$r12,$r4
1c007fec:	0240058c 	sltui	$r12,$r12,1(0x1)
1c007ff0:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c007ff4:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c007ff8:	03c0098c 	xori	$r12,$r12,0x2
1c007ffc:	0240058c 	sltui	$r12,$r12,1(0x1)
1c008000:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c008004:	0014b1ac 	and	$r12,$r13,$r12
1c008008:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c00800c:	40001980 	beqz	$r12,24(0x18) # 1c008024 <touch_test+0x22c>
1c008010:	1c000084 	pcaddu12i	$r4,4(0x4)
1c008014:	02b01084 	addi.w	$r4,$r4,-1020(0xc04)
1c008018:	579bb7ff 	bl	-25676(0xfff9bb4) # 1c001bcc <myprintf>
1c00801c:	57cafbff 	bl	-13576(0xfffcaf8) # 1c004b14 <TOUCH_EnablePollScan>
1c008020:	50007400 	b	116(0x74) # 1c008094 <touch_test+0x29c>
1c008024:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c008028:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c00802c:	2880018c 	ld.w	$r12,$r12,0
1c008030:	00150185 	move	$r5,$r12
1c008034:	1c000084 	pcaddu12i	$r4,4(0x4)
1c008038:	02afc084 	addi.w	$r4,$r4,-1040(0xbf0)
1c00803c:	57aa1bff 	bl	-21992(0xfffaa18) # 1c002a54 <strcmp>
1c008040:	0015008c 	move	$r12,$r4
1c008044:	0240058c 	sltui	$r12,$r12,1(0x1)
1c008048:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c00804c:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c008050:	03c0098c 	xori	$r12,$r12,0x2
1c008054:	0240058c 	sltui	$r12,$r12,1(0x1)
1c008058:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c00805c:	0014b1ac 	and	$r12,$r13,$r12
1c008060:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c008064:	40001180 	beqz	$r12,16(0x10) # 1c008074 <touch_test+0x27c>
1c008068:	57fbbfff 	bl	-1092(0xffffbbc) # 1c007c24 <touch_reg_show>
1c00806c:	57fcbbff 	bl	-840(0xffffcb8) # 1c007d24 <touch_value_show>
1c008070:	50002400 	b	36(0x24) # 1c008094 <touch_test+0x29c>
1c008074:	1c000084 	pcaddu12i	$r4,4(0x4)
1c008078:	02aee084 	addi.w	$r4,$r4,-1096(0xbb8)
1c00807c:	579b53ff 	bl	-25776(0xfff9b50) # 1c001bcc <myprintf>
1c008080:	1c000084 	pcaddu12i	$r4,4(0x4)
1c008084:	02aef084 	addi.w	$r4,$r4,-1092(0xbbc)
1c008088:	579b47ff 	bl	-25788(0xfff9b44) # 1c001bcc <myprintf>
1c00808c:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c008090:	50000800 	b	8(0x8) # 1c008098 <touch_test+0x2a0>
1c008094:	0015000c 	move	$r12,$r0
1c008098:	00150184 	move	$r4,$r12
1c00809c:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c0080a0:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c0080a4:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c0080a8:	4c000020 	jirl	$r0,$r1,0

1c0080ac <hpet>:
hpet():
1c0080ac:	02bec063 	addi.w	$r3,$r3,-80(0xfb0)
1c0080b0:	29813061 	st.w	$r1,$r3,76(0x4c)
1c0080b4:	29812076 	st.w	$r22,$r3,72(0x48)
1c0080b8:	02814076 	addi.w	$r22,$r3,80(0x50)
1c0080bc:	29bef2c4 	st.w	$r4,$r22,-68(0xfbc)
1c0080c0:	29bee2c5 	st.w	$r5,$r22,-72(0xfb8)
1c0080c4:	1c000084 	pcaddu12i	$r4,4(0x4)
1c0080c8:	02b01084 	addi.w	$r4,$r4,-1020(0xc04)
1c0080cc:	579b03ff 	bl	-25856(0xfff9b00) # 1c001bcc <myprintf>
1c0080d0:	28bef2cd 	ld.w	$r13,$r22,-68(0xfbc)
1c0080d4:	02800c0c 	addi.w	$r12,$r0,3(0x3)
1c0080d8:	6000298d 	blt	$r12,$r13,40(0x28) # 1c008100 <hpet+0x54>
1c0080dc:	00150004 	move	$r4,$r0
1c0080e0:	57cf2fff 	bl	-12500(0xfffcf2c) # 1c00500c <TIM_Cmd>
1c0080e4:	00150004 	move	$r4,$r0
1c0080e8:	57cf7bff 	bl	-12424(0xfffcf78) # 1c005060 <TIM_ITConfig>
1c0080ec:	1c000084 	pcaddu12i	$r4,4(0x4)
1c0080f0:	02afe084 	addi.w	$r4,$r4,-1032(0xbf8)
1c0080f4:	579adbff 	bl	-25896(0xfff9ad8) # 1c001bcc <myprintf>
1c0080f8:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0080fc:	50009c00 	b	156(0x9c) # 1c008198 <hpet+0xec>
1c008100:	28bee2cc 	ld.w	$r12,$r22,-72(0xfb8)
1c008104:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c008108:	2880018c 	ld.w	$r12,$r12,0
1c00810c:	00150184 	move	$r4,$r12
1c008110:	57f857ff 	bl	-1964(0xffff854) # 1c007964 <str2num>
1c008114:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c008118:	28bee2cc 	ld.w	$r12,$r22,-72(0xfb8)
1c00811c:	0280218c 	addi.w	$r12,$r12,8(0x8)
1c008120:	2880018c 	ld.w	$r12,$r12,0
1c008124:	00150184 	move	$r4,$r12
1c008128:	57f83fff 	bl	-1988(0xffff83c) # 1c007964 <str2num>
1c00812c:	29bfa2c4 	st.w	$r4,$r22,-24(0xfe8)
1c008130:	28bee2cc 	ld.w	$r12,$r22,-72(0xfb8)
1c008134:	0280318c 	addi.w	$r12,$r12,12(0xc)
1c008138:	2880018c 	ld.w	$r12,$r12,0
1c00813c:	00150184 	move	$r4,$r12
1c008140:	57f827ff 	bl	-2012(0xffff824) # 1c007964 <str2num>
1c008144:	29bf92c4 	st.w	$r4,$r22,-28(0xfe4)
1c008148:	02bf22cc 	addi.w	$r12,$r22,-56(0xfc8)
1c00814c:	00150184 	move	$r4,$r12
1c008150:	57ce43ff 	bl	-12736(0xfffce40) # 1c004f90 <TIM_StructInit>
1c008154:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c008158:	0040898c 	slli.w	$r12,$r12,0x2
1c00815c:	29bf62cc 	st.w	$r12,$r22,-40(0xfd8)
1c008160:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c008164:	1400002c 	lu12i.w	$r12,1(0x1)
1c008168:	03bcfd8c 	ori	$r12,$r12,0xf3f
1c00816c:	001c31ac 	mul.w	$r12,$r13,$r12
1c008170:	29bf32cc 	st.w	$r12,$r22,-52(0xfcc)
1c008174:	28bf92cd 	ld.w	$r13,$r22,-28(0xfe4)
1c008178:	1400f42c 	lu12i.w	$r12,1953(0x7a1)
1c00817c:	0388018c 	ori	$r12,$r12,0x200
1c008180:	001c31ac 	mul.w	$r12,$r13,$r12
1c008184:	29bf42cc 	st.w	$r12,$r22,-48(0xfd0)
1c008188:	02bf22cc 	addi.w	$r12,$r22,-56(0xfc8)
1c00818c:	00150184 	move	$r4,$r12
1c008190:	57cd2bff 	bl	-13016(0xfffcd28) # 1c004eb8 <TIM_Init>
1c008194:	0015000c 	move	$r12,$r0
1c008198:	00150184 	move	$r4,$r12
1c00819c:	28813061 	ld.w	$r1,$r3,76(0x4c)
1c0081a0:	28812076 	ld.w	$r22,$r3,72(0x48)
1c0081a4:	02814063 	addi.w	$r3,$r3,80(0x50)
1c0081a8:	4c000020 	jirl	$r0,$r1,0

1c0081ac <latimer>:
latimer():
1c0081ac:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c0081b0:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c0081b4:	2980a076 	st.w	$r22,$r3,40(0x28)
1c0081b8:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c0081bc:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c0081c0:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c0081c4:	28bf72c5 	ld.w	$r5,$r22,-36(0xfdc)
1c0081c8:	1c000084 	pcaddu12i	$r4,4(0x4)
1c0081cc:	02ad2084 	addi.w	$r4,$r4,-1208(0xb48)
1c0081d0:	5799ffff 	bl	-26116(0xfff99fc) # 1c001bcc <myprintf>
1c0081d4:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c0081d8:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0081dc:	60001d8d 	blt	$r12,$r13,28(0x1c) # 1c0081f8 <latimer+0x4c>
1c0081e0:	579ed7ff 	bl	-24876(0xfff9ed4) # 1c0020b4 <Set_Timer_stop>
1c0081e4:	1c000084 	pcaddu12i	$r4,4(0x4)
1c0081e8:	02ad3084 	addi.w	$r4,$r4,-1204(0xb4c)
1c0081ec:	5799e3ff 	bl	-26144(0xfff99e0) # 1c001bcc <myprintf>
1c0081f0:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0081f4:	50003800 	b	56(0x38) # 1c00822c <latimer+0x80>
1c0081f8:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c0081fc:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c008200:	2880018c 	ld.w	$r12,$r12,0
1c008204:	00150184 	move	$r4,$r12
1c008208:	57f75fff 	bl	-2212(0xffff75c) # 1c007964 <str2num>
1c00820c:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c008210:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c008214:	1401458c 	lu12i.w	$r12,2604(0xa2c)
1c008218:	038fe18c 	ori	$r12,$r12,0x3f8
1c00821c:	001c31ac 	mul.w	$r12,$r13,$r12
1c008220:	00150184 	move	$r4,$r12
1c008224:	579ed7ff 	bl	-24876(0xfff9ed4) # 1c0020f8 <Set_Timer_Init>
1c008228:	0015000c 	move	$r12,$r0
1c00822c:	00150184 	move	$r4,$r12
1c008230:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c008234:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c008238:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c00823c:	4c000020 	jirl	$r0,$r1,0

1c008240 <delay>:
delay():
1c008240:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c008244:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c008248:	2980a076 	st.w	$r22,$r3,40(0x28)
1c00824c:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c008250:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c008254:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c008258:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c00825c:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c008260:	6000198d 	blt	$r12,$r13,24(0x18) # 1c008278 <delay+0x38>
1c008264:	1c000084 	pcaddu12i	$r4,4(0x4)
1c008268:	02ab9084 	addi.w	$r4,$r4,-1308(0xae4)
1c00826c:	579963ff 	bl	-26272(0xfff9960) # 1c001bcc <myprintf>
1c008270:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c008274:	5000bc00 	b	188(0xbc) # 1c008330 <delay+0xf0>
1c008278:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c00827c:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c008280:	2880018c 	ld.w	$r12,$r12,0
1c008284:	00150184 	move	$r4,$r12
1c008288:	57f6dfff 	bl	-2340(0xffff6dc) # 1c007964 <str2num>
1c00828c:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c008290:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c008294:	0280218c 	addi.w	$r12,$r12,8(0x8)
1c008298:	2880018c 	ld.w	$r12,$r12,0
1c00829c:	00150184 	move	$r4,$r12
1c0082a0:	57f6c7ff 	bl	-2364(0xffff6c4) # 1c007964 <str2num>
1c0082a4:	29bfa2c4 	st.w	$r4,$r22,-24(0xfe8)
1c0082a8:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c0082ac:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0082b0:	5c0021ac 	bne	$r13,$r12,32(0x20) # 1c0082d0 <delay+0x90>
1c0082b4:	28bfa2c4 	ld.w	$r4,$r22,-24(0xfe8)
1c0082b8:	57a6ebff 	bl	-22808(0xfffa6e8) # 1c0029a0 <delay_us>
1c0082bc:	28bfa2c5 	ld.w	$r5,$r22,-24(0xfe8)
1c0082c0:	1c000084 	pcaddu12i	$r4,4(0x4)
1c0082c4:	02aad084 	addi.w	$r4,$r4,-1356(0xab4)
1c0082c8:	579907ff 	bl	-26364(0xfff9904) # 1c001bcc <myprintf>
1c0082cc:	50006000 	b	96(0x60) # 1c00832c <delay+0xec>
1c0082d0:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c0082d4:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c0082d8:	5c0021ac 	bne	$r13,$r12,32(0x20) # 1c0082f8 <delay+0xb8>
1c0082dc:	28bfa2c4 	ld.w	$r4,$r22,-24(0xfe8)
1c0082e0:	57a6fbff 	bl	-22792(0xfffa6f8) # 1c0029d8 <delay_ms>
1c0082e4:	28bfa2c5 	ld.w	$r5,$r22,-24(0xfe8)
1c0082e8:	1c000084 	pcaddu12i	$r4,4(0x4)
1c0082ec:	02aa5084 	addi.w	$r4,$r4,-1388(0xa94)
1c0082f0:	5798dfff 	bl	-26404(0xfff98dc) # 1c001bcc <myprintf>
1c0082f4:	50003800 	b	56(0x38) # 1c00832c <delay+0xec>
1c0082f8:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c0082fc:	02800c0c 	addi.w	$r12,$r0,3(0x3)
1c008300:	5c0021ac 	bne	$r13,$r12,32(0x20) # 1c008320 <delay+0xe0>
1c008304:	28bfa2c4 	ld.w	$r4,$r22,-24(0xfe8)
1c008308:	57a713ff 	bl	-22768(0xfffa710) # 1c002a18 <delay_s>
1c00830c:	28bfa2c5 	ld.w	$r5,$r22,-24(0xfe8)
1c008310:	1c000084 	pcaddu12i	$r4,4(0x4)
1c008314:	02a9d084 	addi.w	$r4,$r4,-1420(0xa74)
1c008318:	5798b7ff 	bl	-26444(0xfff98b4) # 1c001bcc <myprintf>
1c00831c:	50001000 	b	16(0x10) # 1c00832c <delay+0xec>
1c008320:	1c000084 	pcaddu12i	$r4,4(0x4)
1c008324:	02a8a084 	addi.w	$r4,$r4,-1496(0xa28)
1c008328:	5798a7ff 	bl	-26460(0xfff98a4) # 1c001bcc <myprintf>
1c00832c:	0015000c 	move	$r12,$r0
1c008330:	00150184 	move	$r4,$r12
1c008334:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c008338:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c00833c:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c008340:	4c000020 	jirl	$r0,$r1,0

1c008344 <wakeup>:
wakeup():
1c008344:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c008348:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c00834c:	2980a076 	st.w	$r22,$r3,40(0x28)
1c008350:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c008354:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c008358:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c00835c:	28bf72c5 	ld.w	$r5,$r22,-36(0xfdc)
1c008360:	1c000084 	pcaddu12i	$r4,4(0x4)
1c008364:	02a8b084 	addi.w	$r4,$r4,-1492(0xa2c)
1c008368:	579867ff 	bl	-26524(0xfff9864) # 1c001bcc <myprintf>
1c00836c:	579d03ff 	bl	-25344(0xfff9d00) # 1c00206c <DisableInt>
1c008370:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c008374:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c008378:	6000218d 	blt	$r12,$r13,32(0x20) # 1c008398 <wakeup+0x54>
1c00837c:	00150004 	move	$r4,$r0
1c008380:	579dabff 	bl	-25176(0xfff9da8) # 1c002128 <Wake_Set>
1c008384:	1c000084 	pcaddu12i	$r4,4(0x4)
1c008388:	02a8b084 	addi.w	$r4,$r4,-1492(0xa2c)
1c00838c:	579843ff 	bl	-26560(0xfff9840) # 1c001bcc <myprintf>
1c008390:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c008394:	50002c00 	b	44(0x2c) # 1c0083c0 <wakeup+0x7c>
1c008398:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c00839c:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c0083a0:	2880018c 	ld.w	$r12,$r12,0
1c0083a4:	00150184 	move	$r4,$r12
1c0083a8:	57f5bfff 	bl	-2628(0xffff5bc) # 1c007964 <str2num>
1c0083ac:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c0083b0:	28bfb2c4 	ld.w	$r4,$r22,-20(0xfec)
1c0083b4:	579d77ff 	bl	-25228(0xfff9d74) # 1c002128 <Wake_Set>
1c0083b8:	578e2fff 	bl	-29140(0xfff8e2c) # 1c0011e4 <cpu_sleep>
1c0083bc:	0015000c 	move	$r12,$r0
1c0083c0:	00150184 	move	$r4,$r12
1c0083c4:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c0083c8:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c0083cc:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c0083d0:	4c000020 	jirl	$r0,$r1,0

1c0083d4 <a_to_n>:
a_to_n():
1c0083d4:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0083d8:	29807061 	st.w	$r1,$r3,28(0x1c)
1c0083dc:	29806076 	st.w	$r22,$r3,24(0x18)
1c0083e0:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0083e4:	0015008c 	move	$r12,$r4
1c0083e8:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c0083ec:	2a3fbecd 	ld.bu	$r13,$r22,-17(0xfef)
1c0083f0:	0280bc0c 	addi.w	$r12,$r0,47(0x2f)
1c0083f4:	6c00118d 	bgeu	$r12,$r13,16(0x10) # 1c008404 <a_to_n+0x30>
1c0083f8:	2a3fbecd 	ld.bu	$r13,$r22,-17(0xfef)
1c0083fc:	0280e40c 	addi.w	$r12,$r0,57(0x39)
1c008400:	6c00198d 	bgeu	$r12,$r13,24(0x18) # 1c008418 <a_to_n+0x44>
1c008404:	1c000084 	pcaddu12i	$r4,4(0x4)
1c008408:	02a71084 	addi.w	$r4,$r4,-1596(0x9c4)
1c00840c:	5797c3ff 	bl	-26688(0xfff97c0) # 1c001bcc <myprintf>
1c008410:	02bffc0c 	addi.w	$r12,$r0,-1(0xfff)
1c008414:	50000c00 	b	12(0xc) # 1c008420 <a_to_n+0x4c>
1c008418:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c00841c:	03403d8c 	andi	$r12,$r12,0xf
1c008420:	00150184 	move	$r4,$r12
1c008424:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c008428:	28806076 	ld.w	$r22,$r3,24(0x18)
1c00842c:	02808063 	addi.w	$r3,$r3,32(0x20)
1c008430:	4c000020 	jirl	$r0,$r1,0

1c008434 <date>:
date():
1c008434:	02bd4063 	addi.w	$r3,$r3,-176(0xf50)
1c008438:	2982b061 	st.w	$r1,$r3,172(0xac)
1c00843c:	2982a076 	st.w	$r22,$r3,168(0xa8)
1c008440:	29829077 	st.w	$r23,$r3,164(0xa4)
1c008444:	0282c076 	addi.w	$r22,$r3,176(0xb0)
1c008448:	29bd72c4 	st.w	$r4,$r22,-164(0xf5c)
1c00844c:	29bd62c5 	st.w	$r5,$r22,-168(0xf58)
1c008450:	1c000084 	pcaddu12i	$r4,4(0x4)
1c008454:	02a65084 	addi.w	$r4,$r4,-1644(0x994)
1c008458:	579777ff 	bl	-26764(0xfff9774) # 1c001bcc <myprintf>
1c00845c:	1c00008c 	pcaddu12i	$r12,4(0x4)
1c008460:	02ab118c 	addi.w	$r12,$r12,-1340(0xac4)
1c008464:	2880018f 	ld.w	$r15,$r12,0
1c008468:	2880118e 	ld.w	$r14,$r12,4(0x4)
1c00846c:	2880218d 	ld.w	$r13,$r12,8(0x8)
1c008470:	2880318c 	ld.w	$r12,$r12,12(0xc)
1c008474:	29bde2cf 	st.w	$r15,$r22,-136(0xf78)
1c008478:	29bdf2ce 	st.w	$r14,$r22,-132(0xf7c)
1c00847c:	29be02cd 	st.w	$r13,$r22,-128(0xf80)
1c008480:	29be12cc 	st.w	$r12,$r22,-124(0xf84)
1c008484:	28bd62cc 	ld.w	$r12,$r22,-168(0xf58)
1c008488:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c00848c:	2880018c 	ld.w	$r12,$r12,0
1c008490:	28bde2cd 	ld.w	$r13,$r22,-136(0xf78)
1c008494:	001501a5 	move	$r5,$r13
1c008498:	00150184 	move	$r4,$r12
1c00849c:	57a5bbff 	bl	-23112(0xfffa5b8) # 1c002a54 <strcmp>
1c0084a0:	0015008c 	move	$r12,$r4
1c0084a4:	44003d80 	bnez	$r12,60(0x3c) # 1c0084e0 <date+0xac>
1c0084a8:	1c000084 	pcaddu12i	$r4,4(0x4)
1c0084ac:	02a50084 	addi.w	$r4,$r4,-1728(0x940)
1c0084b0:	57971fff 	bl	-26852(0xfff971c) # 1c001bcc <myprintf>
1c0084b4:	1c000084 	pcaddu12i	$r4,4(0x4)
1c0084b8:	02a54084 	addi.w	$r4,$r4,-1712(0x950)
1c0084bc:	579713ff 	bl	-26864(0xfff9710) # 1c001bcc <myprintf>
1c0084c0:	1c000084 	pcaddu12i	$r4,4(0x4)
1c0084c4:	02a5c084 	addi.w	$r4,$r4,-1680(0x970)
1c0084c8:	579707ff 	bl	-26876(0xfff9704) # 1c001bcc <myprintf>
1c0084cc:	1c000084 	pcaddu12i	$r4,4(0x4)
1c0084d0:	02a63084 	addi.w	$r4,$r4,-1652(0x98c)
1c0084d4:	5796fbff 	bl	-26888(0xfff96f8) # 1c001bcc <myprintf>
1c0084d8:	0015000c 	move	$r12,$r0
1c0084dc:	50066000 	b	1632(0x660) # 1c008b3c <date+0x708>
1c0084e0:	28bd62cc 	ld.w	$r12,$r22,-168(0xf58)
1c0084e4:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c0084e8:	2880018c 	ld.w	$r12,$r12,0
1c0084ec:	28bdf2cd 	ld.w	$r13,$r22,-132(0xf7c)
1c0084f0:	001501a5 	move	$r5,$r13
1c0084f4:	00150184 	move	$r4,$r12
1c0084f8:	57a55fff 	bl	-23204(0xfffa55c) # 1c002a54 <strcmp>
1c0084fc:	0015008c 	move	$r12,$r4
1c008500:	4402a180 	bnez	$r12,672(0x2a0) # 1c0087a0 <date+0x36c>
1c008504:	28bd72cd 	ld.w	$r13,$r22,-164(0xf5c)
1c008508:	0280100c 	addi.w	$r12,$r0,4(0x4)
1c00850c:	580019ac 	beq	$r13,$r12,24(0x18) # 1c008524 <date+0xf0>
1c008510:	1c000084 	pcaddu12i	$r4,4(0x4)
1c008514:	02a61084 	addi.w	$r4,$r4,-1660(0x984)
1c008518:	5796b7ff 	bl	-26956(0xfff96b4) # 1c001bcc <myprintf>
1c00851c:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c008520:	50061c00 	b	1564(0x61c) # 1c008b3c <date+0x708>
1c008524:	28bd62cc 	ld.w	$r12,$r22,-168(0xf58)
1c008528:	2880218c 	ld.w	$r12,$r12,8(0x8)
1c00852c:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c008530:	28bd62cc 	ld.w	$r12,$r22,-168(0xf58)
1c008534:	2880318c 	ld.w	$r12,$r12,12(0xc)
1c008538:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c00853c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c008540:	2a00018c 	ld.bu	$r12,$r12,0
1c008544:	00150184 	move	$r4,$r12
1c008548:	57fe8fff 	bl	-372(0xffffe8c) # 1c0083d4 <a_to_n>
1c00854c:	0015008d 	move	$r13,$r4
1c008550:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c008554:	001c31b7 	mul.w	$r23,$r13,$r12
1c008558:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00855c:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c008560:	2a00018c 	ld.bu	$r12,$r12,0
1c008564:	00150184 	move	$r4,$r12
1c008568:	57fe6fff 	bl	-404(0xffffe6c) # 1c0083d4 <a_to_n>
1c00856c:	0015008c 	move	$r12,$r4
1c008570:	001032ec 	add.w	$r12,$r23,$r12
1c008574:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c008578:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00857c:	02800d8c 	addi.w	$r12,$r12,3(0x3)
1c008580:	2a00018c 	ld.bu	$r12,$r12,0
1c008584:	00150184 	move	$r4,$r12
1c008588:	57fe4fff 	bl	-436(0xffffe4c) # 1c0083d4 <a_to_n>
1c00858c:	0015008d 	move	$r13,$r4
1c008590:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c008594:	001c31b7 	mul.w	$r23,$r13,$r12
1c008598:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00859c:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c0085a0:	2a00018c 	ld.bu	$r12,$r12,0
1c0085a4:	00150184 	move	$r4,$r12
1c0085a8:	57fe2fff 	bl	-468(0xffffe2c) # 1c0083d4 <a_to_n>
1c0085ac:	0015008c 	move	$r12,$r4
1c0085b0:	001032ec 	add.w	$r12,$r23,$r12
1c0085b4:	29bf82cc 	st.w	$r12,$r22,-32(0xfe0)
1c0085b8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0085bc:	0280198c 	addi.w	$r12,$r12,6(0x6)
1c0085c0:	2a00018c 	ld.bu	$r12,$r12,0
1c0085c4:	00150184 	move	$r4,$r12
1c0085c8:	57fe0fff 	bl	-500(0xffffe0c) # 1c0083d4 <a_to_n>
1c0085cc:	0015008d 	move	$r13,$r4
1c0085d0:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c0085d4:	001c31b7 	mul.w	$r23,$r13,$r12
1c0085d8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0085dc:	02801d8c 	addi.w	$r12,$r12,7(0x7)
1c0085e0:	2a00018c 	ld.bu	$r12,$r12,0
1c0085e4:	00150184 	move	$r4,$r12
1c0085e8:	57fdefff 	bl	-532(0xffffdec) # 1c0083d4 <a_to_n>
1c0085ec:	0015008c 	move	$r12,$r4
1c0085f0:	001032ec 	add.w	$r12,$r23,$r12
1c0085f4:	29bf72cc 	st.w	$r12,$r22,-36(0xfdc)
1c0085f8:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0085fc:	2a00018c 	ld.bu	$r12,$r12,0
1c008600:	00150184 	move	$r4,$r12
1c008604:	57fdd3ff 	bl	-560(0xffffdd0) # 1c0083d4 <a_to_n>
1c008608:	0015008d 	move	$r13,$r4
1c00860c:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c008610:	001c31b7 	mul.w	$r23,$r13,$r12
1c008614:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c008618:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c00861c:	2a00018c 	ld.bu	$r12,$r12,0
1c008620:	00150184 	move	$r4,$r12
1c008624:	57fdb3ff 	bl	-592(0xffffdb0) # 1c0083d4 <a_to_n>
1c008628:	0015008c 	move	$r12,$r4
1c00862c:	001032ec 	add.w	$r12,$r23,$r12
1c008630:	29bf62cc 	st.w	$r12,$r22,-40(0xfd8)
1c008634:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c008638:	02800d8c 	addi.w	$r12,$r12,3(0x3)
1c00863c:	2a00018c 	ld.bu	$r12,$r12,0
1c008640:	00150184 	move	$r4,$r12
1c008644:	57fd93ff 	bl	-624(0xffffd90) # 1c0083d4 <a_to_n>
1c008648:	0015008d 	move	$r13,$r4
1c00864c:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c008650:	001c31b7 	mul.w	$r23,$r13,$r12
1c008654:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c008658:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c00865c:	2a00018c 	ld.bu	$r12,$r12,0
1c008660:	00150184 	move	$r4,$r12
1c008664:	57fd73ff 	bl	-656(0xffffd70) # 1c0083d4 <a_to_n>
1c008668:	0015008c 	move	$r12,$r4
1c00866c:	001032ec 	add.w	$r12,$r23,$r12
1c008670:	29bf52cc 	st.w	$r12,$r22,-44(0xfd4)
1c008674:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c008678:	0280198c 	addi.w	$r12,$r12,6(0x6)
1c00867c:	2a00018c 	ld.bu	$r12,$r12,0
1c008680:	00150184 	move	$r4,$r12
1c008684:	57fd53ff 	bl	-688(0xffffd50) # 1c0083d4 <a_to_n>
1c008688:	0015008d 	move	$r13,$r4
1c00868c:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c008690:	001c31b7 	mul.w	$r23,$r13,$r12
1c008694:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c008698:	02801d8c 	addi.w	$r12,$r12,7(0x7)
1c00869c:	2a00018c 	ld.bu	$r12,$r12,0
1c0086a0:	00150184 	move	$r4,$r12
1c0086a4:	57fd33ff 	bl	-720(0xffffd30) # 1c0083d4 <a_to_n>
1c0086a8:	0015008c 	move	$r12,$r4
1c0086ac:	001032ec 	add.w	$r12,$r23,$r12
1c0086b0:	29bf42cc 	st.w	$r12,$r22,-48(0xfd0)
1c0086b4:	28bf82cd 	ld.w	$r13,$r22,-32(0xfe0)
1c0086b8:	0280300c 	addi.w	$r12,$r0,12(0xc)
1c0086bc:	68005d8d 	bltu	$r12,$r13,92(0x5c) # 1c008718 <date+0x2e4>
1c0086c0:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c0086c4:	40005580 	beqz	$r12,84(0x54) # 1c008718 <date+0x2e4>
1c0086c8:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c0086cc:	02807c0c 	addi.w	$r12,$r0,31(0x1f)
1c0086d0:	6800498d 	bltu	$r12,$r13,72(0x48) # 1c008718 <date+0x2e4>
1c0086d4:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0086d8:	40004180 	beqz	$r12,64(0x40) # 1c008718 <date+0x2e4>
1c0086dc:	28bf82cd 	ld.w	$r13,$r22,-32(0xfe0)
1c0086e0:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c0086e4:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c0086f4 <date+0x2c0>
1c0086e8:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c0086ec:	0280740c 	addi.w	$r12,$r0,29(0x1d)
1c0086f0:	6800298d 	bltu	$r12,$r13,40(0x28) # 1c008718 <date+0x2e4>
1c0086f4:	28bf62cd 	ld.w	$r13,$r22,-40(0xfd8)
1c0086f8:	0280600c 	addi.w	$r12,$r0,24(0x18)
1c0086fc:	68001d8d 	bltu	$r12,$r13,28(0x1c) # 1c008718 <date+0x2e4>
1c008700:	28bf52cd 	ld.w	$r13,$r22,-44(0xfd4)
1c008704:	0280f00c 	addi.w	$r12,$r0,60(0x3c)
1c008708:	6800118d 	bltu	$r12,$r13,16(0x10) # 1c008718 <date+0x2e4>
1c00870c:	28bf42cd 	ld.w	$r13,$r22,-48(0xfd0)
1c008710:	0280f00c 	addi.w	$r12,$r0,60(0x3c)
1c008714:	6c000d8d 	bgeu	$r12,$r13,12(0xc) # 1c008720 <date+0x2ec>
1c008718:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c00871c:	50000800 	b	8(0x8) # 1c008724 <date+0x2f0>
1c008720:	0015000c 	move	$r12,$r0
1c008724:	29bf32cc 	st.w	$r12,$r22,-52(0xfcc)
1c008728:	28bf32cc 	ld.w	$r12,$r22,-52(0xfcc)
1c00872c:	40001980 	beqz	$r12,24(0x18) # 1c008744 <date+0x310>
1c008730:	1c000064 	pcaddu12i	$r4,3(0x3)
1c008734:	029de084 	addi.w	$r4,$r4,1912(0x778)
1c008738:	579497ff 	bl	-27500(0xfff9494) # 1c001bcc <myprintf>
1c00873c:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c008740:	5003fc00 	b	1020(0x3fc) # 1c008b3c <date+0x708>
1c008744:	28bf42cc 	ld.w	$r12,$r22,-48(0xfd0)
1c008748:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c00874c:	293dc2cc 	st.b	$r12,$r22,-144(0xf70)
1c008750:	28bf52cc 	ld.w	$r12,$r22,-44(0xfd4)
1c008754:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c008758:	293dc6cc 	st.b	$r12,$r22,-143(0xf71)
1c00875c:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c008760:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c008764:	293dcacc 	st.b	$r12,$r22,-142(0xf72)
1c008768:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c00876c:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c008770:	293dcecc 	st.b	$r12,$r22,-141(0xf73)
1c008774:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c008778:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c00877c:	293dd2cc 	st.b	$r12,$r22,-140(0xf74)
1c008780:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c008784:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c008788:	293dd6cc 	st.b	$r12,$r22,-139(0xf75)
1c00878c:	02bdc2cc 	addi.w	$r12,$r22,-144(0xf70)
1c008790:	00150185 	move	$r5,$r12
1c008794:	00150004 	move	$r4,$r0
1c008798:	57ab07ff 	bl	-21756(0xfffab04) # 1c00329c <RtcUpdateData>
1c00879c:	5003a000 	b	928(0x3a0) # 1c008b3c <date+0x708>
1c0087a0:	28bd62cc 	ld.w	$r12,$r22,-168(0xf58)
1c0087a4:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c0087a8:	2880018c 	ld.w	$r12,$r12,0
1c0087ac:	28be02cd 	ld.w	$r13,$r22,-128(0xf80)
1c0087b0:	001501a5 	move	$r5,$r13
1c0087b4:	00150184 	move	$r4,$r12
1c0087b8:	57a29fff 	bl	-23908(0xfffa29c) # 1c002a54 <strcmp>
1c0087bc:	0015008c 	move	$r12,$r4
1c0087c0:	44024980 	bnez	$r12,584(0x248) # 1c008a08 <date+0x5d4>
1c0087c4:	28bd72cd 	ld.w	$r13,$r22,-164(0xf5c)
1c0087c8:	0280100c 	addi.w	$r12,$r0,4(0x4)
1c0087cc:	580019ac 	beq	$r13,$r12,24(0x18) # 1c0087e4 <date+0x3b0>
1c0087d0:	1c000064 	pcaddu12i	$r4,3(0x3)
1c0087d4:	029b1084 	addi.w	$r4,$r4,1732(0x6c4)
1c0087d8:	5793f7ff 	bl	-27660(0xfff93f4) # 1c001bcc <myprintf>
1c0087dc:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0087e0:	50035c00 	b	860(0x35c) # 1c008b3c <date+0x708>
1c0087e4:	28bd62cc 	ld.w	$r12,$r22,-168(0xf58)
1c0087e8:	2880218c 	ld.w	$r12,$r12,8(0x8)
1c0087ec:	29bf22cc 	st.w	$r12,$r22,-56(0xfc8)
1c0087f0:	28bd62cc 	ld.w	$r12,$r22,-168(0xf58)
1c0087f4:	2880318c 	ld.w	$r12,$r12,12(0xc)
1c0087f8:	29bf12cc 	st.w	$r12,$r22,-60(0xfc4)
1c0087fc:	28bf22cc 	ld.w	$r12,$r22,-56(0xfc8)
1c008800:	2a00018c 	ld.bu	$r12,$r12,0
1c008804:	00150184 	move	$r4,$r12
1c008808:	57fbcfff 	bl	-1076(0xffffbcc) # 1c0083d4 <a_to_n>
1c00880c:	0015008d 	move	$r13,$r4
1c008810:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c008814:	001c31b7 	mul.w	$r23,$r13,$r12
1c008818:	28bf22cc 	ld.w	$r12,$r22,-56(0xfc8)
1c00881c:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c008820:	2a00018c 	ld.bu	$r12,$r12,0
1c008824:	00150184 	move	$r4,$r12
1c008828:	57fbafff 	bl	-1108(0xffffbac) # 1c0083d4 <a_to_n>
1c00882c:	0015008c 	move	$r12,$r4
1c008830:	001032ec 	add.w	$r12,$r23,$r12
1c008834:	29bf02cc 	st.w	$r12,$r22,-64(0xfc0)
1c008838:	28bf22cc 	ld.w	$r12,$r22,-56(0xfc8)
1c00883c:	02800d8c 	addi.w	$r12,$r12,3(0x3)
1c008840:	2a00018c 	ld.bu	$r12,$r12,0
1c008844:	00150184 	move	$r4,$r12
1c008848:	57fb8fff 	bl	-1140(0xffffb8c) # 1c0083d4 <a_to_n>
1c00884c:	0015008d 	move	$r13,$r4
1c008850:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c008854:	001c31b7 	mul.w	$r23,$r13,$r12
1c008858:	28bf22cc 	ld.w	$r12,$r22,-56(0xfc8)
1c00885c:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c008860:	2a00018c 	ld.bu	$r12,$r12,0
1c008864:	00150184 	move	$r4,$r12
1c008868:	57fb6fff 	bl	-1172(0xffffb6c) # 1c0083d4 <a_to_n>
1c00886c:	0015008c 	move	$r12,$r4
1c008870:	001032ec 	add.w	$r12,$r23,$r12
1c008874:	29bef2cc 	st.w	$r12,$r22,-68(0xfbc)
1c008878:	28bf12cc 	ld.w	$r12,$r22,-60(0xfc4)
1c00887c:	2a00018c 	ld.bu	$r12,$r12,0
1c008880:	00150184 	move	$r4,$r12
1c008884:	57fb53ff 	bl	-1200(0xffffb50) # 1c0083d4 <a_to_n>
1c008888:	0015008d 	move	$r13,$r4
1c00888c:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c008890:	001c31b7 	mul.w	$r23,$r13,$r12
1c008894:	28bf12cc 	ld.w	$r12,$r22,-60(0xfc4)
1c008898:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c00889c:	2a00018c 	ld.bu	$r12,$r12,0
1c0088a0:	00150184 	move	$r4,$r12
1c0088a4:	57fb33ff 	bl	-1232(0xffffb30) # 1c0083d4 <a_to_n>
1c0088a8:	0015008c 	move	$r12,$r4
1c0088ac:	001032ec 	add.w	$r12,$r23,$r12
1c0088b0:	29bee2cc 	st.w	$r12,$r22,-72(0xfb8)
1c0088b4:	28bf12cc 	ld.w	$r12,$r22,-60(0xfc4)
1c0088b8:	02800d8c 	addi.w	$r12,$r12,3(0x3)
1c0088bc:	2a00018c 	ld.bu	$r12,$r12,0
1c0088c0:	00150184 	move	$r4,$r12
1c0088c4:	57fb13ff 	bl	-1264(0xffffb10) # 1c0083d4 <a_to_n>
1c0088c8:	0015008d 	move	$r13,$r4
1c0088cc:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c0088d0:	001c31b7 	mul.w	$r23,$r13,$r12
1c0088d4:	28bf12cc 	ld.w	$r12,$r22,-60(0xfc4)
1c0088d8:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c0088dc:	2a00018c 	ld.bu	$r12,$r12,0
1c0088e0:	00150184 	move	$r4,$r12
1c0088e4:	57faf3ff 	bl	-1296(0xffffaf0) # 1c0083d4 <a_to_n>
1c0088e8:	0015008c 	move	$r12,$r4
1c0088ec:	001032ec 	add.w	$r12,$r23,$r12
1c0088f0:	29bed2cc 	st.w	$r12,$r22,-76(0xfb4)
1c0088f4:	28bf12cc 	ld.w	$r12,$r22,-60(0xfc4)
1c0088f8:	0280198c 	addi.w	$r12,$r12,6(0x6)
1c0088fc:	2a00018c 	ld.bu	$r12,$r12,0
1c008900:	00150184 	move	$r4,$r12
1c008904:	57fad3ff 	bl	-1328(0xffffad0) # 1c0083d4 <a_to_n>
1c008908:	0015008d 	move	$r13,$r4
1c00890c:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c008910:	001c31b7 	mul.w	$r23,$r13,$r12
1c008914:	28bf12cc 	ld.w	$r12,$r22,-60(0xfc4)
1c008918:	02801d8c 	addi.w	$r12,$r12,7(0x7)
1c00891c:	2a00018c 	ld.bu	$r12,$r12,0
1c008920:	00150184 	move	$r4,$r12
1c008924:	57fab3ff 	bl	-1360(0xffffab0) # 1c0083d4 <a_to_n>
1c008928:	0015008c 	move	$r12,$r4
1c00892c:	001032ec 	add.w	$r12,$r23,$r12
1c008930:	29bec2cc 	st.w	$r12,$r22,-80(0xfb0)
1c008934:	28bf02cd 	ld.w	$r13,$r22,-64(0xfc0)
1c008938:	0280300c 	addi.w	$r12,$r0,12(0xc)
1c00893c:	68005d8d 	bltu	$r12,$r13,92(0x5c) # 1c008998 <date+0x564>
1c008940:	28bf02cc 	ld.w	$r12,$r22,-64(0xfc0)
1c008944:	40005580 	beqz	$r12,84(0x54) # 1c008998 <date+0x564>
1c008948:	28bef2cd 	ld.w	$r13,$r22,-68(0xfbc)
1c00894c:	02807c0c 	addi.w	$r12,$r0,31(0x1f)
1c008950:	6800498d 	bltu	$r12,$r13,72(0x48) # 1c008998 <date+0x564>
1c008954:	28bef2cc 	ld.w	$r12,$r22,-68(0xfbc)
1c008958:	40004180 	beqz	$r12,64(0x40) # 1c008998 <date+0x564>
1c00895c:	28bf02cd 	ld.w	$r13,$r22,-64(0xfc0)
1c008960:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c008964:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c008974 <date+0x540>
1c008968:	28bef2cd 	ld.w	$r13,$r22,-68(0xfbc)
1c00896c:	0280740c 	addi.w	$r12,$r0,29(0x1d)
1c008970:	6800298d 	bltu	$r12,$r13,40(0x28) # 1c008998 <date+0x564>
1c008974:	28bee2cd 	ld.w	$r13,$r22,-72(0xfb8)
1c008978:	0280600c 	addi.w	$r12,$r0,24(0x18)
1c00897c:	68001d8d 	bltu	$r12,$r13,28(0x1c) # 1c008998 <date+0x564>
1c008980:	28bed2cd 	ld.w	$r13,$r22,-76(0xfb4)
1c008984:	0280f00c 	addi.w	$r12,$r0,60(0x3c)
1c008988:	6800118d 	bltu	$r12,$r13,16(0x10) # 1c008998 <date+0x564>
1c00898c:	28bec2cd 	ld.w	$r13,$r22,-80(0xfb0)
1c008990:	0280f00c 	addi.w	$r12,$r0,60(0x3c)
1c008994:	6c000d8d 	bgeu	$r12,$r13,12(0xc) # 1c0089a0 <date+0x56c>
1c008998:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c00899c:	50000800 	b	8(0x8) # 1c0089a4 <date+0x570>
1c0089a0:	0015000c 	move	$r12,$r0
1c0089a4:	29beb2cc 	st.w	$r12,$r22,-84(0xfac)
1c0089a8:	28beb2cc 	ld.w	$r12,$r22,-84(0xfac)
1c0089ac:	40001980 	beqz	$r12,24(0x18) # 1c0089c4 <date+0x590>
1c0089b0:	1c000064 	pcaddu12i	$r4,3(0x3)
1c0089b4:	0293e084 	addi.w	$r4,$r4,1272(0x4f8)
1c0089b8:	579217ff 	bl	-28140(0xfff9214) # 1c001bcc <myprintf>
1c0089bc:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0089c0:	50017c00 	b	380(0x17c) # 1c008b3c <date+0x708>
1c0089c4:	28bec2cc 	ld.w	$r12,$r22,-80(0xfb0)
1c0089c8:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0089cc:	293da2cc 	st.b	$r12,$r22,-152(0xf68)
1c0089d0:	28bed2cc 	ld.w	$r12,$r22,-76(0xfb4)
1c0089d4:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0089d8:	293da6cc 	st.b	$r12,$r22,-151(0xf69)
1c0089dc:	28bee2cc 	ld.w	$r12,$r22,-72(0xfb8)
1c0089e0:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0089e4:	293daacc 	st.b	$r12,$r22,-150(0xf6a)
1c0089e8:	28bef2cc 	ld.w	$r12,$r22,-68(0xfbc)
1c0089ec:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0089f0:	293daecc 	st.b	$r12,$r22,-149(0xf6b)
1c0089f4:	28bf02cc 	ld.w	$r12,$r22,-64(0xfc0)
1c0089f8:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0089fc:	293db2cc 	st.b	$r12,$r22,-148(0xf6c)
1c008a00:	0015000c 	move	$r12,$r0
1c008a04:	50013800 	b	312(0x138) # 1c008b3c <date+0x708>
1c008a08:	28bd62cc 	ld.w	$r12,$r22,-168(0xf58)
1c008a0c:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c008a10:	2880018c 	ld.w	$r12,$r12,0
1c008a14:	28be12cd 	ld.w	$r13,$r22,-124(0xf84)
1c008a18:	001501a5 	move	$r5,$r13
1c008a1c:	00150184 	move	$r4,$r12
1c008a20:	57a037ff 	bl	-24524(0xfffa034) # 1c002a54 <strcmp>
1c008a24:	0015008c 	move	$r12,$r4
1c008a28:	44008980 	bnez	$r12,136(0x88) # 1c008ab0 <date+0x67c>
1c008a2c:	28bd62cc 	ld.w	$r12,$r22,-168(0xf58)
1c008a30:	0280218c 	addi.w	$r12,$r12,8(0x8)
1c008a34:	2880018c 	ld.w	$r12,$r12,0
1c008a38:	00150184 	move	$r4,$r12
1c008a3c:	57ef2bff 	bl	-4312(0xfffef28) # 1c007964 <str2num>
1c008a40:	29bea2c4 	st.w	$r4,$r22,-88(0xfa8)
1c008a44:	28bea2cd 	ld.w	$r13,$r22,-88(0xfa8)
1c008a48:	140000ec 	lu12i.w	$r12,7(0x7)
1c008a4c:	0394c18c 	ori	$r12,$r12,0x530
1c008a50:	0012b1ac 	sltu	$r12,$r13,$r12
1c008a54:	0067818d 	bstrpick.w	$r13,$r12,0x7,0x0
1c008a58:	28bea2ce 	ld.w	$r14,$r22,-88(0xfa8)
1c008a5c:	1400018c 	lu12i.w	$r12,12(0xc)
1c008a60:	038d458c 	ori	$r12,$r12,0x351
1c008a64:	0012b1cc 	sltu	$r12,$r14,$r12
1c008a68:	03c0058c 	xori	$r12,$r12,0x1
1c008a6c:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c008a70:	001531ac 	or	$r12,$r13,$r12
1c008a74:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c008a78:	40001980 	beqz	$r12,24(0x18) # 1c008a90 <date+0x65c>
1c008a7c:	1c000064 	pcaddu12i	$r4,3(0x3)
1c008a80:	0290f084 	addi.w	$r4,$r4,1084(0x43c)
1c008a84:	57914bff 	bl	-28344(0xfff9148) # 1c001bcc <myprintf>
1c008a88:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c008a8c:	5000b000 	b	176(0xb0) # 1c008b3c <date+0x708>
1c008a90:	28bea2cc 	ld.w	$r12,$r22,-88(0xfa8)
1c008a94:	0044918c 	srli.w	$r12,$r12,0x4
1c008a98:	29be92cc 	st.w	$r12,$r22,-92(0xfa4)
1c008a9c:	28bea2cc 	ld.w	$r12,$r22,-88(0xfa8)
1c008aa0:	03403d8c 	andi	$r12,$r12,0xf
1c008aa4:	29be82cc 	st.w	$r12,$r22,-96(0xfa0)
1c008aa8:	0015000c 	move	$r12,$r0
1c008aac:	50009000 	b	144(0x90) # 1c008b3c <date+0x708>
1c008ab0:	28bd72cd 	ld.w	$r13,$r22,-164(0xf5c)
1c008ab4:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c008ab8:	580011ac 	beq	$r13,$r12,16(0x10) # 1c008ac8 <date+0x694>
1c008abc:	1c000064 	pcaddu12i	$r4,3(0x3)
1c008ac0:	02907084 	addi.w	$r4,$r4,1052(0x41c)
1c008ac4:	57910bff 	bl	-28408(0xfff9108) # 1c001bcc <myprintf>
1c008ac8:	02bd82cc 	addi.w	$r12,$r22,-160(0xf60)
1c008acc:	00150185 	move	$r5,$r12
1c008ad0:	02800404 	addi.w	$r4,$r0,1(0x1)
1c008ad4:	57a7cbff 	bl	-22584(0xfffa7c8) # 1c00329c <RtcUpdateData>
1c008ad8:	2a3d96cc 	ld.bu	$r12,$r22,-155(0xf65)
1c008adc:	29be72cc 	st.w	$r12,$r22,-100(0xf9c)
1c008ae0:	2a3d92cc 	ld.bu	$r12,$r22,-156(0xf64)
1c008ae4:	29be62cc 	st.w	$r12,$r22,-104(0xf98)
1c008ae8:	2a3d8ecc 	ld.bu	$r12,$r22,-157(0xf63)
1c008aec:	29be52cc 	st.w	$r12,$r22,-108(0xf94)
1c008af0:	2a3d8acc 	ld.bu	$r12,$r22,-158(0xf62)
1c008af4:	29be42cc 	st.w	$r12,$r22,-112(0xf90)
1c008af8:	2a3d86cc 	ld.bu	$r12,$r22,-159(0xf61)
1c008afc:	29be32cc 	st.w	$r12,$r22,-116(0xf8c)
1c008b00:	2a3d82cc 	ld.bu	$r12,$r22,-160(0xf60)
1c008b04:	29be22cc 	st.w	$r12,$r22,-120(0xf88)
1c008b08:	28be52c7 	ld.w	$r7,$r22,-108(0xf94)
1c008b0c:	28be62c6 	ld.w	$r6,$r22,-104(0xf98)
1c008b10:	28be72c5 	ld.w	$r5,$r22,-100(0xf9c)
1c008b14:	1c000064 	pcaddu12i	$r4,3(0x3)
1c008b18:	028f6084 	addi.w	$r4,$r4,984(0x3d8)
1c008b1c:	5790b3ff 	bl	-28496(0xfff90b0) # 1c001bcc <myprintf>
1c008b20:	28be22c7 	ld.w	$r7,$r22,-120(0xf88)
1c008b24:	28be32c6 	ld.w	$r6,$r22,-116(0xf8c)
1c008b28:	28be42c5 	ld.w	$r5,$r22,-112(0xf90)
1c008b2c:	1c000064 	pcaddu12i	$r4,3(0x3)
1c008b30:	028f5084 	addi.w	$r4,$r4,980(0x3d4)
1c008b34:	57909bff 	bl	-28520(0xfff9098) # 1c001bcc <myprintf>
1c008b38:	0015000c 	move	$r12,$r0
1c008b3c:	00150184 	move	$r4,$r12
1c008b40:	2882b061 	ld.w	$r1,$r3,172(0xac)
1c008b44:	2882a076 	ld.w	$r22,$r3,168(0xa8)
1c008b48:	28829077 	ld.w	$r23,$r3,164(0xa4)
1c008b4c:	0282c063 	addi.w	$r3,$r3,176(0xb0)
1c008b50:	4c000020 	jirl	$r0,$r1,0

1c008b54 <watch_dog>:
watch_dog():
1c008b54:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c008b58:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c008b5c:	2980a076 	st.w	$r22,$r3,40(0x28)
1c008b60:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c008b64:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c008b68:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c008b6c:	28bf72c5 	ld.w	$r5,$r22,-36(0xfdc)
1c008b70:	1c000064 	pcaddu12i	$r4,3(0x3)
1c008b74:	028f0084 	addi.w	$r4,$r4,960(0x3c0)
1c008b78:	579057ff 	bl	-28588(0xfff9054) # 1c001bcc <myprintf>
1c008b7c:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c008b80:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c008b84:	60001d8d 	blt	$r12,$r13,28(0x1c) # 1c008ba0 <watch_dog+0x4c>
1c008b88:	57b4f7ff 	bl	-19212(0xfffb4f4) # 1c00407c <WDG_DogFeed>
1c008b8c:	1c000064 	pcaddu12i	$r4,3(0x3)
1c008b90:	028f1084 	addi.w	$r4,$r4,964(0x3c4)
1c008b94:	57903bff 	bl	-28616(0xfff9038) # 1c001bcc <myprintf>
1c008b98:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c008b9c:	50002800 	b	40(0x28) # 1c008bc4 <watch_dog+0x70>
1c008ba0:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c008ba4:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c008ba8:	2880018c 	ld.w	$r12,$r12,0
1c008bac:	00150184 	move	$r4,$r12
1c008bb0:	57edb7ff 	bl	-4684(0xfffedb4) # 1c007964 <str2num>
1c008bb4:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c008bb8:	28bfb2c4 	ld.w	$r4,$r22,-20(0xfec)
1c008bbc:	57b477ff 	bl	-19340(0xfffb474) # 1c004030 <WDG_SetWatchDog>
1c008bc0:	0015000c 	move	$r12,$r0
1c008bc4:	00150184 	move	$r4,$r12
1c008bc8:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c008bcc:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c008bd0:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c008bd4:	4c000020 	jirl	$r0,$r1,0

1c008bd8 <i2cp>:
i2cp():
1c008bd8:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c008bdc:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c008be0:	2980a076 	st.w	$r22,$r3,40(0x28)
1c008be4:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c008be8:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c008bec:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c008bf0:	02bfa2cc 	addi.w	$r12,$r22,-24(0xfe8)
1c008bf4:	00150184 	move	$r4,$r12
1c008bf8:	57b5b7ff 	bl	-19020(0xfffb5b4) # 1c0041ac <I2C_StructInit>
1c008bfc:	02bfa2cc 	addi.w	$r12,$r22,-24(0xfe8)
1c008c00:	00150185 	move	$r5,$r12
1c008c04:	157fd204 	lu12i.w	$r4,-262512(0xbfe90)
1c008c08:	57b4a3ff 	bl	-19296(0xfffb4a0) # 1c0040a8 <I2C_Init>
1c008c0c:	03400000 	andi	$r0,$r0,0x0
1c008c10:	00150184 	move	$r4,$r12
1c008c14:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c008c18:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c008c1c:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c008c20:	4c000020 	jirl	$r0,$r1,0

1c008c24 <i2cw>:
i2cw():
1c008c24:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c008c28:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c008c2c:	2980a076 	st.w	$r22,$r3,40(0x28)
1c008c30:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c008c34:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c008c38:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c008c3c:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c008c40:	0280100c 	addi.w	$r12,$r0,4(0x4)
1c008c44:	580019ac 	beq	$r13,$r12,24(0x18) # 1c008c5c <i2cw+0x38>
1c008c48:	1c000064 	pcaddu12i	$r4,3(0x3)
1c008c4c:	028c7084 	addi.w	$r4,$r4,796(0x31c)
1c008c50:	578f7fff 	bl	-28804(0xfff8f7c) # 1c001bcc <myprintf>
1c008c54:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c008c58:	5000c400 	b	196(0xc4) # 1c008d1c <i2cw+0xf8>
1c008c5c:	1c000064 	pcaddu12i	$r4,3(0x3)
1c008c60:	02862084 	addi.w	$r4,$r4,392(0x188)
1c008c64:	578f6bff 	bl	-28824(0xfff8f68) # 1c001bcc <myprintf>
1c008c68:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c008c6c:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c008c70:	2880018c 	ld.w	$r12,$r12,0
1c008c74:	00150184 	move	$r4,$r12
1c008c78:	57ecefff 	bl	-4884(0xfffecec) # 1c007964 <str2num>
1c008c7c:	0015008c 	move	$r12,$r4
1c008c80:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c008c84:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c008c88:	0280218c 	addi.w	$r12,$r12,8(0x8)
1c008c8c:	2880018c 	ld.w	$r12,$r12,0
1c008c90:	00150184 	move	$r4,$r12
1c008c94:	57ecd3ff 	bl	-4912(0xfffecd0) # 1c007964 <str2num>
1c008c98:	0015008c 	move	$r12,$r4
1c008c9c:	293fbacc 	st.b	$r12,$r22,-18(0xfee)
1c008ca0:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c008ca4:	0280318c 	addi.w	$r12,$r12,12(0xc)
1c008ca8:	2880018c 	ld.w	$r12,$r12,0
1c008cac:	00150184 	move	$r4,$r12
1c008cb0:	57ecb7ff 	bl	-4940(0xfffecb4) # 1c007964 <str2num>
1c008cb4:	0015008c 	move	$r12,$r4
1c008cb8:	293fb6cc 	st.b	$r12,$r22,-19(0xfed)
1c008cbc:	2a3fbecc 	ld.bu	$r12,$r22,-17(0xfef)
1c008cc0:	00409d8c 	slli.w	$r12,$r12,0x7
1c008cc4:	0000598d 	ext.w.h	$r13,$r12
1c008cc8:	2a3fbacc 	ld.bu	$r12,$r22,-18(0xfee)
1c008ccc:	0000598c 	ext.w.h	$r12,$r12
1c008cd0:	001531ac 	or	$r12,$r13,$r12
1c008cd4:	0000598c 	ext.w.h	$r12,$r12
1c008cd8:	297faacc 	st.h	$r12,$r22,-22(0xfea)
1c008cdc:	2a3fb6cc 	ld.bu	$r12,$r22,-19(0xfed)
1c008ce0:	00150185 	move	$r5,$r12
1c008ce4:	1c000064 	pcaddu12i	$r4,3(0x3)
1c008ce8:	028ab084 	addi.w	$r4,$r4,684(0x2ac)
1c008cec:	578ee3ff 	bl	-28960(0xfff8ee0) # 1c001bcc <myprintf>
1c008cf0:	2a7faacc 	ld.hu	$r12,$r22,-22(0xfea)
1c008cf4:	00150185 	move	$r5,$r12
1c008cf8:	1c000064 	pcaddu12i	$r4,3(0x3)
1c008cfc:	028a9084 	addi.w	$r4,$r4,676(0x2a4)
1c008d00:	578ecfff 	bl	-28980(0xfff8ecc) # 1c001bcc <myprintf>
1c008d04:	2a3fb6cd 	ld.bu	$r13,$r22,-19(0xfed)
1c008d08:	2a7faacc 	ld.hu	$r12,$r22,-22(0xfea)
1c008d0c:	001501a5 	move	$r5,$r13
1c008d10:	00150184 	move	$r4,$r12
1c008d14:	57b75bff 	bl	-18600(0xfffb758) # 1c00446c <CAT24_Write>
1c008d18:	0015000c 	move	$r12,$r0
1c008d1c:	00150184 	move	$r4,$r12
1c008d20:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c008d24:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c008d28:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c008d2c:	4c000020 	jirl	$r0,$r1,0

1c008d30 <i2cr>:
i2cr():
1c008d30:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c008d34:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c008d38:	2980a076 	st.w	$r22,$r3,40(0x28)
1c008d3c:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c008d40:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c008d44:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c008d48:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c008d4c:	02800c0c 	addi.w	$r12,$r0,3(0x3)
1c008d50:	580019ac 	beq	$r13,$r12,24(0x18) # 1c008d68 <i2cr+0x38>
1c008d54:	1c000064 	pcaddu12i	$r4,3(0x3)
1c008d58:	02895084 	addi.w	$r4,$r4,596(0x254)
1c008d5c:	578e73ff 	bl	-29072(0xfff8e70) # 1c001bcc <myprintf>
1c008d60:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c008d64:	50009800 	b	152(0x98) # 1c008dfc <i2cr+0xcc>
1c008d68:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c008d6c:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c008d70:	2880018c 	ld.w	$r12,$r12,0
1c008d74:	00150184 	move	$r4,$r12
1c008d78:	57ebefff 	bl	-5140(0xfffebec) # 1c007964 <str2num>
1c008d7c:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c008d80:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c008d84:	0280218c 	addi.w	$r12,$r12,8(0x8)
1c008d88:	2880018c 	ld.w	$r12,$r12,0
1c008d8c:	00150184 	move	$r4,$r12
1c008d90:	57ebd7ff 	bl	-5164(0xfffebd4) # 1c007964 <str2num>
1c008d94:	29bfa2c4 	st.w	$r4,$r22,-24(0xfe8)
1c008d98:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c008d9c:	006f818c 	bstrpick.w	$r12,$r12,0xf,0x0
1c008da0:	00409d8c 	slli.w	$r12,$r12,0x7
1c008da4:	006f818d 	bstrpick.w	$r13,$r12,0xf,0x0
1c008da8:	140000ec 	lu12i.w	$r12,7(0x7)
1c008dac:	03be018c 	ori	$r12,$r12,0xf80
1c008db0:	0014b1ac 	and	$r12,$r13,$r12
1c008db4:	006f818d 	bstrpick.w	$r13,$r12,0xf,0x0
1c008db8:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c008dbc:	006f818c 	bstrpick.w	$r12,$r12,0xf,0x0
1c008dc0:	0343fd8c 	andi	$r12,$r12,0xff
1c008dc4:	006f818c 	bstrpick.w	$r12,$r12,0xf,0x0
1c008dc8:	001531ac 	or	$r12,$r13,$r12
1c008dcc:	297f9acc 	st.h	$r12,$r22,-26(0xfe6)
1c008dd0:	2a7f9acc 	ld.hu	$r12,$r22,-26(0xfe6)
1c008dd4:	00150184 	move	$r4,$r12
1c008dd8:	57b7f3ff 	bl	-18448(0xfffb7f0) # 1c0045c8 <CAT24_Read>
1c008ddc:	0015008c 	move	$r12,$r4
1c008de0:	293f96cc 	st.b	$r12,$r22,-27(0xfe5)
1c008de4:	2a3f96cc 	ld.bu	$r12,$r22,-27(0xfe5)
1c008de8:	00150185 	move	$r5,$r12
1c008dec:	1c000064 	pcaddu12i	$r4,3(0x3)
1c008df0:	02878084 	addi.w	$r4,$r4,480(0x1e0)
1c008df4:	578ddbff 	bl	-29224(0xfff8dd8) # 1c001bcc <myprintf>
1c008df8:	0015000c 	move	$r12,$r0
1c008dfc:	00150184 	move	$r4,$r12
1c008e00:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c008e04:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c008e08:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c008e0c:	4c000020 	jirl	$r0,$r1,0

1c008e10 <adc>:
adc():
1c008e10:	02bf0063 	addi.w	$r3,$r3,-64(0xfc0)
1c008e14:	2980f061 	st.w	$r1,$r3,60(0x3c)
1c008e18:	2980e076 	st.w	$r22,$r3,56(0x38)
1c008e1c:	02810076 	addi.w	$r22,$r3,64(0x40)
1c008e20:	29bf32c4 	st.w	$r4,$r22,-52(0xfcc)
1c008e24:	29bf22c5 	st.w	$r5,$r22,-56(0xfc8)
1c008e28:	28bf22cc 	ld.w	$r12,$r22,-56(0xfc8)
1c008e2c:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c008e30:	2880018c 	ld.w	$r12,$r12,0
1c008e34:	00150184 	move	$r4,$r12
1c008e38:	57eb2fff 	bl	-5332(0xfffeb2c) # 1c007964 <str2num>
1c008e3c:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c008e40:	28bf22cc 	ld.w	$r12,$r22,-56(0xfc8)
1c008e44:	0280218c 	addi.w	$r12,$r12,8(0x8)
1c008e48:	2880018c 	ld.w	$r12,$r12,0
1c008e4c:	00150184 	move	$r4,$r12
1c008e50:	57eb17ff 	bl	-5356(0xfffeb14) # 1c007964 <str2num>
1c008e54:	29bfa2c4 	st.w	$r4,$r22,-24(0xfe8)
1c008e58:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c008e5c:	02801c0c 	addi.w	$r12,$r0,7(0x7)
1c008e60:	6800298d 	bltu	$r12,$r13,40(0x28) # 1c008e88 <adc+0x78>
1c008e64:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c008e68:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c008e6c:	68001d8d 	bltu	$r12,$r13,28(0x1c) # 1c008e88 <adc+0x78>
1c008e70:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c008e74:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c008e78:	6400118d 	bge	$r12,$r13,16(0x10) # 1c008e88 <adc+0x78>
1c008e7c:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c008e80:	0280100c 	addi.w	$r12,$r0,4(0x4)
1c008e84:	64000d8d 	bge	$r12,$r13,12(0xc) # 1c008e90 <adc+0x80>
1c008e88:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c008e8c:	50000800 	b	8(0x8) # 1c008e94 <adc+0x84>
1c008e90:	0015000c 	move	$r12,$r0
1c008e94:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c008e98:	28bf22cc 	ld.w	$r12,$r22,-56(0xfc8)
1c008e9c:	0280318c 	addi.w	$r12,$r12,12(0xc)
1c008ea0:	2880018c 	ld.w	$r12,$r12,0
1c008ea4:	00150184 	move	$r4,$r12
1c008ea8:	57eabfff 	bl	-5444(0xfffeabc) # 1c007964 <str2num>
1c008eac:	0015008c 	move	$r12,$r4
1c008eb0:	29bf72cc 	st.w	$r12,$r22,-36(0xfdc)
1c008eb4:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c008eb8:	40003180 	beqz	$r12,48(0x30) # 1c008ee8 <adc+0xd8>
1c008ebc:	1c000064 	pcaddu12i	$r4,3(0x3)
1c008ec0:	02849084 	addi.w	$r4,$r4,292(0x124)
1c008ec4:	578d0bff 	bl	-29432(0xfff8d08) # 1c001bcc <myprintf>
1c008ec8:	1c000064 	pcaddu12i	$r4,3(0x3)
1c008ecc:	0284d084 	addi.w	$r4,$r4,308(0x134)
1c008ed0:	578cffff 	bl	-29444(0xfff8cfc) # 1c001bcc <myprintf>
1c008ed4:	1c000064 	pcaddu12i	$r4,3(0x3)
1c008ed8:	02861084 	addi.w	$r4,$r4,388(0x184)
1c008edc:	578cf3ff 	bl	-29456(0xfff8cf0) # 1c001bcc <myprintf>
1c008ee0:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c008ee4:	5000bc00 	b	188(0xbc) # 1c008fa0 <adc+0x190>
1c008ee8:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c008eec:	0380118c 	ori	$r12,$r12,0x4
1c008ef0:	1400010d 	lu12i.w	$r13,8(0x8)
1c008ef4:	2980018d 	st.w	$r13,$r12,0
1c008ef8:	50007800 	b	120(0x78) # 1c008f70 <adc+0x160>
1c008efc:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c008f00:	0040918e 	slli.w	$r14,$r12,0x4
1c008f04:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c008f08:	0381b18c 	ori	$r12,$r12,0x6c
1c008f0c:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c008f10:	001035cd 	add.w	$r13,$r14,$r13
1c008f14:	2980018d 	st.w	$r13,$r12,0
1c008f18:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c008f1c:	0381b18c 	ori	$r12,$r12,0x6c
1c008f20:	2880018d 	ld.w	$r13,$r12,0
1c008f24:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c008f28:	0381b18c 	ori	$r12,$r12,0x6c
1c008f2c:	038401ad 	ori	$r13,$r13,0x100
1c008f30:	2980018d 	st.w	$r13,$r12,0
1c008f34:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c008f38:	0381c18c 	ori	$r12,$r12,0x70
1c008f3c:	2880018c 	ld.w	$r12,$r12,0
1c008f40:	29bf82cc 	st.w	$r12,$r22,-32(0xfe0)
1c008f44:	28bf82cd 	ld.w	$r13,$r22,-32(0xfe0)
1c008f48:	03b4580c 	ori	$r12,$r0,0xd16
1c008f4c:	001c31ac 	mul.w	$r12,$r13,$r12
1c008f50:	0044b18c 	srli.w	$r12,$r12,0xc
1c008f54:	00150185 	move	$r5,$r12
1c008f58:	1c000064 	pcaddu12i	$r4,3(0x3)
1c008f5c:	02845084 	addi.w	$r4,$r4,276(0x114)
1c008f60:	578c6fff 	bl	-29588(0xfff8c6c) # 1c001bcc <myprintf>
1c008f64:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c008f68:	02bffd8c 	addi.w	$r12,$r12,-1(0xfff)
1c008f6c:	29bf72cc 	st.w	$r12,$r22,-36(0xfdc)
1c008f70:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c008f74:	47ff899f 	bnez	$r12,-120(0x7fff88) # 1c008efc <adc+0xec>
1c008f78:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c008f7c:	0380118c 	ori	$r12,$r12,0x4
1c008f80:	2880018e 	ld.w	$r14,$r12,0
1c008f84:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c008f88:	0380118c 	ori	$r12,$r12,0x4
1c008f8c:	15fffeed 	lu12i.w	$r13,-9(0xffff7)
1c008f90:	03bffdad 	ori	$r13,$r13,0xfff
1c008f94:	0014b5cd 	and	$r13,$r14,$r13
1c008f98:	2980018d 	st.w	$r13,$r12,0
1c008f9c:	0015000c 	move	$r12,$r0
1c008fa0:	00150184 	move	$r4,$r12
1c008fa4:	2880f061 	ld.w	$r1,$r3,60(0x3c)
1c008fa8:	2880e076 	ld.w	$r22,$r3,56(0x38)
1c008fac:	02810063 	addi.w	$r3,$r3,64(0x40)
1c008fb0:	4c000020 	jirl	$r0,$r1,0

1c008fb4 <batdet>:
batdet():
1c008fb4:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c008fb8:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c008fbc:	2980a076 	st.w	$r22,$r3,40(0x28)
1c008fc0:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c008fc4:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c008fc8:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c008fcc:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c008fd0:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c008fd4:	580019ac 	beq	$r13,$r12,24(0x18) # 1c008fec <batdet+0x38>
1c008fd8:	1c000064 	pcaddu12i	$r4,3(0x3)
1c008fdc:	02829084 	addi.w	$r4,$r4,164(0xa4)
1c008fe0:	578befff 	bl	-29716(0xfff8bec) # 1c001bcc <myprintf>
1c008fe4:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c008fe8:	50012800 	b	296(0x128) # 1c009110 <batdet+0x15c>
1c008fec:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c008ff0:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c008ff4:	2880018c 	ld.w	$r12,$r12,0
1c008ff8:	00150184 	move	$r4,$r12
1c008ffc:	57e96bff 	bl	-5784(0xfffe968) # 1c007964 <str2num>
1c009000:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c009004:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c009008:	44001d80 	bnez	$r12,28(0x1c) # 1c009024 <batdet+0x70>
1c00900c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c009010:	2880018e 	ld.w	$r14,$r12,0
1c009014:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c009018:	1400040d 	lu12i.w	$r13,32(0x20)
1c00901c:	001535cd 	or	$r13,$r14,$r13
1c009020:	2980018d 	st.w	$r13,$r12,0
1c009024:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c009028:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c00902c:	6800bd8d 	bltu	$r12,$r13,188(0xbc) # 1c0090e8 <batdet+0x134>
1c009030:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c009034:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c009038:	58003dac 	beq	$r13,$r12,60(0x3c) # 1c009074 <batdet+0xc0>
1c00903c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c009040:	40001580 	beqz	$r12,20(0x14) # 1c009054 <batdet+0xa0>
1c009044:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c009048:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c00904c:	580061ac 	beq	$r13,$r12,96(0x60) # 1c0090ac <batdet+0xf8>
1c009050:	5000ac00 	b	172(0xac) # 1c0090fc <batdet+0x148>
1c009054:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c009058:	2880018e 	ld.w	$r14,$r12,0
1c00905c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c009060:	15f9ffed 	lu12i.w	$r13,-12289(0xfcfff)
1c009064:	03bffdad 	ori	$r13,$r13,0xfff
1c009068:	0014b5cd 	and	$r13,$r14,$r13
1c00906c:	2980018d 	st.w	$r13,$r12,0
1c009070:	50008c00 	b	140(0x8c) # 1c0090fc <batdet+0x148>
1c009074:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c009078:	2880018e 	ld.w	$r14,$r12,0
1c00907c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c009080:	15f9ffed 	lu12i.w	$r13,-12289(0xfcfff)
1c009084:	03bffdad 	ori	$r13,$r13,0xfff
1c009088:	0014b5cd 	and	$r13,$r14,$r13
1c00908c:	2980018d 	st.w	$r13,$r12,0
1c009090:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c009094:	2880018e 	ld.w	$r14,$r12,0
1c009098:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00909c:	1404000d 	lu12i.w	$r13,8192(0x2000)
1c0090a0:	001535cd 	or	$r13,$r14,$r13
1c0090a4:	2980018d 	st.w	$r13,$r12,0
1c0090a8:	50005400 	b	84(0x54) # 1c0090fc <batdet+0x148>
1c0090ac:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0090b0:	2880018e 	ld.w	$r14,$r12,0
1c0090b4:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0090b8:	15f9ffed 	lu12i.w	$r13,-12289(0xfcfff)
1c0090bc:	03bffdad 	ori	$r13,$r13,0xfff
1c0090c0:	0014b5cd 	and	$r13,$r14,$r13
1c0090c4:	2980018d 	st.w	$r13,$r12,0
1c0090c8:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0090cc:	2880018e 	ld.w	$r14,$r12,0
1c0090d0:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0090d4:	1406000d 	lu12i.w	$r13,12288(0x3000)
1c0090d8:	001535cd 	or	$r13,$r14,$r13
1c0090dc:	2980018d 	st.w	$r13,$r12,0
1c0090e0:	03400000 	andi	$r0,$r0,0x0
1c0090e4:	50001800 	b	24(0x18) # 1c0090fc <batdet+0x148>
1c0090e8:	1c000064 	pcaddu12i	$r4,3(0x3)
1c0090ec:	02bf1084 	addi.w	$r4,$r4,-60(0xfc4)
1c0090f0:	578adfff 	bl	-29988(0xfff8adc) # 1c001bcc <myprintf>
1c0090f4:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0090f8:	50001800 	b	24(0x18) # 1c009110 <batdet+0x15c>
1c0090fc:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c009100:	0380118c 	ori	$r12,$r12,0x4
1c009104:	03a0000d 	ori	$r13,$r0,0x800
1c009108:	2980018d 	st.w	$r13,$r12,0
1c00910c:	0015000c 	move	$r12,$r0
1c009110:	00150184 	move	$r4,$r12
1c009114:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c009118:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c00911c:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c009120:	4c000020 	jirl	$r0,$r1,0

1c009124 <copy>:
copy():
1c009124:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c009128:	29807061 	st.w	$r1,$r3,28(0x1c)
1c00912c:	29806076 	st.w	$r22,$r3,24(0x18)
1c009130:	02808076 	addi.w	$r22,$r3,32(0x20)
1c009134:	157fcc0c 	lu12i.w	$r12,-262560(0xbfe60)
1c009138:	0380118c 	ori	$r12,$r12,0x4
1c00913c:	02bffc0d 	addi.w	$r13,$r0,-1(0xfff)
1c009140:	2980018d 	st.w	$r13,$r12,0
1c009144:	157fcc0c 	lu12i.w	$r12,-262560(0xbfe60)
1c009148:	0380218c 	ori	$r12,$r12,0x8
1c00914c:	02bffc0d 	addi.w	$r13,$r0,-1(0xfff)
1c009150:	2980018d 	st.w	$r13,$r12,0
1c009154:	157fcc0c 	lu12i.w	$r12,-262560(0xbfe60)
1c009158:	0380618c 	ori	$r12,$r12,0x18
1c00915c:	0280400d 	addi.w	$r13,$r0,16(0x10)
1c009160:	2980018d 	st.w	$r13,$r12,0
1c009164:	157e000c 	lu12i.w	$r12,-266240(0xbf000)
1c009168:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c00916c:	5000b000 	b	176(0xb0) # 1c00921c <copy+0xf8>
1c009170:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c009174:	140007ec 	lu12i.w	$r12,63(0x3f)
1c009178:	03bffd8c 	ori	$r12,$r12,0xfff
1c00917c:	0014b1ae 	and	$r14,$r13,$r12
1c009180:	157fcc0c 	lu12i.w	$r12,-262560(0xbfe60)
1c009184:	1540000d 	lu12i.w	$r13,-393216(0xa0000)
1c009188:	001535cd 	or	$r13,$r14,$r13
1c00918c:	2980018d 	st.w	$r13,$r12,0
1c009190:	57aeefff 	bl	-20756(0xfffaeec) # 1c00407c <WDG_DogFeed>
1c009194:	1c000064 	pcaddu12i	$r4,3(0x3)
1c009198:	02bcb084 	addi.w	$r4,$r4,-212(0xf2c)
1c00919c:	578a33ff 	bl	-30160(0xfff8a30) # 1c001bcc <myprintf>
1c0091a0:	157fcc0c 	lu12i.w	$r12,-262560(0xbfe60)
1c0091a4:	1480000d 	lu12i.w	$r13,262144(0x40000)
1c0091a8:	2980018d 	st.w	$r13,$r12,0
1c0091ac:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0091b0:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0091b4:	50002c00 	b	44(0x2c) # 1c0091e0 <copy+0xbc>
1c0091b8:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c0091bc:	15fe000c 	lu12i.w	$r12,-4096(0xff000)
1c0091c0:	001031ac 	add.w	$r12,$r13,$r12
1c0091c4:	0015018d 	move	$r13,$r12
1c0091c8:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0091cc:	288001ad 	ld.w	$r13,$r13,0
1c0091d0:	2980018d 	st.w	$r13,$r12,0
1c0091d4:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0091d8:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c0091dc:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0091e0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0091e4:	0281fd8c 	addi.w	$r12,$r12,127(0x7f)
1c0091e8:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c0091ec:	67ffcd8d 	bge	$r12,$r13,-52(0x3ffcc) # 1c0091b8 <copy+0x94>
1c0091f0:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c0091f4:	140007ec 	lu12i.w	$r12,63(0x3f)
1c0091f8:	03bffd8c 	ori	$r12,$r12,0xfff
1c0091fc:	0014b1ae 	and	$r14,$r13,$r12
1c009200:	157fcc0c 	lu12i.w	$r12,-262560(0xbfe60)
1c009204:	15c0000d 	lu12i.w	$r13,-131072(0xe0000)
1c009208:	001535cd 	or	$r13,$r14,$r13
1c00920c:	2980018d 	st.w	$r13,$r12,0
1c009210:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c009214:	0282018c 	addi.w	$r12,$r12,128(0x80)
1c009218:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c00921c:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c009220:	157e040c 	lu12i.w	$r12,-266208(0xbf020)
1c009224:	6bff4dac 	bltu	$r13,$r12,-180(0x3ff4c) # 1c009170 <copy+0x4c>
1c009228:	157e000c 	lu12i.w	$r12,-266240(0xbf000)
1c00922c:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c009230:	50006000 	b	96(0x60) # 1c009290 <copy+0x16c>
1c009234:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c009238:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c00923c:	50003800 	b	56(0x38) # 1c009274 <copy+0x150>
1c009240:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c009244:	2880018d 	ld.w	$r13,$r12,0
1c009248:	28bfa2ce 	ld.w	$r14,$r22,-24(0xfe8)
1c00924c:	15fe000c 	lu12i.w	$r12,-4096(0xff000)
1c009250:	001031cc 	add.w	$r12,$r14,$r12
1c009254:	2880018c 	ld.w	$r12,$r12,0
1c009258:	580011ac 	beq	$r13,$r12,16(0x10) # 1c009268 <copy+0x144>
1c00925c:	1c000064 	pcaddu12i	$r4,3(0x3)
1c009260:	02b9a084 	addi.w	$r4,$r4,-408(0xe68)
1c009264:	57896bff 	bl	-30360(0xfff8968) # 1c001bcc <myprintf>
1c009268:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c00926c:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c009270:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c009274:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c009278:	0281fd8c 	addi.w	$r12,$r12,127(0x7f)
1c00927c:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c009280:	67ffc18d 	bge	$r12,$r13,-64(0x3ffc0) # 1c009240 <copy+0x11c>
1c009284:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c009288:	0282018c 	addi.w	$r12,$r12,128(0x80)
1c00928c:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c009290:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c009294:	157e040c 	lu12i.w	$r12,-266208(0xbf020)
1c009298:	6bff9dac 	bltu	$r13,$r12,-100(0x3ff9c) # 1c009234 <copy+0x110>
1c00929c:	0015000c 	move	$r12,$r0
1c0092a0:	00150184 	move	$r4,$r12
1c0092a4:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c0092a8:	28806076 	ld.w	$r22,$r3,24(0x18)
1c0092ac:	02808063 	addi.w	$r3,$r3,32(0x20)
1c0092b0:	4c000020 	jirl	$r0,$r1,0

1c0092b4 <uart_init>:
uart_init():
1c0092b4:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c0092b8:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c0092bc:	2980a076 	st.w	$r22,$r3,40(0x28)
1c0092c0:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c0092c4:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c0092c8:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c0092cc:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c0092d0:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c0092d4:	580019ac 	beq	$r13,$r12,24(0x18) # 1c0092ec <uart_init+0x38>
1c0092d8:	1c000064 	pcaddu12i	$r4,3(0x3)
1c0092dc:	02b7e084 	addi.w	$r4,$r4,-520(0xdf8)
1c0092e0:	5788efff 	bl	-30484(0xfff88ec) # 1c001bcc <myprintf>
1c0092e4:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0092e8:	50006400 	b	100(0x64) # 1c00934c <uart_init+0x98>
1c0092ec:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c0092f0:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c0092f4:	2880018c 	ld.w	$r12,$r12,0
1c0092f8:	00150184 	move	$r4,$r12
1c0092fc:	57e66bff 	bl	-6552(0xfffe668) # 1c007964 <str2num>
1c009300:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c009304:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c009308:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c00930c:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c00931c <uart_init+0x68>
1c009310:	157fd104 	lu12i.w	$r4,-262520(0xbfe88)
1c009314:	578c5fff 	bl	-29604(0xfff8c5c) # 1c001f70 <Uart_init>
1c009318:	50003000 	b	48(0x30) # 1c009348 <uart_init+0x94>
1c00931c:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c009320:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c009324:	5c0011ac 	bne	$r13,$r12,16(0x10) # 1c009334 <uart_init+0x80>
1c009328:	157fd184 	lu12i.w	$r4,-262516(0xbfe8c)
1c00932c:	578c47ff 	bl	-29628(0xfff8c44) # 1c001f70 <Uart_init>
1c009330:	50001800 	b	24(0x18) # 1c009348 <uart_init+0x94>
1c009334:	1c000064 	pcaddu12i	$r4,3(0x3)
1c009338:	02b67084 	addi.w	$r4,$r4,-612(0xd9c)
1c00933c:	578893ff 	bl	-30576(0xfff8890) # 1c001bcc <myprintf>
1c009340:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c009344:	50000800 	b	8(0x8) # 1c00934c <uart_init+0x98>
1c009348:	0015000c 	move	$r12,$r0
1c00934c:	00150184 	move	$r4,$r12
1c009350:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c009354:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c009358:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c00935c:	4c000020 	jirl	$r0,$r1,0

1c009360 <spi_init>:
spi_init():
1c009360:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c009364:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c009368:	2980a076 	st.w	$r22,$r3,40(0x28)
1c00936c:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c009370:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c009374:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c009378:	157fce0c 	lu12i.w	$r12,-262544(0xbfe70)
1c00937c:	0281480d 	addi.w	$r13,$r0,82(0x52)
1c009380:	2900018d 	st.b	$r13,$r12,0
1c009384:	157fce0c 	lu12i.w	$r12,-262544(0xbfe70)
1c009388:	0280800d 	addi.w	$r13,$r0,32(0x20)
1c00938c:	2900118d 	st.b	$r13,$r12,4(0x4)
1c009390:	5783fbff 	bl	-31752(0xfff83f8) # 1c001788 <Spiflash_Rdid>
1c009394:	0015008c 	move	$r12,$r4
1c009398:	297fbacc 	st.h	$r12,$r22,-18(0xfee)
1c00939c:	2a7fbacc 	ld.hu	$r12,$r22,-18(0xfee)
1c0093a0:	00150185 	move	$r5,$r12
1c0093a4:	1c000064 	pcaddu12i	$r4,3(0x3)
1c0093a8:	02b51084 	addi.w	$r4,$r4,-700(0xd44)
1c0093ac:	578823ff 	bl	-30688(0xfff8820) # 1c001bcc <myprintf>
1c0093b0:	03400000 	andi	$r0,$r0,0x0
1c0093b4:	00150184 	move	$r4,$r12
1c0093b8:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c0093bc:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c0093c0:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c0093c4:	4c000020 	jirl	$r0,$r1,0

1c0093c8 <spi_write>:
spi_write():
1c0093c8:	02bf0063 	addi.w	$r3,$r3,-64(0xfc0)
1c0093cc:	2980f061 	st.w	$r1,$r3,60(0x3c)
1c0093d0:	2980e076 	st.w	$r22,$r3,56(0x38)
1c0093d4:	02810076 	addi.w	$r22,$r3,64(0x40)
1c0093d8:	29bf32c4 	st.w	$r4,$r22,-52(0xfcc)
1c0093dc:	29bf22c5 	st.w	$r5,$r22,-56(0xfc8)
1c0093e0:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c0093e4:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c0093e8:	580019ac 	beq	$r13,$r12,24(0x18) # 1c009400 <spi_write+0x38>
1c0093ec:	1c000064 	pcaddu12i	$r4,3(0x3)
1c0093f0:	02b42084 	addi.w	$r4,$r4,-760(0xd08)
1c0093f4:	5787dbff 	bl	-30760(0xfff87d8) # 1c001bcc <myprintf>
1c0093f8:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0093fc:	5000e800 	b	232(0xe8) # 1c0094e4 <spi_write+0x11c>
1c009400:	28bf22cc 	ld.w	$r12,$r22,-56(0xfc8)
1c009404:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c009408:	2880018c 	ld.w	$r12,$r12,0
1c00940c:	00150184 	move	$r4,$r12
1c009410:	57e557ff 	bl	-6828(0xfffe554) # 1c007964 <str2num>
1c009414:	29bf92c4 	st.w	$r4,$r22,-28(0xfe4)
1c009418:	29bf82c0 	st.w	$r0,$r22,-32(0xfe0)
1c00941c:	1c000064 	pcaddu12i	$r4,3(0x3)
1c009420:	02b3d084 	addi.w	$r4,$r4,-780(0xcf4)
1c009424:	5787abff 	bl	-30808(0xfff87a8) # 1c001bcc <myprintf>
1c009428:	0288000c 	addi.w	$r12,$r0,512(0x200)
1c00942c:	29bf72cc 	st.w	$r12,$r22,-36(0xfdc)
1c009430:	29bfa2c0 	st.w	$r0,$r22,-24(0xfe8)
1c009434:	50009400 	b	148(0x94) # 1c0094c8 <spi_write+0x100>
1c009438:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c00943c:	0040a18c 	slli.w	$r12,$r12,0x8
1c009440:	29bf82cc 	st.w	$r12,$r22,-32(0xfe0)
1c009444:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c009448:	50004000 	b	64(0x40) # 1c009488 <spi_write+0xc0>
1c00944c:	28bf82cd 	ld.w	$r13,$r22,-32(0xfe0)
1c009450:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c009454:	001031ad 	add.w	$r13,$r13,$r12
1c009458:	157e000c 	lu12i.w	$r12,-266240(0xbf000)
1c00945c:	001031ac 	add.w	$r12,$r13,$r12
1c009460:	0015018e 	move	$r14,$r12
1c009464:	28bf62cd 	ld.w	$r13,$r22,-40(0xfd8)
1c009468:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00946c:	001031ac 	add.w	$r12,$r13,$r12
1c009470:	2a0001cd 	ld.bu	$r13,$r14,0
1c009474:	006781ad 	bstrpick.w	$r13,$r13,0x7,0x0
1c009478:	2900018d 	st.b	$r13,$r12,0
1c00947c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c009480:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c009484:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c009488:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c00948c:	0283fc0c 	addi.w	$r12,$r0,255(0xff)
1c009490:	6fffbd8d 	bgeu	$r12,$r13,-68(0x3ffbc) # 1c00944c <spi_write+0x84>
1c009494:	1c000064 	pcaddu12i	$r4,3(0x3)
1c009498:	02b23084 	addi.w	$r4,$r4,-884(0xc8c)
1c00949c:	578733ff 	bl	-30928(0xfff8730) # 1c001bcc <myprintf>
1c0094a0:	28bf92cd 	ld.w	$r13,$r22,-28(0xfe4)
1c0094a4:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c0094a8:	001031ac 	add.w	$r12,$r13,$r12
1c0094ac:	02840006 	addi.w	$r6,$r0,256(0x100)
1c0094b0:	28bf62c5 	ld.w	$r5,$r22,-40(0xfd8)
1c0094b4:	00150184 	move	$r4,$r12
1c0094b8:	5783cbff 	bl	-31800(0xfff83c8) # 1c001880 <Spiflash_Page_Program>
1c0094bc:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c0094c0:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0094c4:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0094c8:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c0094cc:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c0094d0:	6bff69ac 	bltu	$r13,$r12,-152(0x3ff68) # 1c009438 <spi_write+0x70>
1c0094d4:	1c000064 	pcaddu12i	$r4,3(0x3)
1c0094d8:	02b14084 	addi.w	$r4,$r4,-944(0xc50)
1c0094dc:	5786f3ff 	bl	-30992(0xfff86f0) # 1c001bcc <myprintf>
1c0094e0:	0015000c 	move	$r12,$r0
1c0094e4:	00150184 	move	$r4,$r12
1c0094e8:	2880f061 	ld.w	$r1,$r3,60(0x3c)
1c0094ec:	2880e076 	ld.w	$r22,$r3,56(0x38)
1c0094f0:	02810063 	addi.w	$r3,$r3,64(0x40)
1c0094f4:	4c000020 	jirl	$r0,$r1,0

1c0094f8 <spi_read>:
spi_read():
1c0094f8:	02bf0063 	addi.w	$r3,$r3,-64(0xfc0)
1c0094fc:	2980f061 	st.w	$r1,$r3,60(0x3c)
1c009500:	2980e076 	st.w	$r22,$r3,56(0x38)
1c009504:	02810076 	addi.w	$r22,$r3,64(0x40)
1c009508:	29bf32c4 	st.w	$r4,$r22,-52(0xfcc)
1c00950c:	29bf22c5 	st.w	$r5,$r22,-56(0xfc8)
1c009510:	28bf32cd 	ld.w	$r13,$r22,-52(0xfcc)
1c009514:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c009518:	580019ac 	beq	$r13,$r12,24(0x18) # 1c009530 <spi_read+0x38>
1c00951c:	1c000064 	pcaddu12i	$r4,3(0x3)
1c009520:	02b03084 	addi.w	$r4,$r4,-1012(0xc0c)
1c009524:	5786abff 	bl	-31064(0xfff86a8) # 1c001bcc <myprintf>
1c009528:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c00952c:	50012800 	b	296(0x128) # 1c009654 <spi_read+0x15c>
1c009530:	28bf22cc 	ld.w	$r12,$r22,-56(0xfc8)
1c009534:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c009538:	2880018c 	ld.w	$r12,$r12,0
1c00953c:	00150184 	move	$r4,$r12
1c009540:	57e427ff 	bl	-7132(0xfffe424) # 1c007964 <str2num>
1c009544:	29bf92c4 	st.w	$r4,$r22,-28(0xfe4)
1c009548:	29bf82c0 	st.w	$r0,$r22,-32(0xfe0)
1c00954c:	1c000064 	pcaddu12i	$r4,3(0x3)
1c009550:	02afd084 	addi.w	$r4,$r4,-1036(0xbf4)
1c009554:	57867bff 	bl	-31112(0xfff8678) # 1c001bcc <myprintf>
1c009558:	0288000c 	addi.w	$r12,$r0,512(0x200)
1c00955c:	29bf72cc 	st.w	$r12,$r22,-36(0xfdc)
1c009560:	29bfa2c0 	st.w	$r0,$r22,-24(0xfe8)
1c009564:	5000d400 	b	212(0xd4) # 1c009638 <spi_read+0x140>
1c009568:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c00956c:	0040a18c 	slli.w	$r12,$r12,0x8
1c009570:	29bf82cc 	st.w	$r12,$r22,-32(0xfe0)
1c009574:	28bf92cd 	ld.w	$r13,$r22,-28(0xfe4)
1c009578:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c00957c:	001031ac 	add.w	$r12,$r13,$r12
1c009580:	02840006 	addi.w	$r6,$r0,256(0x100)
1c009584:	28bf62c5 	ld.w	$r5,$r22,-40(0xfd8)
1c009588:	00150184 	move	$r4,$r12
1c00958c:	57839bff 	bl	-31848(0xfff8398) # 1c001924 <Spiflash_Read_Bytes>
1c009590:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c009594:	50008000 	b	128(0x80) # 1c009614 <spi_read+0x11c>
1c009598:	28bf62cd 	ld.w	$r13,$r22,-40(0xfd8)
1c00959c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0095a0:	001031ac 	add.w	$r12,$r13,$r12
1c0095a4:	2a00018d 	ld.bu	$r13,$r12,0
1c0095a8:	28bf82ce 	ld.w	$r14,$r22,-32(0xfe0)
1c0095ac:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0095b0:	001031ce 	add.w	$r14,$r14,$r12
1c0095b4:	157e000c 	lu12i.w	$r12,-266240(0xbf000)
1c0095b8:	001031cc 	add.w	$r12,$r14,$r12
1c0095bc:	2a00018c 	ld.bu	$r12,$r12,0
1c0095c0:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0095c4:	580045ac 	beq	$r13,$r12,68(0x44) # 1c009608 <spi_read+0x110>
1c0095c8:	28bf62cd 	ld.w	$r13,$r22,-40(0xfd8)
1c0095cc:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0095d0:	001031ac 	add.w	$r12,$r13,$r12
1c0095d4:	2a00018c 	ld.bu	$r12,$r12,0
1c0095d8:	0015018e 	move	$r14,$r12
1c0095dc:	28bf82cd 	ld.w	$r13,$r22,-32(0xfe0)
1c0095e0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0095e4:	001031ad 	add.w	$r13,$r13,$r12
1c0095e8:	157e000c 	lu12i.w	$r12,-266240(0xbf000)
1c0095ec:	001031ac 	add.w	$r12,$r13,$r12
1c0095f0:	00150186 	move	$r6,$r12
1c0095f4:	001501c5 	move	$r5,$r14
1c0095f8:	1c000064 	pcaddu12i	$r4,3(0x3)
1c0095fc:	02ad6084 	addi.w	$r4,$r4,-1192(0xb58)
1c009600:	5785cfff 	bl	-31284(0xfff85cc) # 1c001bcc <myprintf>
1c009604:	50001c00 	b	28(0x1c) # 1c009620 <spi_read+0x128>
1c009608:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00960c:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c009610:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c009614:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c009618:	0283fc0c 	addi.w	$r12,$r0,255(0xff)
1c00961c:	6fff7d8d 	bgeu	$r12,$r13,-132(0x3ff7c) # 1c009598 <spi_read+0xa0>
1c009620:	1c000064 	pcaddu12i	$r4,3(0x3)
1c009624:	02ac0084 	addi.w	$r4,$r4,-1280(0xb00)
1c009628:	5785a7ff 	bl	-31324(0xfff85a4) # 1c001bcc <myprintf>
1c00962c:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c009630:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c009634:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c009638:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c00963c:	28bf72cc 	ld.w	$r12,$r22,-36(0xfdc)
1c009640:	6bff29ac 	bltu	$r13,$r12,-216(0x3ff28) # 1c009568 <spi_read+0x70>
1c009644:	1c000064 	pcaddu12i	$r4,3(0x3)
1c009648:	02ab8084 	addi.w	$r4,$r4,-1312(0xae0)
1c00964c:	578583ff 	bl	-31360(0xfff8580) # 1c001bcc <myprintf>
1c009650:	0015000c 	move	$r12,$r0
1c009654:	00150184 	move	$r4,$r12
1c009658:	2880f061 	ld.w	$r1,$r3,60(0x3c)
1c00965c:	2880e076 	ld.w	$r22,$r3,56(0x38)
1c009660:	02810063 	addi.w	$r3,$r3,64(0x40)
1c009664:	4c000020 	jirl	$r0,$r1,0

1c009668 <spi_erase>:
spi_erase():
1c009668:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c00966c:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c009670:	2980a076 	st.w	$r22,$r3,40(0x28)
1c009674:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c009678:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c00967c:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c009680:	28bf72cd 	ld.w	$r13,$r22,-36(0xfdc)
1c009684:	0280080c 	addi.w	$r12,$r0,2(0x2)
1c009688:	580019ac 	beq	$r13,$r12,24(0x18) # 1c0096a0 <spi_erase+0x38>
1c00968c:	1c000064 	pcaddu12i	$r4,3(0x3)
1c009690:	02ab9084 	addi.w	$r4,$r4,-1308(0xae4)
1c009694:	57853bff 	bl	-31432(0xfff8538) # 1c001bcc <myprintf>
1c009698:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c00969c:	50004800 	b	72(0x48) # 1c0096e4 <spi_erase+0x7c>
1c0096a0:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c0096a4:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c0096a8:	2880018c 	ld.w	$r12,$r12,0
1c0096ac:	00150184 	move	$r4,$r12
1c0096b0:	57e2b7ff 	bl	-7500(0xfffe2b4) # 1c007964 <str2num>
1c0096b4:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c0096b8:	1c000064 	pcaddu12i	$r4,3(0x3)
1c0096bc:	02ab5084 	addi.w	$r4,$r4,-1324(0xad4)
1c0096c0:	57850fff 	bl	-31476(0xfff850c) # 1c001bcc <myprintf>
1c0096c4:	28bfb2c4 	ld.w	$r4,$r22,-20(0xfec)
1c0096c8:	57812bff 	bl	-32472(0xfff8128) # 1c0017f0 <Spiflash_Block64k_Erase>
1c0096cc:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c0096d0:	1400020c 	lu12i.w	$r12,16(0x10)
1c0096d4:	001031ac 	add.w	$r12,$r13,$r12
1c0096d8:	00150184 	move	$r4,$r12
1c0096dc:	578117ff 	bl	-32492(0xfff8114) # 1c0017f0 <Spiflash_Block64k_Erase>
1c0096e0:	0015000c 	move	$r12,$r0
1c0096e4:	00150184 	move	$r4,$r12
1c0096e8:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c0096ec:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c0096f0:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c0096f4:	4c000020 	jirl	$r0,$r1,0

1c0096f8 <spi_flash>:
spi_flash():
1c0096f8:	02bf0063 	addi.w	$r3,$r3,-64(0xfc0)
1c0096fc:	2980f061 	st.w	$r1,$r3,60(0x3c)
1c009700:	2980e076 	st.w	$r22,$r3,56(0x38)
1c009704:	02810076 	addi.w	$r22,$r3,64(0x40)
1c009708:	29bf32c4 	st.w	$r4,$r22,-52(0xfcc)
1c00970c:	29bf22c5 	st.w	$r5,$r22,-56(0xfc8)
1c009710:	29bf92c0 	st.w	$r0,$r22,-28(0xfe4)
1c009714:	29bf82c0 	st.w	$r0,$r22,-32(0xfe0)
1c009718:	157fce0c 	lu12i.w	$r12,-262544(0xbfe70)
1c00971c:	0281480d 	addi.w	$r13,$r0,82(0x52)
1c009720:	2900018d 	st.b	$r13,$r12,0
1c009724:	157fce0c 	lu12i.w	$r12,-262544(0xbfe70)
1c009728:	0280800d 	addi.w	$r13,$r0,32(0x20)
1c00972c:	2900118d 	st.b	$r13,$r12,4(0x4)
1c009730:	57805bff 	bl	-32680(0xfff8058) # 1c001788 <Spiflash_Rdid>
1c009734:	0015008c 	move	$r12,$r4
1c009738:	297f7acc 	st.h	$r12,$r22,-34(0xfde)
1c00973c:	2a7f7acc 	ld.hu	$r12,$r22,-34(0xfde)
1c009740:	00150185 	move	$r5,$r12
1c009744:	1c000064 	pcaddu12i	$r4,3(0x3)
1c009748:	02a69084 	addi.w	$r4,$r4,-1628(0x9a4)
1c00974c:	578483ff 	bl	-31616(0xfff8480) # 1c001bcc <myprintf>
1c009750:	28bf92c4 	ld.w	$r4,$r22,-28(0xfe4)
1c009754:	57809fff 	bl	-32612(0xfff809c) # 1c0017f0 <Spiflash_Block64k_Erase>
1c009758:	28bf92cd 	ld.w	$r13,$r22,-28(0xfe4)
1c00975c:	1400020c 	lu12i.w	$r12,16(0x10)
1c009760:	001031ac 	add.w	$r12,$r13,$r12
1c009764:	00150184 	move	$r4,$r12
1c009768:	57808bff 	bl	-32632(0xfff8088) # 1c0017f0 <Spiflash_Block64k_Erase>
1c00976c:	1c000064 	pcaddu12i	$r4,3(0x3)
1c009770:	02a8c084 	addi.w	$r4,$r4,-1488(0xa30)
1c009774:	57845bff 	bl	-31656(0xfff8458) # 1c001bcc <myprintf>
1c009778:	0288000c 	addi.w	$r12,$r0,512(0x200)
1c00977c:	29bf62cc 	st.w	$r12,$r22,-40(0xfd8)
1c009780:	29bfa2c0 	st.w	$r0,$r22,-24(0xfe8)
1c009784:	50009400 	b	148(0x94) # 1c009818 <spi_flash+0x120>
1c009788:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c00978c:	0040a18c 	slli.w	$r12,$r12,0x8
1c009790:	29bf82cc 	st.w	$r12,$r22,-32(0xfe0)
1c009794:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c009798:	50004000 	b	64(0x40) # 1c0097d8 <spi_flash+0xe0>
1c00979c:	28bf82cd 	ld.w	$r13,$r22,-32(0xfe0)
1c0097a0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0097a4:	001031ad 	add.w	$r13,$r13,$r12
1c0097a8:	157e000c 	lu12i.w	$r12,-266240(0xbf000)
1c0097ac:	001031ac 	add.w	$r12,$r13,$r12
1c0097b0:	0015018e 	move	$r14,$r12
1c0097b4:	28bf52cd 	ld.w	$r13,$r22,-44(0xfd4)
1c0097b8:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0097bc:	001031ac 	add.w	$r12,$r13,$r12
1c0097c0:	2a0001cd 	ld.bu	$r13,$r14,0
1c0097c4:	006781ad 	bstrpick.w	$r13,$r13,0x7,0x0
1c0097c8:	2900018d 	st.b	$r13,$r12,0
1c0097cc:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0097d0:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0097d4:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0097d8:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c0097dc:	0283fc0c 	addi.w	$r12,$r0,255(0xff)
1c0097e0:	6fffbd8d 	bgeu	$r12,$r13,-68(0x3ffbc) # 1c00979c <spi_flash+0xa4>
1c0097e4:	28bf92cd 	ld.w	$r13,$r22,-28(0xfe4)
1c0097e8:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c0097ec:	001031ac 	add.w	$r12,$r13,$r12
1c0097f0:	02840006 	addi.w	$r6,$r0,256(0x100)
1c0097f4:	28bf52c5 	ld.w	$r5,$r22,-44(0xfd4)
1c0097f8:	00150184 	move	$r4,$r12
1c0097fc:	578087ff 	bl	-32636(0xfff8084) # 1c001880 <Spiflash_Page_Program>
1c009800:	1c000064 	pcaddu12i	$r4,3(0x3)
1c009804:	02a48084 	addi.w	$r4,$r4,-1760(0x920)
1c009808:	5783c7ff 	bl	-31804(0xfff83c4) # 1c001bcc <myprintf>
1c00980c:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c009810:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c009814:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c009818:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c00981c:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c009820:	6bff69ac 	bltu	$r13,$r12,-152(0x3ff68) # 1c009788 <spi_flash+0x90>
1c009824:	1c000064 	pcaddu12i	$r4,3(0x3)
1c009828:	02a62084 	addi.w	$r4,$r4,-1656(0x988)
1c00982c:	5783a3ff 	bl	-31840(0xfff83a0) # 1c001bcc <myprintf>
1c009830:	1c000064 	pcaddu12i	$r4,3(0x3)
1c009834:	02a63084 	addi.w	$r4,$r4,-1652(0x98c)
1c009838:	578397ff 	bl	-31852(0xfff8394) # 1c001bcc <myprintf>
1c00983c:	0288000c 	addi.w	$r12,$r0,512(0x200)
1c009840:	29bf62cc 	st.w	$r12,$r22,-40(0xfd8)
1c009844:	29bfa2c0 	st.w	$r0,$r22,-24(0xfe8)
1c009848:	5000d400 	b	212(0xd4) # 1c00991c <spi_flash+0x224>
1c00984c:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c009850:	0040a18c 	slli.w	$r12,$r12,0x8
1c009854:	29bf82cc 	st.w	$r12,$r22,-32(0xfe0)
1c009858:	28bf92cd 	ld.w	$r13,$r22,-28(0xfe4)
1c00985c:	28bf82cc 	ld.w	$r12,$r22,-32(0xfe0)
1c009860:	001031ac 	add.w	$r12,$r13,$r12
1c009864:	02840006 	addi.w	$r6,$r0,256(0x100)
1c009868:	28bf52c5 	ld.w	$r5,$r22,-44(0xfd4)
1c00986c:	00150184 	move	$r4,$r12
1c009870:	5780b7ff 	bl	-32588(0xfff80b4) # 1c001924 <Spiflash_Read_Bytes>
1c009874:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c009878:	50008000 	b	128(0x80) # 1c0098f8 <spi_flash+0x200>
1c00987c:	28bf52cd 	ld.w	$r13,$r22,-44(0xfd4)
1c009880:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c009884:	001031ac 	add.w	$r12,$r13,$r12
1c009888:	2a00018d 	ld.bu	$r13,$r12,0
1c00988c:	28bf82ce 	ld.w	$r14,$r22,-32(0xfe0)
1c009890:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c009894:	001031ce 	add.w	$r14,$r14,$r12
1c009898:	157e000c 	lu12i.w	$r12,-266240(0xbf000)
1c00989c:	001031cc 	add.w	$r12,$r14,$r12
1c0098a0:	2a00018c 	ld.bu	$r12,$r12,0
1c0098a4:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c0098a8:	580045ac 	beq	$r13,$r12,68(0x44) # 1c0098ec <spi_flash+0x1f4>
1c0098ac:	28bf52cd 	ld.w	$r13,$r22,-44(0xfd4)
1c0098b0:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0098b4:	001031ac 	add.w	$r12,$r13,$r12
1c0098b8:	2a00018c 	ld.bu	$r12,$r12,0
1c0098bc:	0015018e 	move	$r14,$r12
1c0098c0:	28bf82cd 	ld.w	$r13,$r22,-32(0xfe0)
1c0098c4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0098c8:	001031ad 	add.w	$r13,$r13,$r12
1c0098cc:	157e000c 	lu12i.w	$r12,-266240(0xbf000)
1c0098d0:	001031ac 	add.w	$r12,$r13,$r12
1c0098d4:	00150186 	move	$r6,$r12
1c0098d8:	001501c5 	move	$r5,$r14
1c0098dc:	1c000064 	pcaddu12i	$r4,3(0x3)
1c0098e0:	02a1d084 	addi.w	$r4,$r4,-1932(0x874)
1c0098e4:	5782ebff 	bl	-32024(0xfff82e8) # 1c001bcc <myprintf>
1c0098e8:	50001c00 	b	28(0x1c) # 1c009904 <spi_flash+0x20c>
1c0098ec:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c0098f0:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c0098f4:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0098f8:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c0098fc:	0283fc0c 	addi.w	$r12,$r0,255(0xff)
1c009900:	6fff7d8d 	bgeu	$r12,$r13,-132(0x3ff7c) # 1c00987c <spi_flash+0x184>
1c009904:	1c000064 	pcaddu12i	$r4,3(0x3)
1c009908:	02a07084 	addi.w	$r4,$r4,-2020(0x81c)
1c00990c:	5782c3ff 	bl	-32064(0xfff82c0) # 1c001bcc <myprintf>
1c009910:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c009914:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c009918:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c00991c:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c009920:	28bf62cc 	ld.w	$r12,$r22,-40(0xfd8)
1c009924:	6bff29ac 	bltu	$r13,$r12,-216(0x3ff28) # 1c00984c <spi_flash+0x154>
1c009928:	1c000064 	pcaddu12i	$r4,3(0x3)
1c00992c:	02a2a084 	addi.w	$r4,$r4,-1880(0x8a8)
1c009930:	57829fff 	bl	-32100(0xfff829c) # 1c001bcc <myprintf>
1c009934:	0015000c 	move	$r12,$r0
1c009938:	00150184 	move	$r4,$r12
1c00993c:	2880f061 	ld.w	$r1,$r3,60(0x3c)
1c009940:	2880e076 	ld.w	$r22,$r3,56(0x38)
1c009944:	02810063 	addi.w	$r3,$r3,64(0x40)
1c009948:	4c000020 	jirl	$r0,$r1,0

1c00994c <gpio_int_test>:
gpio_int_test():
1c00994c:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c009950:	29807061 	st.w	$r1,$r3,28(0x1c)
1c009954:	29806076 	st.w	$r22,$r3,24(0x18)
1c009958:	02808076 	addi.w	$r22,$r3,32(0x20)
1c00995c:	00150006 	move	$r6,$r0
1c009960:	02800805 	addi.w	$r5,$r0,2(0x2)
1c009964:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c009968:	03804184 	ori	$r4,$r12,0x10
1c00996c:	5779c3ff 	bl	-34368(0xfff79c0) # 1c00132c <AFIO_RemapConfig>
1c009970:	00150006 	move	$r6,$r0
1c009974:	02802005 	addi.w	$r5,$r0,8(0x8)
1c009978:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00997c:	03806184 	ori	$r4,$r12,0x18
1c009980:	5779afff 	bl	-34388(0xfff79ac) # 1c00132c <AFIO_RemapConfig>
1c009984:	02bf82cc 	addi.w	$r12,$r22,-32(0xfe0)
1c009988:	00150184 	move	$r4,$r12
1c00998c:	57a623ff 	bl	-23008(0xfffa620) # 1c003fac <EXTI_StructInit>
1c009990:	1400100c 	lu12i.w	$r12,128(0x80)
1c009994:	0380098c 	ori	$r12,$r12,0x2
1c009998:	29bf82cc 	st.w	$r12,$r22,-32(0xfe0)
1c00999c:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0099a0:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c0099a4:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0099a8:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c0099ac:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c0099b0:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c0099b4:	02bf82cc 	addi.w	$r12,$r22,-32(0xfe0)
1c0099b8:	00150185 	move	$r5,$r12
1c0099bc:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c0099c0:	03808184 	ori	$r4,$r12,0x20
1c0099c4:	57a45bff 	bl	-23464(0xfffa458) # 1c003e1c <EXTI_Init>
1c0099c8:	03400000 	andi	$r0,$r0,0x0
1c0099cc:	00150184 	move	$r4,$r12
1c0099d0:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c0099d4:	28806076 	ld.w	$r22,$r3,24(0x18)
1c0099d8:	02808063 	addi.w	$r3,$r3,32(0x20)
1c0099dc:	4c000020 	jirl	$r0,$r1,0

1c0099e0 <gpio_int>:
gpio_int():
1c0099e0:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0099e4:	29807061 	st.w	$r1,$r3,28(0x1c)
1c0099e8:	29806076 	st.w	$r22,$r3,24(0x18)
1c0099ec:	02808076 	addi.w	$r22,$r3,32(0x20)
1c0099f0:	29bfb2c4 	st.w	$r4,$r22,-20(0xfec)
1c0099f4:	29bfa2c5 	st.w	$r5,$r22,-24(0xfe8)
1c0099f8:	57ff57ff 	bl	-172(0xfffff54) # 1c00994c <gpio_int_test>
1c0099fc:	0015000c 	move	$r12,$r0
1c009a00:	00150184 	move	$r4,$r12
1c009a04:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c009a08:	28806076 	ld.w	$r22,$r3,24(0x18)
1c009a0c:	02808063 	addi.w	$r3,$r3,32(0x20)
1c009a10:	4c000020 	jirl	$r0,$r1,0

1c009a14 <tmp>:
tmp():
1c009a14:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c009a18:	2980b076 	st.w	$r22,$r3,44(0x2c)
1c009a1c:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c009a20:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c009a24:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c009a28:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c009a2c:	0015000c 	move	$r12,$r0
1c009a30:	00150184 	move	$r4,$r12
1c009a34:	2880b076 	ld.w	$r22,$r3,44(0x2c)
1c009a38:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c009a3c:	4c000020 	jirl	$r0,$r1,0

1c009a40 <copy_iram>:
copy_iram():
1c009a40:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c009a44:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c009a48:	2980a076 	st.w	$r22,$r3,40(0x28)
1c009a4c:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c009a50:	29bf72c4 	st.w	$r4,$r22,-36(0xfdc)
1c009a54:	29bf62c5 	st.w	$r5,$r22,-40(0xfd8)
1c009a58:	1c000044 	pcaddu12i	$r4,2(0x2)
1c009a5c:	029e2084 	addi.w	$r4,$r4,1928(0x788)
1c009a60:	57816fff 	bl	-32404(0xfff816c) # 1c001bcc <myprintf>
1c009a64:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c009a68:	50002000 	b	32(0x20) # 1c009a88 <copy_iram+0x48>
1c009a6c:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c009a70:	1500000c 	lu12i.w	$r12,-524288(0x80000)
1c009a74:	001031ac 	add.w	$r12,$r13,$r12
1c009a78:	29800180 	st.w	$r0,$r12,0
1c009a7c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c009a80:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c009a84:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c009a88:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c009a8c:	1400004c 	lu12i.w	$r12,2(0x2)
1c009a90:	6bffddac 	bltu	$r13,$r12,-36(0x3ffdc) # 1c009a6c <copy_iram+0x2c>
1c009a94:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c009a98:	50003800 	b	56(0x38) # 1c009ad0 <copy_iram+0x90>
1c009a9c:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c009aa0:	157c020c 	lu12i.w	$r12,-270320(0xbe010)
1c009aa4:	001031ac 	add.w	$r12,$r13,$r12
1c009aa8:	0015018e 	move	$r14,$r12
1c009aac:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c009ab0:	1500000c 	lu12i.w	$r12,-524288(0x80000)
1c009ab4:	001031ac 	add.w	$r12,$r13,$r12
1c009ab8:	0015018d 	move	$r13,$r12
1c009abc:	288001cc 	ld.w	$r12,$r14,0
1c009ac0:	298001ac 	st.w	$r12,$r13,0
1c009ac4:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c009ac8:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c009acc:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c009ad0:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c009ad4:	1400004c 	lu12i.w	$r12,2(0x2)
1c009ad8:	6bffc5ac 	bltu	$r13,$r12,-60(0x3ffc4) # 1c009a9c <copy_iram+0x5c>
1c009adc:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c009ae0:	50006c00 	b	108(0x6c) # 1c009b4c <copy_iram+0x10c>
1c009ae4:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c009ae8:	1500000c 	lu12i.w	$r12,-524288(0x80000)
1c009aec:	001031ac 	add.w	$r12,$r13,$r12
1c009af0:	2880018d 	ld.w	$r13,$r12,0
1c009af4:	28bfb2ce 	ld.w	$r14,$r22,-20(0xfec)
1c009af8:	157c020c 	lu12i.w	$r12,-270320(0xbe010)
1c009afc:	001031cc 	add.w	$r12,$r14,$r12
1c009b00:	2880018c 	ld.w	$r12,$r12,0
1c009b04:	58003dac 	beq	$r13,$r12,60(0x3c) # 1c009b40 <copy_iram+0x100>
1c009b08:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c009b0c:	1500000c 	lu12i.w	$r12,-524288(0x80000)
1c009b10:	001031ac 	add.w	$r12,$r13,$r12
1c009b14:	2880018e 	ld.w	$r14,$r12,0
1c009b18:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c009b1c:	157c020c 	lu12i.w	$r12,-270320(0xbe010)
1c009b20:	001031ac 	add.w	$r12,$r13,$r12
1c009b24:	2880018c 	ld.w	$r12,$r12,0
1c009b28:	00150187 	move	$r7,$r12
1c009b2c:	001501c6 	move	$r6,$r14
1c009b30:	28bfb2c5 	ld.w	$r5,$r22,-20(0xfec)
1c009b34:	1c000044 	pcaddu12i	$r4,2(0x2)
1c009b38:	029b0084 	addi.w	$r4,$r4,1728(0x6c0)
1c009b3c:	578093ff 	bl	-32624(0xfff8090) # 1c001bcc <myprintf>
1c009b40:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c009b44:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c009b48:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c009b4c:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c009b50:	1400004c 	lu12i.w	$r12,2(0x2)
1c009b54:	6bff91ac 	bltu	$r13,$r12,-112(0x3ff90) # 1c009ae4 <copy_iram+0xa4>
1c009b58:	1500000c 	lu12i.w	$r12,-524288(0x80000)
1c009b5c:	4c000180 	jirl	$r0,$r12,0
1c009b60:	0015000c 	move	$r12,$r0
1c009b64:	00150184 	move	$r4,$r12
1c009b68:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c009b6c:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c009b70:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c009b74:	4c000020 	jirl	$r0,$r1,0

1c009b78 <exti_gpioa0_irq_handler>:
exti_gpioa0_irq_handler():
1c009b78:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c009b7c:	29803061 	st.w	$r1,$r3,12(0xc)
1c009b80:	29802076 	st.w	$r22,$r3,8(0x8)
1c009b84:	02804076 	addi.w	$r22,$r3,16(0x10)
1c009b88:	1c000066 	pcaddu12i	$r6,3(0x3)
1c009b8c:	02a070c6 	addi.w	$r6,$r6,-2020(0x81c)
1c009b90:	02806005 	addi.w	$r5,$r0,24(0x18)
1c009b94:	1c000044 	pcaddu12i	$r4,2(0x2)
1c009b98:	0299e084 	addi.w	$r4,$r4,1656(0x678)
1c009b9c:	578033ff 	bl	-32720(0xfff8030) # 1c001bcc <myprintf>
1c009ba0:	02800405 	addi.w	$r5,$r0,1(0x1)
1c009ba4:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c009ba8:	03808184 	ori	$r4,$r12,0x20
1c009bac:	57a44bff 	bl	-23480(0xfffa448) # 1c003ff4 <EXTI_ClearITPendingBit>
1c009bb0:	03400000 	andi	$r0,$r0,0x0
1c009bb4:	28803061 	ld.w	$r1,$r3,12(0xc)
1c009bb8:	28802076 	ld.w	$r22,$r3,8(0x8)
1c009bbc:	02804063 	addi.w	$r3,$r3,16(0x10)
1c009bc0:	4c000020 	jirl	$r0,$r1,0

1c009bc4 <exti_gpioa1_irq_handler>:
exti_gpioa1_irq_handler():
1c009bc4:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c009bc8:	29803061 	st.w	$r1,$r3,12(0xc)
1c009bcc:	29802076 	st.w	$r22,$r3,8(0x8)
1c009bd0:	02804076 	addi.w	$r22,$r3,16(0x10)
1c009bd4:	1c000046 	pcaddu12i	$r6,2(0x2)
1c009bd8:	029fa0c6 	addi.w	$r6,$r6,2024(0x7e8)
1c009bdc:	02807405 	addi.w	$r5,$r0,29(0x1d)
1c009be0:	1c000044 	pcaddu12i	$r4,2(0x2)
1c009be4:	0298b084 	addi.w	$r4,$r4,1580(0x62c)
1c009be8:	577fe7ff 	bl	-32796(0xfff7fe4) # 1c001bcc <myprintf>
1c009bec:	02800805 	addi.w	$r5,$r0,2(0x2)
1c009bf0:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c009bf4:	03808184 	ori	$r4,$r12,0x20
1c009bf8:	57a3ffff 	bl	-23556(0xfffa3fc) # 1c003ff4 <EXTI_ClearITPendingBit>
1c009bfc:	03400000 	andi	$r0,$r0,0x0
1c009c00:	28803061 	ld.w	$r1,$r3,12(0xc)
1c009c04:	28802076 	ld.w	$r22,$r3,8(0x8)
1c009c08:	02804063 	addi.w	$r3,$r3,16(0x10)
1c009c0c:	4c000020 	jirl	$r0,$r1,0

1c009c10 <exti_gpioa2_irq_handler>:
exti_gpioa2_irq_handler():
1c009c10:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c009c14:	29803061 	st.w	$r1,$r3,12(0xc)
1c009c18:	29802076 	st.w	$r22,$r3,8(0x8)
1c009c1c:	02804076 	addi.w	$r22,$r3,16(0x10)
1c009c20:	1c000046 	pcaddu12i	$r6,2(0x2)
1c009c24:	029ed0c6 	addi.w	$r6,$r6,1972(0x7b4)
1c009c28:	02808805 	addi.w	$r5,$r0,34(0x22)
1c009c2c:	1c000044 	pcaddu12i	$r4,2(0x2)
1c009c30:	02978084 	addi.w	$r4,$r4,1504(0x5e0)
1c009c34:	577f9bff 	bl	-32872(0xfff7f98) # 1c001bcc <myprintf>
1c009c38:	02801005 	addi.w	$r5,$r0,4(0x4)
1c009c3c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c009c40:	03808184 	ori	$r4,$r12,0x20
1c009c44:	57a3b3ff 	bl	-23632(0xfffa3b0) # 1c003ff4 <EXTI_ClearITPendingBit>
1c009c48:	03400000 	andi	$r0,$r0,0x0
1c009c4c:	28803061 	ld.w	$r1,$r3,12(0xc)
1c009c50:	28802076 	ld.w	$r22,$r3,8(0x8)
1c009c54:	02804063 	addi.w	$r3,$r3,16(0x10)
1c009c58:	4c000020 	jirl	$r0,$r1,0

1c009c5c <exti_gpioa3_irq_handler>:
exti_gpioa3_irq_handler():
1c009c5c:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c009c60:	29803061 	st.w	$r1,$r3,12(0xc)
1c009c64:	29802076 	st.w	$r22,$r3,8(0x8)
1c009c68:	02804076 	addi.w	$r22,$r3,16(0x10)
1c009c6c:	1c000046 	pcaddu12i	$r6,2(0x2)
1c009c70:	029e00c6 	addi.w	$r6,$r6,1920(0x780)
1c009c74:	02809c05 	addi.w	$r5,$r0,39(0x27)
1c009c78:	1c000044 	pcaddu12i	$r4,2(0x2)
1c009c7c:	02965084 	addi.w	$r4,$r4,1428(0x594)
1c009c80:	577f4fff 	bl	-32948(0xfff7f4c) # 1c001bcc <myprintf>
1c009c84:	02802005 	addi.w	$r5,$r0,8(0x8)
1c009c88:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c009c8c:	03808184 	ori	$r4,$r12,0x20
1c009c90:	57a367ff 	bl	-23708(0xfffa364) # 1c003ff4 <EXTI_ClearITPendingBit>
1c009c94:	03400000 	andi	$r0,$r0,0x0
1c009c98:	28803061 	ld.w	$r1,$r3,12(0xc)
1c009c9c:	28802076 	ld.w	$r22,$r3,8(0x8)
1c009ca0:	02804063 	addi.w	$r3,$r3,16(0x10)
1c009ca4:	4c000020 	jirl	$r0,$r1,0

1c009ca8 <exti_gpioa4_irq_handler>:
exti_gpioa4_irq_handler():
1c009ca8:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c009cac:	29803061 	st.w	$r1,$r3,12(0xc)
1c009cb0:	29802076 	st.w	$r22,$r3,8(0x8)
1c009cb4:	02804076 	addi.w	$r22,$r3,16(0x10)
1c009cb8:	1c000046 	pcaddu12i	$r6,2(0x2)
1c009cbc:	029d30c6 	addi.w	$r6,$r6,1868(0x74c)
1c009cc0:	0280b005 	addi.w	$r5,$r0,44(0x2c)
1c009cc4:	1c000044 	pcaddu12i	$r4,2(0x2)
1c009cc8:	02952084 	addi.w	$r4,$r4,1352(0x548)
1c009ccc:	577f03ff 	bl	-33024(0xfff7f00) # 1c001bcc <myprintf>
1c009cd0:	02804005 	addi.w	$r5,$r0,16(0x10)
1c009cd4:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c009cd8:	03808184 	ori	$r4,$r12,0x20
1c009cdc:	57a31bff 	bl	-23784(0xfffa318) # 1c003ff4 <EXTI_ClearITPendingBit>
1c009ce0:	03400000 	andi	$r0,$r0,0x0
1c009ce4:	28803061 	ld.w	$r1,$r3,12(0xc)
1c009ce8:	28802076 	ld.w	$r22,$r3,8(0x8)
1c009cec:	02804063 	addi.w	$r3,$r3,16(0x10)
1c009cf0:	4c000020 	jirl	$r0,$r1,0

1c009cf4 <exti_gpioa5_irq_handler>:
exti_gpioa5_irq_handler():
1c009cf4:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c009cf8:	29803061 	st.w	$r1,$r3,12(0xc)
1c009cfc:	29802076 	st.w	$r22,$r3,8(0x8)
1c009d00:	02804076 	addi.w	$r22,$r3,16(0x10)
1c009d04:	1c000046 	pcaddu12i	$r6,2(0x2)
1c009d08:	029c60c6 	addi.w	$r6,$r6,1816(0x718)
1c009d0c:	0280c405 	addi.w	$r5,$r0,49(0x31)
1c009d10:	1c000044 	pcaddu12i	$r4,2(0x2)
1c009d14:	0293f084 	addi.w	$r4,$r4,1276(0x4fc)
1c009d18:	577eb7ff 	bl	-33100(0xfff7eb4) # 1c001bcc <myprintf>
1c009d1c:	02808005 	addi.w	$r5,$r0,32(0x20)
1c009d20:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c009d24:	03808184 	ori	$r4,$r12,0x20
1c009d28:	57a2cfff 	bl	-23860(0xfffa2cc) # 1c003ff4 <EXTI_ClearITPendingBit>
1c009d2c:	03400000 	andi	$r0,$r0,0x0
1c009d30:	28803061 	ld.w	$r1,$r3,12(0xc)
1c009d34:	28802076 	ld.w	$r22,$r3,8(0x8)
1c009d38:	02804063 	addi.w	$r3,$r3,16(0x10)
1c009d3c:	4c000020 	jirl	$r0,$r1,0

1c009d40 <exti_gpioa6_irq_handler>:
exti_gpioa6_irq_handler():
1c009d40:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c009d44:	29803061 	st.w	$r1,$r3,12(0xc)
1c009d48:	29802076 	st.w	$r22,$r3,8(0x8)
1c009d4c:	02804076 	addi.w	$r22,$r3,16(0x10)
1c009d50:	1c000046 	pcaddu12i	$r6,2(0x2)
1c009d54:	029b90c6 	addi.w	$r6,$r6,1764(0x6e4)
1c009d58:	0280d805 	addi.w	$r5,$r0,54(0x36)
1c009d5c:	1c000044 	pcaddu12i	$r4,2(0x2)
1c009d60:	0292c084 	addi.w	$r4,$r4,1200(0x4b0)
1c009d64:	577e6bff 	bl	-33176(0xfff7e68) # 1c001bcc <myprintf>
1c009d68:	02810005 	addi.w	$r5,$r0,64(0x40)
1c009d6c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c009d70:	03808184 	ori	$r4,$r12,0x20
1c009d74:	57a283ff 	bl	-23936(0xfffa280) # 1c003ff4 <EXTI_ClearITPendingBit>
1c009d78:	03400000 	andi	$r0,$r0,0x0
1c009d7c:	28803061 	ld.w	$r1,$r3,12(0xc)
1c009d80:	28802076 	ld.w	$r22,$r3,8(0x8)
1c009d84:	02804063 	addi.w	$r3,$r3,16(0x10)
1c009d88:	4c000020 	jirl	$r0,$r1,0

1c009d8c <exti_gpioa7_irq_handler>:
exti_gpioa7_irq_handler():
1c009d8c:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c009d90:	29803061 	st.w	$r1,$r3,12(0xc)
1c009d94:	29802076 	st.w	$r22,$r3,8(0x8)
1c009d98:	02804076 	addi.w	$r22,$r3,16(0x10)
1c009d9c:	1c000046 	pcaddu12i	$r6,2(0x2)
1c009da0:	029ac0c6 	addi.w	$r6,$r6,1712(0x6b0)
1c009da4:	0280f005 	addi.w	$r5,$r0,60(0x3c)
1c009da8:	1c000044 	pcaddu12i	$r4,2(0x2)
1c009dac:	02919084 	addi.w	$r4,$r4,1124(0x464)
1c009db0:	577e1fff 	bl	-33252(0xfff7e1c) # 1c001bcc <myprintf>
1c009db4:	02820005 	addi.w	$r5,$r0,128(0x80)
1c009db8:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c009dbc:	03808184 	ori	$r4,$r12,0x20
1c009dc0:	57a237ff 	bl	-24012(0xfffa234) # 1c003ff4 <EXTI_ClearITPendingBit>
1c009dc4:	03400000 	andi	$r0,$r0,0x0
1c009dc8:	28803061 	ld.w	$r1,$r3,12(0xc)
1c009dcc:	28802076 	ld.w	$r22,$r3,8(0x8)
1c009dd0:	02804063 	addi.w	$r3,$r3,16(0x10)
1c009dd4:	4c000020 	jirl	$r0,$r1,0

1c009dd8 <exti_gpiob0_irq_handler>:
exti_gpiob0_irq_handler():
1c009dd8:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c009ddc:	29803061 	st.w	$r1,$r3,12(0xc)
1c009de0:	29802076 	st.w	$r22,$r3,8(0x8)
1c009de4:	02804076 	addi.w	$r22,$r3,16(0x10)
1c009de8:	1c000046 	pcaddu12i	$r6,2(0x2)
1c009dec:	0299f0c6 	addi.w	$r6,$r6,1660(0x67c)
1c009df0:	02810405 	addi.w	$r5,$r0,65(0x41)
1c009df4:	1c000044 	pcaddu12i	$r4,2(0x2)
1c009df8:	02906084 	addi.w	$r4,$r4,1048(0x418)
1c009dfc:	577dd3ff 	bl	-33328(0xfff7dd0) # 1c001bcc <myprintf>
1c009e00:	02840005 	addi.w	$r5,$r0,256(0x100)
1c009e04:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c009e08:	03808184 	ori	$r4,$r12,0x20
1c009e0c:	57a1ebff 	bl	-24088(0xfffa1e8) # 1c003ff4 <EXTI_ClearITPendingBit>
1c009e10:	03400000 	andi	$r0,$r0,0x0
1c009e14:	28803061 	ld.w	$r1,$r3,12(0xc)
1c009e18:	28802076 	ld.w	$r22,$r3,8(0x8)
1c009e1c:	02804063 	addi.w	$r3,$r3,16(0x10)
1c009e20:	4c000020 	jirl	$r0,$r1,0

1c009e24 <exti_gpiob1_irq_handler>:
exti_gpiob1_irq_handler():
1c009e24:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c009e28:	29803061 	st.w	$r1,$r3,12(0xc)
1c009e2c:	29802076 	st.w	$r22,$r3,8(0x8)
1c009e30:	02804076 	addi.w	$r22,$r3,16(0x10)
1c009e34:	1c000046 	pcaddu12i	$r6,2(0x2)
1c009e38:	029920c6 	addi.w	$r6,$r6,1608(0x648)
1c009e3c:	02811c05 	addi.w	$r5,$r0,71(0x47)
1c009e40:	1c000044 	pcaddu12i	$r4,2(0x2)
1c009e44:	028f3084 	addi.w	$r4,$r4,972(0x3cc)
1c009e48:	577d87ff 	bl	-33404(0xfff7d84) # 1c001bcc <myprintf>
1c009e4c:	02880005 	addi.w	$r5,$r0,512(0x200)
1c009e50:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c009e54:	03808184 	ori	$r4,$r12,0x20
1c009e58:	57a19fff 	bl	-24164(0xfffa19c) # 1c003ff4 <EXTI_ClearITPendingBit>
1c009e5c:	03400000 	andi	$r0,$r0,0x0
1c009e60:	28803061 	ld.w	$r1,$r3,12(0xc)
1c009e64:	28802076 	ld.w	$r22,$r3,8(0x8)
1c009e68:	02804063 	addi.w	$r3,$r3,16(0x10)
1c009e6c:	4c000020 	jirl	$r0,$r1,0

1c009e70 <exti_gpiob2_irq_handler>:
exti_gpiob2_irq_handler():
1c009e70:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c009e74:	29803061 	st.w	$r1,$r3,12(0xc)
1c009e78:	29802076 	st.w	$r22,$r3,8(0x8)
1c009e7c:	02804076 	addi.w	$r22,$r3,16(0x10)
1c009e80:	1c000046 	pcaddu12i	$r6,2(0x2)
1c009e84:	029850c6 	addi.w	$r6,$r6,1556(0x614)
1c009e88:	02813405 	addi.w	$r5,$r0,77(0x4d)
1c009e8c:	1c000044 	pcaddu12i	$r4,2(0x2)
1c009e90:	028e0084 	addi.w	$r4,$r4,896(0x380)
1c009e94:	577d3bff 	bl	-33480(0xfff7d38) # 1c001bcc <myprintf>
1c009e98:	02900005 	addi.w	$r5,$r0,1024(0x400)
1c009e9c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c009ea0:	03808184 	ori	$r4,$r12,0x20
1c009ea4:	57a153ff 	bl	-24240(0xfffa150) # 1c003ff4 <EXTI_ClearITPendingBit>
1c009ea8:	03400000 	andi	$r0,$r0,0x0
1c009eac:	28803061 	ld.w	$r1,$r3,12(0xc)
1c009eb0:	28802076 	ld.w	$r22,$r3,8(0x8)
1c009eb4:	02804063 	addi.w	$r3,$r3,16(0x10)
1c009eb8:	4c000020 	jirl	$r0,$r1,0

1c009ebc <exti_gpiob3_irq_handler>:
exti_gpiob3_irq_handler():
1c009ebc:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c009ec0:	29803061 	st.w	$r1,$r3,12(0xc)
1c009ec4:	29802076 	st.w	$r22,$r3,8(0x8)
1c009ec8:	02804076 	addi.w	$r22,$r3,16(0x10)
1c009ecc:	1c000046 	pcaddu12i	$r6,2(0x2)
1c009ed0:	029780c6 	addi.w	$r6,$r6,1504(0x5e0)
1c009ed4:	02814c05 	addi.w	$r5,$r0,83(0x53)
1c009ed8:	1c000044 	pcaddu12i	$r4,2(0x2)
1c009edc:	028cd084 	addi.w	$r4,$r4,820(0x334)
1c009ee0:	577cefff 	bl	-33556(0xfff7cec) # 1c001bcc <myprintf>
1c009ee4:	03a00005 	ori	$r5,$r0,0x800
1c009ee8:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c009eec:	03808184 	ori	$r4,$r12,0x20
1c009ef0:	57a107ff 	bl	-24316(0xfffa104) # 1c003ff4 <EXTI_ClearITPendingBit>
1c009ef4:	03400000 	andi	$r0,$r0,0x0
1c009ef8:	28803061 	ld.w	$r1,$r3,12(0xc)
1c009efc:	28802076 	ld.w	$r22,$r3,8(0x8)
1c009f00:	02804063 	addi.w	$r3,$r3,16(0x10)
1c009f04:	4c000020 	jirl	$r0,$r1,0

1c009f08 <exti_gpiob4_irq_handler>:
exti_gpiob4_irq_handler():
1c009f08:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c009f0c:	29803061 	st.w	$r1,$r3,12(0xc)
1c009f10:	29802076 	st.w	$r22,$r3,8(0x8)
1c009f14:	02804076 	addi.w	$r22,$r3,16(0x10)
1c009f18:	1c000046 	pcaddu12i	$r6,2(0x2)
1c009f1c:	0296b0c6 	addi.w	$r6,$r6,1452(0x5ac)
1c009f20:	02816005 	addi.w	$r5,$r0,88(0x58)
1c009f24:	1c000044 	pcaddu12i	$r4,2(0x2)
1c009f28:	028ba084 	addi.w	$r4,$r4,744(0x2e8)
1c009f2c:	577ca3ff 	bl	-33632(0xfff7ca0) # 1c001bcc <myprintf>
1c009f30:	14000025 	lu12i.w	$r5,1(0x1)
1c009f34:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c009f38:	03808184 	ori	$r4,$r12,0x20
1c009f3c:	57a0bbff 	bl	-24392(0xfffa0b8) # 1c003ff4 <EXTI_ClearITPendingBit>
1c009f40:	03400000 	andi	$r0,$r0,0x0
1c009f44:	28803061 	ld.w	$r1,$r3,12(0xc)
1c009f48:	28802076 	ld.w	$r22,$r3,8(0x8)
1c009f4c:	02804063 	addi.w	$r3,$r3,16(0x10)
1c009f50:	4c000020 	jirl	$r0,$r1,0

1c009f54 <exti_gpiob5_irq_handler>:
exti_gpiob5_irq_handler():
1c009f54:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c009f58:	29803061 	st.w	$r1,$r3,12(0xc)
1c009f5c:	29802076 	st.w	$r22,$r3,8(0x8)
1c009f60:	02804076 	addi.w	$r22,$r3,16(0x10)
1c009f64:	1c000046 	pcaddu12i	$r6,2(0x2)
1c009f68:	0295e0c6 	addi.w	$r6,$r6,1400(0x578)
1c009f6c:	02817405 	addi.w	$r5,$r0,93(0x5d)
1c009f70:	1c000044 	pcaddu12i	$r4,2(0x2)
1c009f74:	028a7084 	addi.w	$r4,$r4,668(0x29c)
1c009f78:	577c57ff 	bl	-33708(0xfff7c54) # 1c001bcc <myprintf>
1c009f7c:	14000045 	lu12i.w	$r5,2(0x2)
1c009f80:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c009f84:	03808184 	ori	$r4,$r12,0x20
1c009f88:	57a06fff 	bl	-24468(0xfffa06c) # 1c003ff4 <EXTI_ClearITPendingBit>
1c009f8c:	03400000 	andi	$r0,$r0,0x0
1c009f90:	28803061 	ld.w	$r1,$r3,12(0xc)
1c009f94:	28802076 	ld.w	$r22,$r3,8(0x8)
1c009f98:	02804063 	addi.w	$r3,$r3,16(0x10)
1c009f9c:	4c000020 	jirl	$r0,$r1,0

1c009fa0 <exti_gpiob6_irq_handler>:
exti_gpiob6_irq_handler():
1c009fa0:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c009fa4:	29803061 	st.w	$r1,$r3,12(0xc)
1c009fa8:	29802076 	st.w	$r22,$r3,8(0x8)
1c009fac:	02804076 	addi.w	$r22,$r3,16(0x10)
1c009fb0:	1c000046 	pcaddu12i	$r6,2(0x2)
1c009fb4:	029510c6 	addi.w	$r6,$r6,1348(0x544)
1c009fb8:	02818c05 	addi.w	$r5,$r0,99(0x63)
1c009fbc:	1c000044 	pcaddu12i	$r4,2(0x2)
1c009fc0:	02894084 	addi.w	$r4,$r4,592(0x250)
1c009fc4:	577c0bff 	bl	-33784(0xfff7c08) # 1c001bcc <myprintf>
1c009fc8:	14000085 	lu12i.w	$r5,4(0x4)
1c009fcc:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c009fd0:	03808184 	ori	$r4,$r12,0x20
1c009fd4:	57a023ff 	bl	-24544(0xfffa020) # 1c003ff4 <EXTI_ClearITPendingBit>
1c009fd8:	03400000 	andi	$r0,$r0,0x0
1c009fdc:	28803061 	ld.w	$r1,$r3,12(0xc)
1c009fe0:	28802076 	ld.w	$r22,$r3,8(0x8)
1c009fe4:	02804063 	addi.w	$r3,$r3,16(0x10)
1c009fe8:	4c000020 	jirl	$r0,$r1,0

1c009fec <exti_gpiob7_irq_handler>:
exti_gpiob7_irq_handler():
1c009fec:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c009ff0:	29803061 	st.w	$r1,$r3,12(0xc)
1c009ff4:	29802076 	st.w	$r22,$r3,8(0x8)
1c009ff8:	02804076 	addi.w	$r22,$r3,16(0x10)
1c009ffc:	1c000046 	pcaddu12i	$r6,2(0x2)
1c00a000:	029440c6 	addi.w	$r6,$r6,1296(0x510)
1c00a004:	0281a405 	addi.w	$r5,$r0,105(0x69)
1c00a008:	1c000044 	pcaddu12i	$r4,2(0x2)
1c00a00c:	02881084 	addi.w	$r4,$r4,516(0x204)
1c00a010:	577bbfff 	bl	-33860(0xfff7bbc) # 1c001bcc <myprintf>
1c00a014:	14000105 	lu12i.w	$r5,8(0x8)
1c00a018:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a01c:	03808184 	ori	$r4,$r12,0x20
1c00a020:	579fd7ff 	bl	-24620(0xfff9fd4) # 1c003ff4 <EXTI_ClearITPendingBit>
1c00a024:	03400000 	andi	$r0,$r0,0x0
1c00a028:	28803061 	ld.w	$r1,$r3,12(0xc)
1c00a02c:	28802076 	ld.w	$r22,$r3,8(0x8)
1c00a030:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00a034:	4c000020 	jirl	$r0,$r1,0

1c00a038 <exti_gpioc0_irq_handler>:
exti_gpioc0_irq_handler():
1c00a038:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c00a03c:	29803061 	st.w	$r1,$r3,12(0xc)
1c00a040:	29802076 	st.w	$r22,$r3,8(0x8)
1c00a044:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00a048:	1c000046 	pcaddu12i	$r6,2(0x2)
1c00a04c:	029370c6 	addi.w	$r6,$r6,1244(0x4dc)
1c00a050:	0281c005 	addi.w	$r5,$r0,112(0x70)
1c00a054:	1c000044 	pcaddu12i	$r4,2(0x2)
1c00a058:	0286e084 	addi.w	$r4,$r4,440(0x1b8)
1c00a05c:	577b73ff 	bl	-33936(0xfff7b70) # 1c001bcc <myprintf>
1c00a060:	14000205 	lu12i.w	$r5,16(0x10)
1c00a064:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a068:	03808184 	ori	$r4,$r12,0x20
1c00a06c:	579f8bff 	bl	-24696(0xfff9f88) # 1c003ff4 <EXTI_ClearITPendingBit>
1c00a070:	03400000 	andi	$r0,$r0,0x0
1c00a074:	28803061 	ld.w	$r1,$r3,12(0xc)
1c00a078:	28802076 	ld.w	$r22,$r3,8(0x8)
1c00a07c:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00a080:	4c000020 	jirl	$r0,$r1,0

1c00a084 <exti_gpioc1_irq_handler>:
exti_gpioc1_irq_handler():
1c00a084:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c00a088:	29803061 	st.w	$r1,$r3,12(0xc)
1c00a08c:	29802076 	st.w	$r22,$r3,8(0x8)
1c00a090:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00a094:	1c000046 	pcaddu12i	$r6,2(0x2)
1c00a098:	0292a0c6 	addi.w	$r6,$r6,1192(0x4a8)
1c00a09c:	0281d805 	addi.w	$r5,$r0,118(0x76)
1c00a0a0:	1c000044 	pcaddu12i	$r4,2(0x2)
1c00a0a4:	0285b084 	addi.w	$r4,$r4,364(0x16c)
1c00a0a8:	577b27ff 	bl	-34012(0xfff7b24) # 1c001bcc <myprintf>
1c00a0ac:	14000405 	lu12i.w	$r5,32(0x20)
1c00a0b0:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a0b4:	03808184 	ori	$r4,$r12,0x20
1c00a0b8:	579f3fff 	bl	-24772(0xfff9f3c) # 1c003ff4 <EXTI_ClearITPendingBit>
1c00a0bc:	03400000 	andi	$r0,$r0,0x0
1c00a0c0:	28803061 	ld.w	$r1,$r3,12(0xc)
1c00a0c4:	28802076 	ld.w	$r22,$r3,8(0x8)
1c00a0c8:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00a0cc:	4c000020 	jirl	$r0,$r1,0

1c00a0d0 <exti_gpioc2_irq_handler>:
exti_gpioc2_irq_handler():
1c00a0d0:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c00a0d4:	29803061 	st.w	$r1,$r3,12(0xc)
1c00a0d8:	29802076 	st.w	$r22,$r3,8(0x8)
1c00a0dc:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00a0e0:	1c000046 	pcaddu12i	$r6,2(0x2)
1c00a0e4:	0291d0c6 	addi.w	$r6,$r6,1140(0x474)
1c00a0e8:	0281f005 	addi.w	$r5,$r0,124(0x7c)
1c00a0ec:	1c000044 	pcaddu12i	$r4,2(0x2)
1c00a0f0:	02848084 	addi.w	$r4,$r4,288(0x120)
1c00a0f4:	577adbff 	bl	-34088(0xfff7ad8) # 1c001bcc <myprintf>
1c00a0f8:	14000805 	lu12i.w	$r5,64(0x40)
1c00a0fc:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a100:	03808184 	ori	$r4,$r12,0x20
1c00a104:	579ef3ff 	bl	-24848(0xfff9ef0) # 1c003ff4 <EXTI_ClearITPendingBit>
1c00a108:	03400000 	andi	$r0,$r0,0x0
1c00a10c:	28803061 	ld.w	$r1,$r3,12(0xc)
1c00a110:	28802076 	ld.w	$r22,$r3,8(0x8)
1c00a114:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00a118:	4c000020 	jirl	$r0,$r1,0

1c00a11c <exti_gpioc3_irq_handler>:
exti_gpioc3_irq_handler():
1c00a11c:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c00a120:	29803061 	st.w	$r1,$r3,12(0xc)
1c00a124:	29802076 	st.w	$r22,$r3,8(0x8)
1c00a128:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00a12c:	1c000046 	pcaddu12i	$r6,2(0x2)
1c00a130:	029100c6 	addi.w	$r6,$r6,1088(0x440)
1c00a134:	02820805 	addi.w	$r5,$r0,130(0x82)
1c00a138:	1c000044 	pcaddu12i	$r4,2(0x2)
1c00a13c:	02835084 	addi.w	$r4,$r4,212(0xd4)
1c00a140:	577a8fff 	bl	-34164(0xfff7a8c) # 1c001bcc <myprintf>
1c00a144:	14001005 	lu12i.w	$r5,128(0x80)
1c00a148:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a14c:	03808184 	ori	$r4,$r12,0x20
1c00a150:	579ea7ff 	bl	-24924(0xfff9ea4) # 1c003ff4 <EXTI_ClearITPendingBit>
1c00a154:	03400000 	andi	$r0,$r0,0x0
1c00a158:	28803061 	ld.w	$r1,$r3,12(0xc)
1c00a15c:	28802076 	ld.w	$r22,$r3,8(0x8)
1c00a160:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00a164:	4c000020 	jirl	$r0,$r1,0

1c00a168 <exti_gpioc4_irq_handler>:
exti_gpioc4_irq_handler():
1c00a168:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c00a16c:	29803061 	st.w	$r1,$r3,12(0xc)
1c00a170:	29802076 	st.w	$r22,$r3,8(0x8)
1c00a174:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00a178:	1c000046 	pcaddu12i	$r6,2(0x2)
1c00a17c:	029030c6 	addi.w	$r6,$r6,1036(0x40c)
1c00a180:	02822005 	addi.w	$r5,$r0,136(0x88)
1c00a184:	1c000044 	pcaddu12i	$r4,2(0x2)
1c00a188:	02822084 	addi.w	$r4,$r4,136(0x88)
1c00a18c:	577a43ff 	bl	-34240(0xfff7a40) # 1c001bcc <myprintf>
1c00a190:	14002005 	lu12i.w	$r5,256(0x100)
1c00a194:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a198:	03808184 	ori	$r4,$r12,0x20
1c00a19c:	579e5bff 	bl	-25000(0xfff9e58) # 1c003ff4 <EXTI_ClearITPendingBit>
1c00a1a0:	03400000 	andi	$r0,$r0,0x0
1c00a1a4:	28803061 	ld.w	$r1,$r3,12(0xc)
1c00a1a8:	28802076 	ld.w	$r22,$r3,8(0x8)
1c00a1ac:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00a1b0:	4c000020 	jirl	$r0,$r1,0

1c00a1b4 <exti_gpioc5_irq_handler>:
exti_gpioc5_irq_handler():
1c00a1b4:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c00a1b8:	29803061 	st.w	$r1,$r3,12(0xc)
1c00a1bc:	29802076 	st.w	$r22,$r3,8(0x8)
1c00a1c0:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00a1c4:	1c000046 	pcaddu12i	$r6,2(0x2)
1c00a1c8:	028f60c6 	addi.w	$r6,$r6,984(0x3d8)
1c00a1cc:	02823405 	addi.w	$r5,$r0,141(0x8d)
1c00a1d0:	1c000044 	pcaddu12i	$r4,2(0x2)
1c00a1d4:	0280f084 	addi.w	$r4,$r4,60(0x3c)
1c00a1d8:	5779f7ff 	bl	-34316(0xfff79f4) # 1c001bcc <myprintf>
1c00a1dc:	14004005 	lu12i.w	$r5,512(0x200)
1c00a1e0:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a1e4:	03808184 	ori	$r4,$r12,0x20
1c00a1e8:	579e0fff 	bl	-25076(0xfff9e0c) # 1c003ff4 <EXTI_ClearITPendingBit>
1c00a1ec:	03400000 	andi	$r0,$r0,0x0
1c00a1f0:	28803061 	ld.w	$r1,$r3,12(0xc)
1c00a1f4:	28802076 	ld.w	$r22,$r3,8(0x8)
1c00a1f8:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00a1fc:	4c000020 	jirl	$r0,$r1,0

1c00a200 <exti_gpioc6_irq_handler>:
exti_gpioc6_irq_handler():
1c00a200:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c00a204:	29803061 	st.w	$r1,$r3,12(0xc)
1c00a208:	29802076 	st.w	$r22,$r3,8(0x8)
1c00a20c:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00a210:	1c000046 	pcaddu12i	$r6,2(0x2)
1c00a214:	028e90c6 	addi.w	$r6,$r6,932(0x3a4)
1c00a218:	02824805 	addi.w	$r5,$r0,146(0x92)
1c00a21c:	1c000044 	pcaddu12i	$r4,2(0x2)
1c00a220:	02bfc084 	addi.w	$r4,$r4,-16(0xff0)
1c00a224:	5779abff 	bl	-34392(0xfff79a8) # 1c001bcc <myprintf>
1c00a228:	14008005 	lu12i.w	$r5,1024(0x400)
1c00a22c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a230:	03808184 	ori	$r4,$r12,0x20
1c00a234:	579dc3ff 	bl	-25152(0xfff9dc0) # 1c003ff4 <EXTI_ClearITPendingBit>
1c00a238:	03400000 	andi	$r0,$r0,0x0
1c00a23c:	28803061 	ld.w	$r1,$r3,12(0xc)
1c00a240:	28802076 	ld.w	$r22,$r3,8(0x8)
1c00a244:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00a248:	4c000020 	jirl	$r0,$r1,0

1c00a24c <exti_gpioc7_irq_handler>:
exti_gpioc7_irq_handler():
1c00a24c:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c00a250:	29803061 	st.w	$r1,$r3,12(0xc)
1c00a254:	29802076 	st.w	$r22,$r3,8(0x8)
1c00a258:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00a25c:	1c000046 	pcaddu12i	$r6,2(0x2)
1c00a260:	028dc0c6 	addi.w	$r6,$r6,880(0x370)
1c00a264:	02826005 	addi.w	$r5,$r0,152(0x98)
1c00a268:	1c000044 	pcaddu12i	$r4,2(0x2)
1c00a26c:	02be9084 	addi.w	$r4,$r4,-92(0xfa4)
1c00a270:	57795fff 	bl	-34468(0xfff795c) # 1c001bcc <myprintf>
1c00a274:	14010005 	lu12i.w	$r5,2048(0x800)
1c00a278:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a27c:	03808184 	ori	$r4,$r12,0x20
1c00a280:	579d77ff 	bl	-25228(0xfff9d74) # 1c003ff4 <EXTI_ClearITPendingBit>
1c00a284:	03400000 	andi	$r0,$r0,0x0
1c00a288:	28803061 	ld.w	$r1,$r3,12(0xc)
1c00a28c:	28802076 	ld.w	$r22,$r3,8(0x8)
1c00a290:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00a294:	4c000020 	jirl	$r0,$r1,0

1c00a298 <exti_gpiod0_irq_handler>:
exti_gpiod0_irq_handler():
1c00a298:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c00a29c:	29803061 	st.w	$r1,$r3,12(0xc)
1c00a2a0:	29802076 	st.w	$r22,$r3,8(0x8)
1c00a2a4:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00a2a8:	1c000046 	pcaddu12i	$r6,2(0x2)
1c00a2ac:	028cf0c6 	addi.w	$r6,$r6,828(0x33c)
1c00a2b0:	02827805 	addi.w	$r5,$r0,158(0x9e)
1c00a2b4:	1c000044 	pcaddu12i	$r4,2(0x2)
1c00a2b8:	02bd6084 	addi.w	$r4,$r4,-168(0xf58)
1c00a2bc:	577913ff 	bl	-34544(0xfff7910) # 1c001bcc <myprintf>
1c00a2c0:	14020005 	lu12i.w	$r5,4096(0x1000)
1c00a2c4:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a2c8:	03808184 	ori	$r4,$r12,0x20
1c00a2cc:	579d2bff 	bl	-25304(0xfff9d28) # 1c003ff4 <EXTI_ClearITPendingBit>
1c00a2d0:	03400000 	andi	$r0,$r0,0x0
1c00a2d4:	28803061 	ld.w	$r1,$r3,12(0xc)
1c00a2d8:	28802076 	ld.w	$r22,$r3,8(0x8)
1c00a2dc:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00a2e0:	4c000020 	jirl	$r0,$r1,0

1c00a2e4 <exti_gpiod1_irq_handler>:
exti_gpiod1_irq_handler():
1c00a2e4:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c00a2e8:	29803061 	st.w	$r1,$r3,12(0xc)
1c00a2ec:	29802076 	st.w	$r22,$r3,8(0x8)
1c00a2f0:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00a2f4:	1c000046 	pcaddu12i	$r6,2(0x2)
1c00a2f8:	028c20c6 	addi.w	$r6,$r6,776(0x308)
1c00a2fc:	02829005 	addi.w	$r5,$r0,164(0xa4)
1c00a300:	1c000044 	pcaddu12i	$r4,2(0x2)
1c00a304:	02bc3084 	addi.w	$r4,$r4,-244(0xf0c)
1c00a308:	5778c7ff 	bl	-34620(0xfff78c4) # 1c001bcc <myprintf>
1c00a30c:	14040005 	lu12i.w	$r5,8192(0x2000)
1c00a310:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a314:	03808184 	ori	$r4,$r12,0x20
1c00a318:	579cdfff 	bl	-25380(0xfff9cdc) # 1c003ff4 <EXTI_ClearITPendingBit>
1c00a31c:	03400000 	andi	$r0,$r0,0x0
1c00a320:	28803061 	ld.w	$r1,$r3,12(0xc)
1c00a324:	28802076 	ld.w	$r22,$r3,8(0x8)
1c00a328:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00a32c:	4c000020 	jirl	$r0,$r1,0

1c00a330 <exti_gpiod2_irq_handler>:
exti_gpiod2_irq_handler():
1c00a330:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c00a334:	29803061 	st.w	$r1,$r3,12(0xc)
1c00a338:	29802076 	st.w	$r22,$r3,8(0x8)
1c00a33c:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00a340:	1c000046 	pcaddu12i	$r6,2(0x2)
1c00a344:	028b50c6 	addi.w	$r6,$r6,724(0x2d4)
1c00a348:	0282a805 	addi.w	$r5,$r0,170(0xaa)
1c00a34c:	1c000044 	pcaddu12i	$r4,2(0x2)
1c00a350:	02bb0084 	addi.w	$r4,$r4,-320(0xec0)
1c00a354:	57787bff 	bl	-34696(0xfff7878) # 1c001bcc <myprintf>
1c00a358:	14080005 	lu12i.w	$r5,16384(0x4000)
1c00a35c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a360:	03808184 	ori	$r4,$r12,0x20
1c00a364:	579c93ff 	bl	-25456(0xfff9c90) # 1c003ff4 <EXTI_ClearITPendingBit>
1c00a368:	03400000 	andi	$r0,$r0,0x0
1c00a36c:	28803061 	ld.w	$r1,$r3,12(0xc)
1c00a370:	28802076 	ld.w	$r22,$r3,8(0x8)
1c00a374:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00a378:	4c000020 	jirl	$r0,$r1,0

1c00a37c <exti_gpiod3_irq_handler>:
exti_gpiod3_irq_handler():
1c00a37c:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c00a380:	29803061 	st.w	$r1,$r3,12(0xc)
1c00a384:	29802076 	st.w	$r22,$r3,8(0x8)
1c00a388:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00a38c:	1c000046 	pcaddu12i	$r6,2(0x2)
1c00a390:	028a80c6 	addi.w	$r6,$r6,672(0x2a0)
1c00a394:	0282c005 	addi.w	$r5,$r0,176(0xb0)
1c00a398:	1c000044 	pcaddu12i	$r4,2(0x2)
1c00a39c:	02b9d084 	addi.w	$r4,$r4,-396(0xe74)
1c00a3a0:	57782fff 	bl	-34772(0xfff782c) # 1c001bcc <myprintf>
1c00a3a4:	14100005 	lu12i.w	$r5,32768(0x8000)
1c00a3a8:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a3ac:	03808184 	ori	$r4,$r12,0x20
1c00a3b0:	579c47ff 	bl	-25532(0xfff9c44) # 1c003ff4 <EXTI_ClearITPendingBit>
1c00a3b4:	03400000 	andi	$r0,$r0,0x0
1c00a3b8:	28803061 	ld.w	$r1,$r3,12(0xc)
1c00a3bc:	28802076 	ld.w	$r22,$r3,8(0x8)
1c00a3c0:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00a3c4:	4c000020 	jirl	$r0,$r1,0

1c00a3c8 <exti_gpiod4_irq_handler>:
exti_gpiod4_irq_handler():
1c00a3c8:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c00a3cc:	29803061 	st.w	$r1,$r3,12(0xc)
1c00a3d0:	29802076 	st.w	$r22,$r3,8(0x8)
1c00a3d4:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00a3d8:	1c000046 	pcaddu12i	$r6,2(0x2)
1c00a3dc:	0289b0c6 	addi.w	$r6,$r6,620(0x26c)
1c00a3e0:	0282d805 	addi.w	$r5,$r0,182(0xb6)
1c00a3e4:	1c000044 	pcaddu12i	$r4,2(0x2)
1c00a3e8:	02b8a084 	addi.w	$r4,$r4,-472(0xe28)
1c00a3ec:	5777e3ff 	bl	-34848(0xfff77e0) # 1c001bcc <myprintf>
1c00a3f0:	14200005 	lu12i.w	$r5,65536(0x10000)
1c00a3f4:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a3f8:	03808184 	ori	$r4,$r12,0x20
1c00a3fc:	579bfbff 	bl	-25608(0xfff9bf8) # 1c003ff4 <EXTI_ClearITPendingBit>
1c00a400:	03400000 	andi	$r0,$r0,0x0
1c00a404:	28803061 	ld.w	$r1,$r3,12(0xc)
1c00a408:	28802076 	ld.w	$r22,$r3,8(0x8)
1c00a40c:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00a410:	4c000020 	jirl	$r0,$r1,0

1c00a414 <exti_gpiod5_irq_handler>:
exti_gpiod5_irq_handler():
1c00a414:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c00a418:	29803061 	st.w	$r1,$r3,12(0xc)
1c00a41c:	29802076 	st.w	$r22,$r3,8(0x8)
1c00a420:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00a424:	1c000046 	pcaddu12i	$r6,2(0x2)
1c00a428:	0288e0c6 	addi.w	$r6,$r6,568(0x238)
1c00a42c:	0282f405 	addi.w	$r5,$r0,189(0xbd)
1c00a430:	1c000044 	pcaddu12i	$r4,2(0x2)
1c00a434:	02b77084 	addi.w	$r4,$r4,-548(0xddc)
1c00a438:	577797ff 	bl	-34924(0xfff7794) # 1c001bcc <myprintf>
1c00a43c:	14400005 	lu12i.w	$r5,131072(0x20000)
1c00a440:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a444:	03808184 	ori	$r4,$r12,0x20
1c00a448:	579bafff 	bl	-25684(0xfff9bac) # 1c003ff4 <EXTI_ClearITPendingBit>
1c00a44c:	03400000 	andi	$r0,$r0,0x0
1c00a450:	28803061 	ld.w	$r1,$r3,12(0xc)
1c00a454:	28802076 	ld.w	$r22,$r3,8(0x8)
1c00a458:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00a45c:	4c000020 	jirl	$r0,$r1,0

1c00a460 <exti_gpiod6_irq_handler>:
exti_gpiod6_irq_handler():
1c00a460:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c00a464:	29803061 	st.w	$r1,$r3,12(0xc)
1c00a468:	29802076 	st.w	$r22,$r3,8(0x8)
1c00a46c:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00a470:	1c000046 	pcaddu12i	$r6,2(0x2)
1c00a474:	028810c6 	addi.w	$r6,$r6,516(0x204)
1c00a478:	02830c05 	addi.w	$r5,$r0,195(0xc3)
1c00a47c:	1c000044 	pcaddu12i	$r4,2(0x2)
1c00a480:	02b64084 	addi.w	$r4,$r4,-624(0xd90)
1c00a484:	57774bff 	bl	-35000(0xfff7748) # 1c001bcc <myprintf>
1c00a488:	14800005 	lu12i.w	$r5,262144(0x40000)
1c00a48c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a490:	03808184 	ori	$r4,$r12,0x20
1c00a494:	579b63ff 	bl	-25760(0xfff9b60) # 1c003ff4 <EXTI_ClearITPendingBit>
1c00a498:	03400000 	andi	$r0,$r0,0x0
1c00a49c:	28803061 	ld.w	$r1,$r3,12(0xc)
1c00a4a0:	28802076 	ld.w	$r22,$r3,8(0x8)
1c00a4a4:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00a4a8:	4c000020 	jirl	$r0,$r1,0

1c00a4ac <exti_gpiod7_irq_handler>:
exti_gpiod7_irq_handler():
1c00a4ac:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c00a4b0:	29803061 	st.w	$r1,$r3,12(0xc)
1c00a4b4:	29802076 	st.w	$r22,$r3,8(0x8)
1c00a4b8:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00a4bc:	1c000046 	pcaddu12i	$r6,2(0x2)
1c00a4c0:	028740c6 	addi.w	$r6,$r6,464(0x1d0)
1c00a4c4:	02832405 	addi.w	$r5,$r0,201(0xc9)
1c00a4c8:	1c000044 	pcaddu12i	$r4,2(0x2)
1c00a4cc:	02b51084 	addi.w	$r4,$r4,-700(0xd44)
1c00a4d0:	5776ffff 	bl	-35076(0xfff76fc) # 1c001bcc <myprintf>
1c00a4d4:	15000005 	lu12i.w	$r5,-524288(0x80000)
1c00a4d8:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a4dc:	03808184 	ori	$r4,$r12,0x20
1c00a4e0:	579b17ff 	bl	-25836(0xfff9b14) # 1c003ff4 <EXTI_ClearITPendingBit>
1c00a4e4:	03400000 	andi	$r0,$r0,0x0
1c00a4e8:	28803061 	ld.w	$r1,$r3,12(0xc)
1c00a4ec:	28802076 	ld.w	$r22,$r3,8(0x8)
1c00a4f0:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00a4f4:	4c000020 	jirl	$r0,$r1,0

1c00a4f8 <ext_handler>:
ext_handler():
1c00a4f8:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c00a4fc:	29807061 	st.w	$r1,$r3,28(0x1c)
1c00a500:	29806076 	st.w	$r22,$r3,24(0x18)
1c00a504:	02808076 	addi.w	$r22,$r3,32(0x20)
1c00a508:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a50c:	0380f18c 	ori	$r12,$r12,0x3c
1c00a510:	1402000d 	lu12i.w	$r13,4096(0x1000)
1c00a514:	2980018d 	st.w	$r13,$r12,0
1c00a518:	1c000046 	pcaddu12i	$r6,2(0x2)
1c00a51c:	028630c6 	addi.w	$r6,$r6,396(0x18c)
1c00a520:	0283d405 	addi.w	$r5,$r0,245(0xf5)
1c00a524:	1c000044 	pcaddu12i	$r4,2(0x2)
1c00a528:	02b3a084 	addi.w	$r4,$r4,-792(0xce8)
1c00a52c:	5776a3ff 	bl	-35168(0xfff76a0) # 1c001bcc <myprintf>
1c00a530:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a534:	0380818c 	ori	$r12,$r12,0x20
1c00a538:	2880318c 	ld.w	$r12,$r12,12(0xc)
1c00a53c:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c00a540:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a544:	0380818c 	ori	$r12,$r12,0x20
1c00a548:	2880018c 	ld.w	$r12,$r12,0
1c00a54c:	29bf92cc 	st.w	$r12,$r22,-28(0xfe4)
1c00a550:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c00a554:	28bf92cc 	ld.w	$r12,$r22,-28(0xfe4)
1c00a558:	0014b1ac 	and	$r12,$r13,$r12
1c00a55c:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c00a560:	03400000 	andi	$r0,$r0,0x0
1c00a564:	29bfb2c0 	st.w	$r0,$r22,-20(0xfec)
1c00a568:	50004000 	b	64(0x40) # 1c00a5a8 <ext_handler+0xb0>
1c00a56c:	28bfa2cd 	ld.w	$r13,$r22,-24(0xfe8)
1c00a570:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00a574:	0017b1ac 	srl.w	$r12,$r13,$r12
1c00a578:	0340058c 	andi	$r12,$r12,0x1
1c00a57c:	40002180 	beqz	$r12,32(0x20) # 1c00a59c <ext_handler+0xa4>
1c00a580:	1c00004d 	pcaddu12i	$r13,2(0x2)
1c00a584:	02b581ad 	addi.w	$r13,$r13,-672(0xd60)
1c00a588:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00a58c:	0040898c 	slli.w	$r12,$r12,0x2
1c00a590:	001031ac 	add.w	$r12,$r13,$r12
1c00a594:	2880018c 	ld.w	$r12,$r12,0
1c00a598:	4c000181 	jirl	$r1,$r12,0
1c00a59c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00a5a0:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c00a5a4:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c00a5a8:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c00a5ac:	02807c0c 	addi.w	$r12,$r0,31(0x1f)
1c00a5b0:	6fffbd8d 	bgeu	$r12,$r13,-68(0x3ffbc) # 1c00a56c <ext_handler+0x74>
1c00a5b4:	03400000 	andi	$r0,$r0,0x0
1c00a5b8:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c00a5bc:	28806076 	ld.w	$r22,$r3,24(0x18)
1c00a5c0:	02808063 	addi.w	$r3,$r3,32(0x20)
1c00a5c4:	4c000020 	jirl	$r0,$r1,0

1c00a5c8 <TIMER_WAKE_INT>:
TIMER_WAKE_INT():
1c00a5c8:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c00a5cc:	29807061 	st.w	$r1,$r3,28(0x1c)
1c00a5d0:	29806076 	st.w	$r22,$r3,24(0x18)
1c00a5d4:	02808076 	addi.w	$r22,$r3,32(0x20)
1c00a5d8:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a5dc:	0380f18c 	ori	$r12,$r12,0x3c
1c00a5e0:	1400020d 	lu12i.w	$r13,16(0x10)
1c00a5e4:	2980018d 	st.w	$r13,$r12,0
1c00a5e8:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a5ec:	0380118c 	ori	$r12,$r12,0x4
1c00a5f0:	2880018c 	ld.w	$r12,$r12,0
1c00a5f4:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c00a5f8:	579a87ff 	bl	-25980(0xfff9a84) # 1c00407c <WDG_DogFeed>
1c00a5fc:	03400000 	andi	$r0,$r0,0x0
1c00a600:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c00a604:	28806076 	ld.w	$r22,$r3,24(0x18)
1c00a608:	02808063 	addi.w	$r3,$r3,32(0x20)
1c00a60c:	4c000020 	jirl	$r0,$r1,0

1c00a610 <TOUCH>:
TOUCH():
1c00a610:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c00a614:	29807061 	st.w	$r1,$r3,28(0x1c)
1c00a618:	29806076 	st.w	$r22,$r3,24(0x18)
1c00a61c:	02808076 	addi.w	$r22,$r3,32(0x20)
1c00a620:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c00a624:	0380118c 	ori	$r12,$r12,0x4
1c00a628:	2880018c 	ld.w	$r12,$r12,0
1c00a62c:	0044c18c 	srli.w	$r12,$r12,0x10
1c00a630:	006f818c 	bstrpick.w	$r12,$r12,0xf,0x0
1c00a634:	037ffd8c 	andi	$r12,$r12,0xfff
1c00a638:	297fbacc 	st.h	$r12,$r22,-18(0xfee)
1c00a63c:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c00a640:	0380118c 	ori	$r12,$r12,0x4
1c00a644:	2880018c 	ld.w	$r12,$r12,0
1c00a648:	0067818c 	bstrpick.w	$r12,$r12,0x7,0x0
1c00a64c:	03403d8c 	andi	$r12,$r12,0xf
1c00a650:	293fb6cc 	st.b	$r12,$r22,-19(0xfed)
1c00a654:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a658:	0380f18c 	ori	$r12,$r12,0x3c
1c00a65c:	1400040d 	lu12i.w	$r13,32(0x20)
1c00a660:	2980018d 	st.w	$r13,$r12,0
1c00a664:	157fd68c 	lu12i.w	$r12,-262476(0xbfeb4)
1c00a668:	0380118c 	ori	$r12,$r12,0x4
1c00a66c:	02803c0d 	addi.w	$r13,$r0,15(0xf)
1c00a670:	2980018d 	st.w	$r13,$r12,0
1c00a674:	2a7fbacc 	ld.hu	$r12,$r22,-18(0xfee)
1c00a678:	00150185 	move	$r5,$r12
1c00a67c:	1c000044 	pcaddu12i	$r4,2(0x2)
1c00a680:	02af6084 	addi.w	$r4,$r4,-1064(0xbd8)
1c00a684:	57754bff 	bl	-35512(0xfff7548) # 1c001bcc <myprintf>
1c00a688:	03400000 	andi	$r0,$r0,0x0
1c00a68c:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c00a690:	28806076 	ld.w	$r22,$r3,24(0x18)
1c00a694:	02808063 	addi.w	$r3,$r3,32(0x20)
1c00a698:	4c000020 	jirl	$r0,$r1,0

1c00a69c <UART2_INT>:
UART2_INT():
1c00a69c:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c00a6a0:	29807076 	st.w	$r22,$r3,28(0x1c)
1c00a6a4:	02808076 	addi.w	$r22,$r3,32(0x20)
1c00a6a8:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a6ac:	0380f18c 	ori	$r12,$r12,0x3c
1c00a6b0:	1400080d 	lu12i.w	$r13,64(0x40)
1c00a6b4:	2980018d 	st.w	$r13,$r12,0
1c00a6b8:	157fd18c 	lu12i.w	$r12,-262516(0xbfe8c)
1c00a6bc:	0380098c 	ori	$r12,$r12,0x2
1c00a6c0:	2a00018c 	ld.bu	$r12,$r12,0
1c00a6c4:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c00a6c8:	03400000 	andi	$r0,$r0,0x0
1c00a6cc:	28807076 	ld.w	$r22,$r3,28(0x1c)
1c00a6d0:	02808063 	addi.w	$r3,$r3,32(0x20)
1c00a6d4:	4c000020 	jirl	$r0,$r1,0

1c00a6d8 <BAT_FAIL>:
BAT_FAIL():
1c00a6d8:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c00a6dc:	29807061 	st.w	$r1,$r3,28(0x1c)
1c00a6e0:	29806076 	st.w	$r22,$r3,24(0x18)
1c00a6e4:	02808076 	addi.w	$r22,$r3,32(0x20)
1c00a6e8:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a6ec:	0380118c 	ori	$r12,$r12,0x4
1c00a6f0:	2880018c 	ld.w	$r12,$r12,0
1c00a6f4:	0044cd8c 	srli.w	$r12,$r12,0x13
1c00a6f8:	03407d8c 	andi	$r12,$r12,0x1f
1c00a6fc:	29bfb2cc 	st.w	$r12,$r22,-20(0xfec)
1c00a700:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a704:	0380118c 	ori	$r12,$r12,0x4
1c00a708:	2880018e 	ld.w	$r14,$r12,0
1c00a70c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a710:	0380f18c 	ori	$r12,$r12,0x3c
1c00a714:	1401f00d 	lu12i.w	$r13,3968(0xf80)
1c00a718:	0014b5cd 	and	$r13,$r14,$r13
1c00a71c:	2980018d 	st.w	$r13,$r12,0
1c00a720:	28bfb2cd 	ld.w	$r13,$r22,-20(0xfec)
1c00a724:	0280400c 	addi.w	$r12,$r0,16(0x10)
1c00a728:	6800718d 	bltu	$r12,$r13,112(0x70) # 1c00a798 <BAT_FAIL+0xc0>
1c00a72c:	28bfb2cc 	ld.w	$r12,$r22,-20(0xfec)
1c00a730:	0040898d 	slli.w	$r13,$r12,0x2
1c00a734:	1c00004c 	pcaddu12i	$r12,2(0x2)
1c00a738:	02b0b18c 	addi.w	$r12,$r12,-980(0xc2c)
1c00a73c:	001031ac 	add.w	$r12,$r13,$r12
1c00a740:	2880018c 	ld.w	$r12,$r12,0
1c00a744:	4c000180 	jirl	$r0,$r12,0
1c00a748:	1c000044 	pcaddu12i	$r4,2(0x2)
1c00a74c:	02acb084 	addi.w	$r4,$r4,-1236(0xb2c)
1c00a750:	57747fff 	bl	-35716(0xfff747c) # 1c001bcc <myprintf>
1c00a754:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a758:	0380118c 	ori	$r12,$r12,0x4
1c00a75c:	29800180 	st.w	$r0,$r12,0
1c00a760:	50003c00 	b	60(0x3c) # 1c00a79c <BAT_FAIL+0xc4>
1c00a764:	1c000044 	pcaddu12i	$r4,2(0x2)
1c00a768:	02ace084 	addi.w	$r4,$r4,-1224(0xb38)
1c00a76c:	577463ff 	bl	-35744(0xfff7460) # 1c001bcc <myprintf>
1c00a770:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a774:	0380118c 	ori	$r12,$r12,0x4
1c00a778:	2880018e 	ld.w	$r14,$r12,0
1c00a77c:	157fd60c 	lu12i.w	$r12,-262480(0xbfeb0)
1c00a780:	0380118c 	ori	$r12,$r12,0x4
1c00a784:	15fffeed 	lu12i.w	$r13,-9(0xffff7)
1c00a788:	03bffdad 	ori	$r13,$r13,0xfff
1c00a78c:	0014b5cd 	and	$r13,$r14,$r13
1c00a790:	2980018d 	st.w	$r13,$r12,0
1c00a794:	50000800 	b	8(0x8) # 1c00a79c <BAT_FAIL+0xc4>
1c00a798:	03400000 	andi	$r0,$r0,0x0
1c00a79c:	03400000 	andi	$r0,$r0,0x0
1c00a7a0:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c00a7a4:	28806076 	ld.w	$r22,$r3,24(0x18)
1c00a7a8:	02808063 	addi.w	$r3,$r3,32(0x20)
1c00a7ac:	4c000020 	jirl	$r0,$r1,0

1c00a7b0 <intc_handler>:
intc_handler():
1c00a7b0:	02bf4063 	addi.w	$r3,$r3,-48(0xfd0)
1c00a7b4:	2980b061 	st.w	$r1,$r3,44(0x2c)
1c00a7b8:	2980a076 	st.w	$r22,$r3,40(0x28)
1c00a7bc:	0280c076 	addi.w	$r22,$r3,48(0x30)
1c00a7c0:	157fd40c 	lu12i.w	$r12,-262496(0xbfea0)
1c00a7c4:	0380158c 	ori	$r12,$r12,0x5
1c00a7c8:	2a00018c 	ld.bu	$r12,$r12,0
1c00a7cc:	293f9ecc 	st.b	$r12,$r22,-25(0xfe7)
1c00a7d0:	2a3f9ecc 	ld.bu	$r12,$r22,-25(0xfe7)
1c00a7d4:	0340058c 	andi	$r12,$r12,0x1
1c00a7d8:	40061d80 	beqz	$r12,1564(0x61c) # 1c00adf4 <intc_handler+0x644>
1c00a7dc:	02840004 	addi.w	$r4,$r0,256(0x100)
1c00a7e0:	57a913ff 	bl	-22256(0xfffa910) # 1c0050f0 <TIM_GetITStatus>
1c00a7e4:	0015008c 	move	$r12,$r4
1c00a7e8:	40060d80 	beqz	$r12,1548(0x60c) # 1c00adf4 <intc_handler+0x644>
1c00a7ec:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00a7f0:	02a3718c 	addi.w	$r12,$r12,-1828(0x8dc)
1c00a7f4:	2880018d 	ld.w	$r13,$r12,0
1c00a7f8:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c00a7fc:	5c0021ac 	bne	$r13,$r12,32(0x20) # 1c00a81c <intc_handler+0x6c>
1c00a800:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00a804:	02a7d18c 	addi.w	$r12,$r12,-1548(0x9f4)
1c00a808:	2880018c 	ld.w	$r12,$r12,0
1c00a80c:	0280058d 	addi.w	$r13,$r12,1(0x1)
1c00a810:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00a814:	02a7918c 	addi.w	$r12,$r12,-1564(0x9e4)
1c00a818:	2980018d 	st.w	$r13,$r12,0
1c00a81c:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00a820:	02a7618c 	addi.w	$r12,$r12,-1576(0x9d8)
1c00a824:	2880018d 	ld.w	$r13,$r12,0
1c00a828:	028fa00c 	addi.w	$r12,$r0,1000(0x3e8)
1c00a82c:	5c001dac 	bne	$r13,$r12,28(0x1c) # 1c00a848 <intc_handler+0x98>
1c00a830:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00a834:	02a7118c 	addi.w	$r12,$r12,-1596(0x9c4)
1c00a838:	29800180 	st.w	$r0,$r12,0
1c00a83c:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00a840:	02a2318c 	addi.w	$r12,$r12,-1908(0x88c)
1c00a844:	29800180 	st.w	$r0,$r12,0
1c00a848:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00a84c:	02a1f18c 	addi.w	$r12,$r12,-1924(0x87c)
1c00a850:	2880018c 	ld.w	$r12,$r12,0
1c00a854:	0280058d 	addi.w	$r13,$r12,1(0x1)
1c00a858:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00a85c:	02a1b18c 	addi.w	$r12,$r12,-1940(0x86c)
1c00a860:	2980018d 	st.w	$r13,$r12,0
1c00a864:	5787b7ff 	bl	-30796(0xfff87b4) # 1c003018 <Read_Key_output>
1c00a868:	0015008c 	move	$r12,$r4
1c00a86c:	0015018d 	move	$r13,$r12
1c00a870:	1cc7feec 	pcaddu12i	$r12,409591(0x63ff7)
1c00a874:	28a0618c 	ld.w	$r12,$r12,-2024(0x818)
1c00a878:	2980018d 	st.w	$r13,$r12,0
1c00a87c:	1cc7feec 	pcaddu12i	$r12,409591(0x63ff7)
1c00a880:	28a0318c 	ld.w	$r12,$r12,-2036(0x80c)
1c00a884:	2880018d 	ld.w	$r13,$r12,0
1c00a888:	140001ec 	lu12i.w	$r12,15(0xf)
1c00a88c:	03bbfd8c 	ori	$r12,$r12,0xeff
1c00a890:	001531ad 	or	$r13,$r13,$r12
1c00a894:	140001ec 	lu12i.w	$r12,15(0xf)
1c00a898:	03bbfd8c 	ori	$r12,$r12,0xeff
1c00a89c:	5c0019ac 	bne	$r13,$r12,24(0x18) # 1c00a8b4 <intc_handler+0x104>
1c00a8a0:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00a8a4:	02a1818c 	addi.w	$r12,$r12,-1952(0x860)
1c00a8a8:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c00a8ac:	2980018d 	st.w	$r13,$r12,0
1c00a8b0:	50001000 	b	16(0x10) # 1c00a8c0 <intc_handler+0x110>
1c00a8b4:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00a8b8:	02a1318c 	addi.w	$r12,$r12,-1972(0x84c)
1c00a8bc:	29800180 	st.w	$r0,$r12,0
1c00a8c0:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00a8c4:	289f218c 	ld.w	$r12,$r12,1992(0x7c8)
1c00a8c8:	2880018d 	ld.w	$r13,$r12,0
1c00a8cc:	140001ec 	lu12i.w	$r12,15(0xf)
1c00a8d0:	03b7fd8c 	ori	$r12,$r12,0xdff
1c00a8d4:	001531ad 	or	$r13,$r13,$r12
1c00a8d8:	140001ec 	lu12i.w	$r12,15(0xf)
1c00a8dc:	03b7fd8c 	ori	$r12,$r12,0xdff
1c00a8e0:	5c0019ac 	bne	$r13,$r12,24(0x18) # 1c00a8f8 <intc_handler+0x148>
1c00a8e4:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00a8e8:	02a0618c 	addi.w	$r12,$r12,-2024(0x818)
1c00a8ec:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c00a8f0:	2980018d 	st.w	$r13,$r12,0
1c00a8f4:	50001000 	b	16(0x10) # 1c00a904 <intc_handler+0x154>
1c00a8f8:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00a8fc:	02a0118c 	addi.w	$r12,$r12,-2044(0x804)
1c00a900:	29800180 	st.w	$r0,$r12,0
1c00a904:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00a908:	289e118c 	ld.w	$r12,$r12,1924(0x784)
1c00a90c:	2880018d 	ld.w	$r13,$r12,0
1c00a910:	140001ec 	lu12i.w	$r12,15(0xf)
1c00a914:	03bbfd8c 	ori	$r12,$r12,0xeff
1c00a918:	001531ad 	or	$r13,$r13,$r12
1c00a91c:	140001ec 	lu12i.w	$r12,15(0xf)
1c00a920:	03bbfd8c 	ori	$r12,$r12,0xeff
1c00a924:	580029ac 	beq	$r13,$r12,40(0x28) # 1c00a94c <intc_handler+0x19c>
1c00a928:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00a92c:	289d818c 	ld.w	$r12,$r12,1888(0x760)
1c00a930:	2880018d 	ld.w	$r13,$r12,0
1c00a934:	140001ec 	lu12i.w	$r12,15(0xf)
1c00a938:	03b7fd8c 	ori	$r12,$r12,0xdff
1c00a93c:	001531ad 	or	$r13,$r13,$r12
1c00a940:	140001ec 	lu12i.w	$r12,15(0xf)
1c00a944:	03b7fd8c 	ori	$r12,$r12,0xdff
1c00a948:	5c0019ac 	bne	$r13,$r12,24(0x18) # 1c00a960 <intc_handler+0x1b0>
1c00a94c:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00a950:	029f418c 	addi.w	$r12,$r12,2000(0x7d0)
1c00a954:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c00a958:	2980018d 	st.w	$r13,$r12,0
1c00a95c:	50001000 	b	16(0x10) # 1c00a96c <intc_handler+0x1bc>
1c00a960:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00a964:	029ef18c 	addi.w	$r12,$r12,1980(0x7bc)
1c00a968:	29800180 	st.w	$r0,$r12,0
1c00a96c:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00a970:	289c718c 	ld.w	$r12,$r12,1820(0x71c)
1c00a974:	2880018d 	ld.w	$r13,$r12,0
1c00a978:	140001ec 	lu12i.w	$r12,15(0xf)
1c00a97c:	03affd8c 	ori	$r12,$r12,0xbff
1c00a980:	001531ad 	or	$r13,$r13,$r12
1c00a984:	140001ec 	lu12i.w	$r12,15(0xf)
1c00a988:	03affd8c 	ori	$r12,$r12,0xbff
1c00a98c:	5c0019ac 	bne	$r13,$r12,24(0x18) # 1c00a9a4 <intc_handler+0x1f4>
1c00a990:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00a994:	029e518c 	addi.w	$r12,$r12,1940(0x794)
1c00a998:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c00a99c:	2980018d 	st.w	$r13,$r12,0
1c00a9a0:	50001000 	b	16(0x10) # 1c00a9b0 <intc_handler+0x200>
1c00a9a4:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00a9a8:	029e018c 	addi.w	$r12,$r12,1920(0x780)
1c00a9ac:	29800180 	st.w	$r0,$r12,0
1c00a9b0:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00a9b4:	289b618c 	ld.w	$r12,$r12,1752(0x6d8)
1c00a9b8:	2880018d 	ld.w	$r13,$r12,0
1c00a9bc:	140001ec 	lu12i.w	$r12,15(0xf)
1c00a9c0:	039ffd8c 	ori	$r12,$r12,0x7ff
1c00a9c4:	001531ad 	or	$r13,$r13,$r12
1c00a9c8:	140001ec 	lu12i.w	$r12,15(0xf)
1c00a9cc:	039ffd8c 	ori	$r12,$r12,0x7ff
1c00a9d0:	5c0019ac 	bne	$r13,$r12,24(0x18) # 1c00a9e8 <intc_handler+0x238>
1c00a9d4:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00a9d8:	029d618c 	addi.w	$r12,$r12,1880(0x758)
1c00a9dc:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c00a9e0:	2980018d 	st.w	$r13,$r12,0
1c00a9e4:	50001000 	b	16(0x10) # 1c00a9f4 <intc_handler+0x244>
1c00a9e8:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00a9ec:	029d118c 	addi.w	$r12,$r12,1860(0x744)
1c00a9f0:	29800180 	st.w	$r0,$r12,0
1c00a9f4:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00a9f8:	289a518c 	ld.w	$r12,$r12,1684(0x694)
1c00a9fc:	2880018d 	ld.w	$r13,$r12,0
1c00aa00:	140001cc 	lu12i.w	$r12,14(0xe)
1c00aa04:	03bffd8c 	ori	$r12,$r12,0xfff
1c00aa08:	001531ad 	or	$r13,$r13,$r12
1c00aa0c:	140001cc 	lu12i.w	$r12,14(0xe)
1c00aa10:	03bffd8c 	ori	$r12,$r12,0xfff
1c00aa14:	5c0019ac 	bne	$r13,$r12,24(0x18) # 1c00aa2c <intc_handler+0x27c>
1c00aa18:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00aa1c:	029c718c 	addi.w	$r12,$r12,1820(0x71c)
1c00aa20:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c00aa24:	2980018d 	st.w	$r13,$r12,0
1c00aa28:	50001c00 	b	28(0x1c) # 1c00aa44 <intc_handler+0x294>
1c00aa2c:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00aa30:	029c218c 	addi.w	$r12,$r12,1800(0x708)
1c00aa34:	29800180 	st.w	$r0,$r12,0
1c00aa38:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00aa3c:	029cb18c 	addi.w	$r12,$r12,1836(0x72c)
1c00aa40:	29800180 	st.w	$r0,$r12,0
1c00aa44:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00aa48:	2899118c 	ld.w	$r12,$r12,1604(0x644)
1c00aa4c:	2880018d 	ld.w	$r13,$r12,0
1c00aa50:	140001ac 	lu12i.w	$r12,13(0xd)
1c00aa54:	03bffd8c 	ori	$r12,$r12,0xfff
1c00aa58:	001531ad 	or	$r13,$r13,$r12
1c00aa5c:	140001ac 	lu12i.w	$r12,13(0xd)
1c00aa60:	03bffd8c 	ori	$r12,$r12,0xfff
1c00aa64:	5c0019ac 	bne	$r13,$r12,24(0x18) # 1c00aa7c <intc_handler+0x2cc>
1c00aa68:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00aa6c:	029b518c 	addi.w	$r12,$r12,1748(0x6d4)
1c00aa70:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c00aa74:	2980018d 	st.w	$r13,$r12,0
1c00aa78:	50001c00 	b	28(0x1c) # 1c00aa94 <intc_handler+0x2e4>
1c00aa7c:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00aa80:	029b018c 	addi.w	$r12,$r12,1728(0x6c0)
1c00aa84:	29800180 	st.w	$r0,$r12,0
1c00aa88:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00aa8c:	029b818c 	addi.w	$r12,$r12,1760(0x6e0)
1c00aa90:	29800180 	st.w	$r0,$r12,0
1c00aa94:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00aa98:	2897d18c 	ld.w	$r12,$r12,1524(0x5f4)
1c00aa9c:	2880018d 	ld.w	$r13,$r12,0
1c00aaa0:	1400016c 	lu12i.w	$r12,11(0xb)
1c00aaa4:	03bffd8c 	ori	$r12,$r12,0xfff
1c00aaa8:	001531ad 	or	$r13,$r13,$r12
1c00aaac:	1400016c 	lu12i.w	$r12,11(0xb)
1c00aab0:	03bffd8c 	ori	$r12,$r12,0xfff
1c00aab4:	5c0019ac 	bne	$r13,$r12,24(0x18) # 1c00aacc <intc_handler+0x31c>
1c00aab8:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00aabc:	029a318c 	addi.w	$r12,$r12,1676(0x68c)
1c00aac0:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c00aac4:	2980018d 	st.w	$r13,$r12,0
1c00aac8:	50001c00 	b	28(0x1c) # 1c00aae4 <intc_handler+0x334>
1c00aacc:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00aad0:	0299e18c 	addi.w	$r12,$r12,1656(0x678)
1c00aad4:	29800180 	st.w	$r0,$r12,0
1c00aad8:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00aadc:	029a518c 	addi.w	$r12,$r12,1684(0x694)
1c00aae0:	29800180 	st.w	$r0,$r12,0
1c00aae4:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00aae8:	2896918c 	ld.w	$r12,$r12,1444(0x5a4)
1c00aaec:	2880018d 	ld.w	$r13,$r12,0
1c00aaf0:	140000ec 	lu12i.w	$r12,7(0x7)
1c00aaf4:	03bffd8c 	ori	$r12,$r12,0xfff
1c00aaf8:	001531ad 	or	$r13,$r13,$r12
1c00aafc:	140000ec 	lu12i.w	$r12,7(0x7)
1c00ab00:	03bffd8c 	ori	$r12,$r12,0xfff
1c00ab04:	5c0019ac 	bne	$r13,$r12,24(0x18) # 1c00ab1c <intc_handler+0x36c>
1c00ab08:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00ab0c:	0299118c 	addi.w	$r12,$r12,1604(0x644)
1c00ab10:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c00ab14:	2980018d 	st.w	$r13,$r12,0
1c00ab18:	50001c00 	b	28(0x1c) # 1c00ab34 <intc_handler+0x384>
1c00ab1c:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00ab20:	0298c18c 	addi.w	$r12,$r12,1584(0x630)
1c00ab24:	29800180 	st.w	$r0,$r12,0
1c00ab28:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00ab2c:	0299218c 	addi.w	$r12,$r12,1608(0x648)
1c00ab30:	29800180 	st.w	$r0,$r12,0
1c00ab34:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00ab38:	2895518c 	ld.w	$r12,$r12,1364(0x554)
1c00ab3c:	2880018d 	ld.w	$r13,$r12,0
1c00ab40:	140001ec 	lu12i.w	$r12,15(0xf)
1c00ab44:	03bff98c 	ori	$r12,$r12,0xffe
1c00ab48:	001531ad 	or	$r13,$r13,$r12
1c00ab4c:	140001ec 	lu12i.w	$r12,15(0xf)
1c00ab50:	03bff98c 	ori	$r12,$r12,0xffe
1c00ab54:	5c0019ac 	bne	$r13,$r12,24(0x18) # 1c00ab6c <intc_handler+0x3bc>
1c00ab58:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00ab5c:	0296c18c 	addi.w	$r12,$r12,1456(0x5b0)
1c00ab60:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c00ab64:	2980018d 	st.w	$r13,$r12,0
1c00ab68:	50001000 	b	16(0x10) # 1c00ab78 <intc_handler+0x3c8>
1c00ab6c:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00ab70:	0296718c 	addi.w	$r12,$r12,1436(0x59c)
1c00ab74:	29800180 	st.w	$r0,$r12,0
1c00ab78:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00ab7c:	2894418c 	ld.w	$r12,$r12,1296(0x510)
1c00ab80:	2880018d 	ld.w	$r13,$r12,0
1c00ab84:	140001ec 	lu12i.w	$r12,15(0xf)
1c00ab88:	03bff58c 	ori	$r12,$r12,0xffd
1c00ab8c:	001531ad 	or	$r13,$r13,$r12
1c00ab90:	140001ec 	lu12i.w	$r12,15(0xf)
1c00ab94:	03bff58c 	ori	$r12,$r12,0xffd
1c00ab98:	5c0019ac 	bne	$r13,$r12,24(0x18) # 1c00abb0 <intc_handler+0x400>
1c00ab9c:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00aba0:	0295a18c 	addi.w	$r12,$r12,1384(0x568)
1c00aba4:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c00aba8:	2980018d 	st.w	$r13,$r12,0
1c00abac:	50001000 	b	16(0x10) # 1c00abbc <intc_handler+0x40c>
1c00abb0:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00abb4:	0295518c 	addi.w	$r12,$r12,1364(0x554)
1c00abb8:	29800180 	st.w	$r0,$r12,0
1c00abbc:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00abc0:	2893318c 	ld.w	$r12,$r12,1228(0x4cc)
1c00abc4:	2880018d 	ld.w	$r13,$r12,0
1c00abc8:	140001ec 	lu12i.w	$r12,15(0xf)
1c00abcc:	03bff98c 	ori	$r12,$r12,0xffe
1c00abd0:	001531ad 	or	$r13,$r13,$r12
1c00abd4:	140001ec 	lu12i.w	$r12,15(0xf)
1c00abd8:	03bff98c 	ori	$r12,$r12,0xffe
1c00abdc:	580029ac 	beq	$r13,$r12,40(0x28) # 1c00ac04 <intc_handler+0x454>
1c00abe0:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00abe4:	2892a18c 	ld.w	$r12,$r12,1192(0x4a8)
1c00abe8:	2880018d 	ld.w	$r13,$r12,0
1c00abec:	140001ec 	lu12i.w	$r12,15(0xf)
1c00abf0:	03bff58c 	ori	$r12,$r12,0xffd
1c00abf4:	001531ad 	or	$r13,$r13,$r12
1c00abf8:	140001ec 	lu12i.w	$r12,15(0xf)
1c00abfc:	03bff58c 	ori	$r12,$r12,0xffd
1c00ac00:	5c0019ac 	bne	$r13,$r12,24(0x18) # 1c00ac18 <intc_handler+0x468>
1c00ac04:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00ac08:	0294718c 	addi.w	$r12,$r12,1308(0x51c)
1c00ac0c:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c00ac10:	2980018d 	st.w	$r13,$r12,0
1c00ac14:	50001000 	b	16(0x10) # 1c00ac24 <intc_handler+0x474>
1c00ac18:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00ac1c:	0294218c 	addi.w	$r12,$r12,1288(0x508)
1c00ac20:	29800180 	st.w	$r0,$r12,0
1c00ac24:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00ac28:	2891918c 	ld.w	$r12,$r12,1124(0x464)
1c00ac2c:	2880018d 	ld.w	$r13,$r12,0
1c00ac30:	140001ec 	lu12i.w	$r12,15(0xf)
1c00ac34:	03bfed8c 	ori	$r12,$r12,0xffb
1c00ac38:	001531ad 	or	$r13,$r13,$r12
1c00ac3c:	140001ec 	lu12i.w	$r12,15(0xf)
1c00ac40:	03bfed8c 	ori	$r12,$r12,0xffb
1c00ac44:	5c0019ac 	bne	$r13,$r12,24(0x18) # 1c00ac5c <intc_handler+0x4ac>
1c00ac48:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00ac4c:	0293818c 	addi.w	$r12,$r12,1248(0x4e0)
1c00ac50:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c00ac54:	2980018d 	st.w	$r13,$r12,0
1c00ac58:	50001000 	b	16(0x10) # 1c00ac68 <intc_handler+0x4b8>
1c00ac5c:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00ac60:	0293318c 	addi.w	$r12,$r12,1228(0x4cc)
1c00ac64:	29800180 	st.w	$r0,$r12,0
1c00ac68:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00ac6c:	2890818c 	ld.w	$r12,$r12,1056(0x420)
1c00ac70:	2880018d 	ld.w	$r13,$r12,0
1c00ac74:	140001ec 	lu12i.w	$r12,15(0xf)
1c00ac78:	03bfdd8c 	ori	$r12,$r12,0xff7
1c00ac7c:	001531ad 	or	$r13,$r13,$r12
1c00ac80:	140001ec 	lu12i.w	$r12,15(0xf)
1c00ac84:	03bfdd8c 	ori	$r12,$r12,0xff7
1c00ac88:	5c0019ac 	bne	$r13,$r12,24(0x18) # 1c00aca0 <intc_handler+0x4f0>
1c00ac8c:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00ac90:	0292918c 	addi.w	$r12,$r12,1188(0x4a4)
1c00ac94:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c00ac98:	2980018d 	st.w	$r13,$r12,0
1c00ac9c:	50001000 	b	16(0x10) # 1c00acac <intc_handler+0x4fc>
1c00aca0:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00aca4:	0292418c 	addi.w	$r12,$r12,1168(0x490)
1c00aca8:	29800180 	st.w	$r0,$r12,0
1c00acac:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00acb0:	288f718c 	ld.w	$r12,$r12,988(0x3dc)
1c00acb4:	2880018d 	ld.w	$r13,$r12,0
1c00acb8:	140001ec 	lu12i.w	$r12,15(0xf)
1c00acbc:	03bfbd8c 	ori	$r12,$r12,0xfef
1c00acc0:	001531ad 	or	$r13,$r13,$r12
1c00acc4:	140001ec 	lu12i.w	$r12,15(0xf)
1c00acc8:	03bfbd8c 	ori	$r12,$r12,0xfef
1c00accc:	5c0019ac 	bne	$r13,$r12,24(0x18) # 1c00ace4 <intc_handler+0x534>
1c00acd0:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00acd4:	0291a18c 	addi.w	$r12,$r12,1128(0x468)
1c00acd8:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c00acdc:	2980018d 	st.w	$r13,$r12,0
1c00ace0:	50001c00 	b	28(0x1c) # 1c00acfc <intc_handler+0x54c>
1c00ace4:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00ace8:	0291518c 	addi.w	$r12,$r12,1108(0x454)
1c00acec:	29800180 	st.w	$r0,$r12,0
1c00acf0:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00acf4:	0292118c 	addi.w	$r12,$r12,1156(0x484)
1c00acf8:	29800180 	st.w	$r0,$r12,0
1c00acfc:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00ad00:	288e318c 	ld.w	$r12,$r12,908(0x38c)
1c00ad04:	2880018d 	ld.w	$r13,$r12,0
1c00ad08:	140001ec 	lu12i.w	$r12,15(0xf)
1c00ad0c:	03bf7d8c 	ori	$r12,$r12,0xfdf
1c00ad10:	001531ad 	or	$r13,$r13,$r12
1c00ad14:	140001ec 	lu12i.w	$r12,15(0xf)
1c00ad18:	03bf7d8c 	ori	$r12,$r12,0xfdf
1c00ad1c:	5c0019ac 	bne	$r13,$r12,24(0x18) # 1c00ad34 <intc_handler+0x584>
1c00ad20:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00ad24:	0290818c 	addi.w	$r12,$r12,1056(0x420)
1c00ad28:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c00ad2c:	2980018d 	st.w	$r13,$r12,0
1c00ad30:	50001c00 	b	28(0x1c) # 1c00ad4c <intc_handler+0x59c>
1c00ad34:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00ad38:	0290318c 	addi.w	$r12,$r12,1036(0x40c)
1c00ad3c:	29800180 	st.w	$r0,$r12,0
1c00ad40:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00ad44:	0290e18c 	addi.w	$r12,$r12,1080(0x438)
1c00ad48:	29800180 	st.w	$r0,$r12,0
1c00ad4c:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00ad50:	288cf18c 	ld.w	$r12,$r12,828(0x33c)
1c00ad54:	2880018d 	ld.w	$r13,$r12,0
1c00ad58:	140001ec 	lu12i.w	$r12,15(0xf)
1c00ad5c:	03befd8c 	ori	$r12,$r12,0xfbf
1c00ad60:	001531ad 	or	$r13,$r13,$r12
1c00ad64:	140001ec 	lu12i.w	$r12,15(0xf)
1c00ad68:	03befd8c 	ori	$r12,$r12,0xfbf
1c00ad6c:	5c0019ac 	bne	$r13,$r12,24(0x18) # 1c00ad84 <intc_handler+0x5d4>
1c00ad70:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00ad74:	028f618c 	addi.w	$r12,$r12,984(0x3d8)
1c00ad78:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c00ad7c:	2980018d 	st.w	$r13,$r12,0
1c00ad80:	50001c00 	b	28(0x1c) # 1c00ad9c <intc_handler+0x5ec>
1c00ad84:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00ad88:	028f118c 	addi.w	$r12,$r12,964(0x3c4)
1c00ad8c:	29800180 	st.w	$r0,$r12,0
1c00ad90:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00ad94:	028fb18c 	addi.w	$r12,$r12,1004(0x3ec)
1c00ad98:	29800180 	st.w	$r0,$r12,0
1c00ad9c:	1cc7fecc 	pcaddu12i	$r12,409590(0x63ff6)
1c00ada0:	288bb18c 	ld.w	$r12,$r12,748(0x2ec)
1c00ada4:	2880018d 	ld.w	$r13,$r12,0
1c00ada8:	140001ec 	lu12i.w	$r12,15(0xf)
1c00adac:	03bdfd8c 	ori	$r12,$r12,0xf7f
1c00adb0:	001531ad 	or	$r13,$r13,$r12
1c00adb4:	140001ec 	lu12i.w	$r12,15(0xf)
1c00adb8:	03bdfd8c 	ori	$r12,$r12,0xf7f
1c00adbc:	5c0019ac 	bne	$r13,$r12,24(0x18) # 1c00add4 <intc_handler+0x624>
1c00adc0:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00adc4:	028e418c 	addi.w	$r12,$r12,912(0x390)
1c00adc8:	0280040d 	addi.w	$r13,$r0,1(0x1)
1c00adcc:	2980018d 	st.w	$r13,$r12,0
1c00add0:	50001c00 	b	28(0x1c) # 1c00adec <intc_handler+0x63c>
1c00add4:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00add8:	028df18c 	addi.w	$r12,$r12,892(0x37c)
1c00addc:	29800180 	st.w	$r0,$r12,0
1c00ade0:	1cc7feac 	pcaddu12i	$r12,409589(0x63ff5)
1c00ade4:	028e818c 	addi.w	$r12,$r12,928(0x3a0)
1c00ade8:	29800180 	st.w	$r0,$r12,0
1c00adec:	02840004 	addi.w	$r4,$r0,256(0x100)
1c00adf0:	57a34fff 	bl	-23732(0xfffa34c) # 1c00513c <TIM_ClearIT>
1c00adf4:	2a3f9ecc 	ld.bu	$r12,$r22,-25(0xfe7)
1c00adf8:	0340118c 	andi	$r12,$r12,0x4
1c00adfc:	4000a180 	beqz	$r12,160(0xa0) # 1c00ae9c <intc_handler+0x6ec>
1c00ae00:	29bfa2c0 	st.w	$r0,$r22,-24(0xfe8)
1c00ae04:	157fd10c 	lu12i.w	$r12,-262520(0xbfe88)
1c00ae08:	0380118c 	ori	$r12,$r12,0x4
1c00ae0c:	2880018c 	ld.w	$r12,$r12,0
1c00ae10:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c00ae14:	50006c00 	b	108(0x6c) # 1c00ae80 <intc_handler+0x6d0>
1c00ae18:	157fd10c 	lu12i.w	$r12,-262520(0xbfe88)
1c00ae1c:	2880018c 	ld.w	$r12,$r12,0
1c00ae20:	29bf82cc 	st.w	$r12,$r22,-32(0xfe0)
1c00ae24:	28bf82cd 	ld.w	$r13,$r22,-32(0xfe0)
1c00ae28:	0280340c 	addi.w	$r12,$r0,13(0xd)
1c00ae2c:	5c001dac 	bne	$r13,$r12,28(0x1c) # 1c00ae48 <intc_handler+0x698>
1c00ae30:	157fd10c 	lu12i.w	$r12,-262520(0xbfe88)
1c00ae34:	0280340d 	addi.w	$r13,$r0,13(0xd)
1c00ae38:	2980018d 	st.w	$r13,$r12,0
1c00ae3c:	0280040c 	addi.w	$r12,$r0,1(0x1)
1c00ae40:	29bfa2cc 	st.w	$r12,$r22,-24(0xfe8)
1c00ae44:	50002c00 	b	44(0x2c) # 1c00ae70 <intc_handler+0x6c0>
1c00ae48:	28bfa2cc 	ld.w	$r12,$r22,-24(0xfe8)
1c00ae4c:	40001980 	beqz	$r12,24(0x18) # 1c00ae64 <intc_handler+0x6b4>
1c00ae50:	29bfa2c0 	st.w	$r0,$r22,-24(0xfe8)
1c00ae54:	157fd10c 	lu12i.w	$r12,-262520(0xbfe88)
1c00ae58:	0280280d 	addi.w	$r13,$r0,10(0xa)
1c00ae5c:	2980018d 	st.w	$r13,$r12,0
1c00ae60:	50001000 	b	16(0x10) # 1c00ae70 <intc_handler+0x6c0>
1c00ae64:	157fd10c 	lu12i.w	$r12,-262520(0xbfe88)
1c00ae68:	28bf82cd 	ld.w	$r13,$r22,-32(0xfe0)
1c00ae6c:	2980018d 	st.w	$r13,$r12,0
1c00ae70:	157fd10c 	lu12i.w	$r12,-262520(0xbfe88)
1c00ae74:	0380118c 	ori	$r12,$r12,0x4
1c00ae78:	2880018c 	ld.w	$r12,$r12,0
1c00ae7c:	293fbecc 	st.b	$r12,$r22,-17(0xfef)
1c00ae80:	283fbecc 	ld.b	$r12,$r22,-17(0xfef)
1c00ae84:	0340058c 	andi	$r12,$r12,0x1
1c00ae88:	43ff919f 	beqz	$r12,-112(0x7fff90) # 1c00ae18 <intc_handler+0x668>
1c00ae8c:	157fd40c 	lu12i.w	$r12,-262496(0xbfea0)
1c00ae90:	03800d8c 	ori	$r12,$r12,0x3
1c00ae94:	0280100d 	addi.w	$r13,$r0,4(0x4)
1c00ae98:	2900018d 	st.b	$r13,$r12,0
1c00ae9c:	2a3f9ecc 	ld.bu	$r12,$r22,-25(0xfe7)
1c00aea0:	0340218c 	andi	$r12,$r12,0x8
1c00aea4:	40002d80 	beqz	$r12,44(0x2c) # 1c00aed0 <intc_handler+0x720>
1c00aea8:	157fd00c 	lu12i.w	$r12,-262528(0xbfe80)
1c00aeac:	2a00018c 	ld.bu	$r12,$r12,0
1c00aeb0:	293f7ecc 	st.b	$r12,$r22,-33(0xfdf)
1c00aeb4:	2a3f7ecc 	ld.bu	$r12,$r22,-33(0xfdf)
1c00aeb8:	00150184 	move	$r4,$r12
1c00aebc:	57a2dfff 	bl	-23844(0xfffa2dc) # 1c005198 <recv_dat_int>
1c00aec0:	157fd40c 	lu12i.w	$r12,-262496(0xbfea0)
1c00aec4:	03800d8c 	ori	$r12,$r12,0x3
1c00aec8:	0280200d 	addi.w	$r13,$r0,8(0x8)
1c00aecc:	2900018d 	st.b	$r13,$r12,0
1c00aed0:	157fd40c 	lu12i.w	$r12,-262496(0xbfea0)
1c00aed4:	03800d8c 	ori	$r12,$r12,0x3
1c00aed8:	02bffc0d 	addi.w	$r13,$r0,-1(0xfff)
1c00aedc:	2900018d 	st.b	$r13,$r12,0
1c00aee0:	03400000 	andi	$r0,$r0,0x0
1c00aee4:	2880b061 	ld.w	$r1,$r3,44(0x2c)
1c00aee8:	2880a076 	ld.w	$r22,$r3,40(0x28)
1c00aeec:	0280c063 	addi.w	$r3,$r3,48(0x30)
1c00aef0:	4c000020 	jirl	$r0,$r1,0

1c00aef4 <TIMER_HANDLER>:
TIMER_HANDLER():
1c00aef4:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c00aef8:	29803061 	st.w	$r1,$r3,12(0xc)
1c00aefc:	29802076 	st.w	$r22,$r3,8(0x8)
1c00af00:	02804076 	addi.w	$r22,$r3,16(0x10)
1c00af04:	5771d3ff 	bl	-36400(0xfff71d0) # 1c0020d4 <Set_Timer_clear>
1c00af08:	1c000024 	pcaddu12i	$r4,1(0x1)
1c00af0c:	028ee084 	addi.w	$r4,$r4,952(0x3b8)
1c00af10:	576cbfff 	bl	-37700(0xfff6cbc) # 1c001bcc <myprintf>
1c00af14:	5771a3ff 	bl	-36448(0xfff71a0) # 1c0020b4 <Set_Timer_stop>
1c00af18:	03400000 	andi	$r0,$r0,0x0
1c00af1c:	28803061 	ld.w	$r1,$r3,12(0xc)
1c00af20:	28802076 	ld.w	$r22,$r3,8(0x8)
1c00af24:	02804063 	addi.w	$r3,$r3,16(0x10)
1c00af28:	4c000020 	jirl	$r0,$r1,0

Disassembly of section .rodata:

1c00af40 <msg_wakeup>:
msg_wakeup():
1c00af40:	656b6177 	bge	$r11,$r23,93024(0x16b60) # 1c021aa0 <_sidata+0x153f0>
1c00af44:	0a217075 	xvfmadd.d	$xr21,$xr3,$xr28,$xr2
	...

1c00af49 <hexdecarr>:
hexdecarr():
1c00af49:	33323130 	xvstelm.w	$xr16,$r9,-464(0x230),0x4
1c00af4d:	37363534 	0x37363534
1c00af51:	62613938 	blt	$r9,$r24,-106184(0x26138) # 1bff1089 <_start-0xef77>
1c00af55:	66656463 	bge	$r3,$r3,-105116(0x26564) # 1bff14b9 <_start-0xeb47>
1c00af59:	ec000000 	0xec000000
1c00af5d:	081c001d 	fmadd.s	$f29,$f0,$f0,$f24
1c00af61:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00af65:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00af69:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00af6d:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00af71:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00af75:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00af79:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00af7d:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00af81:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00af85:	041c001f 	csrrd	$r31,0x700
1c00af89:	8c1c001e 	0x8c1c001e
1c00af8d:	8c1c001e 	0x8c1c001e
1c00af91:	8c1c001e 	0x8c1c001e
1c00af95:	8c1c001e 	0x8c1c001e
1c00af99:	8c1c001e 	0x8c1c001e
1c00af9d:	8c1c001e 	0x8c1c001e
1c00afa1:	8c1c001e 	0x8c1c001e
1c00afa5:	8c1c001e 	0x8c1c001e
1c00afa9:	8c1c001e 	0x8c1c001e
1c00afad:	081c001e 	fmadd.s	$f30,$f0,$f0,$f24
1c00afb1:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00afb5:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00afb9:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00afbd:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00afc1:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00afc5:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00afc9:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00afcd:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00afd1:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00afd5:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00afd9:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00afdd:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00afe1:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00afe5:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00afe9:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00afed:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00aff1:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00aff5:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00aff9:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00affd:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b001:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b005:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b009:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b00d:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b011:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b015:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b019:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b01d:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b021:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b025:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b029:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b02d:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b031:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b035:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b039:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b03d:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b041:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b045:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b049:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b04d:	7c1c001f 	0x7c1c001f
1c00b051:	a41c001d 	0xa41c001d
1c00b055:	0c1c001c 	0x0c1c001c
1c00b059:	081c001d 	fmadd.s	$f29,$f0,$f0,$f24
1c00b05d:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b061:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b065:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b069:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b06d:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b071:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b075:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b079:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b07d:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b081:	441c001f 	bnez	$r0,-254976(0x7c1c00) # 1bfccc81 <_start-0x3337f>
1c00b085:	b41c001d 	0xb41c001d
1c00b089:	081c001d 	fmadd.s	$f29,$f0,$f0,$f24
1c00b08d:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b091:	781c001f 	0x781c001f
1c00b095:	081c001c 	fmadd.s	$f28,$f0,$f0,$f24
1c00b099:	d41c001f 	0xd41c001f
1c00b09d:	081c001c 	fmadd.s	$f28,$f0,$f0,$f24
1c00b0a1:	081c001f 	fmadd.s	$f31,$f0,$f0,$f24
1c00b0a5:	b41c001f 	0xb41c001f
1c00b0a9:	201c001d 	ll.w	$r29,$r0,7168(0x1c00)
1c00b0ad:	3c1c0026 	0x3c1c0026
1c00b0b1:	3c1c0027 	0x3c1c0027
1c00b0b5:	3c1c0027 	0x3c1c0027
1c00b0b9:	3c1c0027 	0x3c1c0027
1c00b0bd:	3c1c0027 	0x3c1c0027
1c00b0c1:	3c1c0027 	0x3c1c0027
1c00b0c5:	3c1c0027 	0x3c1c0027
1c00b0c9:	3c1c0027 	0x3c1c0027
1c00b0cd:	3c1c0027 	0x3c1c0027
1c00b0d1:	3c1c0027 	0x3c1c0027
1c00b0d5:	381c0027 	stx.d	$r7,$r1,$r0
1c00b0d9:	c01c0026 	0xc01c0026
1c00b0dd:	c01c0026 	0xc01c0026
1c00b0e1:	c01c0026 	0xc01c0026
1c00b0e5:	c01c0026 	0xc01c0026
1c00b0e9:	c01c0026 	0xc01c0026
1c00b0ed:	c01c0026 	0xc01c0026
1c00b0f1:	c01c0026 	0xc01c0026
1c00b0f5:	c01c0026 	0xc01c0026
1c00b0f9:	c01c0026 	0xc01c0026
1c00b0fd:	3c1c0026 	0x3c1c0026
1c00b101:	3c1c0027 	0x3c1c0027
1c00b105:	3c1c0027 	0x3c1c0027
1c00b109:	3c1c0027 	0x3c1c0027
1c00b10d:	3c1c0027 	0x3c1c0027
1c00b111:	3c1c0027 	0x3c1c0027
1c00b115:	3c1c0027 	0x3c1c0027
1c00b119:	3c1c0027 	0x3c1c0027
1c00b11d:	3c1c0027 	0x3c1c0027
1c00b121:	3c1c0027 	0x3c1c0027
1c00b125:	3c1c0027 	0x3c1c0027
1c00b129:	3c1c0027 	0x3c1c0027
1c00b12d:	3c1c0027 	0x3c1c0027
1c00b131:	3c1c0027 	0x3c1c0027
1c00b135:	3c1c0027 	0x3c1c0027
1c00b139:	3c1c0027 	0x3c1c0027
1c00b13d:	3c1c0027 	0x3c1c0027
1c00b141:	3c1c0027 	0x3c1c0027
1c00b145:	3c1c0027 	0x3c1c0027
1c00b149:	3c1c0027 	0x3c1c0027
1c00b14d:	3c1c0027 	0x3c1c0027
1c00b151:	3c1c0027 	0x3c1c0027
1c00b155:	3c1c0027 	0x3c1c0027
1c00b159:	3c1c0027 	0x3c1c0027
1c00b15d:	3c1c0027 	0x3c1c0027
1c00b161:	3c1c0027 	0x3c1c0027
1c00b165:	3c1c0027 	0x3c1c0027
1c00b169:	3c1c0027 	0x3c1c0027
1c00b16d:	3c1c0027 	0x3c1c0027
1c00b171:	3c1c0027 	0x3c1c0027
1c00b175:	3c1c0027 	0x3c1c0027
1c00b179:	3c1c0027 	0x3c1c0027
1c00b17d:	3c1c0027 	0x3c1c0027
1c00b181:	3c1c0027 	0x3c1c0027
1c00b185:	3c1c0027 	0x3c1c0027
1c00b189:	3c1c0027 	0x3c1c0027
1c00b18d:	3c1c0027 	0x3c1c0027
1c00b191:	3c1c0027 	0x3c1c0027
1c00b195:	3c1c0027 	0x3c1c0027
1c00b199:	3c1c0027 	0x3c1c0027
1c00b19d:	b01c0027 	0xb01c0027
1c00b1a1:	d81c0025 	0xd81c0025
1c00b1a5:	401c0024 	beqz	$r1,1055744(0x101c00) # 1c10cda5 <_sidata+0x1006f5>
1c00b1a9:	3c1c0025 	0x3c1c0025
1c00b1ad:	3c1c0027 	0x3c1c0027
1c00b1b1:	3c1c0027 	0x3c1c0027
1c00b1b5:	3c1c0027 	0x3c1c0027
1c00b1b9:	3c1c0027 	0x3c1c0027
1c00b1bd:	3c1c0027 	0x3c1c0027
1c00b1c1:	3c1c0027 	0x3c1c0027
1c00b1c5:	3c1c0027 	0x3c1c0027
1c00b1c9:	3c1c0027 	0x3c1c0027
1c00b1cd:	3c1c0027 	0x3c1c0027
1c00b1d1:	781c0027 	0x781c0027
1c00b1d5:	e81c0025 	0xe81c0025
1c00b1d9:	3c1c0025 	0x3c1c0025
1c00b1dd:	3c1c0027 	0x3c1c0027
1c00b1e1:	ac1c0027 	0xac1c0027
1c00b1e5:	3c1c0024 	0x3c1c0024
1c00b1e9:	081c0027 	fmadd.s	$f7,$f1,$f0,$f24
1c00b1ed:	3c1c0025 	0x3c1c0025
1c00b1f1:	3c1c0027 	0x3c1c0027
1c00b1f5:	e81c0027 	0xe81c0027
1c00b1f9:	741c0025 	0x741c0025
1c00b1fd:	a41c002e 	0xa41c002e
1c00b201:	b41c002d 	0xb41c002d
1c00b205:	c41c002d 	0xc41c002d
1c00b209:	d41c002d 	0xd41c002d
1c00b20d:	e41c002d 	0xe41c002d
1c00b211:	f41c002d 	0xf41c002d
1c00b215:	041c002d 	csrwr	$r13,0x700
1c00b219:	141c002e 	lu12i.w	$r14,57345(0xe001)
1c00b21d:	241c002e 	ldptr.w	$r14,$r1,7168(0x1c00)
1c00b221:	341c002e 	0x341c002e
1c00b225:	441c002e 	bnez	$r1,3677184(0x381c00) # 1c38ce25 <_sidata+0x380775>
1c00b229:	541c002e 	bl	12065792(0xb81c00) # 1cb8ce29 <_sidata+0xb80779>
1c00b22d:	641c002e 	bge	$r1,$r14,7168(0x1c00) # 1c00ce2d <_sidata+0x77d>
1c00b231:	041c002e 	csrwr	$r14,0x700
1c00b235:	c41c0030 	0xc41c0030
1c00b239:	d41c002e 	0xd41c002e
1c00b23d:	e41c002e 	0xe41c002e
1c00b241:	f41c002e 	0xf41c002e
1c00b245:	041c002e 	csrwr	$r14,0x700
1c00b249:	141c002f 	lu12i.w	$r15,57345(0xe001)
1c00b24d:	241c002f 	ldptr.w	$r15,$r1,7168(0x1c00)
1c00b251:	341c002f 	0x341c002f
1c00b255:	441c002f 	bnez	$r1,3939328(0x3c1c00) # 1c3cce55 <_sidata+0x3c07a5>
1c00b259:	541c002f 	bl	12327936(0xbc1c00) # 1cbcce59 <_sidata+0xbc07a9>
1c00b25d:	641c002f 	bge	$r1,$r15,7168(0x1c00) # 1c00ce5d <_sidata+0x7ad>
1c00b261:	741c002f 	0x741c002f
1c00b265:	841c002f 	0x841c002f
1c00b269:	941c002f 	0x941c002f
1c00b26d:	a41c002f 	0xa41c002f
1c00b271:	b41c002f 	0xb41c002f
1c00b275:	c41c002f 	0xc41c002f
1c00b279:	d41c002f 	0xd41c002f
1c00b27d:	e41c002f 	0xe41c002f
1c00b281:	f41c002f 	0xf41c002f
1c00b285:	0d1c002f 	vbitsel.v	$vr15,$vr1,$vr0,$vr24
1c00b289:	6572200a 	bge	$r0,$r10,94752(0x17220) # 1c0224a9 <_sidata+0x15df9>
1c00b28d:	76696563 	0x76696563
1c00b291:	64612065 	bge	$r3,$r5,24864(0x6120) # 1c0113b1 <_sidata+0x4d01>
1c00b295:	30207264 	vldrepl.w	$vr4,$r19,112(0x70)
1c00b299:	32302578 	0x32302578
1c00b29d:	000a0d78 	0x000a0d78
1c00b2a1:	0d000000 	fsel	$f0,$f0,$f0,$fcc0
1c00b2a5:	7274200a 	0x7274200a
1c00b2a9:	20736e61 	ll.w	$r1,$r19,29548(0x736c)
1c00b2ad:	72646461 	0x72646461
1c00b2b1:	25783020 	stptr.w	$r0,$r1,30768(0x7830)
1c00b2b5:	0d783230 	0x0d783230
1c00b2b9:	0d00000a 	fsel	$f10,$f0,$f0,$fcc0
1c00b2bd:	6544200a 	bge	$r0,$r10,82976(0x14420) # 1c01f6dd <_sidata+0x1302d>
1c00b2c1:	65636976 	bge	$r11,$r22,90984(0x16368) # 1c021629 <_sidata+0x14f79>
1c00b2c5:	6464415f 	bge	$r10,$r31,25664(0x6440) # 1c011705 <_sidata+0x5055>
1c00b2c9:	78303d72 	0x78303d72
1c00b2cd:	20783225 	ll.w	$r5,$r17,30768(0x7830)
1c00b2d1:	6454202c 	bge	$r1,$r12,21536(0x5420) # 1c0106f1 <_sidata+0x4041>
1c00b2d5:	20617461 	ll.w	$r1,$r3,24948(0x6174)
1c00b2d9:	7830203d 	0x7830203d
1c00b2dd:	00783225 	bstrins.w	$r5,$r17,0x18,0xc
1c00b2e1:	2d000000 	0x2d000000
1c00b2e5:	2d2d2d2d 	0x2d2d2d2d
1c00b2e9:	61206f6e 	blt	$r27,$r14,73836(0x1206c) # 1c01d355 <_sidata+0x10ca5>
1c00b2ed:	2d2d6b63 	0x2d2d6b63
1c00b2f1:	0d2d2d2d 	xvbitsel.v	$xr13,$xr9,$xr11,$xr26
1c00b2f5:	5700000a 	bl	2818048(0x2b0000) # 1c2bb2f5 <_sidata+0x2aec45>
1c00b2f9:	72646461 	0x72646461
1c00b2fd:	2578303d 	stptr.w	$r29,$r1,30768(0x7830)
1c00b301:	0d000078 	fsel	$f24,$f3,$f0,$fcc0
1c00b305:	6572200a 	bge	$r0,$r10,94752(0x17220) # 1c022525 <_sidata+0x15e75>
1c00b309:	44206461 	bnez	$r3,270436(0x42064) # 1c04d36d <_sidata+0x40cbd>
1c00b30d:	63697665 	blt	$r19,$r5,-38540(0x36974) # 1c001c81 <myprintf+0xb5>
1c00b311:	64415f65 	bge	$r27,$r5,16732(0x415c) # 1c00f46d <_sidata+0x2dbd>
1c00b315:	303d7264 	0x303d7264
1c00b319:	78322578 	0x78322578
1c00b31d:	0a000020 	0x0a000020
1c00b321:	206f6e20 	ll.w	$r0,$r17,28524(0x6f6c)
1c00b325:	206b6361 	ll.w	$r1,$r27,27488(0x6b60)
1c00b329:	5200000a 	b	2752512(0x2a0000) # 1c2ab329 <_sidata+0x29ec79>
1c00b32d:	72646461 	0x72646461
1c00b331:	2578303d 	stptr.w	$r29,$r1,30768(0x7830)
1c00b335:	09000078 	0x09000078
1c00b339:	0a006425 	0x0a006425
1c00b33d:	0d000000 	fsel	$f0,$f0,$f0,$fcc0
1c00b341:	776f440a 	xvssrarni.du.q	$xr10,$xr0,0x51
1c00b345:	0d00006e 	fsel	$f14,$f3,$f0,$fcc0
1c00b349:	0050550a 	0x0050550a
1c00b34d:	0d000000 	fsel	$f0,$f0,$f0,$fcc0
1c00b351:	6c754d0a 	bgeu	$r8,$r10,30028(0x754c) # 1c01289d <_sidata+0x61ed>
1c00b355:	776f4469 	xvssrarni.du.q	$xr9,$xr3,0x51
1c00b359:	0d00006e 	fsel	$f14,$f3,$f0,$fcc0
1c00b35d:	756f430a 	0x756f430a
1c00b361:	4f20746e 	jirl	$r14,$r3,-57228(0x32074)
1c00b365:	0d000056 	fsel	$f22,$f2,$f0,$fcc0
1c00b369:	3030090a 	0x3030090a
1c00b36d:	09313009 	0x09313009
1c00b371:	30093230 	0x30093230
1c00b375:	34300933 	0x34300933
1c00b379:	09353009 	0x09353009
1c00b37d:	30093630 	0x30093630
1c00b381:	38300937 	fldx.s	$f23,$r9,$r2
1c00b385:	09393009 	0x09393009
1c00b389:	31093031 	0x31093031
1c00b38d:	0d000031 	fsel	$f17,$f1,$f0,$fcc0
1c00b391:	7361420a 	vssrani.w.d	$vr10,$vr16,0x10
1c00b395:	6c615665 	bgeu	$r19,$r5,24916(0x6154) # 1c0114e9 <_sidata+0x4e39>
1c00b399:	09000000 	0x09000000
1c00b39d:	00643425 	bstrins.w	$r5,$r1,0x4,0xd
1c00b3a1:	0d000000 	fsel	$f0,$f0,$f0,$fcc0
1c00b3a5:	6275530a 	blt	$r24,$r10,-101040(0x27550) # 1bff28f5 <_start-0xd70b>
1c00b3a9:	006c6156 	bstrins.w	$r22,$r10,0xc,0x18
1c00b3ad:	09000000 	0x09000000
1c00b3b1:	00643225 	bstrins.w	$r5,$r17,0x4,0xc
1c00b3b5:	09000000 	0x09000000
1c00b3b9:	00643325 	bstrins.w	$r5,$r25,0x4,0xc
1c00b3bd:	0a000000 	0x0a000000
1c00b3c1:	56746e43 	bl	-116493204(0x90e746c) # 150f282d <_start-0x6f0d7d3>
1c00b3c5:	2d006c61 	0x2d006c61
1c00b3c9:	4b2d2d2d 	bcnez	$fcc1,3616044(0x372d2c) # 1c37e0f5 <_sidata+0x371a45>
1c00b3cd:	79547965 	0x79547965
1c00b3d1:	203a6570 	ll.w	$r16,$r11,14948(0x3a64)
1c00b3d5:	78257830 	0x78257830
1c00b3d9:	65000000 	bge	$r0,$r0,65536(0x10000) # 1c01b3d9 <_sidata+0xed29>
1c00b3dd:	00746978 	bstrins.w	$r24,$r11,0x14,0x1a
1c00b3e1:	5b000000 	beq	$r0,$r0,-65536(0x30000) # 1bffb3e1 <_start-0x4c1f>
1c00b3e5:	74697865 	xvavgr.w	$xr5,$xr3,$xr30
1c00b3e9:	0000005d 	0x0000005d
1c00b3ed:	64000000 	bge	$r0,$r0,0 # 1c00b3ed <hexdecarr+0x4a4>
1c00b3f1:	5b000031 	beq	$r1,$r17,-65536(0x30000) # 1bffb3f1 <_start-0x4c0f>
1c00b3f5:	3c203164 	0x3c203164
1c00b3f9:	72646461 	0x72646461
1c00b3fd:	6e3c203e 	bgeu	$r1,$r30,-115680(0x23c20) # 1bfef01d <_start-0x10fe3>
1c00b401:	5d3e6d75 	bne	$r11,$r21,81516(0x13e6c) # 1c01f26d <_sidata+0x12bbd>
1c00b405:	2d000000 	0x2d000000
1c00b409:	6d75642d 	bgeu	$r1,$r13,95588(0x17564) # 1c02296d <_sidata+0x162bd>
1c00b40d:	64612070 	bge	$r3,$r16,24864(0x6120) # 1c01152d <_sidata+0x4e7d>
1c00b411:	73657264 	vssrani.wu.d	$vr4,$vr19,0x1c
1c00b415:	79622073 	0x79622073
1c00b419:	64006574 	bge	$r11,$r20,100(0x64) # 1c00b47d <hexdecarr+0x534>
1c00b41d:	5b000034 	beq	$r1,$r20,-65536(0x30000) # 1bffb41d <_start-0x4be3>
1c00b421:	3c203464 	0x3c203464
1c00b425:	72646461 	0x72646461
1c00b429:	6e3c203e 	bgeu	$r1,$r30,-115680(0x23c20) # 1bfef049 <_start-0x10fb7>
1c00b42d:	5d3e6d75 	bne	$r11,$r21,81516(0x13e6c) # 1c01f299 <_sidata+0x12be9>
1c00b431:	2d000000 	0x2d000000
1c00b435:	6d75642d 	bgeu	$r1,$r13,95588(0x17564) # 1c022999 <_sidata+0x162e9>
1c00b439:	64612070 	bge	$r3,$r16,24864(0x6120) # 1c011559 <_sidata+0x4ea9>
1c00b43d:	73657264 	vssrani.wu.d	$vr4,$vr19,0x1c
1c00b441:	6f772073 	bgeu	$r3,$r19,-35040(0x37720) # 1c002b61 <Set_Energy_2+0x5>
1c00b445:	68006472 	bltu	$r3,$r18,100(0x64) # 1c00b4a9 <hexdecarr+0x560>
1c00b449:	00706c65 	bstrins.w	$r5,$r3,0x10,0x1b
1c00b44d:	5b000000 	beq	$r0,$r0,-65536(0x30000) # 1bffb44d <_start-0x4bb3>
1c00b451:	706c6568 	0x706c6568
1c00b455:	6f633c20 	bgeu	$r1,$r0,-40132(0x3633c) # 1c001791 <Spiflash_Rdid+0x9>
1c00b459:	6e616d6d 	bgeu	$r11,$r13,-106132(0x2616c) # 1bff15c5 <_start-0xea3b>
1c00b45d:	005d3e64 	0x005d3e64
1c00b461:	2d000000 	0x2d000000
1c00b465:	646d632d 	bge	$r25,$r13,28000(0x6d60) # 1c0121c5 <_sidata+0x5b15>
1c00b469:	73696c20 	vssrarni.w.d	$vr0,$vr1,0x1b
1c00b46d:	6d000074 	bgeu	$r3,$r20,65536(0x10000) # 1c01b46d <_sidata+0xedbd>
1c00b471:	5b000031 	beq	$r1,$r17,-65536(0x30000) # 1bffb471 <_start-0x4b8f>
1c00b475:	3c20316d 	0x3c20316d
1c00b479:	72646461 	0x72646461
1c00b47d:	763c203e 	0x763c203e
1c00b481:	65756c61 	bge	$r3,$r1,95596(0x1756c) # 1c0229ed <_sidata+0x1633d>
1c00b485:	2d005d3e 	0x2d005d3e
1c00b489:	646f6d2d 	bge	$r9,$r13,28524(0x6f6c) # 1c0123f5 <_sidata+0x5d45>
1c00b48d:	20796669 	ll.w	$r9,$r19,31076(0x7964)
1c00b491:	72646461 	0x72646461
1c00b495:	20737365 	ll.w	$r5,$r27,29552(0x7370)
1c00b499:	65747962 	bge	$r11,$r2,95352(0x17478) # 1c022911 <_sidata+0x16261>
1c00b49d:	6d000000 	bgeu	$r0,$r0,65536(0x10000) # 1c01b49d <_sidata+0xeded>
1c00b4a1:	5b000034 	beq	$r1,$r20,-65536(0x30000) # 1bffb4a1 <_start-0x4b5f>
1c00b4a5:	3c20346d 	0x3c20346d
1c00b4a9:	72646461 	0x72646461
1c00b4ad:	763c203e 	0x763c203e
1c00b4b1:	65756c61 	bge	$r3,$r1,95596(0x1756c) # 1c022a1d <_sidata+0x1636d>
1c00b4b5:	2d005d3e 	0x2d005d3e
1c00b4b9:	646f6d2d 	bge	$r9,$r13,28524(0x6f6c) # 1c012425 <_sidata+0x5d75>
1c00b4bd:	20796669 	ll.w	$r9,$r19,31076(0x7964)
1c00b4c1:	72646461 	0x72646461
1c00b4c5:	20737365 	ll.w	$r5,$r27,29552(0x7370)
1c00b4c9:	64726f77 	bge	$r27,$r23,29292(0x726c) # 1c012735 <_sidata+0x6085>
1c00b4cd:	76000000 	0x76000000
1c00b4d1:	5b000000 	beq	$r0,$r0,-65536(0x30000) # 1bffb4d1 <_start-0x4b2f>
1c00b4d5:	2d005d76 	0x2d005d76
1c00b4d9:	0031762d 	0x0031762d
1c00b4dd:	74000000 	xvseq.b	$xr0,$xr0,$xr0
1c00b4e1:	6863756f 	bltu	$r11,$r15,25460(0x6374) # 1c011855 <_sidata+0x51a5>
1c00b4e5:	5b000000 	beq	$r0,$r0,-65536(0x30000) # 1bffb4e5 <_start-0x4b1b>
1c00b4e9:	63756f74 	blt	$r27,$r20,-35476(0x3756c) # 1c002a55 <strcmp+0x1>
1c00b4ed:	68005d68 	bltu	$r11,$r8,92(0x5c) # 1c00b549 <hexdecarr+0x600>
1c00b4f1:	00746570 	bstrins.w	$r16,$r11,0x14,0x19
1c00b4f5:	5b000000 	beq	$r0,$r0,-65536(0x30000) # 1bffb4f5 <_start-0x4b0b>
1c00b4f9:	656d6974 	bge	$r11,$r20,93544(0x16d68) # 1c022261 <_sidata+0x15bb1>
1c00b4fd:	65742072 	bge	$r3,$r18,95264(0x17420) # 1c02291d <_sidata+0x1626d>
1c00b501:	005d7473 	0x005d7473
1c00b505:	6c000000 	bgeu	$r0,$r0,0 # 1c00b505 <hexdecarr+0x5bc>
1c00b509:	6d697461 	bgeu	$r3,$r1,92532(0x16974) # 1c021e7d <_sidata+0x157cd>
1c00b50d:	5b007265 	beq	$r19,$r5,-65424(0x30070) # 1bffb57d <_start-0x4a83>
1c00b511:	65726f63 	bge	$r27,$r3,94828(0x1726c) # 1c02277d <_sidata+0x160cd>
1c00b515:	6d697420 	bgeu	$r1,$r0,92532(0x16974) # 1c021e89 <_sidata+0x157d9>
1c00b519:	74207265 	xvsubwev.h.b	$xr5,$xr19,$xr28
1c00b51d:	5d747365 	bne	$r27,$r5,95344(0x17470) # 1c02298d <_sidata+0x162dd>
1c00b521:	64000000 	bge	$r0,$r0,0 # 1c00b521 <hexdecarr+0x5d8>
1c00b525:	79616c65 	0x79616c65
1c00b529:	5b000000 	beq	$r0,$r0,-65536(0x30000) # 1bffb529 <_start-0x4ad7>
1c00b52d:	616c6564 	blt	$r11,$r4,93284(0x16c64) # 1c022191 <_sidata+0x15ae1>
1c00b531:	65742079 	bge	$r3,$r25,95264(0x17420) # 1c022951 <_sidata+0x162a1>
1c00b535:	005d7473 	0x005d7473
1c00b539:	77000000 	0x77000000
1c00b53d:	75656b61 	0x75656b61
1c00b541:	5b000070 	beq	$r3,$r16,-65536(0x30000) # 1bffb541 <_start-0x4abf>
1c00b545:	656b6177 	bge	$r11,$r23,93024(0x16b60) # 1c0220a5 <_sidata+0x159f5>
1c00b549:	74207075 	xvsubwev.h.b	$xr21,$xr3,$xr28
1c00b54d:	5d747365 	bne	$r27,$r5,95344(0x17470) # 1c0229bd <_sidata+0x1630d>
1c00b551:	64000000 	bge	$r0,$r0,0 # 1c00b551 <hexdecarr+0x608>
1c00b555:	00657461 	bstrins.w	$r1,$r3,0x5,0x1d
1c00b559:	5b000000 	beq	$r0,$r0,-65536(0x30000) # 1bffb559 <_start-0x4aa7>
1c00b55d:	20637472 	ll.w	$r18,$r3,25460(0x6374)
1c00b561:	74736574 	xvmin.w	$xr20,$xr11,$xr25
1c00b565:	7700005d 	0x7700005d
1c00b569:	5b006764 	beq	$r27,$r4,-65436(0x30064) # 1bffb5cd <_start-0x4a33>
1c00b56d:	20676477 	ll.w	$r23,$r3,26468(0x6764)
1c00b571:	74736574 	xvmin.w	$xr20,$xr11,$xr25
1c00b575:	6900005d 	bltu	$r2,$r29,65536(0x10000) # 1c01b575 <_sidata+0xeec5>
1c00b579:	00706332 	bstrins.w	$r18,$r25,0x10,0x18
1c00b57d:	5b000000 	beq	$r0,$r0,-65536(0x30000) # 1bffb57d <_start-0x4a83>
1c00b581:	70633269 	vabsd.wu	$vr9,$vr19,$vr12
1c00b585:	72703c20 	0x72703c20
1c00b589:	61637365 	blt	$r27,$r5,90992(0x16370) # 1c0218f9 <_sidata+0x15249>
1c00b58d:	5d3e656c 	bne	$r11,$r12,81508(0x13e64) # 1c01f3f1 <_sidata+0x12d41>
1c00b591:	2d000000 	0x2d000000
1c00b595:	6332692d 	blt	$r9,$r13,-52632(0x33268) # 1bffe7fd <_start-0x1803>
1c00b599:	65727020 	bge	$r1,$r0,94832(0x17270) # 1c022809 <_sidata+0x16159>
1c00b59d:	6c616373 	bgeu	$r27,$r19,24928(0x6160) # 1c0116fd <_sidata+0x504d>
1c00b5a1:	69000065 	bltu	$r3,$r5,65536(0x10000) # 1c01b5a1 <_sidata+0xeef1>
1c00b5a5:	00776332 	bstrins.w	$r18,$r25,0x17,0x18
1c00b5a9:	5b000000 	beq	$r0,$r0,-65536(0x30000) # 1bffb5a9 <_start-0x4a57>
1c00b5ad:	77633269 	xvssrani.d.q	$xr9,$xr19,0x4c
1c00b5b1:	68633c20 	bltu	$r1,$r0,25404(0x633c) # 1c0118ed <_sidata+0x523d>
1c00b5b5:	64617069 	bge	$r3,$r9,24944(0x6170) # 1c011725 <_sidata+0x5075>
1c00b5b9:	203e7264 	ll.w	$r4,$r19,15984(0x3e70)
1c00b5bd:	6765723c 	bge	$r17,$r28,-39568(0x36570) # 1c001b2d <printbase+0x131>
1c00b5c1:	72646461 	0x72646461
1c00b5c5:	773c203e 	0x773c203e
1c00b5c9:	61746164 	blt	$r11,$r4,95328(0x17460) # 1c022a29 <_sidata+0x16379>
1c00b5cd:	2d005d3e 	0x2d005d3e
1c00b5d1:	6332692d 	blt	$r9,$r13,-52632(0x33268) # 1bffe839 <_start-0x17c7>
1c00b5d5:	69727720 	bltu	$r25,$r0,94836(0x17274) # 1c022849 <_sidata+0x16199>
1c00b5d9:	69006574 	bltu	$r11,$r20,65636(0x10064) # 1c01b63d <_sidata+0xef8d>
1c00b5dd:	00726332 	bstrins.w	$r18,$r25,0x12,0x18
1c00b5e1:	5b000000 	beq	$r0,$r0,-65536(0x30000) # 1bffb5e1 <_start-0x4a1f>
1c00b5e5:	72633269 	0x72633269
1c00b5e9:	68633c20 	bltu	$r1,$r0,25404(0x633c) # 1c011925 <_sidata+0x5275>
1c00b5ed:	64617069 	bge	$r3,$r9,24944(0x6170) # 1c01175d <_sidata+0x50ad>
1c00b5f1:	203e7264 	ll.w	$r4,$r19,15984(0x3e70)
1c00b5f5:	6765723c 	bge	$r17,$r28,-39568(0x36570) # 1c001b65 <ls1x_puts+0x9>
1c00b5f9:	72646461 	0x72646461
1c00b5fd:	2d005d3e 	0x2d005d3e
1c00b601:	6332692d 	blt	$r9,$r13,-52632(0x33268) # 1bffe869 <_start-0x1797>
1c00b605:	61657220 	blt	$r17,$r0,91504(0x16570) # 1c021b75 <_sidata+0x154c5>
1c00b609:	61000064 	blt	$r3,$r4,65536(0x10000) # 1c01b609 <_sidata+0xef59>
1c00b60d:	5b006364 	beq	$r27,$r4,-65440(0x30060) # 1bffb66d <_start-0x4993>
1c00b611:	5d636461 	bne	$r3,$r1,90980(0x16364) # 1c021975 <_sidata+0x152c5>
1c00b615:	2d000000 	0x2d000000
1c00b619:	6364612d 	blt	$r9,$r13,-39840(0x36460) # 1c001a79 <printbase+0x7d>
1c00b61d:	62000000 	blt	$r0,$r0,-131072(0x20000) # 1bfeb61d <_start-0x149e3>
1c00b621:	65647461 	bge	$r3,$r1,91252(0x16474) # 1c021a95 <_sidata+0x153e5>
1c00b625:	5b000074 	beq	$r3,$r20,-65536(0x30000) # 1bffb625 <_start-0x49db>
1c00b629:	64746162 	bge	$r11,$r2,29792(0x7460) # 1c012a89 <_sidata+0x63d9>
1c00b62d:	3c207465 	0x3c207465
1c00b631:	005d3e6e 	0x005d3e6e
1c00b635:	63000000 	blt	$r0,$r0,-65536(0x30000) # 1bffb635 <_start-0x49cb>
1c00b639:	0079706f 	bstrins.w	$r15,$r3,0x19,0x1c
1c00b63d:	5b000000 	beq	$r0,$r0,-65536(0x30000) # 1bffb63d <_start-0x49c3>
1c00b641:	5f697073 	bne	$r3,$r19,-38544(0x36970) # 1c001fb1 <Uart_init+0x41>
1c00b645:	73616c66 	vssrani.w.d	$vr6,$vr3,0x1b
1c00b649:	693e3d68 	bltu	$r11,$r8,81468(0x13e3c) # 1c01f485 <_sidata+0x12dd5>
1c00b64d:	6c665f6e 	bgeu	$r27,$r14,26204(0x665c) # 1c011ca9 <_sidata+0x55f9>
1c00b651:	5d687361 	bne	$r27,$r1,92272(0x16870) # 1c021ec1 <_sidata+0x15811>
1c00b655:	63000000 	blt	$r0,$r0,-65536(0x30000) # 1bffb655 <_start-0x49ab>
1c00b659:	5f79706f 	bne	$r3,$r15,-34448(0x37970) # 1c002fc9 <Set_video+0x141>
1c00b65d:	6d617269 	bgeu	$r19,$r9,90480(0x16170) # 1c0217cd <_sidata+0x1511d>
1c00b661:	5b000000 	beq	$r0,$r0,-65536(0x30000) # 1bffb661 <_start-0x499f>
1c00b665:	79706f63 	0x79706f63
1c00b669:	2d00005d 	0x2d00005d
1c00b66d:	7461622d 	xvabsd.w	$xr13,$xr17,$xr24
1c00b671:	20746564 	ll.w	$r4,$r11,29796(0x7464)
1c00b675:	003e6e3c 	0x003e6e3c
1c00b679:	75000000 	0x75000000
1c00b67d:	74696e69 	xvavgr.w	$xr9,$xr19,$xr27
1c00b681:	5b000000 	beq	$r0,$r0,-65536(0x30000) # 1bffb681 <_start-0x497f>
1c00b685:	74726175 	xvmin.b	$xr21,$xr11,$xr24
1c00b689:	696e6920 	bltu	$r9,$r0,93800(0x16e68) # 1c0224f1 <_sidata+0x15e41>
1c00b68d:	73005d74 	0x73005d74
1c00b691:	696e6970 	bltu	$r11,$r16,93800(0x16e68) # 1c0224f9 <_sidata+0x15e49>
1c00b695:	5b000074 	beq	$r3,$r20,-65536(0x30000) # 1bffb695 <_start-0x496b>
1c00b699:	5f697073 	bne	$r3,$r19,-38544(0x36970) # 1c002009 <Uart_init+0x99>
1c00b69d:	74696e69 	xvavgr.w	$xr9,$xr19,$xr27
1c00b6a1:	7300005d 	0x7300005d
1c00b6a5:	61726570 	blt	$r11,$r16,94820(0x17264) # 1c022909 <_sidata+0x16259>
1c00b6a9:	5b006573 	beq	$r11,$r19,-65436(0x30064) # 1bffb70d <_start-0x48f3>
1c00b6ad:	5f697073 	bne	$r3,$r19,-38544(0x36970) # 1c00201d <Uart_init+0xad>
1c00b6b1:	73617265 	vssrani.w.d	$vr5,$vr19,0x1c
1c00b6b5:	73005d65 	0x73005d65
1c00b6b9:	00727770 	bstrins.w	$r16,$r27,0x12,0x1d
1c00b6bd:	5b000000 	beq	$r0,$r0,-65536(0x30000) # 1bffb6bd <_start-0x4943>
1c00b6c1:	5f697073 	bne	$r3,$r19,-38544(0x36970) # 1c002031 <UART_SendData+0x11>
1c00b6c5:	74697277 	xvavgr.w	$xr23,$xr19,$xr28
1c00b6c9:	73005d65 	0x73005d65
1c00b6cd:	00647270 	bstrins.w	$r16,$r19,0x4,0x1c
1c00b6d1:	5b000000 	beq	$r0,$r0,-65536(0x30000) # 1bffb6d1 <_start-0x492f>
1c00b6d5:	5f697073 	bne	$r3,$r19,-38544(0x36970) # 1c002045 <UART_SendData+0x25>
1c00b6d9:	64616572 	bge	$r11,$r18,24932(0x6164) # 1c01183d <_sidata+0x518d>
1c00b6dd:	7300005d 	0x7300005d
1c00b6e1:	73616c66 	vssrani.w.d	$vr6,$vr3,0x1b
1c00b6e5:	5b000068 	beq	$r3,$r8,-65536(0x30000) # 1bffb6e5 <_start-0x491b>
1c00b6e9:	5f697073 	bne	$r3,$r19,-38544(0x36970) # 1c002059 <UART_SendData+0x39>
1c00b6ed:	73616c66 	vssrani.w.d	$vr6,$vr3,0x1b
1c00b6f1:	67005d68 	bge	$r11,$r8,-65444(0x3005c) # 1bffb74d <_start-0x48b3>
1c00b6f5:	5f6f6970 	bne	$r11,$r16,-37016(0x36f68) # 1c00265d <soc_myprintf+0x25d>
1c00b6f9:	00746e69 	bstrins.w	$r9,$r19,0x14,0x1b
1c00b6fd:	5b000000 	beq	$r0,$r0,-65536(0x30000) # 1bffb6fd <_start-0x4903>
1c00b701:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c022b79 <_sidata+0x164c9>
1c00b705:	7400005d 	xvseq.b	$xr29,$xr2,$xr0
1c00b709:	4e000000 	jirl	$r0,$r0,-131072(0x20000)
1c00b70d:	004c4c55 	0x004c4c55
1c00b711:	5b000000 	beq	$r0,$r0,-65536(0x30000) # 1bffb711 <_start-0x48ef>
1c00b715:	4c4c554e 	jirl	$r14,$r10,19540(0x4c54)
1c00b719:	 	0xdc00005d

1c00b71c <cmd>:
1c00b71c:	1c00b3dc 	pcaddu12i	$r28,1438(0x59e)
1c00b720:	1c0052c4 	pcaddu12i	$r4,662(0x296)
1c00b724:	1c00b3e4 	pcaddu12i	$r4,1439(0x59f)
1c00b728:	1c00b3ec 	pcaddu12i	$r12,1439(0x59f)
1c00b72c:	1c00b3f0 	pcaddu12i	$r16,1439(0x59f)
1c00b730:	1c007614 	pcaddu12i	$r20,944(0x3b0)
1c00b734:	1c00b3f4 	pcaddu12i	$r20,1439(0x59f)
1c00b738:	1c00b408 	pcaddu12i	$r8,1440(0x5a0)
1c00b73c:	1c00b41c 	pcaddu12i	$r28,1440(0x5a0)
1c00b740:	1c007728 	pcaddu12i	$r8,953(0x3b9)
1c00b744:	1c00b420 	pcaddu12i	$r0,1441(0x5a1)
1c00b748:	1c00b434 	pcaddu12i	$r20,1441(0x5a1)
1c00b74c:	1c00b448 	pcaddu12i	$r8,1442(0x5a2)
1c00b750:	1c0052ec 	pcaddu12i	$r12,663(0x297)
1c00b754:	1c00b450 	pcaddu12i	$r16,1442(0x5a2)
1c00b758:	1c00b464 	pcaddu12i	$r4,1443(0x5a3)
1c00b75c:	1c00b470 	pcaddu12i	$r16,1443(0x5a3)
1c00b760:	1c007848 	pcaddu12i	$r8,962(0x3c2)
1c00b764:	1c00b474 	pcaddu12i	$r20,1443(0x5a3)
1c00b768:	1c00b488 	pcaddu12i	$r8,1444(0x5a4)
1c00b76c:	1c00b4a0 	pcaddu12i	$r0,1445(0x5a5)
1c00b770:	1c0078d8 	pcaddu12i	$r24,966(0x3c6)
1c00b774:	1c00b4a4 	pcaddu12i	$r4,1445(0x5a5)
1c00b778:	1c00b4b8 	pcaddu12i	$r24,1445(0x5a5)
1c00b77c:	1c00b4d0 	pcaddu12i	$r16,1446(0x5a6)
1c00b780:	1c007b78 	pcaddu12i	$r24,987(0x3db)
1c00b784:	1c00b4d4 	pcaddu12i	$r20,1446(0x5a6)
1c00b788:	1c00b4d8 	pcaddu12i	$r24,1446(0x5a6)
1c00b78c:	1c00b4e0 	pcaddu12i	$r0,1447(0x5a7)
1c00b790:	1c007df8 	pcaddu12i	$r24,1007(0x3ef)
1c00b794:	1c00b4e8 	pcaddu12i	$r8,1447(0x5a7)
1c00b798:	1c00b4d8 	pcaddu12i	$r24,1446(0x5a6)
1c00b79c:	1c00b4f0 	pcaddu12i	$r16,1447(0x5a7)
1c00b7a0:	1c0080ac 	pcaddu12i	$r12,1029(0x405)
1c00b7a4:	1c00b4f8 	pcaddu12i	$r24,1447(0x5a7)
1c00b7a8:	1c00b4d8 	pcaddu12i	$r24,1446(0x5a6)
1c00b7ac:	1c00b508 	pcaddu12i	$r8,1448(0x5a8)
1c00b7b0:	1c0081ac 	pcaddu12i	$r12,1037(0x40d)
1c00b7b4:	1c00b510 	pcaddu12i	$r16,1448(0x5a8)
1c00b7b8:	1c00b4d8 	pcaddu12i	$r24,1446(0x5a6)
1c00b7bc:	1c00b524 	pcaddu12i	$r4,1449(0x5a9)
1c00b7c0:	1c008240 	pcaddu12i	$r0,1042(0x412)
1c00b7c4:	1c00b52c 	pcaddu12i	$r12,1449(0x5a9)
1c00b7c8:	1c00b4d8 	pcaddu12i	$r24,1446(0x5a6)
1c00b7cc:	1c00b53c 	pcaddu12i	$r28,1449(0x5a9)
1c00b7d0:	1c008344 	pcaddu12i	$r4,1050(0x41a)
1c00b7d4:	1c00b544 	pcaddu12i	$r4,1450(0x5aa)
1c00b7d8:	1c00b4d8 	pcaddu12i	$r24,1446(0x5a6)
1c00b7dc:	1c00b554 	pcaddu12i	$r20,1450(0x5aa)
1c00b7e0:	1c008434 	pcaddu12i	$r20,1057(0x421)
1c00b7e4:	1c00b55c 	pcaddu12i	$r28,1450(0x5aa)
1c00b7e8:	1c00b4d8 	pcaddu12i	$r24,1446(0x5a6)
1c00b7ec:	1c00b568 	pcaddu12i	$r8,1451(0x5ab)
1c00b7f0:	1c008b54 	pcaddu12i	$r20,1114(0x45a)
1c00b7f4:	1c00b56c 	pcaddu12i	$r12,1451(0x5ab)
1c00b7f8:	1c00b4d8 	pcaddu12i	$r24,1446(0x5a6)
1c00b7fc:	1c00b578 	pcaddu12i	$r24,1451(0x5ab)
1c00b800:	1c008bd8 	pcaddu12i	$r24,1118(0x45e)
1c00b804:	1c00b580 	pcaddu12i	$r0,1452(0x5ac)
1c00b808:	1c00b594 	pcaddu12i	$r20,1452(0x5ac)
1c00b80c:	1c00b5a4 	pcaddu12i	$r4,1453(0x5ad)
1c00b810:	1c008c24 	pcaddu12i	$r4,1121(0x461)
1c00b814:	1c00b5ac 	pcaddu12i	$r12,1453(0x5ad)
1c00b818:	1c00b5d0 	pcaddu12i	$r16,1454(0x5ae)
1c00b81c:	1c00b5dc 	pcaddu12i	$r28,1454(0x5ae)
1c00b820:	1c008d30 	pcaddu12i	$r16,1129(0x469)
1c00b824:	1c00b5e4 	pcaddu12i	$r4,1455(0x5af)
1c00b828:	1c00b600 	pcaddu12i	$r0,1456(0x5b0)
1c00b82c:	1c00b60c 	pcaddu12i	$r12,1456(0x5b0)
1c00b830:	1c008e10 	pcaddu12i	$r16,1136(0x470)
1c00b834:	1c00b610 	pcaddu12i	$r16,1456(0x5b0)
1c00b838:	1c00b618 	pcaddu12i	$r24,1456(0x5b0)
1c00b83c:	1c00b620 	pcaddu12i	$r0,1457(0x5b1)
1c00b840:	1c008fb4 	pcaddu12i	$r20,1149(0x47d)
1c00b844:	1c00b628 	pcaddu12i	$r8,1457(0x5b1)
1c00b848:	1c00b4d8 	pcaddu12i	$r24,1446(0x5a6)
1c00b84c:	1c00b638 	pcaddu12i	$r24,1457(0x5b1)
1c00b850:	1c009124 	pcaddu12i	$r4,1161(0x489)
1c00b854:	1c00b640 	pcaddu12i	$r0,1458(0x5b2)
1c00b858:	1c00b4d8 	pcaddu12i	$r24,1446(0x5a6)
1c00b85c:	1c00b658 	pcaddu12i	$r24,1458(0x5b2)
1c00b860:	1c009a40 	pcaddu12i	$r0,1234(0x4d2)
1c00b864:	1c00b664 	pcaddu12i	$r4,1459(0x5b3)
1c00b868:	1c00b66c 	pcaddu12i	$r12,1459(0x5b3)
1c00b86c:	1c00b67c 	pcaddu12i	$r28,1459(0x5b3)
1c00b870:	1c0092b4 	pcaddu12i	$r20,1173(0x495)
1c00b874:	1c00b684 	pcaddu12i	$r4,1460(0x5b4)
1c00b878:	1c00b4d8 	pcaddu12i	$r24,1446(0x5a6)
1c00b87c:	1c00b690 	pcaddu12i	$r16,1460(0x5b4)
1c00b880:	1c009360 	pcaddu12i	$r0,1179(0x49b)
1c00b884:	1c00b698 	pcaddu12i	$r24,1460(0x5b4)
1c00b888:	1c00b4d8 	pcaddu12i	$r24,1446(0x5a6)
1c00b88c:	1c00b6a4 	pcaddu12i	$r4,1461(0x5b5)
1c00b890:	1c009668 	pcaddu12i	$r8,1203(0x4b3)
1c00b894:	1c00b6ac 	pcaddu12i	$r12,1461(0x5b5)
1c00b898:	1c00b4d8 	pcaddu12i	$r24,1446(0x5a6)
1c00b89c:	1c00b6b8 	pcaddu12i	$r24,1461(0x5b5)
1c00b8a0:	1c0093c8 	pcaddu12i	$r8,1182(0x49e)
1c00b8a4:	1c00b6c0 	pcaddu12i	$r0,1462(0x5b6)
1c00b8a8:	1c00b4d8 	pcaddu12i	$r24,1446(0x5a6)
1c00b8ac:	1c00b6cc 	pcaddu12i	$r12,1462(0x5b6)
1c00b8b0:	1c0094f8 	pcaddu12i	$r24,1191(0x4a7)
1c00b8b4:	1c00b6d4 	pcaddu12i	$r20,1462(0x5b6)
1c00b8b8:	1c00b4d8 	pcaddu12i	$r24,1446(0x5a6)
1c00b8bc:	1c00b6e0 	pcaddu12i	$r0,1463(0x5b7)
1c00b8c0:	1c0096f8 	pcaddu12i	$r24,1207(0x4b7)
1c00b8c4:	1c00b6e8 	pcaddu12i	$r8,1463(0x5b7)
1c00b8c8:	1c00b4d8 	pcaddu12i	$r24,1446(0x5a6)
1c00b8cc:	1c00b6f4 	pcaddu12i	$r20,1463(0x5b7)
1c00b8d0:	1c0099e0 	pcaddu12i	$r0,1231(0x4cf)
1c00b8d4:	1c00b700 	pcaddu12i	$r0,1464(0x5b8)
1c00b8d8:	1c00b4d8 	pcaddu12i	$r24,1446(0x5a6)
1c00b8dc:	1c00b708 	pcaddu12i	$r8,1464(0x5b8)
1c00b8e0:	1c009a14 	pcaddu12i	$r20,1232(0x4d0)
1c00b8e4:	1c00b700 	pcaddu12i	$r0,1464(0x5b8)
1c00b8e8:	1c00b4d8 	pcaddu12i	$r24,1446(0x5a6)
1c00b8ec:	1c00b70c 	pcaddu12i	$r12,1464(0x5b8)
1c00b8f0:	1c0075f4 	pcaddu12i	$r20,943(0x3af)
1c00b8f4:	1c00b714 	pcaddu12i	$r20,1464(0x5b8)
1c00b8f8:	1c00b70c 	pcaddu12i	$r12,1464(0x5b8)
1c00b8fc:	6d6f630a 	bgeu	$r24,$r10,94048(0x16f60) # 1c02285c <_sidata+0x161ac>
1c00b900:	646e616d 	bge	$r11,$r13,28256(0x6e60) # 1c012760 <_sidata+0x60b0>
1c00b904:	0a0a3a73 	0x0a0a3a73
1c00b908:	00000000 	0x00000000
1c00b90c:	32252009 	xvldrepl.w	$xr9,$r0,1312(0x520)
1c00b910:	73253a64 	vsat.d	$vr4,$vr19,0xe
1c00b914:	00000d0a 	0x00000d0a
1c00b918:	7325090a 	vsat.d	$vr10,$vr8,0x2
1c00b91c:	09732509 	0x09732509
1c00b920:	000a7325 	0x000a7325
1c00b924:	5245090a 	b	69879048(0x42a4508) # 202afe2c <_sidata+0x42a377c>
1c00b928:	3a524f52 	0x3a524f52
1c00b92c:	646e7520 	bge	$r9,$r0,28276(0x6e74) # 1c0127a0 <_sidata+0x60f0>
1c00b930:	6e696665 	bgeu	$r19,$r5,-104092(0x26964) # 1bff2294 <_start-0xdd6c>
1c00b934:	6f632065 	bgeu	$r3,$r5,-40160(0x36320) # 1c001c54 <myprintf+0x88>
1c00b938:	6e616d6d 	bgeu	$r11,$r13,-106132(0x2616c) # 1bff1aa4 <_start-0xe55c>
1c00b93c:	21212164 	sc.w	$r4,$r11,8480(0x2120)
1c00b940:	0000000a 	0x0000000a
1c00b944:	7375200a 	0x7375200a
1c00b948:	3a656761 	0x3a656761
1c00b94c:	6c656820 	bgeu	$r1,$r0,25960(0x6568) # 1c011eb4 <_sidata+0x5804>
1c00b950:	3c202070 	0x3c202070
1c00b954:	3e646d63 	0x3e646d63
1c00b958:	00000d0a 	0x00000d0a
1c00b95c:	0020240a 	div.w	$r10,$r0,$r9
1c00b960:	00000a0d 	0x00000a0d
1c00b964:	44434241 	bnez	$r18,279360(0x44340) # 1c04fca4 <_sidata+0x435f4>
1c00b968:	00000000 	0x00000000
1c00b96c:	30727473 	0x30727473
1c00b970:	25203d20 	stptr.w	$r0,$r9,8252(0x203c)
1c00b974:	000a0d73 	0x000a0d73
1c00b978:	69206425 	bltu	$r1,$r5,73828(0x12064) # 1c01d9dc <_sidata+0x1132c>
1c00b97c:	72702073 	0x72702073
1c00b980:	65737365 	bge	$r27,$r5,95088(0x17370) # 1c022cf0 <_sidata+0x16640>
1c00b984:	00000a0d 	0x00000a0d
1c00b988:	7375200a 	0x7375200a
1c00b98c:	3a656761 	0x3a656761
1c00b990:	20316420 	ll.w	$r0,$r1,12644(0x3164)
1c00b994:	64613c20 	bge	$r1,$r0,24892(0x613c) # 1c011ad0 <_sidata+0x5420>
1c00b998:	203e7264 	ll.w	$r4,$r19,15984(0x3e70)
1c00b99c:	756e3c20 	0x756e3c20
1c00b9a0:	0d0a3e6d 	0x0d0a3e6d
1c00b9a4:	00000000 	0x00000000
1c00b9a8:	7830200a 	0x7830200a
1c00b9ac:	78383025 	0x78383025
1c00b9b0:	0000093a 	0x0000093a
1c00b9b4:	32302520 	0x32302520
1c00b9b8:	00002078 	clo.d	$r24,$r3
1c00b9bc:	7375200a 	0x7375200a
1c00b9c0:	3a656761 	0x3a656761
1c00b9c4:	20346420 	ll.w	$r0,$r1,13412(0x3464)
1c00b9c8:	6464613c 	bge	$r9,$r28,25696(0x6460) # 1c011e28 <_sidata+0x5778>
1c00b9cc:	3c203e72 	0x3c203e72
1c00b9d0:	3e6d756e 	0x3e6d756e
1c00b9d4:	00000d0a 	0x00000d0a
1c00b9d8:	2578300a 	stptr.w	$r10,$r0,30768(0x7830)
1c00b9dc:	3a783830 	0x3a783830
1c00b9e0:	00000009 	0x00000009
1c00b9e4:	38302520 	fldx.s	$f0,$r9,$r9
1c00b9e8:	00002078 	clo.d	$r24,$r3
1c00b9ec:	7375200a 	0x7375200a
1c00b9f0:	3a656761 	0x3a656761
1c00b9f4:	20316d20 	ll.w	$r0,$r9,12652(0x316c)
1c00b9f8:	6464613c 	bge	$r9,$r28,25696(0x6460) # 1c011e58 <_sidata+0x57a8>
1c00b9fc:	3c203e72 	0x3c203e72
1c00ba00:	756c6176 	0x756c6176
1c00ba04:	0d0a3e65 	0x0d0a3e65
1c00ba08:	00000000 	0x00000000
1c00ba0c:	7375200a 	0x7375200a
1c00ba10:	3a656761 	0x3a656761
1c00ba14:	20346d20 	ll.w	$r0,$r9,13420(0x346c)
1c00ba18:	6464613c 	bge	$r9,$r28,25696(0x6460) # 1c011e78 <_sidata+0x57c8>
1c00ba1c:	3c203e72 	0x3c203e72
1c00ba20:	756c6176 	0x756c6176
1c00ba24:	0d0a3e65 	0x0d0a3e65
1c00ba28:	00000000 	0x00000000
1c00ba2c:	656c6c69 	bge	$r3,$r9,93292(0x16c6c) # 1c022698 <_sidata+0x15fe8>
1c00ba30:	206c6167 	ll.w	$r7,$r11,27744(0x6c60)
1c00ba34:	20786568 	ll.w	$r8,$r11,30820(0x7864)
1c00ba38:	626d756e 	blt	$r11,$r14,-103052(0x26d74) # 1bff27ac <_start-0xd854>
1c00ba3c:	2e2e7265 	0x2e2e7265
1c00ba40:	00000a2e 	0x00000a2e
1c00ba44:	656c6c69 	bge	$r3,$r9,93292(0x16c6c) # 1c0226b0 <_sidata+0x16000>
1c00ba48:	206c6167 	ll.w	$r7,$r11,27744(0x6c60)
1c00ba4c:	626d756e 	blt	$r11,$r14,-103052(0x26d74) # 1bff27c0 <_start-0xd840>
1c00ba50:	2e2e7265 	0x2e2e7265
1c00ba54:	00000a2e 	0x00000a2e
1c00ba58:	7375200a 	0x7375200a
1c00ba5c:	3a656761 	0x3a656761
1c00ba60:	3c207620 	0x3c207620
1c00ba64:	72646461 	0x72646461
1c00ba68:	6e3c203e 	bgeu	$r1,$r30,-115680(0x23c20) # 1bfef688 <_start-0x10978>
1c00ba6c:	0a3e6d75 	0x0a3e6d75
1c00ba70:	0000000d 	0x0000000d
1c00ba74:	4d575056 	jirl	$r22,$r2,87888(0x15750)
1c00ba78:	616d6420 	blt	$r1,$r0,93540(0x16d64) # 1c0227dc <_sidata+0x1612c>
1c00ba7c:	20646120 	ll.w	$r0,$r9,25696(0x6460)
1c00ba80:	74736574 	xvmin.w	$xr20,$xr11,$xr25
1c00ba84:	61747320 	blt	$r25,$r0,95344(0x17470) # 1c022ef4 <_sidata+0x16844>
1c00ba88:	64657472 	bge	$r3,$r18,25972(0x6574) # 1c011ffc <_sidata+0x594c>
1c00ba8c:	00000a20 	0x00000a20
1c00ba90:	4d575056 	jirl	$r22,$r2,87888(0x15750)
1c00ba94:	616d6420 	blt	$r1,$r0,93540(0x16d64) # 1c0227f8 <_sidata+0x16148>
1c00ba98:	20646120 	ll.w	$r0,$r9,25696(0x6460)
1c00ba9c:	74736574 	xvmin.w	$xr20,$xr11,$xr25
1c00baa0:	646e6520 	bge	$r9,$r0,28260(0x6e64) # 1c012904 <_sidata+0x6254>
1c00baa4:	0000000a 	0x0000000a
1c00baa8:	6573540a 	bge	$r0,$r10,95060(0x17354) # 1c022dfc <_sidata+0x1674c>
1c00baac:	726f736e 	0x726f736e
1c00bab0:	00000a3a 	0x00000a3a
1c00bab4:	435f5354 	beqz	$r26,-2924720(0x535f50) # 1bd41a04 <_start-0x2be5fc>
1c00bab8:	206c7274 	ll.w	$r20,$r19,27760(0x6c70)
1c00babc:	3d202020 	0x3d202020
1c00bac0:	25783020 	stptr.w	$r0,$r1,30768(0x7830)
1c00bac4:	000a7838 	0x000a7838
1c00bac8:	4f5f5354 	jirl	$r20,$r26,-41136(0x35f50)
1c00bacc:	68546373 	bltu	$r27,$r19,21600(0x5460) # 1c010f2c <_sidata+0x487c>
1c00bad0:	3d202020 	0x3d202020
1c00bad4:	25783020 	stptr.w	$r0,$r1,30768(0x7830)
1c00bad8:	000a7838 	0x000a7838
1c00badc:	505f5354 	b	-45064368(0xd505f50) # 19511a2c <_start-0x2aee5d4>
1c00bae0:	546c6c6f 	bl	29125740(0x1bc6c6c) # 1dbd274c <_sidata+0x1bc609c>
1c00bae4:	3d206d69 	0x3d206d69
1c00bae8:	25783020 	stptr.w	$r0,$r1,30768(0x7830)
1c00baec:	000a7838 	0x000a7838
1c00baf0:	20202020 	ll.w	$r0,$r1,8224(0x2020)
1c00baf4:	43202020 	beqz	$r1,204832(0x32020) # 1c03db14 <_sidata+0x31464>
1c00baf8:	74416e68 	xvaddwod.d.wu.w	$xr8,$xr19,$xr27
1c00bafc:	20207274 	ll.w	$r20,$r19,8304(0x2070)
1c00bb00:	20202020 	ll.w	$r0,$r1,8224(0x2020)
1c00bb04:	746e4320 	0x746e4320
1c00bb08:	0a736552 	0x0a736552
1c00bb0c:	00000000 	0x00000000
1c00bb10:	6432255b 	bge	$r10,$r27,12836(0x3224) # 1c00ed34 <_sidata+0x2684>
1c00bb14:	203d205d 	ll.w	$r29,$r2,15648(0x3d20)
1c00bb18:	38257830 	0x38257830
1c00bb1c:	20202078 	ll.w	$r24,$r3,8224(0x2020)
1c00bb20:	25783020 	stptr.w	$r0,$r1,30768(0x7830)
1c00bb24:	000a7838 	0x000a7838
1c00bb28:	2020200a 	ll.w	$r10,$r0,8224(0x2020)
1c00bb2c:	20202020 	ll.w	$r0,$r1,8224(0x2020)
1c00bb30:	30302020 	0x30302020
1c00bb34:	30202020 	vldrepl.w	$vr0,$r1,32(0x20)
1c00bb38:	20202031 	ll.w	$r17,$r1,8224(0x2020)
1c00bb3c:	20203230 	ll.w	$r16,$r17,8240(0x2030)
1c00bb40:	20333020 	ll.w	$r0,$r1,13104(0x3330)
1c00bb44:	34302020 	0x34302020
1c00bb48:	30202020 	vldrepl.w	$vr0,$r1,32(0x20)
1c00bb4c:	20202035 	ll.w	$r21,$r1,8224(0x2020)
1c00bb50:	20203630 	ll.w	$r16,$r17,8244(0x2034)
1c00bb54:	20373020 	ll.w	$r0,$r1,14128(0x3730)
1c00bb58:	38302020 	fldx.s	$f0,$r1,$r8
1c00bb5c:	30202020 	vldrepl.w	$vr0,$r1,32(0x20)
1c00bb60:	20202039 	ll.w	$r25,$r1,8224(0x2020)
1c00bb64:	20203031 	ll.w	$r17,$r1,8240(0x2030)
1c00bb68:	0a313120 	0x0a313120
1c00bb6c:	00000000 	0x00000000
1c00bb70:	76736162 	0x76736162
1c00bb74:	00006c61 	cpucfg	$r1,$r3
1c00bb78:	64342520 	bge	$r9,$r0,13348(0x3424) # 1c00ef9c <_sidata+0x28ec>
1c00bb7c:	00000000 	0x00000000
1c00bb80:	746e630a 	0x746e630a
1c00bb84:	006c6176 	bstrins.w	$r22,$r11,0xc,0x18
1c00bb88:	74696e69 	xvavgr.w	$xr9,$xr19,$xr27
1c00bb8c:	00000000 	0x00000000
1c00bb90:	6f74200a 	bgeu	$r0,$r10,-35808(0x37420) # 1c002fb0 <Set_video+0x128>
1c00bb94:	20686375 	ll.w	$r21,$r27,26720(0x6860)
1c00bb98:	74696e69 	xvavgr.w	$xr9,$xr19,$xr27
1c00bb9c:	6f643c20 	bgeu	$r1,$r0,-39876(0x3643c) # 1c001fd8 <Uart_init+0x68>
1c00bba0:	745f6e77 	0x745f6e77
1c00bba4:	002e3e68 	0x002e3e68
1c00bba8:	6f54200a 	bgeu	$r0,$r10,-44000(0x35420) # 1c000fc8 <cpu_wait+0xf20>
1c00bbac:	20686375 	ll.w	$r21,$r27,26720(0x6860)
1c00bbb0:	74696e49 	xvavgr.w	$xr9,$xr18,$xr27
1c00bbb4:	00000000 	0x00000000
1c00bbb8:	6e616373 	bgeu	$r27,$r19,-106144(0x26160) # 1bff1d18 <_start-0xe2e8>
1c00bbbc:	00000000 	0x00000000
1c00bbc0:	6f54200a 	bgeu	$r0,$r10,-44000(0x35420) # 1c000fe0 <cpu_wait+0xf38>
1c00bbc4:	20686375 	ll.w	$r21,$r27,26720(0x6860)
1c00bbc8:	6e616353 	bgeu	$r26,$r19,-106144(0x26160) # 1bff1d28 <_start-0xe2d8>
1c00bbcc:	00000000 	0x00000000
1c00bbd0:	6e776f64 	bgeu	$r27,$r4,-100500(0x2776c) # 1bff333c <_start-0xccc4>
1c00bbd4:	00000000 	0x00000000
1c00bbd8:	6f54200a 	bgeu	$r0,$r10,-44000(0x35420) # 1c000ff8 <cpu_wait+0xf50>
1c00bbdc:	20686375 	ll.w	$r21,$r27,26720(0x6860)
1c00bbe0:	6e776f44 	bgeu	$r26,$r4,-100500(0x2776c) # 1bff334c <_start-0xccb4>
1c00bbe4:	00006854 	rdtime.d	$r20,$r2
1c00bbe8:	6f74200a 	bgeu	$r0,$r10,-35808(0x37420) # 1c003008 <Set_video+0x180>
1c00bbec:	20686375 	ll.w	$r21,$r27,26720(0x6860)
1c00bbf0:	6e776f64 	bgeu	$r27,$r4,-100500(0x2776c) # 1bff335c <_start-0xcca4>
1c00bbf4:	6f643c20 	bgeu	$r1,$r0,-39876(0x3643c) # 1c002030 <UART_SendData+0x10>
1c00bbf8:	745f6e77 	0x745f6e77
1c00bbfc:	3c203e68 	0x3c203e68
1c00bc00:	6e616863 	bgeu	$r3,$r3,-106136(0x26168) # 1bff1d68 <_start-0xe298>
1c00bc04:	3e6c656e 	0x3e6c656e
1c00bc08:	00000000 	0x00000000
1c00bc0c:	6c6c6f70 	bgeu	$r27,$r16,27756(0x6c6c) # 1c012878 <_sidata+0x61c8>
1c00bc10:	00000000 	0x00000000
1c00bc14:	6f54200a 	bgeu	$r0,$r10,-44000(0x35420) # 1c001034 <DEFAULT_INT_HANDLER+0x34>
1c00bc18:	20686375 	ll.w	$r21,$r27,26720(0x6860)
1c00bc1c:	6c6c6f50 	bgeu	$r26,$r16,27756(0x6c6c) # 1c012888 <_sidata+0x61d8>
1c00bc20:	0000002e 	0x0000002e
1c00bc24:	776f6873 	xvssrarni.du.q	$xr19,$xr3,0x5a
1c00bc28:	00000000 	0x00000000
1c00bc2c:	6e49200a 	bgeu	$r0,$r10,-112352(0x24920) # 1bff054c <_start-0xfab4>
1c00bc30:	20747570 	ll.w	$r16,$r11,29812(0x7474)
1c00bc34:	6f727245 	bgeu	$r18,$r5,-36240(0x37270) # 1c002ea4 <Set_video+0x1c>
1c00bc38:	00002e72 	ctz.d	$r18,$r19
1c00bc3c:	6173550a 	blt	$r8,$r10,95060(0x17354) # 1c022f90 <_sidata+0x168e0>
1c00bc40:	203a6567 	ll.w	$r7,$r11,14948(0x3a64)
1c00bc44:	63756f74 	blt	$r27,$r20,-35476(0x3756c) # 1c0031b0 <Rtc_Write+0x80>
1c00bc48:	6e692068 	bgeu	$r3,$r8,-104160(0x26920) # 1bff2568 <_start-0xda98>
1c00bc4c:	3c207469 	0x3c207469
1c00bc50:	6e776f64 	bgeu	$r27,$r4,-100500(0x2776c) # 1bff33bc <_start-0xcc44>
1c00bc54:	3e68745f 	0x3e68745f
1c00bc58:	0a090920 	0x0a090920
1c00bc5c:	20202020 	ll.w	$r0,$r1,8224(0x2020)
1c00bc60:	74202020 	xvsubwev.h.b	$xr0,$xr1,$xr8
1c00bc64:	6863756f 	bltu	$r11,$r15,25460(0x6374) # 1c011fd8 <_sidata+0x5928>
1c00bc68:	776f6420 	xvssrarni.du.q	$xr0,$xr1,0x59
1c00bc6c:	643c206e 	bge	$r3,$r14,15392(0x3c20) # 1c00f88c <_sidata+0x31dc>
1c00bc70:	5f6e776f 	bne	$r27,$r15,-37260(0x36e74) # 1c002ae4 <Set_Blood_1+0xc>
1c00bc74:	203e6874 	ll.w	$r20,$r3,15976(0x3e68)
1c00bc78:	6168633c 	blt	$r25,$r28,92256(0x16860) # 1c0224d8 <_sidata+0x15e28>
1c00bc7c:	6c656e6e 	bgeu	$r19,$r14,25964(0x656c) # 1c0121e8 <_sidata+0x5b38>
1c00bc80:	2009203e 	ll.w	$r30,$r1,2336(0x920)
1c00bc84:	20202020 	ll.w	$r0,$r1,8224(0x2020)
1c00bc88:	0a202020 	xvfmadd.d	$xr0,$xr1,$xr8,$xr0
1c00bc8c:	20202020 	ll.w	$r0,$r1,8224(0x2020)
1c00bc90:	74202020 	xvsubwev.h.b	$xr0,$xr1,$xr8
1c00bc94:	6863756f 	bltu	$r11,$r15,25460(0x6374) # 1c012008 <_sidata+0x5958>
1c00bc98:	61637320 	blt	$r25,$r0,90992(0x16370) # 1c022008 <_sidata+0x15958>
1c00bc9c:	0909206e 	0x0909206e
1c00bca0:	2020200a 	ll.w	$r10,$r0,8224(0x2020)
1c00bca4:	20202020 	ll.w	$r0,$r1,8224(0x2020)
1c00bca8:	63756f74 	blt	$r27,$r20,-35476(0x3756c) # 1c003214 <Rtc_Write+0xe4>
1c00bcac:	6f702068 	bgeu	$r3,$r8,-36832(0x37020) # 1c002ccc <Set_Prop2_x+0x10>
1c00bcb0:	09206c6c 	vfmadd.d	$vr12,$vr3,$vr27,$vr0
1c00bcb4:	20200a09 	ll.w	$r9,$r16,8200(0x2008)
1c00bcb8:	20202020 	ll.w	$r0,$r1,8224(0x2020)
1c00bcbc:	756f7420 	0x756f7420
1c00bcc0:	73206863 	0x73206863
1c00bcc4:	00776f68 	bstrins.w	$r8,$r27,0x17,0x1b
1c00bcc8:	68200a0d 	bltu	$r16,$r13,8200(0x2008) # 1c00dcd0 <_sidata+0x1620>
1c00bccc:	20746570 	ll.w	$r16,$r11,29796(0x7464)
1c00bcd0:	656d6974 	bge	$r11,$r20,93544(0x16d68) # 1c022a38 <_sidata+0x16388>
1c00bcd4:	74732072 	xvmin.w	$xr18,$xr3,$xr8
1c00bcd8:	2e747261 	0x2e747261
1c00bcdc:	0a2e2e2e 	xvfmadd.d	$xr14,$xr17,$xr11,$xr28
1c00bce0:	00000000 	0x00000000
1c00bce4:	55200a0d 	bl	-130736120(0x8352008) # 1435dcec <_start-0x7ca2314>
1c00bce8:	65676173 	bge	$r11,$r19,92000(0x16760) # 1c022448 <_sidata+0x15d98>
1c00bcec:	7068203a 	vavgr.b	$vr26,$vr1,$vr8
1c00bcf0:	3c207465 	0x3c207465
1c00bcf4:	69726570 	bltu	$r11,$r16,94820(0x17264) # 1c022f58 <_sidata+0x168a8>
1c00bcf8:	6369646f 	blt	$r3,$r15,-38556(0x36964) # 1c00265c <soc_myprintf+0x25c>
1c00bcfc:	733c203e 	0x733c203e
1c00bd00:	74726174 	xvmin.b	$xr20,$xr11,$xr24
1c00bd04:	3e736d5f 	0x3e736d5f
1c00bd08:	65733c20 	bge	$r1,$r0,95036(0x1733c) # 1c023044 <_sidata+0x16994>
1c00bd0c:	00003e63 	revb.d	$r3,$r19
1c00bd10:	63200a0d 	blt	$r16,$r13,-57336(0x32008) # 1bffdd18 <_start-0x22e8>
1c00bd14:	2065726f 	ll.w	$r15,$r19,25968(0x6570)
1c00bd18:	656d6974 	bge	$r11,$r20,93544(0x16d68) # 1c022a80 <_sidata+0x163d0>
1c00bd1c:	74732072 	xvmin.w	$xr18,$xr3,$xr8
1c00bd20:	2e747261 	0x2e747261
1c00bd24:	612e2e2e 	blt	$r17,$r14,77356(0x12e2c) # 1c01eb50 <_sidata+0x124a0>
1c00bd28:	3a636772 	0x3a636772
1c00bd2c:	000a6425 	0x000a6425
1c00bd30:	55200a0d 	bl	-130736120(0x8352008) # 1435dd38 <_start-0x7ca22c8>
1c00bd34:	65676173 	bge	$r11,$r19,92000(0x16760) # 1c022494 <_sidata+0x15de4>
1c00bd38:	616c203a 	blt	$r1,$r26,93216(0x16c20) # 1c022958 <_sidata+0x162a8>
1c00bd3c:	656d6974 	bge	$r11,$r20,93544(0x16d68) # 1c022aa4 <_sidata+0x163f4>
1c00bd40:	733c2072 	0x733c2072
1c00bd44:	003e6365 	0x003e6365
1c00bd48:	55200a0d 	bl	-130736120(0x8352008) # 1435dd50 <_start-0x7ca22b0>
1c00bd4c:	65676173 	bge	$r11,$r19,92000(0x16760) # 1c0224ac <_sidata+0x15dfc>
1c00bd50:	6564203a 	bge	$r1,$r26,91168(0x16420) # 1c022170 <_sidata+0x15ac0>
1c00bd54:	2079616c 	ll.w	$r12,$r11,31072(0x7960)
1c00bd58:	646f6d3c 	bge	$r9,$r28,28524(0x6f6c) # 1c012cc4 <_sidata+0x6614>
1c00bd5c:	3a313a65 	0x3a313a65
1c00bd60:	322c7375 	xvldrepl.w	$xr21,$r27,-912(0xc70)
1c00bd64:	2c736d3a 	vst	$vr26,$r9,-805(0xcdb)
1c00bd68:	3e733a33 	0x3e733a33
1c00bd6c:	61763c20 	blt	$r1,$r0,95804(0x1763c) # 1c0233a8 <_sidata+0x16cf8>
1c00bd70:	00003e6c 	revb.d	$r12,$r19
1c00bd74:	64250a0d 	bge	$r16,$r13,9480(0x2508) # 1c00e27c <_sidata+0x1bcc>
1c00bd78:	00007375 	0x00007375
1c00bd7c:	64250a0d 	bge	$r16,$r13,9480(0x2508) # 1c00e284 <_sidata+0x1bd4>
1c00bd80:	0000736d 	0x0000736d
1c00bd84:	64250a0d 	bge	$r16,$r13,9480(0x2508) # 1c00e28c <_sidata+0x1bdc>
1c00bd88:	00000073 	0x00000073
1c00bd8c:	69540a0d 	bltu	$r16,$r13,87048(0x15408) # 1c021194 <_sidata+0x14ae4>
1c00bd90:	2072656d 	ll.w	$r13,$r11,29284(0x7264)
1c00bd94:	656b6157 	bge	$r10,$r23,93024(0x16b60) # 1c0228f4 <_sidata+0x16244>
1c00bd98:	20705520 	ll.w	$r0,$r9,28756(0x7054)
1c00bd9c:	72617473 	0x72617473
1c00bda0:	2e2e2e74 	0x2e2e2e74
1c00bda4:	6772612e 	bge	$r9,$r14,-36256(0x37260) # 1c003004 <Set_video+0x17c>
1c00bda8:	64253a63 	bge	$r19,$r3,9528(0x2538) # 1c00e2e0 <_sidata+0x1c30>
1c00bdac:	0000000a 	0x0000000a
1c00bdb0:	55200a0d 	bl	-130736120(0x8352008) # 1435ddb8 <_start-0x7ca2248>
1c00bdb4:	65676173 	bge	$r11,$r19,92000(0x16760) # 1c022514 <_sidata+0x15e64>
1c00bdb8:	6177203a 	blt	$r1,$r26,96032(0x17720) # 1c0234d8 <_sidata+0x16e28>
1c00bdbc:	7075656b 	vmax.wu	$vr11,$vr11,$vr25
1c00bdc0:	65733c20 	bge	$r1,$r0,95036(0x1733c) # 1c0230fc <_sidata+0x16a4c>
1c00bdc4:	00003e63 	revb.d	$r3,$r19
1c00bdc8:	72770a0d 	0x72770a0d
1c00bdcc:	20676e6f 	ll.w	$r15,$r19,26476(0x676c)
1c00bdd0:	676e6172 	bge	$r11,$r18,-37280(0x36e60) # 1c002c30 <Set_Player1_y+0x24>
1c00bdd4:	666f2065 	bge	$r3,$r5,-102624(0x26f20) # 1bff2cf4 <_start-0xd30c>
1c00bdd8:	6d756e20 	bgeu	$r17,$r0,95596(0x1756c) # 1c023344 <_sidata+0x16c94>
1c00bddc:	21726562 	sc.w	$r2,$r11,29284(0x7264)
1c00bde0:	00000a0d 	0x00000a0d
1c00bde4:	00000a0d 	0x00000a0d
1c00bde8:	65746164 	bge	$r11,$r4,95328(0x17460) # 1c023248 <_sidata+0x16b98>
1c00bdec:	206f7420 	ll.w	$r0,$r1,28532(0x6f74)
1c00bdf0:	70736964 	vmin.w	$vr4,$vr11,$vr26
1c00bdf4:	2079616c 	ll.w	$r12,$r11,31072(0x7960)
1c00bdf8:	656d6974 	bge	$r11,$r20,93544(0x16d68) # 1c022b60 <_sidata+0x164b0>
1c00bdfc:	0a0d202e 	0x0a0d202e
1c00be00:	00000000 	0x00000000
1c00be04:	65746164 	bge	$r11,$r4,95328(0x17460) # 1c023264 <_sidata+0x16bb4>
1c00be08:	20732d20 	ll.w	$r0,$r9,29484(0x732c)
1c00be0c:	6d2d7979 	bgeu	$r11,$r25,77176(0x12d78) # 1c01eb84 <_sidata+0x124d4>
1c00be10:	64642d6d 	bge	$r11,$r13,25644(0x642c) # 1c01223c <_sidata+0x5b8c>
1c00be14:	3a686820 	0x3a686820
1c00be18:	733a6d6d 	0x733a6d6d
1c00be1c:	6f742073 	bgeu	$r3,$r19,-35808(0x37420) # 1c00323c <Rtc_Write+0x10c>
1c00be20:	74657320 	xvavg.w	$xr0,$xr25,$xr28
1c00be24:	6d697420 	bgeu	$r1,$r0,92532(0x16974) # 1c022798 <_sidata+0x160e8>
1c00be28:	0a0d2e65 	0x0a0d2e65
1c00be2c:	00000000 	0x00000000
1c00be30:	65746164 	bge	$r11,$r4,95328(0x17460) # 1c023290 <_sidata+0x16be0>
1c00be34:	20692d20 	ll.w	$r0,$r9,26924(0x692c)
1c00be38:	642d6d6d 	bge	$r11,$r13,11628(0x2d6c) # 1c00eba4 <_sidata+0x24f4>
1c00be3c:	68682064 	bltu	$r3,$r4,26656(0x6820) # 1c01265c <_sidata+0x5fac>
1c00be40:	3a6d6d3a 	0x3a6d6d3a
1c00be44:	74207373 	xvsubwev.h.b	$xr19,$xr27,$xr28
1c00be48:	6573206f 	bge	$r3,$r15,95008(0x17320) # 1c023168 <_sidata+0x16ab8>
1c00be4c:	6e692074 	bgeu	$r3,$r20,-104160(0x26920) # 1bff276c <_start-0xd894>
1c00be50:	0a0d2e74 	0x0a0d2e74
1c00be54:	00000000 	0x00000000
1c00be58:	65746164 	bge	$r11,$r4,95328(0x17460) # 1c0232b8 <_sidata+0x16c08>
1c00be5c:	20662d20 	ll.w	$r0,$r9,26156(0x662c)
1c00be60:	3a207a48 	0x3a207a48
1c00be64:	75706e69 	0x75706e69
1c00be68:	72662074 	0x72662074
1c00be6c:	6e657165 	bgeu	$r11,$r5,-105104(0x26570) # 1bff23dc <_start-0xdc24>
1c00be70:	69207963 	bltu	$r11,$r3,73848(0x12078) # 1c01dee8 <_sidata+0x11838>
1c00be74:	6e69206e 	bgeu	$r3,$r14,-104160(0x26920) # 1bff2794 <_start-0xd86c>
1c00be78:	65676574 	bge	$r11,$r20,92004(0x16764) # 1c0225dc <_sidata+0x15f2c>
1c00be7c:	6f742072 	bgeu	$r3,$r18,-35808(0x37420) # 1c00329c <RtcUpdateData>
1c00be80:	74657320 	xvavg.w	$xr0,$xr25,$xr28
1c00be84:	65727020 	bge	$r1,$r0,94832(0x17270) # 1c0230f4 <_sidata+0x16a44>
1c00be88:	6c616373 	bgeu	$r27,$r19,24928(0x6160) # 1c011fe8 <_sidata+0x5938>
1c00be8c:	0a0d2e65 	0x0a0d2e65
1c00be90:	00000000 	0x00000000
1c00be94:	63656863 	blt	$r3,$r3,-39576(0x36568) # 1c0023fc <soc_printbase+0x15c>
1c00be98:	6170206b 	blt	$r3,$r11,94240(0x17020) # 1c022eb8 <_sidata+0x16808>
1c00be9c:	656d6172 	bge	$r11,$r18,93536(0x16d60) # 1c022bfc <_sidata+0x1654c>
1c00bea0:	0d726574 	0x0d726574
1c00bea4:	0000000a 	0x0000000a
1c00bea8:	61766e69 	blt	$r19,$r9,95852(0x1766c) # 1c023514 <_sidata+0x16e64>
1c00beac:	2064696c 	ll.w	$r12,$r11,25704(0x6468)
1c00beb0:	61726170 	blt	$r11,$r16,94816(0x17260) # 1c023110 <_sidata+0x16a60>
1c00beb4:	0000006d 	0x0000006d
1c00beb8:	68730a0d 	bltu	$r16,$r13,29448(0x7308) # 1c0131c0 <_sidata+0x6b10>
1c00bebc:	646c756f 	bge	$r11,$r15,27764(0x6c74) # 1c012b30 <_sidata+0x6480>
1c00bec0:	20656220 	ll.w	$r0,$r17,25952(0x6560)
1c00bec4:	736f6c63 	vssrarni.du.q	$vr3,$vr3,0x5b
1c00bec8:	6f742065 	bgeu	$r3,$r5,-35808(0x37420) # 1c0032e8 <gpio_init>
1c00becc:	37323320 	0x37323320
1c00bed0:	48203836 	bceqz	$fcc1,-2613192(0x582038) # 1bd8df08 <_start-0x2720f8>
1c00bed4:	000a0d7a 	0x000a0d7a
1c00bed8:	65746164 	bge	$r11,$r4,95328(0x17460) # 1c023338 <_sidata+0x16c88>
1c00bedc:	20682d20 	ll.w	$r0,$r9,26668(0x682c)
1c00bee0:	20726f66 	ll.w	$r6,$r27,29292(0x726c)
1c00bee4:	67617375 	bge	$r27,$r21,-40592(0x36170) # 1c002054 <UART_SendData+0x34>
1c00bee8:	000a0d65 	0x000a0d65
1c00beec:	30253032 	vldrepl.w	$vr18,$r1,1328(0x530)
1c00bef0:	252d6432 	stptr.w	$r18,$r1,11620(0x2d64)
1c00bef4:	2d643230 	0x2d643230
1c00bef8:	64323025 	bge	$r1,$r5,12848(0x3230) # 1c00f128 <_sidata+0x2a78>
1c00befc:	00000020 	0x00000020
1c00bf00:	64323025 	bge	$r1,$r5,12848(0x3230) # 1c00f130 <_sidata+0x2a80>
1c00bf04:	3230253a 	0x3230253a
1c00bf08:	30253a64 	vldrepl.w	$vr4,$r19,1336(0x538)
1c00bf0c:	00006432 	rdtimeh.w	$r18,$r1
1c00bf10:	0000682d 	rdtime.d	$r13,$r1
1c00bf14:	0000732d 	0x0000732d
1c00bf18:	0000692d 	rdtime.d	$r13,$r9
1c00bf1c:	0000662d 	rdtimeh.w	$r13,$r17
1c00bf20:	1c00bf10 	pcaddu12i	$r16,1528(0x5f8)
1c00bf24:	1c00bf14 	pcaddu12i	$r20,1528(0x5f8)
1c00bf28:	1c00bf18 	pcaddu12i	$r24,1528(0x5f8)
1c00bf2c:	1c00bf1c 	pcaddu12i	$r28,1528(0x5f8)
1c00bf30:	64770a0d 	bge	$r16,$r13,30472(0x7708) # 1c013638 <_sidata+0x6f88>
1c00bf34:	65742067 	bge	$r3,$r7,95264(0x17420) # 1c023354 <_sidata+0x16ca4>
1c00bf38:	73207473 	0x73207473
1c00bf3c:	74726174 	xvmin.b	$xr20,$xr11,$xr24
1c00bf40:	2e2e2e2e 	0x2e2e2e2e
1c00bf44:	63677261 	blt	$r19,$r1,-39056(0x36770) # 1c0026b4 <soc_myprintf+0x2b4>
1c00bf48:	0a64253a 	xvfmsub.d	$xr26,$xr9,$xr9,$xr8
1c00bf4c:	00000000 	0x00000000
1c00bf50:	55200a0d 	bl	-130736120(0x8352008) # 1435df58 <_start-0x7ca20a8>
1c00bf54:	65676173 	bge	$r11,$r19,92000(0x16760) # 1c0226b4 <_sidata+0x16004>
1c00bf58:	6477203a 	bge	$r1,$r26,30496(0x7720) # 1c013678 <_sidata+0x6fc8>
1c00bf5c:	733c2067 	0x733c2067
1c00bf60:	003e6365 	0x003e6365
1c00bf64:	7375200a 	0x7375200a
1c00bf68:	3a656761 	0x3a656761
1c00bf6c:	63326920 	blt	$r9,$r0,-52632(0x33268) # 1bfff1d4 <_start-0xe2c>
1c00bf70:	633c2077 	blt	$r3,$r23,-50144(0x33c20) # 1bfffb90 <_start-0x470>
1c00bf74:	61706968 	blt	$r11,$r8,94312(0x17068) # 1c022fdc <_sidata+0x1692c>
1c00bf78:	3e726464 	0x3e726464
1c00bf7c:	65723c20 	bge	$r1,$r0,94780(0x1723c) # 1c0231b8 <_sidata+0x16b08>
1c00bf80:	64646167 	bge	$r11,$r7,25696(0x6460) # 1c0123e0 <_sidata+0x5d30>
1c00bf84:	3c203e72 	0x3c203e72
1c00bf88:	74616477 	xvabsd.w	$xr23,$xr3,$xr25
1c00bf8c:	000a3e61 	0x000a3e61
1c00bf90:	74616477 	xvabsd.w	$xr23,$xr3,$xr25
1c00bf94:	78303d61 	0x78303d61
1c00bf98:	00007825 	0x00007825
1c00bf9c:	72646461 	0x72646461
1c00bfa0:	2578303d 	stptr.w	$r29,$r1,30768(0x7830)
1c00bfa4:	00000078 	0x00000078
1c00bfa8:	7375200a 	0x7375200a
1c00bfac:	3a656761 	0x3a656761
1c00bfb0:	63326920 	blt	$r9,$r0,-52632(0x33268) # 1bfff218 <_start-0xde8>
1c00bfb4:	68633c72 	bltu	$r3,$r18,25404(0x633c) # 1c0122f0 <_sidata+0x5c40>
1c00bfb8:	64617069 	bge	$r3,$r9,24944(0x6170) # 1c012128 <_sidata+0x5a78>
1c00bfbc:	3c3e7264 	0x3c3e7264
1c00bfc0:	61676572 	blt	$r11,$r18,92004(0x16764) # 1c022724 <_sidata+0x16074>
1c00bfc4:	3e726464 	0x3e726464
1c00bfc8:	0000000a 	0x0000000a
1c00bfcc:	72200a0d 	0x72200a0d
1c00bfd0:	61746164 	blt	$r11,$r4,95328(0x17460) # 1c023430 <_sidata+0x16d80>
1c00bfd4:	25783020 	stptr.w	$r0,$r1,30768(0x7830)
1c00bfd8:	0d783230 	0x0d783230
1c00bfdc:	0000000a 	0x0000000a
1c00bfe0:	44410a0d 	bnez	$r16,3424520(0x344108) # 1c3500e8 <_sidata+0x343a38>
1c00bfe4:	733c2043 	0x733c2043
1c00bfe8:	203e6c65 	ll.w	$r5,$r3,15980(0x3e6c)
1c00bfec:	7669643c 	0x7669643c
1c00bff0:	743c203e 	0x743c203e
1c00bff4:	73656d69 	vssrani.wu.d	$vr9,$vr11,0x1b
1c00bff8:	0000003e 	0x0000003e
1c00bffc:	65730a0d 	bge	$r16,$r13,94984(0x17308) # 1c023304 <_sidata+0x16c54>
1c00c000:	28203a6c 	ld.b	$r12,$r19,-2034(0x80e)
1c00c004:	44412930 	bnez	$r9,-4177624(0x404128) # 1bc1012c <_start-0x3efed4>
1c00c008:	30495f43 	vldrepl.h	$vr3,$r26,1198(0x4ae)
1c00c00c:	3128202c 	vstelm.w	$vr12,$r1,32(0x20),0x2
1c00c010:	43444129 	beqz	$r9,2573376(0x274440) # 1c280450 <_sidata+0x273da0>
1c00c014:	2c31495f 	vld	$vr31,$r10,-942(0xc52)
1c00c018:	29322820 	st.b	$r0,$r1,-886(0xc8a)
1c00c01c:	41435256 	beqz	$r18,-2538672(0x594350) # 1bda036c <_start-0x25fc94>
1c00c020:	28202c50 	ld.b	$r16,$r2,-2037(0x80b)
1c00c024:	2e312933 	0x2e312933
1c00c028:	202c5630 	ll.w	$r16,$r17,11348(0x2c54)
1c00c02c:	56293428 	bl	10627380(0xa22934) # 1ca2e960 <_sidata+0xa222b0>
1c00c030:	54554f52 	bl	-45591220(0xd48554c) # 1949157c <_start-0x2b6ea84>
1c00c034:	3528202c 	0x3528202c
1c00c038:	302e3129 	vldrepl.w	$vr9,$r9,-464(0xe30)
1c00c03c:	72762856 	0x72762856
1c00c040:	202c2931 	ll.w	$r17,$r9,11304(0x2c28)
1c00c044:	76293628 	0x76293628
1c00c048:	2c666572 	vst	$vr18,$r11,-1639(0x999)
1c00c04c:	29372820 	st.b	$r0,$r1,-566(0xdca)
1c00c050:	61636164 	blt	$r11,$r4,90976(0x16360) # 1c0223b0 <_sidata+0x15d00>
1c00c054:	0000636d 	rdtimel.w	$r13,$r27
1c00c058:	69640a0d 	bltu	$r16,$r13,91144(0x16408) # 1c022460 <_sidata+0x15db0>
1c00c05c:	30203a76 	vldrepl.w	$vr22,$r19,56(0x38)
1c00c060:	3264203a 	0x3264203a
1c00c064:	3a31202c 	0x3a31202c
1c00c068:	00346420 	0x00346420
1c00c06c:	61630a0d 	blt	$r16,$r13,90888(0x16308) # 1c022374 <_sidata+0x15cc4>
1c00c070:	6c75636c 	bgeu	$r27,$r12,30048(0x7560) # 1c0135d0 <_sidata+0x6f20>
1c00c074:	25657461 	stptr.w	$r1,$r3,25972(0x6574)
1c00c078:	00000064 	0x00000064
1c00c07c:	7375200a 	0x7375200a
1c00c080:	3a656761 	0x3a656761
1c00c084:	74616220 	xvabsd.w	$xr0,$xr17,$xr24
1c00c088:	20746564 	ll.w	$r4,$r11,29796(0x7464)
1c00c08c:	203e6e3c 	ll.w	$r28,$r17,15980(0x3e6c)
1c00c090:	44412030 	bnez	$r1,-4177632(0x404120) # 1bc101b0 <_start-0x3efe50>
1c00c094:	30495f43 	vldrepl.h	$vr3,$r26,1198(0x4ae)
1c00c098:	2031202c 	ll.w	$r12,$r1,12576(0x3120)
1c00c09c:	4f495047 	jirl	$r7,$r2,-46768(0x34950)
1c00c0a0:	32202c30 	xvldrepl.w	$xr16,$r1,44(0x2c)
1c00c0a4:	49504720 	0x49504720
1c00c0a8:	000a314f 	0x000a314f
1c00c0ac:	72770a0d 	0x72770a0d
1c00c0b0:	20676e6f 	ll.w	$r15,$r19,26476(0x676c)
1c00c0b4:	61726170 	blt	$r11,$r16,94816(0x17260) # 1c023314 <_sidata+0x16c64>
1c00c0b8:	6574656d 	bge	$r11,$r13,95332(0x17464) # 1c02351c <_sidata+0x16e6c>
1c00c0bc:	00000072 	0x00000072
1c00c0c0:	0000002e 	0x0000002e
1c00c0c4:	79706f63 	0x79706f63
1c00c0c8:	72726520 	0x72726520
1c00c0cc:	000a726f 	0x000a726f
1c00c0d0:	7375200a 	0x7375200a
1c00c0d4:	3a656761 	0x3a656761
1c00c0d8:	6e697520 	bgeu	$r9,$r0,-104076(0x26974) # 1bff2a4c <_start-0xd5b4>
1c00c0dc:	3c207469 	0x3c207469
1c00c0e0:	3e322f31 	0x3e322f31
1c00c0e4:	00000a20 	0x00000a20
1c00c0e8:	64690a0d 	bge	$r16,$r13,26888(0x6908) # 1c0129f0 <_sidata+0x6340>
1c00c0ec:	2578303d 	stptr.w	$r29,$r1,30768(0x7830)
1c00c0f0:	000a0d78 	0x000a0d78
1c00c0f4:	7375200a 	0x7375200a
1c00c0f8:	3a656761 	0x3a656761
1c00c0fc:	72777320 	0x72777320
1c00c100:	20657469 	ll.w	$r9,$r3,25972(0x6574)
1c00c104:	6464613c 	bge	$r9,$r28,25696(0x6460) # 1c012564 <_sidata+0x5eb4>
1c00c108:	0a203e72 	xvfmadd.d	$xr18,$xr19,$xr15,$xr0
1c00c10c:	00000000 	0x00000000
1c00c110:	7277200a 	0x7277200a
1c00c114:	20657469 	ll.w	$r9,$r3,25972(0x6574)
1c00c118:	72617473 	0x72617473
1c00c11c:	00000a74 	0x00000a74
1c00c120:	0000202e 	clo.d	$r14,$r1
1c00c124:	0000000a 	0x0000000a
1c00c128:	7375200a 	0x7375200a
1c00c12c:	3a656761 	0x3a656761
1c00c130:	65727320 	bge	$r25,$r0,94832(0x17270) # 1c0233a0 <_sidata+0x16cf0>
1c00c134:	3c206461 	0x3c206461
1c00c138:	72646461 	0x72646461
1c00c13c:	000a203e 	0x000a203e
1c00c140:	6572200a 	bge	$r0,$r10,94752(0x17220) # 1c023360 <_sidata+0x16cb0>
1c00c144:	73206461 	0x73206461
1c00c148:	74726174 	xvmin.b	$xr20,$xr11,$xr24
1c00c14c:	0000000a 	0x0000000a
1c00c150:	6568630a 	bge	$r24,$r10,92256(0x16860) # 1c0229b0 <_sidata+0x16300>
1c00c154:	65206b63 	bge	$r27,$r3,73832(0x12068) # 1c01e1bc <_sidata+0x11b0c>
1c00c158:	726f7272 	0x726f7272
1c00c15c:	61647220 	blt	$r17,$r0,91248(0x16470) # 1c0225cc <_sidata+0x15f1c>
1c00c160:	253d6174 	stptr.w	$r20,$r11,15712(0x3d60)
1c00c164:	61692078 	blt	$r3,$r24,92448(0x16920) # 1c022a84 <_sidata+0x163d4>
1c00c168:	3d726464 	0x3d726464
1c00c16c:	000a7825 	0x000a7825
1c00c170:	7375200a 	0x7375200a
1c00c174:	3a656761 	0x3a656761
1c00c178:	72657320 	0x72657320
1c00c17c:	20657361 	ll.w	$r1,$r27,25968(0x6570)
1c00c180:	6464613c 	bge	$r9,$r28,25696(0x6460) # 1c0125e0 <_sidata+0x5f30>
1c00c184:	0a203e72 	xvfmadd.d	$xr18,$xr19,$xr15,$xr0
1c00c188:	00000000 	0x00000000
1c00c18c:	7265200a 	0x7265200a
1c00c190:	20657361 	ll.w	$r1,$r27,25968(0x6570)
1c00c194:	72617473 	0x72617473
1c00c198:	00000a74 	0x00000a74
1c00c19c:	676f7270 	bge	$r19,$r16,-37008(0x36f70) # 1c00310c <Rtc_Read+0xc8>
1c00c1a0:	206d6172 	ll.w	$r18,$r11,28000(0x6d60)
1c00c1a4:	72617473 	0x72617473
1c00c1a8:	00000a74 	0x00000a74
1c00c1ac:	72700a0d 	0x72700a0d
1c00c1b0:	6172676f 	blt	$r27,$r15,94820(0x17264) # 1c023414 <_sidata+0x16d64>
1c00c1b4:	6f64206d 	bgeu	$r3,$r13,-39904(0x36420) # 1c0025d4 <soc_myprintf+0x1d4>
1c00c1b8:	000a656e 	0x000a656e
1c00c1bc:	68630a0d 	bltu	$r16,$r13,25352(0x6308) # 1c0124c4 <_sidata+0x5e14>
1c00c1c0:	6f6b6365 	bgeu	$r27,$r5,-38048(0x36b60) # 1c002d20 <Set_Player1_direction+0xc>
1c00c1c4:	73207475 	0x73207475
1c00c1c8:	74726174 	xvmin.b	$xr20,$xr11,$xr24
1c00c1cc:	0000000a 	0x0000000a
1c00c1d0:	68630a0d 	bltu	$r16,$r13,25352(0x6308) # 1c0124d8 <_sidata+0x5e28>
1c00c1d4:	206b6365 	ll.w	$r5,$r27,27488(0x6b60)
1c00c1d8:	656e6f64 	bge	$r27,$r4,93804(0x16e6c) # 1c023044 <_sidata+0x16994>
1c00c1dc:	0000000a 	0x0000000a
1c00c1e0:	6f630a0d 	bgeu	$r16,$r13,-40184(0x36308) # 1c0024e8 <soc_myprintf+0xe8>
1c00c1e4:	72697970 	0x72697970
1c00c1e8:	73206d61 	0x73206d61
1c00c1ec:	74726174 	xvmin.b	$xr20,$xr11,$xr24
1c00c1f0:	00000a0d 	0x00000a0d
1c00c1f4:	79706f63 	0x79706f63
1c00c1f8:	72726520 	0x72726520
1c00c1fc:	2520726f 	stptr.w	$r15,$r19,8304(0x2070)
1c00c200:	78252c78 	0x78252c78
1c00c204:	0a78252c 	0x0a78252c
1c00c208:	00000000 	0x00000000
1c00c20c:	3c200a0d 	0x3c200a0d
1c00c210:	696c2020 	bltu	$r1,$r0,93216(0x16c20) # 1c022e30 <_sidata+0x16780>
1c00c214:	203a656e 	ll.w	$r14,$r11,14948(0x3a64)
1c00c218:	66206425 	bge	$r1,$r5,-122780(0x22064) # 1bfee27c <_start-0x11d84>
1c00c21c:	3a636e75 	0x3a636e75
1c00c220:	20207325 	ll.w	$r5,$r25,8304(0x2070)
1c00c224:	0a0d3e20 	0x0a0d3e20
1c00c228:	00000000 	0x00000000
1c00c22c:	2e2e2e0a 	0x2e2e2e0a
1c00c230:	2e2e2e2e 	0x2e2e2e2e
1c00c234:	2e2e2e2e 	0x2e2e2e2e
1c00c238:	4f532e2e 	jirl	$r14,$r17,-44244(0x3532c)
1c00c23c:	495f5446 	bceqz	$fcc2,1662804(0x195f54) # 1c1a2190 <_sidata+0x195ae0>
1c00c240:	2e2e544e 	0x2e2e544e
1c00c244:	2e2e2e2e 	0x2e2e2e2e
1c00c248:	2e2e2e2e 	0x2e2e2e2e
1c00c24c:	2e2e2e2e 	0x2e2e2e2e
1c00c250:	00000d0a 	0x00000d0a
1c00c254:	2d2d2d0a 	0x2d2d2d0a
1c00c258:	63756f74 	blt	$r27,$r20,-35476(0x3756c) # 1c0037c4 <PS2_ReadData+0x88>
1c00c25c:	746e4968 	0x746e4968
1c00c260:	79654b3a 	0x79654b3a
1c00c264:	6e616843 	bgeu	$r2,$r3,-106136(0x26168) # 1bff23cc <_start-0xdc34>
1c00c268:	3a6c656e 	0x3a6c656e
1c00c26c:	78257830 	0x78257830
1c00c270:	0000000a 	0x0000000a
1c00c274:	2e2e2e0a 	0x2e2e2e0a
1c00c278:	2e2e2e2e 	0x2e2e2e2e
1c00c27c:	2e2e2e2e 	0x2e2e2e2e
1c00c280:	41422e2e 	beqz	$r17,3752492(0x39422c) # 1c3a04ac <_sidata+0x393dfc>
1c00c284:	41465f54 	beqz	$r26,-3062180(0x51465c) # 1bd208e0 <_start-0x2df720>
1c00c288:	2e2e4c49 	0x2e2e4c49
1c00c28c:	2e2e2e2e 	0x2e2e2e2e
1c00c290:	2e2e2e2e 	0x2e2e2e2e
1c00c294:	2e2e2e2e 	0x2e2e2e2e
1c00c298:	00000d0a 	0x00000d0a
1c00c29c:	2e2e2e0a 	0x2e2e2e0a
1c00c2a0:	2e2e2e2e 	0x2e2e2e2e
1c00c2a4:	2e2e2e2e 	0x2e2e2e2e
1c00c2a8:	44412e2e 	bnez	$r17,3686700(0x38412c) # 1c3903d4 <_sidata+0x383d24>
1c00c2ac:	2e2e2e43 	0x2e2e2e43
1c00c2b0:	2e2e2e2e 	0x2e2e2e2e
1c00c2b4:	2e2e2e2e 	0x2e2e2e2e
1c00c2b8:	0a2e2e2e 	xvfmadd.d	$xr14,$xr17,$xr11,$xr28
1c00c2bc:	0000000d 	0x0000000d
1c00c2c0:	65726f43 	bge	$r26,$r3,94828(0x1726c) # 1c02352c <_sidata+0x16e7c>
1c00c2c4:	6d695420 	bgeu	$r1,$r0,92500(0x16954) # 1c022c18 <_sidata+0x16568>
1c00c2c8:	63207265 	blt	$r19,$r5,-57232(0x32070) # 1bffe338 <_start-0x1cc8>
1c00c2cc:	7261656c 	0x7261656c
1c00c2d0:	746e6920 	0x746e6920
1c00c2d4:	75727265 	0x75727265
1c00c2d8:	2e2e7470 	0x2e2e7470
1c00c2dc:	0000000a 	0x0000000a

1c00c2e0 <Ext_IrqHandle>:
1c00c2e0:	1c009b78 	pcaddu12i	$r24,1243(0x4db)
1c00c2e4:	1c009bc4 	pcaddu12i	$r4,1246(0x4de)
1c00c2e8:	1c009c10 	pcaddu12i	$r16,1248(0x4e0)
1c00c2ec:	1c009c5c 	pcaddu12i	$r28,1250(0x4e2)
1c00c2f0:	1c009ca8 	pcaddu12i	$r8,1253(0x4e5)
1c00c2f4:	1c009cf4 	pcaddu12i	$r20,1255(0x4e7)
1c00c2f8:	1c009d40 	pcaddu12i	$r0,1258(0x4ea)
1c00c2fc:	1c009d8c 	pcaddu12i	$r12,1260(0x4ec)
1c00c300:	1c009dd8 	pcaddu12i	$r24,1262(0x4ee)
1c00c304:	1c009e24 	pcaddu12i	$r4,1265(0x4f1)
1c00c308:	1c009e70 	pcaddu12i	$r16,1267(0x4f3)
1c00c30c:	1c009ebc 	pcaddu12i	$r28,1269(0x4f5)
1c00c310:	1c009f08 	pcaddu12i	$r8,1272(0x4f8)
1c00c314:	1c009f54 	pcaddu12i	$r20,1274(0x4fa)
1c00c318:	1c009fa0 	pcaddu12i	$r0,1277(0x4fd)
1c00c31c:	1c009fec 	pcaddu12i	$r12,1279(0x4ff)
1c00c320:	1c00a038 	pcaddu12i	$r24,1281(0x501)
1c00c324:	1c00a084 	pcaddu12i	$r4,1284(0x504)
1c00c328:	1c00a0d0 	pcaddu12i	$r16,1286(0x506)
1c00c32c:	1c00a11c 	pcaddu12i	$r28,1288(0x508)
1c00c330:	1c00a168 	pcaddu12i	$r8,1291(0x50b)
1c00c334:	1c00a1b4 	pcaddu12i	$r20,1293(0x50d)
1c00c338:	1c00a200 	pcaddu12i	$r0,1296(0x510)
1c00c33c:	1c00a24c 	pcaddu12i	$r12,1298(0x512)
1c00c340:	1c00a298 	pcaddu12i	$r24,1300(0x514)
1c00c344:	1c00a2e4 	pcaddu12i	$r4,1303(0x517)
1c00c348:	1c00a330 	pcaddu12i	$r16,1305(0x519)
1c00c34c:	1c00a37c 	pcaddu12i	$r28,1307(0x51b)
1c00c350:	1c00a3c8 	pcaddu12i	$r8,1310(0x51e)
1c00c354:	1c00a414 	pcaddu12i	$r20,1312(0x520)
1c00c358:	1c00a460 	pcaddu12i	$r0,1315(0x523)
1c00c35c:	1c00a4ac 	pcaddu12i	$r12,1317(0x525)
1c00c360:	1c00a798 	pcaddu12i	$r24,1340(0x53c)
1c00c364:	1c00a748 	pcaddu12i	$r8,1338(0x53a)
1c00c368:	1c00a798 	pcaddu12i	$r24,1340(0x53c)
1c00c36c:	1c00a798 	pcaddu12i	$r24,1340(0x53c)
1c00c370:	1c00a798 	pcaddu12i	$r24,1340(0x53c)
1c00c374:	1c00a798 	pcaddu12i	$r24,1340(0x53c)
1c00c378:	1c00a798 	pcaddu12i	$r24,1340(0x53c)
1c00c37c:	1c00a798 	pcaddu12i	$r24,1340(0x53c)
1c00c380:	1c00a798 	pcaddu12i	$r24,1340(0x53c)
1c00c384:	1c00a798 	pcaddu12i	$r24,1340(0x53c)
1c00c388:	1c00a798 	pcaddu12i	$r24,1340(0x53c)
1c00c38c:	1c00a798 	pcaddu12i	$r24,1340(0x53c)
1c00c390:	1c00a798 	pcaddu12i	$r24,1340(0x53c)
1c00c394:	1c00a798 	pcaddu12i	$r24,1340(0x53c)
1c00c398:	1c00a798 	pcaddu12i	$r24,1340(0x53c)
1c00c39c:	1c00a798 	pcaddu12i	$r24,1340(0x53c)
1c00c3a0:	1c00a764 	pcaddu12i	$r4,1339(0x53b)

1c00c3a4 <__FUNCTION__.1694>:
1c00c3a4:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c02381c <_sidata+0x1716c>
1c00c3a8:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c02340c <_sidata+0x16d5c>
1c00c3ac:	5f30616f 	bne	$r11,$r15,-53152(0x33060) # 1bfff40c <_start-0xbf4>
1c00c3b0:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c003520 <gpio_read+0x48>
1c00c3b4:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c013214 <_sidata+0x6b64>
1c00c3b8:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c3bc <__FUNCTION__.1698>:
1c00c3bc:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c023834 <_sidata+0x17184>
1c00c3c0:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c023424 <_sidata+0x16d74>
1c00c3c4:	5f31616f 	bne	$r11,$r15,-52896(0x33160) # 1bfff524 <_start-0xadc>
1c00c3c8:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c003538 <gpio_read+0x60>
1c00c3cc:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c01322c <_sidata+0x6b7c>
1c00c3d0:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c3d4 <__FUNCTION__.1702>:
1c00c3d4:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c02384c <_sidata+0x1719c>
1c00c3d8:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c02343c <_sidata+0x16d8c>
1c00c3dc:	5f32616f 	bne	$r11,$r15,-52640(0x33260) # 1bfff63c <_start-0x9c4>
1c00c3e0:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c003550 <gpio_read+0x78>
1c00c3e4:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c013244 <_sidata+0x6b94>
1c00c3e8:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c3ec <__FUNCTION__.1706>:
1c00c3ec:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c023864 <_sidata+0x171b4>
1c00c3f0:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c023454 <_sidata+0x16da4>
1c00c3f4:	5f33616f 	bne	$r11,$r15,-52384(0x33360) # 1bfff754 <_start-0x8ac>
1c00c3f8:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c003568 <gpio_read+0x90>
1c00c3fc:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c01325c <_sidata+0x6bac>
1c00c400:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c404 <__FUNCTION__.1710>:
1c00c404:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c02387c <_sidata+0x171cc>
1c00c408:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c02346c <_sidata+0x16dbc>
1c00c40c:	5f34616f 	bne	$r11,$r15,-52128(0x33460) # 1bfff86c <_start-0x794>
1c00c410:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c003580 <gpio_read+0xa8>
1c00c414:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c013274 <_sidata+0x6bc4>
1c00c418:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c41c <__FUNCTION__.1714>:
1c00c41c:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c023894 <_sidata+0x171e4>
1c00c420:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c023484 <_sidata+0x16dd4>
1c00c424:	5f35616f 	bne	$r11,$r15,-51872(0x33560) # 1bfff984 <_start-0x67c>
1c00c428:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c003598 <PS2_Init+0x14>
1c00c42c:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c01328c <_sidata+0x6bdc>
1c00c430:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c434 <__FUNCTION__.1718>:
1c00c434:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c0238ac <_sidata+0x171fc>
1c00c438:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c02349c <_sidata+0x16dec>
1c00c43c:	5f36616f 	bne	$r11,$r15,-51616(0x33660) # 1bfffa9c <_start-0x564>
1c00c440:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c0035b0 <PS2_Init+0x2c>
1c00c444:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c0132a4 <_sidata+0x6bf4>
1c00c448:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c44c <__FUNCTION__.1722>:
1c00c44c:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c0238c4 <_sidata+0x17214>
1c00c450:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c0234b4 <_sidata+0x16e04>
1c00c454:	5f37616f 	bne	$r11,$r15,-51360(0x33760) # 1bfffbb4 <_start-0x44c>
1c00c458:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c0035c8 <PS2_Init+0x44>
1c00c45c:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c0132bc <_sidata+0x6c0c>
1c00c460:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c464 <__FUNCTION__.1726>:
1c00c464:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c0238dc <_sidata+0x1722c>
1c00c468:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c0234cc <_sidata+0x16e1c>
1c00c46c:	5f30626f 	bne	$r19,$r15,-53152(0x33060) # 1bfff4cc <_start-0xb34>
1c00c470:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c0035e0 <PS2_Cmd+0x8>
1c00c474:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c0132d4 <_sidata+0x6c24>
1c00c478:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c47c <__FUNCTION__.1730>:
1c00c47c:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c0238f4 <_sidata+0x17244>
1c00c480:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c0234e4 <_sidata+0x16e34>
1c00c484:	5f31626f 	bne	$r19,$r15,-52896(0x33160) # 1bfff5e4 <_start-0xa1c>
1c00c488:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c0035f8 <PS2_Cmd+0x20>
1c00c48c:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c0132ec <_sidata+0x6c3c>
1c00c490:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c494 <__FUNCTION__.1734>:
1c00c494:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c02390c <_sidata+0x1725c>
1c00c498:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c0234fc <_sidata+0x16e4c>
1c00c49c:	5f32626f 	bne	$r19,$r15,-52640(0x33260) # 1bfff6fc <_start-0x904>
1c00c4a0:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c003610 <PS2_Cmd+0x38>
1c00c4a4:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c013304 <_sidata+0x6c54>
1c00c4a8:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c4ac <__FUNCTION__.1738>:
1c00c4ac:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c023924 <_sidata+0x17274>
1c00c4b0:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c023514 <_sidata+0x16e64>
1c00c4b4:	5f33626f 	bne	$r19,$r15,-52384(0x33360) # 1bfff814 <_start-0x7ec>
1c00c4b8:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c003628 <PS2_Cmd+0x50>
1c00c4bc:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c01331c <_sidata+0x6c6c>
1c00c4c0:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c4c4 <__FUNCTION__.1742>:
1c00c4c4:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c02393c <_sidata+0x1728c>
1c00c4c8:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c02352c <_sidata+0x16e7c>
1c00c4cc:	5f34626f 	bne	$r19,$r15,-52128(0x33460) # 1bfff92c <_start-0x6d4>
1c00c4d0:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c003640 <PS2_Cmd+0x68>
1c00c4d4:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c013334 <_sidata+0x6c84>
1c00c4d8:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c4dc <__FUNCTION__.1746>:
1c00c4dc:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c023954 <_sidata+0x172a4>
1c00c4e0:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c023544 <_sidata+0x16e94>
1c00c4e4:	5f35626f 	bne	$r19,$r15,-51872(0x33560) # 1bfffa44 <_start-0x5bc>
1c00c4e8:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c003658 <PS2_Cmd+0x80>
1c00c4ec:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c01334c <_sidata+0x6c9c>
1c00c4f0:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c4f4 <__FUNCTION__.1750>:
1c00c4f4:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c02396c <_sidata+0x172bc>
1c00c4f8:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c02355c <_sidata+0x16eac>
1c00c4fc:	5f36626f 	bne	$r19,$r15,-51616(0x33660) # 1bfffb5c <_start-0x4a4>
1c00c500:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c003670 <PS2_Cmd+0x98>
1c00c504:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c013364 <_sidata+0x6cb4>
1c00c508:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c50c <__FUNCTION__.1754>:
1c00c50c:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c023984 <_sidata+0x172d4>
1c00c510:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c023574 <_sidata+0x16ec4>
1c00c514:	5f37626f 	bne	$r19,$r15,-51360(0x33760) # 1bfffc74 <_start-0x38c>
1c00c518:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c003688 <PS2_Cmd+0xb0>
1c00c51c:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c01337c <_sidata+0x6ccc>
1c00c520:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c524 <__FUNCTION__.1758>:
1c00c524:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c02399c <_sidata+0x172ec>
1c00c528:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c02358c <_sidata+0x16edc>
1c00c52c:	5f30636f 	bne	$r27,$r15,-53152(0x33060) # 1bfff58c <_start-0xa74>
1c00c530:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c0036a0 <PS2_Cmd+0xc8>
1c00c534:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c013394 <_sidata+0x6ce4>
1c00c538:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c53c <__FUNCTION__.1762>:
1c00c53c:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c0239b4 <_sidata+0x17304>
1c00c540:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c0235a4 <_sidata+0x16ef4>
1c00c544:	5f31636f 	bne	$r27,$r15,-52896(0x33160) # 1bfff6a4 <_start-0x95c>
1c00c548:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c0036b8 <PS2_Cmd+0xe0>
1c00c54c:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c0133ac <_sidata+0x6cfc>
1c00c550:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c554 <__FUNCTION__.1766>:
1c00c554:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c0239cc <_sidata+0x1731c>
1c00c558:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c0235bc <_sidata+0x16f0c>
1c00c55c:	5f32636f 	bne	$r27,$r15,-52640(0x33260) # 1bfff7bc <_start-0x844>
1c00c560:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c0036d0 <PS2_Cmd+0xf8>
1c00c564:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c0133c4 <_sidata+0x6d14>
1c00c568:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c56c <__FUNCTION__.1770>:
1c00c56c:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c0239e4 <_sidata+0x17334>
1c00c570:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c0235d4 <_sidata+0x16f24>
1c00c574:	5f33636f 	bne	$r27,$r15,-52384(0x33360) # 1bfff8d4 <_start-0x72c>
1c00c578:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c0036e8 <PS2_Cmd+0x110>
1c00c57c:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c0133dc <_sidata+0x6d2c>
1c00c580:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c584 <__FUNCTION__.1774>:
1c00c584:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c0239fc <_sidata+0x1734c>
1c00c588:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c0235ec <_sidata+0x16f3c>
1c00c58c:	5f34636f 	bne	$r27,$r15,-52128(0x33460) # 1bfff9ec <_start-0x614>
1c00c590:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c003700 <PS2_Cmd+0x128>
1c00c594:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c0133f4 <_sidata+0x6d44>
1c00c598:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c59c <__FUNCTION__.1778>:
1c00c59c:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c023a14 <_sidata+0x17364>
1c00c5a0:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c023604 <_sidata+0x16f54>
1c00c5a4:	5f35636f 	bne	$r27,$r15,-51872(0x33560) # 1bfffb04 <_start-0x4fc>
1c00c5a8:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c003718 <PS2_Cmd+0x140>
1c00c5ac:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c01340c <_sidata+0x6d5c>
1c00c5b0:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c5b4 <__FUNCTION__.1782>:
1c00c5b4:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c023a2c <_sidata+0x1737c>
1c00c5b8:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c02361c <_sidata+0x16f6c>
1c00c5bc:	5f36636f 	bne	$r27,$r15,-51616(0x33660) # 1bfffc1c <_start-0x3e4>
1c00c5c0:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c003730 <PS2_Cmd+0x158>
1c00c5c4:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c013424 <_sidata+0x6d74>
1c00c5c8:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c5cc <__FUNCTION__.1786>:
1c00c5cc:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c023a44 <_sidata+0x17394>
1c00c5d0:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c023634 <_sidata+0x16f84>
1c00c5d4:	5f37636f 	bne	$r27,$r15,-51360(0x33760) # 1bfffd34 <_start-0x2cc>
1c00c5d8:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c003748 <PS2_ReadData+0xc>
1c00c5dc:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c01343c <_sidata+0x6d8c>
1c00c5e0:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c5e4 <__FUNCTION__.1790>:
1c00c5e4:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c023a5c <_sidata+0x173ac>
1c00c5e8:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c02364c <_sidata+0x16f9c>
1c00c5ec:	5f30646f 	bne	$r3,$r15,-53148(0x33064) # 1bfff650 <_start-0x9b0>
1c00c5f0:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c003760 <PS2_ReadData+0x24>
1c00c5f4:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c013454 <_sidata+0x6da4>
1c00c5f8:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c5fc <__FUNCTION__.1794>:
1c00c5fc:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c023a74 <_sidata+0x173c4>
1c00c600:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c023664 <_sidata+0x16fb4>
1c00c604:	5f31646f 	bne	$r3,$r15,-52892(0x33164) # 1bfff768 <_start-0x898>
1c00c608:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c003778 <PS2_ReadData+0x3c>
1c00c60c:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c01346c <_sidata+0x6dbc>
1c00c610:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c614 <__FUNCTION__.1798>:
1c00c614:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c023a8c <_sidata+0x173dc>
1c00c618:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c02367c <_sidata+0x16fcc>
1c00c61c:	5f32646f 	bne	$r3,$r15,-52636(0x33264) # 1bfff880 <_start-0x780>
1c00c620:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c003790 <PS2_ReadData+0x54>
1c00c624:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c013484 <_sidata+0x6dd4>
1c00c628:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c62c <__FUNCTION__.1802>:
1c00c62c:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c023aa4 <_sidata+0x173f4>
1c00c630:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c023694 <_sidata+0x16fe4>
1c00c634:	5f33646f 	bne	$r3,$r15,-52380(0x33364) # 1bfff998 <_start-0x668>
1c00c638:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c0037a8 <PS2_ReadData+0x6c>
1c00c63c:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c01349c <_sidata+0x6dec>
1c00c640:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c644 <__FUNCTION__.1806>:
1c00c644:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c023abc <_sidata+0x1740c>
1c00c648:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c0236ac <_sidata+0x16ffc>
1c00c64c:	5f34646f 	bne	$r3,$r15,-52124(0x33464) # 1bfffab0 <_start-0x550>
1c00c650:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c0037c0 <PS2_ReadData+0x84>
1c00c654:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c0134b4 <_sidata+0x6e04>
1c00c658:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c65c <__FUNCTION__.1810>:
1c00c65c:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c023ad4 <_sidata+0x17424>
1c00c660:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c0236c4 <_sidata+0x17014>
1c00c664:	5f35646f 	bne	$r3,$r15,-51868(0x33564) # 1bfffbc8 <_start-0x438>
1c00c668:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c0037d8 <PS2_ReadData+0x9c>
1c00c66c:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c0134cc <_sidata+0x6e1c>
1c00c670:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c674 <__FUNCTION__.1814>:
1c00c674:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c023aec <_sidata+0x1743c>
1c00c678:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c0236dc <_sidata+0x1702c>
1c00c67c:	5f36646f 	bne	$r3,$r15,-51612(0x33664) # 1bfffce0 <_start-0x320>
1c00c680:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c0037f0 <PS2_ReadData+0xb4>
1c00c684:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c0134e4 <_sidata+0x6e34>
1c00c688:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c68c <__FUNCTION__.1818>:
1c00c68c:	69747865 	bltu	$r3,$r5,95352(0x17478) # 1c023b04 <_sidata+0x17454>
1c00c690:	6970675f 	bltu	$r26,$r31,94308(0x17064) # 1c0236f4 <_sidata+0x17044>
1c00c694:	5f37646f 	bne	$r3,$r15,-51356(0x33764) # 1bfffdf8 <_start-0x208>
1c00c698:	5f717269 	bne	$r19,$r9,-36496(0x37170) # 1c003808 <PS2_ReadData+0xcc>
1c00c69c:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c0134fc <_sidata+0x6e4c>
1c00c6a0:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

1c00c6a4 <__FUNCTION__.1827>:
1c00c6a4:	5f747865 	bne	$r3,$r5,-35720(0x37478) # 1c003b1c <PS2_EnterConfing+0x64>
1c00c6a8:	646e6168 	bge	$r11,$r8,28256(0x6e60) # 1c013508 <_sidata+0x6e58>
1c00c6ac:	0072656c 	bstrins.w	$r12,$r11,0x12,0x19

Disassembly of section .data:

80001000 <_sdata>:
_sdata():
80001000:	00000000 	0x00000000
80001004:	1c00af49 	pcaddu12i	$r9,1402(0x57a)
80001008:	80000118 	0x80000118
8000100c:	80000114 	0x80000114
80001010:	800001a8 	0x800001a8
80001014:	800001a4 	0x800001a4
80001018:	80000164 	0x80000164
8000101c:	8000015c 	0x8000015c
80001020:	800000fc 	0x800000fc
80001024:	800011c8 	0x800011c8
80001028:	8000010c 	0x8000010c
8000102c:	8000016c 	0x8000016c
80001030:	800001e4 	0x800001e4
80001034:	80000184 	0x80000184
80001038:	80000188 	0x80000188
8000103c:	80000144 	0x80000144
80001040:	800001d4 	0x800001d4
80001044:	800001c8 	0x800001c8
80001048:	80000154 	0x80000154
8000104c:	80000138 	0x80000138
80001050:	800001e8 	0x800001e8
80001054:	800011b8 	0x800011b8
80001058:	800001fc 	0x800001fc
8000105c:	80000104 	0x80000104
80001060:	800000f0 	0x800000f0
80001064:	80000108 	0x80000108
80001068:	800001b0 	0x800001b0
8000106c:	800000d0 	0x800000d0
80001070:	80000124 	0x80000124
80001074:	80000204 	0x80000204
80001078:	800001f8 	0x800001f8
8000107c:	800001b8 	0x800001b8
80001080:	80000178 	0x80000178
80001084:	800001dc 	0x800001dc
80001088:	80000084 	0x80000084
8000108c:	80000148 	0x80000148
80001090:	8000017c 	0x8000017c
80001094:	800000d4 	0x800000d4
80001098:	80000150 	0x80000150
8000109c:	800011c0 	0x800011c0
800010a0:	800001cc 	0x800001cc
800010a4:	8000011c 	0x8000011c
800010a8:	80000100 	0x80000100
800010ac:	80000170 	0x80000170
800010b0:	800001a0 	0x800001a0
800010b4:	800001e0 	0x800001e0
800010b8:	800000ec 	0x800000ec
800010bc:	80000194 	0x80000194
800010c0:	80000200 	0x80000200
800010c4:	800001c0 	0x800001c0
800010c8:	800000d8 	0x800000d8
800010cc:	80000000 	0x80000000
800010d0:	80000158 	0x80000158
800010d4:	80000134 	0x80000134
800010d8:	80000130 	0x80000130
800010dc:	80000198 	0x80000198
800010e0:	800001d0 	0x800001d0
800010e4:	800001ec 	0x800001ec
800010e8:	800011b4 	0x800011b4
800010ec:	800001c4 	0x800001c4
800010f0:	80000110 	0x80000110
800010f4:	8000014c 	0x8000014c
800010f8:	800011bc 	0x800011bc
800010fc:	800000dc 	0x800000dc
80001100:	80000128 	0x80000128
80001104:	800001d8 	0x800001d8
80001108:	80000140 	0x80000140
8000110c:	80000190 	0x80000190
80001110:	800000cc 	0x800000cc
80001114:	800000e8 	0x800000e8
80001118:	800000f8 	0x800000f8
8000111c:	80000160 	0x80000160
80001120:	8000012c 	0x8000012c
80001124:	80000174 	0x80000174
80001128:	80000168 	0x80000168
8000112c:	800001f0 	0x800001f0
80001130:	800000e4 	0x800000e4
80001134:	800000f4 	0x800000f4
80001138:	800011c4 	0x800011c4
8000113c:	80000180 	0x80000180
80001140:	8000018c 	0x8000018c
80001144:	80000120 	0x80000120
80001148:	1c00af40 	pcaddu12i	$r0,1402(0x57a)
8000114c:	800001ac 	0x800001ac
80001150:	800001bc 	0x800001bc
80001154:	8000019c 	0x8000019c
80001158:	800000e0 	0x800000e0
8000115c:	800001b4 	0x800001b4
80001160:	800011b0 	0x800011b0
80001164:	8000013c 	0x8000013c

80001168 <Comd>:
80001168:	00000001 	0x00000001
8000116c:	00000042 	0x00000042

80001170 <MASK>:
80001170:	00000001 	0x00000001
80001174:	00000002 	0x00000002
80001178:	00000003 	0x00000003
8000117c:	00000004 	0x00000004
80001180:	00000005 	0x00000005
80001184:	00000006 	0x00000006
80001188:	00000007 	0x00000007
8000118c:	00000008 	0x00000008
80001190:	00000009 	0x00000009
80001194:	0000000a 	0x0000000a
80001198:	0000000b 	0x0000000b
8000119c:	0000000c 	0x0000000c
800011a0:	0000000d 	0x0000000d
800011a4:	0000000e 	0x0000000e
800011a8:	0000000f 	0x0000000f
800011ac:	00000010 	0x00000010

800011b0 <blood_1>:
800011b0:	00000064 	0x00000064

800011b4 <blood_2>:
800011b4:	00000064 	0x00000064

800011b8 <player1_x>:
800011b8:	00000032 	0x00000032

800011bc <player1_y>:
800011bc:	000000f0 	0x000000f0

800011c0 <player2_x>:
800011c0:	000001c2 	0x000001c2

800011c4 <player2_y>:
800011c4:	000000f0 	0x000000f0

800011c8 <player1_direction>:
800011c8:	00000001 	0x00000001

Disassembly of section .bss:

80000000 <Handkey>:
_sbss():
80000000:	00000000 	0x00000000

80000004 <exti_irq_handle>:
	...

80000084 <game_key>:
80000084:	00000000 	0x00000000

Disassembly of section .bss.Data:

80000088 <Data>:
	...

Disassembly of section .bss.g_recv_flag:

800000ac <g_recv_flag>:
800000ac:	00000000 	0x00000000

Disassembly of section .bss.g_recvBuff:

800000b0 <g_recvBuff>:
	...

Disassembly of section .bss.timer_test:

800000c4 <timer_test>:
800000c4:	00000000 	0x00000000

Disassembly of section .bss.xx:

800000c8 <xx>:
800000c8:	00000000 	0x00000000

Disassembly of section .bss.t1:

800000cc <t1>:
800000cc:	00000000 	0x00000000

Disassembly of section .bss.t2:

800000d0 <t2>:
800000d0:	00000000 	0x00000000

Disassembly of section .bss.energy_1:

800000d4 <energy_1>:
800000d4:	00000000 	0x00000000

Disassembly of section .bss.energy_2:

800000d8 <energy_2>:
800000d8:	00000000 	0x00000000

Disassembly of section .bss.energy_count_1:

800000dc <energy_count_1>:
800000dc:	00000000 	0x00000000

Disassembly of section .bss.energy_count_2:

800000e0 <energy_count_2>:
800000e0:	00000000 	0x00000000

Disassembly of section .bss.prop1_y:

800000e4 <prop1_y>:
800000e4:	00000000 	0x00000000

Disassembly of section .bss.prop2_x:

800000e8 <prop2_x>:
800000e8:	00000000 	0x00000000

Disassembly of section .bss.prop2_y:

800000ec <prop2_y>:
800000ec:	00000000 	0x00000000

Disassembly of section .bss.player2_direction:

800000f0 <player2_direction>:
800000f0:	00000000 	0x00000000

Disassembly of section .bss.attack_distance1:

800000f4 <attack_distance1>:
800000f4:	00000000 	0x00000000

Disassembly of section .bss.attack_distance2:

800000f8 <attack_distance2>:
800000f8:	00000000 	0x00000000

Disassembly of section .bss.directionleftflag_player1:

800000fc <directionleftflag_player1>:
800000fc:	00000000 	0x00000000

Disassembly of section .bss.directionrightflag_player1:

80000100 <directionrightflag_player1>:
80000100:	00000000 	0x00000000

Disassembly of section .bss.directionleftflag_player2:

80000104 <directionleftflag_player2>:
80000104:	00000000 	0x00000000

Disassembly of section .bss.directionrightflag_player2:

80000108 <directionrightflag_player2>:
80000108:	00000000 	0x00000000

Disassembly of section .bss.bloodflag_player1:

8000010c <bloodflag_player1>:
8000010c:	00000000 	0x00000000

Disassembly of section .bss.bloodflag_player2:

80000110 <bloodflag_player2>:
80000110:	00000000 	0x00000000

Disassembly of section .bss.energyflag_player1:

80000114 <energyflag_player1>:
80000114:	00000000 	0x00000000

Disassembly of section .bss.energyflag_player2:

80000118 <energyflag_player2>:
80000118:	00000000 	0x00000000

Disassembly of section .bss.moveflag_player1:

8000011c <moveflag_player1>:
8000011c:	00000000 	0x00000000

Disassembly of section .bss.moveflag_player2:

80000120 <moveflag_player2>:
80000120:	00000000 	0x00000000

Disassembly of section .bss.defendflag_player1:

80000124 <defendflag_player1>:
80000124:	00000000 	0x00000000

Disassembly of section .bss.defendflag_player2:

80000128 <defendflag_player2>:
80000128:	00000000 	0x00000000

Disassembly of section .bss.jumpflag_player1:

8000012c <jumpflag_player1>:
8000012c:	00000000 	0x00000000

Disassembly of section .bss.jumpflag_player2:

80000130 <jumpflag_player2>:
80000130:	00000000 	0x00000000

Disassembly of section .bss.lightpunchflag_player1:

80000134 <lightpunchflag_player1>:
80000134:	00000000 	0x00000000

Disassembly of section .bss.lightpunchflag_player2:

80000138 <lightpunchflag_player2>:
80000138:	00000000 	0x00000000

Disassembly of section .bss.heavypunchflag_player1:

8000013c <heavypunchflag_player1>:
8000013c:	00000000 	0x00000000

Disassembly of section .bss.heavypunchflag_player2:

80000140 <heavypunchflag_player2>:
80000140:	00000000 	0x00000000

Disassembly of section .bss.lightkickflag_player1:

80000144 <lightkickflag_player1>:
80000144:	00000000 	0x00000000

Disassembly of section .bss.lightkickflag_player2:

80000148 <lightkickflag_player2>:
80000148:	00000000 	0x00000000

Disassembly of section .bss.heavykickflag_player1:

8000014c <heavykickflag_player1>:
8000014c:	00000000 	0x00000000

Disassembly of section .bss.heavykickflag_player2:

80000150 <heavykickflag_player2>:
80000150:	00000000 	0x00000000

Disassembly of section .bss.jinengflag_player1:

80000154 <jinengflag_player1>:
80000154:	00000000 	0x00000000

Disassembly of section .bss.jinengflag_player2:

80000158 <jinengflag_player2>:
80000158:	00000000 	0x00000000

Disassembly of section .bss.busyflag_player1:

8000015c <busyflag_player1>:
8000015c:	00000000 	0x00000000

Disassembly of section .bss.busyflag_player2:

80000160 <busyflag_player2>:
80000160:	00000000 	0x00000000

Disassembly of section .bss.pressflag1:

80000164 <pressflag1>:
80000164:	00000000 	0x00000000

Disassembly of section .bss.pressflag2:

80000168 <pressflag2>:
80000168:	00000000 	0x00000000

Disassembly of section .bss.pressflag3:

8000016c <pressflag3>:
8000016c:	00000000 	0x00000000

Disassembly of section .bss.pressflag4:

80000170 <pressflag4>:
80000170:	00000000 	0x00000000

Disassembly of section .bss.pressflag5:

80000174 <pressflag5>:
80000174:	00000000 	0x00000000

Disassembly of section .bss.pressflag6:

80000178 <pressflag6>:
80000178:	00000000 	0x00000000

Disassembly of section .bss.pressflag7:

8000017c <pressflag7>:
8000017c:	00000000 	0x00000000

Disassembly of section .bss.pressflag8:

80000180 <pressflag8>:
80000180:	00000000 	0x00000000

Disassembly of section .bss.data1:

80000184 <data1>:
80000184:	00000000 	0x00000000

Disassembly of section .bss.data2:

80000188 <data2>:
80000188:	00000000 	0x00000000

Disassembly of section .bss.kouxueflag_player1:

8000018c <kouxueflag_player1>:
8000018c:	00000000 	0x00000000

Disassembly of section .bss.kouxueflag_player2:

80000190 <kouxueflag_player2>:
80000190:	00000000 	0x00000000

Disassembly of section .bss.audioflag_player1:

80000194 <audioflag_player1>:
80000194:	00000000 	0x00000000

Disassembly of section .bss.audioflag_player2:

80000198 <audioflag_player2>:
80000198:	00000000 	0x00000000

Disassembly of section .bss.moveenable_player1:

8000019c <moveenable_player1>:
8000019c:	00000000 	0x00000000

Disassembly of section .bss.moveenable_player2:

800001a0 <moveenable_player2>:
800001a0:	00000000 	0x00000000

Disassembly of section .bss.defendenable_player1:

800001a4 <defendenable_player1>:
800001a4:	00000000 	0x00000000

Disassembly of section .bss.defendenable_player2:

800001a8 <defendenable_player2>:
800001a8:	00000000 	0x00000000

Disassembly of section .bss.jumpenable_player1:

800001ac <jumpenable_player1>:
800001ac:	00000000 	0x00000000

Disassembly of section .bss.jumpenable_player2:

800001b0 <jumpenable_player2>:
800001b0:	00000000 	0x00000000

Disassembly of section .bss.lightpunchenable_player1:

800001b4 <lightpunchenable_player1>:
800001b4:	00000000 	0x00000000

Disassembly of section .bss.lightpunchenable_player2:

800001b8 <lightpunchenable_player2>:
800001b8:	00000000 	0x00000000

Disassembly of section .bss.heavypunchenable_player1:

800001bc <heavypunchenable_player1>:
800001bc:	00000000 	0x00000000

Disassembly of section .bss.heavypunchenable_player2:

800001c0 <heavypunchenable_player2>:
800001c0:	00000000 	0x00000000

Disassembly of section .bss.lightkickenable_player1:

800001c4 <lightkickenable_player1>:
800001c4:	00000000 	0x00000000

Disassembly of section .bss.lightkickenable_player2:

800001c8 <lightkickenable_player2>:
800001c8:	00000000 	0x00000000

Disassembly of section .bss.heavykickenable_player1:

800001cc <heavykickenable_player1>:
800001cc:	00000000 	0x00000000

Disassembly of section .bss.heavykickenable_player2:

800001d0 <heavykickenable_player2>:
800001d0:	00000000 	0x00000000

Disassembly of section .bss.hitenable_player1:

800001d4 <hitenable_player1>:
800001d4:	00000000 	0x00000000

Disassembly of section .bss.hitenable_player2:

800001d8 <hitenable_player2>:
800001d8:	00000000 	0x00000000

Disassembly of section .bss.jinengenable_player1:

800001dc <jinengenable_player1>:
800001dc:	00000000 	0x00000000

Disassembly of section .bss.jinengenable_player2:

800001e0 <jinengenable_player2>:
800001e0:	00000000 	0x00000000

Disassembly of section .bss.jinenghitenable_player1:

800001e4 <jinenghitenable_player1>:
800001e4:	00000000 	0x00000000

Disassembly of section .bss.jinenghitenable_player2:

800001e8 <jinenghitenable_player2>:
800001e8:	00000000 	0x00000000

Disassembly of section .bss.clearenable_player1:

800001ec <clearenable_player1>:
800001ec:	00000000 	0x00000000

Disassembly of section .bss.clearenable_player2:

800001f0 <clearenable_player2>:
800001f0:	00000000 	0x00000000

Disassembly of section .bss.count_xx:

800001f4 <count_xx>:
800001f4:	00000000 	0x00000000

Disassembly of section .bss.game_mode:

800001f8 <game_mode>:
800001f8:	00000000 	0x00000000

Disassembly of section .bss.flag_stop:

800001fc <flag_stop>:
800001fc:	00000000 	0x00000000

Disassembly of section .bss.count_readygo:

80000200 <count_readygo>:
80000200:	00000000 	0x00000000

Disassembly of section .bss.ko_flag:

80000204 <ko_flag>:
80000204:	00000000 	0x00000000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	0x3a434347
   4:	4e472820 	jirl	$r0,$r1,-112856(0x24728)
   8:	38202955 	ldx.bu	$r21,$r10,$r10
   c:	302e332e 	vldrepl.w	$vr14,$r25,-464(0xe30)
	...
