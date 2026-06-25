Return-Path: <linux-mips+bounces-15209-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o6d0ML4ePWocxQgAu9opvQ
	(envelope-from <linux-mips+bounces-15209-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jun 2026 14:27:42 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 266016C5910
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jun 2026 14:27:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15209-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15209-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C12593169469
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jun 2026 12:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738373E2ACA;
	Thu, 25 Jun 2026 12:19:56 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9973E2ADA;
	Thu, 25 Jun 2026 12:19:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389996; cv=none; b=CaB0Wc04I2ZLL7TePqr8X/xTS1tLC4TkRmSeKtVsqB7cqT6onJQgBK8zA+I1D1mqzXhHvJ8+QGq0l5FlGJU1A+bLLppTQHNyQrmjvXwMOcD+K0RZt4mqe+Oqy4OUEaQI/Ezha93d3tP/q5azMVgqWhfCq6I0iJpYe0OhbdeOPEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389996; c=relaxed/simple;
	bh=upjm9w+/wSI8676/e4fSBgvD1BczjdUW8PBvux1DzMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ctZ1f5iRlb25hqTB4iWpHLZWECZFKZNbcML+ftZa8XOD7uQTvRJNV/YulfW0nLc3p+G3n+6rV/XXxhxrK9jLhFzGEnNC7o/FLsxxKZMzIOnB9GA9VCcIC4Z8+j4kUnOIpeZnuuTEaMgTM2s/8mYUM5/E4FlIdwmjWMAwJPdlZuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 556871F000E9;
	Thu, 25 Jun 2026 12:19:53 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 8/9] MIPS: TXX9: Convert gpio_txx9 to dynamic GPIO base allocation
Date: Thu, 25 Jun 2026 14:19:29 +0200
Message-ID: <f2c0f31691c2e6157146e08ebd8cfe5960a03072.1782389357.git.geert@linux-m68k.org>
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
	TAGGED_FROM(0.00)[bounces-15209-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,linux-m68k.org:mid,linux-m68k.org:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 266016C5910

Static allocation of GPIO base is deprecated, use dynamic allocation.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/mips/include/asm/txx9pio.h | 3 +--
 arch/mips/kernel/gpio_txx9.c    | 5 ++---
 arch/mips/txx9/rbtx4927/setup.c | 4 ++--
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/mips/include/asm/txx9pio.h b/arch/mips/include/asm/txx9pio.h
index 3d6fa9f8d5135411..c33a977244005479 100644
--- a/arch/mips/include/asm/txx9pio.h
+++ b/arch/mips/include/asm/txx9pio.h
@@ -23,7 +23,6 @@ struct txx9_pio_reg {
 	__u32 maskext;
 };
 
-int txx9_gpio_init(unsigned long baseaddr,
-		   unsigned int base, unsigned int num);
+int txx9_gpio_init(unsigned long baseaddr, unsigned int num);
 
 #endif /* __ASM_TXX9PIO_H */
diff --git a/arch/mips/kernel/gpio_txx9.c b/arch/mips/kernel/gpio_txx9.c
index 96ac40d20c238018..b2e73263d94c8419 100644
--- a/arch/mips/kernel/gpio_txx9.c
+++ b/arch/mips/kernel/gpio_txx9.c
@@ -76,13 +76,12 @@ static struct gpio_chip txx9_gpio_chip = {
 	.label = "TXx9",
 };
 
-int __init txx9_gpio_init(unsigned long baseaddr,
-			  unsigned int base, unsigned int num)
+int __init txx9_gpio_init(unsigned long baseaddr, unsigned int num)
 {
 	txx9_pioptr = ioremap(baseaddr, sizeof(struct txx9_pio_reg));
 	if (!txx9_pioptr)
 		return -ENODEV;
-	txx9_gpio_chip.base = base;
+	txx9_gpio_chip.base = -1;
 	txx9_gpio_chip.ngpio = num;
 	return gpiochip_add_data(&txx9_gpio_chip, NULL);
 }
diff --git a/arch/mips/txx9/rbtx4927/setup.c b/arch/mips/txx9/rbtx4927/setup.c
index 618f6a6ab3de08f1..5b69bff99510e214 100644
--- a/arch/mips/txx9/rbtx4927/setup.c
+++ b/arch/mips/txx9/rbtx4927/setup.c
@@ -178,7 +178,7 @@ static void __init rbtx4927_gpio_init(void)
 
 static void __init rbtx4927_arch_init(void)
 {
-	txx9_gpio_init(TX4927_PIO_REG & 0xfffffffffULL, 0, TX4927_NUM_PIO);
+	txx9_gpio_init(TX4927_PIO_REG & 0xfffffffffULL, TX4927_NUM_PIO);
 
 	rbtx4927_gpio_init();
 
@@ -187,7 +187,7 @@ static void __init rbtx4927_arch_init(void)
 
 static void __init rbtx4937_arch_init(void)
 {
-	txx9_gpio_init(TX4938_PIO_REG & 0xfffffffffULL, 0, TX4938_NUM_PIO);
+	txx9_gpio_init(TX4938_PIO_REG & 0xfffffffffULL, TX4938_NUM_PIO);
 
 	rbtx4927_gpio_init();
 
-- 
2.43.0


