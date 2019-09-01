Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1341A4A29
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728763AbfIAPsW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:48:22 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:57482 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729172AbfIAPsW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:48:22 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 7DDBC40408
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:40:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id yOALxI-TnqKW for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:40:55 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 8CE0F403B7
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:40:55 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:40:55 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 013/120] MIPS: R5900: Avoid pipeline hazard with the TLBR
 instruction
Message-ID: <815e58a51f40c56ea8b02bc39f9ed5f1639a69ee.1567326213.git.noring@nocrew.org>
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

On the R5900, the TLBR instruction must be immediately followed by an
ERET or a SYNC.P instruction[1].

References:

[1] "TX System RISC TX79 Core Architecture" manual, revision 2.0,
    Toshiba Corporation, p. C-38, https://wiki.qemu.org/File:C790.pdf

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mipsregs.h |  4 ++++
 arch/mips/mm/tlbex.c             | 24 ++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 2aa947b3d0d1..ec22406c800f 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -2728,6 +2728,10 @@ static inline void tlb_read(void)
 
 	__asm__ __volatile__(
 		".set noreorder\n\t"
+#ifdef CONFIG_CPU_R5900
+		/* instruction must not be at the end of a page. */
+		".align 8\n\t"
+#endif
 		"tlbr\n\t"
 #ifdef CONFIG_CPU_R5900
 		"sync.p\n\t"
diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 89ff0eae5397..1caa0214d57a 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -2185,6 +2185,18 @@ static void build_r4000_tlb_load_handler(void)
 
 		uasm_i_tlbr(&p);
 
+#ifdef CONFIG_CPU_R5900
+		/*
+		 * On the R5900, the TLBR instruction must be immediately
+		 * followed by an ERET or a SYNC.P instruction.
+		 */
+		uasm_i_syncp(&p);
+		uasm_i_nop(&p);
+		uasm_i_nop(&p);
+		uasm_i_nop(&p);
+		uasm_i_nop(&p);
+#endif
+
 		switch (current_cpu_type()) {
 		default:
 			if (cpu_has_mips_r2_exec_hazard) {
@@ -2260,6 +2272,18 @@ static void build_r4000_tlb_load_handler(void)
 
 		uasm_i_tlbr(&p);
 
+#ifdef CONFIG_CPU_R5900
+		/*
+		 * On the R5900, the TLBR instruction must be immediately
+		 * followed by an ERET or a SYNC.P instruction.
+		 */
+		uasm_i_syncp(&p);
+		uasm_i_nop(&p);
+		uasm_i_nop(&p);
+		uasm_i_nop(&p);
+		uasm_i_nop(&p);
+#endif
+
 		switch (current_cpu_type()) {
 		default:
 			if (cpu_has_mips_r2_exec_hazard) {
-- 
2.21.0

