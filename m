Return-Path: <linux-mips+bounces-3693-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBEA909DB9
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 15:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58460281C2B
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 13:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E92B18F2D8;
	Sun, 16 Jun 2024 13:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="q0avPZ/e";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RqA2k1Ht"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh1-smtp.messagingengine.com (wfhigh1-smtp.messagingengine.com [64.147.123.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72D718C357;
	Sun, 16 Jun 2024 13:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718544346; cv=none; b=np26vVRhewmEIGoAxzXGiVnH7TEQHiwlWYboFmZgyq8IWcsCCvbo52QRlBAEgrC4OqC6l55Lwe9aWqVKTFT+NIMSUqQJqwZ5iJyViZJOOwwybTbhL8wYOYpOcIQ4hAGHaU1oWkM8ygnPTbb1XbCsFQhk84+FayhYHmREDYsC0Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718544346; c=relaxed/simple;
	bh=7cSLBtKRq6YaTXhaLa0m+ISxtSQg5UXm3uggSRQ815c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IQ5D8nK/ubC58AfBR2VSeE0YKH4ZZfDvkuExlwJZ7BFbZe03K3cwCVR+CnIQV9ob7j78MJeB0lV3FxQaftqqTFCHz576AapueIa1yzIjDxBYhIR27F2XbiiJ5ufgmzrXiZMLEBRLeVI/2sWhFurLM7xq1UCQCLgXQItejoSMPAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=q0avPZ/e; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RqA2k1Ht; arc=none smtp.client-ip=64.147.123.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.west.internal (Postfix) with ESMTP id B73391800096;
	Sun, 16 Jun 2024 09:25:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sun, 16 Jun 2024 09:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718544343;
	 x=1718630743; bh=tw7w9ixWV3+oEg9VLDWnKLUZs2qogH7m1+lmuT9GE80=; b=
	q0avPZ/eZ5wiMUBAU+Os86HZICqxdJmjqhPPz295NBrtVdrE/qm410KLQBJzd90Y
	8+Dp6LSKCb+7+SP09zAl0ABfNDfDAOJLD8H1fhcccLR/yX0lCumw10i6OD2Nt88b
	5fxr2a+VYWLNCQS+3ZJKTN/BOnHqCsSqtdB4LfkyLn228u/0WqPdCXRdEbEAs1zk
	awBoSi/Q5Y3hv2qftNgDZqai4ReRgEuMNJWk2fS5dK4M0Nyt7ouUQvNmZaNDnlna
	J8dkJLHMBSUzcaMSyF1NmWBb7eKZbyFcds2nu4JkKt06YvkCdragljpTzeKeMjZf
	zYnUewJebIQPy1+9CcWHXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718544343; x=
	1718630743; bh=tw7w9ixWV3+oEg9VLDWnKLUZs2qogH7m1+lmuT9GE80=; b=R
	qA2k1Ht3ZjujjY7TU4JDU8KdmUBYeOLchvBRrY8+6iwqUzxkms/7bGVHNVS14+ek
	Mu1rjTgQLB2W8Zcq/QZu1HSwaNhscMrBjSb4N9muBOlFf4ZI09MLneDd+4AEOYP4
	8QCKTSgq2JVQ/b6d+UEQVnm8mCWxEoEuAY3p00GFgO+eofvooatoza/YhQGcNmcK
	nww8Vkfs1A/8Mc5UKropLz/gN68FMhYgcL4cc55oueehU0pWIg7wS0bJjUx/YwVB
	YqSmPiG/qPk/LfBN/GFG3nexoUCrgy2NohsB32F3ZY/cOGz30pr5NEDpT0KKz16b
	1gyvDpcNHSJH42o+rLSsg==
X-ME-Sender: <xms:1-duZoYyIBDcOLVY2OwVOzNUjj-KKjy7G7z7Q3oo6O3jT_ujOtrAmQ>
    <xme:1-duZjYDmNpO_uIpEnkFq_Vz9GgYhlkGCFytHPa19mQle0q724BgZnSW4PtcuHR4U
    nyO_h63O5YkfPiiwnM>
