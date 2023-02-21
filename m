Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9E8969E124
	for <lists+linux-mips@lfdr.de>; Tue, 21 Feb 2023 14:17:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233719AbjBUNRJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Feb 2023 08:17:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233908AbjBUNRI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Feb 2023 08:17:08 -0500
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68BC129159
        for <linux-mips@vger.kernel.org>; Tue, 21 Feb 2023 05:17:07 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 9C588320093C;
        Tue, 21 Feb 2023 08:17:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 21 Feb 2023 08:17:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1676985426; x=1677071826; bh=6s
        lN4vS2XuBLOhdr95Q+OkSVr9EalJWOKOThLTuxc0c=; b=QUVph68YzLuEZvQyQE
        Gl3BXR8kBlt0Oj2e9mqpBzGq7zJOrCzAuvw1bZX3/cSpHVimQdoFk4i18MmsXcs3
        koI2HO5dj+6LE8QB2YW1NBIRRUUVCs3zGBHtOOJ9EpgsLPMhNSZ1+eELSP+/JpIk
        0JTs5PTAJErqsBGQ51O4mc9STSriAqgfYbUY5kFq9k/ENdgeOMYOSsc46I8G/tKc
        2VQi5MEegOUIj+QHuUScehBvvHfq2Dzfgx9A/1bryaikU/wUru8JOJvR82+MNmum
        29RjQPptKuzXXzEljmkwONiXYXUrjxBxngM743LMUBi41p8FuMRzSkNkm8ZrcI5M
        fa+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1676985426; x=1677071826; bh=6slN4vS2XuBLO
        hdr95Q+OkSVr9EalJWOKOThLTuxc0c=; b=Odqj77gwMgSmLWonDUE52DlHcBVNJ
        mppz8XNL8YyscIF0C2KYEZkd/mjTkYDgH15zut4RA8+m+8QUdKRLtJm+yUOJM/tu
        rE19mCuU0WgQAQdFxa1sbp0Os/m37g3W+stAEZtdB7wB3BecfI36a16rHAHWEVFA
        uBfVEE2TdXqCCOn0UR7Ell+WL2UXjPuvhUdzzvXw01flE0wCA12qtv8SmuvfbP92
        sYhLu3cPhz7XOy6wGhyZCuCWSljzmpJ8N4+RLYPKxmF9rBLlwE41d+hkexASUN+t
        tXiqxHKEF80vZeCqh7sNb6n6GoD2O7yk+LR94H7U4WfFI+ZhJbtiGzb9Q==
X-ME-Sender: <xms:UsT0Y1hicuS_h5cRvSK8FFwif0WjVLGp2B6T8PNzilaUFB31b6ZCjA>
    <xme:UsT0Y6ALJUq0xXiGncKY3TyJ2VFLcriKS1oeqOltITWPnUHRFoq1U_FSp9DQL21K9
    hXn5ujJwG9N-mNfxPE>
X-ME-Received: <xmr:UsT0Y1ELGEms7kBZ8AJydvglKQIdUHD0gcFkxoNGtcgdkKHvkVxmMJLVBKcv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejjedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:UsT0Y6QD96rqDqwLpSBeNH8aJZOPvXZtuqQMWzm5GOgKl1KkWzRCLg>
    <xmx:UsT0Yyyp5YfXA2bv6_w8kw85pE3V9qjZCoxYNaak0Mm-bVFFtGf-zg>
    <xmx:UsT0Yw4sPdBlZESBclw_qy24XGLPtlvtPWxZTTVW1ZpS3--GPVaCEA>
    <xmx:UsT0Y98v1KwbZaBalKTZZ7YExObzpRr_x_PFgJhX7G3pFGg6mLfK_w>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Feb 2023 08:17:05 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, chenhuacai@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 1/5] MIPS: Loongson64: Prefix ipi register address pointers with __iomem
Date:   Tue, 21 Feb 2023 13:16:54 +0000
Message-Id: <20230221131658.5381-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230221131658.5381-1-jiaxun.yang@flygoat.com>
References: <20230221131658.5381-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

They are truely mmio pointers, so give them proper prefix.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/loongson64/smp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index 660e1de4412a..c268c6dd1ef1 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -27,11 +27,11 @@ DEFINE_PER_CPU(int, cpu_state);
 
 #define LS_IPI_IRQ (MIPS_CPU_IRQ_BASE + 6)
 
-static void *ipi_set0_regs[16];
-static void *ipi_clear0_regs[16];
-static void *ipi_status0_regs[16];
-static void *ipi_en0_regs[16];
-static void *ipi_mailbox_buf[16];
+static void __iomem *ipi_set0_regs[16];
+static void __iomem *ipi_clear0_regs[16];
+static void __iomem *ipi_status0_regs[16];
+static void __iomem *ipi_en0_regs[16];
+static void __iomem *ipi_mailbox_buf[16];
 static uint32_t core0_c0count[NR_CPUS];
 
 /* read a 32bit value from ipi register */
-- 
2.37.1 (Apple Git-137.1)

