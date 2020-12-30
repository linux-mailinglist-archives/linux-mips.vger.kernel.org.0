Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BCEA2E75C4
	for <lists+linux-mips@lfdr.de>; Wed, 30 Dec 2020 04:09:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgL3DJW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 29 Dec 2020 22:09:22 -0500
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:39501 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726161AbgL3DJV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 29 Dec 2020 22:09:21 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 98E6721A;
        Tue, 29 Dec 2020 22:08:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 29 Dec 2020 22:08:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=2ZH7aTrO8m5nIG/iSnyvaWGwhf
        Ro13fCpvGhSVuvXkc=; b=vf1yEDZip6npHzk7vpftCzIxzXmo8zXxkgdu7WhHcb
        Bty2jmTye2PeakMO4DgWfCrrqBFDG2t/+12ckd4VQ+XJnuXanPa3RBidwnOwiOrN
        +YIUzpdhLP1Ja0a1Rny/76Nxrm7hSoRpwaQswZ/GVpO/4w7kw+zbi7rDtQZ0GelV
        QxYk+yIgZRuSN5tEv5tWh7XUi4yx0VV7ehsvMaWSH7lVk9orF3CXmMMWjoDwshyL
        vpIPpzfGREITi9Qz5dQt5DvLFvzAN7vFJ+8/ej3YBVFem67psWWf4WJ7R91ScwvZ
        G69YwmBfUqRWbG5zvBHgH27VFkX5YwLOhqlzbBg0h0fA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=2ZH7aTrO8m5nIG/iS
        nyvaWGwhfRo13fCpvGhSVuvXkc=; b=QMEFl8p3rDihKv5CAOA6WMAc4/eROD4BR
        +IPUaoirYo89PjEFobInQzlTDW2tKAlODIx30vhlHDPIDG+h1kAUuBpyKGGXIJ1y
        pzn3T6yaayrVKioGmpepHYly/t+XJ5aYjuGxHel6hqx+18oJxsf0M3QU0w1th97i
        oBf1Bl0R3IYvvGHwsmqlgbptsXBpaIJMGY0Nz8GkpWIAfgcRNUONB/+tUDN5Znlv
        os5rwqYj4+ADOIHvlMl6JSqIlgq3C7xFk7KA6RWOd8sLQd95GhJhAVn28awIfE0M
        8AQwgDBNFzCk76gDjJHlizbBiwBIdRQWxrOsff5z9LfEStowZm0Rw==
X-ME-Sender: <xms:Me_rX2OtCkk9agPbadR7y-h5CIcwRjF9l-izlBUT3TvmW2zrnqf_tw>
    <xme:Me_rX0_hjKq4ZMDzt2yNDkpIG-xTHNlzwQ1KHarET6kAIYEwEJ2vo_UcSbOU_2RTH
    v9w0xSFxEl9ChnAcnU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddvvddgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihunhcu
    jggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecuggftrf
    grthhtvghrnhepkeeutdevieejleeifeeuveelteegudfgjeeufeettdefgefhhffgfeeh
    teeitdefnecuffhomhgrihhnpehhvggrugdrshgsnecukfhppeeitddrudejjedrudekle
    drudejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:Me_rX9RAnV7yJv96I-aEW5MvH5uvxo21ygMnEw8xq2QBtBOXbafSTQ>
    <xmx:Me_rX2t-hnGD_3KMwP8bMvvceyWNYboZSw722aplyYqMCgKfNqWglA>
    <xmx:Me_rX-e5v7y_aVSXBf6eTASJSOvBWBQxEOOFFXrWR9NbEbXH8SeHTg>
    <xmx:Mu_rXyHMqAAgerOE-34-7GUHTtwJXv4IovSEwMtTRUFLTiTAtRIMsoE49Ck>
Received: from strike.202.net.flygoat.com (unknown [60.177.189.171])
        by mail.messagingengine.com (Postfix) with ESMTPA id BE06624005B;
        Tue, 29 Dec 2020 22:08:31 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] MIPS: zboot: head.S clean up
Date:   Wed, 30 Dec 2020 11:08:18 +0800
Message-Id: <20201230030819.4510-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

.cprestore is removed as we don't expect Position Independent
zboot ELF.

.noreorder is also removed and rest instructions are massaged
to improve readability.

t9 register is used for indirect jump as MIPS ABI requirement.

start label is removed as it already defined in LEAF.

Reported-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

--
v2: Remove start label (paul)
---
 arch/mips/boot/compressed/head.S | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/mips/boot/compressed/head.S b/arch/mips/boot/compressed/head.S
index 409cb483a9ff..977218c90bc8 100644
--- a/arch/mips/boot/compressed/head.S
+++ b/arch/mips/boot/compressed/head.S
@@ -15,8 +15,6 @@
 #include <asm/asm.h>
 #include <asm/regdef.h>
 
-	.set noreorder
-	.cprestore
 	LEAF(start)
 start:
 	/* Save boot rom start args */
@@ -35,21 +33,20 @@ start:
 	PTR_LA	a0, (.heap)	     /* heap address */
 	PTR_LA	sp, (.stack + 8192)  /* stack address */
 
-	PTR_LA	ra, 2f
-	PTR_LA	k0, decompress_kernel
-	jr	k0
-	 nop
+	PTR_LA	t9, decompress_kernel
+	jalr	t9
+
 2:
 	move	a0, s0
 	move	a1, s1
 	move	a2, s2
 	move	a3, s3
-	PTR_LI	k0, KERNEL_ENTRY
-	jr	k0
-	 nop
+	PTR_LI	t9, KERNEL_ENTRY
+	jalr	t9
+
 3:
 	b	3b
-	 nop
+
 	END(start)
 
 	.comm .heap,BOOT_HEAP_SIZE,4
-- 
2.30.0