X-ME-Received: <xmr:1-duZi86xGZg-zYBpzW7M1sN0h8aNiP8dOYvvES-x4741WikPH6dT2U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvfedgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnheptdevhfehgefgleeikedukefhgeejveeltdduleettdeigfel
    geegudelleekjedvnecuffhomhgrihhnpegtphhsqdhvvggtrdhssgenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhg
    sehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:1-duZipsCri9GdcgTjAiKxWy9Le8cEYILImlFuJpD_CHOqBh8III2g>
    <xmx:1-duZjqOmRg3xYt6CTRz4E91cxJHAN3PkFCWLuZs1kRpbZQZr0pVRA>
    <xmx:1-duZgRHiFlSnTqtzw8GDviTbW94-GK6eKzdi-oQ_SQTlhU8KHNcDg>
    <xmx:1-duZjpmIfEeD4TABoLcJm1c77BmzwpLd9Ejz9LIhxiHTfBYgtKueA>
    <xmx:1-duZkBFqIT98PJAFJEv069vDT3UVTpWFWkXnwNCH8jWXDodh90J16Fl>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Jun 2024 09:25:42 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 16 Jun 2024 14:25:04 +0100
Subject: [PATCH fixes 3/4] MIPS: cps-vec: Replace MT instructions with
 macros
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240616-mips-mt-fixes-v1-3-83913e0e60fc@flygoat.com>
References: <20240616-mips-mt-fixes-v1-0-83913e0e60fc@flygoat.com>
In-Reply-To: <20240616-mips-mt-fixes-v1-0-83913e0e60fc@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3851;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=7cSLBtKRq6YaTXhaLa0m+ISxtSQg5UXm3uggSRQ815c=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrS85xcDT2U/WrB+8SLdwMJpxuzJUTJyO3Z/K9T7umZzg
 Uxy3T6fjlIWBjEuBlkxRZYQAaW+DY0XF1x/kPUHZg4rE8gQBi5OAZjIInVGhlX7pi1OeOPmEDPp
 NOtaXVbVaRrMy4pTDN5sMa/s6fre/pWR4doKZdk247O1W+cWfpOUVFFOO7FN0IFJk0n62G/26Jj
 JvAA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Replace MT instructions with macros to deal with assemblers
not supporting MT ASE properly.

Remove all .set mt as they are going to be handled in macros.

Cc: stable@vger.kernel.org
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/cps-vec.S | 62 ++++++++++++++++++----------------------------
 1 file changed, 24 insertions(+), 38 deletions(-)

diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
index f876309130ad..5a4120ce4a56 100644
--- a/arch/mips/kernel/cps-vec.S
+++ b/arch/mips/kernel/cps-vec.S
@@ -195,15 +195,11 @@ LEAF(mips_cps_core_init)
 	/* Check that the core implements the MT ASE */
 	has_mt	t0, 3f
 
-	.set	push
-	.set	MIPS_ISA_LEVEL_RAW
-	.set	mt
-
 	/* Only allow 1 TC per VPE to execute... */
-	dmt
+	_dmt
 
 	/* ...and for the moment only 1 VPE */
-	dvpe
+	_dvpe
 	PTR_LA	t1, 1f
 	jr.hb	t1
 	 nop
@@ -231,20 +227,20 @@ LEAF(mips_cps_core_init)
 	ehb
 
 	/* Bind TC to VPE (1:1 TC:VPE mapping) */
-	mttc0	ta1, CP0_TCBIND
+	_mttc0	ta1, CP0_TCBIND
 
 	/* Set exclusive TC, non-active, master */
 	li	t0, VPECONF0_MVP
 	sll	t1, ta1, VPECONF0_XTC_SHIFT
 	or	t0, t0, t1
-	mttc0	t0, CP0_VPECONF0
+	_mttc0	t0, CP0_VPECONF0
 
 	/* Set TC non-active, non-allocatable */
-	mttc0	zero, CP0_TCSTATUS
+	_mttc0	zero, CP0_TCSTATUS
 
 	/* Set TC halted */
 	li	t0, TCHALT_H
-	mttc0	t0, CP0_TCHALT
+	_mttc0	t0, CP0_TCHALT
 
 	/* Next VPE */
 	addiu	ta1, ta1, 1
@@ -257,7 +253,7 @@ LEAF(mips_cps_core_init)
 	xori	t0, t0, MVPCONTROL_VPC
 	mtc0	t0, CP0_MVPCONTROL
 
