Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD3756C2F71
	for <lists+linux-mips@lfdr.de>; Tue, 21 Mar 2023 11:49:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230401AbjCUKtS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Mar 2023 06:49:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230407AbjCUKtM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Mar 2023 06:49:12 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31106126F0
        for <linux-mips@vger.kernel.org>; Tue, 21 Mar 2023 03:49:06 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 015E13200A02;
        Tue, 21 Mar 2023 06:49:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 21 Mar 2023 06:49:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1679395743; x=
        1679482143; bh=3beb82SqiYS2n6dz7p6pEHAgtFxVZicldG9GEDqYiDc=; b=Q
        KuqsQnv4pjs+8264BWBjYyvs1FvjGdTsiBHb9MAvnEOL0N4i3uks0SjqFwSWBcGK
        HKStEP9koozAS3/alVuv5DcCCaLN1cgJBrYV7ANLRj20U03f8XIx+u6YfheBQ81i
        QddRy9Jn26zuPNR2gaKysA8MtYKlRPoX+ckAnENu4+72ga51E75BD7u2HZ33uIAj
        jiHgrs1YjfRZ4lUc59tEqLdHNLFIm900DY9YBmUizP04aySh1REBfTQtiir0lqK6
        YN7XaKrmr5kwmVAQlDnAah+nSIuCr5dkucabrg1OZlBif8dQ1XvXfm4YJISKqtKv
        XGmmuGTTJdCD8ySFI1B0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679395743; x=
        1679482143; bh=3beb82SqiYS2n6dz7p6pEHAgtFxVZicldG9GEDqYiDc=; b=S
        yA7hH+YbsI24A4fRpzZyhoairbyvCO9/i5lYf5UxaAFG2msm5ugsmxzMRFklBD50
        q//3ESvJhU9AiGSjxZ9/WCugkoNlgBbnyHYwAqW7SPecF+J2ekReqNgXtRFrC6na
        sZDjhI8/Qa3wqPSKXaSLTICP8OjnhiqJgNeYN9/qafQpoU3GIsCVg6wYK4CH6Vfd
        joU5ryCELI/qb9++BNVROTjUtu2y6aTkJToMG+BeOKYLxj8TSErQHIsIxBJkwq0z
        zPYhnV7BrwP+U/+VvPPiNWSW/WjPN0vk6Is82XSCDmZG6qdVhcalitmEMPyg+OOl
        VpyTZvmsqFNtyDNEy6+Iw==
X-ME-Sender: <xms:n4sZZG-an_XBW1SYMLD3AAtZFKSCYY-9W8yfGlcJ4FNQiasSnoO29g>
    <xme:n4sZZGuX_uHW_iw1JsAHh8TUz0FATopOi2VaToaQkZ4sQV9JkwVTq8ZYYxXkx4Nm-
    b5VGZ-w7zgHV8Mt6Kg>
X-ME-Received: <xmr:n4sZZMDydE0ynjYwvsH_RGNKhqJjX-urJaGXwMsPwQj4ItsSqEu_T2VHDm5ufz-caU-HE3ERldk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvefgtdelgeduheegie
    dujedtgfetvddujeelveehudfhvdeigedtvddvveffvdfhnecuffhomhgrihhnpegtphhs
    qdhvvggtrdhssgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:n4sZZOdHx5r2_8RGQvVu8_PY3kyHDyv3Xfb9qpnKU7w7PyWzqZRkFw>
    <xmx:n4sZZLPrqsjsup34NcVwR00LtK8vGZiRaE7OUuBSIDdjI83pTOVAGg>
    <xmx:n4sZZInJcwT_mCewYuf9_8SdryJZ8o8D65dPZes-wSCvv6NVi-QFPQ>
    <xmx:n4sZZArmoMrgpqySDIAWsJfKVM7ovDXdULydauswUeFzYWGChZKyHQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 06:49:02 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        sergei.shtylyov@gmail.com, aleksander.lobakin@intel.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 02/12] MIPS: smp-cps: Disable coherence setup for unsupported ISA
Date:   Tue, 21 Mar 2023 10:48:42 +0000
Message-Id: <20230321104852.25284-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230321104852.25284-1-jiaxun.yang@flygoat.com>
References: <20230321104852.25284-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We don't know how to do coherence setup on ISA before MIPS
Release 1.

As CPS support only servers simulation purpose on those cores,
and simulators are always coherent, just disable initialization
code and provide user a warning in case coherence is not setup
properly.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/cps-vec.S | 5 +++++
 arch/mips/kernel/smp-cps.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
index 8ef492da827f..64ecfdac6580 100644
--- a/arch/mips/kernel/cps-vec.S
+++ b/arch/mips/kernel/cps-vec.S
@@ -116,6 +116,8 @@ not_nmi:
 	li	t0, ST0_CU1 | ST0_CU0 | ST0_BEV | STATUS_BITDEPS
 	mtc0	t0, CP0_STATUS
 
+	/* We don't know how to do coherence setup on earlier ISA */
+#if MIPS_ISA_REV > 0
 	/* Skip cache & coherence setup if we're already coherent */
 	lw	s7, GCR_CL_COHERENCE_OFS(s1)
 	bnez	s7, 1f
@@ -129,6 +131,7 @@ not_nmi:
 	li	t0, 0xff
 	sw	t0, GCR_CL_COHERENCE_OFS(s1)
 	ehb
+#endif /* MIPS_ISA_REV > 0 */
 
 	/* Set Kseg0 CCA to that in s0 */
 1:	mfc0	t0, CP0_CONFIG
@@ -515,6 +518,7 @@ LEAF(mips_cps_boot_vpes)
 	 nop
 	END(mips_cps_boot_vpes)
 
+#if MIPS_ISA_REV > 0
 LEAF(mips_cps_cache_init)
 	/*
 	 * Clear the bits used to index the caches. Note that the architecture
@@ -588,6 +592,7 @@ dcache_done:
 	jr	ra
 	 nop
 	END(mips_cps_cache_init)
+#endif /* MIPS_ISA_REV > 0 */
 
 #if defined(CONFIG_MIPS_CPS_PM) && defined(CONFIG_CPU_PM)
 
diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index 4fc288bb85b9..f968a319d87f 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -361,6 +361,8 @@ static int cps_boot_secondary(int cpu, struct task_struct *idle)
 
 static void cps_init_secondary(void)
 {
+	int core = cpu_core(&current_cpu_data);
+
 	/* Disable MT - we only want to run 1 TC per VPE */
 	if (cpu_has_mipsmt)
 		dmt();
@@ -376,6 +378,9 @@ static void cps_init_secondary(void)
 		BUG_ON(ident != mips_cm_vp_id(smp_processor_id()));
 	}
 
+	if (core > 0 && !read_gcr_cl_coherence())
+		pr_warn("Core %u is not in coherent domain\n", core);
+
 	if (cpu_has_veic)
 		clear_c0_status(ST0_IM);
 	else
-- 
2.37.1 (Apple Git-137.1)

