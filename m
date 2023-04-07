Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC9F76DAB83
	for <lists+linux-mips@lfdr.de>; Fri,  7 Apr 2023 12:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240612AbjDGK1k (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Apr 2023 06:27:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232920AbjDGK1e (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Apr 2023 06:27:34 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 439C8A5E8
        for <linux-mips@vger.kernel.org>; Fri,  7 Apr 2023 03:27:31 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 6DC215C02F9;
        Fri,  7 Apr 2023 06:27:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 07 Apr 2023 06:27:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1680863250; x=
        1680949650; bh=aLVbYlG34KPVa/4L/3BosMypUfUvY6Vppxlepog/hIQ=; b=q
        vUqrek4jrhtk/d0d7sesS0v/EFPnlKX8TI3NBKJaP3ZRUQDeN3VOpga4E4UUzNlT
        Iu0PhR+q5gSlh/yjDK4lQ9LJIS5PdFz51aU92WcPPRcG2dSq/srb524aP6RuE7Ok
        2vdmtF7cXaANcJcy/6J3jyY8PMSNLdTVfPp3N7Aq6qNY57I5hnSbsIdkeUYtK96t
        WCkSwpTCtpeKBkxHXPw6QPIHRMLQhvYeudypO624XiQJ3WYEl/ue7ubCwKa0lmR3
        Tfov+Sob4Z+wIevz5RvrPEGnVbYlY928h/pPdqJxtpQFaccI/NbghuY43jPUHFrL
        3fIZpNe8Oj1XbL8gbZwgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1680863250; x=
        1680949650; bh=aLVbYlG34KPVa/4L/3BosMypUfUvY6Vppxlepog/hIQ=; b=F
        yU7MITTL3GD295ghGR8ze4OES4E8IMWYyux9Xk6flRgP9r4+uKVNat2QICQgQFFk
        6k5qFPufBDLv/vNY23L/KzsU97XOkPx0DnnSdAWj/UcyTYc2+6SheHz2lVhOyLOV
        5K0aTHwHQ/iGFMJjw++MUDAgYwFYMSm0Y9eLPqmDXrihelC4yDch5oy67XS0Mwhq
        mzCqbPLUTT40uo/xnwjiJslPnY0ulvRCG5ht8f84SErlaHlhGcTJruz3rL7owGMO
        BS+HrrgLnAnoccvNzLiSNbX4kkNJJBzifzTNoN7nYnTDdq53OIJYG197WrfnlD/O
        HM7ZRoDUZWiK3PjrM+b1g==
X-ME-Sender: <xms:EvAvZAJBwgY1as6PNPelD_j0Sb0oGAl2XV63gHWt3uLnFjJa7weiRA>
    <xme:EvAvZAKW61ga3l6Zl9Mk1TJbq-b4-3pvy94jHDhVF4Ffo-aZeObbsQOfSOLvvzP36
    oGpCEyn3xu6C5HdVWQ>
X-ME-Received: <xmr:EvAvZAsDTYJe5KfRr58s0L9x3vND5Coxn-Ct-5i_V4Yxm7uMlTKMoNF-LeKy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejhedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:EvAvZNaZjUjOC2tHqIrHC2PTisovkQRK-XJ_pJYl-Yyb8oUKVszLvw>
    <xmx:EvAvZHaIDL5Lk4F2qKA1PMqWjovd45RCJdXh4cJoxRkFZhLLgpS2bw>
    <xmx:EvAvZJC6ns95U6X-jQKlZrkuJtj3gg1rnmrVFVBGgWh5tUOhx4fU7w>
    <xmx:EvAvZGX0oG0UAcAukAr9z1rBCR6PbYNXiCmZGCyMmq0AmMioUW1s3g>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Apr 2023 06:27:29 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     llvm@lists.linux.dev, tsbogend@alpha.franken.de,
        ndesaulniers@google.com, nathan@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 4/5] MIPS: Detect toolchain support of o32 ABI with 64 bit CPU
Date:   Fri,  7 Apr 2023 11:27:20 +0100
Message-Id: <20230407102721.14814-5-jiaxun.yang@flygoat.com>
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

LLVM is not happy with using o32 ABI on 64 bit CPU, thus build 32 bit
kernel is unsupported.

Detect this in Kconfig to prevent user select 32 bit kernel with
unsupported toolchain.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d896af492da6..5e399a5ac3b3 100644
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
@@ -3136,7 +3137,7 @@ config COMPAT
 
 config MIPS32_O32
 	bool "Kernel support for o32 binaries"
-	depends on 64BIT
+	depends on 64BIT && CC_HAS_O32_ABI
 	select ARCH_WANT_OLD_COMPAT_IPC
 	select COMPAT
 	select MIPS32_COMPAT
@@ -3184,6 +3185,10 @@ config CC_HAS_DADDI_WORKAROUNDS
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

