Return-Path: <linux-mips+bounces-4875-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B16B9501D6
	for <lists+linux-mips@lfdr.de>; Tue, 13 Aug 2024 11:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F2A61C20F37
	for <lists+linux-mips@lfdr.de>; Tue, 13 Aug 2024 09:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE3F18733C;
	Tue, 13 Aug 2024 09:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="KfxwyPzR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iuwB9IF/"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F4313BADF;
	Tue, 13 Aug 2024 09:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723543153; cv=none; b=WUGdL2ZgN9ZwAVeP7W4efkXNw1hcbtYtDtaphtXhNm3zGAd7HwZY8F5qkRSvD8RDK5eLvBRaD/MpatHIihgYlkwHxnS6k+7kJlQR82yNg3ckW5UtBoOIwZG77IWMORi7nieWjg6iatfJ4h6fk8Uic4mdeNvxGGm2qO87j8bA2ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723543153; c=relaxed/simple;
	bh=Yg+SvLnKDfc6IhCsYzXH5LG+1D5ljKI1al26FDrP2Co=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=s2JsN1xjYPYV5PoOqFUHdu4WsNazNM8HgaUSXqu0r7g4JVGI7dtugtjMYz7e4FxLzG8qoG1/t6w+5Z/fZP9aAX4+ZVmp23lKZE+7+YVLvwilV2+ezrU8p4F3XupJNgZj0XI6ckekRk+wq85ckjhadilo1xeBgkpTnrVpbDImL8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=KfxwyPzR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iuwB9IF/; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-08.internal (phl-compute-08.nyi.internal [10.202.2.48])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 8147E11519A2;
	Tue, 13 Aug 2024 05:59:10 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Tue, 13 Aug 2024 05:59:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1723543150; x=1723629550; bh=6Q
	d4aztaFlRmvO0r2D6tqPKDXCbzC6+wHcCsX84k054=; b=KfxwyPzR+JP8HaDhik
	Oh8b+ZHmBoNYtVwDEgQDWtBVy36LeCpcHv9PJK8vPyCUeRfINEpdCcxh3hEHEhLN
	XHDIj1bhNcuYfVIgwJKzr4ptmAvY/le9llj85LfXoxP2HVGc1I+qGlCZUkJy15jw
	UvbNpQ7MoylRrl3cnxwGqEzhiRc1Um96UqAvg61l+DKMMtDoj5OhzPYxPizwe3Dk
	wpOmTXEATH9WL33Bh1eTWiEDyEfH2GlhJz+yrPG4txzPsvZfpk83oKn9MrjDgVsZ
	Kp/lD2xG/UFnOKO5xNRbmBatPvgPMAsKsmvBrB7sGOmz/mvn5R0a+XqmuQeWlF6F
	n6cQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1723543150; x=1723629550; bh=6Qd4aztaFlRmv
	O0r2D6tqPKDXCbzC6+wHcCsX84k054=; b=iuwB9IF/aYgR7T/wVNOdFkJzbBSa7
	PKX7dCJD8Ei9pg/XIZePdt9Gu4w+MyrrNqvC9HxB37tA2x/xmh9AnKLuDSDQG1Px
	6oqxPDFFkjFHHpRc2TRKOs3tlr553cBkINTmsm0J8BZMdNJYM8FU4tsU10xxk0Vi
	65tpuSPTGiStjFex6G+QdrXYIyVbuv2dMxCUrtGka/FjvF/y6sv0HxvwkAk+rWmp
	CJcfHPC51PvP5TMkcYit6UBSR/5LoCTL7rlTcp3HPj2Ea+RU/5ntu05Au9JTuinf
	vu5f5qEoz25FnfKYwfalNe+gzWm+Z7agwRdb/VGyaFG32CIX8TtYG5s3A==
X-ME-Sender: <xms:bi67ZpSRgJg11ezP0ninKcS5TrT07V9ZSyDUiAVL5-Y4wQ113LkUfw>
    <xme:bi67ZiwQ70VJ5smF7eeDhtsMVBVRAg1QcU6KClPtvk7dYcuzzyKGgWpFY36F-Ht4V
    umpQjEuZZMohLnH4rY>
