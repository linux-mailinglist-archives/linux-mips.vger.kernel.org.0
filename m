Return-Path: <linux-mips+bounces-15388-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i1gwBpnpRGr/2woAu9opvQ
	(envelope-from <linux-mips+bounces-15388-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 12:19:05 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 549E06EC071
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 12:19:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15388-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15388-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B9F83108DA7
	for <lists+linux-mips@lfdr.de>; Wed,  1 Jul 2026 10:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707CA403B01;
	Wed,  1 Jul 2026 10:12:04 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654AB409610;
	Wed,  1 Jul 2026 10:12:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782900724; cv=none; b=SLSeIC+mwXBjOGdOjCN0Tx8RueHHdO1CmEGOnOS53M8R0ruByvPUyy+EjR/atLQedDpAM/nDZ+Ns2TfVaifBYVZ3+OmvZ7QSgtvzJLS6J+oNi4CPKherzxbniDnfXgIAaDz1PBnDBzhIwox560yKMFQn3nF209kiTurG81FqTso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782900724; c=relaxed/simple;
	bh=mNYqsqOZvNhjixXZv8Ezr1zqEiJxw40GTEU/SdZDdJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J68QlXMRWD1wdraf3O5LWySQ6Ph5VsHCdmot6tRltqcR4RmafEEMVUTW3cJlcnc1Y54pwFQYrtHS3w2WICWyvozkAa+10ufKu6PuhKe56FiPOho5x9TDOTBiEuDMeulrbnV4fedi8OQHCKSjZepjCYiyM1qhzL1sV9zOxBShbFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573771F000E9;
	Wed,  1 Jul 2026 10:12:01 +0000 (UTC)
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
Subject: [PATCH v2 4/9] MIPS: TXX9: rbtx4927: Use GPIO lookup table for TXx9 LEDs
Date: Wed,  1 Jul 2026 12:11:39 +0200
Message-ID: <92613064355ad1228b0f43031fc6c5d781e7d4f6.1782900491.git.geert@linux-m68k.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tsbogend@alpha.franken.de,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:linux-mips@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@linux-m68k.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15388-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,linux-m68k.org:email,linux-m68k.org:mid,linux-m68k.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 549E06EC071

Convert TXx9 LED description from legacy GPIO numbers to GPIO
descriptors using a GPIO lookup table.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
v2:
  - Add Reviewed-by,
  - Return early on platform_device_add() failure.
---
 arch/mips/txx9/rbtx4927/setup.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/mips/txx9/rbtx4927/setup.c b/arch/mips/txx9/rbtx4927/setup.c
index e57c409c318ca220..75674b4cc91d7207 100644
--- a/arch/mips/txx9/rbtx4927/setup.c
+++ b/arch/mips/txx9/rbtx4927/setup.c
@@ -327,11 +327,19 @@ static void __init rbtx4927_mtd_init(void)
 		tx4927_mtd_init(i);
 }
 
+static struct gpiod_lookup_table rbtx4927_gpioled_table = {
+	.table = {
+		GPIO_LOOKUP_IDX("TXx9", 0, NULL, 0, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("TXx9", 1, NULL, 1, GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
+
 static void __init rbtx4927_gpioled_init(void)
 {
 	static const struct gpio_led leds[] = {
-		{ .name = "gpioled:green:0", .gpio = 0, .active_low = 1, },
-		{ .name = "gpioled:green:1", .gpio = 1, .active_low = 1, },
+		{ .name = "gpioled:green:0", },
+		{ .name = "gpioled:green:1", },
 	};
 	static struct gpio_led_platform_data pdata = {
 		.num_leds = ARRAY_SIZE(leds),
@@ -342,8 +350,13 @@ static void __init rbtx4927_gpioled_init(void)
 	if (!pdev)
 		return;
 	pdev->dev.platform_data = &pdata;
-	if (platform_device_add(pdev))
+	if (platform_device_add(pdev)) {
 		platform_device_put(pdev);
+		return;
+	}
+
+	rbtx4927_gpioled_table.dev_id = dev_name(&pdev->dev);
+	gpiod_add_lookup_table(&rbtx4927_gpioled_table);
 }
 
 static void __init rbtx4927_device_init(void)
-- 
2.43.0


