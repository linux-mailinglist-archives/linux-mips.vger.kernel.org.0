Return-Path: <linux-mips+bounces-15202-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SIzfMw8fPWo1xQgAu9opvQ
	(envelope-from <linux-mips+bounces-15202-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jun 2026 14:29:03 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FECD6C593E
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jun 2026 14:29:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15202-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15202-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93D3230FA055
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jun 2026 12:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD4E83E00AA;
	Thu, 25 Jun 2026 12:19:41 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3E43E0245;
	Thu, 25 Jun 2026 12:19:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389981; cv=none; b=MREegW9nB+w7fxPH7KauQKm4meTQtK+jtVR3CK7jrnX7cJbZVobIIklojVitmY7PVNs0ispDb7h8OOy9oUENIuo0dJko/ZSSwAL/EmltpsOfNscOXuKp0vPIs7Ea9MUEVxuWKy5IHkjDxFj/8OdO0uOGcZq8/3zXdjFrxuf/CxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389981; c=relaxed/simple;
	bh=sVCMEB686KRf2ouZw+Ca8Xeu1oXO8abFZ5bKokVCcY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aMVSqEYAldATx+nzsvuhgjMC0oS4DDedu4mrR8+9qJHlwJaRVH1CR6uYedZSFztFx1+fh70lAH6N0fKjqRStyU6/ZSD9yrEs0Y1Ye7SC9HcKUX1pCe3tS5EA1WC9533VL44geOF2GY991x9hlR/oZ7iYLWMeByKk8nzsYJamBCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961721F00A3A;
	Thu, 25 Jun 2026 12:19:38 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 1/9] MIPS: TXX9: Remove tx4938_spi_init() and txx9_spi_init()
Date: Thu, 25 Jun 2026 14:19:22 +0200
Message-ID: <c9a39ce801ab0b6c07717816272255a166790274.1782389357.git.geert@linux-m68k.org>
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
	TAGGED_FROM(0.00)[bounces-15202-lists,linux-mips=lfdr.de];
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
X-Rspamd-Queue-Id: 3FECD6C593E

The last user of tx4938_spi_init() was removed in commit
21d638ef9483d8cf ("MIPS: TXX9: Remove rbtx4938 board support").

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/mips/include/asm/txx9/generic.h  |  1 -
 arch/mips/include/asm/txx9/tx4938.h   |  1 -
 arch/mips/txx9/generic/setup.c        | 17 -----------------
 arch/mips/txx9/generic/setup_tx4938.c |  6 ------
 4 files changed, 25 deletions(-)

diff --git a/arch/mips/include/asm/txx9/generic.h b/arch/mips/include/asm/txx9/generic.h
index 9a2c47bf3c4045e7..3813ab9ccf717ada 100644
--- a/arch/mips/include/asm/txx9/generic.h
+++ b/arch/mips/include/asm/txx9/generic.h
@@ -45,7 +45,6 @@ extern int (*txx9_irq_dispatch)(int pending);
 const char *prom_getenv(const char *name);
 void txx9_wdt_init(unsigned long base);
 void txx9_wdt_now(unsigned long base);
-void txx9_spi_init(int busid, unsigned long base, int irq);
 void txx9_ethaddr_init(unsigned int id, unsigned char *ethaddr);
 void txx9_sio_init(unsigned long baseaddr, int irq,
 		   unsigned int line, unsigned int sclk, int nocts);
diff --git a/arch/mips/include/asm/txx9/tx4938.h b/arch/mips/include/asm/txx9/tx4938.h
index 6ca767ee6467ca88..765f7d6a44d36ee6 100644
--- a/arch/mips/include/asm/txx9/tx4938.h
+++ b/arch/mips/include/asm/txx9/tx4938.h
@@ -281,7 +281,6 @@ void tx4938_wdt_init(void);
 void tx4938_setup(void);
 void tx4938_time_init(unsigned int tmrnr);
 void tx4938_sio_init(unsigned int sclk, unsigned int cts_mask);
-void tx4938_spi_init(int busid);
 void tx4938_ethaddr_init(unsigned char *addr0, unsigned char *addr1);
 int tx4938_report_pciclk(void);
 void tx4938_report_pci1clk(void);
diff --git a/arch/mips/txx9/generic/setup.c b/arch/mips/txx9/generic/setup.c
index 6c5025806914f989..97102d3327d22828 100644
--- a/arch/mips/txx9/generic/setup.c
+++ b/arch/mips/txx9/generic/setup.c
@@ -341,23 +341,6 @@ void txx9_wdt_now(unsigned long base)
 		     &tmrptr->tcr);
 }
 
-/* SPI support */
-void __init txx9_spi_init(int busid, unsigned long base, int irq)
-{
-	struct resource res[] = {
-		{
-			.start	= base,
-			.end	= base + 0x20 - 1,
-			.flags	= IORESOURCE_MEM,
-		}, {
-			.start	= irq,
-			.flags	= IORESOURCE_IRQ,
-		},
-	};
-	platform_device_register_simple("spi_txx9", busid,
-					res, ARRAY_SIZE(res));
-}
-
 void __init txx9_ethaddr_init(unsigned int id, unsigned char *ethaddr)
 {
 	struct platform_device *pdev =
diff --git a/arch/mips/txx9/generic/setup_tx4938.c b/arch/mips/txx9/generic/setup_tx4938.c
index ba646548c5f694bd..bfd6540f8f6a406b 100644
--- a/arch/mips/txx9/generic/setup_tx4938.c
+++ b/arch/mips/txx9/generic/setup_tx4938.c
@@ -301,12 +301,6 @@ void __init tx4938_sio_init(unsigned int sclk, unsigned int cts_mask)
 	}
 }
 
-void __init tx4938_spi_init(int busid)
-{
-	txx9_spi_init(busid, TX4938_SPI_REG & 0xfffffffffULL,
-		      TXX9_IRQ_BASE + TX4938_IR_SPI);
-}
-
 void __init tx4938_ethaddr_init(unsigned char *addr0, unsigned char *addr1)
 {
 	u64 pcfg = __raw_readq(&tx4938_ccfgptr->pcfg);
-- 
2.43.0


