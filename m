Return-Path: <linux-mips+bounces-15296-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d22GDW95QmpV8AkAu9opvQ
	(envelope-from <linux-mips+bounces-15296-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 15:55:59 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C936D6DB999
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 15:55:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=h7UHfhVd;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15296-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15296-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2201630AF99B
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 13:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F25408626;
	Mon, 29 Jun 2026 13:27:17 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A1C40587E;
	Mon, 29 Jun 2026 13:27:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739637; cv=none; b=Aqgu6yB20A/aw9EsN70i84/VLUsMWy/W6cRghaiwqnsmvuw8a6yuT5xIQvq5xGhZPPzT0F98YPEmR7SVf/ZBicMVl64V6YoApfcZPyaTTC6kzliwsWwDgUjjo/Tgg7MhfVfKG4ikCTfw0DovKKvDtODTyVWjlkkhMYhTX3j0R5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739637; c=relaxed/simple;
	bh=fOcv9hZEQ8URej3dMQgbxN+Z+cm71BjGY9pJk5cfuuU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DmL5uSbRkVYa5Z6XcCTXqu7JtqV3VAhy24kz5H5BCwshpdFWySOzWKTlfJaO0qUkGtRCwZVA5yFUmTumAPiGnXukNUYOiol689XdVjR9VzlTbF0k6pqZvyZUOF3K3wKWUOtDDSd68O7I6lWTqIz2cdWiZqDydl8Bu/5nvrU5tQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7UHfhVd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064E11F000E9;
	Mon, 29 Jun 2026 13:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782739635;
	bh=BQSTKtEhCABTrsmFewCO3VJbMcAIQ7mWo9hyXHDpMpA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h7UHfhVd0rqZBRSugsSAbht2d0nvkJ/p/+zakXU7OJ+tHJ2LH/AcP5eMYIBf7mhm6
	 o7QlOsyZEjgUG6wFPv9w2QlvTN27uC4U8K0nujwH8rHywD5Eku/BBqoA0chZ8y3u2s
	 iOqXSTbcy3u4T/OrBB7Ty82ye0uDvja2BKaRJH2K249pKHwPivUYdzIHDLibjWnrMj
	 AzZ5f5gyJEORoI/JIDNOnG4otkyXyVqNqwhAVRi67zE29GF0MM3NfcA6ZZVWqpwWVL
	 rg7Q0PWd/08pb4C0B6wQkp5VgJ3jjlHjcAnvHvF67faodNd5Wdqjw6RrKTcg9zoyZS
	 AbzshesS92Dhg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Linus Walleij <linusw@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 04/13] sh: replace linux/gpio.h inclusions
Date: Mon, 29 Jun 2026 15:26:24 +0200
Message-Id: <20260629132633.1300009-5-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260629132633.1300009-1-arnd@kernel.org>
References: <20260629132633.1300009-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15296-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:andrew@lunn.ch,m:sebastian.hesselbarth@gmail.com,m:gregory.clement@bootlin.com,m:Frank.Li@nxp.com,m:robert.jarzmik@free.fr,m:krzk@kernel.org,m:gerg@linux-m68k.org,m:tsbogend@alpha.franken.de,m:hauke@hauke-m.de,m:zajec5@gmail.com,m:ysato@users.sourceforge.jp,m:glaubitz@physik.fu-berlin.de,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux@dominikbrodowski.net,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-phy@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-sound@vger.kernel.org,m:sebastianhesselbarth@gmail.com,m:dmitrytorokhov@gmail.com,s:
 lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[34];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[arnd@kernel.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,lunn.ch,gmail.com,bootlin.com,nxp.com,free.fr,linux-m68k.org,alpha.franken.de,hauke-m.de,users.sourceforge.jp,physik.fu-berlin.de,redhat.com,dominikbrodowski.net,vger.kernel.org,lists.infradead.org,opensource.cirrus.com,lists.linux-m68k.org,lists.linux.dev];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,arndb.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C936D6DB999

From: Arnd Bergmann <arnd@arndb.de>

