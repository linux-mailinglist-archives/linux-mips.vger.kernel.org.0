Return-Path: <linux-mips+bounces-15292-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E2I6J4x0Qmpp7gkAu9opvQ
	(envelope-from <linux-mips+bounces-15292-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 15:35:08 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCE76DB490
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 15:35:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KD4wn8FG;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15292-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15292-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EFAF321ED75
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 13:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF33405852;
	Mon, 29 Jun 2026 13:26:49 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E488B403EB5;
	Mon, 29 Jun 2026 13:26:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739609; cv=none; b=XaIh+jDeGqeIw/ZVzWGxQoDAZ5r7S7qPGtQrdIxzojjLvbWssz9eYlmMcrqECuT3XBf/rCr/QClvr3/35noqp0QLfzNPbQNbu6ukoP0RMDaSzMZzzKUQa6YHgmw3zkbt59PJ68/66Yfvp9LU9HAKI6WSDfPcC+wOgDM3GBWjqgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739609; c=relaxed/simple;
	bh=3I9zyzkVdbsSVB8VOhT5PsQ+7G+zS3OZld35IU7mR88=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=aXkwQ97vaYswg//aMcXXY8ektj2kdKlCzBtXw+T5wS8Y5PYct2dbACtBAYKz4Zt5UlwYJCj714pz/mkFJhw1KxzYH1JU4MGDgBYvq0IR0qAi+sDWc2QGhTCzi7I8dnLWtTRgW1arVrSFKKrU6HZoNCu3bKGaZ+Uit9+rVaNA8fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KD4wn8FG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F74D1F000E9;
	Mon, 29 Jun 2026 13:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782739607;
	bh=fhZO9CCgyPTpV3ZQrTdwjnuLM+E9OikVfMuSHmZTx2M=;
	h=From:To:Cc:Subject:Date;
	b=KD4wn8FGWGE30eCOOOA+dBSAHZGgiXwZF29kfKE4F2uQuFsP5YxhKF+kJLGZQW+xN
	 c1FQZuucS/z/TV0fUUP3z4XSiOfaV3yT+/2dhnHni5ghGczyBnpiiVQ4ssE+H6KI6m
	 MB5KQA2l+xKim04AISyQhaPf4EpWJZCa1m2px2f9EeLMQklyKDL02qd8dJNCvthmg8
	 6PFfsK+SnbxyFSGpVQU5s9PrLcj+ipaSFtc1VHy+j8TWTBJDs/nEBBWvwVfu9LYai2
	 5NMag8oZZwUnP9IBEXZ+74fbYASdIvn/nsUwGvCqlg0YWSzWL9DSAQY7zE04B/0xQI
	 Auc5QmUPHo7UQ==
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
Subject: [PATCH 00/13] treewide: replace linux/gpio.h
Date: Mon, 29 Jun 2026 15:26:20 +0200
Message-Id: <20260629132633.1300009-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15292-lists,linux-mips=lfdr.de];
	FORGED_SENDER(0.00)[arnd@kernel.org,linux-mips@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:andrew@lunn.ch,m:sebastian.hesselbarth@gmail.com,m:gregory.clement@bootlin.com,m:Frank.Li@nxp.com,m:robert.jarzmik@free.fr,m:krzk@kernel.org,m:gerg@linux-m68k.org,m:tsbogend@alpha.franken.de,m:hauke@hauke-m.de,m:zajec5@gmail.com,m:ysato@users.sourceforge.jp,m:glaubitz@physik.fu-berlin.de,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux@dominikbrodowski.net,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-phy@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-sound@vger.kernel.org,m:sebastianhesselbarth@gmail.com,m:dmitrytorokhov@gmail.com,s:
 lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,lunn.ch,gmail.com,bootlin.com,nxp.com,free.fr,linux-m68k.org,alpha.franken.de,hauke-m.de,users.sourceforge.jp,physik.fu-berlin.de,redhat.com,dominikbrodowski.net,vger.kernel.org,lists.infradead.org,opensource.cirrus.com,lists.linux-m68k.org,lists.linux.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EBCE76DB490

From: Arnd Bergmann <arnd@arndb.de>

The linux/gpio.h header used to be the global definition for the gpio
interfaces, with 1100 users back in linux-3.17. In linux-7.2, only about
130 of those remain, so this series cleans out the rest.

In each subsystem, we can replace the header either with
linux/gpio/consumer.h for users of the modern gpio descriptor interface,
or linux/gpio/legacy.h for the few remaining users of the old number
based interface.

All patches in this series can get applied independently, so my
preference would be for each subsystem maintainer to apply these
directly, with the rest going into the gpio tree at some point.

The final patch here obviously needs to wait for all the others
to get merged first.

      Arnd

Arnd Bergmann (13):
  ARM: replace linux/gpio.h inclusions
  m68k/coldfire: replace linux/gpio.h inclusions
  mips: replace linux/gpio.h inclusions
  sh: replace linux/gpio.h inclusions
  mfd: replace linux/gpio.h inclusions
  [net-next] net: replace linux/gpio.h inclusions
  ASoC: replace linux/gpio.h inclusions
  pcmcia: replace linux/gpio.h inclusions
  phy: replace linux/gpio.h inclusions
  media: replace linux/gpio.h inclusions
  Input: matrix_keyboard - replace linux/gpio.h inclusion
  gpib: gpio: replace linux/gpio.h inclusion
  gpiolib: remove linux/gpio.h

 MAINTAINERS                                   |  1 -
 arch/arm/mach-davinci/da850.c                 |  2 +-
 arch/arm/mach-dove/mpp.c                      |  2 +-
 arch/arm/mach-mv78xx0/buffalo-wxl-setup.c     |  2 +-
 arch/arm/mach-mv78xx0/irq.c                   |  2 +-
 arch/arm/mach-mv78xx0/mpp.c                   |  2 +-
 arch/arm/mach-mvebu/pm.c                      |  2 +-
 arch/arm/mach-mxs/mach-mxs.c                  |  2 +-
 arch/arm/mach-orion5x/board-d2net.c           |  2 +-
 arch/arm/mach-orion5x/board-rd88f5182.c       |  2 +-
 arch/arm/mach-orion5x/dns323-setup.c          |  2 +-
 arch/arm/mach-orion5x/irq.c                   |  2 +-
 arch/arm/mach-orion5x/kurobox_pro-setup.c     |  2 +-
 arch/arm/mach-orion5x/mv2120-setup.c          |  2 +-
 arch/arm/mach-orion5x/net2big-setup.c         |  2 +-
 .../arm/mach-orion5x/terastation_pro2-setup.c |  2 +-
 arch/arm/mach-orion5x/ts209-setup.c           |  2 +-
 arch/arm/mach-orion5x/ts409-setup.c           |  2 +-
 arch/arm/mach-pxa/am200epd.c                  |  2 +-
 arch/arm/mach-pxa/am300epd.c                  |  2 +-
 arch/arm/mach-pxa/generic.c                   |  2 +-
 arch/arm/mach-pxa/gumstix.c                   |  2 +-
 arch/arm/mach-pxa/mfp-pxa2xx.c                |  2 +-
 arch/arm/mach-pxa/pxa25x.c                    |  2 +-
 arch/arm/mach-pxa/pxa27x.c                    |  2 +-
 arch/arm/mach-pxa/reset.c                     |  2 +-
 arch/arm/mach-pxa/sharpsl_pm.c                |  2 +-
 arch/arm/mach-pxa/spitz.c                     |  2 +-
 arch/arm/mach-pxa/spitz_pm.c                  |  2 +-
 arch/arm/mach-s3c/dev-audio-s3c64xx.c         |  2 +-
 arch/arm/mach-s3c/devs.c                      |  2 +-
 arch/arm/mach-s3c/mach-crag6410.c             |  2 +-
 arch/arm/mach-s3c/pm-gpio.c                   |  2 +-
 arch/arm/mach-s3c/pm-s3c64xx.c                |  2 +-
 arch/arm/mach-s3c/setup-fb-24bpp-s3c64xx.c    |  2 +-
 arch/arm/mach-s3c/setup-i2c0-s3c64xx.c        |  2 +-
 arch/arm/mach-s3c/setup-i2c1-s3c64xx.c        |  2 +-
 arch/arm/mach-s3c/setup-keypad-s3c64xx.c      |  2 +-
 arch/arm/mach-s3c/setup-sdhci-gpio-s3c64xx.c  |  2 +-
 arch/arm/mach-s3c/setup-spi-s3c64xx.c         |  2 +-
 arch/arm/mach-sa1100/collie.c                 |  2 +-
 arch/arm/mach-sa1100/generic.c                |  2 +-
 arch/arm/mach-sa1100/h3600.c                  |  2 +-
 arch/arm/mach-sa1100/h3xxx.c                  |  2 +-
 arch/arm/plat-orion/mpp.c                     |  2 +-
 arch/m68k/coldfire/device.c                   |  2 +-
 arch/m68k/include/asm/mcfgpio.h               |  2 +-
 arch/mips/alchemy/board-xxs1500.c             |  2 +-
 arch/mips/alchemy/devboards/db1000.c          |  2 +-
 arch/mips/alchemy/devboards/db1200.c          |  2 +-
 arch/mips/alchemy/devboards/db1550.c          |  2 +-
 arch/mips/bcm47xx/workarounds.c               |  2 +-
 arch/mips/bcm63xx/boards/board_bcm963xx.c     |  1 +
 .../include/asm/mach-bcm63xx/board_bcm963xx.h |  2 +-
 arch/mips/txx9/rbtx4927/setup.c               |  2 +-
 arch/sh/boards/board-magicpanelr2.c           |  2 +-
 arch/sh/boards/board-sh7757lcr.c              |  2 +-
 arch/sh/boards/board-urquell.c                |  2 +-
 arch/sh/boards/mach-ap325rxa/setup.c          |  2 +-
 arch/sh/boards/mach-ecovec24/setup.c          |  2 +-
 .../boards/mach-highlander/pinmux-r7785rp.c   |  2 +-
 arch/sh/boards/mach-kfr2r09/lcd_wqvga.c       |  2 +-
 arch/sh/boards/mach-kfr2r09/setup.c           |  2 +-
 arch/sh/boards/mach-migor/lcd_qvga.c          |  2 +-
 arch/sh/boards/mach-migor/setup.c             |  2 +-
 arch/sh/boards/mach-rsk/devices-rsk7203.c     |  2 +-
 arch/sh/boards/mach-rsk/devices-rsk7269.c     |  1 -
 arch/sh/boards/mach-se/7724/setup.c           |  2 +-
 .../include/mach-common/mach/magicpanelr2.h   |  2 --
 arch/sh/kernel/cpu/sh4a/setup-shx3.c          |  2 +-
 drivers/gpib/gpio/gpib_bitbang.c              |  2 +-
 drivers/gpio/TODO                             |  4 +---
 drivers/gpio/gpiolib-cdev.c                   |  2 +-
 drivers/gpio/gpiolib-legacy.c                 |  3 +--
 drivers/gpio/gpiolib.c                        |  2 +-
 drivers/input/keyboard/matrix_keypad.c        |  2 +-
 drivers/media/pci/ddbridge/ddbridge.h         |  2 +-
 .../platform/samsung/s3c-camif/camif-core.c   |  2 +-
 drivers/media/usb/em28xx/em28xx-dvb.c         |  2 +-
 drivers/mfd/aat2870-core.c                    |  2 +-
 drivers/mfd/arizona-irq.c                     |  2 +-
 drivers/mfd/lp3943.c                          |  2 +-
 drivers/mfd/si476x-cmd.c                      |  2 +-
 drivers/mfd/si476x-i2c.c                      |  2 +-
 drivers/mfd/sm501.c                           |  2 +-
 drivers/mfd/tps6105x.c                        |  2 +-
 drivers/mfd/tps65911-comparator.c             |  2 +-
 drivers/mfd/wm8994-irq.c                      |  2 +-
 drivers/net/dsa/b53/b53_priv.h                |  3 ++-
 drivers/net/dsa/microchip/ksz8.c              |  2 +-
 drivers/net/ethernet/allwinner/sun4i-emac.c   |  2 +-
 .../net/ethernet/apm/xgene/xgene_enet_main.c  |  2 +-
 .../ethernet/oki-semi/pch_gbe/pch_gbe_main.c  |  2 +-
 drivers/net/phy/mdio_device.c                 |  2 +-
 drivers/pcmcia/bcm63xx_pcmcia.c               |  2 +-
 drivers/pcmcia/db1xxx_ss.c                    |  2 +-
 drivers/pcmcia/sa1100_h3600.c                 |  2 +-
 drivers/pcmcia/soc_common.c                   |  2 +-
 drivers/pcmcia/xxs1500_ss.c                   |  2 +-
 drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c     |  2 +-
 drivers/phy/rockchip/phy-rockchip-usbdp.c     |  2 +-
 drivers/phy/ti/phy-j721e-wiz.c                |  2 +-
 include/linux/gpio.h                          | 22 -------------------
 include/linux/mfd/lp3943.h                    |  2 +-
 include/linux/mfd/ti-lmu.h                    |  2 +-
 include/linux/mfd/tps65910.h                  |  2 +-
 include/linux/mfd/ucb1x00.h                   |  2 +-
 sound/soc/codecs/cs42l84.c                    |  2 +-
 sound/soc/codecs/cx2072x.c                    |  2 +-
 sound/soc/codecs/dmic.c                       |  2 +-
 110 files changed, 107 insertions(+), 134 deletions(-)
 delete mode 100644 include/linux/gpio.h

-- 
2.39.5

Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Hauke Mehrtens <hauke@hauke-m.de>
Cc: "Rafał Miłecki" <zajec5@gmail.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: patches@opensource.cirrus.com
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-mips@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-phy@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-sound@vger.kernel.org

