Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 737656C2F7F
	for <lists+linux-mips@lfdr.de>; Tue, 21 Mar 2023 11:50:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbjCUKuD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Mar 2023 06:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbjCUKth (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Mar 2023 06:49:37 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42DF2113FF
        for <linux-mips@vger.kernel.org>; Tue, 21 Mar 2023 03:49:20 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 66F693200C5F;
        Tue, 21 Mar 2023 06:49:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 21 Mar 2023 06:49:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1679395759; x=
        1679482159; bh=wmfk/M+inHtT+XqYs41kjtCCrZqjfEWCXUmezQAgSaM=; b=u
        Z/ESGNut9dkgpwJREiJSCTH2jAd/wJQH97yb25pVmvX9JePkakfaHsvQUrUE053M
        kSwD4mOqwDRo7KSyz8K3P4HmsdOM4s2jxMycE/BJTHvpD2o/NK/bKQBpuXfVD8eK
        mKZA07SgHp51sDDu5y8+YTJSFlSqJZXAV8yHw96nBAB145z5JJZ32KRyBL8T2Hgh
        THDOhWFozLVZ+a1B5skbGKcSCHCU86AxWycndcH1ifDBxS4NoKioiGg/0QRUXqoL
        NihA686si0CJ9Cb78CrPap2V2T5mItXaCjONcyGur2zBoaTj/2PNbExDfATG8YDF
        aTpwNLYb6BMM4pNcJVBZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679395759; x=
        1679482159; bh=wmfk/M+inHtT+XqYs41kjtCCrZqjfEWCXUmezQAgSaM=; b=S
        Ms9sFziZwqsAHNQkq38YKGgZeN21IHeuMwlx3zUzBngfrM/FF1eY++wZLNe3qiy+
        w53EAZVYGM0fdeWfGZlG/Lg4BtfAHYcnPQYx8x/Tai/MD2jh64MJ4SQuPt311f34
        uCPchNf9DiJvCg3xylDiNxnRp5vehxWJqDfQEmRsGDDGs32qPxaJ2odx6mjkU9ZZ
        syHVBra3BG5hkpEiWD6srvVtFI+ttqrjw6I/n27YY048vmczdm+jLPogpNW9f5QJ
        TNRzXNZyZAuNbfGht/rJb67R0M76jESUnOWE35HMlpYzLlomy/p0275V6PIAyquL
        tWPuT0F6nAGFpooRwYNPw==
X-ME-Sender: <xms:rosZZKNjGYVUTJX8XmltC1KGcq9WyPOyenu7JKDPzHNlN8RBtqVKng>
    <xme:rosZZI_6jfeHdqlfBeZlsGFXysle5XZ2rL5MXvH0dYIJl1i84XkmcyRiz7nxitz3F
    pK9tbDKxld7grujMmg>
X-ME-Received: <xmr:rosZZBSBxOsr2UBohaCqxIW8FEUfx53Sn6FzpjlHZLhZPz9TBY8qF3Al3BOR1G71u0OEPnmXcLY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgepfeenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:rosZZKtZ9omscsYV_rSxSUD9PhphOdh8usxiVhX0MjOR4Z87g_q_iw>
    <xmx:rosZZCeUW0JDTLR7n9cQ7DPefUT04cpNaNb31CE4dp_G1JSc8zjPIA>
    <xmx:rosZZO26826WxZK-lB43QfmShqBjHpr7ku1YXcbBjq00RLUVs1rsKQ>
    <xmx:r4sZZB5k3z2VlO44bQ0SKJwAfZMKfZbSeDT7uKanJ30GEO9tAmtMPg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 06:49:17 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        sergei.shtylyov@gmail.com, aleksander.lobakin@intel.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 09/12] MIPS: Loongson: Don't select platform features with CPU
Date:   Tue, 21 Mar 2023 10:48:49 +0000
Message-Id: <20230321104852.25284-10-jiaxun.yang@flygoat.com>
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
2.37.1 (Apple Git-137.1)