linux/gpio.h should no longer be used, convert these instead to
linux/gpio/legacy.h for the sh boards using the legacy interfaces,
or remove it where it is not needed at all.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/sh/boards/board-magicpanelr2.c             | 2 +-
 arch/sh/boards/board-sh7757lcr.c                | 2 +-
 arch/sh/boards/board-urquell.c                  | 2 +-
 arch/sh/boards/mach-ap325rxa/setup.c            | 2 +-
 arch/sh/boards/mach-ecovec24/setup.c            | 2 +-
 arch/sh/boards/mach-highlander/pinmux-r7785rp.c | 2 +-
 arch/sh/boards/mach-kfr2r09/lcd_wqvga.c         | 2 +-
 arch/sh/boards/mach-kfr2r09/setup.c             | 2 +-
 arch/sh/boards/mach-migor/lcd_qvga.c            | 2 +-
 arch/sh/boards/mach-migor/setup.c               | 2 +-
 arch/sh/boards/mach-rsk/devices-rsk7203.c       | 2 +-
 arch/sh/boards/mach-rsk/devices-rsk7269.c       | 1 -
 arch/sh/boards/mach-se/7724/setup.c             | 2 +-
 arch/sh/include/mach-common/mach/magicpanelr2.h | 2 --
 arch/sh/kernel/cpu/sh4a/setup-shx3.c            | 2 +-
 15 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/arch/sh/boards/board-magicpanelr2.c b/arch/sh/boards/board-magicpanelr2.c
index 75de893152af..3f14118a1015 100644
--- a/arch/sh/boards/board-magicpanelr2.c
+++ b/arch/sh/boards/board-magicpanelr2.c
@@ -10,7 +10,7 @@
 #include <linux/irq.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/regulator/fixed.h>
 #include <linux/regulator/machine.h>
 #include <linux/smsc911x.h>
diff --git a/arch/sh/boards/board-sh7757lcr.c b/arch/sh/boards/board-sh7757lcr.c
index bca54e489e11..6d18f59ef261 100644
--- a/arch/sh/boards/board-sh7757lcr.c
+++ b/arch/sh/boards/board-sh7757lcr.c
@@ -7,7 +7,7 @@
 
 #include <linux/init.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/irq.h>
 #include <linux/regulator/fixed.h>
 #include <linux/regulator/machine.h>
diff --git a/arch/sh/boards/board-urquell.c b/arch/sh/boards/board-urquell.c
index dad2b3b40735..1f73c04d341f 100644
--- a/arch/sh/boards/board-urquell.c
+++ b/arch/sh/boards/board-urquell.c
@@ -14,7 +14,7 @@
 #include <linux/smc91x.h>
 #include <linux/mtd/physmap.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/irq.h>
 #include <linux/clk.h>
 #include <linux/sh_intc.h>
diff --git a/arch/sh/boards/mach-ap325rxa/setup.c b/arch/sh/boards/mach-ap325rxa/setup.c
index bb5004a8ac02..17c3f568d92e 100644
--- a/arch/sh/boards/mach-ap325rxa/setup.c
+++ b/arch/sh/boards/mach-ap325rxa/setup.c
@@ -17,7 +17,7 @@
 #include <linux/clkdev.h>
 #include <linux/delay.h>
 #include <linux/device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
 #include <linux/i2c.h>
diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/mach-ecovec24/setup.c
index a641e26f8fdf..ca4b4dd1ddef 100644
--- a/arch/sh/boards/mach-ecovec24/setup.c
+++ b/arch/sh/boards/mach-ecovec24/setup.c
@@ -20,7 +20,7 @@
 #include <linux/mmc/host.h>
 #include <linux/platform_data/sh_mmcif.h>
 #include <linux/mtd/physmap.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/gpio/machine.h>
 #include <linux/platform_data/gpio_backlight.h>
 #include <linux/platform_data/tmio.h>
diff --git a/arch/sh/boards/mach-highlander/pinmux-r7785rp.c b/arch/sh/boards/mach-highlander/pinmux-r7785rp.c
index 689bd8732d9e..3a1057ee9ace 100644
--- a/arch/sh/boards/mach-highlander/pinmux-r7785rp.c
+++ b/arch/sh/boards/mach-highlander/pinmux-r7785rp.c
@@ -3,7 +3,7 @@
  * Copyright (C) 2008 Paul Mundt
  */
 #include <linux/init.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <cpu/sh7785.h>
 #include <mach/highlander.h>
 
diff --git a/arch/sh/boards/mach-kfr2r09/lcd_wqvga.c b/arch/sh/boards/mach-kfr2r09/lcd_wqvga.c
index f6bbac106d13..68716660de34 100644
--- a/arch/sh/boards/mach-kfr2r09/lcd_wqvga.c
+++ b/arch/sh/boards/mach-kfr2r09/lcd_wqvga.c
@@ -14,7 +14,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <video/sh_mobile_lcdc.h>
 #include <mach/kfr2r09.h>
 #include <cpu/sh7724.h>
