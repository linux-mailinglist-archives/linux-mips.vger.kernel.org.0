Return-Path: <linux-mips+bounces-15390-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lMGvNcjqRGp33AoAu9opvQ
	(envelope-from <linux-mips+bounces-15390-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 12:24:08 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D85776EC1D1
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 12:24:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15390-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15390-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A4113304E40F
	for <lists+linux-mips@lfdr.de>; Wed,  1 Jul 2026 10:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC13240BCCD;
	Wed,  1 Jul 2026 10:12:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBBB40DFCF;
	Wed,  1 Jul 2026 10:12:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782900729; cv=none; b=e9TAjMushjh3tDP+Osz30wp3WaJAeFX2BuLxgUtsJoPREgbfgH0A35w9AzFHSms0pyw0hI2ZK7KNuSvcaAKbbviCxJmCIHVHFaXe6eebC4m9obKNSYYdkx61kHUxn6ILuWpF3sEAS2t8RdXbcp4VlMrmJ7rDGWz2IO0Dpun1/LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782900729; c=relaxed/simple;
	bh=B0DBPdbDcgJGH2EFbbmm8OmRu5Kh0J1h0+vJkGdUY4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vEu6dwYGXZx6FoViuxu+nNWtD/jF8q9WjuRCoDehIuEyIowP8BUeL2zPynmpRvHO7osnYSQGm5bmGdMXGvcLpnHE3N8C4f91Y69o/IaUrTYnqkgvNmVJUqdBosuWfOBwNaTwqyVaTSaqVPJQ3pvcGIt++Api6t2+2YjUfjnnGUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B111F000E9;
	Wed,  1 Jul 2026 10:12:06 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 6/9] MIPS: TXX9: Use GPIO lookup table for iocled LEDs
Date: Wed,  1 Jul 2026 12:11:41 +0200
Message-ID: <68c915761e5234ad64cd62024fbac39ab097494d.1782900491.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1782900491.git.geert@linux-m68k.org>
References: <cover.1782900491.git.geert@linux-m68k.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:tsbogend@alpha.franken.de,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:linux-mips@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@linux-m68k.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15390-lists,linux-mips=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-mips@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linux-m68k.org:email,linux-m68k.org:mid,linux-m68k.org:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D85776EC1D1

Convert iocled LED description from legacy GPIO numbers to GPIO
descriptors using a GPIO lookup table.

For now, just ignore the "lowactive" parameter, and force
GPIO_ACTIVE_LOW, as that is what the sole caller wants.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
v2:
  - Add Reviewed-by.
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


