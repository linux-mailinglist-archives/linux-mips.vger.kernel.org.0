Return-Path: <linux-mips+bounces-15755-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pc5BLcRjUWojDwMAu9opvQ
	(envelope-from <linux-mips+bounces-15755-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 23:27:32 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1122073EE0A
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 23:27:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LF44cjDy;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15755-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15755-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB667304C62F
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 21:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466493B71D1;
	Fri, 10 Jul 2026 21:20:28 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D243C3B6BF1;
	Fri, 10 Jul 2026 21:20:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718428; cv=none; b=M/1b/bZ7RLKEg+TDW+okjaS5o8YVAvbSFmsFKyg6X+ZGeW5/HgeaB9pED22L2vA99iLR+V3Z6/VflC12DgapIHAEL21xsfH+nQcNgOoSj6SBMVI5y/eUUn3ZoSE86snwDAMjyLQnoEzQiETJVhpD48A6W/iPs5NQNWgzCAUW9K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718428; c=relaxed/simple;
	bh=kLphKJ8nQlZGrEll9auLUpETnUR79HOSpoxXcpvhi1A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qFMG9LdCmn/wvPmsFcRUtjSh3Dd1Ob3qZBO6CQQxeR8xGBCSSRtLyiRSGmi04bs0H3P8rm8VPNItGlfydKdg2EW+LsPeYGUNXtV8N3sLL5BbgPujDFjPTfUspKPQ7yO8TE3jROYQVeLeYmT7ovi6h79t4+dI0dW2daC7Rf/zOaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LF44cjDy; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 844321F00A3A;
	Fri, 10 Jul 2026 21:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783718426;
	bh=46eUzVM3ncAmL/9d8cH77iPrk71pbyGmWfoXjh1L6RU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LF44cjDyG2hqK00k2mfWkqXGbJF8blKUlTcFPOjLUfZ2ua4SP1IhMZVv94Mjwp7xo
	 mfEDdZkIWq8GfMFuibDL0EegdsALrOlV636uEcI0FZbEffDmgaKKPPUmoEx1LmSX7C
	 V3sQD0QRmU0kDQX5rvfmz96i2ajCJcfyB4T7ZweOqJZujZIQ9h21ESh6JmSTeTzlS7
	 crjfQgLQBV7aUNGve/Jqu1SoFnPZfqVLjySWnOUgpPEVi67IIJ8y2inP0rsNPmEJU4
	 roTMAnhXXyFsyMatMsv590fT+L0oG+lyT13kdP3JXHWA2LnwtOPElNhz48VlYb5yWW
	 fa/D7KQDEHa4w==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-gpio@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
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
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 03/10] mips: replace linux/gpio.h inclusions
Date: Fri, 10 Jul 2026 23:19:48 +0200
Message-Id: <20260710211954.1373336-4-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260710211954.1373336-1-arnd@kernel.org>
References: <20260710211954.1373336-1-arnd@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15755-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:andrew@lunn.ch,m:sebastian.hesselbarth@gmail.com,m:gregory.clement@bootlin.com,m:Frank.Li@nxp.com,m:robert.jarzmik@free.fr,m:krzk@kernel.org,m:gerg@linux-m68k.org,m:tsbogend@alpha.franken.de,m:hauke@hauke-m.de,m:zajec5@gmail.com,m:ysato@users.sourceforge.jp,m:glaubitz@physik.fu-berlin.de,m:dmitry.torokhov@gmail.com,m:linux@dominikbrodowski.net,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-phy@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-sound@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:sebastianhesselbarth@gmail.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[31];
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
	FREEMAIL_CC(0.00)[arndb.de,lunn.ch,gmail.com,bootlin.com,nxp.com,free.fr,kernel.org,linux-m68k.org,alpha.franken.de,hauke-m.de,users.sourceforge.jp,physik.fu-berlin.de,dominikbrodowski.net,vger.kernel.org,lists.infradead.org,opensource.cirrus.com,lists.linux-m68k.org,lists.linux.dev,oss.qualcomm.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arndb.de:email,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1122073EE0A

From: Arnd Bergmann <arnd@arndb.de>

linux/gpio.h should no longer be used, convert these instead to
either linux/gpio/consumer.h or linux/gpio/legacy.h as needed.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/alchemy/board-xxs1500.c                   | 2 +-
 arch/mips/alchemy/devboards/db1000.c                | 2 +-
 arch/mips/alchemy/devboards/db1200.c                | 2 +-
 arch/mips/alchemy/devboards/db1550.c                | 2 +-
 arch/mips/bcm47xx/workarounds.c                     | 2 +-
 arch/mips/bcm63xx/boards/board_bcm963xx.c           | 1 +
 arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h | 2 +-
 arch/mips/txx9/rbtx4927/setup.c                     | 2 +-
 8 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/mips/alchemy/board-xxs1500.c b/arch/mips/alchemy/board-xxs1500.c
index f175bce2987f..a03762dde4e7 100644
--- a/arch/mips/alchemy/board-xxs1500.c
+++ b/arch/mips/alchemy/board-xxs1500.c
@@ -11,7 +11,7 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <asm/bootinfo.h>
diff --git a/arch/mips/alchemy/devboards/db1000.c b/arch/mips/alchemy/devboards/db1000.c
index 8fb24b220e3a..5eff34a8683b 100644
--- a/arch/mips/alchemy/devboards/db1000.c
+++ b/arch/mips/alchemy/devboards/db1000.c
@@ -8,7 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/gpio/machine.h>
 #include <linux/gpio/property.h>
 #include <linux/init.h>
diff --git a/arch/mips/alchemy/devboards/db1200.c b/arch/mips/alchemy/devboards/db1200.c
index de2a9083ed9a..539b311fc8af 100644
--- a/arch/mips/alchemy/devboards/db1200.c
+++ b/arch/mips/alchemy/devboards/db1200.c
@@ -7,7 +7,7 @@
 
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
diff --git a/arch/mips/alchemy/devboards/db1550.c b/arch/mips/alchemy/devboards/db1550.c
index b8295a5c2e9a..579fc8f1eaed 100644
--- a/arch/mips/alchemy/devboards/db1550.c
+++ b/arch/mips/alchemy/devboards/db1550.c
@@ -7,7 +7,7 @@
 
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/io.h>
diff --git a/arch/mips/bcm47xx/workarounds.c b/arch/mips/bcm47xx/workarounds.c
index 745c6228eb2c..dc9e5483347d 100644
--- a/arch/mips/bcm47xx/workarounds.c
+++ b/arch/mips/bcm47xx/workarounds.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "bcm47xx_private.h"
 
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <bcm47xx_board.h>
 #include <bcm47xx.h>
 
diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
index c5617b889b1c..71628dac6c26 100644
--- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
+++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
@@ -7,6 +7,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/init.h>
+#include <linux/gpio/legacy.h>
 #include <linux/kernel.h>
 #include <linux/string.h>
 #include <linux/platform_device.h>
diff --git a/arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h b/arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h
index 830f53f28e3f..428cf4508f9a 100644
--- a/arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h
+++ b/arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h
@@ -3,7 +3,7 @@
 #define BOARD_BCM963XX_H_
 
 #include <linux/types.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/leds.h>
 #include <bcm63xx_dev_enet.h>
 #include <bcm63xx_dev_usb_usbd.h>
diff --git a/arch/mips/txx9/rbtx4927/setup.c b/arch/mips/txx9/rbtx4927/setup.c
index 31955c1d5555..b4fbe6a2a73a 100644
--- a/arch/mips/txx9/rbtx4927/setup.c
+++ b/arch/mips/txx9/rbtx4927/setup.c
@@ -48,7 +48,7 @@
 #include <linux/ioport.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/leds.h>
 #include <asm/io.h>
 #include <asm/reboot.h>
-- 
2.39.5


