Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA682E75E1
	for <lists+linux-mips@lfdr.de>; Wed, 30 Dec 2020 04:49:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726209AbgL3Dso (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 29 Dec 2020 22:48:44 -0500
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:54839 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726221AbgL3Dso (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 29 Dec 2020 22:48:44 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 4D3C595B;
        Tue, 29 Dec 2020 22:47:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 29 Dec 2020 22:47:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=+5TVbFo7PKA8kJgS6b5nECRaIm
        Fiu29loKh/etNYJIc=; b=x2JGoMtu4i2NuHb7o47Y3egwSxUetCQF5HuqZbm7zN
        QLvmrzZXeuXmBPCH9aEo+TpEoXuXH3ktUlzK8dSEam0raln8IyF+BPn3rrN7oLWt
        5gUYpk2s49McJF8cLOgNUJ732GDeEBNgCvYhHrGArJZs7dfv0Zo3b/1HBA4cFK9w
        /LMsOhdIYwYUIbGqu9lV5nZFJQOL0BPJphuSK49UnMjUeBYhI1l8ifylmEb/y/kQ
        Rr59u711HGGZz2Wo6zyukRuhTHnrbrg0yi7F54yUofGeFt7C0tcFa2/1YiwmY5zK
        06rjiGjeWguQE87sR2ldlNRb9iyYkXTWZyvvEM/hPPng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+5TVbFo7PKA8kJgS6
        b5nECRaImFiu29loKh/etNYJIc=; b=pjBW5Tm6llOPXWYrvKHmf5Ww4uazTO62R
        1Xnz2TuwQijT3jijFf42Fu11P94uo2fRXvtLwWNfdfmynLK4lYHQt2JlMDoKi2Bn
        pKflTarxaz3HVcLN2IIlNzj74z34vRXv+W+QnZMfE7pd4uc07ZQBMOQrrwdZtMp2
        eTEkHD3dy92xodiUkk4OM1Qqd2+79x6bHsPZ0YMAQIDktBdSJwlufmQTgEhYjmid
        JTwQJ5Ca6KnrQ3uWQSRXpCznzU3/6V2q+jcalufyGYvu7MDFq3zrO5krZIS7CgUM
        tFrhqct94fFaB4FR1AH/uPdBRF8E/58oKGzNxidstk7byI6A5mJaA==
X-ME-Sender: <xms:WfjrX4hcdIuuLHAFIOnz7PruVoE9Pjg1HMIWXIaLBHlzCvS9lmSRdQ>
    <xme:WfjrXxCyA3HU4-C__xp0AiqwupW5WAwSTt4hJEG_PXMTMbmhnz4SnF3miLZNL8QFL
    WsB_YPniFII-NpWY84>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddvvddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihunhcu
    jggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecuggftrf
    grthhtvghrnhepkeeutdevieejleeifeeuveelteegudfgjeeufeettdefgefhhffgfeeh
    teeitdefnecuffhomhgrihhnpehhvggrugdrshgsnecukfhppeeitddrudejjedrudekle
    drudejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:WfjrXwGJrW4ZlG1rZjDkdrstK7NyeggBmsU3qLlostY5bHPds4xlSw>
    <xmx:WfjrX5SnyXiPe9uZXmIfCstHGqansnu0PpyKZXLPupmieSxyMDjQHQ>
    <xmx:WfjrX1wWH6tpwKUBSqCi9dVmfMnxFopE-6Rh4lplxXW-vsYy_StHYw>
    <xmx:WfjrX2qRzhAIgr4cqQBaws7K104RweX4lJQ0recNQMLvaDmzZ5dXq8fNbGc>
Received: from strike.202.net.flygoat.com (unknown [60.177.189.171])
        by mail.messagingengine.com (Postfix) with ESMTPA id 4873C1080057;
        Tue, 29 Dec 2020 22:47:34 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3] MIPS: zboot: head.S clean up
Date:   Wed, 30 Dec 2020 11:47:22 +0800
Message-Id: <20201230034723.17266-1-jiaxun.yang@flygoat.com>
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
 arch/mips/boot/compressed/head.S | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/arch/mips/boot/compressed/head.S b/arch/mips/boot/compressed/head.S
index 409cb483a9ff..070b2fbabae4 100644
--- a/arch/mips/boot/compressed/head.S
+++ b/arch/mips/boot/compressed/head.S
@@ -15,10 +15,7 @@
 #include <asm/asm.h>
 #include <asm/regdef.h>
 
-	.set noreorder
-	.cprestore
 	LEAF(start)
-start:
 	/* Save boot rom start args */
 	move	s0, a0
 	move	s1, a1
@@ -35,21 +32,20 @@ start:
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

