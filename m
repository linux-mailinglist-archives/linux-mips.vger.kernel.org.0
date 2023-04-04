Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 533106D5C07
	for <lists+linux-mips@lfdr.de>; Tue,  4 Apr 2023 11:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234226AbjDDJe0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Apr 2023 05:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234262AbjDDJeZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Apr 2023 05:34:25 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D4DA1BD0
        for <linux-mips@vger.kernel.org>; Tue,  4 Apr 2023 02:34:24 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 13EB25C00C4;
        Tue,  4 Apr 2023 05:34:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 04 Apr 2023 05:34:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1680600864; x=
        1680687264; bh=J/NMdkW1pzjcpoDf3cmc+I3Nqbh7iCl79TTK3aRRDrQ=; b=1
        kNwgKSwfAsVStcp6C/3+yORTXlphfmmWJ3hB5ri0DZrqk6AhJOFlXCjB05sagHZm
        whnTDwE+dl/asNVAvhE8zyj++xsnYNajXa8ij76ixbR4UARMn+uyes8hL2H81lXT
        EjOjZ8MLw2pp7cLH3uzUVTRSO5nWaUN/RbwFOXVW36j4EqiVrDFU6VspXxtIvSTf
        dffSzuEIRDVdmgvzNVBRHcslLDv9icwtmCjYpgael/t3C51Pt3/h/Yn1raIb90Pf
        HfBE9D0OBgt9TiZNU5YuA0JOfUL8fzGyKBci5MFldih4NyGbmsxMCRRg96p04wu0
        R6hY5S7sqjbfnZAD6Zhcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1680600864; x=
        1680687264; bh=J/NMdkW1pzjcpoDf3cmc+I3Nqbh7iCl79TTK3aRRDrQ=; b=r
        h4R/ajAn9vyGfaTLRPJX4/ZS8sRiAIG3MyI0LBiLftnLItLmix4NtBAkmjXt2cdy
        D2wKcE+nhzAmSjSdYXHKSCk06qn6ZH9c77GIZMb4elJiNNQ/33ptzQ8koCvrGX2r
        m2sfokFNZIOVNoUBkbZ/bjvTsqURKP9CHY7W99eSt9mbJ67KW/PCRCq44x2EdzjO
        mbHGYK9ta5lc4GY1nP3BuKJOGQLPsqgb059eNjy0ZZO9lv4Vvu8gXw58OB5uKhXN
        DIbRtxd+NWP/mJZ8spYA+VjeT+TwA7gwHvmNZY+2eHbXcwWZEnRS9sOPy2Kh1G+F
        AgPQxKgQ8FPJQiqAWUvgQ==
X-ME-Sender: <xms:H-8rZIfK9bqZnPdGJBGfUnVas61aQHihElx6sGiL8RiNsO7_fBsZXg>
    <xme:H-8rZKOhBn29Ur3rFwk93-5Cnt1T8rMbIyum-4nBoyFZD3_HdWmAA4g-XMujiZJzx
    klmpsgrr7vgLGUmsxk>
X-ME-Received: <xmr:H-8rZJicr4TW26GMi1b1lXgaG1XNggLIxKpH6jzFJu_uEL4MVjtk20r-tymm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgepvdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:H-8rZN-oebY8CX13MGqYmd9daECUuumyZEtfMWRNmQPBntZJ3f7MXw>
    <xmx:H-8rZEsFXUvi7oK4mMCZkyNexLzVd9I4izapQZnTr1-MiigsyiIWeg>
    <xmx:H-8rZEE_ZxWIrHpN0aG9OIudHn0yVjecB2O8JSoKZoDfyZZ2XnabnA>
    <xmx:IO8rZGLoGm6hiOi28hIqRyuRdI7nB8Wr7-O1FLyGqLLF_ct-PQlG3Q>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 05:34:22 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        sergei.shtylyov@gmail.com, aleksander.lobakin@intel.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 09/12] MIPS: Loongson: Don't select platform features with CPU
Date:   Tue,  4 Apr 2023 10:33:48 +0100
Message-Id: <20230404093351.4233-10-jiaxun.yang@flygoat.com>
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

ARCH_HAS_PHYS_TO_DMA and GPIOLIB are all platform level features
they shouldn't be selected with CPU.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig             | 2 --
 arch/mips/loongson2ef/Kconfig | 3 +++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index e2f3ca73f40d..940ade1c9449 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1366,7 +1366,6 @@ config CPU_LOONGSON2F
 	bool "Loongson 2F"
 	depends on SYS_HAS_CPU_LOONGSON2F
 	select CPU_LOONGSON2EF
-	select GPIOLIB
 	help
 	  The Loongson 2F processor implements the MIPS III instruction set
 	  with many extensions.
@@ -1788,7 +1787,6 @@ config CPU_LOONGSON2EF
 	select CPU_SUPPORTS_64BIT_KERNEL
 	select CPU_SUPPORTS_HIGHMEM
 	select CPU_SUPPORTS_HUGEPAGES
-	select ARCH_HAS_PHYS_TO_DMA
 
 config CPU_LOONGSON32
 	bool
diff --git a/arch/mips/loongson2ef/Kconfig b/arch/mips/loongson2ef/Kconfig
index 96dc6eba4310..f93eb6f42238 100644
--- a/arch/mips/loongson2ef/Kconfig
+++ b/arch/mips/loongson2ef/Kconfig
@@ -7,6 +7,7 @@ choice
 config LEMOTE_FULOONG2E
 	bool "Lemote Fuloong(2e) mini-PC"
 	select ARCH_SPARSEMEM_ENABLE
+	select ARCH_HAS_PHYS_TO_DMA
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
 	select CEVT_R4K
@@ -36,6 +37,7 @@ config LEMOTE_FULOONG2E
 config LEMOTE_MACH2F
 	bool "Lemote Loongson 2F family machines"
 	select ARCH_SPARSEMEM_ENABLE
+	select ARCH_HAS_PHYS_TO_DMA
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
 	select BOARD_SCACHE
@@ -46,6 +48,7 @@ config LEMOTE_MACH2F
 	select CSRC_R4K if ! MIPS_EXTERNAL_TIMER
 	select DMA_NONCOHERENT
 	select GENERIC_ISA_DMA_SUPPORT_BROKEN
+	select GPIOLIB
 	select FORCE_PCI
 	select I8259
 	select IRQ_MIPS_CPU
-- 
2.39.2 (Apple Git-143)

