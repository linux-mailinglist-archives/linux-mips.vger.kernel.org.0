Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20FA5351902
	for <lists+linux-mips@lfdr.de>; Thu,  1 Apr 2021 19:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234720AbhDARs6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Apr 2021 13:48:58 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43918 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234640AbhDARq4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 1 Apr 2021 13:46:56 -0400
Received: from loongson.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX8s0ymVgtFkDAA--.7389S5;
        Thu, 01 Apr 2021 21:27:18 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC 3/3] MIPS: relocate: Add support to relocate kernel auto
Date:   Thu,  1 Apr 2021 21:27:13 +0800
Message-Id: <1617283633-18598-4-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1617283633-18598-1-git-send-email-hejinyang@loongson.cn>
References: <1617283633-18598-1-git-send-email-hejinyang@loongson.cn>
X-CM-TRANSID: AQAAf9DxX8s0ymVgtFkDAA--.7389S5
X-Coremail-Antispam: 1UD129KBjvJXoWxCF47uFW3ZFykXF1ftw17trb_yoW5trWkpr
        nxJ34rKan0yw17Aa1fJw1vk3y5twsYqry0yFZFqrWrJ3ZakF1rJ3ykKr13XFWrt34Fyr4S
        qFyIkr4UWw42yFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUB0b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUWwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
        64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
        CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
        c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
        8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCF
        s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_Xr4l42xK82IYc2Ij64
        vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
        jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
        x0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
        8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
        0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUvIeHDUUUU
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

These asm code is based on relocate.c. And in this stage,
only do relocate for _text and ex_table.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/kernel/head.S | 149 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index a25af1d..dc59b11 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -13,6 +13,7 @@
  * Kevin Kissell, kevink@mips.com and Carsten Langgaard, carstenl@mips.com
  * Copyright (C) 2000 MIPS Technologies, Inc.  All rights reserved.
  */
+
 #include <linux/init.h>
 #include <linux/threads.h>
 
@@ -26,6 +27,152 @@
 
 #include <kernel-entry-init.h>
 
+	.macro	do_relocate_kernel
+	.set	push
+#ifdef CONFIG_RELOCATABLE
+#define R_MIPS_32	2
+#define R_MIPS_26	4
+#define R_MIPS_HI16	5
+#define R_MIPS_64	18
+	/* Save args */
+	move s0, a0
+	move s1, a1
+	move s2, a2
+	move s3, a3
+
+	/* Whether the PC meets expectation */
+	bal	1f
+1:	move	a0, ra
+	PTR_LA	a1, 1b
+	PTR_SUB	a0, a0, a1
+	beqz	a0, 999f
+
+	/* Whether offset 64KB aligned */
+	and		t0, a0, 0xffff
+	bnez	t0, 999f
+
+	/* Whether current _text and _end are in the PC region */
+	PTR_LA	t0, _end
+	PTR_ADDU	t1, t0, a0
+	PTR_SRL	t1, 28
+	PTR_SRL	t0, 28
+	bne	t0, t1, 999f
+
+	PTR_LA	t0, _text
+	PTR_ADDU	t1, t0, a0
+	move	a3, t1
+	PTR_SRL	t1, 28
+	PTR_SRL	t0, 28
+	bne	t0, t1, 999f
+
+	/* get current __start/stop___ex_table address */
+	PTR_LA	a1, __start___ex_table
+	PTR_ADDU	a1, a0
+	PTR_LA	a2, __stop___ex_table
+	PTR_ADDU	a2, a0
+
+	/*
+	 * a0: offset
+	 * a1: current __start___ex_table
+	 * a2: current __stop___ex_table
+	 */
+1:	beq	a1, a2, 998f
+	PTR_L	t0, 0(a1)
+	PTR_ADDU	t0, a0
+	PTR_S	t0, 0(a1)
+	LONG_ADDIU	a1, PTRSIZE
+	b	1b
+
+998:
+	/* get current _relocation_start address */
+	PTR_LA	a1, _relocation_start
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
+	li	t8, 0x00ffffff
+	LONG_SRL t9, a0, 2
+	LONG_SRL a2, a0, 16
+1:	lw	t0, 0(a1)
+	beqz	t0, 900f
+	LONG_SRL	t1, t0, 24
+	and	t1, 0xff
+	and	t2, t0, t8
+	LONG_SLL	t2, 2
+	PTR_ADDU	t2, a3
+
+	li	t3, R_MIPS_64
+	beq	t1, t3, 964f
+	li	t3, R_MIPS_32
+	beq	t1, t3, 932f
+	li	t3, R_MIPS_26
+	beq	t1, t3, 926f
+	li	t3, R_MIPS_HI16
+	beq	t1, t3, 916f
+	b	999f
+
+964:
+#ifdef CONFIG_64BIT
+	ld	t3, 0(t2)
+	LONG_ADDU	t3, a0
+	sd	t3, 0(t2)
+#endif
+	LONG_ADDIU	a1, 4
+	b	1b
+
+932:
+	lw	t3, 0(t2)
+	LONG_ADDU	t3, a0
+	sw	t3, 0(t2)
+	LONG_ADDIU	a1, 4
+	b	1b
+
+926:
+	lw	t3, 0(t2)
+	LONG_ADDU	t3, t9
+	sw	t3, 0(t2)
+	LONG_ADDIU	a1, 4
+	b	1b
+
+916:
+	lw	t3, 0(t2)
+	LONG_ADDU	t3, a2
+	sw	t3, 0(t2)
+	LONG_ADDIU	a1, 4
+	b	1b
+
+900:
+	/* Complete! And flush i-cache */
+	PTR_LA	a0, _text
+	PTR_LA	a1,	_end
+	synci	0(a0)
+	rdhwr	t0, $1
+	beqz	t0, 999f
+	PTR_ADDU	a0, t0
+	PTR_SUBU	t0, a1, a0
+	bgtz	t0, 900b
+	sync
+
+999:
+	/* Restore args */
+	move a0, s0
+	move a1, s1
+	move a2, s2
+	move a3, s3
+#endif /* CONFIG_RELOCATABLE */
+	.set	pop
+	.endm
+
 	/*
 	 * For the moment disable interrupts, mark the kernel mode and
 	 * set ST0_KX so that the CPU does not spit fire when using
@@ -83,6 +230,8 @@ FEXPORT(__kernel_entry)
 
 NESTED(kernel_entry, 16, sp)			# kernel entry point
 
+	do_relocate_kernel
+
 	kernel_entry_setup			# cpu specific setup
 
 	setup_c0_status_pri
-- 
2.1.0

