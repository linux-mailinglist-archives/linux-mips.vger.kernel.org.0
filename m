Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C6DB6AACEB
	for <lists+linux-mips@lfdr.de>; Sat,  4 Mar 2023 23:15:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbjCDWPo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 4 Mar 2023 17:15:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjCDWPn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 4 Mar 2023 17:15:43 -0500
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB7F316336
        for <linux-mips@vger.kernel.org>; Sat,  4 Mar 2023 14:15:42 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 3515E5C0101;
        Sat,  4 Mar 2023 17:15:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 04 Mar 2023 17:15:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1677968142; x=
        1678054542; bh=fDyL1JljQsZoXFLAXwN//RV19WQQKUijfcIVBv0fh6k=; b=L
        RS2ZXbxNFyHrT3ZMpW1Kb/Xn6dpcCConGmpD8CQ5PANpRxLAa7aeTgC6clNG00Jm
        UN2HMscDDQELfUdAAMg9W797pvPtOGkRsGGKkAKl6znn0gtttMMRg7Irsiz7TJ2O
        I9d3ROTCsG/V54BZ6bJj+gi14sshqRp1bBr9NwB4hqNtF4BxhEN0ZiCJtlNdZEsq
        PZQEGY/cQ7JL29niy3ibMvsZV+PcjNdSl/SM0BaevGl5/VwBpsIDYmpvQhHac4e5
        HrAEf/QQrlOnRH7h66ESWJ/F6d4cLPreARZyj78UprxBvy9d3auETkfSxGhLkLDJ
        /HniLaO/SxT1hy4pUh5dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677968142; x=
        1678054542; bh=fDyL1JljQsZoXFLAXwN//RV19WQQKUijfcIVBv0fh6k=; b=Q
        WjTClmn8oKBHv2CUXoVdjfQSMaOH9GwnMEaxp7lkj/2pqs5fVutohSKaALammG+G
        8Ev0qas0lLQNvWS+tbFSSQWMT2LKRw09dqhYgo8SnIEP2DwutAoW11xDo5zr5Uhx
        /ZY+kUIhDxBnDPFxUw+gs6cRmdOCpCOtb/Ug0Ewi9zmQnSmkDMZR838ODzG9+2UB
        yt71v+SM/NdiVkU1/ZjphPIImWo+rituSs3XmIJs2RtY7/7hQxnJR7Dxu5hHdhJV
        6UFV3XgfviWKhNXESjZt5VDqcKj8LCstV7Qz4wnnN+NafAic9Xoe3Zg4KZK9Bdsp
        Ot1gcsyC+zPv1QECYvWjw==
X-ME-Sender: <xms:DsMDZIVY_pR7Orz0DqQJfsxRydCskD08rfIlri4NjPlR8yEXQIgL5g>
    <xme:DsMDZMlKZSye2z5WHadrKd1Lzd5_Me-mrGIJ6ZV9iDxEPJCFaDAQE62rZu51QB9qD
    BklOcO3Kqp9aMW-HSo>
X-ME-Received: <xmr:DsMDZMbF_R6zzH7yUiCr381Rmli23EaT6s1b5ee4YQqXYMpQ0a9tuByJbYhL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtuddgudehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
    nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefledufeehgedvue
    dvvdegkefgvddttedtleeiiefhgeetudegkefhvdfhjeeftdenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
    ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:DsMDZHWFKH0aY4VMKKSq9tr0XC8ZSfT0mpabmaHfKfi3j65TlSoVnw>
    <xmx:DsMDZCm1R2xQvKUkEKGC8_CZmZMeVYRP3bL4xC1jFjWaNGCwxHuP0w>
    <xmx:DsMDZMeU_Ze5FdPIWcSRDzRVNrQPoFD-HxjcuFlie_pMVk6yTTm9dA>
    <xmx:DsMDZHzeeuHjg7n7BOcEUVy5PCwbXp1auKMc7wMTNhDSnrr7vdUo_g>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Mar 2023 17:15:41 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 07/12] MIPS: Octeon: Allow CVMSEG to be disabled
Date:   Sat,  4 Mar 2023 22:15:19 +0000
Message-Id: <20230304221524.47160-8-jiaxun.yang@flygoat.com>
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
+	CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE > 0
 	OFFSET(THREAD_CVMSEG,	task_struct, thread.cvmseg.cvmseg);
+#endif
 	BLANK();
 }
 #endif
-- 
2.34.1

