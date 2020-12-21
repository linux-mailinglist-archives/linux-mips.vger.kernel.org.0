Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 714C72DFC25
	for <lists+linux-mips@lfdr.de>; Mon, 21 Dec 2020 14:03:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgLUNDF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Dec 2020 08:03:05 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:42631 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725891AbgLUNDF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 21 Dec 2020 08:03:05 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id B1815580505;
        Mon, 21 Dec 2020 08:02:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 21 Dec 2020 08:02:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=QofX1MTd8AKg6Q1IhmpNRwq7Ya
        /pFJS8xvHHj8SDlCI=; b=tl8yE8p/xsFmR5ZO2Lw99aBP7yFnGUEnmzBeZwYVv8
        H4Iw3kYC+dYbse/QEi6kA6r1xlwvx3v/zSYvcHt87Yc0sH/7CQO89u88ywhQygVH
        NFILeh25w6t1FdCFJ+PizFkOHNyl4R15W91CrpmQXXTZiq5Bh/5aDUAUgKFc0j8O
        7d1BPx7cKzT+7iowiHoAN+gMkMkfFFDXEqqK1oH+bDungzcVexhtwMyaQOHX/6sx
        wNkjVgeprZtvZC29nbCC2QcU3HgojEtfT+t3g4YrKHdI6mMs2aYl3OQXsPzXnLhm
        0hvyW12yCElK7sb+lHYONi4J8+5gPXAC6sHBE3ynjhPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=QofX1MTd8AKg6Q1Ih
        mpNRwq7Ya/pFJS8xvHHj8SDlCI=; b=RoxtjgGTyZKyO3djLwOP+8osWGt4d+3dK
        C8PJpe0OBpqKg0uef0HVlKgvEUaBYSlaMgd6gBGUnjz6qbIWo5JHGyy/Vqpwgt9j
        Sfkyu/cOFqSdusF8gwfbVmffqw6FdqfndAJrydA7+W3HAI93hwbLmVP2Gj3LYVxe
        EqOY8uzMtLJSR7tGpT9J8Fw0V5qD34hk5Zh2vo7j0Wu9/66yM1htaYLAXr51x2wG
        IYKL/Kn1qwsty1HbhtAD6U214KyHXqi7q8lBTpcBwrt3yCV0wRsQihnQYfa3cwXo
        /0QU3/VK4NRH64/p6/jYaRb8RZ1MsbbMRygatu2DT/KxqwmEhaO4A==
X-ME-Sender: <xms:2ZzgX0-ZeG3O5_X7YPy5A-F8fYU4GFOTHBUrO1EDUUehdbfBe5ceXg>
    <xme:2ZzgX-urDElhkY3QZHb_7SlQxqQTwC-60X0TwKhSEEYimgSK1dgaeCk2Fo_hQTixR
    ScTVmdwGAmLUTlOJPg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtvddgheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihunhcu
    jggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecuggftrf
    grthhtvghrnhepkeeutdevieejleeifeeuveelteegudfgjeeufeettdefgefhhffgfeeh
    teeitdefnecuffhomhgrihhnpehhvggrugdrshgsnecukfhppeduudegrdekhedrudegvd
    druddufeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:2ZzgXzbW8yu-0uX-LctRFiRY_K0MV72ZN0tnXvMCNWhMCmVYfqSFfg>
    <xmx:2ZzgX2quM7h2ze53XG5vTpX0x3sScCBdocbhViiKpNTxTv1SA1ICAA>
    <xmx:2ZzgXw9sF1RWhRJGyGsQrXaekR7Yx3eB0p5XaPn4X64hXg7Q0Mp75Q>
    <xmx:2pzgX1eSs1ybIdholP9Uvam-TYt1Urw9y0NpptjZRkowRj_B4Olrbk6DY48>
Received: from localhost.localdomain (unknown [114.85.142.113])
        by mail.messagingengine.com (Postfix) with ESMTPA id DEDCA240064;
        Mon, 21 Dec 2020 08:02:14 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: zboot: head.S clean up
Date:   Mon, 21 Dec 2020 21:00:46 +0800
Message-Id: <20201221130048.7753-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

.cprestore is removed as we don't except Position Independent
zboot ELF.

.noreorder is also removed and rest instructions is massaged
to improve readability.

t9 register is used to indirect jump as MIPS ABI requirement.

Reported-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
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
2.29.2

