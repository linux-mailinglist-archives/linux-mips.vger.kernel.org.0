Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA7066E1DC6
	for <lists+linux-mips@lfdr.de>; Fri, 14 Apr 2023 10:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbjDNIHh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Apr 2023 04:07:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbjDNIHg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Apr 2023 04:07:36 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E274C65BD
        for <linux-mips@vger.kernel.org>; Fri, 14 Apr 2023 01:07:31 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 50C9A5C0086;
        Fri, 14 Apr 2023 04:07:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 14 Apr 2023 04:07:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; t=1681459651; x=
        1681546051; bh=GbyH8yAqRFdY13pD1/k/d2AWpv4tW8BU4FUnkwA1skE=; b=N
        lOAZMQ2o/l70VEG3Alx2mVkIUPMtbJr6goBY1/W30DNIdwtRk3a4weqdyKo6+PHI
        lOMMFAlL8KcNgRFeXzWXOMfxVddKKQwQz9q2XZZMyHSDsNAHUHEAQIiknUVET6Vs
        yIEQjbXVMFm7a1swgIZH2nki4d5MHoW3Sps3mBL2O1LMgOUfuqGHldv4pSo3oy8r
        gThYF/+Q6xsMClJ8kknxsu5zo8vNPVTa9Q3XKhQD2h8NRL5L/lT2g+dC7cxFdOyB
        Q/BrF0HqO9f5DcfT8+fnnnfYwZAl5vJXSTcWxbEqAQL+lhAQhPYT3nprgq+Lp2LH
        V0jaNvLPGdu3Pc9l03gbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1681459651; x=
        1681546051; bh=GbyH8yAqRFdY13pD1/k/d2AWpv4tW8BU4FUnkwA1skE=; b=B
        DQb+yrhEKHc5ZgMH5q0B35Pxt4Hm3QmTtjZRCspfoxfAIq5s9LilLoctBdzE4QAj
        ikO+/Kxis6YDbxHzZEJfE8SM2nwJe4H6/5Hv0bfwwVOCFnU9vkd5OcomlGZT2RwA
        fxwZUqNyB5Uq6fh/eNglXTT/SdhYBYUwrDUa088QUo/fVOcAPNN/pOxn3rB7R8rG
        GKEiZjWA79oaqzacWzMCoDk6tQTmVkh/QPCEjw4Sb+be9M0d/iA4LbjB7aNkz11r
        V+w3Z7l9TZWaFkjFxGEWoxaIj7R2aC75O0G6UqVhxL56lJxnAE3jLMXlcS1fpb8g
        e33R0+1/g2RxMekg2dkLg==
X-ME-Sender: <xms:wgk5ZHlbpdKBnE2z85QKgL5NEOGL-t5O9bpRZ42JzxmCKzwK11gU0Q>
    <xme:wgk5ZK3EGMpnzra6ZOl82jMnyYNDHFFlmD3ogzVQycyv2IQRdAb8jkHuhp-psBZ4w
    YKX2HyAfCLB2Yr6LEE>
X-ME-Received: <xmr:wgk5ZNqDG5otr9zwmtkD0Nh_CloLSrTi_2i_GM04pplruhJf9Ke9dW5EqpkJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekledgudeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
    nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefledufeehgedvue
    dvvdegkefgvddttedtleeiiefhgeetudegkefhvdfhjeeftdenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
    ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:wgk5ZPlrCDSHYTyms_bKkMDCfoBuiUG_iwNZy05O1ipjxZiMjWmCvw>
    <xmx:wgk5ZF1zZ2ycuM8_b2I9hiYsgPMf9KcTv_bd1Kx0wBaSo_CkBtouPQ>
    <xmx:wgk5ZOtIVJr5FyHG8AxUjXVkkSh-3Qyt-YTvERZlIGLmZR9Oskpy-A>
    <xmx:wwk5ZATMFzpjfnxOUPvyYJbtt790dqVvM3Tm6TKYpqUAk6tMb5pBZg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Apr 2023 04:07:29 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     llvm@lists.linux.dev, tsbogend@alpha.franken.de,
        ndesaulniers@google.com, nathan@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 2/7] MIPS: Add toolchain feature dependency for microMIPS smartMIPS
Date:   Fri, 14 Apr 2023 09:06:56 +0100
Message-Id: <20230414080701.15503-3-jiaxun.yang@flygoat.com>
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

microMIPS smartMIPS kernel can only be compiled if they are supported
by toolchain.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/mips/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 41ac4dc5aae4..0b270562c3eb 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2360,7 +2360,7 @@ config CPU_NEEDS_NO_SMARTMIPS_OR_MICROMIPS
 	  Select this if you want neither microMIPS nor SmartMIPS support
 
 config CPU_HAS_SMARTMIPS
-	depends on SYS_SUPPORTS_SMARTMIPS
+	depends on SYS_SUPPORTS_SMARTMIPS && CC_HAS_SMARTMIPS
 	bool "SmartMIPS"
 	help
 	  SmartMIPS is a extension of the MIPS32 architecture aimed at
@@ -2373,6 +2373,7 @@ config CPU_HAS_SMARTMIPS
 
 config CPU_MICROMIPS
 	depends on 32BIT && SYS_SUPPORTS_MICROMIPS && !CPU_MIPSR6
+	depends on CC_HAS_MICROMIPS
 	bool "microMIPS"
 	help
 	  When this option is enabled the kernel will be built using the
-- 
2.39.2 (Apple Git-143)

