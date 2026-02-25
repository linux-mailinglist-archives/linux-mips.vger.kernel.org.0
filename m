Return-Path: <linux-mips+bounces-13216-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKhSIF8pn2kOZQQAu9opvQ
	(envelope-from <linux-mips+bounces-13216-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 17:54:55 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 512A119B070
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 17:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 370523011368
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 16:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B814E3DA7D9;
	Wed, 25 Feb 2026 16:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OmNwfNk0"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366173B8BCC
	for <linux-mips@vger.kernel.org>; Wed, 25 Feb 2026 16:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772038489; cv=none; b=BOLBoGc3StPNr5TmvsC8RD4PU3AL9UFJUHqV2u1n1pNeGckZsdyvGWizTGWeySslbY2ARP8p81AMzDTGUcra80Zmx96MOIAZfWwuG8MY6VlkopS0YUJ4pj6Lv+I5V/us62HjOJLXjEt0CLUAlZsd0QCwAwjFkxMK8+cLpKcLGe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772038489; c=relaxed/simple;
	bh=ufUABGpy4hR1rGO7WgLF9OemUTbkWSkTTO97JHlCGhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U5jXbptQsejRhyMZDcRUu1hDLA3vwD4aRr+gKpGsXUuMPkRqN6/DQnzzEsEKtGNM/BZryOeibz6ekV46g17op5VvTcpXgws1fqVTC5ZZdrlfAr0WlT4UzAhwMbjEGvigsg5fTKN6YYEEzYRLfAR3rjE4A7MjxqbNWaIW3fCGrCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OmNwfNk0; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D0E241A1327;
	Wed, 25 Feb 2026 16:54:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A14825FDE6;
	Wed, 25 Feb 2026 16:54:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6CAB103692EB;
	Wed, 25 Feb 2026 17:54:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772038485; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hbExuNjBmOZ0ueVI/B5TUXeiS72262HZyYO7x1vORsE=;
	b=OmNwfNk0NE7xAdszNtvkxZECy8O4L6biwVMA2UYIQbB9+9wFfLu+vTe2rWqCJ9xttY6xbB
	cg84Pwjtt6BvzU2c8cTbdo0HpfukEps4hhEKqW28xxegAT0cF4DjNV1sJs4rHpo2VugfRM
	44Hsz/iDqtGDbVwcwtB9gG+MY0wEdK8uvVtz8x8ZRrZkeo2wcpSFIey4R7ZrzzBXavPJKp
	DI5cnSDlwRvQoRg5BbwMtVhJuiA6ztOu9VHAh7g1C8IBtDmZ1SiDD4XsEQJ0FYctU/PymC
	8HfQ6XR5jDDkH7g76mazvCMKkZVh7ohoMJFiBCyyvUZvZILNLDK29THJ6302GA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 25 Feb 2026 17:54:40 +0100
Subject: [PATCH v7 1/2] phy: sort Kconfig and Makefile
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260225-macb-phy-v7-1-e5211a61db56@bootlin.com>
References: <20260225-macb-phy-v7-0-e5211a61db56@bootlin.com>
In-Reply-To: <20260225-macb-phy-v7-0-e5211a61db56@bootlin.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13216-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[theo.lebrun@bootlin.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:mid,bootlin.com:dkim,bootlin.com:email]
X-Rspamd-Queue-Id: 512A119B070
X-Rspamd-Action: no action

Neither Kconfig nor Makefile are sorted; reorder them.

$ diff -U100 <(grep ^config drivers/phy/Kconfig) \
             <(grep ^config drivers/phy/Kconfig | sort)

$ diff -U100 <(grep ^obj-\\$ drivers/phy/Makefile) \
             <(grep ^obj-\\$ drivers/phy/Makefile | sort)

PHY_COMMON_PROPS{,_TEST} are kept at the top which does not respect
sorting order.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/phy/Kconfig  | 86 ++++++++++++++++++++++++++--------------------------
 drivers/phy/Makefile |  8 ++---
 2 files changed, 47 insertions(+), 47 deletions(-)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 02467dfd4fb0..c86e90027443 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -47,6 +47,26 @@ config GENERIC_PHY_MIPI_DPHY
 	  Provides a number of helpers a core functions for MIPI D-PHY
 	  drivers to us.
 
+config PHY_AIROHA_PCIE
+	tristate "Airoha PCIe-PHY Driver"
+	depends on ARCH_AIROHA || COMPILE_TEST
+	depends on OF
+	select GENERIC_PHY
+	help
+	  Say Y here to add support for Airoha PCIe PHY driver.
+	  This driver create the basic PHY instance and provides initialize
+	  callback for PCIe GEN3 port.
+
+config PHY_CAN_TRANSCEIVER
+	tristate "CAN transceiver PHY"
+	select GENERIC_PHY
+	select MULTIPLEXER
+	help
+	  This option enables support for CAN transceivers as a PHY. This
+	  driver provides function for putting the transceivers in various
+	  functional modes using gpios and sets the attribute max link
+	  rate, for CAN drivers.
+
 config PHY_GOOGLE_USB
 	tristate "Google Tensor SoC USB PHY driver"
 	select GENERIC_PHY
@@ -69,6 +89,17 @@ config PHY_LPC18XX_USB_OTG
 	  This driver is need for USB0 support on LPC18xx/43xx and takes
 	  care of enabling and clock setup.
 
+config PHY_NXP_PTN3222
+	tristate "NXP PTN3222 1-port eUSB2 to USB2 redriver"
+	depends on I2C
+	depends on OF
+	select GENERIC_PHY
+	help
+	  Enable this to support NXP PTN3222 1-port eUSB2 to USB2 Redriver.
+	  This redriver performs translation between eUSB2 and USB2 signalling
+	  schemes. It supports all three USB 2.0 data rates: Low Speed, Full
+	  Speed and High Speed.
+
 config PHY_PISTACHIO_USB
 	tristate "IMG Pistachio USB2.0 PHY driver"
 	depends on MIPS || COMPILE_TEST
@@ -84,6 +115,18 @@ config PHY_SNPS_EUSB2
 	  Enable support for the USB high-speed SNPS eUSB2 phy on select
 	  SoCs. The PHY is usually paired with a Synopsys DWC3 USB controller.
 
+config PHY_SPACEMIT_K1_PCIE
+	tristate "PCIe and combo PHY driver for the SpacemiT K1 SoC"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on COMMON_CLK
+	depends on HAS_IOMEM
+	depends on OF
+	select GENERIC_PHY
+	default ARCH_SPACEMIT
+	help
+	  Enable support for the PCIe and USB 3 combo PHY and two
+	  PCIe-only PHYs used in the SpacemiT K1 SoC.
+
 config PHY_XGENE
 	tristate "APM X-Gene 15Gbps PHY support"
 	depends on HAS_IOMEM && OF && (ARCH_XGENE || COMPILE_TEST)
@@ -103,49 +146,6 @@ config USB_LGM_PHY
 	  interface to interact with USB GEN-II and USB 3.x PHY that is part
 	  of the Intel network SOC.
 
-config PHY_CAN_TRANSCEIVER
-	tristate "CAN transceiver PHY"
-	select GENERIC_PHY
-	select MULTIPLEXER
-	help
-	  This option enables support for CAN transceivers as a PHY. This
-	  driver provides function for putting the transceivers in various
-	  functional modes using gpios and sets the attribute max link
-	  rate, for CAN drivers.
-
-config PHY_AIROHA_PCIE
-	tristate "Airoha PCIe-PHY Driver"
-	depends on ARCH_AIROHA || COMPILE_TEST
-	depends on OF
-	select GENERIC_PHY
-	help
-	  Say Y here to add support for Airoha PCIe PHY driver.
-	  This driver create the basic PHY instance and provides initialize
-	  callback for PCIe GEN3 port.
-
-config PHY_NXP_PTN3222
-	tristate "NXP PTN3222 1-port eUSB2 to USB2 redriver"
-	depends on I2C
-	depends on OF
-	select GENERIC_PHY
-	help
-	  Enable this to support NXP PTN3222 1-port eUSB2 to USB2 Redriver.
-	  This redriver performs translation between eUSB2 and USB2 signalling
-	  schemes. It supports all three USB 2.0 data rates: Low Speed, Full
-	  Speed and High Speed.
-
-config PHY_SPACEMIT_K1_PCIE
-	tristate "PCIe and combo PHY driver for the SpacemiT K1 SoC"
-	depends on ARCH_SPACEMIT || COMPILE_TEST
-	depends on COMMON_CLK
-	depends on HAS_IOMEM
-	depends on OF
-	select GENERIC_PHY
-	default ARCH_SPACEMIT
-	help
-	  Enable support for the PCIe and USB 3 combo PHY and two
-	  PCIe-only PHYs used in the SpacemiT K1 SoC.
-
 source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
 source "drivers/phy/apple/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index a648c2e02a83..4c07926bc47b 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -7,16 +7,16 @@ obj-$(CONFIG_PHY_COMMON_PROPS)		+= phy-common-props.o
 obj-$(CONFIG_PHY_COMMON_PROPS_TEST)	+= phy-common-props-test.o
 obj-$(CONFIG_GENERIC_PHY)		+= phy-core.o
 obj-$(CONFIG_GENERIC_PHY_MIPI_DPHY)	+= phy-core-mipi-dphy.o
+obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_CAN_TRANSCEIVER)	+= phy-can-transceiver.o
 obj-$(CONFIG_PHY_GOOGLE_USB)		+= phy-google-usb.o
 obj-$(CONFIG_PHY_LPC18XX_USB_OTG)	+= phy-lpc18xx-usb-otg.o
-obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
+obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
 obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
 obj-$(CONFIG_PHY_SNPS_EUSB2)		+= phy-snps-eusb2.o
-obj-$(CONFIG_USB_LGM_PHY)		+= phy-lgm-usb.o
-obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
-obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
 obj-$(CONFIG_PHY_SPACEMIT_K1_PCIE)	+= phy-spacemit-k1-pcie.o
+obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
+obj-$(CONFIG_USB_LGM_PHY)		+= phy-lgm-usb.o
 obj-$(CONFIG_GENERIC_PHY)		+= allwinner/	\
 					   amlogic/	\
 					   apple/	\

-- 
2.53.0


