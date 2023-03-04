Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39D386AACE6
	for <lists+linux-mips@lfdr.de>; Sat,  4 Mar 2023 23:15:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbjCDWPk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 4 Mar 2023 17:15:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjCDWPi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 4 Mar 2023 17:15:38 -0500
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D1B913D4C
        for <linux-mips@vger.kernel.org>; Sat,  4 Mar 2023 14:15:37 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 934045C00A3;
        Sat,  4 Mar 2023 17:15:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 04 Mar 2023 17:15:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1677968136; x=
        1678054536; bh=VeDodKZEgELcf7cULKp+pzsVOFJzzBJRdNWzyJCeFOo=; b=L
        UzeOps1ul0MKFj4NkTI0E0dSg8oaQs3ZVBAGcl4zcSRbAcQTzM/KlKIIMEMNCb38
        BjqIbgzffLz+VND+2X/cZYeOGcZXiIE1vGgpCkE6ISIXE/AbE1RoX5JleleptIIs
        LBc1/IszrpKtPIMWlNVlKq7nxbd12q1NqwmzsWJAEmBAp6S8u7WGsMT5I7Ecp9fI
        pQjG8KssQfnuIzsZcri9C/Y5JkMcrLuOhdFBQEhwWAM+UBQHVYrEfRsOMG75ICCk
        e/B0pVRyJUbDDVYq7lL4enMzZ3N8I6qf9E5Vv5BSCLT9rQBMuzbET0AiMvgtdVMU
        2d9gKxtKiPcKhs+H39rjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677968136; x=
        1678054536; bh=VeDodKZEgELcf7cULKp+pzsVOFJzzBJRdNWzyJCeFOo=; b=Z
        JhfkK50AQLmDdj9rffqltpIObB6xU50yaOlNtG4f1PonKB61dLzfjz6pjpNXLNBZ
        4dCKfOsojXhnDEU9Ddt+GLAh29eS2KAHDy03T6TuUr9SoSPbuxZRaSsR8g19nhLS
        UAhDN6kQwh9xgxkyEH+/I3GdKLCd7+2+/QYqZ6dviksvZ6gZGn9o/0/H3+GRh9qt
        ewpLZ+TIWoVse7MZ9sbPvQd6xyJsr1d611yV/wZ/KOett1ZHMQT0MlYwH+x2yZUq
        jIbPBgC9JUPVgjXuja3u/M6DwllqPpa42dEjz3feK2ZG8jhAJA3+245onwMjC6ov
        gywPu6aldyv1pGRyEOUsA==
X-ME-Sender: <xms:CMMDZCTzfzGHliQwbDwJI8VWff7_aMnff2_dcQNOUrvukdkU6A31qQ>
    <xme:CMMDZHz6Eq0Ip3D2hn9u57xwhLbzYGpdkBSxh4uuQFa3S-xoKeK32vTUb_wVPeq0i
    FgToYI_FKKkbP8pBto>
X-ME-Received: <xmr:CMMDZP1m0CfbWyEpkrq65GW68LB5qYEz_HGOAyokJK0dmtVV4gSjPc3MCQ6q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtuddgudehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
    nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeevgfdtleegudehge
    eiudejtdfgtedvudejleevheduhfdvieegtddvvdevffdvhfenucffohhmrghinheptghp
    shdqvhgvtgdrshgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:CMMDZOCTYsw8ICaquTL5KQVMCyU5HGgJpDjw8UB-VzC9ynanVS4qjg>
    <xmx:CMMDZLj6l2X7-VvNEIg29Tp8y8nxeltvNdCHIS6bsf2BY2_ctnBO5Q>
    <xmx:CMMDZKqsff_Cavwf0ET7259oGmzmlZ-7bN9TtA_j4786NbDyShjULg>
    <xmx:CMMDZOumsr4HrDcamBvLG8NnAu0oi7TNSWJId_48QAvdBjc392b4QA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Mar 2023 17:15:35 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 02/12] MIPS: smp-cps: Disable coherence setup for unsupported ISA
Date:   Sat,  4 Mar 2023 22:15:14 +0000
Message-Id: <20230304221524.47160-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230304221524.47160-1-jiaxun.yang@flygoat.com>
References: <20230304221524.47160-1-jiaxun.yang@flygoat.com>
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
2.34.1

