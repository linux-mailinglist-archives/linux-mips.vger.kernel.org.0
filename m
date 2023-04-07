Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A80D6DAB80
	for <lists+linux-mips@lfdr.de>; Fri,  7 Apr 2023 12:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240619AbjDGK1f (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Apr 2023 06:27:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231521AbjDGK1d (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Apr 2023 06:27:33 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC489A5D3
        for <linux-mips@vger.kernel.org>; Fri,  7 Apr 2023 03:27:28 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id CC9275C02FC;
        Fri,  7 Apr 2023 06:27:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 07 Apr 2023 06:27:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1680863247; x=
        1680949647; bh=6xZQ6d8SXf9ltEs4IqAsx1PbLpqMzk9FVvoeJw0REcQ=; b=E
        zqif4/FZkXWTY/P0U9EdKDnN0AHHkqa6mlc5aahW4xoxRL+MawJr61BoGwWil84u
        Tda7JwH++JR3p6xvirfiV9IJMtn82fCHMy0tIMCR8E35KPDVsbgCbmmxt5SAo4ls
        m03cvZ0ojINNCVpQasDNB4aABXMhCtSjor32JLGh8mFfQCIJKULHRzCvweFsu7ti
        482RWnvgxp4+gYZufO7uXBvOJq9NbLmKUHfONqNIZWpw/dHFzu3fN9C8IJmXd03D
        c0dRHG9a9bNWCxp7hm4EnNYi/2zOUutzWKY0/ZJe9JMyHWFOok8KBpBfOqbs4+fx
        nTUCDhb1Mz10S2uztsrqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1680863247; x=
        1680949647; bh=6xZQ6d8SXf9ltEs4IqAsx1PbLpqMzk9FVvoeJw0REcQ=; b=L
        PRrsfPa0K86uHcholAcLGNG0qiquIwC5mQfrunNcbuQbeNvHOzQR2eshp6sNyrIp
        sJkf1t3VBM5UBPu6niAxqGY1s6yiSx2u1dKLJoQ6hMdFfxdshHw/Pr0EOEVfiksV
        lYS6dZkBuYbJr+iFJ2IgyNSmDf817TtTvy9clHsm5Z44DtrolJ2+UjlM/XsdAJjq
        z0Alj6ydBgp/SOoBWJP1CEEgEAN9j4NNkezMy1IFJMSqhQD7sEosICP5yFrQz5eX
        hgqG/RQ2V++LHTBZY+9ogzIH5WXE6c/ZqrGSggFtGIKop9qhOcMgK/H7W6Yu3uUc
        eSTOUHC5n/YrYxjvU5M6Q==
X-ME-Sender: <xms:D_AvZIkcbQPT5GesG19Xqzm-4yWyspPSoTKrV1xOzzd75tYcf0Ch_Q>
    <xme:D_AvZH1YWuHZJfQXV2NI1w0VGKzP2ar7ftzzU9pW506cwoU9OGCe8L9VzlfxCgas1
    1EO1nzewhUp3qXuMxQ>
X-ME-Received: <xmr:D_AvZGpTlA9WIBItRhz4kq2_fcowzQo1Bb9Zqp0kI5hcW1dZ3k9_euP5WUUx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejhedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:D_AvZEkstPvbAuS9H9RQnTBSnUajSXvRXcVhjwKZMwfDBCeuL4h8WA>
    <xmx:D_AvZG01EGn57ahvYxO4fBTPhUnHRDrkrun8dhAz_DQ_kALM7cHLyw>
    <xmx:D_AvZLtJSZMA8Ppi7rqW9ms9LbhrbeNQ5qMb2Mmrmeux_eBmAuI1yw>
    <xmx:D_AvZJSGXMY-BSt79s2JFzDFJ2il61ZjrGVn-3KdQs8Bn7SQOdJwHg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Apr 2023 06:27:26 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     llvm@lists.linux.dev, tsbogend@alpha.franken.de,
        ndesaulniers@google.com, nathan@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 2/5] MIPS: Add toolchain feature dependency for microMIPS smartMIPS
Date:   Fri,  7 Apr 2023 11:27:18 +0100
Message-Id: <20230407102721.14814-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230407102721.14814-1-jiaxun.yang@flygoat.com>
References: <20230407102721.14814-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

microMIPS smartMIPS kernel can only be compiled if they are supported
by toolchain.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index c52401c155a4..9e9de2b62f28 100644
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
@@ -2372,7 +2372,7 @@ config CPU_HAS_SMARTMIPS
 	  here.
 
 config CPU_MICROMIPS
-	depends on 32BIT && SYS_SUPPORTS_MICROMIPS && !CPU_MIPSR6
+	depends on 32BIT && SYS_SUPPORTS_MICROMIPS && CC_HAS_MICROMIPS && !CPU_MIPSR6
 	bool "microMIPS"
 	help
 	  When this option is enabled the kernel will be built using the
-- 
2.39.2 (Apple Git-143)

