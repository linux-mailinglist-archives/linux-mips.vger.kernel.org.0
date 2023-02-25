Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 264A56A2C02
	for <lists+linux-mips@lfdr.de>; Sat, 25 Feb 2023 23:10:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjBYWKv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 Feb 2023 17:10:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjBYWKu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 25 Feb 2023 17:10:50 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97154144B2
        for <linux-mips@vger.kernel.org>; Sat, 25 Feb 2023 14:10:49 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 0E32E5C00E1;
        Sat, 25 Feb 2023 17:10:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 25 Feb 2023 17:10:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1677363049; x=1677449449; bh=sK
        0ntWkuJSl1JdIL6sSNNcjYmI2V1/EjwMxB90/f+fY=; b=Q8gbeP8XJueydX6Yfp
        fWAgTVvAcrXntOYrKYqLsL5jKpaGxAZMjdClYGvI9bwG2fhMztbvJxl+2tsXdMT3
        48ceOgo04S7T9z3xgg8UtEmhdcq8D/zKHbzIDFk4C8UBt9OBW0ex1/srIa49++fJ
        Ou4lkv8W62LmLIw1lIdicE2fxTXtIDC+TVlimxfQ2btZ6JNwE+bCwgb64A7VqrZx
        pSkkE2cMG/hZICWGyLybL1dNAPrVj/LF1CMQWLr6ZAJrdXJMCXjFihPEz1akZlRZ
        IhccLvgrfm2sH7gFQMOh5socfiKCtCZqjxom0BZMnHaDSOCCw8VY5ojtmgufgIMi
        xGhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1677363049; x=1677449449; bh=sK0ntWkuJSl1J
        dIL6sSNNcjYmI2V1/EjwMxB90/f+fY=; b=hq7tBuVb4lxP1NetfyvHTXYkAkGRj
        twBUMJf2phprbdCaoQLHXTRfgEHxFasMX0SbnhotfUx+/AtPvmJbItS00+YC0ze+
        Gvkyknda9nuMl1mE9pRQkfdmDbgIxFw1W1xwANf8O1S+ZuSmmi+5uxcwq2vDFEtz
        ChkNeLfeWTwLeJGFjLsBGWG6UD5brQjtWAGiP8G239l3ColVdEicxhBBVjyRMzGd
        AQQUyDgbzNI+tqV3TvX1wVRMXdI3YvGw6PIPio1anvAigLQceQ5PwdPk0ZsaSOQK
        w9zaJODgy0LLHmRjHCEqKYCNxjdVKT0zFj8lsCihCxhZ5pQm2RqTDMn6w==
X-ME-Sender: <xms:aIf6Y7YBZvNAjAUR4OdA3PBi2LBylENCq8drdsVkP4WeSB5OpMe-Xg>
    <xme:aIf6Y6ZatvezHmL__H7cQIWXCrhjGEaNw0AA5VUCrd9SPQKUfp5k7SKWlhjDQhQ2e
    1yxqmRxlnHUqnDUUag>
X-ME-Received: <xmr:aIf6Y98Ufsq0sfOJ79399CXgEXbxJVeWfdxNwlYqWWxruCtha5y12PnQYBVY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekiedgleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvefgtdelgeduheegie
    dujedtgfetvddujeelveehudfhvdeigedtvddvveffvdfhnecuffhomhgrihhnpegtphhs
    qdhvvggtrdhssgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:aYf6Yxqp5mLFcBlUtBq7pwOEJev9vGruCCkf68ZkyB-cAFa8UczUbA>
    <xmx:aYf6Y2ogXwRrW5Z2dLR-9flRnOf2Ujxs6zgIT3lBGPG3QrUK8FNiRQ>
    <xmx:aYf6Y3SlPqLoykh99NxaLmW3nOoUgW4EWPnO4O0ufG1CTXzKrlvESw>
    <xmx:aYf6Y7D927SrteBBYoRXApAOyjzMCQMItYT5SSIK3Q9FPQzrF4xiGg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Feb 2023 17:10:48 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 1/2] MIPS: smp-cps: Don't rely on CP0_CMGCRBASE
Date:   Sat, 25 Feb 2023 22:10:07 +0000
Message-Id: <20230225221008.8520-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230225221008.8520-1-jiaxun.yang@flygoat.com>
References: <20230225221008.8520-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CP0_CMGCRBASE is not always available on CPS enabled system
such as early proAptiv.

We patch the entry of CPS NMI vector to inject CMGCR address
directly into register during early core bringup.

For VPE bringup as the core is already coherenct at that point
we just read the variable to obtain the address.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/smp-cps.h |  4 ++++
 arch/mips/kernel/cps-vec.S      | 35 ++++++++++++++-------------------
 arch/mips/kernel/smp-cps.c      |  2 ++
 3 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/arch/mips/include/asm/smp-cps.h b/arch/mips/include/asm/smp-cps.h
