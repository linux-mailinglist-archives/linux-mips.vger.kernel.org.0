Return-Path: <linux-mips+bounces-15210-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sSD/HVofPWpGxQgAu9opvQ
	(envelope-from <linux-mips+bounces-15210-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jun 2026 14:30:18 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B7D6C595D
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jun 2026 14:30:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15210-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15210-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB23E316E5D8
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jun 2026 12:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43C63E1236;
	Thu, 25 Jun 2026 12:19:58 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD443E3169;
	Thu, 25 Jun 2026 12:19:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389998; cv=none; b=YNH6ANJvFLCLYb13IxAvjLf8U4sRuX3Qi4RYplS3hRj5yI3lym9FZ0VOhaRHqjVCwMgBt0uPSQ9GR5EjqgoAURXnZf2vC9Xz0SrHDXQhRu+Ri6mVR5FZx8jdl/Am/sCgiaJrG2g/sbeqD4eCTyBLoXRO9CAA9d/B9Qsc2cBNzxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389998; c=relaxed/simple;
	bh=9DSld4lgL7o828qX9kJ1vnSpchduhTfDbvK94xAkwZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sXTwMl5h4xjiHBqgKoZsCxJLIJXfa85K3Czi8prQuBG7bacxg3V+viPZLIGV/z2ogRO/GdZnQbIgVldc11VXzF+TxBYHuScdcUZKCluJk1Th8wmqK6A4taA/Mcf3WJjpLOTf1WhkRes44ORZ1JZ67M1XyUbjumDc2Mn0L2zPLzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6411F00A3A;
	Thu, 25 Jun 2026 12:19:55 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 9/9] MIPS: TXX9: Clean up txx9_iocled_init()
Date: Thu, 25 Jun 2026 14:19:30 +0200
Message-ID: <1b51ebc5e63ab41070e099bcc4ec1e8d9b85add5.1782389357.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1782389357.git.geert@linux-m68k.org>
References: <cover.1782389357.git.geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tsbogend@alpha.franken.de,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:linux-mips@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@linux-m68k.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15210-lists,linux-mips=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-mips@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,linux-m68k.org:mid,linux-m68k.org:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E2B7D6C595D

The sole caller already uses dynamic GPIO base allocation, so drop
support for static allocation.
While at it, drop the no longer used "lowactive" parameter.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/mips/include/asm/txx9/generic.h |  3 +--
 arch/mips/txx9/generic/setup.c       | 12 ++++--------
 arch/mips/txx9/rbtx4927/setup.c      |  2 +-
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/arch/mips/include/asm/txx9/generic.h b/arch/mips/include/asm/txx9/generic.h
index 5ce5b8579a444ec3..653315fb6ca559a7 100644
--- a/arch/mips/include/asm/txx9/generic.h
+++ b/arch/mips/include/asm/txx9/generic.h
@@ -79,8 +79,7 @@ static inline unsigned int __fls8(unsigned char x)
 	return r;
 }
 
-void txx9_iocled_init(unsigned long baseaddr,
-		      int basenum, unsigned int num, int lowactive,
+void txx9_iocled_init(unsigned long baseaddr, unsigned int num,
 		      const char *color, char **deftriggers);
 
 void __init txx9_aclc_init(unsigned long baseaddr, int irq,
diff --git a/arch/mips/txx9/generic/setup.c b/arch/mips/txx9/generic/setup.c
index 32246f5f78f5070c..5f66236038c8f468 100644
--- a/arch/mips/txx9/generic/setup.c
+++ b/arch/mips/txx9/generic/setup.c
@@ -625,8 +625,7 @@ static struct gpiod_lookup_table txx9_iocled_table = {
 	},
 };
 
-void __init txx9_iocled_init(unsigned long baseaddr,
-			     int basenum, unsigned int num, int lowactive,
+void __init txx9_iocled_init(unsigned long baseaddr, unsigned int num,
 			     const char *color, char **deftriggers)
 {
 	struct txx9_iocled_data *iocled;
@@ -652,14 +651,12 @@ void __init txx9_iocled_init(unsigned long baseaddr,
 	iocled->chip.direction_input = txx9_iocled_dir_in;
 	iocled->chip.direction_output = txx9_iocled_dir_out;
 	iocled->chip.label = "iocled";
-	iocled->chip.base = basenum;
+	iocled->chip.base = -1;
 	iocled->chip.ngpio = num;
 	if (gpiochip_add_data(&iocled->chip, iocled))
 		goto out_unmap;
-	if (basenum < 0)
-		basenum = iocled->chip.base;
 
-	pdev = platform_device_alloc("leds-gpio", basenum);
+	pdev = platform_device_alloc("leds-gpio", iocled->chip.base);
 	if (!pdev)
 		goto out_gpio;
 	iocled->pdata.num_leds = num;
@@ -689,8 +686,7 @@ void __init txx9_iocled_init(unsigned long baseaddr,
 	kfree(iocled);
 }
 #else /* CONFIG_LEDS_GPIO */
-void __init txx9_iocled_init(unsigned long baseaddr,
-			     int basenum, unsigned int num, int lowactive,
+void __init txx9_iocled_init(unsigned long baseaddr, unsigned int num,
 			     const char *color, char **deftriggers)
 {
 }
diff --git a/arch/mips/txx9/rbtx4927/setup.c b/arch/mips/txx9/rbtx4927/setup.c
index 5b69bff99510e214..51c06c5090f1abcd 100644
--- a/arch/mips/txx9/rbtx4927/setup.c
+++ b/arch/mips/txx9/rbtx4927/setup.c
@@ -370,7 +370,7 @@ static void __init rbtx4927_device_init(void)
 		tx4938_aclc_init();
 	}
 	platform_device_register_simple("txx9aclc-generic", -1, NULL, 0);
-	txx9_iocled_init(RBTX4927_LED_ADDR - IO_BASE, -1, 3, 1, "green", NULL);
+	txx9_iocled_init(RBTX4927_LED_ADDR - IO_BASE, 3, "green", NULL);
 	rbtx4927_gpioled_init();
 }
 
-- 
2.43.0


