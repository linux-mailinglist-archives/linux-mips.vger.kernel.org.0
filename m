Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3AAA4A13
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728888AbfIAPqL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:46:11 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:41310 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728621AbfIAPqL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:46:11 -0400
X-Greylist: delayed 443 seconds by postgrey-1.27 at vger.kernel.org; Sun, 01 Sep 2019 11:46:10 EDT
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id A30C73F6A3
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:39:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id TPq4JKTS86Ot for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:39:50 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id B4B4A3F695
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:39:50 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:39:50 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 010/120] MIPS: R5900: Workaround exception NOP execution bug
 (FLX05)
Message-ID: <9b8beb1e11159a3a42233c64ea86607a5954d558.1567326213.git.noring@nocrew.org>
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

For the R5900, there are cases in which the first two instructions
in an exception handler are executed as NOP instructions, when
certain exceptions occur and then a bus error occurs immediately
before jumping to the exception handler (FLX05)[1].

The corrective measure is to place NOP in the first two instruction
locations in all exception handlers.

References:

[1] "TX System RISC TX79 Core Architecture" manual, revision 2.0,
    Toshiba Corporation, p. 1-11, https://wiki.qemu.org/File:C790.pdf

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/kernel/genex.S | 5 +++++
 arch/mips/kernel/traps.c | 6 ++++++
 arch/mips/mm/tlbex.c     | 6 ++++++
 3 files changed, 17 insertions(+)

diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
index 6eaf057e5d95..f57842b785b2 100644
--- a/arch/mips/kernel/genex.S
+++ b/arch/mips/kernel/genex.S
@@ -32,6 +32,11 @@
 NESTED(except_vec3_generic, 0, sp)
 	.set	push
 	.set	noat
+#ifdef CONFIG_CPU_R5900
+	/* Workaround for R5900 exception execution bug (FLX05). */
+	nop
+	nop
+#endif
 #if R5432_CP0_INTERRUPT_WAR
 #ifdef CONFIG_CPU_R5900
 	sync.p
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 9423b9a2eb67..9c98475c7dc6 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -1953,6 +1953,12 @@ void __init *set_except_vector(int n, void *addr)
 #endif
 		u32 *buf = (u32 *)(ebase + 0x200);
 		unsigned int k0 = 26;
+
+#ifdef CONFIG_CPU_R5900
+		/* Workaround for R5900 exception execution bug (FLX05). */
+		uasm_i_nop(&buf);
+		uasm_i_nop(&buf);
+#endif
 		if ((handler & jump_mask) == ((ebase + 0x200) & jump_mask)) {
 			uasm_i_j(&buf, handler & ~jump_mask);
 			uasm_i_nop(&buf);
diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 543ddb22b0d9..82136c346885 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -1313,6 +1313,12 @@ static void build_r4000_tlb_refill_handler(void)
 	memset(relocs, 0, sizeof(relocs));
 	memset(final_handler, 0, sizeof(final_handler));
 
+#ifdef CONFIG_CPU_R5900
+	/* Workaround for R5900 exception execution bug (FLX05). */
+	uasm_i_nop(&p);
+	uasm_i_nop(&p);
+#endif
+
 	if (IS_ENABLED(CONFIG_64BIT) && (scratch_reg >= 0 || scratchpad_available()) && use_bbit_insns()) {
 		htlb_info = build_fast_tlb_refill_handler(&p, &l, &r, K0, K1,
 							  scratch_reg);
-- 
2.21.0

