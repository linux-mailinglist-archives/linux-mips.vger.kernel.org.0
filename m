Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 045F86A4A27
	for <lists+linux-mips@lfdr.de>; Mon, 27 Feb 2023 19:46:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbjB0Sqj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Feb 2023 13:46:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbjB0Sqh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Feb 2023 13:46:37 -0500
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABD6A20D1D
        for <linux-mips@vger.kernel.org>; Mon, 27 Feb 2023 10:46:35 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 237E35C0176;
        Mon, 27 Feb 2023 13:46:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 27 Feb 2023 13:46:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1677523595; x=1677609995; bh=Fp
        V78fFo0s9AR62nBoGMoo15WHWxCy7jecguslhe4pw=; b=lads4z3ac9vPaaMoqQ
        S/26EVjjBkGOWLdTaDBOBxkDh9aZy/bufn7vHmRCBf3ODC2FvKGdjbMYoN6s25N3
        vn3KIo47fJAZCfw7K/BBk+kP/VTh4aG+dwoU3BviKJhdZ2MzBiEOXYxm7D4aZySQ
        pNCMqvYAjOnpvhgU0Kpiwt4WhrMHkgQ12LfW/mg7ttf9LnXfxq6PsmK+0qM7/bNp
        d4TMJG8gZmzPuGeQ6X3CWKlcCHfwNopHeBBzjehxdjn6XzLqKa2MSy6MPj1G/Qp8
        XHUQGOb1NDVWUdlUzLV+Mc+dEK98K0FFST/U2jllmYSS6SDniwBfDysM7ALY8LiX
        Y7Yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1677523595; x=1677609995; bh=FpV78fFo0s9AR
        62nBoGMoo15WHWxCy7jecguslhe4pw=; b=cQL5uS0jXHGC/RvUm1opxtjRCQ5vO
        uuy1hAXQRfSa0c9sjL7n5nQwRQH6oO+hwZ59GR8RF6MUSiv0ht2hdLsZScbc7Og1
        B5WD9mRj3HhTKFwt0uYUKE7HoU+Acko9VS2eSdKHzWQD3JcYZhvcNE2Y7OljeSuZ
        7hN7KKG1GfsqxlPwNCvNb8EfcSUAfUdj0cJQUYxvXA3KpNGeCY6Mh2UbcvzIvZNQ
        NiHaRN/cHIMSwI/LRXWMk1gljrIetw7tkHxCbhlYYUECuWpTdtyZNs1iadKIuJuc
        vfYuHGgS6pcydnfV8+KnmDit7b0kGH7yRJsnbi9XjeqT8UTe6bQJarZsA==
X-ME-Sender: <xms:ivr8Y27reYCUY7Qh9DQRk3XRqH2Zxq5ucWh6xW-I4AXjLL0rQyVeTg>
    <xme:ivr8Y_4tzPJ3vXgPeO6Vp5Ba-usCYsJ74uDSfYhaxi5LEYZaitxSdSVwIwhVjR2Ep
    Lx81YQDlw2Z22osobM>
X-ME-Received: <xmr:ivr8Y1chynPrKHKRWcoMn1rp6eKUs4Mzhz-Bfl67BChKAgZOV4K3eORWMrPDQJfFgNlwD9BLFju7ryE3hwO-tnhnWqH8Lhvy3uWcyvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeltddguddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
    nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeevgfdtleegudehge
    eiudejtdfgtedvudejleevheduhfdvieegtddvvdevffdvhfenucffohhmrghinheptghp
    shdqvhgvtgdrshgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:i_r8YzLIG1ohrJVdxYYmUa_UjRaus3p8_BLPp6nFu3aLQtEg0SSQEw>
    <xmx:i_r8Y6LtDHp5amkIGi1D-lOwMcDrWzd6QrplSYMzehB0TiErB4Igqg>
    <xmx:i_r8Y0xWP6O8LVzyWbvkq5m_XznM05VQM6iv9Hdr_EpwkNrtgCNnDQ>
    <xmx:i_r8YxVNd3af0Cbb7JNm-5KimPUlywDH7_sgaPoVZ23K9IAOPomdLA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Feb 2023 13:46:33 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 1/2] MIPS: smp-cps: Don't rely on CP0_CMGCRBASE
Date:   Mon, 27 Feb 2023 18:46:13 +0000
Message-Id: <20230227184614.70026-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230227184614.70026-1-jiaxun.yang@flygoat.com>
References: <20230227184614.70026-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CP0_CMGCRBASE is not always available on CPS enabled system
such as early proAptiv.

For early SMP bring up where we can't safely access memeory,
we patch the entry of CPS NMI vector to inject CMGCR address
directly into register during early core bringup.

For VPE bringup as the core is already coherenct at that point
we just read the variable to obtain the address.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2: State the reason we can't just access variable at early
bring up.
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
index 975343240148..8ef492da827f 100644
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
+	nop
+	.endr
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

