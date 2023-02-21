Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 430B569E128
	for <lists+linux-mips@lfdr.de>; Tue, 21 Feb 2023 14:17:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233933AbjBUNRT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Feb 2023 08:17:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233049AbjBUNRR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Feb 2023 08:17:17 -0500
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B9029161
        for <linux-mips@vger.kernel.org>; Tue, 21 Feb 2023 05:17:16 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id AA50732008C3;
        Tue, 21 Feb 2023 08:17:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 21 Feb 2023 08:17:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1676985435; x=1677071835; bh=pO
        ClTwc5RdXtcnr6vyLY8rQ6gKCDwDWWCvzAG1rgVeo=; b=nvMrLDBa7Iyqg5IJrB
        NRuYpNB9uunK6km9m6s52KROTuwpANXgLNGtC5RX+4CZ0Bqvw7gZJdtnGJkwDmZX
        T0RKiinEhwpojbC6NnKp3nCiSZ4caqCsxc2V7Tughl427s91c4KytPKGKDfZ+nd5
        n0yRyap76JUnCESGZIuucyl0q4V+xa1GMeWTZ+285QNMUarGoJogU7/36hFsRewS
        m6c6joCJENMwBbb7SQkZpGGE4AVw5gD+MFJeIx3BrThF6uTqJLSZMRmE+xgk4cAS
        nK+/RIMsoGt7oxdBe4aG539/pRkASijb+6HoGffDfglaqwVd7DnvFYJWZ73Ii+mZ
        QfAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1676985435; x=1677071835; bh=pOClTwc5RdXtc
        nr6vyLY8rQ6gKCDwDWWCvzAG1rgVeo=; b=dGRfpOZwfhexmDvc/X51NIg8HJ1ne
        ielc79kcA1K5W4365yHMUAzTDcVABw4qNYrNNnhM3+5e44YVn9paQjNkSqQ90Wa9
        YmKKZ0Ps+Gx8zlyc/iCO6blUQHKuXY4sWQttzVn93OrfQ80nJx7eXCzhCARExVwX
        KamCrYyaerzO/0dDRLLMBiio5M/STPcqNLvXcc+sSfcfz2myDd5pbo8OEq7DR6eJ
        EKF+VSMFtPib0jmznizsQ6acfpsqRDNOYi9r7Wo7A0QjXlxBHDHIXWCDPRMGNH1V
        uFZxUW4raujNgEEFreTcUj3Fw2gBvmzCqhfwAKw80f8t+1P9OjRZT4zEA==
X-ME-Sender: <xms:W8T0Y46UQBBAnNAmxYmmvkmTMq5mP6T0wrkwOzUX8dRQsxlEL-wUaw>
    <xme:W8T0Y57w1E8BTQlqIkc8m-FnU471gq7Q2Z9FUuscCyMCnDIZhBWeRRfIvJcg5Ht-n
    n33ujbcsjEGsdX_WYo>
X-ME-Received: <xmr:W8T0Y3e_4BrqrqMHIJXzXkc2LM4lKDSHuheGMYVabaw8Rk85uNm3om1fv1Er>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejjedggeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:W8T0Y9LbTVbOItmhW8byukWhtkfMO-JU14NOPxlHw6ncGrKP3R0MuA>
    <xmx:W8T0Y8IIgbC8XBcNFO3pi4PQPSWIytuXBAHLQZP4fCQw7DRFRHWWXw>
    <xmx:W8T0Y-yijeTT1j0RAG4vFfJ4fTZxNgIPvb6V_X6zapL6U4ofE9Q9hw>
    <xmx:W8T0YzWs52O544nWAShU5XAIG72UT_Elo2vXio2zjxc48stFaFt9Ng>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Feb 2023 08:17:14 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, chenhuacai@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 5/5] MIPS: Loongson64: Opt-out war_io_reorder_wmb
Date:   Tue, 21 Feb 2023 13:16:58 +0000
Message-Id: <20230221131658.5381-6-jiaxun.yang@flygoat.com>
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

It is clearly stated on "Loongson 3A3000/3B3000 processor
user manual vol 2" that

"All access requests using a non-cached algorithm are executed in a
blocking order. That is, before the current read request data is
returned to the processor, all subsequent requests are blocked and issued;
All subsequent requests are blocked until the write request data has been
sent or the issued write request has not received a write reply from the
final receiver."

Which means uncached read/write is strongly ordered. So we won't need this
workaround.

This option was introduced when we add initial support for GS464E, it looks
like a misinterpretation of another section in the manual saying we need
barriers to ensure MMIO order against DMA requests.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/io.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index d727e07ed3f0..9b611770c261 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -210,7 +210,7 @@ void iounmap(const volatile void __iomem *addr);
 #define ioremap_wc(offset, size)					\
 	ioremap_prot((offset), (size), boot_cpu_data.writecombine)
 
-#if defined(CONFIG_CPU_CAVIUM_OCTEON) || defined(CONFIG_CPU_LOONGSON64)
+#if defined(CONFIG_CPU_CAVIUM_OCTEON)
 #define war_io_reorder_wmb()		wmb()
 #else
 #define war_io_reorder_wmb()		barrier()
-- 
2.37.1 (Apple Git-137.1)

