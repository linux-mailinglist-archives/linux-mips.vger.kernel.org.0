Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBE886E1DC8
	for <lists+linux-mips@lfdr.de>; Fri, 14 Apr 2023 10:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbjDNIHj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Apr 2023 04:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbjDNIHj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Apr 2023 04:07:39 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A0A26E91
        for <linux-mips@vger.kernel.org>; Fri, 14 Apr 2023 01:07:34 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id CA8255C00E8;
        Fri, 14 Apr 2023 04:07:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 14 Apr 2023 04:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; t=1681459653; x=
        1681546053; bh=319qtseuj6dXrXziMf2n5r9XqioLOhb85xW0q9IWu6c=; b=Q
        GDKSP1QW1DnvFoT+CClJqCOG0D4Hc92n/pTVeYpOF/5Ez7ctcmp8iEmQAvsUPv2B
        CJA1Dc4s63Ndq3g71yoDXyevx5QvyIQ6B9KNBDjG13Vcr2iFmx8llKN1tqPB6QVX
        Zkel71+emHrbO2N2zHlnf4t4ZLyxTyW4HYxGJIkzgIcDaQceFclIszsDAxf4XbsS
        3q/klnFqxvmKciyH3w0HziGl9sbUnqLZOJeOs7dEMrE8WcfIRLpAEGeUmCNs90pm
        uS166Ic/74ZR0wQXHDj8UyDpVRzLjHuTYQ1mHEDIuYTJjhdufRClcr6TGX/1YFVH
        HDgT77Vi9HMT0kOickrVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1681459653; x=
        1681546053; bh=319qtseuj6dXrXziMf2n5r9XqioLOhb85xW0q9IWu6c=; b=Y
        sBATC9nHm2ybLd9oVhWelVnlS+aPi0rljO4G7UaOE/2iIKxd5tuzXCbALHvUd1sU
        PVYRJ0KHhpJ+cgaB5zTrmMLYddswKD2O2B0HbekJw+8apuBS6mlVt4gFiHoJFvLb
        ZMWSVAhtvt6hqh39YHwOwyDShZVQ89270Qb40fuOtqPo7HWP8Twr/+CMapxasy+b
        nFu/UKCEWkrz0h97lS1TWjUaLp1Fv95Cp7qoZC4pR7Hei986Dr3Eb+5NM7EcLEHV
        TNlXcE3wx0lRuS67iWOY5HEXyoKjB7tyjTNW1w63xA+Df2Znn2hEk2tXfxv4Dr6D
        ufa4fvd9WFd+GnNVbzO3A==
X-ME-Sender: <xms:xQk5ZJek1fudGgKBxRjd-cCIMvg2_W-UgqUa8fdkQZirZCPcXd8WKA>
    <xme:xQk5ZHPaACGEm3NbDM6iyF5h1c9PDQxl5ZrXNQcFMF0RnC-eg_W2ZMHf9l6ySb-O1
    Vd4HNuSpY70x0q8q40>
X-ME-Received: <xmr:xQk5ZCitBOVFn8McfgEjVY3kreAAFlWWukVyyhyKZqZD6SFlXf7wfIyzbjvl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekledgudeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
    nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeeifefhvedthfejve
    evgfekueduieelfeetffdtveetffefgeelieetgfffueejkeenucffohhmrghinhepghhi
    thhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:xQk5ZC8WU0xi-71exK2k13pDbXk-Ww4zENpM7Uo6nB5TSk-BLPiSzg>
    <xmx:xQk5ZFtw5pZ5Zt5KjMLaYNxymsGJmlOeTo55No4S15f3OjopG6Qmdw>
    <xmx:xQk5ZBE12kdM8vvKZe6AGrPTzeDt0GXs-PzPIQenAZq_BmthPXjtPw>
    <xmx:xQk5ZPITWBuEvDgKepS6Ug76qCF3MCGt7yzAVeRlGmyADfBUb2qYUw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Apr 2023 04:07:32 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     llvm@lists.linux.dev, tsbogend@alpha.franken.de,
        ndesaulniers@google.com, nathan@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 4/7] MIPS: Detect toolchain support of o32 ABI with 64 bit CPU
Date:   Fri, 14 Apr 2023 09:06:58 +0100
Message-Id: <20230414080701.15503-5-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
References: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

LLVM is not happy with using o32 ABI on 64 bit CPU, thus build 32 bit
kernel is unsupported.

Detect this in Kconfig to prevent user select 32 bit kernel with
unsupported toolchain.

Link: https://github.com/ClangBuiltLinux/linux/issues/884
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 0cd9cd01b7ab..2374f859e001 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2016,6 +2016,7 @@ choice
 config 32BIT
 	bool "32-bit kernel"
 	depends on CPU_SUPPORTS_32BIT_KERNEL && SYS_SUPPORTS_32BIT_KERNEL
+	depends on CC_HAS_O32_ABI
 	select TRAD_SIGNALS
 	help
 	  Select this option if you want to build a 32-bit kernel.
@@ -3137,7 +3138,7 @@ config COMPAT
 
 config MIPS32_O32
 	bool "Kernel support for o32 binaries"
-	depends on 64BIT
+	depends on 64BIT && CC_HAS_O32_ABI
 	select ARCH_WANT_OLD_COMPAT_IPC
 	select COMPAT
 	select MIPS32_COMPAT
@@ -3185,6 +3186,10 @@ config CC_HAS_DADDI_WORKAROUNDS
 config CC_HAS_BROKEN_INLINE_COMPAT_BRANCH
 	def_bool y if CC_IS_CLANG
 
+config CC_HAS_O32_ABI
+	def_bool y
+	depends on !CPU_SUPPORTS_64BIT_KERNEL || $(cc-option,-march=mips3 -mabi=32)
+
 config AS_HAS_MSA
 	def_bool $(cc-option,-Wa$(comma)-mmsa)
 
-- 
2.39.2 (Apple Git-143)