diff --git a/arch/sh/boards/mach-kfr2r09/setup.c b/arch/sh/boards/mach-kfr2r09/setup.c
index 70236859919d..30dd7dae7906 100644
--- a/arch/sh/boards/mach-kfr2r09/setup.c
+++ b/arch/sh/boards/mach-kfr2r09/setup.c
@@ -14,7 +14,7 @@
 
 #include <linux/clkdev.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/gpio/machine.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
diff --git a/arch/sh/boards/mach-migor/lcd_qvga.c b/arch/sh/boards/mach-migor/lcd_qvga.c
index 4ebf130510bc..f72934e370fd 100644
--- a/arch/sh/boards/mach-migor/lcd_qvga.c
+++ b/arch/sh/boards/mach-migor/lcd_qvga.c
@@ -14,7 +14,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <video/sh_mobile_lcdc.h>
 #include <cpu/sh7722.h>
 #include <mach/migor.h>
diff --git a/arch/sh/boards/mach-migor/setup.c b/arch/sh/boards/mach-migor/setup.c
index 1853e6319a66..b0198e7cb9ab 100644
--- a/arch/sh/boards/mach-migor/setup.c
+++ b/arch/sh/boards/mach-migor/setup.c
@@ -22,7 +22,7 @@
 #include <linux/smc91x.h>
 #include <linux/delay.h>
 #include <linux/clk.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/gpio/machine.h>
 #include <linux/videodev2.h>
 #include <linux/sh_intc.h>
diff --git a/arch/sh/boards/mach-rsk/devices-rsk7203.c b/arch/sh/boards/mach-rsk/devices-rsk7203.c
index e6b05d4588b7..eb56b57812bd 100644
--- a/arch/sh/boards/mach-rsk/devices-rsk7203.c
+++ b/arch/sh/boards/mach-rsk/devices-rsk7203.c
@@ -10,7 +10,7 @@
 #include <linux/interrupt.h>
 #include <linux/smsc911x.h>
 #include <linux/input.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/gpio_keys.h>
 #include <linux/leds.h>
 #include <asm/machvec.h>
diff --git a/arch/sh/boards/mach-rsk/devices-rsk7269.c b/arch/sh/boards/mach-rsk/devices-rsk7269.c
index 4b1e386b51dd..54edd9958eca 100644
--- a/arch/sh/boards/mach-rsk/devices-rsk7269.c
+++ b/arch/sh/boards/mach-rsk/devices-rsk7269.c
@@ -11,7 +11,6 @@
 #include <linux/interrupt.h>
 #include <linux/input.h>
 #include <linux/smsc911x.h>
-#include <linux/gpio.h>
 #include <asm/machvec.h>
 #include <asm/io.h>
 
diff --git a/arch/sh/boards/mach-se/7724/setup.c b/arch/sh/boards/mach-se/7724/setup.c
index e500feb91053..bed8f44fcecb 100644
--- a/arch/sh/boards/mach-se/7724/setup.c
+++ b/arch/sh/boards/mach-se/7724/setup.c
@@ -15,7 +15,7 @@
 
 #include <linux/delay.h>
 #include <linux/device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/init.h>
 #include <linux/input.h>
 #include <linux/input/sh_keysc.h>
diff --git a/arch/sh/include/mach-common/mach/magicpanelr2.h b/arch/sh/include/mach-common/mach/magicpanelr2.h
index c2d218cea74b..29d86dd21b7b 100644
--- a/arch/sh/include/mach-common/mach/magicpanelr2.h
+++ b/arch/sh/include/mach-common/mach/magicpanelr2.h
@@ -10,8 +10,6 @@
 #ifndef __ASM_SH_MAGICPANELR2_H
 #define __ASM_SH_MAGICPANELR2_H
 
-#include <linux/gpio.h>
-
 #define __IO_PREFIX mpr2
 #include <asm/io_generic.h>
 
diff --git a/arch/sh/kernel/cpu/sh4a/setup-shx3.c b/arch/sh/kernel/cpu/sh4a/setup-shx3.c
index 7014d6d199b3..60be8dca54f6 100644
--- a/arch/sh/kernel/cpu/sh4a/setup-shx3.c
+++ b/arch/sh/kernel/cpu/sh4a/setup-shx3.c
@@ -9,7 +9,7 @@
 #include <linux/serial.h>
 #include <linux/serial_sci.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/sh_timer.h>
 #include <linux/sh_intc.h>
 #include <cpu/shx3.h>
-- 
2.39.5


