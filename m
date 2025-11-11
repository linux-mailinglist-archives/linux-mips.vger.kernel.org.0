Return-Path: <linux-mips+bounces-12187-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B4299C4C577
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 09:19:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F23574F90B0
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 08:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B4D2F7ADA;
	Tue, 11 Nov 2025 08:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="D2ueYuFF"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DAB1DFE12;
	Tue, 11 Nov 2025 08:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762848768; cv=none; b=p7y3dZ87H2yRUtOxpFyeLHmJ1D8uGAk1hEjFrTiciHzqAaFraKI4esAYUeccAqhy2DwqrLSfqmypllH+VMJ/APjGCE0scW0/za3TiOhFc4eHIolO9AyBgKXRSM7lVZghI8V6ehKkehoNm/1JUHEs2cCS4Wm0zbAMdSUnySKOrRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762848768; c=relaxed/simple;
	bh=JqjnfKDgDHq4xuF42pw13rGt2sQ3HARkK+mwbuvbDEo=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=ozhtlLRK6HzfL6MTA+SF+Px1Qs6R70pyYSYaypfWFuxrQFeC7SXTGx3wEAMAPW5Nbzal25ehUYaMRxbw67KEvKH6KjwoHp6WuCslWPo1ILuPVddhRZ63PdkQ1VoyAUa3/Iwj1E45y3UOwgQZtK4g7PnMjWB/BxGW84EHMhG2BFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=D2ueYuFF; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UNUNVWueIqfGuC4q5BrFUll2X9rFfz6vDMrrsI3WK28=; b=D2ueYuFF5SKkwVVuG1ga4EosQ1
	6EOOO3u+JYrBZqJ7CvGeGaTUBB5g4UlR0JvzmxucLjeHI8LIU6+2Og/w+v9bC76/q5d2ES5c5i9xO
	9py7DA4ddKkST+/xe9peRiNsjmMb/31CQF5Usn++QmOaY5NWfd2B07BiqrDjKdsQrKmvVbpsU62cz
	5PTUSfaf9+Y+Je+OuT+hIdwZEIjXo4QEUENAzHyIh5FGemyV9FOSWRhAaC+quhtMzKmuXNw1RiMHl
	K2V7dlm7fW/LX+EAczA7xyu+129AKm5zUtH74d8LmVvDyfcUTvC9PBtrdd4YJCJXJl72oBAKpwwsw
	XMfggluA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50410 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vIjUM-000000002CB-3Vmz;
	Tue, 11 Nov 2025 08:12:31 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vIjUK-0000000Dqtn-1AyK;
	Tue, 11 Nov 2025 08:12:28 +0000
In-Reply-To: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
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
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	netdev@vger.kernel.org,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 09/13] net: stmmac: stm32: use PHY_INTF_SEL_x to
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
Message-Id: <E1vIjUK-0000000Dqtn-1AyK@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 11 Nov 2025 08:12:28 +0000

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


