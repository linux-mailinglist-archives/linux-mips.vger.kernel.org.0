Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DDBD6D5BFE
	for <lists+linux-mips@lfdr.de>; Tue,  4 Apr 2023 11:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233706AbjDDJeT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Apr 2023 05:34:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234198AbjDDJeS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Apr 2023 05:34:18 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82050E6E
        for <linux-mips@vger.kernel.org>; Tue,  4 Apr 2023 02:34:15 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id F24495C00C4;
        Tue,  4 Apr 2023 05:34:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 04 Apr 2023 05:34:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1680600854; x=
        1680687254; bh=vm9MFnRr+j14zpHsPFEvIkftXjEwJaloD6JAkeweKqE=; b=K
        ZMi+XWuCb54KxcY2K0kFeL6M601CTwoshV71MQpZkqWn03Gx3Dcr3k4c2Y6CQzcj
        6D+sWFmZEDVAL4nFvU1JLT38mPLn8FEz6/KiVNLYSvzuKpB1mewCgimufEZUJFaW
        6pSysEd43/wJGhqS0gkKR2oMYHdYRP5dWq9k/u/Fs12eZJUUhBeqm4RvwICtmaUV
        L3qSVXjXZG4yn+JuYlqjPEvS5GkZYuMLQAWPLXkCxhHaib8YGMetzoeNmzSUrCas
        NViJuJpi77AMZ15DdYz40kSTDhLt03oy7VbqRj5OtwbAYO8Qlv1NeY79Tul8wnBb
        wARBXV5/xpEKBRfyv5PfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1680600854; x=
        1680687254; bh=vm9MFnRr+j14zpHsPFEvIkftXjEwJaloD6JAkeweKqE=; b=g
        wh/G5IuQ+K9fiJWAbKHK8ZS1gktKKfLg5jD2Acy4rmDJJovz6ipw+TSX08zwr+kr
        tc4QlKw/9GM4atSOuz+wuKzpw9uC6GfQ88h41nSgZK23L3d2ix1Dd0k9j+dsmGBT
        Zav7rIz6186IOg2qt3+JD532OIOZFBIc2SBxdUpoUJl71B15sToKPtehihu08Uqo
        18h/pwDIi3fMjLQqK9l00RlrfqwSs16ydTowq1JGbJkB3YTS2RJea78MqeJ10O5t
        y4Og8fDh99jvOmRaakvnZ34Y+Pzsovn3BXY+lBhuaUuA4yl+M5XjkIbFH4S2q8Gi
        xsiCyxOORdD6MWomxRyWA==
X-ME-Sender: <xms:Fu8rZN48MH7jS7QSrVQUrPBOc7LeiwJFW246KplPaCTbQh3Zav-2Pg>
    <xme:Fu8rZK561_nBwWqED93JdOZ8YQDB6FHQSvv2Kg3o-YeHKieal-sPEofobEHZRFtGS
    UUYSn6UgwCfWHg9khc>
X-ME-Received: <xmr:Fu8rZEfov-yCKi85pNiuPtgpJYLdOIZ7iRODvuHujKy5h5-wRdzTIiSEGc-r>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvefgtdelgeduheegie
    dujedtgfetvddujeelveehudfhvdeigedtvddvveffvdfhnecuffhomhgrihhnpegtphhs
    qdhvvggtrdhssgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:Fu8rZGIcvTBAEsRK8t7ReybIcJgGsu43ry76e0EUoScXHhxQ7Irz7g>
    <xmx:Fu8rZBLmoArz_uQgP-CZgbM5Ib8H35h_0MtkerGASJ0LQzIzkfERHg>
    <xmx:Fu8rZPy9tEr-VtqCmd0erVUSWEePRhumq4yceLH4d0TeCVvTdf4c9Q>
    <xmx:Fu8rZOGU_2xsjURkY30Tcw1X15Ek9XTyc147X97ANuCJsBlaPNM7Cw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 05:34:13 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        sergei.shtylyov@gmail.com, aleksander.lobakin@intel.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 02/12] MIPS: smp-cps: Disable coherence setup for unsupported ISA
Date:   Tue,  4 Apr 2023 10:33:41 +0100
Message-Id: <20230404093351.4233-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230404093351.4233-1-jiaxun.yang@flygoat.com>
References: <20230404093351.4233-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
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
2.39.2 (Apple Git-143)

