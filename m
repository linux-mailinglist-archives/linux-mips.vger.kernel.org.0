Return-Path: <linux-mips+bounces-14810-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMoyEMq9F2qRPAgAu9opvQ
	(envelope-from <linux-mips+bounces-14810-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2026 06:00:10 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4459C5EC58C
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2026 06:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C0C703003BE8
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2026 04:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D17A2313E07;
	Thu, 28 May 2026 04:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TXKfW9XP"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F7C1E7C18
	for <linux-mips@vger.kernel.org>; Thu, 28 May 2026 04:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779940804; cv=none; b=MsmeWTxlVDduv9QAOWntWuBA3TA3Qghb1jSAvk+4aGNmTzI7G1NgozjlHx4zEoH88G1cf8gJ1YOqLUXhBubWQpuD6h+6Qjtnui7cIsJG0bozlmrKf4qCx2q8P8nDE1O9XBMDYf4rjzFlep7a7q+IzMKkX02D/XTP7OcUW8ZnPmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779940804; c=relaxed/simple;
	bh=xRmI9xvvscarb7YPoSLYzGv57CNJhhzOPP0AV7vveEA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d58/lkSYClIWxmsic5bAPdp4Vbaiz6vFEgJjBtwHQpnbVHDW/RbTfiuHOlW43MCFYQzZTEnyjldT0CVZQMeC7Ih47gcJFYc2t1aCStU7YCVzf4GWCwbmCR0augju+WjJmrLIUOSC+uGa99GhaPtrRH9rtGxMiLlAMRjBu4D2A4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TXKfW9XP; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36b95eb4bb4so49923a91.3
        for <linux-mips@vger.kernel.org>; Wed, 27 May 2026 21:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779940802; x=1780545602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GKQKNzXdduMQwRlYPVYz9zIXPnGdeEtW5Ugt0fmMx0Y=;
        b=TXKfW9XPbqZRgT1h+kuaM35W0pV+FGa2tD4vwOmoHLMhBJJShrhn272xi/UScbTvcO
         O2sMClUaCZ3Ou8GtfDuckGHOMaAH0OaJ7h4plWOzmpBFT0OFaGBzPv0tORhUFAz1cVJa
         uRZZbHwyxlCWJ2bbHfHY11yoMQ2ze8u8rbxShlGGYZrZ2dHgHnLm7EN0ue/Ss8NmeMTE
         QzwelRkX1Ek8GePvAi7hdiT8ilcGQqIg0Dc8fSzBR+x65KhxetYzCn7QG1JAq7dvDA8M
         z1o4tFbzbc+Rs9f+Tx/cRQ/3TY88SdxrIyHDZVrVI3pTc6woJhwZoa+9Jiee4pvrGSyC
         5aLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779940802; x=1780545602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKQKNzXdduMQwRlYPVYz9zIXPnGdeEtW5Ugt0fmMx0Y=;
        b=Ui8fmEldHEfOHxe9+PJ6PmlauPmK818WKlXmt/TIBvOwPsImpnDdRryLcTbfvyXN1U
         dRa+AhFdnFmWflHNlN/XSantsZHWWUCGe38W+4njUQAzIvMVItCemssU22UpQC/+RvbD
         FNrWurxQLtxggGRhiuKj6bathDuyju0fGiMRtBBnfo6mOfrje+ywdpBg1mAJCHkV9dc7
         E2aX4D9uoMrAi5uoOsTH2cA64lwVdY5cL0TkSDacgetARPCluC1RJ0GqNJXA3vALgT6X
         QbRfMGTwK/yKjbavobC+EiyHRMr9Ye+jgwO4dBxw4NMZrD9HastcHmpraFKJXxp4fcZz
         OQsw==
X-Gm-Message-State: AOJu0Yyg8tsWIje4nmJscWhKnu3DIBMFm0T2ENmRNMlldttP69Unl2U0
	XJBK/6vHhv8wnlmeDxs/R2E32zksQmd9izcoXDdj65YfH2ejYuqpyu6sEdRiZrRp
X-Gm-Gg: Acq92OHx4mFePrBVVimuQESxr8C834x7cZzcuMvsijSezDv8bk+godDE6jfkbVJOkLP
	mHhSGDAkgGq4Xd0LG9owzgE561/EXqhkGBiCbmJAzYeDoMlRFIwGgV8FYhAIMMjv5ydjFmXUAtJ
	o5DItejPa8w863KX3G17t/Xv6gBCcIup0xkMr3fmX8Ckq5WnyHJW3XqiUhhcPJNdr0E+4aO+pG6
	HeFJdopBZApTthR3Mlu6xo3uvOr2jzmqPpefqwni2mPXIqX903ZCfQ1qb21BR3JSpF4VRSzY5UE
	5hrK65LmImMB1HndVkTnFVpFXh+g1vo8tjoWOsSpMR62YrSNc1d9vlMyl/2eQZbH7++KBkXFdrZ
	FuxPN9XAgyCpE944KtTG/xwGCGJdZ7wry0X3PziBh6korNOEyX5agjygqMuoSvAUYk5qsdzks80
	xcBP7gkucmGUO7n0ehTnxzaRht27pN9wecOx3laprwsU/oeHdYiwEHnv9D+a6Zf7zKn7hjFTTlf
	aMHS80XVH2ZlE7xgZNdewuzdLlfXU7yvzsV4Tdp5xqv6A==
X-Received: by 2002:a17:90b:564d:b0:36b:4d63:4a95 with SMTP id 98e67ed59e1d1-36b4d634c2amr4649906a91.5.1779940801838;
        Wed, 27 May 2026 21:00:01 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:b235:9fff:fe2d:7319])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202b3867sm13376484a12.11.2026.05.27.21.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 21:00:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MIPS: ath79: pci: remove
