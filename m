Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 432936A57A5
	for <lists+linux-mips@lfdr.de>; Tue, 28 Feb 2023 12:19:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbjB1LT3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Feb 2023 06:19:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbjB1LT2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Feb 2023 06:19:28 -0500
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD0F583FF
        for <linux-mips@vger.kernel.org>; Tue, 28 Feb 2023 03:19:26 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 271FF5C023A;
        Tue, 28 Feb 2023 06:19:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 28 Feb 2023 06:19:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :message-id:mime-version:reply-to:sender:subject:subject:to:to;
         s=fm2; t=1677583166; x=1677669566; bh=EezAPtQNSNumyRR+Ho1r1yoWA
        Qa9DZCAQdxIRQbR60c=; b=kakaBwRjFVTZ++TuvMuMNb6GWxnJPhaiB29MwheRe
        W8qv21mDyU7Wb5m122ZA7qiBEDg856sulPBKIpXFXm7axsIg/aNe07kS/0IlTic6
        wsHwE9Eo0oLCfoFy/W5qL1N7EQ1Dglv02cfsshuXYEgD/VCZYv/mFmed0cWztmYJ
        BIaB+y6gGPL8yTbi0a8cBc6WwEwVccBupMCqFVXQdjafCYK7hlkZS85IbRb0oWK/
        zYPEWsWUwX/Sb3aFoYDSdKJ5oQNVzN4CHMIWx0z8nPHMfuEWzpeZscxCCYNWAOJq
        onsBFgUXIQgEHmzUf3xFd8XDen0z+5LnJBxD68n4Gv7Fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1677583166; x=1677669566; bh=EezAPtQNSNumyRR+Ho1r1yoWAQa9DZCAQdx
        IRQbR60c=; b=owaFL/vPHiO56jMu9sENb4s7OIu3t11fKDIrC36Cv64RptM7JE6
        ghvRjCwxC6vI/GSj5PngI6ldJWEQjlCqVjFRzGCg1RuH9ZDmzC5Dyd8qWRWgzixu
        YTTqBwDXAuEnQiP8ObTfKbSq1c3e06/WSd1g03KHek/S+Ll/nGDkWszfgCY1c7uo
        Axtj+H9APfSUx5aWaUG0THhK4uiwYrAyNTPv/2YYjXqsEOw5CVGqCVBnXRduXXJg
        6vZBFl+Flmo7IjvC1ZENEc056T01v8TrXRqV6GVri2mhszR/zEVLDDEqhfvnZL99
        sEOcc/vt19C00QJ8h3JWk5rXe7d9DbnqxRg==
X-ME-Sender: <xms:PeP9Y--XQqA2VtYcOSRh77sL4KrBPI4FRad6bdxh6VoLDL9HJVIY2g>
    <xme:PeP9Y-uGJav5cWo4BqzMp5CY0dcjNULgte5-IEh1-qkC-eS1tsN-j8_-RHCd50-DI
    jZjp5w0Wblq0bS4ZAs>
X-ME-Received: <xmr:PeP9Y0DsNbgTafI8aD0bbgwcAAvuY6KF9mTeobk0DXuAbZp1qNCzDYpZVBQmUwOewFCDqVN8QQwb3OXcD5n0IRS1UFPc9x65kohH6AQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelvddgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepgfdtheehiedvgeduudduvd
    duleegleffgeekjedttdfhhfefleetheevvefftefgnecuffhomhgrihhnpehgihhthhhu
    sgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:PeP9Y2eDGnE4Ld-fQ1MghdIcwtJHLXMfXHzdy1oHxxe2yBZp2nAW1Q>
    <xmx:PeP9YzNBkKtlijn63FKArEV3Beq-ytyJhqdQkjO5umoeRbjFeF5vpg>
    <xmx:PeP9Ywkx6nw6c4FFdfiSB5CKvpk7JwJQe9OPBm-CTyepW-1kt7kpPw>
    <xmx:PuP9Y4qnSJgY7rz_b8a_QIWkbB8ogkX4AXoDFs0afE6ZjgNCeji7ow>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Feb 2023 06:19:24 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, nathan@kernel.org, llvm@lists.linux.dev,
        ndesaulniers@google.com, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2] MIPS: Workaround clang inline compat branch issue
Date:   Tue, 28 Feb 2023 11:19:17 +0000
Message-Id: <20230228111917.82910-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
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
---
v2: Add Link tag to LLVM bug
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

