Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C4996A5FBB
	for <lists+linux-mips@lfdr.de>; Tue, 28 Feb 2023 20:35:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjB1TfU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Feb 2023 14:35:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbjB1TfP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Feb 2023 14:35:15 -0500
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 865A261B5
        for <linux-mips@vger.kernel.org>; Tue, 28 Feb 2023 11:35:11 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id BC8E0320082A;
        Tue, 28 Feb 2023 14:35:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 28 Feb 2023 14:35:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :message-id:mime-version:reply-to:sender:subject:subject:to:to;
         s=fm2; t=1677612910; x=1677699310; bh=mRzaLwyG1YQLWOxf7gui1lCJm
        +Ein4jhyDqy5L9vL2Y=; b=d3hYcwBFWr3PPCxzrxvzOMgeM3Vz8pabN/cRxzmAT
        9zFHJHYi6ECbz28jXeimHkOJtVRKA84lVghrLqcF/7ScX4szCgwEQb3K+92WFIJW
        kAIRHRUbxa2F/ComEiLcFX+CsJBoLUVTsrWkq8l4ZCHfxVDCJirXNoc33KJXaff4
        rcYmJtqQsaMOrNo0OkN8PhREshd7yhTEFLFZwLxdZxi+jM9sDIxu35v23XRwcONu
        0sf3ptUao+B6AOYI7diw34YoDDxENaHIDDuhlVZSR+dUfgvhwFc+CE/t5ch+VdNY
        Tw29MaAUNut/SYzb3n1SoGKSgTOmx2ANwb2idKYFQiSxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1677612910; x=1677699310; bh=mRzaLwyG1YQLWOxf7gui1lCJm+Ein4jhyDq
        y5L9vL2Y=; b=FqML0kfl3Io4FnYZz5bYT75+vSWH6tVf3wUoE3Ut0THl/KewUth
        HPJnftIPTumJ/erUkeCvvBnMZFoWOiB6muRDjdlO3X3t+OzRK7aJdXbZNLGOIpPm
        0KeJ3oGfsE6VA7aFakbqzIAyLyzkdP8PIphuh+NLEFLjA+SaEjLkx9CyUetiZ5xV
        hhw8p29xjd6PYurLO3eaRq4R7+9G+aPRCmttHqhAJPkijKAi01GQm3BAeyCKdtDC
        1Xyw/y0TJRQQWTVVitssNGXePDYDzNpKqyxGERNQtwgqSmi3Oga8Cv3hWxZSXUv/
        1fJYRHf3VIqSdK8V+Jov7yW/lRYWtHtFKaA==
X-ME-Sender: <xms:blf-Y9jXWzeCpyBTHdY62_DcI29RTkCWVfvadE1J4iML080KRgCnvg>
    <xme:blf-YyATHakUUZCxYDkostcYGZr-gXveCGc503aOiz5htcH6BZCRlW4XP6QnVKMgN
    vgtiG8DkLdsqnlvhRM>
X-ME-Received: <xmr:blf-Y9E8cHmUE6aea9R8WjM8qWhnMJVvR-sIHlnDr679tm0F4I_2HIReH9yq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelfedgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepgfdtheehiedvgeduudduvd
    duleegleffgeekjedttdfhhfefleetheevvefftefgnecuffhomhgrihhnpehgihhthhhu
    sgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:blf-YyQX_R7ewkP5IG392-x2kWZ__D0dYW4bg-Y4joKDFbmVKsYLFg>
    <xmx:blf-Y6z2AF4FTeHXYUBLzD_OETOrJT3RBT7Y51yJ6Zu6k7fTRuwzgQ>
    <xmx:blf-Y44rfvPdyc5iCwkhuGeqalqOb_XuZLXohZwkrRsg1nQBVCh9JQ>
    <xmx:blf-Y-80fyMnrr6sMk_hPOpHV4o5Z1ZvRC1lPPb8YuGXM0-smMWNBQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Feb 2023 14:35:09 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, nathan@kernel.org, llvm@lists.linux.dev,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3] MIPS: Workaround clang inline compat branch issue
Date:   Tue, 28 Feb 2023 19:34:59 +0000
Message-Id: <20230228193459.15365-1-jiaxun.yang@flygoat.com>
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

Link: https://github.com/llvm/llvm-project/issues/61045
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Acked-by: Nathan Chancellor <nathan@kernel.org>
---
v2: Add Link tag to LLVM bug
v3: Docuement issue link in Kconfig as well
---
 arch/mips/Kconfig           | 4 ++++
 arch/mips/include/asm/asm.h | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 37072e15b263..c8b878aa690f 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3206,6 +3206,10 @@ config CC_HAS_MNO_BRANCH_LIKELY
 	def_bool y
 	depends on $(cc-option,-mno-branch-likely)
 
+# https://github.com/llvm/llvm-project/issues/61045
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