Date: Wed, 27 May 2026 20:59:43 -0700
Message-ID: <20260528035943.719613-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14810-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4459C5EC58C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit 85b9686dae30 ("MIPS: ath79: drop platform device registration code")
removed the ability for anything to bind to these drivers and use them.
Meaning as is, these drivers cannot be used.

Downstream OpenWrt has hack patches that add the missing OF stuff but
those are not suitable for upstream.

The current plan is to rewrite these drivers using newer APIs and have
them live under drivers/pci/controller. But as for these, axe them.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ath79/Kconfig    |   7 -
 arch/mips/pci/Makefile     |   2 -
 arch/mips/pci/pci-ar71xx.c | 401 ---------------------------------
 arch/mips/pci/pci-ar724x.c | 447 -------------------------------------
 4 files changed, 857 deletions(-)
 delete mode 100644 arch/mips/pci/pci-ar71xx.c
 delete mode 100644 arch/mips/pci/pci-ar724x.c

diff --git a/arch/mips/ath79/Kconfig b/arch/mips/ath79/Kconfig
index 04154128c4de..dbad2265d406 100644
--- a/arch/mips/ath79/Kconfig
+++ b/arch/mips/ath79/Kconfig
@@ -7,7 +7,6 @@ config SOC_AR71XX
 
 config SOC_AR724X
 	select HAVE_PCI
-	select PCI_AR724X if PCI
 	def_bool n
 
 config SOC_AR913X
@@ -18,15 +17,9 @@ config SOC_AR933X
 
 config SOC_AR934X
 	select HAVE_PCI
-	select PCI_AR724X if PCI
 	def_bool n
 
 config SOC_QCA955X
 	select HAVE_PCI
-	select PCI_AR724X if PCI
 	def_bool n
-
-config PCI_AR724X
-	def_bool n
-
 endif
diff --git a/arch/mips/pci/Makefile b/arch/mips/pci/Makefile
index a6e9785b537e..7fe64bef457c 100644
--- a/arch/mips/pci/Makefile
+++ b/arch/mips/pci/Makefile
@@ -19,8 +19,6 @@ obj-$(CONFIG_BCM63XX)		+= pci-bcm63xx.o fixup-bcm63xx.o \
 					ops-bcm63xx.o
 obj-$(CONFIG_MIPS_ALCHEMY)	+= pci-alchemy.o
 obj-$(CONFIG_PCI_AR2315)	+= pci-ar2315.o
-obj-$(CONFIG_SOC_AR71XX)	+= pci-ar71xx.o
-obj-$(CONFIG_PCI_AR724X)	+= pci-ar724x.o
 obj-$(CONFIG_PCI_XTALK_BRIDGE)	+= pci-xtalk-bridge.o
 #
 # These are still pretty much in the old state, watch, go blind.