X-ME-Received: <xmr:bi67Zu3CQZfkDFVfnPsAlumOcqr3KTZSTMRn_31aLvcREc1kXIRtgp682mnG1xborg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddtvddgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecu
    hfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomheqnecuggftrfgrthhtvghrnhephfffgeejgfejieeugffgudegvdekffev
    geeuteetgeejveeiteeivedvffehlefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgr
    gihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphhtthhopeehpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehjihgrgihunhdrhigrnhhgsehflhihghho
    rghtrdgtohhmpdhrtghpthhtohepfhgrnhgtvghrrdhlrghntggvrhesghhmrghilhdrtg
    homhdprhgtphhtthhopehlihhnuhigqdhmihhpshesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpd
    hrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:bi67ZhBZgPkBJgU86CNZ490PKUtIKWVa5uLt3eyXlUBo3uEcilqZBA>
    <xmx:bi67ZigQrsJtaz15ges34xJCP-EzpZbRtcPSKKHq1El1ZcVOSjTzHA>
    <xmx:bi67ZlptZ1y2kJJ9JVFdLtotrTteF53R43A6xrmuU7pTGzUDhbo62w>
    <xmx:bi67Ztj83ZHSK_xHLyN4KZ4oluVYIf7ciqEJ0SGKzKPGMIaOFr_yrQ>
    <xmx:bi67ZkZ9Bf8N8CUFsBqnJP3toQNjD2fzHsPO1f10g2IeTx_RLRfDczzx>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Aug 2024 05:59:09 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Tue, 13 Aug 2024 10:59:08 +0100
Subject: [PATCH] MIPS: cevt-r4k: Don't call get_c0_compare_int if timer irq
 is installed
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-get_c0_compare_int-v1-1-a0a1b007d736@flygoat.com>
X-B4-Tracking: v=1; b=H4sIAGsuu2YC/x3MTQqAIBBA4avIrBP8qbCuEiFiU80iFY0IorsnL
 b/Few8UzIQFRvZAxosKxVAhGwZ+d2FDTks1KKFaYaTiG57WC+vjkVxGS+HkfT/oznTaaWGghin
 jSvc/neb3/QC9pHSyZAAAAA==
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Serge Semin <fancer.lancer@gmail.com>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2142;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=Yg+SvLnKDfc6IhCsYzXH5LG+1D5ljKI1al26FDrP2Co=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTdermBTFofi+0NFs+MnXj2kdj+ndVP68vX7uHbV5yey
 G011dayo5SFQYyLQVZMkSVEQKlvQ+PFBdcfZP2BmcPKBDKEgYtTACbikM3wV7px++enLJOd94r0
 pHvJf8s83fx+5f1mj5gruTs8NQzO7GZkeH7l4o7JV21vt+2QaazqPX/6XLDky86kRR0y5i7R01Y
 IcAAA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

This avoids warning:

[    0.118053] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:283

Caused by get_c0_compare_int on secondary CPU.

We also skipped saving IRQ number to struct clock_event_device *cd as
it's never used by clockevent core, as per comments it's only meant
for "non CPU local devices".

Reported-by: Serge Semin <fancer.lancer@gmail.com>
Closes: https://lore.kernel.org/linux-mips/6szkkqxpsw26zajwysdrwplpjvhl5abpnmxgu2xuj3dkzjnvsf@4daqrz4mf44k/
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/cevt-r4k.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/mips/kernel/cevt-r4k.c b/arch/mips/kernel/cevt-r4k.c
index 368e8475870f..5f6e9e2ebbdb 100644
--- a/arch/mips/kernel/cevt-r4k.c
+++ b/arch/mips/kernel/cevt-r4k.c
@@ -303,13 +303,6 @@ int r4k_clockevent_init(void)
 	if (!c0_compare_int_usable())
 		return -ENXIO;
 
-	/*
-	 * With vectored interrupts things are getting platform specific.
-	 * get_c0_compare_int is a hook to allow a platform to return the
-	 * interrupt number of its liking.
-	 */
-	irq = get_c0_compare_int();
-
 	cd = &per_cpu(mips_clockevent_device, cpu);
 
 	cd->name		= "MIPS";
@@ -320,7 +313,6 @@ int r4k_clockevent_init(void)
 	min_delta		= calculate_min_delta();
 
 	cd->rating		= 300;
-	cd->irq			= irq;
 	cd->cpumask		= cpumask_of(cpu);
 	cd->set_next_event	= mips_next_event;
 	cd->event_handler	= mips_event_handler;
@@ -332,6 +324,13 @@ int r4k_clockevent_init(void)
 
 	cp0_timer_irq_installed = 1;
 
+	/*
+	 * With vectored interrupts things are getting platform specific.
+	 * get_c0_compare_int is a hook to allow a platform to return the
+	 * interrupt number of its liking.
+	 */
+	irq = get_c0_compare_int();
+
 	if (request_irq(irq, c0_compare_interrupt, flags, "timer",
 			c0_compare_interrupt))
 		pr_err("Failed to request irq %d (timer)\n", irq);

---
base-commit: 9e6869691724b12e1f43655eeedc35fade38120c
change-id: 20240812-get_c0_compare_int-66935853a308

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>


