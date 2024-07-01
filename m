Return-Path: <linux-mips+bounces-4062-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5218C91E173
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2024 15:57:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2384B24F3E
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2024 13:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0F616939E;
	Mon,  1 Jul 2024 13:54:25 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3021684B5
	for <linux-mips@vger.kernel.org>; Mon,  1 Jul 2024 13:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719842065; cv=none; b=Iey/0RKY9HhvE16zk1FOhR1TnrRqSvlmeRdBY0+z0aMW5WYXYq7JASBQnkPMdB71h3Gn07lDctigzCySFcuf1WvbjLxKZXcYgFfcwx2R41NUOXgMLKRz0uaCmOoL/GrCkEXlMUNC9jIvhSws35M6XAhe1R3j2MqdI0Ddile7eDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719842065; c=relaxed/simple;
	bh=Uzn7LDoOL9SlsZeIM68XzGKBB+r44Ge/qQ/yufBvw8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iJ+a0EHWGJlqkMp8IPmwsiXLfAT29WZYbbv9msqrkcAdK58TQVZpZEFXmCz4qDu4mH16/LjEAKM87rLwryVrSde/Tt8bDX7bjHikRNHxRM/m1kUtQMKupim8kE9u5G9Y8oKVO5R2Gvj4Wct1kqctQNZuPK5+q+BWo29vNN4/Oco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1sOHTY-0001LY-20; Mon, 01 Jul 2024 15:53:48 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Mon, 01 Jul 2024 15:53:48 +0200
Subject: [PATCH 9/9] eeprom: at24: remove deprecated Kconfig symbol
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240701-b4-v6-10-topic-usbc-tcpci-v1-9-3fd5f4a193cc@pengutronix.de>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
In-Reply-To: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-tegra@vger.kernel.org, openbmc@lists.ozlabs.org, 
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, 
 loongarch@lists.linux.dev, Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.15-dev
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org

All kernel users are shifted to the new MTD_EEPROM_AT24 Kconfig symbol
so we can drop the old one.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/misc/eeprom/Kconfig | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/misc/eeprom/Kconfig b/drivers/misc/eeprom/Kconfig
index 3a9aaec2f2c7..9e071cfdc6c6 100644
--- a/drivers/misc/eeprom/Kconfig
+++ b/drivers/misc/eeprom/Kconfig
@@ -1,13 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menu "EEPROM support"
 
-config EEPROM_AT24
-	tristate "I2C EEPROMs / RAMs / ROMs from most vendors"
-	select MTD_EEPROM_AT24
-	help
-	  Deprecated config option to get read/write support to most I2C
-	  EEPROMs. Please use MTD_EEPROM_AT24 instead.
-
 config EEPROM_AT25
 	tristate "SPI EEPROMs (FRAMs) from most vendors"
 	depends on SPI && SYSFS

-- 
2.39.2