diff --git a/arch/mips/pci/pci-ar71xx.c b/arch/mips/pci/pci-ar71xx.c
deleted file mode 100644
index 118760b3fa82..000000000000
--- a/arch/mips/pci/pci-ar71xx.c
+++ /dev/null
@@ -1,401 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *  Atheros AR71xx PCI host controller driver
- *
- *  Copyright (C) 2008-2011 Gabor Juhos <juhosg@openwrt.org>
- *  Copyright (C) 2008 Imre Kaloz <kaloz@openwrt.org>
- *
- *  Parts of this file are based on Atheros' 2.6.15 BSP
- */
-
-#include <linux/resource.h>
-#include <linux/types.h>
-#include <linux/delay.h>
-#include <linux/bitops.h>
-#include <linux/pci.h>
-#include <linux/pci_regs.h>
-#include <linux/interrupt.h>
-#include <linux/init.h>
-#include <linux/platform_device.h>
-
-#include <asm/mach-ath79/ar71xx_regs.h>
-#include <asm/mach-ath79/ath79.h>
-
-#define AR71XX_PCI_REG_CRP_AD_CBE	0x00
-#define AR71XX_PCI_REG_CRP_WRDATA	0x04
-#define AR71XX_PCI_REG_CRP_RDDATA	0x08
-#define AR71XX_PCI_REG_CFG_AD		0x0c
-#define AR71XX_PCI_REG_CFG_CBE		0x10
-#define AR71XX_PCI_REG_CFG_WRDATA	0x14
-#define AR71XX_PCI_REG_CFG_RDDATA	0x18
-#define AR71XX_PCI_REG_PCI_ERR		0x1c
-#define AR71XX_PCI_REG_PCI_ERR_ADDR	0x20
-#define AR71XX_PCI_REG_AHB_ERR		0x24
-#define AR71XX_PCI_REG_AHB_ERR_ADDR	0x28
-
-#define AR71XX_PCI_CRP_CMD_WRITE	0x00010000
-#define AR71XX_PCI_CRP_CMD_READ		0x00000000
-#define AR71XX_PCI_CFG_CMD_READ		0x0000000a
-#define AR71XX_PCI_CFG_CMD_WRITE	0x0000000b
-
-#define AR71XX_PCI_INT_CORE		BIT(4)
-#define AR71XX_PCI_INT_DEV2		BIT(2)
-#define AR71XX_PCI_INT_DEV1		BIT(1)
-#define AR71XX_PCI_INT_DEV0		BIT(0)
-
-#define AR71XX_PCI_IRQ_COUNT		5
-
-struct ar71xx_pci_controller {
-	void __iomem *cfg_base;
-	int irq;
-	int irq_base;
-	struct pci_controller pci_ctrl;
-	struct resource io_res;
-	struct resource mem_res;
-};
-
-/* Byte lane enable bits */
-static const u8 ar71xx_pci_ble_table[4][4] = {
-	{0x0, 0xf, 0xf, 0xf},
-	{0xe, 0xd, 0xb, 0x7},
-	{0xc, 0xf, 0x3, 0xf},
-	{0xf, 0xf, 0xf, 0xf},
-};
-
-static const u32 ar71xx_pci_read_mask[8] = {
-	0, 0xff, 0xffff, 0, 0xffffffff, 0, 0, 0
-};
-
-static inline u32 ar71xx_pci_get_ble(int where, int size, int local)
-{
-	u32 t;
-
-	t = ar71xx_pci_ble_table[size & 3][where & 3];
-	BUG_ON(t == 0xf);
-	t <<= (local) ? 20 : 4;
-
-	return t;
-}
-
-static inline u32 ar71xx_pci_bus_addr(struct pci_bus *bus, unsigned int devfn,
-				      int where)
-{
-	u32 ret;
-
-	if (!bus->number) {
-		/* type 0 */
-		ret = (1 << PCI_SLOT(devfn)) | (PCI_FUNC(devfn) << 8) |
-		      (where & ~3);
-	} else {
-		/* type 1 */
-		ret = (bus->number << 16) | (PCI_SLOT(devfn) << 11) |
-		      (PCI_FUNC(devfn) << 8) | (where & ~3) | 1;
-	}
-
-	return ret;
-}
-
-static inline struct ar71xx_pci_controller *
-pci_bus_to_ar71xx_controller(struct pci_bus *bus)
-{
-	struct pci_controller *hose;
-
-	hose = (struct pci_controller *) bus->sysdata;
-	return container_of(hose, struct ar71xx_pci_controller, pci_ctrl);
-}
-
-static int ar71xx_pci_check_error(struct ar71xx_pci_controller *apc, int quiet)
-{
-	void __iomem *base = apc->cfg_base;
-	u32 pci_err;
-	u32 ahb_err;
-
-	pci_err = __raw_readl(base + AR71XX_PCI_REG_PCI_ERR) & 3;
-	if (pci_err) {
-		if (!quiet) {
-			u32 addr;
-
-			addr = __raw_readl(base + AR71XX_PCI_REG_PCI_ERR_ADDR);
-			pr_crit("ar71xx: %s bus error %d at addr 0x%x\n",
-				"PCI", pci_err, addr);
-		}
-
-		/* clear PCI error status */
-		__raw_writel(pci_err, base + AR71XX_PCI_REG_PCI_ERR);
-	}
-
-	ahb_err = __raw_readl(base + AR71XX_PCI_REG_AHB_ERR) & 1;
-	if (ahb_err) {
-		if (!quiet) {
-			u32 addr;
-
-			addr = __raw_readl(base + AR71XX_PCI_REG_AHB_ERR_ADDR);
-			pr_crit("ar71xx: %s bus error %d at addr 0x%x\n",
-				"AHB", ahb_err, addr);
-		}
-
-		/* clear AHB error status */
-		__raw_writel(ahb_err, base + AR71XX_PCI_REG_AHB_ERR);
-	}
-
-	return !!(ahb_err | pci_err);
-}
-
-static inline void ar71xx_pci_local_write(struct ar71xx_pci_controller *apc,
-					  int where, int size, u32 value)
-{
-	void __iomem *base = apc->cfg_base;
-	u32 ad_cbe;
-
-	value = value << (8 * (where & 3));
-
-	ad_cbe = AR71XX_PCI_CRP_CMD_WRITE | (where & ~3);
-	ad_cbe |= ar71xx_pci_get_ble(where, size, 1);
-
-	__raw_writel(ad_cbe, base + AR71XX_PCI_REG_CRP_AD_CBE);
-	__raw_writel(value, base + AR71XX_PCI_REG_CRP_WRDATA);
-}
-
-static inline int ar71xx_pci_set_cfgaddr(struct pci_bus *bus,
-					 unsigned int devfn,
-					 int where, int size, u32 cmd)
-{
-	struct ar71xx_pci_controller *apc = pci_bus_to_ar71xx_controller(bus);
-	void __iomem *base = apc->cfg_base;
-	u32 addr;
-
-	addr = ar71xx_pci_bus_addr(bus, devfn, where);
-
-	__raw_writel(addr, base + AR71XX_PCI_REG_CFG_AD);
-	__raw_writel(cmd | ar71xx_pci_get_ble(where, size, 0),
-		     base + AR71XX_PCI_REG_CFG_CBE);
-
-	return ar71xx_pci_check_error(apc, 1);
-}
-
-static int ar71xx_pci_read_config(struct pci_bus *bus, unsigned int devfn,
-				  int where, int size, u32 *value)
-{
-	struct ar71xx_pci_controller *apc = pci_bus_to_ar71xx_controller(bus);
-	void __iomem *base = apc->cfg_base;
-	u32 data;
-	int err;
-	int ret;
-
-	ret = PCIBIOS_SUCCESSFUL;
-	data = ~0;
-
-	err = ar71xx_pci_set_cfgaddr(bus, devfn, where, size,
-				     AR71XX_PCI_CFG_CMD_READ);
-	if (err)
-		ret = PCIBIOS_DEVICE_NOT_FOUND;
-	else
-		data = __raw_readl(base + AR71XX_PCI_REG_CFG_RDDATA);
-
-	*value = (data >> (8 * (where & 3))) & ar71xx_pci_read_mask[size & 7];
-
-	return ret;
-}
-
-static int ar71xx_pci_write_config(struct pci_bus *bus, unsigned int devfn,
-				   int where, int size, u32 value)
-{
-	struct ar71xx_pci_controller *apc = pci_bus_to_ar71xx_controller(bus);
-	void __iomem *base = apc->cfg_base;
-	int err;
-	int ret;
-
-	value = value << (8 * (where & 3));
-	ret = PCIBIOS_SUCCESSFUL;
-
-	err = ar71xx_pci_set_cfgaddr(bus, devfn, where, size,
-				     AR71XX_PCI_CFG_CMD_WRITE);
-	if (err)
-		ret = PCIBIOS_DEVICE_NOT_FOUND;
-	else
-		__raw_writel(value, base + AR71XX_PCI_REG_CFG_WRDATA);
-
-	return ret;
-}
-
-static struct pci_ops ar71xx_pci_ops = {
-	.read	= ar71xx_pci_read_config,
-	.write	= ar71xx_pci_write_config,
-};
-
-static void ar71xx_pci_irq_handler(struct irq_desc *desc)
-{
-	struct ar71xx_pci_controller *apc;
-	void __iomem *base = ath79_reset_base;
-	u32 pending;
-
-	apc = irq_desc_get_handler_data(desc);
-
-	pending = __raw_readl(base + AR71XX_RESET_REG_PCI_INT_STATUS) &
-		  __raw_readl(base + AR71XX_RESET_REG_PCI_INT_ENABLE);
-
-	if (pending & AR71XX_PCI_INT_DEV0)
-		generic_handle_irq(apc->irq_base + 0);
-
-	else if (pending & AR71XX_PCI_INT_DEV1)
-		generic_handle_irq(apc->irq_base + 1);
-
-	else if (pending & AR71XX_PCI_INT_DEV2)
-		generic_handle_irq(apc->irq_base + 2);
-
-	else if (pending & AR71XX_PCI_INT_CORE)
-		generic_handle_irq(apc->irq_base + 4);
-
-	else
-		spurious_interrupt();
-}
-
-static void ar71xx_pci_irq_unmask(struct irq_data *d)
-{
-	struct ar71xx_pci_controller *apc;
-	unsigned int irq;
-	void __iomem *base = ath79_reset_base;
-	u32 t;
-
-	apc = irq_data_get_irq_chip_data(d);
-	irq = d->irq - apc->irq_base;
-
-	t = __raw_readl(base + AR71XX_RESET_REG_PCI_INT_ENABLE);
-	__raw_writel(t | (1 << irq), base + AR71XX_RESET_REG_PCI_INT_ENABLE);
-
-	/* flush write */
-	__raw_readl(base + AR71XX_RESET_REG_PCI_INT_ENABLE);
-}
-
-static void ar71xx_pci_irq_mask(struct irq_data *d)
-{
-	struct ar71xx_pci_controller *apc;
-	unsigned int irq;
-	void __iomem *base = ath79_reset_base;
-	u32 t;
-
-	apc = irq_data_get_irq_chip_data(d);
-	irq = d->irq - apc->irq_base;
-
-	t = __raw_readl(base + AR71XX_RESET_REG_PCI_INT_ENABLE);
-	__raw_writel(t & ~(1 << irq), base + AR71XX_RESET_REG_PCI_INT_ENABLE);
-
-	/* flush write */
-	__raw_readl(base + AR71XX_RESET_REG_PCI_INT_ENABLE);
-}
-
-static struct irq_chip ar71xx_pci_irq_chip = {
-	.name		= "AR71XX PCI",
-	.irq_mask	= ar71xx_pci_irq_mask,
-	.irq_unmask	= ar71xx_pci_irq_unmask,
-	.irq_mask_ack	= ar71xx_pci_irq_mask,
-};
-
-static void ar71xx_pci_irq_init(struct ar71xx_pci_controller *apc)
-{
-	void __iomem *base = ath79_reset_base;
-	int i;
-
-	__raw_writel(0, base + AR71XX_RESET_REG_PCI_INT_ENABLE);
-	__raw_writel(0, base + AR71XX_RESET_REG_PCI_INT_STATUS);
-
-	BUILD_BUG_ON(ATH79_PCI_IRQ_COUNT < AR71XX_PCI_IRQ_COUNT);
-
-	apc->irq_base = ATH79_PCI_IRQ_BASE;
-	for (i = apc->irq_base;
-	     i < apc->irq_base + AR71XX_PCI_IRQ_COUNT; i++) {
-		irq_set_chip_and_handler(i, &ar71xx_pci_irq_chip,
-					 handle_level_irq);
-		irq_set_chip_data(i, apc);
-	}
-
-	irq_set_chained_handler_and_data(apc->irq, ar71xx_pci_irq_handler,
-					 apc);
-}
-
-static void ar71xx_pci_reset(void)
-{
-	ath79_device_reset_set(AR71XX_RESET_PCI_BUS | AR71XX_RESET_PCI_CORE);
-	mdelay(100);
-
-	ath79_device_reset_clear(AR71XX_RESET_PCI_BUS | AR71XX_RESET_PCI_CORE);
-	mdelay(100);
-
-	ath79_ddr_set_pci_windows();
-	mdelay(100);
-}
-
-static int ar71xx_pci_probe(struct platform_device *pdev)
-{
-	struct ar71xx_pci_controller *apc;
-	struct resource *res;
-	u32 t;
-
-	apc = devm_kzalloc(&pdev->dev, sizeof(struct ar71xx_pci_controller),
-			   GFP_KERNEL);
-	if (!apc)
-		return -ENOMEM;
-
-	apc->cfg_base = devm_platform_ioremap_resource_byname(pdev,
-							      "cfg_base");
-	if (IS_ERR(apc->cfg_base))
-		return PTR_ERR(apc->cfg_base);
-
-	apc->irq = platform_get_irq(pdev, 0);
-	if (apc->irq < 0)
-		return -EINVAL;
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_IO, "io_base");
-	if (!res)
-		return -EINVAL;
-
-	apc->io_res.parent = res;
-	apc->io_res.name = "PCI IO space";
-	apc->io_res.start = res->start;
-	apc->io_res.end = res->end;
-	apc->io_res.flags = IORESOURCE_IO;
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mem_base");
-	if (!res)
-		return -EINVAL;
-
-	apc->mem_res.parent = res;
-	apc->mem_res.name = "PCI memory space";
-	apc->mem_res.start = res->start;
-	apc->mem_res.end = res->end;
-	apc->mem_res.flags = IORESOURCE_MEM;
-
-	ar71xx_pci_reset();
-
-	/* setup COMMAND register */
-	t = PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER | PCI_COMMAND_INVALIDATE
-	  | PCI_COMMAND_PARITY | PCI_COMMAND_SERR | PCI_COMMAND_FAST_BACK;
-	ar71xx_pci_local_write(apc, PCI_COMMAND, 4, t);
-
-	/* clear bus errors */
-	ar71xx_pci_check_error(apc, 1);
-
-	ar71xx_pci_irq_init(apc);
-
-	apc->pci_ctrl.pci_ops = &ar71xx_pci_ops;
-	apc->pci_ctrl.mem_resource = &apc->mem_res;
-	apc->pci_ctrl.io_resource = &apc->io_res;
-
-	register_pci_controller(&apc->pci_ctrl);
-
-	return 0;
-}
-
-static struct platform_driver ar71xx_pci_driver = {
-	.probe = ar71xx_pci_probe,
-	.driver = {
-		.name = "ar71xx-pci",
-	},
-};
-
-static int __init ar71xx_pci_init(void)
-{
-	return platform_driver_register(&ar71xx_pci_driver);
-}
-
-postcore_initcall(ar71xx_pci_init);
diff --git a/arch/mips/pci/pci-ar724x.c b/arch/mips/pci/pci-ar724x.c
deleted file mode 100644
index 807558b251ef..000000000000
--- a/arch/mips/pci/pci-ar724x.c
+++ /dev/null
@@ -1,447 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *  Atheros AR724X PCI host controller driver
- *
- *  Copyright (C) 2011 René Bolldorf <xsecute@googlemail.com>
- *  Copyright (C) 2009-2011 Gabor Juhos <juhosg@openwrt.org>
- */
-
-#include <linux/irq.h>
-#include <linux/pci.h>
-#include <linux/init.h>
-#include <linux/delay.h>
-#include <linux/platform_device.h>
-#include <asm/mach-ath79/ath79.h>
-#include <asm/mach-ath79/ar71xx_regs.h>
-
-#define AR724X_PCI_REG_APP		0x00
-#define AR724X_PCI_REG_RESET		0x18
-#define AR724X_PCI_REG_INT_STATUS	0x4c
-#define AR724X_PCI_REG_INT_MASK		0x50
-
-#define AR724X_PCI_APP_LTSSM_ENABLE	BIT(0)
-
-#define AR724X_PCI_RESET_LINK_UP	BIT(0)
-
-#define AR724X_PCI_INT_DEV0		BIT(14)
-
-#define AR724X_PCI_IRQ_COUNT		1
-
-#define AR7240_BAR0_WAR_VALUE	0xffff
-
-#define AR724X_PCI_CMD_INIT	(PCI_COMMAND_MEMORY |		\
-				 PCI_COMMAND_MASTER |		\
-				 PCI_COMMAND_INVALIDATE |	\
-				 PCI_COMMAND_PARITY |		\
-				 PCI_COMMAND_SERR |		\
-				 PCI_COMMAND_FAST_BACK)
-
-struct ar724x_pci_controller {
-	void __iomem *devcfg_base;
-	void __iomem *ctrl_base;
-	void __iomem *crp_base;
-
-	int irq;
-	int irq_base;
-
-	bool link_up;
-	bool bar0_is_cached;
-	u32  bar0_value;
-
-	struct pci_controller pci_controller;
-	struct resource io_res;
-	struct resource mem_res;
-};
-
-static inline bool ar724x_pci_check_link(struct ar724x_pci_controller *apc)
-{
-	u32 reset;
-
-	reset = __raw_readl(apc->ctrl_base + AR724X_PCI_REG_RESET);
-	return reset & AR724X_PCI_RESET_LINK_UP;
-}
-
-static inline struct ar724x_pci_controller *
-pci_bus_to_ar724x_controller(struct pci_bus *bus)
-{
-	struct pci_controller *hose;
-
-	hose = (struct pci_controller *) bus->sysdata;
-	return container_of(hose, struct ar724x_pci_controller, pci_controller);
-}
-
-static int ar724x_pci_local_write(struct ar724x_pci_controller *apc,
-				  int where, int size, u32 value)
-{
-	void __iomem *base;
-	u32 data;
-	int s;
-
-	WARN_ON(where & (size - 1));
-
-	if (!apc->link_up)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	base = apc->crp_base;
-	data = __raw_readl(base + (where & ~3));
-
-	switch (size) {
-	case 1:
-		s = ((where & 3) * 8);
-		data &= ~(0xff << s);
-		data |= ((value & 0xff) << s);
-		break;
-	case 2:
-		s = ((where & 2) * 8);
-		data &= ~(0xffff << s);
-		data |= ((value & 0xffff) << s);
-		break;
-	case 4:
-		data = value;
-		break;
-	default:
-		return PCIBIOS_BAD_REGISTER_NUMBER;
-	}
-
-	__raw_writel(data, base + (where & ~3));
-	/* flush write */
-	__raw_readl(base + (where & ~3));
-
-	return PCIBIOS_SUCCESSFUL;
-}
-
-static int ar724x_pci_read(struct pci_bus *bus, unsigned int devfn, int where,
-			    int size, uint32_t *value)
-{
-	struct ar724x_pci_controller *apc;
-	void __iomem *base;
-	u32 data;
-
-	apc = pci_bus_to_ar724x_controller(bus);
-	if (!apc->link_up)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	if (devfn)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	base = apc->devcfg_base;
-	data = __raw_readl(base + (where & ~3));
-
-	switch (size) {
-	case 1:
-		if (where & 1)
-			data >>= 8;
-		if (where & 2)
-			data >>= 16;
-		data &= 0xff;
-		break;
-	case 2:
-		if (where & 2)
-			data >>= 16;
-		data &= 0xffff;
-		break;
-	case 4:
-		break;
-	default:
-		return PCIBIOS_BAD_REGISTER_NUMBER;
-	}
-
-	if (where == PCI_BASE_ADDRESS_0 && size == 4 &&
-	    apc->bar0_is_cached) {
-		/* use the cached value */
-		*value = apc->bar0_value;
-	} else {
-		*value = data;
-	}
-
-	return PCIBIOS_SUCCESSFUL;
-}
-
-static int ar724x_pci_write(struct pci_bus *bus, unsigned int devfn, int where,
-			     int size, uint32_t value)
-{
-	struct ar724x_pci_controller *apc;
-	void __iomem *base;
-	u32 data;
-	int s;
-
-	apc = pci_bus_to_ar724x_controller(bus);
-	if (!apc->link_up)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	if (devfn)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	if (soc_is_ar7240() && where == PCI_BASE_ADDRESS_0 && size == 4) {
-		if (value != 0xffffffff) {
-			/*
-			 * WAR for a hw issue. If the BAR0 register of the
-			 * device is set to the proper base address, the
-			 * memory space of the device is not accessible.
-			 *
-			 * Cache the intended value so it can be read back,
-			 * and write a SoC specific constant value to the
-			 * BAR0 register in order to make the device memory
-			 * accessible.
-			 */
-			apc->bar0_is_cached = true;
-			apc->bar0_value = value;
-
-			value = AR7240_BAR0_WAR_VALUE;
-		} else {
-			apc->bar0_is_cached = false;
-		}
-	}
-
-	base = apc->devcfg_base;
-	data = __raw_readl(base + (where & ~3));
-
-	switch (size) {
-	case 1:
-		s = ((where & 3) * 8);
-		data &= ~(0xff << s);
-		data |= ((value & 0xff) << s);
-		break;
-	case 2:
-		s = ((where & 2) * 8);
-		data &= ~(0xffff << s);
-		data |= ((value & 0xffff) << s);
-		break;
-	case 4:
-		data = value;
-		break;
-	default:
-		return PCIBIOS_BAD_REGISTER_NUMBER;
-	}
-
-	__raw_writel(data, base + (where & ~3));
-	/* flush write */
-	__raw_readl(base + (where & ~3));
-
-	return PCIBIOS_SUCCESSFUL;
-}
-
-static struct pci_ops ar724x_pci_ops = {
-	.read	= ar724x_pci_read,
-	.write	= ar724x_pci_write,
-};
-
-static void ar724x_pci_irq_handler(struct irq_desc *desc)
-{
-	struct ar724x_pci_controller *apc;
-	void __iomem *base;
-	u32 pending;
-
-	apc = irq_desc_get_handler_data(desc);
-	base = apc->ctrl_base;
-
-	pending = __raw_readl(base + AR724X_PCI_REG_INT_STATUS) &
-		  __raw_readl(base + AR724X_PCI_REG_INT_MASK);
-
-	if (pending & AR724X_PCI_INT_DEV0)
-		generic_handle_irq(apc->irq_base + 0);
-
-	else
-		spurious_interrupt();
-}
-
-static void ar724x_pci_irq_unmask(struct irq_data *d)
-{
-	struct ar724x_pci_controller *apc;
-	void __iomem *base;
-	int offset;
-	u32 t;
-
-	apc = irq_data_get_irq_chip_data(d);
-	base = apc->ctrl_base;
-	offset = apc->irq_base - d->irq;
-
-	switch (offset) {
-	case 0:
-		t = __raw_readl(base + AR724X_PCI_REG_INT_MASK);
-		__raw_writel(t | AR724X_PCI_INT_DEV0,
-			     base + AR724X_PCI_REG_INT_MASK);
-		/* flush write */
-		__raw_readl(base + AR724X_PCI_REG_INT_MASK);
-	}
-}
-
-static void ar724x_pci_irq_mask(struct irq_data *d)
-{
-	struct ar724x_pci_controller *apc;
-	void __iomem *base;
-	int offset;
-	u32 t;
-
-	apc = irq_data_get_irq_chip_data(d);
-	base = apc->ctrl_base;
-	offset = apc->irq_base - d->irq;
-
-	switch (offset) {
-	case 0:
-		t = __raw_readl(base + AR724X_PCI_REG_INT_MASK);
-		__raw_writel(t & ~AR724X_PCI_INT_DEV0,
-			     base + AR724X_PCI_REG_INT_MASK);
-
-		/* flush write */
-		__raw_readl(base + AR724X_PCI_REG_INT_MASK);
-
-		t = __raw_readl(base + AR724X_PCI_REG_INT_STATUS);
-		__raw_writel(t | AR724X_PCI_INT_DEV0,
-			     base + AR724X_PCI_REG_INT_STATUS);
-
-		/* flush write */
-		__raw_readl(base + AR724X_PCI_REG_INT_STATUS);
-	}
-}
-
-static struct irq_chip ar724x_pci_irq_chip = {
-	.name		= "AR724X PCI ",
-	.irq_mask	= ar724x_pci_irq_mask,
-	.irq_unmask	= ar724x_pci_irq_unmask,
-	.irq_mask_ack	= ar724x_pci_irq_mask,
-};
-
-static void ar724x_pci_irq_init(struct ar724x_pci_controller *apc,
-				int id)
-{
-	void __iomem *base;
-	int i;
-
-	base = apc->ctrl_base;
-
-	__raw_writel(0, base + AR724X_PCI_REG_INT_MASK);
-	__raw_writel(0, base + AR724X_PCI_REG_INT_STATUS);
-
-	apc->irq_base = ATH79_PCI_IRQ_BASE + (id * AR724X_PCI_IRQ_COUNT);
-
-	for (i = apc->irq_base;
-	     i < apc->irq_base + AR724X_PCI_IRQ_COUNT; i++) {
-		irq_set_chip_and_handler(i, &ar724x_pci_irq_chip,
-					 handle_level_irq);
-		irq_set_chip_data(i, apc);
-	}
-
-	irq_set_chained_handler_and_data(apc->irq, ar724x_pci_irq_handler,
-					 apc);
-}
-
-static void ar724x_pci_hw_init(struct ar724x_pci_controller *apc)
-{
-	u32 ppl, app;
-	int wait = 0;
-
-	/* deassert PCIe host controller and PCIe PHY reset */
-	ath79_device_reset_clear(AR724X_RESET_PCIE);
-	ath79_device_reset_clear(AR724X_RESET_PCIE_PHY);
-
-	/* remove the reset of the PCIE PLL */
-	ppl = ath79_pll_rr(AR724X_PLL_REG_PCIE_CONFIG);
-	ppl &= ~AR724X_PLL_REG_PCIE_CONFIG_PPL_RESET;
-	ath79_pll_wr(AR724X_PLL_REG_PCIE_CONFIG, ppl);
-
-	/* deassert bypass for the PCIE PLL */
-	ppl = ath79_pll_rr(AR724X_PLL_REG_PCIE_CONFIG);
-	ppl &= ~AR724X_PLL_REG_PCIE_CONFIG_PPL_BYPASS;
-	ath79_pll_wr(AR724X_PLL_REG_PCIE_CONFIG, ppl);
-
-	/* set PCIE Application Control to ready */
-	app = __raw_readl(apc->ctrl_base + AR724X_PCI_REG_APP);
-	app |= AR724X_PCI_APP_LTSSM_ENABLE;
-	__raw_writel(app, apc->ctrl_base + AR724X_PCI_REG_APP);
-
-	/* wait up to 100ms for PHY link up */
-	do {
-		mdelay(10);
-		wait++;
-	} while (wait < 10 && !ar724x_pci_check_link(apc));
-}
-
-static int ar724x_pci_probe(struct platform_device *pdev)
-{
-	struct ar724x_pci_controller *apc;
-	struct resource *res;
-	int id;
-
-	id = pdev->id;
-	if (id == -1)
-		id = 0;
-
-	apc = devm_kzalloc(&pdev->dev, sizeof(struct ar724x_pci_controller),
-			    GFP_KERNEL);
-	if (!apc)
-		return -ENOMEM;
-
-	apc->ctrl_base = devm_platform_ioremap_resource_byname(pdev, "ctrl_base");
-	if (IS_ERR(apc->ctrl_base))
-		return PTR_ERR(apc->ctrl_base);
-
-	apc->devcfg_base = devm_platform_ioremap_resource_byname(pdev, "cfg_base");
-	if (IS_ERR(apc->devcfg_base))
-		return PTR_ERR(apc->devcfg_base);
-
-	apc->crp_base = devm_platform_ioremap_resource_byname(pdev, "crp_base");
-	if (IS_ERR(apc->crp_base))
-		return PTR_ERR(apc->crp_base);
-
-	apc->irq = platform_get_irq(pdev, 0);
-	if (apc->irq < 0)
-		return -EINVAL;
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_IO, "io_base");
-	if (!res)
-		return -EINVAL;
-
-	apc->io_res.parent = res;
-	apc->io_res.name = "PCI IO space";
-	apc->io_res.start = res->start;
-	apc->io_res.end = res->end;
-	apc->io_res.flags = IORESOURCE_IO;
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mem_base");
-	if (!res)
-		return -EINVAL;
-
-	apc->mem_res.parent = res;
-	apc->mem_res.name = "PCI memory space";
-	apc->mem_res.start = res->start;
-	apc->mem_res.end = res->end;
-	apc->mem_res.flags = IORESOURCE_MEM;
-
-	apc->pci_controller.pci_ops = &ar724x_pci_ops;
-	apc->pci_controller.io_resource = &apc->io_res;
-	apc->pci_controller.mem_resource = &apc->mem_res;
-
-	/*
-	 * Do the full PCIE Root Complex Initialization Sequence if the PCIe
-	 * host controller is in reset.
-	 */
-	if (ath79_reset_rr(AR724X_RESET_REG_RESET_MODULE) & AR724X_RESET_PCIE)
-		ar724x_pci_hw_init(apc);
-
-	apc->link_up = ar724x_pci_check_link(apc);
-	if (!apc->link_up)
-		dev_warn(&pdev->dev, "PCIe link is down\n");
-
-	ar724x_pci_irq_init(apc, id);
-
-	ar724x_pci_local_write(apc, PCI_COMMAND, 4, AR724X_PCI_CMD_INIT);
-
-	register_pci_controller(&apc->pci_controller);
-
-	return 0;
-}
-
-static struct platform_driver ar724x_pci_driver = {
-	.probe = ar724x_pci_probe,
-	.driver = {
-		.name = "ar724x-pci",
-	},
-};
-
-static int __init ar724x_pci_init(void)
-{
-	return platform_driver_register(&ar724x_pci_driver);
-}
-
-postcore_initcall(ar724x_pci_init);
-- 
2.54.0


