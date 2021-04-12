Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1361C35C639
	for <lists+linux-mips@lfdr.de>; Mon, 12 Apr 2021 14:28:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240812AbhDLM2y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Apr 2021 08:28:54 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59224 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240788AbhDLM2x (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Apr 2021 08:28:53 -0400
Received: from loongson.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxzcjsPHRgCyoHAA--.9793S7;
        Mon, 12 Apr 2021 20:28:30 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] MIPS: relocate: Add support to auto relocate kernel
Date:   Mon, 12 Apr 2021 20:28:14 +0800
Message-Id: <1618230494-6207-6-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1618230494-6207-1-git-send-email-hejinyang@loongson.cn>
References: <1618230494-6207-1-git-send-email-hejinyang@loongson.cn>
X-CM-TRANSID: AQAAf9AxzcjsPHRgCyoHAA--.9793S7
X-Coremail-Antispam: 1UD129KBjvJXoWxKw4DCFy8Gr43WFykJF4fXwb_yoWxXF15pr
        n3Aws5Ka92yw1xA3yxtw4kC3y5Ka1vgryakrW7trWrJ3WSvFn5Jw1rKr1rXry0qa4FyF4S
        vFyxKr48Zw4Iya7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28C
        jxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI
        8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E
        87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64
        kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm
        72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6ryUMxAIw28Icx
        kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
        xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42
        IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
        6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aV
        CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUYwa93UUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

These codes are base on arch/mips/kernel/kaslr.c. Once do_relocate_kernel
occurs, the kernel can hardly work normally, unless do_relocate_kernel
success. Follows are what boot cpu does in do_relocate_kernel.

1, Save args
2, Whether the PC meets expectation
   Determine whether the kernel needs to be relocated. At this time, a0
   is the difference between the PC and the fixed address in the kernel.
3, Whether offset 64KB aligned
4, Whether current _text and _end are in the PC region
   Makesure RELOCATED(_text/_end) in same PC region, otherwise fail.
   Because we used lots of j/jal in kernel.
5, get current __start/stop___ex_table address
   Get RELOCATED(__start/stop___ex_table) first, and relocate them.
6, get current _relocation_start address
   Get RELOCATED(_relocation_start address) and do relocation by info in
   relocation table. 964 is based on apply_r_mips_64_rel, 932 is based on
   apply_r_mips_32_rel, 926 is based on apply_r_mips_26_rel and 916 is
   based on apply_r_mips_hi16_rel.
   R_MIPS_26: 0~25bit: ((insn & 0x03ffffff) << 2 + offset) >> 2
                     = (insn & 0x03ffffff) + offset >> 2
   R_MIPS_HI16: 0~15bit: ((insn & 0x0000ffff) << 16 + offset) >> 16
                     = (insn & 0x0000ffff) + offset >> 16
7, Complete! And flush i-cache
8, Restore args

All relocate process did 3 things in short, relocate ex_table, relocate
insructions and flush i-cache.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/cavium-octeon/smp.c                      |   5 +-
 .../asm/mach-cavium-octeon/kernel-entry-init.h     |  13 ++
 arch/mips/kernel/head.S                            | 158 +++++++++++++++++++++
 3 files changed, 175 insertions(+), 1 deletion(-)

diff --git a/arch/mips/cavium-octeon/smp.c b/arch/mips/cavium-octeon/smp.c
index dfdbc79..4201f08 100644
--- a/arch/mips/cavium-octeon/smp.c
+++ b/arch/mips/cavium-octeon/smp.c
@@ -28,9 +28,13 @@
 volatile unsigned long octeon_processor_boot = 0xff;
 volatile unsigned long octeon_processor_sp;
 volatile unsigned long octeon_processor_gp;
+
+#ifdef CONFIG_RELOCATABLE
+volatile unsigned long relocate_finished = 1;
 #ifdef CONFIG_RANDOMIZE_BASE
 volatile unsigned long octeon_processor_relocated_kernel_entry;
 #endif /* CONFIG_RANDOMIZE_BASE */
+#endif /* CONFIG_RELOCATABLE */
 
 #ifdef CONFIG_HOTPLUG_CPU
 uint64_t octeon_bootloader_entry_addr;
@@ -189,7 +193,6 @@ static void __init octeon_smp_setup(void)
 	octeon_smp_hotplug_setup();
 }
 
