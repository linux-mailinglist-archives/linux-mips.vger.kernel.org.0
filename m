Return-Path: <linux-mips+bounces-15752-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id brOIO11jUWrxDgMAu9opvQ
	(envelope-from <linux-mips+bounces-15752-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 23:25:50 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB4273ED67
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 23:25:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Je40zX7Q;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15752-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15752-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84A433025D00
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 21:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2D43B14C2;
	Fri, 10 Jul 2026 21:20:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3993B6354;
	Fri, 10 Jul 2026 21:20:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718408; cv=none; b=d1sFQreR7USbCv/n8umQD3xuO0hnCE6TE+OeZ83uxREoOiwtCsjd/MbSO48FgGGFjgBDEuJxU276dIqc+9fJXuN+CwF6hEP20Jj8S+X+bTNZXrEEyptQ9fs03rWdbJxoneqOuFH1I5kx5E8qZxGluiIAioTj3o5HsYq4iGSIqs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718408; c=relaxed/simple;
	bh=K7vDYpsWFtkBmyqXdPXV4EBKZsl5etuB65I+fJm4lQw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=TxMEKBOHvAb5Dph7a1/uKAfUU4yMDt1YL/zuWMjMnmh6SmZvg78sC6JOsPw1DR+9/TdIVGJjsS6AfOTDNwtfjVTit6H7taebiWSVHdkJy650RxNRF/z1XeKMKOz/nx/HVVA3/rSYHjf6FzcOatfKrPTkbc1jrDqp9zdImPvNPDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Je40zX7Q; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59CA51F000E9;
	Fri, 10 Jul 2026 21:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783718407;
	bh=agk6Lq9Q7fhqJWnKZOxx+JzowUA5NVdPlMIz6yfgy2s=;
	h=From:To:Cc:Subject:Date;
	b=Je40zX7QlpMeFEPJVqCFBAV+vhEbKCArebze1sibQKk68QkYbo5IXzDFLjZN4MDFs
	 yPiia0yZyhPOfiFyDjEpkb9DOy1lnXc7C3Y+Rc4B/0ujUEO3jQx8zUiDfhbEAlKgSM
	 uYw89aNGq3fhRC845RxWxZ/uTPkbCLr1iHKz/xc1EOMmOIYOXY3xQi1koaOIsdG8GE
	 yXxHisf8/ajQb0ZmXIcvR5U+Qw/WM9SA0WVx/uCpxtJPqIkyvTroDqFv4hRnRBlw1d
	 mTSqK1nbv+SmOuXHkNM3hNrlDoZAT6gwt4MXVj8hkjGmGZ726g/u8FFWX/yCrF8RlU
	 +7z7k2VTdnYYQ==
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
	linux-sound@vger.kernel.org
Subject: [PATCH v2 00/10] treewide: replace linux/gpio.h
Date: Fri, 10 Jul 2026 23:19:45 +0200
Message-Id: <20260710211954.1373336-1-arnd@kernel.org>
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
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15752-lists,linux-mips=lfdr.de];
	FORGED_SENDER(0.00)[arnd@kernel.org,linux-mips@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:andrew@lunn.ch,m:sebastian.hesselbarth@gmail.com,m:gregory.clement@bootlin.com,m:Frank.Li@nxp.com,m:robert.jarzmik@free.fr,m:krzk@kernel.org,m:gerg@linux-m68k.org,m:tsbogend@alpha.franken.de,m:hauke@hauke-m.de,m:zajec5@gmail.com,m:ysato@users.sourceforge.jp,m:glaubitz@physik.fu-berlin.de,m:dmitry.torokhov@gmail.com,m:linux@dominikbrodowski.net,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-phy@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-sound@vger.kernel.org,m:sebastianhesselbarth@gmail.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[arndb.de,lunn.ch,gmail.com,bootlin.com,nxp.com,free.fr,kernel.org,linux-m68k.org,alpha.franken.de,hauke-m.de,users.sourceforge.jp,physik.fu-berlin.de,dominikbrodowski.net,vger.kernel.org,lists.infradead.org,opensource.cirrus.com,lists.linux-m68k.org,lists.linux.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8CB4273ED67

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

I've uploaded this to 

   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/ config-gpio-legacy-for-7.3

      Arnd


v2: dropped two already applied patches,
    removed duplicate includes,
    dropped final patch to remove linux/gpio.h as it now depends
    on patches in linux-next

 arch/arm/mach-davinci/da850.c                       | 2 +-
 arch/arm/mach-dove/mpp.c                            | 2 +-
 arch/arm/mach-mv78xx0/buffalo-wxl-setup.c           | 2 +-
 arch/arm/mach-mv78xx0/irq.c                         | 2 +-
 arch/arm/mach-mv78xx0/mpp.c                         | 2 +-
 arch/arm/mach-mvebu/pm.c                            | 2 +-
 arch/arm/mach-mxs/mach-mxs.c                        | 2 +-
 arch/arm/mach-orion5x/board-d2net.c                 | 2 +-
 arch/arm/mach-orion5x/board-rd88f5182.c             | 2 +-
 arch/arm/mach-orion5x/dns323-setup.c                | 2 +-
 arch/arm/mach-orion5x/irq.c                         | 2 +-
 arch/arm/mach-orion5x/kurobox_pro-setup.c           | 2 +-
 arch/arm/mach-orion5x/mv2120-setup.c                | 2 +-
 arch/arm/mach-orion5x/net2big-setup.c               | 2 +-
 arch/arm/mach-orion5x/terastation_pro2-setup.c      | 2 +-
 arch/arm/mach-orion5x/ts209-setup.c                 | 2 +-
 arch/arm/mach-orion5x/ts409-setup.c                 | 2 +-
 arch/arm/mach-pxa/am200epd.c                        | 2 +-
 arch/arm/mach-pxa/am300epd.c                        | 2 +-
 arch/arm/mach-pxa/generic.c                         | 2 +-
 arch/arm/mach-pxa/gumstix.c                         | 2 +-
 arch/arm/mach-pxa/mfp-pxa2xx.c                      | 2 +-
 arch/arm/mach-pxa/pxa25x.c                          | 2 +-
 arch/arm/mach-pxa/pxa27x.c                          | 2 +-
 arch/arm/mach-pxa/reset.c                           | 2 +-
 arch/arm/mach-pxa/sharpsl_pm.c                      | 2 +-
 arch/arm/mach-pxa/spitz.c                           | 2 +-
 arch/arm/mach-pxa/spitz_pm.c                        | 2 +-
 arch/arm/mach-s3c/dev-audio-s3c64xx.c               | 2 +-
 arch/arm/mach-s3c/devs.c                            | 2 +-
 arch/arm/mach-s3c/mach-crag6410.c                   | 2 +-
 arch/arm/mach-s3c/pm-gpio.c                         | 2 +-
 arch/arm/mach-s3c/pm-s3c64xx.c                      | 2 +-
 arch/arm/mach-s3c/setup-fb-24bpp-s3c64xx.c          | 2 +-
 arch/arm/mach-s3c/setup-i2c0-s3c64xx.c              | 2 +-
 arch/arm/mach-s3c/setup-i2c1-s3c64xx.c              | 2 +-
 arch/arm/mach-s3c/setup-keypad-s3c64xx.c            | 2 +-
 arch/arm/mach-s3c/setup-sdhci-gpio-s3c64xx.c        | 2 +-
 arch/arm/mach-s3c/setup-spi-s3c64xx.c               | 2 +-
 arch/arm/mach-sa1100/collie.c                       | 2 +-
 arch/arm/mach-sa1100/generic.c                      | 2 +-
 arch/arm/mach-sa1100/h3600.c                        | 2 +-
 arch/arm/mach-sa1100/h3xxx.c                        | 2 +-
 arch/arm/plat-orion/mpp.c                           | 2 +-
 arch/m68k/coldfire/device.c                         | 2 +-
 arch/m68k/include/asm/mcfgpio.h                     | 2 +-
 arch/mips/alchemy/board-xxs1500.c                   | 2 +-
 arch/mips/alchemy/devboards/db1000.c                | 2 +-
 arch/mips/alchemy/devboards/db1200.c                | 2 +-
 arch/mips/alchemy/devboards/db1550.c                | 2 +-
 arch/mips/bcm47xx/workarounds.c                     | 2 +-
 arch/mips/bcm63xx/boards/board_bcm963xx.c           | 1 +
 arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h | 2 +-
 arch/mips/txx9/rbtx4927/setup.c                     | 2 +-
 arch/sh/boards/board-magicpanelr2.c                 | 2 +-
 arch/sh/boards/board-sh7757lcr.c                    | 2 +-
 arch/sh/boards/board-urquell.c                      | 2 +-
 arch/sh/boards/mach-ap325rxa/setup.c                | 2 +-
 arch/sh/boards/mach-ecovec24/setup.c                | 2 +-
 arch/sh/boards/mach-highlander/pinmux-r7785rp.c     | 2 +-
 arch/sh/boards/mach-kfr2r09/lcd_wqvga.c             | 2 +-
 arch/sh/boards/mach-kfr2r09/setup.c                 | 2 +-
 arch/sh/boards/mach-migor/lcd_qvga.c                | 2 +-
 arch/sh/boards/mach-migor/setup.c                   | 2 +-
 arch/sh/boards/mach-rsk/devices-rsk7203.c           | 2 +-
 arch/sh/boards/mach-rsk/devices-rsk7269.c           | 1 -
 arch/sh/boards/mach-se/7724/setup.c                 | 2 +-
 arch/sh/include/mach-common/mach/magicpanelr2.h     | 2 --
 arch/sh/kernel/cpu/sh4a/setup-shx3.c                | 2 +-
 drivers/gpib/gpio/gpib_bitbang.c                    | 1 -
 drivers/input/keyboard/matrix_keypad.c              | 1 -
 drivers/mfd/aat2870-core.c                          | 2 +-
 drivers/mfd/arizona-irq.c                           | 2 +-
 drivers/mfd/lp3943.c                                | 2 +-
 drivers/mfd/sm501.c                                 | 2 +-
 drivers/mfd/tps6105x.c                              | 2 +-
 drivers/mfd/tps65911-comparator.c                   | 2 +-
 drivers/mfd/wm8994-irq.c                            | 2 +-
 drivers/pcmcia/bcm63xx_pcmcia.c                     | 2 +-
 drivers/pcmcia/db1xxx_ss.c                          | 2 +-
 drivers/pcmcia/sa1100_h3600.c                       | 2 +-
 drivers/pcmcia/soc_common.c                         | 2 +-
 drivers/pcmcia/xxs1500_ss.c                         | 2 +-
 drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c           | 1 -
 drivers/phy/rockchip/phy-rockchip-usbdp.c           | 2 +-
 drivers/phy/ti/phy-j721e-wiz.c                      | 1 -
 include/linux/mfd/lp3943.h                          | 2 +-
 include/linux/mfd/ti-lmu.h                          | 1 -
 include/linux/mfd/tps65910.h                        | 2 +-
 include/linux/mfd/ucb1x00.h                         | 2 +-
 sound/soc/codecs/cs42l84.c                          | 1 -
 sound/soc/codecs/cx2072x.c                          | 2 +-
 sound/soc/codecs/dmic.c                             | 1 -
 93 files changed, 84 insertions(+), 93 deletions(-)

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
Cc: linux-sunxi@lists.linux.dev
Cc: linux-phy@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-sound@vger.kernel.org

