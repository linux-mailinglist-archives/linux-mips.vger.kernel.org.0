Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8830335C633
	for <lists+linux-mips@lfdr.de>; Mon, 12 Apr 2021 14:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240245AbhDLM2v (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Apr 2021 08:28:51 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59196 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231138AbhDLM2u (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Apr 2021 08:28:50 -0400
Received: from loongson.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxzcjsPHRgCyoHAA--.9793S5;
        Mon, 12 Apr 2021 20:28:29 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] MIPS: Jump to kernel linked address by PC relative way
Date:   Mon, 12 Apr 2021 20:28:12 +0800
Message-Id: <1618230494-6207-4-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1618230494-6207-1-git-send-email-hejinyang@loongson.cn>
References: <1618230494-6207-1-git-send-email-hejinyang@loongson.cn>
X-CM-TRANSID: AQAAf9AxzcjsPHRgCyoHAA--.9793S5
X-Coremail-Antispam: 1UD129KBjvJXoW7KFW8ZrWktFyDtrWkXrWfGrg_yoW8uryxpr
        43G3yfGa1q9Fy8X34rAryj93y5Zw4kXa43GF93Jryrta4YvFnru34Y9F93XryjqFyrKw4j
        qF1jgw1Yka1qv37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUWwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
        64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
        CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
        6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
        02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE
        4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6ryUMxAIw28IcxkI7V
        AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
        r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
        IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
        w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
        0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUYw2-5UUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 15ad838d281b ("[MIPS] Always do the ARC64_TWIDDLE_PC thing.")
gives the kernel a chance to jump to the address the kernel is linked to.
It can be seen from the old records that this situation is usually a jump
from XPHYS to KSEG0. For example, kdump operation, kexec_start_address is
usually in XPHYS on Loongson64 platform. Jumping from XPHYS to KSEG0 is a
big jump. With the relocation, there may be small jumps. As follows,

			+-----------+
			|           |
			|___________|
			|           |
			|  _kernel  |
			|           |
			|_\0:       |
			|   jr t0   |---+
			| la t0, \0 |   |
			|___________|   |
			|           |   |
			|           |   |
			|___________|   |
			|           |   |
			|  kernel   |   |
			|           |   |
			|\0:        |<--+
			|   jr t0   |
			| la t0, \0 |
			|           |
			|___________|
			|           |
			+-----------+

_kernel is same as kernel, only the loaded address is different. They are
all in KSEG0. For kernel, `jr t0` is right operation and PC will jump to
\0. For _kernel, `jr t0` is dangerous operation and PC will not jump to
_\0 because `la t0, \0` target address is not PC relative.

This patch get the PC address by fixed `1:` (t0) and dynamic ra at
`1:` (t1). t0 determines the PC Region of the address where the kernel is
linked to. t1 determines the offset relative to the PC Region.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/kernel/head.S | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index a25af1d..0186285 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -79,6 +79,9 @@ FEXPORT(__kernel_entry)
 	j	kernel_entry
 #endif /* CONFIG_BOOT_RAW */
 
+#define PC_REGION_SHIFT 28
+#define PC_REGION_MASK (~(1 << PC_REGION_SHIFT - 1))
+
 	__REF
 
 NESTED(kernel_entry, 16, sp)			# kernel entry point
@@ -89,9 +92,17 @@ NESTED(kernel_entry, 16, sp)			# kernel entry point
 
 	/* We might not get launched at the address the kernel is linked to,
 	   so we jump there.  */
-	PTR_LA	t0, 0f
-	jr	t0
-0:
+	PTR_LA	t0, 1f
+	bal		1f
+1:	move	t1, ra
+	PTR_LI	t2, PC_REGION_MASK
+	and		t0, t2
+	PTR_LI	t2, ~PC_REGION_MASK
+	and		t1, t2
+	or		t0, t1
+	PTR_ADDIU	t0, 2f-1b
+	jr		t0
+2:
 
 	PTR_LA		t0, __bss_start		# clear .bss
 	LONG_S		zero, (t0)
-- 
2.1.0

