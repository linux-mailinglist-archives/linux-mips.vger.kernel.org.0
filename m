Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C368A6222A
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jul 2019 17:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388096AbfGHPXD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Jul 2019 11:23:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:49844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388111AbfGHPXD (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Jul 2019 11:23:03 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A2FB7216E3;
        Mon,  8 Jul 2019 15:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562599382;
        bh=/GzAiJJ/5hONQVTfBdxNgtfUqn2/2GZIdHEzd+9p2as=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=yALUaqWQrEZoxAWeKz/laBy741EoWwC6/yC5Wqx3NUUY/kw6VxMPbOevb1ZMF7vIj
         g+sHLR3rFx91BJd+MDGmOzg9D4ZyF671VnQnD26YqJNu1YFbpzfd7Moc5v+g+8Wrqx
         uxN1Rn5woLRDfmPMEHzZ4M16vox/S/tbGynd+2Mg=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, Dmitry Korotin <dkorotin@wavecomp.com>,
        Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org
Subject: [PATCH 4.9 100/102] MIPS: Add missing EHB in mtc0 -> mfc0 sequence.
Date:   Mon,  8 Jul 2019 17:13:33 +0200
Message-Id: <20190708150531.659345759@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190708150525.973820964@linuxfoundation.org>
References: <20190708150525.973820964@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Dmitry Korotin <dkorotin@wavecomp.com>

commit 0b24cae4d535045f4c9e177aa228d4e97bad212c upstream.

Add a missing EHB (Execution Hazard Barrier) in mtc0 -> mfc0 sequence.
Without this execution hazard barrier it's possible for the value read
back from the KScratch register to be the value from before the mtc0.

Reproducible on P5600 & P6600.

The hazard is documented in the MIPS Architecture Reference Manual Vol.
III: MIPS32/microMIPS32 Privileged Resource Architecture (MD00088), rev
6.03 table 8.1 which includes:

   Producer | Consumer | Hazard
  ----------|----------|----------------------------
   mtc0     | mfc0     | any coprocessor 0 register

Signed-off-by: Dmitry Korotin <dkorotin@wavecomp.com>
[paul.burton@mips.com:
  - Commit message tweaks.
  - Add Fixes tags.
  - Mark for stable back to v3.15 where P5600 support was introduced.]
Signed-off-by: Paul Burton <paul.burton@mips.com>
Fixes: 3d8bfdd03072 ("MIPS: Use C0_KScratch (if present) to hold PGD pointer.")
Fixes: 829dcc0a956a ("MIPS: Add MIPS P5600 probe support")
Cc: linux-mips@vger.kernel.org
Cc: stable@vger.kernel.org # v3.15+
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 arch/mips/mm/tlbex.c |   29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -386,6 +386,7 @@ static struct work_registers build_get_w
 static void build_restore_work_registers(u32 **p)
 {
 	if (scratch_reg >= 0) {
+		uasm_i_ehb(p);
 		UASM_i_MFC0(p, 1, c0_kscratch(), scratch_reg);
 		return;
 	}
@@ -674,10 +675,12 @@ static void build_restore_pagemask(u32 *
 			uasm_i_mtc0(p, 0, C0_PAGEMASK);
 			uasm_il_b(p, r, lid);
 		}
-		if (scratch_reg >= 0)
+		if (scratch_reg >= 0) {
+			uasm_i_ehb(p);
 			UASM_i_MFC0(p, 1, c0_kscratch(), scratch_reg);
-		else
+		} else {
 			UASM_i_LW(p, 1, scratchpad_offset(0), 0);
+		}
 	} else {
 		/* Reset default page size */
 		if (PM_DEFAULT_MASK >> 16) {
@@ -935,10 +938,12 @@ build_get_pgd_vmalloc64(u32 **p, struct
 		uasm_i_jr(p, ptr);
 
 		if (mode == refill_scratch) {
-			if (scratch_reg >= 0)
+			if (scratch_reg >= 0) {
+				uasm_i_ehb(p);
 				UASM_i_MFC0(p, 1, c0_kscratch(), scratch_reg);
-			else
+			} else {
 				UASM_i_LW(p, 1, scratchpad_offset(0), 0);
+			}
 		} else {
 			uasm_i_nop(p);
 		}
@@ -1238,6 +1243,7 @@ build_fast_tlb_refill_handler (u32 **p,
 	UASM_i_MTC0(p, odd, C0_ENTRYLO1); /* load it */
 
 	if (c0_scratch_reg >= 0) {
+		uasm_i_ehb(p);
 		UASM_i_MFC0(p, scratch, c0_kscratch(), c0_scratch_reg);
 		build_tlb_write_entry(p, l, r, tlb_random);
 		uasm_l_leave(l, *p);
@@ -1592,15 +1598,17 @@ static void build_setup_pgd(void)
 		uasm_i_dinsm(&p, a0, 0, 29, 64 - 29);
 		uasm_l_tlbl_goaround1(&l, p);
 		UASM_i_SLL(&p, a0, a0, 11);
-		uasm_i_jr(&p, 31);
 		UASM_i_MTC0(&p, a0, C0_CONTEXT);
+		uasm_i_jr(&p, 31);
+		uasm_i_ehb(&p);
 	} else {
 		/* PGD in c0_KScratch */
-		uasm_i_jr(&p, 31);
 		if (cpu_has_ldpte)
 			UASM_i_MTC0(&p, a0, C0_PWBASE);
 		else
 			UASM_i_MTC0(&p, a0, c0_kscratch(), pgd_reg);
+		uasm_i_jr(&p, 31);
+		uasm_i_ehb(&p);
 	}
 #else
 #ifdef CONFIG_SMP
@@ -1614,13 +1622,16 @@ static void build_setup_pgd(void)
 	UASM_i_LA_mostly(&p, a2, pgdc);
 	UASM_i_SW(&p, a0, uasm_rel_lo(pgdc), a2);
 #endif /* SMP */
-	uasm_i_jr(&p, 31);
 
 	/* if pgd_reg is allocated, save PGD also to scratch register */
-	if (pgd_reg != -1)
+	if (pgd_reg != -1) {
 		UASM_i_MTC0(&p, a0, c0_kscratch(), pgd_reg);
-	else
+		uasm_i_jr(&p, 31);
+		uasm_i_ehb(&p);
+	} else {
+		uasm_i_jr(&p, 31);
 		uasm_i_nop(&p);
+	}
 #endif
 	if (p >= tlbmiss_handler_setup_pgd_end)
 		panic("tlbmiss_handler_setup_pgd space exceeded");


