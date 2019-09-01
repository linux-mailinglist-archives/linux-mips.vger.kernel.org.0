Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C22BA4A10
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728687AbfIAPpj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:45:39 -0400
Received: from ste-pvt-msa2.bahnhof.se ([213.80.101.71]:37489 "EHLO
        ste-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728621AbfIAPpj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:45:39 -0400
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id D0F9B3F9E4;
        Sun,  1 Sep 2019 17:37:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id btzH-vP_3bIy; Sun,  1 Sep 2019 17:37:36 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 173B13F9CE;
        Sun,  1 Sep 2019 17:37:36 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:37:35 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org
Cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        =?utf-8?Q?J=C3=BCrgen?= Urban <JuergenUrban@gmx.de>
Subject: [PATCH 004/120] MIPS: R5900: Reset bits 127..64 of GPRs in
 RESTORE_SOME
Message-ID: <810f5e4de4a5d600a013733c9c13c7aa0b8c30d5.1567326213.git.noring@nocrew.org>
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

Bits 127..64 are not used by the kernel but can be modified by
applications using the R5900 specific multimedia instructions.
Clearing them in RESTORE_SOME prevents leaking information between
processes. This is a provisional measure until full 128-bit registers
are saved/restored, possibly using SQ/LQ.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
As mentioned in the cover letter, I think it would be much better to save
and restore 128-bit GPRs here.
---
 arch/mips/include/asm/stackframe.h | 53 ++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/mips/include/asm/stackframe.h b/arch/mips/include/asm/stackframe.h
index 4d6ad907ae54..aaed9b522220 100644
--- a/arch/mips/include/asm/stackframe.h
+++ b/arch/mips/include/asm/stackframe.h
@@ -349,6 +349,58 @@
 		cfi_ld	sp, PT_R29, \docfi
 		.endm
 
+#ifdef CONFIG_CPU_R5900
+		/*
+		 * Reset bits 127..64 of 128-bit multimedia registers.
+		 *
+		 * Bits 127..64 are not used by the kernel but can be modified
+		 * by applications using the R5900 specific multimedia
+		 * instructions. Clearing them prevents leaking information
+		 * between processes. This is a provisional measure until full
+		 * 128-bit registers are saved/restored, possibly using SQ/LQ.
+		 */
+		.macro	RESET_MMR
+		.set	push
+		.set	noreorder
+		.set	noat
+		pcpyld	$1, $0, $1
+		pcpyld	$2, $0, $2
+		pcpyld	$3, $0, $3
+		pcpyld	$4, $0, $4
+		pcpyld	$5, $0, $5
+		pcpyld	$6, $0, $6
+		pcpyld	$7, $0, $7
+		pcpyld	$8, $0, $8
+		pcpyld	$9, $0, $9
+		pcpyld	$10, $0, $10
+		pcpyld	$11, $0, $11
+		pcpyld	$12, $0, $12
+		pcpyld	$13, $0, $13
+		pcpyld	$14, $0, $14
+		pcpyld	$15, $0, $15
+		pcpyld	$16, $0, $16
+		pcpyld	$17, $0, $17
+		pcpyld	$18, $0, $18
+		pcpyld	$19, $0, $19
+		pcpyld	$20, $0, $20
+		pcpyld	$21, $0, $21
+		pcpyld	$22, $0, $22
+		pcpyld	$23, $0, $23
+		pcpyld	$24, $0, $24
+		pcpyld	$25, $0, $25
+		pcpyld	$26, $0, $26
+		pcpyld	$27, $0, $27
+		pcpyld	$28, $0, $28
+		pcpyld	$29, $0, $29
+		pcpyld	$30, $0, $30
+		pcpyld	$31, $0, $31
+		.set	pop
+		.endm
+#else
+		.macro	RESET_MMR
+		.endm
+#endif
+
 #if defined(CONFIG_CPU_R3000) || defined(CONFIG_CPU_TX39XX)
 
 		.macro	RESTORE_SOME docfi=0
@@ -393,6 +445,7 @@
 		.set	push
 		.set	reorder
 		.set	noat
+		RESET_MMR
 		mfc0	a0, CP0_STATUS
 		ori	a0, STATMASK
 		xori	a0, STATMASK
-- 
2.21.0

