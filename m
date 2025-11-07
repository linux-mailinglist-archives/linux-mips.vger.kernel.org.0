Return-Path: <linux-mips+bounces-12130-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 994B9C405C6
	for <lists+linux-mips@lfdr.de>; Fri, 07 Nov 2025 15:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 480A7189BCE3
	for <lists+linux-mips@lfdr.de>; Fri,  7 Nov 2025 14:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D137932AAC6;
	Fri,  7 Nov 2025 14:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="mUh+PqO/"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234DE32AAA6;
	Fri,  7 Nov 2025 14:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762525763; cv=none; b=qlDxcc1GGaDgcfB0L5JLIeap1KRwLjOT40ecmDKNn7UO0tVkXcEEE17MPjeYZR86fWFmdJYVzbuKgWlFhCIX3jhu8S06bBVjVWtnin66/ToFUjvRIq6qxgG1KLapjaGE167FsfcpwUw6yrkVPBG0NzblbvUmYKa9ulrpQYnLxxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762525763; c=relaxed/simple;
	bh=JqjnfKDgDHq4xuF42pw13rGt2sQ3HARkK+mwbuvbDEo=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=EqJ4jgFSHXHpzOEsu1HKNjxyzl9v9kYbqD/Ww2TvctcliNpHKp4ERQKd77Xr2o8493hCK6Svr87h7TMflgS5tY/k5PGpH07qVorBm9bo0VvnMmsDARKtvdtkrs9JZdX5+UKOWtbWuDcv8ZGkOKjSN1JlhHsCvwTHBAEOO18FPOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=mUh+PqO/; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UNUNVWueIqfGuC4q5BrFUll2X9rFfz6vDMrrsI3WK28=; b=mUh+PqO/42Lq4W0yI56eLnB7Cc
	qQYVjtem/VcvMPqciPOVyqDQeM0f72dRfNFFiT/vOuMxfw1KKtIEDw5sAsPJqVkM7W9h8TivB/v7L
	YSwZwRCmWvWaLv4A0PSth2CHtY8JXln8CGDrdsjMvMrZyXo8Z5cxZa1A/ybwuQkHVEKMSPZLegXYX
	fGUpGRuuVKT9e9x/8bhwAevOxpCeokZa/Ltk68/E3q/Wce5caGe7xvdgMTSd05g9xMabuPRVF5ZFl
	RaG28mPSMlvs+ec6RepJ3uK+EaqmsIOgerdyeUZocWTZMEIipqgSBgwIEIC+HguWC1b00SO0JFUVL
	InW0hLAw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47696 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vHNSa-000000006ik-3X6d;
	Fri, 07 Nov 2025 14:29:05 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vHNSW-0000000DkSz-1TB4;
	Fri, 07 Nov 2025 14:29:00 +0000
In-Reply-To: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 12/16] net: stmmac: stm32: use PHY_INTF_SEL_x to
 select PHY interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vHNSW-0000000DkSz-1TB4@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Fri, 07 Nov 2025 14:29:00 +0000

Convert dwmac-stm32 to use the PHY_INTF_SEL_x definitions.

For stm32mp1, the original definitions used constant 0 (GMII, 0 << 21),
BIT(21) (RGMII, 1 << 21) and BIT(23) (RMII, 4 << 21) to define these,
but from the values it can be clearly seen that these are the
PHY_INTF_SEL_x inputs to the dwmac.

For stm32mp2, the original definitions cover a bitfield 6:4 in the
SYSCFG Ethernet1 control register (according to documentation) and use
the PHY_INTF_SEL_x values.

Use the common dwmac definitions for the PHY interface selection field
by adding the bitfield mask, and using FIELD_PREP() for the bitfield
values.

This removes this incorrect use of BIT().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 20 +++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index 6c179911ef3f..1545772419d5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -47,9 +47,13 @@
  *------------------------------------------
  */
 #define SYSCFG_PMCR_ETH_SEL_MII		BIT(20)
-#define SYSCFG_PMCR_ETH_SEL_RGMII	BIT(21)
-#define SYSCFG_PMCR_ETH_SEL_RMII	BIT(23)
-#define SYSCFG_PMCR_ETH_SEL_GMII	0
+#define SYSCFG_PMCR_PHY_INTF_SEL_MASK	GENMASK(23, 21)
+#define SYSCFG_PMCR_ETH_SEL_RGMII	\
+	FIELD_PREP(SYSCFG_PMCR_PHY_INTF_SEL_MASK, PHY_INTF_SEL_RGMII)
+#define SYSCFG_PMCR_ETH_SEL_RMII	\
+	FIELD_PREP(SYSCFG_PMCR_PHY_INTF_SEL_MASK, PHY_INTF_SEL_RMII)
+#define SYSCFG_PMCR_ETH_SEL_GMII	\
+	FIELD_PREP(SYSCFG_PMCR_PHY_INTF_SEL_MASK, PHY_INTF_SEL_GMII_MII)
 #define SYSCFG_MCU_ETH_SEL_MII		0
 #define SYSCFG_MCU_ETH_SEL_RMII		1
 
@@ -60,9 +64,13 @@
 #define SYSCFG_ETHCR_ETH_CLK_SEL	BIT(1)
 #define SYSCFG_ETHCR_ETH_REF_CLK_SEL	BIT(0)
 
-#define SYSCFG_ETHCR_ETH_SEL_MII	0
-#define SYSCFG_ETHCR_ETH_SEL_RGMII	BIT(4)
-#define SYSCFG_ETHCR_ETH_SEL_RMII	BIT(6)
+#define SYSCFG_ETHCR_ETH_SEL_MASK	GENMASK(6, 4)
+#define SYSCFG_ETHCR_ETH_SEL_MII	FIELD_PREP(SYSCFG_ETHCR_ETH_SEL_MASK, \
+						   PHY_INTF_SEL_GMII_MII)
+#define SYSCFG_ETHCR_ETH_SEL_RGMII	FIELD_PREP(SYSCFG_ETHCR_ETH_SEL_MASK, \
+						   PHY_INTF_SEL_RGMII)
+#define SYSCFG_ETHCR_ETH_SEL_RMII	FIELD_PREP(SYSCFG_ETHCR_ETH_SEL_MASK, \
+						   PHY_INTF_SEL_RMII)
 
 /* STM32MPx register definitions
  *
-- 
2.47.3


