Return-Path: <linux-mips+bounces-15207-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q7oqGe0dPWrkxAgAu9opvQ
	(envelope-from <linux-mips+bounces-15207-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jun 2026 14:24:13 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3946C587A
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jun 2026 14:24:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15207-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15207-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9EB48307841F
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jun 2026 12:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81F73E275F;
	Thu, 25 Jun 2026 12:19:51 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D897B3E274C;
	Thu, 25 Jun 2026 12:19:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389991; cv=none; b=UW8I+COx1cyGi9ggGBx+QBH4j+xBFW5MrqEpAbFpPYB1XTlQ/s6MvQc7G1H/Lo+pemK2rKXyYoaAQ726kGXar4w3YER4PAouDg+Le8+AfkAcQrcmMDWOkm2yLFnvgA+rjAnfkuvbvSVXqUl2avdQLpRBEHdff3KU9ExmF7BOHGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389991; c=relaxed/simple;
	bh=6dqD6ETq6rf6eGqzglaK3mOpvAmac9L9znTSja474N4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AyWFd/cpwTBKgUw2q9zXzDfQn4U1WmUr8/kbRavN2Lr1wBEsH3BPCfnhqdRtFBdgQCMinap004Ddr/LLyoup7m4Ee/BIU7IIg96S06bjm+5mdTWMOKCbTMfmgKKhyS1RS/j35z1tTbFZAO71QBpqvNvyYje/mRFtHQCYrf2TXnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 121F91F000E9;
	Thu, 25 Jun 2026 12:19:48 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 6/9] MIPS: TXX9: Use GPIO lookup table for iocled LEDs
Date: Thu, 25 Jun 2026 14:19:27 +0200
Message-ID: <239f96934a9bbd4bb93e0130e9adb00f466e9135.1782389357.git.geert@linux-m68k.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
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
	TAGGED_FROM(0.00)[bounces-15207-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linux-m68k.org:email,linux-m68k.org:mid,linux-m68k.org:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB3946C587A

Convert iocled LED description from legacy GPIO numbers to GPIO
descriptors using a GPIO lookup table.

For now, just ignore the "lowactive" parameter, and force
GPIO_ACTIVE_LOW, as that is what the sole caller wants.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/mips/txx9/generic/setup.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/mips/txx9/generic/setup.c b/arch/mips/txx9/generic/setup.c
index 611ccbe429cfe7e1..32246f5f78f5070c 100644
--- a/arch/mips/txx9/generic/setup.c
+++ b/arch/mips/txx9/generic/setup.c
@@ -19,6 +19,7 @@
 #include <linux/clkdev.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/txx9/ndfmc.h>
 #include <linux/serial_core.h>
@@ -615,6 +616,15 @@ static int txx9_iocled_dir_out(struct gpio_chip *chip, unsigned int offset,
 	return 0;
 }
 
+static struct gpiod_lookup_table txx9_iocled_table = {
+	.table = {
+		GPIO_LOOKUP_IDX("iocled", 0, NULL, 0, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("iocled", 1, NULL, 1, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("iocled", 2, NULL, 2, GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
+
 void __init txx9_iocled_init(unsigned long baseaddr,
 			     int basenum, unsigned int num, int lowactive,
 			     const char *color, char **deftriggers)
@@ -659,14 +669,14 @@ void __init txx9_iocled_init(unsigned long baseaddr,
 		snprintf(iocled->names[i], sizeof(iocled->names[i]),
 			 "iocled:%s:%u", color, i);
 		led->name = iocled->names[i];
-		led->gpio = basenum + i;
-		led->active_low = lowactive;
 		if (deftriggers && *deftriggers)
 			led->default_trigger = *deftriggers++;
 	}
 	pdev->dev.platform_data = &iocled->pdata;
 	if (platform_device_add(pdev))
 		goto out_pdev;
+	txx9_iocled_table.dev_id = dev_name(&pdev->dev);
+	gpiod_add_lookup_table(&txx9_iocled_table);
 	return;
 
 out_pdev:
-- 
2.43.0


