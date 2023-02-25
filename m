Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 489696A2BED
	for <lists+linux-mips@lfdr.de>; Sat, 25 Feb 2023 22:45:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbjBYVpS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 Feb 2023 16:45:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbjBYVpR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 25 Feb 2023 16:45:17 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B914210427
        for <linux-mips@vger.kernel.org>; Sat, 25 Feb 2023 13:45:16 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 5E7995C0083;
        Sat, 25 Feb 2023 16:45:14 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 25 Feb 2023 16:45:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :message-id:mime-version:reply-to:sender:subject:subject:to:to;
         s=fm2; t=1677361514; x=1677447914; bh=GYT2CsdMMXcJ1yaIvy1iewQsE
        8LxiHHmFK+DggDoft4=; b=a0+EGpYsY16LdnT8kxFCWUlH84vg60lI338CYkCPW
        ch4Fek/2j8l23E52DSXkDYzxhLmZK2iO9abT8/ieb6vfvcvHCW4YWkQtNnepW4dh
        +U8luCwooY1dx74oCtnl+D9o6CQbmVkq5m3TJobTtDgnafkg1k1HH80ycp9/TKQY
        jEH11F/ojt/xE7x4bgbDIxE9WTfYPXyUImDJ4yOfJtI3uB4twyUE65CmpJpFRRHX
        U7TIie0/+lDg/bUDb5uGhuwUAu23uD31tY1q6d6lkU+62Gn3b54jbTWhF3PxwSkq
        4OlifOcOP1E+Ev7QHIoG6g3LU0hneKZeTG7CFuisyy69g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1677361514; x=1677447914; bh=GYT2CsdMMXcJ1yaIvy1iewQsE8LxiHHmFK+
        DggDoft4=; b=Co4nAQerZ43J5U+7ihF+lcTct1ZxhadTiMtL9K5cXKoVZiDk8vJ
        jWZYwm+8dmAMTFlRRK0DA/vcXyP7852xVyE4okg6tcnAs0bi2ZjsFP0hE88yw/A2
        TZMfMprQXArzWk2dRZNpstP5D3XOJhj6AnwzPTExlL37/MBcObgaRQjBzN9DtDfM
        ipHnyXW1WTP8Zqvtyqxh62u37YyeYi6DIwBCBvCXHEYcCavA89Ngai1oOKR0gbk8
        JiGAOdCHJ1gOkxQ7rqThhCv+p2Mw1gccEYReGmlQ2zqAEa9htZmSErG6Vf/MCYT5
        N0cH76E8K6dOrZxqkLM6XkCcNkxm/AkI0Fg==
X-ME-Sender: <xms:aYH6Y11L-mbd20fICSG6kebFOxG5z2-RPJUtfwZKKMNhs-AaJ8tAMQ>
    <xme:aYH6Y8HA-R_KWW7A5AzUfrlUqk78cKjr_0qEmKu-XyRp-Rh1fO9f3lt6ZXPEi8QUe
    q3nmePoQoP26uuCJ_A>
X-ME-Received: <xmr:aYH6Y17Q0Ads1aCoUys1b__1szJS3BKa97Kh3oE02A_xI-YRuHVA_fj6iQ3_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekiedgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhephfetuddtudevieeljeejte
    ffheeujeduhefgffejudfhueelleduffefgfffveeknecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:aYH6Yy2YqM4wFfPNaaTL7zV2EjbSwnltyF8w0enOCnlVIN9ZnxQyNQ>
    <xmx:aYH6Y4H9QAK4lJqDHnHMqg5qLf14cVK-gxK6guQerRxruV1b2zPjqQ>
    <xmx:aYH6Yz9yQGtiv5xt6yfg2n05HLrkSCgx366qH6BAHRqnFSMMG6icTg>
    <xmx:aoH6Y8BAB2Rj6MvR-QwO1CVZqIRT6xEse_ppYD0ylPGe3NId8gKvUA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Feb 2023 16:45:12 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, nathan@kernel.org, llvm@lists.linux.dev,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH] MIPS: Workaround clang inline compat branch issue
Date:   Sat, 25 Feb 2023 21:45:00 +0000
Message-Id: <20230225214500.7446-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Clang is unable to handle the situation that a chunk of inline
assembly ends with a compat branch instruction and then compiler
generates another control transfer instruction immediately after
this compat branch. The later instruction will end up in forbidden
slot and cause exception.

Workaround by add a option to control the use of compact branch.
Currently it's selected by CC_IS_CLANG and hopefully we can change
it to a version check in future if clang manages to fix it.

Fix boot on boston board.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig           | 3 +++
 arch/mips/include/asm/asm.h | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 37072e15b263..adf2c5a0bdba 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3206,6 +3206,9 @@ config CC_HAS_MNO_BRANCH_LIKELY
 	def_bool y
 	depends on $(cc-option,-mno-branch-likely)
 
+config CC_HAS_BROKEN_INLINE_COMPAT_BRANCH
+	def_bool y if CC_IS_CLANG
+
 menu "Power management options"
 
 config ARCH_HIBERNATION_POSSIBLE
diff --git a/arch/mips/include/asm/asm.h b/arch/mips/include/asm/asm.h
index 336ac9b65235..2e99450f4228 100644
--- a/arch/mips/include/asm/asm.h
+++ b/arch/mips/include/asm/asm.h
@@ -336,7 +336,7 @@ symbol		=	value
  */
 #ifdef CONFIG_WAR_R10000_LLSC
 # define SC_BEQZ	beqzl
-#elif MIPS_ISA_REV >= 6
+#elif !defined(CONFIG_CC_HAS_BROKEN_INLINE_COMPAT_BRANCH) && MIPS_ISA_REV >= 6
 # define SC_BEQZ	beqzc
 #else
 # define SC_BEQZ	beqz
-- 
2.37.1 (Apple Git-137.1)