index 7e5b9411faee..22a572b70fe3 100644
--- a/arch/mips/include/asm/smp-cps.h
+++ b/arch/mips/include/asm/smp-cps.h
@@ -7,6 +7,8 @@
 #ifndef __MIPS_ASM_SMP_CPS_H__
 #define __MIPS_ASM_SMP_CPS_H__
 
+#define CPS_ENTRY_PATCH_INSNS	6
+
 #ifndef __ASSEMBLY__
 
 struct vpe_boot_config {
@@ -30,6 +32,8 @@ extern void mips_cps_boot_vpes(struct core_boot_config *cfg, unsigned vpe);
 extern void mips_cps_pm_save(void);
 extern void mips_cps_pm_restore(void);
 
+extern void *mips_cps_core_entry_patch_end;
+
 #ifdef CONFIG_MIPS_CPS
 
 extern bool mips_cps_smp_in_use(void);
diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
index 975343240148..fece0cca5548 100644
--- a/arch/mips/kernel/cps-vec.S
+++ b/arch/mips/kernel/cps-vec.S
@@ -13,6 +13,7 @@
 #include <asm/mipsregs.h>
 #include <asm/mipsmtregs.h>
 #include <asm/pm.h>
+#include <asm/smp-cps.h>
 
 #define GCR_CPC_BASE_OFS	0x0088
 #define GCR_CL_COHERENCE_OFS	0x2008
@@ -80,25 +81,20 @@
 	 nop
 	.endm
 
-	/* Calculate an uncached address for the CM GCRs */
-	.macro	cmgcrb	dest
-	.set	push
-	.set	noat
-	MFC0	$1, CP0_CMGCRBASE
-	PTR_SLL	$1, $1, 4
-	PTR_LI	\dest, UNCAC_BASE
-	PTR_ADDU \dest, \dest, $1
-	.set	pop
-	.endm
 
 .balign 0x1000
 
 LEAF(mips_cps_core_entry)
 	/*
-	 * These first 4 bytes will be patched by cps_smp_setup to load the
-	 * CCA to use into register s0.
+	 * These first several instructions will be patched by cps_smp_setup to load the
+	 * CCA to use into register s0 and GCR base address to register s1.
 	 */
-	.word	0
+	.rept   CPS_ENTRY_PATCH_INSNS
+    nop
+   .endr
+
+	.global mips_cps_core_entry_patch_end
+mips_cps_core_entry_patch_end:
 
 	/* Check whether we're here due to an NMI */
 	mfc0	k0, CP0_STATUS
@@ -121,8 +117,7 @@ not_nmi:
 	mtc0	t0, CP0_STATUS
 
 	/* Skip cache & coherence setup if we're already coherent */
-	cmgcrb	v1
-	lw	s7, GCR_CL_COHERENCE_OFS(v1)
+	lw	s7, GCR_CL_COHERENCE_OFS(s1)
 	bnez	s7, 1f
 	 nop
 
@@ -132,7 +127,7 @@ not_nmi:
 
 	/* Enter the coherent domain */
 	li	t0, 0xff
-	sw	t0, GCR_CL_COHERENCE_OFS(v1)
+	sw	t0, GCR_CL_COHERENCE_OFS(s1)
 	ehb
 
 	/* Set Kseg0 CCA to that in s0 */
@@ -305,8 +300,7 @@ LEAF(mips_cps_core_init)
  */
 LEAF(mips_cps_get_bootcfg)
 	/* Calculate a pointer to this cores struct core_boot_config */
-	cmgcrb	t0
-	lw	t0, GCR_CL_ID_OFS(t0)
+	lw	t0, GCR_CL_ID_OFS(s1)
 	li	t1, COREBOOTCFG_SIZE
 	mul	t0, t0, t1
 	PTR_LA	t1, mips_cps_core_bootcfg
@@ -366,8 +360,9 @@ LEAF(mips_cps_boot_vpes)
 	has_vp	t0, 5f
 
 	/* Find base address of CPC */
-	cmgcrb	t3
-	PTR_L	t1, GCR_CPC_BASE_OFS(t3)
+	PTR_LA	t1, mips_gcr_base
+	PTR_L	t1, 0(t1)
+	PTR_L	t1, GCR_CPC_BASE_OFS(t1)
 	PTR_LI	t2, ~0x7fff
 	and	t1, t1, t2
 	PTR_LI	t2, UNCAC_BASE
diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index f2df0cae1b4d..4fc288bb85b9 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -162,6 +162,8 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
 	 */
 	entry_code = (u32 *)&mips_cps_core_entry;
 	uasm_i_addiu(&entry_code, 16, 0, cca);
+	UASM_i_LA(&entry_code, 17, (long)mips_gcr_base);
+	BUG_ON((void *)entry_code > (void *)&mips_cps_core_entry_patch_end);
 	blast_dcache_range((unsigned long)&mips_cps_core_entry,
 			   (unsigned long)entry_code);
 	bc_wback_inv((unsigned long)&mips_cps_core_entry,
-- 
2.37.1 (Apple Git-137.1)

