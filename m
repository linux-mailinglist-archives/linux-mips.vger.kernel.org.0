Return-Path: <linux-mips+bounces-3132-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB2C8BE74B
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 17:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A106C1C23B87
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 15:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910691649BF;
	Tue,  7 May 2024 15:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="sl+zPdoT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="agEadtly"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh8-smtp.messagingengine.com (wfhigh8-smtp.messagingengine.com [64.147.123.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99741635B4;
	Tue,  7 May 2024 15:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715095334; cv=none; b=e4FEAsURbAGbk4W/fN0UgtvTf2d9aYetcpGx0x2iXgvK/5ziXiwQZyU0u/VSzP5Ygcnw+v6O/J4vbZxQMD/4b4sB+z+/Rxz2HG5Heo/fFHBQw1XV8f6e6nwIZ/LgnE1+0H7jANbtKEKPraoTOB1kXcyPl59aJ3eEBP1wJy4r+a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715095334; c=relaxed/simple;
	bh=qXXoGV6i4NzNa9jr9/H0yCDHFV+OWy2FwzBUaOEhp5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ugBakTRTrXPuleY4ddawk0sHpxmnvyi+i09KvEpCKCROvmOcJ3RZf8iCojTNbNjODESiHwwQmp8qCD8uZjeaVYmREjKMOmuzxoFqUjP3Sr6AHWD55zG6ZABgzuhzK7mp623jjMoAB/YbNo8Ljod6PsX2AwcUjcju/SdLSblmkd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=sl+zPdoT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=agEadtly; arc=none smtp.client-ip=64.147.123.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.west.internal (Postfix) with ESMTP id 8A87B18000F0;
	Tue,  7 May 2024 11:22:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 07 May 2024 11:22:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1715095331;
	 x=1715181731; bh=r+qM25PDwQQfzbe2OzFvr0B7xCYpWc9mVVvuKOrfTtY=; b=
	sl+zPdoT9wWr+w9cwBqrjmNMPk3/sb+NbW+PJXc0HkGMnvuf3tP+Dvs0wvxjP5Kk
	JasbjiTyDBr9/C00wEnA7ynpMeZTq2uhoSzPvUn/PuDaVR6KufuQIBPHQsLga5hu
	EXRLxurntl7Dr3OypLlOxiWrZj9d6zrDC7PyOnxI/WsGfPMqKWzgMfKKKm64pmy/
	fItbdWUy65kNqSmarrwB+2PeHEYNM4GO/P54bcY0XqtI+19Yd60vha9j+uOCY3Xb
	oQMWurn7cki/fVY1OAlx77ZqLx1CY/lpmqfB522oX7qZlTTo/+ApknewjYoNYZBo
	jZ0pPTBJ2NsjaharfBdj8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715095331; x=
	1715181731; bh=r+qM25PDwQQfzbe2OzFvr0B7xCYpWc9mVVvuKOrfTtY=; b=a
	gEadtlypw0aLQn1jId3sRG4cwCxH0nMsSID+5y8QFqaS/hW6HeCllw/p00j300zP
	dVXcPum6B+yHUyJmxE5g2Y1Mztm6gfphM8wRvcK8L85c6Nk4eIiA/j2zwj7WaTeV
	0o8OBF8DH7J+ydiPYN4p4fM9lN68AonW+jHxsIDycR5/YQpam3NpthVQgSbCg5cH
	+kuqgnfmXMQEBOF+enL7VFFdEdZHPCxYKCuwKW8nkRbpFy0tcZGY6nGI9iY4d7KD
	q4NkdL+IwWTuoSntKVLPRJWj63WRM226cbvh+pF41tkZeOzfZMXv/HClK6rRUnyn
	fPoNNEJ9ElvTMFIVOO8TQ==
X-ME-Sender: <xms:Ikc6ZiJXZOLlpk51f8nfH1LU7fE3S9f8lbOaPyL3JkOkar3CeT7nOA>
    <xme:Ikc6ZqLBT6IG4emjAQ8RkooTq30o2AysB4VBiXp_23FcVlEp7Is7gIRGmRVRFUgVO
    RvmHFsc67zN5nz5lO4>
X-ME-Received: <xmr:Ikc6ZitWpbif3rxMuBJm3WQk_rB0LdPzdwaTd6n2fhCCbq__NdLUrWI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:Ikc6Zna-Vyj4Gm6qqA7rxWG8UaQz4COwjymK3y9SCdOQTlwbzI0cLA>
    <xmx:Ikc6ZpbghSfkbzqzLCz-UTVSjwvxkZpKNcOzBy1Kxf23AsPHxwqkpw>
    <xmx:Ikc6ZjAA9rpcqMlTf8nn3aMOj4DrbZweLIQUM4OG5cNSeYq2ntq8HA>
    <xmx:Ikc6ZvbFxt3RKtIjiWU4kyqDaDYHgS3G4xWqiEj0b14JKZJVWrdftA>
    <xmx:I0c6ZszF8nZHif12KFUWlS07es_28Lf1kewNx6n9-zLKCCajV9KzkkbU>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 May 2024 11:22:10 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Tue, 07 May 2024 16:21:59 +0100