-
 #ifdef CONFIG_RANDOMIZE_BASE
 int plat_post_relocation(long offset)
 {
diff --git a/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h b/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h
index 21b9854..14acc3a 100644
--- a/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h
+++ b/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h
@@ -101,6 +101,19 @@
 
 #ifdef CONFIG_SMP
 
+#ifdef CONFIG_RELOCATABLE
+	# Wait main processor finished relocation
+	bal	1f
+1:	move	t0, ra
+	PTR_LA	t1, 1b
+	PTR_SUBU	t0, t1
+	PTR_LA	t1, relocate_finished
+	PTR_ADDU	t0, t1
+2:	nop
+	LONG_L	t1, 0(t0)
+	bnez	t1, 2b
+#endif /* CONFIG_RELOCATABLE */
+
 	#
 	# All cores other than the master need to wait here for SMP bootstrap
 	# to begin
diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index 6cfe23e..c431d27 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -81,6 +81,160 @@ FEXPORT(__kernel_entry)
 
 #define PC_REGION_SHIFT 28
 #define PC_REGION_MASK (~(1 << PC_REGION_SHIFT - 1))
+#define R_MIPS_32	2
+#define R_MIPS_26	4
+#define R_MIPS_HI16	5
+#define R_MIPS_64	18
+
+	.macro	do_relocate_kernel
+	.set	push
+	/* Save args */
+	move		s0, a0
+	move		s1, a1
+	move		s2, a2
+	move		s3, a3
+
+	/* Whether the PC meets expectation */
+	bal		1f
+1:	move		a0, ra
+	PTR_LA		a1, 1b
+	PTR_SUB		a0, a0, a1
+	beqz		a0, 999f
+
+	/* Whether offset 64KB aligned */
+	and		t0, a0, 0xffff
+	bnez		t0, 999f
+
+	/* Whether current _text and _end are in the PC region */
+	PTR_LA		t0, _end
+	PTR_ADDU	t1, t0, a0
+	PTR_SRL		t1, PC_REGION_SHIFT
+	PTR_SRL		t0, PC_REGION_SHIFT
+	bne		t0, t1, 999f
+
+	PTR_LA		t0, _text
+	PTR_ADDU	t1, t0, a0
+	move		a3, t1
+	PTR_SRL		t1, PC_REGION_SHIFT
+	PTR_SRL		t0, PC_REGION_SHIFT
+	bne		t0, t1, 999f
+
+	/* get current __start/stop___ex_table address */
+	PTR_LA		a1, __start___ex_table
+	PTR_ADDU	a1, a0
+	PTR_LA		a2, __stop___ex_table
+	PTR_ADDU	a2, a0
+
+	/*
+	 * a0: offset
+	 * a1: current __start___ex_table
+	 * a2: current __stop___ex_table
+	 */
+1:	beq		a1, a2, 996f
+	PTR_L		t0, 0(a1)
+	PTR_ADDU	t0, a0
+	PTR_S		t0, 0(a1)
+	LONG_ADDIU	a1, PTRSIZE
+	b		1b
+
+996:
+	/* get current _relocation_start address */
+	PTR_LA		a1, _relocation_start
+	PTR_ADDU	a1, a0
+
+	/*
+	 * a0: offset
+	 * a1: _relocation_start[]
+	 * a2: offset >> 16, to relocate R_MIPS_HI16
+	 * a3: current _text
+	 * t0: to load _relocation_start[]
+	 * t1: relocation type
+	 * t2: current relocate position
+	 * t3: temporarily
+	 * t8: 0x00ffffff, mask, to get relocate position
+	 * t9: offset >> 2, to relocate R_MIPS_26
+	 */
+	PTR_LI		t8, 0xffffff
+	LONG_SRL 	t9, a0, 2
+	LONG_SRL 	a2, a0, 16
+1:	lw		t0, 0(a1)
+	beqz		t0, 997f
+	LONG_SRL	t1, t0, 24
+	and		t1, 0xff
+	and		t2, t0, t8
+	LONG_SLL	t2, 2
+	PTR_ADDU	t2, a3
+
+#ifdef CONFIG_64BIT
+	li		t3, R_MIPS_64
+	beq		t1, t3, 964f
+#endif
+	li		t3, R_MIPS_32
+	beq		t1, t3, 932f
+	li		t3, R_MIPS_26
+	beq		t1, t3, 926f
+	li		t3, R_MIPS_HI16
+	beq		t1, t3, 916f
+	b		999f
+
+#ifdef CONFIG_64BIT
+964:
+	ld		t3, 0(t2)
+	LONG_ADDU	t3, a0
+	sd		t3, 0(t2)
+	LONG_ADDIU	a1, 4
+	b		1b
+#endif
+
+932:
+	lw		t3, 0(t2)
+	LONG_ADDU	t3, a0
+	sw		t3, 0(t2)
+	LONG_ADDIU	a1, 4
+	b		1b
+
+926:
+	lw		t3, 0(t2)
+	LONG_ADDU	t3, t9
+	sw		t3, 0(t2)
+	LONG_ADDIU	a1, 4
+	b		1b
+
+916:
+	lw		t3, 0(t2)
+	LONG_ADDU	t3, a2
+	sw		t3, 0(t2)
+	LONG_ADDIU	a1, 4
+	b		1b
+
+997:
+	/* Complete! And flush i-cache */
+1:	PTR_LA		a0, _text
+	PTR_LA		a1, _end
+	synci		0(a0)
+	rdhwr		t0, $1
+	beqz		t0, 998f
+	PTR_ADDU	a0, t0
+	PTR_SUBU	t0, a1, a0
+	bgtz		t0, 1b
+
+998:
+	sync
+
+999:
+
+#ifdef SMP_IN_KERNEL_ENTRY
+	PTR_LA		a0, relocate_finished
+	LONG_S		zero, 0(a0)
+#endif
+
+	/* Restore args */
+	move		a0, s0
+	move		a1, s1
+	move		a2, s2
+	move		a3, s3
+	.set	pop
+	.endm
 
 	__REF
 
@@ -108,6 +262,10 @@ NESTED(kernel_entry, 16, sp)			# kernel entry point
 	smp_in_kernel_entry_handle
 #endif
 
+#ifdef CONFIG_RELOCATABLE
+	do_relocate_kernel
+#endif
+
 	PTR_LA		t0, __bss_start		# clear .bss
 	LONG_S		zero, (t0)
 	PTR_LA		t1, __bss_stop - LONGSIZE
-- 
2.1.0