-3:	.set	pop
+3:
 #endif
 	jr	ra
 	 nop
@@ -353,11 +349,7 @@ LEAF(mips_cps_boot_vpes)
 	has_mt	t0, 5f
 
 	/* Enter VPE configuration state */
-	.set	push
-	.set	MIPS_ISA_LEVEL_RAW
-	.set	mt
-	dvpe
-	.set	pop
+	_dvpe
 
 	PTR_LA	t1, 1f
 	jr.hb	t1
@@ -384,12 +376,8 @@ LEAF(mips_cps_boot_vpes)
 	mtc0	t0, CP0_VPECONTROL
 	ehb
 
-	.set	push
-	.set	MIPS_ISA_LEVEL_RAW
-	.set	mt
-
 	/* Skip the VPE if its TC is not halted */
-	mftc0	t0, CP0_TCHALT
+	_mftc0	t0, CP0_TCHALT
 	beqz	t0, 2f
 	 nop
 
@@ -400,19 +388,19 @@ LEAF(mips_cps_boot_vpes)
 
 	/* Set the TC restart PC */
 	lw	t1, VPEBOOTCFG_PC(t0)
-	mttc0	t1, CP0_TCRESTART
+	_mttc0	t1, CP0_TCRESTART
 
 	/* Set the TC stack pointer */
 	lw	t1, VPEBOOTCFG_SP(t0)
-	mttgpr	t1, sp
+	_mttgpr	t1, sp
 
 	/* Set the TC global pointer */
 	lw	t1, VPEBOOTCFG_GP(t0)
-	mttgpr	t1, gp
+	_mttgpr	t1, gp
 
 	/* Copy config from this VPE */
 	mfc0	t0, CP0_CONFIG
-	mttc0	t0, CP0_CONFIG
+	_mttc0	t0, CP0_CONFIG
 
 	/*
 	 * Copy the EVA config from this VPE if the CPU supports it.
@@ -423,30 +411,30 @@ LEAF(mips_cps_boot_vpes)
 	beqz	t0, 3f
 	 nop
 	mfc0    t0, CP0_SEGCTL0
-	mttc0	t0, CP0_SEGCTL0
+	_mttc0	t0, CP0_SEGCTL0
 	mfc0    t0, CP0_SEGCTL1
-	mttc0	t0, CP0_SEGCTL1
+	_mttc0	t0, CP0_SEGCTL1
 	mfc0    t0, CP0_SEGCTL2
-	mttc0	t0, CP0_SEGCTL2
+	_mttc0	t0, CP0_SEGCTL2
 3:
 	/* Ensure no software interrupts are pending */
-	mttc0	zero, CP0_CAUSE
-	mttc0	zero, CP0_STATUS
+	_mttc0	zero, CP0_CAUSE
+	_mttc0	zero, CP0_STATUS
 
 	/* Set TC active, not interrupt exempt */
-	mftc0	t0, CP0_TCSTATUS
+	_mftc0	t0, CP0_TCSTATUS
 	li	t1, ~TCSTATUS_IXMT
 	and	t0, t0, t1
 	ori	t0, t0, TCSTATUS_A
-	mttc0	t0, CP0_TCSTATUS
+	_mttc0	t0, CP0_TCSTATUS
 
 	/* Clear the TC halt bit */
-	mttc0	zero, CP0_TCHALT
+	_mttc0	zero, CP0_TCHALT
 
 	/* Set VPE active */
-	mftc0	t0, CP0_VPECONF0
+	_mftc0	t0, CP0_VPECONF0
 	ori	t0, t0, VPECONF0_VPA
-	mttc0	t0, CP0_VPECONF0
+	_mttc0	t0, CP0_VPECONF0
 
 	/* Next VPE */
 2:	srl	ta2, ta2, 1
@@ -459,9 +447,7 @@ LEAF(mips_cps_boot_vpes)
 	xori	t1, t1, MVPCONTROL_VPC
 	mtc0	t1, CP0_MVPCONTROL
 	ehb
-	evpe
-
-	.set	pop
+	_evpe
 
 	/* Check whether this VPE is meant to be running */
 	li	t0, 1

-- 
2.43.0