Subject: [PATCH 1/3] MIPS: asm/pm.h: Use platform agnostic macros
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-loongson64-suspend-v1-1-534d92a4e09a@flygoat.com>
References: <20240507-loongson64-suspend-v1-0-534d92a4e09a@flygoat.com>
In-Reply-To: <20240507-loongson64-suspend-v1-0-534d92a4e09a@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Huacai Chen <chenhuacai@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2278;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=qXXoGV6i4NzNa9jr9/H0yCDHFV+OWy2FwzBUaOEhp5Y=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhjQrd8WKvkvJ7I/f329wqD0u8nNG24UjLzdOXCjH6Vgmx
 XHCSoupo5SFQYyDQVZMkSVEQKlvQ+PFBdcfZP2BmcPKBDKEgYtTACZSl8TI0OY91yI92ymAt7It
 SFYkatXid9+cUyTVnn8pvnf0rebuyYwME9rvZyrwbFvi8vf8t6jkv55Ha62mXp9548mnlcvuTBA
 9wwIA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Use platform agnostic macros so it can be compiled on all
MIPS platforms.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/pm.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/mips/include/asm/pm.h b/arch/mips/include/asm/pm.h
index 10bb7b640738..7ecd4dfe3846 100644
--- a/arch/mips/include/asm/pm.h
+++ b/arch/mips/include/asm/pm.h
@@ -17,7 +17,7 @@
 
 /* Save CPU state to stack for suspend to RAM */
 .macro SUSPEND_SAVE_REGS
-	subu	sp, PT_SIZE
+	PTR_SUBU	sp, PT_SIZE
 	/* Call preserved GPRs */
 	LONG_S	$16, PT_R16(sp)
 	LONG_S	$17, PT_R17(sp)
@@ -56,13 +56,13 @@
 	LONG_L	$31, PT_R31(sp)
 	/* Pop and return */
 	jr	ra
-	 addiu	sp, PT_SIZE
+	 PTR_ADDIU	sp, PT_SIZE
 	.set	pop
 .endm
 
 /* Get address of static suspend state into t1 */
 .macro LA_STATIC_SUSPEND
-	la	t1, mips_static_suspend_state
+	PTR_LA	t1, mips_static_suspend_state
 .endm
 
 /* Save important CPU state for early restoration to global data */
@@ -72,11 +72,11 @@
 	 * Segment configuration is saved in global data where it can be easily
 	 * reloaded without depending on the segment configuration.
 	 */
-	mfc0	k0, CP0_PAGEMASK, 2	/* SegCtl0 */
+	mfc0	k0, CP0_SEGCTL0
 	LONG_S	k0, SSS_SEGCTL0(t1)
-	mfc0	k0, CP0_PAGEMASK, 3	/* SegCtl1 */
+	mfc0	k0, CP0_SEGCTL1
 	LONG_S	k0, SSS_SEGCTL1(t1)
-	mfc0	k0, CP0_PAGEMASK, 4	/* SegCtl2 */
+	mfc0	k0, CP0_SEGCTL2
 	LONG_S	k0, SSS_SEGCTL2(t1)
 #endif
 	/* save stack pointer (pointing to GPRs) */
@@ -92,11 +92,11 @@
 	 * segments.
 	 */
 	LONG_L	k0, SSS_SEGCTL0(t1)
-	mtc0	k0, CP0_PAGEMASK, 2	/* SegCtl0 */
+	mtc0	k0, CP0_SEGCTL0
 	LONG_L	k0, SSS_SEGCTL1(t1)
-	mtc0	k0, CP0_PAGEMASK, 3	/* SegCtl1 */
+	mtc0	k0, CP0_SEGCTL1
 	LONG_L	k0, SSS_SEGCTL2(t1)
-	mtc0	k0, CP0_PAGEMASK, 4	/* SegCtl2 */
+	mtc0	k0, CP0_SEGCTL2
 	tlbw_use_hazard
 #endif
 	/* restore stack pointer (pointing to GPRs) */
@@ -105,10 +105,10 @@
 
 /* flush caches to make sure context has reached memory */
 .macro SUSPEND_CACHE_FLUSH
-	.extern	__wback_cache_all
+	.extern	__flush_cache_all
 	.set	push
 	.set	noreorder
-	la	t1, __wback_cache_all
+	PTR_LA	t1, __flush_cache_all
 	LONG_L	t0, 0(t1)
 	jalr	t0
 	 nop

-- 
2.34.1


