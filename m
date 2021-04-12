Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA6035C637
	for <lists+linux-mips@lfdr.de>; Mon, 12 Apr 2021 14:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240874AbhDLM2x (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Apr 2021 08:28:53 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59222 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240167AbhDLM2w (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Apr 2021 08:28:52 -0400
Received: from loongson.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxzcjsPHRgCyoHAA--.9793S6;
        Mon, 12 Apr 2021 20:28:30 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] MIPS: cavium-octeon: Execute the smp handle after jumping to kernel linked address
Date:   Mon, 12 Apr 2021 20:28:13 +0800
Message-Id: <1618230494-6207-5-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1618230494-6207-1-git-send-email-hejinyang@loongson.cn>
References: <1618230494-6207-1-git-send-email-hejinyang@loongson.cn>
X-CM-TRANSID: AQAAf9AxzcjsPHRgCyoHAA--.9793S6
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww1DJw4rKr17uFy3Jr4rAFb_yoW8Cr1Dpa
        4DA34kGrWUCF1xZa4xJrWj93y7Z3WkWw15WF4DK34Fq3ZIgr15ZF1S9w17Zr9YgF45Ka1S
        gFn0qrWUKw1DAFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
        IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
        6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aV
        CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUYwa93UUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Once relocation is required, some fixed addresses in `smp handle` will be
affected. For example, octeon_processor_relocated_kernel_entry may cause
the problem of loading wrong memory at old address.

This patch makes smp cpu do two more things, one is to set ST0_KX, another
is to jump to the kernel linked address. They will not destroy the
cavium-octeon platform. This patch adds two platform-related macros,
SMP_IN_KERNEL_ENTRY and smp_in_kernel_handle, which can be used on other
platforms to deal with the SMP CPU in the kernel_entry, if the smp CPU
entered the kernel entry.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h | 7 +++++++
 arch/mips/kernel/head.S                                      | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h b/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h
index e66767d..21b9854 100644
--- a/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h
+++ b/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h
@@ -86,6 +86,13 @@
 	dli	v0, 0x27
 	dmtc0	v0, CP0_DCACHE_ERR_REG
 1:
+	.set pop
+.endm
+
+#define SMP_IN_KERNEL_ENTRY
+.macro	smp_in_kernel_entry_handle
+	.set push
+	.set arch=octeon
 	# Get my core id
 	rdhwr	v0, $0
 	# Jump the master to kernel_entry
diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index 0186285..6cfe23e 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -104,6 +104,10 @@ NESTED(kernel_entry, 16, sp)			# kernel entry point
 	jr		t0
 2:
 
+#ifdef SMP_IN_KERNEL_ENTRY
+	smp_in_kernel_entry_handle
+#endif
+
 	PTR_LA		t0, __bss_start		# clear .bss
 	LONG_S		zero, (t0)
 	PTR_LA		t1, __bss_stop - LONGSIZE
-- 
2.1.0

