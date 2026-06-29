Return-Path: <linux-mips+bounces-15293-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4y/YBRl0Qmo97gkAu9opvQ
	(envelope-from <linux-mips+bounces-15293-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 15:33:13 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E60736DB409
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 15:33:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fVCi9ZLn;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15293-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15293-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C35B307A3BA
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 13:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D077A405844;
	Mon, 29 Jun 2026 13:26:56 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E936836D51F;
	Mon, 29 Jun 2026 13:26:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739616; cv=none; b=s6BbaoW8umqJZnFQwHji9bRH9eO97Xz7l0zCjwO127r20Y1qL+k60hPqA4xXemeGtnnMTXlORJYdUCZemk0RZj1vKoO+B9HTkf1s9qtg6TdGyfd3hyUmhjkrDILjiHGb1TTBTCBab+Uce4k8ECIVxifyKHHHGhUUGgickYUyxgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739616; c=relaxed/simple;
	bh=Ogu5MSHVfdeNPk+2G8a//BHcGyrCvdgwrXDYO1xXGMY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hG61T4CeSuGzLOfrAhwGovoEagDufpzKoGt25msyWFoIbmux5gdKhmrUcHihgIkYcFs1ioyE301e6J2RmO+4eDb73h/+mRkK0U14RYOg2++dMauaxhiVk1LvC+nACSUztXh7MYMU9Hj6FM4PlKN37nCtZ5bCsUyhkORcmioHCyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fVCi9ZLn; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105821F00A3A;
	Mon, 29 Jun 2026 13:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782739614;
	bh=b0dX5alvYQuIivg+kOnERfEMXVJLp3wlDg5lsC12OaY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fVCi9ZLnm4+TddndYqvm79lnginO2Gsne0/ZxbnCe6aTdbaf0AqjTZZLYSKzpUBuH
	 guVmEeRuYgzuqA5ymhvoSGhrf1pXcWPLG2tlXwCLiOA4/HQqlgw2qN6LSHODRkoDeh
	 sJ8iOQxBcg0NxxPKpFJ3WHMErZ4YkUUv/S75IHw/pBYcWIW4ZuQuiHjALOyc+Pr5P4
	 DFL8anQLwNaulXzvUQwgjkQmTm5tudJcZWG1TgQoeZj1hXRKtQDFHzjbJYE1VOMfN/
	 2ecatvnjyQ7j8djIqF/vgW1jpBLqRTvOCOMfWxusPqMXE6I20Kdk3Yel/6Sxz0f0M5
	 mdjl3hgFUWtCQ==
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
Subject: [PATCH 01/13] ARM: replace linux/gpio.h inclusions
Date: Mon, 29 Jun 2026 15:26:21 +0200
Message-Id: <20260629132633.1300009-2-arnd@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15293-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,arndb.de:email,vger.kernel.org:from_smtp,cyrius.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E60736DB409

From: Arnd Bergmann <arnd@arndb.de>

linux/gpio.h should no longer be used, convert these instead to
either linux/gpio/consumer.h or linux/gpio/legacy.h as needed.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-davinci/da850.c                  | 2 +-
 arch/arm/mach-dove/mpp.c                       | 2 +-
 arch/arm/mach-mv78xx0/buffalo-wxl-setup.c      | 2 +-
 arch/arm/mach-mv78xx0/irq.c                    | 2 +-
 arch/arm/mach-mv78xx0/mpp.c                    | 2 +-
 arch/arm/mach-mvebu/pm.c                       | 2 +-
 arch/arm/mach-mxs/mach-mxs.c                   | 2 +-
 arch/arm/mach-orion5x/board-d2net.c            | 2 +-
 arch/arm/mach-orion5x/board-rd88f5182.c        | 2 +-
 arch/arm/mach-orion5x/dns323-setup.c           | 2 +-
 arch/arm/mach-orion5x/irq.c                    | 2 +-
 arch/arm/mach-orion5x/kurobox_pro-setup.c      | 2 +-
 arch/arm/mach-orion5x/mv2120-setup.c           | 2 +-
 arch/arm/mach-orion5x/net2big-setup.c          | 2 +-
 arch/arm/mach-orion5x/terastation_pro2-setup.c | 2 +-
 arch/arm/mach-orion5x/ts209-setup.c            | 2 +-
 arch/arm/mach-orion5x/ts409-setup.c            | 2 +-
 arch/arm/mach-pxa/am200epd.c                   | 2 +-
 arch/arm/mach-pxa/am300epd.c                   | 2 +-
 arch/arm/mach-pxa/generic.c                    | 2 +-
 arch/arm/mach-pxa/gumstix.c                    | 2 +-
 arch/arm/mach-pxa/mfp-pxa2xx.c                 | 2 +-
 arch/arm/mach-pxa/pxa25x.c                     | 2 +-
 arch/arm/mach-pxa/pxa27x.c                     | 2 +-
 arch/arm/mach-pxa/reset.c                      | 2 +-
 arch/arm/mach-pxa/sharpsl_pm.c                 | 2 +-
 arch/arm/mach-pxa/spitz.c                      | 2 +-
 arch/arm/mach-pxa/spitz_pm.c                   | 2 +-
 arch/arm/mach-s3c/dev-audio-s3c64xx.c          | 2 +-
 arch/arm/mach-s3c/devs.c                       | 2 +-
 arch/arm/mach-s3c/mach-crag6410.c              | 2 +-
 arch/arm/mach-s3c/pm-gpio.c                    | 2 +-
 arch/arm/mach-s3c/pm-s3c64xx.c                 | 2 +-
 arch/arm/mach-s3c/setup-fb-24bpp-s3c64xx.c     | 2 +-
 arch/arm/mach-s3c/setup-i2c0-s3c64xx.c         | 2 +-
 arch/arm/mach-s3c/setup-i2c1-s3c64xx.c         | 2 +-
 arch/arm/mach-s3c/setup-keypad-s3c64xx.c       | 2 +-
 arch/arm/mach-s3c/setup-sdhci-gpio-s3c64xx.c   | 2 +-
 arch/arm/mach-s3c/setup-spi-s3c64xx.c          | 2 +-
 arch/arm/mach-sa1100/collie.c                  | 2 +-
 arch/arm/mach-sa1100/generic.c                 | 2 +-
 arch/arm/mach-sa1100/h3600.c                   | 2 +-
 arch/arm/mach-sa1100/h3xxx.c                   | 2 +-
 arch/arm/plat-orion/mpp.c                      | 2 +-
 44 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/arch/arm/mach-davinci/da850.c b/arch/arm/mach-davinci/da850.c
index 706f8241b5e7..611cce70c5bb 100644
--- a/arch/arm/mach-davinci/da850.c
+++ b/arch/arm/mach-davinci/da850.c
@@ -9,7 +9,7 @@
  * 2009 (c) MontaVista Software, Inc.
  */
 
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/mfd/da8xx-cfgchip.h>
diff --git a/arch/arm/mach-dove/mpp.c b/arch/arm/mach-dove/mpp.c
index 93cb137da5f8..e41bd473abe9 100644
--- a/arch/arm/mach-dove/mpp.c
+++ b/arch/arm/mach-dove/mpp.c
@@ -6,7 +6,7 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/io.h>
 #include <plat/mpp.h>
 #include <plat/orion-gpio.h>
diff --git a/arch/arm/mach-mv78xx0/buffalo-wxl-setup.c b/arch/arm/mach-mv78xx0/buffalo-wxl-setup.c
index 62e982f74bc2..3b2e381b7383 100644
--- a/arch/arm/mach-mv78xx0/buffalo-wxl-setup.c
+++ b/arch/arm/mach-mv78xx0/buffalo-wxl-setup.c
@@ -14,7 +14,7 @@
 #include <linux/mv643xx_eth.h>
 #include <linux/ethtool.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/gpio_keys.h>
 #include <linux/input.h>
 #include <asm/mach-types.h>
diff --git a/arch/arm/mach-mv78xx0/irq.c b/arch/arm/mach-mv78xx0/irq.c
index a34b6855fb19..6e42f6446637 100644
--- a/arch/arm/mach-mv78xx0/irq.c
+++ b/arch/arm/mach-mv78xx0/irq.c
@@ -4,7 +4,7 @@
  *
  * MV78xx0 IRQ handling.
  */
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/irq.h>
 #include <linux/io.h>
diff --git a/arch/arm/mach-mv78xx0/mpp.c b/arch/arm/mach-mv78xx0/mpp.c
index aff0e612cbba..32bf590d79fe 100644
--- a/arch/arm/mach-mv78xx0/mpp.c
+++ b/arch/arm/mach-mv78xx0/mpp.c
@@ -4,7 +4,7 @@
  *
  * MPP functions for Marvell MV78x00 SoCs
  */
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/io.h>
diff --git a/arch/arm/mach-mvebu/pm.c b/arch/arm/mach-mvebu/pm.c
index b149d9b77505..616a7fb22d86 100644
--- a/arch/arm/mach-mvebu/pm.c
+++ b/arch/arm/mach-mvebu/pm.c
@@ -9,7 +9,7 @@
 
 #include <linux/cpu_pm.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mbus.h>
diff --git a/arch/arm/mach-mxs/mach-mxs.c b/arch/arm/mach-mxs/mach-mxs.c
index f639d5004351..c8231a480052 100644
--- a/arch/arm/mach-mxs/mach-mxs.c
+++ b/arch/arm/mach-mxs/mach-mxs.c
@@ -9,7 +9,7 @@
 #include <linux/clkdev.h>
 #include <linux/delay.h>
 #include <linux/err.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/reboot.h>
 #include <linux/micrel_phy.h>
diff --git a/arch/arm/mach-orion5x/board-d2net.c b/arch/arm/mach-orion5x/board-d2net.c
index 09bf366d05ff..7cf09da9d9e7 100644
--- a/arch/arm/mach-orion5x/board-d2net.c
+++ b/arch/arm/mach-orion5x/board-d2net.c
@@ -13,7 +13,7 @@
 #include <linux/pci.h>
 #include <linux/irq.h>
 #include <linux/leds.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/gpio/machine.h>
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
diff --git a/arch/arm/mach-orion5x/board-rd88f5182.c b/arch/arm/mach-orion5x/board-rd88f5182.c
index 1c14e49a90a6..9e2fe74ec68a 100644
--- a/arch/arm/mach-orion5x/board-rd88f5182.c
+++ b/arch/arm/mach-orion5x/board-rd88f5182.c
@@ -6,7 +6,7 @@
  *
  * Maintainer: Ronen Shitrit <rshitrit@marvell.com>
  */
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/of.h>
diff --git a/arch/arm/mach-orion5x/dns323-setup.c b/arch/arm/mach-orion5x/dns323-setup.c
index fcd38ff7ca45..7b81b08b0dda 100644
--- a/arch/arm/mach-orion5x/dns323-setup.c
+++ b/arch/arm/mach-orion5x/dns323-setup.c
@@ -13,7 +13,7 @@
  * License, or (at your option) any later version.
  *
  */
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/gpio/machine.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
diff --git a/arch/arm/mach-orion5x/irq.c b/arch/arm/mach-orion5x/irq.c
index e17727e53cb4..689bec1ebe89 100644
--- a/arch/arm/mach-orion5x/irq.c
+++ b/arch/arm/mach-orion5x/irq.c
@@ -6,7 +6,7 @@
  *
  * Maintainer: Tzachi Perelstein <tzachi@marvell.com>
  */
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/irq.h>
 #include <linux/io.h>
diff --git a/arch/arm/mach-orion5x/kurobox_pro-setup.c b/arch/arm/mach-orion5x/kurobox_pro-setup.c
index 339b10891808..e61b9ab06943 100644
--- a/arch/arm/mach-orion5x/kurobox_pro-setup.c
+++ b/arch/arm/mach-orion5x/kurobox_pro-setup.c
@@ -4,7 +4,7 @@
  *
  * Maintainer: Ronen Shitrit <rshitrit@marvell.com>
  */
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
diff --git a/arch/arm/mach-orion5x/mv2120-setup.c b/arch/arm/mach-orion5x/mv2120-setup.c
index 5b0249f109cd..b15fe5b7a0f9 100644
--- a/arch/arm/mach-orion5x/mv2120-setup.c
+++ b/arch/arm/mach-orion5x/mv2120-setup.c
@@ -7,7 +7,7 @@
  * published by the Free Software Foundation; either version 2 of the
  * License, or (at your option) any later version.
  */
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/gpio/machine.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
diff --git a/arch/arm/mach-orion5x/net2big-setup.c b/arch/arm/mach-orion5x/net2big-setup.c
index 4afd9b4c71a9..f04571e79805 100644
--- a/arch/arm/mach-orion5x/net2big-setup.c
+++ b/arch/arm/mach-orion5x/net2big-setup.c
@@ -17,7 +17,7 @@
 #include <linux/input.h>
 #include <linux/i2c.h>
 #include <linux/ata_platform.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/gpio/machine.h>
 #include <linux/delay.h>
 #include <asm/mach-types.h>
diff --git a/arch/arm/mach-orion5x/terastation_pro2-setup.c b/arch/arm/mach-orion5x/terastation_pro2-setup.c
index a9f01859d101..c3db3376950a 100644
--- a/arch/arm/mach-orion5x/terastation_pro2-setup.c
+++ b/arch/arm/mach-orion5x/terastation_pro2-setup.c
@@ -4,7 +4,7 @@
  *
  * Maintainer: Sylver Bruneau <sylver.bruneau@googlemail.com>
  */
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
diff --git a/arch/arm/mach-orion5x/ts209-setup.c b/arch/arm/mach-orion5x/ts209-setup.c
index de9092e992c5..25cd50306c65 100644
--- a/arch/arm/mach-orion5x/ts209-setup.c
+++ b/arch/arm/mach-orion5x/ts209-setup.c
@@ -4,7 +4,7 @@
  *
  * Maintainer: Byron Bradley <byron.bbradley@gmail.com>
  */
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
diff --git a/arch/arm/mach-orion5x/ts409-setup.c b/arch/arm/mach-orion5x/ts409-setup.c
index 725688aa5cba..f92acef0b45f 100644
--- a/arch/arm/mach-orion5x/ts409-setup.c
+++ b/arch/arm/mach-orion5x/ts409-setup.c
@@ -7,7 +7,7 @@
  * Copyright (C) 2008  Sylver Bruneau <sylver.bruneau@gmail.com>
  * Copyright (C) 2008  Martin Michlmayr <tbm@cyrius.com>
  */
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/gpio/machine.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
diff --git a/arch/arm/mach-pxa/am200epd.c b/arch/arm/mach-pxa/am200epd.c
index cac0bb09db14..4814f3cfe775 100644
--- a/arch/arm/mach-pxa/am200epd.c
+++ b/arch/arm/mach-pxa/am200epd.c
@@ -28,7 +28,7 @@
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/irq.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 
 #include "pxa25x.h"
 #include "gumstix.h"
diff --git a/arch/arm/mach-pxa/am300epd.c b/arch/arm/mach-pxa/am300epd.c
index 4b55bc89db8f..435fb72da7de 100644
--- a/arch/arm/mach-pxa/am300epd.c
+++ b/arch/arm/mach-pxa/am300epd.c
@@ -26,7 +26,7 @@
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/irq.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 
 #include "gumstix.h"
 #include "mfp-pxa25x.h"
diff --git a/arch/arm/mach-pxa/generic.c b/arch/arm/mach-pxa/generic.c
index 02fdde7e3e34..f181e7b7c6be 100644
--- a/arch/arm/mach-pxa/generic.c
+++ b/arch/arm/mach-pxa/generic.c
@@ -13,7 +13,7 @@
  * initialization stuff for PXA machines which can be overridden later if
  * need be.
  */
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
diff --git a/arch/arm/mach-pxa/gumstix.c b/arch/arm/mach-pxa/gumstix.c
index 6074815a4bca..7ab0cb015d1b 100644
--- a/arch/arm/mach-pxa/gumstix.c
+++ b/arch/arm/mach-pxa/gumstix.c
@@ -22,7 +22,7 @@
 #include <linux/mtd/partitions.h>
 #include <linux/gpio/machine.h>
 #include <linux/gpio/property.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/err.h>
 #include <linux/clk.h>
 
diff --git a/arch/arm/mach-pxa/mfp-pxa2xx.c b/arch/arm/mach-pxa/mfp-pxa2xx.c
index d1347055fbe4..566fb4e2adba 100644
--- a/arch/arm/mach-pxa/mfp-pxa2xx.c
+++ b/arch/arm/mach-pxa/mfp-pxa2xx.c
@@ -9,7 +9,7 @@
  *  on PXA3xx,  what's more important, the low power pin state and
  *  wakeup detection are also supported by the same framework.
  */
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio-pxa.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
diff --git a/arch/arm/mach-pxa/pxa25x.c b/arch/arm/mach-pxa/pxa25x.c
index a4e878be004a..a273f0af095e 100644
--- a/arch/arm/mach-pxa/pxa25x.c
+++ b/arch/arm/mach-pxa/pxa25x.c
@@ -15,7 +15,7 @@
  */
 #include <linux/dmaengine.h>
 #include <linux/dma/pxa-dma.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio-pxa.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
diff --git a/arch/arm/mach-pxa/pxa27x.c b/arch/arm/mach-pxa/pxa27x.c
index 1d34de7e5fbe..814e0a12f38a 100644
--- a/arch/arm/mach-pxa/pxa27x.c
+++ b/arch/arm/mach-pxa/pxa27x.c
@@ -10,7 +10,7 @@
  */
 #include <linux/dmaengine.h>
 #include <linux/dma/pxa-dma.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio-pxa.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
diff --git a/arch/arm/mach-pxa/reset.c b/arch/arm/mach-pxa/reset.c
index 27293549f8ad..49d2e46a1fae 100644
--- a/arch/arm/mach-pxa/reset.c
+++ b/arch/arm/mach-pxa/reset.c
@@ -2,7 +2,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/io.h>
 #include <asm/proc-fns.h>
 #include <asm/system_misc.h>
diff --git a/arch/arm/mach-pxa/sharpsl_pm.c b/arch/arm/mach-pxa/sharpsl_pm.c
index 71b282b146d0..a611eea70e5a 100644
--- a/arch/arm/mach-pxa/sharpsl_pm.c
+++ b/arch/arm/mach-pxa/sharpsl_pm.c
@@ -19,7 +19,7 @@
 #include <linux/delay.h>
 #include <linux/leds.h>
 #include <linux/suspend.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/io.h>
 
 #include <asm/mach-types.h>
diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index 5091b601c4e1..5eaf38243b9e 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -12,7 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/delay.h>
 #include <linux/gpio_keys.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/gpio/machine.h>
 #include <linux/gpio/property.h>
 #include <linux/leds.h>
diff --git a/arch/arm/mach-pxa/spitz_pm.c b/arch/arm/mach-pxa/spitz_pm.c
index 03b4b347f11a..806847c36549 100644
--- a/arch/arm/mach-pxa/spitz_pm.c
+++ b/arch/arm/mach-pxa/spitz_pm.c
@@ -10,7 +10,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/gpio-pxa.h>
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
diff --git a/arch/arm/mach-s3c/dev-audio-s3c64xx.c b/arch/arm/mach-s3c/dev-audio-s3c64xx.c
index 7ce119dc3a72..8884374dbcdc 100644
--- a/arch/arm/mach-s3c/dev-audio-s3c64xx.c
+++ b/arch/arm/mach-s3c/dev-audio-s3c64xx.c
@@ -7,7 +7,7 @@
 #include <linux/string.h>
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/export.h>
 
 #include "irqs.h"
diff --git a/arch/arm/mach-s3c/devs.c b/arch/arm/mach-s3c/devs.c
index bab2abd8a34a..572b156644bd 100644
--- a/arch/arm/mach-s3c/devs.c
+++ b/arch/arm/mach-s3c/devs.c
@@ -5,7 +5,7 @@
 //
 // Base Samsung platform device definitions
 
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/interrupt.h>
diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index c4040aad1ed3..57176719d8a6 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -15,7 +15,7 @@
 #include <linux/io.h>
 #include <linux/init.h>
 #include <linux/input-event-codes.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/gpio/machine.h>
 #include <linux/leds.h>
 #include <linux/delay.h>
diff --git a/arch/arm/mach-s3c/pm-gpio.c b/arch/arm/mach-s3c/pm-gpio.c
index cfdbc2337998..fd5897cc26c7 100644
--- a/arch/arm/mach-s3c/pm-gpio.c
+++ b/arch/arm/mach-s3c/pm-gpio.c
@@ -11,7 +11,7 @@
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include "gpio-samsung.h"
 
diff --git a/arch/arm/mach-s3c/pm-s3c64xx.c b/arch/arm/mach-s3c/pm-s3c64xx.c
index 284d5f462513..a73b8bd12949 100644
--- a/arch/arm/mach-s3c/pm-s3c64xx.c
+++ b/arch/arm/mach-s3c/pm-s3c64xx.c
@@ -11,7 +11,7 @@
 #include <linux/suspend.h>
 #include <linux/serial_core.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/pm_domain.h>
 
 #include "map.h"
diff --git a/arch/arm/mach-s3c/setup-fb-24bpp-s3c64xx.c b/arch/arm/mach-s3c/setup-fb-24bpp-s3c64xx.c
index c3269cd6a848..20ae926e12db 100644
--- a/arch/arm/mach-s3c/setup-fb-24bpp-s3c64xx.c
+++ b/arch/arm/mach-s3c/setup-fb-24bpp-s3c64xx.c
@@ -9,7 +9,7 @@
 
 #include <linux/kernel.h>
 #include <linux/types.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include "fb.h"
 #include "gpio-cfg.h"
diff --git a/arch/arm/mach-s3c/setup-i2c0-s3c64xx.c b/arch/arm/mach-s3c/setup-i2c0-s3c64xx.c
index a6ef8d2bc995..520e97dc8754 100644
--- a/arch/arm/mach-s3c/setup-i2c0-s3c64xx.c
+++ b/arch/arm/mach-s3c/setup-i2c0-s3c64xx.c
@@ -9,7 +9,7 @@
 
 #include <linux/kernel.h>
 #include <linux/types.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 
 struct platform_device; /* don't need the contents */
 
diff --git a/arch/arm/mach-s3c/setup-i2c1-s3c64xx.c b/arch/arm/mach-s3c/setup-i2c1-s3c64xx.c
index 0fe37363d26e..26f7ae455328 100644
--- a/arch/arm/mach-s3c/setup-i2c1-s3c64xx.c
+++ b/arch/arm/mach-s3c/setup-i2c1-s3c64xx.c
@@ -9,7 +9,7 @@
 
 #include <linux/kernel.h>
 #include <linux/types.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 
 struct platform_device; /* don't need the contents */
 
diff --git a/arch/arm/mach-s3c/setup-keypad-s3c64xx.c b/arch/arm/mach-s3c/setup-keypad-s3c64xx.c
index 8463ad37c6ab..2e1367878fb1 100644
--- a/arch/arm/mach-s3c/setup-keypad-s3c64xx.c
+++ b/arch/arm/mach-s3c/setup-keypad-s3c64xx.c
@@ -5,7 +5,7 @@
 //
 // GPIO configuration for S3C64XX KeyPad device
 
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include "gpio-cfg.h"
 #include "keypad.h"
 #include "gpio-samsung.h"
diff --git a/arch/arm/mach-s3c/setup-sdhci-gpio-s3c64xx.c b/arch/arm/mach-s3c/setup-sdhci-gpio-s3c64xx.c
index 646ff949acd5..728b66f80493 100644
--- a/arch/arm/mach-s3c/setup-sdhci-gpio-s3c64xx.c
+++ b/arch/arm/mach-s3c/setup-sdhci-gpio-s3c64xx.c
@@ -11,7 +11,7 @@
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include "gpio-cfg.h"
 #include "sdhci.h"
diff --git a/arch/arm/mach-s3c/setup-spi-s3c64xx.c b/arch/arm/mach-s3c/setup-spi-s3c64xx.c
index 497aff71c29c..8d15b13ed7d5 100644
--- a/arch/arm/mach-s3c/setup-spi-s3c64xx.c
+++ b/arch/arm/mach-s3c/setup-spi-s3c64xx.c
@@ -3,7 +3,7 @@
 // Copyright (C) 2011 Samsung Electronics Ltd.
 //		http://www.samsung.com/
 
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/platform_data/spi-s3c64xx.h>
 #include "gpio-cfg.h"
 #include "gpio-samsung.h"
diff --git a/arch/arm/mach-sa1100/collie.c b/arch/arm/mach-sa1100/collie.c
index 466d755d5702..af9c68b2093e 100644
--- a/arch/arm/mach-sa1100/collie.c
+++ b/arch/arm/mach-sa1100/collie.c
@@ -29,7 +29,7 @@
 #include <linux/timer.h>
 #include <linux/gpio_keys.h>
 #include <linux/input.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/gpio/machine.h>
 #include <linux/power/gpio-charger.h>
 
diff --git a/arch/arm/mach-sa1100/generic.c b/arch/arm/mach-sa1100/generic.c
index 99ff55e8131d..a995625ab1a0 100644
--- a/arch/arm/mach-sa1100/generic.c
+++ b/arch/arm/mach-sa1100/generic.c
@@ -6,7 +6,7 @@
  *
  * Code common to all SA11x0 machines.
  */
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
diff --git a/arch/arm/mach-sa1100/h3600.c b/arch/arm/mach-sa1100/h3600.c
index 1cfc0b1fa41c..59e9251a138e 100644
--- a/arch/arm/mach-sa1100/h3600.c
+++ b/arch/arm/mach-sa1100/h3600.c
@@ -8,7 +8,7 @@
 
 #include <linux/init.h>
 #include <linux/kernel.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 
 #include <video/sa1100fb.h>
 
diff --git a/arch/arm/mach-sa1100/h3xxx.c b/arch/arm/mach-sa1100/h3xxx.c
index d685f03f51f3..b8fc1953db9f 100644
--- a/arch/arm/mach-sa1100/h3xxx.c
+++ b/arch/arm/mach-sa1100/h3xxx.c
@@ -8,7 +8,7 @@
 
 #include <linux/kernel.h>
 #include <linux/gpio/machine.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/gpio_keys.h>
 #include <linux/input.h>
 #include <linux/mtd/mtd.h>
diff --git a/arch/arm/plat-orion/mpp.c b/arch/arm/plat-orion/mpp.c
index 8a6880d528b6..673ecedc721d 100644
--- a/arch/arm/plat-orion/mpp.c
+++ b/arch/arm/plat-orion/mpp.c
@@ -12,7 +12,7 @@
 #include <linux/init.h>
 #include <linux/mbus.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <plat/orion-gpio.h>
 #include <plat/mpp.h>
 
-- 
2.39.5


