Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 887D56C2F7D
	for <lists+linux-mips@lfdr.de>; Tue, 21 Mar 2023 11:50:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbjCUKuB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Mar 2023 06:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230390AbjCUKta (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Mar 2023 06:49:30 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCE1E144A7
        for <linux-mips@vger.kernel.org>; Tue, 21 Mar 2023 03:49:15 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 0570B3200C60;
        Tue, 21 Mar 2023 06:49:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 21 Mar 2023 06:49:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1679395754; x=
        1679482154; bh=fmG8dWXQ7pHMMP2xYjVfIWmx6wEOq6Ki/8U5IymqAo4=; b=n
        +AZ9aWe2Jaaw07L3iwZMfGenZvgB74DE1n+53ZnLHM172gYrYQSNyG1RSnPoByei
        qAgFaDyVNEQaICQEzH54JfPZYr24aIJ27j/8Ey3N+KOokwe8y90zPvZrOSw4WNnC
        a32Ikes01FsWy3IsqV/rH4Q4Eonh9qYggaHDH6sDHEN4M+sCIiT04M5tBV4pJuVU
        B+EIikBp+iud7PEuOUmvk2KsGPhxTqvkAgkuwpJoecRepZQVO6cQqChG3XqT70yR
        cuPeNgu//hdFvsm/9VrP5IqMNiFlXhlz/v+LKcElOyALFxdC6yclp2nbUZm8vEoy
        ZAYZC7XBj6e9/vA9t0WiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679395754; x=
        1679482154; bh=fmG8dWXQ7pHMMP2xYjVfIWmx6wEOq6Ki/8U5IymqAo4=; b=B
        Qhw+J8HpVkDH2rJhglRM8EoQq00S+kW3/7D6Z/BpT6CtHbunop6YfbjY/k4RcpoX
        Ot0GTpUgOiMj/29nIbjuz270ayHrIRlF4xL0dJlksLdaSIhxT00PWaW8pVPv42y2
        1DqXK/N9N21wknIiBPv1UrYK+8jGT2JzI1Ytpko5Y5/Pzia7P0enZCkA7I8OhMW5
        pP4YccTDGi+YB3abbgj2een6wwkqNYV9E6LMJh5XaV0W/F7te54AbEW7bl2K9N+m
        bSY934hlYxMwJAJGjrH3jSCQWYbjRqks8lfZYRECx285uoiViCrYm2x4+YLtosKq
        c2kj1m3sLUyPmYKhy2XwA==
X-ME-Sender: <xms:qosZZHTjNv-sr2zwVV-78pvADzauEy2SN0tjxNIHNukrUCDzEMOdcg>
    <xme:qosZZIwsn4mHD0JJpZmbAxxfK68HKfTCijQTkX5LBHr5Dczi4hjwaTQw0AV-vdKFY
    f0kJjIZic-l0c6_zPk>
X-ME-Received: <xmr:qosZZM0XPAtM47_1upF-FVkiWzNMdeLykboLRdBV0DkMvWoWzYVoyLYnUVnciVGiTeY81cbIp2I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgepvdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:qosZZHC818HtsNBR1812uSVgRSLeJYlSqoIQ9o8Uy9Kl-t5h1vTi8g>
    <xmx:qosZZAigq29cIXGAF78wfbHdS2XXQMIf2-AznYR3A-9Qhvkytap2ZA>
    <xmx:qosZZLrvILbF1NIDWdEvyuJUkjTuuXP8ZdR30iUzNMg0tG_6_U4bkA>
    <xmx:qosZZIeNsd4EX01V6ksMZPvIF8Hmh8BrXwBA_uWouDrjplZ29h3sWA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 06:49:13 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        sergei.shtylyov@gmail.com, aleksander.lobakin@intel.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 07/12] MIPS: Octeon: Allow CVMSEG to be disabled
Date:   Tue, 21 Mar 2023 10:48:47 +0000
Message-Id: <20230321104852.25284-8-jiaxun.yang@flygoat.com>
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

Don't include cvmseg states into thread_status when
CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE is not defined or 0.

Fix compile for kernel without this feature.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/processor.h | 7 ++++++-
 arch/mips/kernel/asm-offsets.c    | 3 +++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/processor.h b/arch/mips/include/asm/processor.h
index 3fde1ff72bd1..ae2cd37a38f0 100644
--- a/arch/mips/include/asm/processor.h
+++ b/arch/mips/include/asm/processor.h
@@ -202,11 +202,13 @@ struct octeon_cop2_state {
 #define COP2_INIT						\
 	.cp2			= {0,},
 
+#if defined(CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE) && \
+	CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE > 0
 struct octeon_cvmseg_state {
 	unsigned long cvmseg[CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE]
 			    [cpu_dcache_line_size() / sizeof(unsigned long)];
 };
-
+#endif
 #else
 #define COP2_INIT
 #endif
@@ -263,7 +265,10 @@ struct thread_struct {
 	unsigned long trap_nr;
 #ifdef CONFIG_CPU_CAVIUM_OCTEON
 	struct octeon_cop2_state cp2 __attribute__ ((__aligned__(128)));
+#if defined(CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE) && \
+	CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE > 0
 	struct octeon_cvmseg_state cvmseg __attribute__ ((__aligned__(128)));
+#endif
 #endif
 	struct mips_abi *abi;
 };
diff --git a/arch/mips/kernel/asm-offsets.c b/arch/mips/kernel/asm-offsets.c
index c4501897b870..40fd4051bb3d 100644
--- a/arch/mips/kernel/asm-offsets.c
+++ b/arch/mips/kernel/asm-offsets.c
@@ -306,7 +306,10 @@ void output_octeon_cop2_state_defines(void)
 	OFFSET(OCTEON_CP2_HSH_IVW,	octeon_cop2_state, cop2_hsh_ivw);
 	OFFSET(OCTEON_CP2_SHA3,		octeon_cop2_state, cop2_sha3);
 	OFFSET(THREAD_CP2,	task_struct, thread.cp2);
+#if defined(CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE) && \
+    CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE > 0
 	OFFSET(THREAD_CVMSEG,	task_struct, thread.cvmseg.cvmseg);
+#endif
 	BLANK();
 }
 #endif
-- 
2.37.1 (Apple Git-137.1)

