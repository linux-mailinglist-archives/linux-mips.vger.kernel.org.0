Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C547AA4A0D
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728676AbfIAPnH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:43:07 -0400
Received: from ste-pvt-msa1.bahnhof.se ([213.80.101.70]:42317 "EHLO
        ste-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728496AbfIAPnG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:43:06 -0400
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 101D23F793
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:36:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id SicFsrujHwbl for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:36:30 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id E8CC03F773
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:36:30 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:36:30 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 002/120] MIPS: R5900: Trap the RDHWR instruction as an SQ
 address exception
Message-ID: <4f856a5ea2c039c6639df875d11b5bff1bf7ecd2.1567326213.git.noring@nocrew.org>
References: <cover.1567326213.git.noring@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1567326213.git.noring@nocrew.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On the R5900, the RDHWR instruction is interpreted as the R5900 specific
SQ instruction[1] that traps into a zero page address exception. Hence
RDHWR can be emulated by emulate_load_store_insn().

CONFIG_DEFAULT_MMAP_MIN_ADDR must not be less than PAGE_SIZE to reliably
trap and emulate RDHWR, so this is made a BUILD_BUG_ON for the R5900.

References:

[1] "TX System RISC TX79 Core Architecture" manual, revision 2.0,
    Toshiba Corporation, p. B-162, https://wiki.qemu.org/File:C790.pdf

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/traps.h |  2 ++
 arch/mips/kernel/traps.c      |  2 +-
 arch/mips/kernel/unaligned.c  | 36 ++++++++++++++++++++++++++++++++++-
 3 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/traps.h b/arch/mips/include/asm/traps.h
index 6a0864bb604d..ed6449f2967b 100644
--- a/arch/mips/include/asm/traps.h
+++ b/arch/mips/include/asm/traps.h
@@ -35,4 +35,6 @@ extern int register_nmi_notifier(struct notifier_block *nb);
 	register_nmi_notifier(&fn##_nb);				\
 })
 
+int simulate_rdhwr(struct pt_regs *regs, int rd, int rt);
+
 #endif /* _ASM_TRAPS_H */
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 342e41de9d64..9423b9a2eb67 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -625,7 +625,7 @@ static int simulate_llsc(struct pt_regs *regs, unsigned int opcode)
  * Simulate trapping 'rdhwr' instructions to provide user accessible
  * registers not implemented in hardware.
  */
-static int simulate_rdhwr(struct pt_regs *regs, int rd, int rt)
+int simulate_rdhwr(struct pt_regs *regs, int rd, int rt)
 {
 	struct thread_info *ti = task_thread_info(current);
 
diff --git a/arch/mips/kernel/unaligned.c b/arch/mips/kernel/unaligned.c
index 92bd2b0f0548..f490944d73cf 100644
--- a/arch/mips/kernel/unaligned.c
+++ b/arch/mips/kernel/unaligned.c
@@ -90,6 +90,7 @@
 #include <asm/fpu_emulator.h>
 #include <asm/inst.h>
 #include <asm/mmu_context.h>
+#include <asm/traps.h>
 #include <linux/uaccess.h>
 
 #define STR(x)	__STR(x)
@@ -934,7 +935,39 @@ static void emulate_load_store_insn(struct pt_regs *regs,
 		 * interest.
 		 */
 	case spec3_op:
-		if (insn.dsp_format.func == lx_op) {
+		if (IS_ENABLED(CONFIG_CPU_R5900)) {
+			/*
+			 * On the R5900, the RDHWR instruction
+			 *
+			 *     +--------+-------+----+----+-------+--------+
+			 *     | 011111 | 00000 | rt | rd | 00000 | 111011 |
+			 *     +--------+-------+----+----+-------+--------+
+			 *          6       5      5    5     5        6
+			 *
+			 * is interpreted as the R5900 specific SQ instruction
+			 *
+			 *     +--------+-------+----+---------------------+
+			 *     | 011111 |  base | rt |        offset       |
+			 *     +--------+-------+----+---------------------+
+			 *          6       5      5            16
+			 *
+			 * that asserts a zero page address exception. Hence
+			 * RDHWR can be trapped and emulated here, provided
+			 * DEFAULT_MMAP_MIN_ADDR isn't zero.
+			 */
+			BUILD_BUG_ON(IS_ENABLED(CONFIG_CPU_R5900) &&
+				CONFIG_DEFAULT_MMAP_MIN_ADDR < PAGE_SIZE);
+			if (insn.r_format.func == rdhwr_op &&
+			    insn.r_format.rs == 0 &&
+			    insn.r_format.re == 0) {
+				if (compute_return_epc(regs) < 0 ||
+				    simulate_rdhwr(regs, insn.r_format.rd,
+						   insn.r_format.rt) < 0)
+					goto sigill;
+				return;
+			}
+			goto sigbus;
+		} else if (insn.dsp_format.func == lx_op) {
 			switch (insn.dsp_format.op) {
 			case lwx_op:
 				if (!access_ok(addr, 4))
@@ -1342,6 +1375,7 @@ static void emulate_load_store_insn(struct pt_regs *regs,
 		cu2_notifier_call_chain(CU2_SDC2_OP, regs);
 		break;
 #endif
+
 	default:
 		/*
 		 * Pheeee...  We encountered an yet unknown instruction or
-- 
2.21.0

