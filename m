Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD7F26AACED
	for <lists+linux-mips@lfdr.de>; Sat,  4 Mar 2023 23:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbjCDWPr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 4 Mar 2023 17:15:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjCDWPq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 4 Mar 2023 17:15:46 -0500
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E602D12F22
        for <linux-mips@vger.kernel.org>; Sat,  4 Mar 2023 14:15:44 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 619875C0107;
        Sat,  4 Mar 2023 17:15:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 04 Mar 2023 17:15:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1677968144; x=
        1678054544; bh=oPJUVCgvgXZ0DrEgbfMpQpqQI91RPNnYp6KBlIi3GfI=; b=J
        f9YRLCJdifRvRlpZcVK7ImFL9+dP6zv51kukpKcydjf9vY/6pms3EKahyYDZ7i5B
        DpdQpei588rNptw2y4+82aCglEByro6VLISZrJxHkb8Mfsj0lNOOKAbYKK04dsvU
        0USsbWvixROpccfcf4/Cm2WA7pbSaKQR6nXYfYT//NNp/jaeQXM3pNkdX2xSCX+l
        /9sFv+qQ56IfhDRzGBD0CC4IdnikC5+/zGjkyIsvAAmfaGjm/GmkgP6Y2PDd2UcA
        QlYxyRLsOBP9nozO3i38PmXi0Jrcl8GyrqMapy3oP84pRytV9SKgSGR5eevK8C3U
        yrcA3KjQ6bv291BzVmFAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677968144; x=
        1678054544; bh=oPJUVCgvgXZ0DrEgbfMpQpqQI91RPNnYp6KBlIi3GfI=; b=D
        9MH5TKWZMpym6Zq787CLqDoLTqFCoQoxUZ1cIBflyj7TGHsJyX53QRXrKwaebSL3
        uJAR4Zv3mQx8hUIndPgAZczLGS4v3TCPzgYDzgqRVV0qhADcSmGRfCxSccaXqr7+
        EpsqtsJpjrrmQX+d/wX80KieMZ1YXJtoqTFSyKChVtNc0rHMIBejA/wgn+ZMPwgt
        DtwRK9ViZFCjYAcqsD6kMisly3v2Yal/uUCy+LkgqWmVDDghGpqlVZ2jB53pW+Io
        D7Gd4ueUHeEVDOeoURlCnOGp6qi6x2vtv3MnsXrrOMupI2oPF01TDmDs5C4ukbN8
        lLXRko4YRrRY0HVpaS99Q==
X-ME-Sender: <xms:EMMDZDey9TY41KjQ4G3ACAprLYfMuneLk3VY30bIipDvJRDpEWSJsA>
    <xme:EMMDZJNnZGnjd4xv-QBsH_Q91hSqW6OqCUZ6LivZE7-_kx2SqJcX1WqtAoJO-pIhr
    baM_Y98D4Q7D97qlWU>
X-ME-Received: <xmr:EMMDZMiDsgEeRa_3AGZEnnQBgH_I61hvfkjio7pStbvuMkzSer6RhnQMoK4o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtuddgudehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
    nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefledufeehgedvue
    dvvdegkefgvddttedtleeiiefhgeetudegkefhvdfhjeeftdenucevlhhushhtvghrufhi
    iigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
    ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:EMMDZE84q0wA-II55tOifjg3Xsakynpxi1CBgSdX0oh6YBMvkV4lAA>
    <xmx:EMMDZPu3lSAptD2Wx7Ch2cIlWhC6Y9EvLVQvAXMppYHcIqatytSwoA>
    <xmx:EMMDZDF0VSks5riwN6JbTUUix_HsHpInTU3B_pRf0hkWA7ylk0jIlw>
    <xmx:EMMDZI6po2m93Aisq9VzhJ1hxs3Uk1394P1nC3r15eJYdDflwkRxnA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Mar 2023 17:15:43 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 09/12] MIPS: Loongson: Don't select platform features with CPU
Date:   Sat,  4 Mar 2023 22:15:21 +0000
Message-Id: <20230304221524.47160-10-jiaxun.yang@flygoat.com>
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
2.34.1

