Return-Path: <linux-mips+bounces-12125-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B13C405ED
	for <lists+linux-mips@lfdr.de>; Fri, 07 Nov 2025 15:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5EBFD4F67D3
	for <lists+linux-mips@lfdr.de>; Fri,  7 Nov 2025 14:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E4B432AAD9;
	Fri,  7 Nov 2025 14:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="EJZH3Bye"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2A7328B6F;
	Fri,  7 Nov 2025 14:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762525735; cv=none; b=pMz+jtoKKGcwUnBqB017KC0JgqKvejhiiX85mTdk8Rw+tc1sI39NaOYzrCSOrIjE8gkUQTlu4OAS1jGpQgMxUYVrRF1KNW+qrXJC4kwFeacRF2OzpVhkkiNnG80d7Ek/L1yYOPzAwKBHxN/XypzfGlreK27HhDaQwb38Clc6Jcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762525735; c=relaxed/simple;
	bh=mAwB1ns9qqDfhDKCjlYLdtCDT3F6WNxnDRawL1pjAYM=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=QMk6+cb9okjpz/l+9Cca+/r2V3toOpXoFfqE53kZvtix5O/rL3c/2y/ILJdjN1L5WgTlErtL42tBX4MmB2ZqamktmTupTgjgK8M2kLQYFtShSbYu0nZm/BlJDpU5LCz1++duZJ4VpSsEV7K3MlUnc+VT4lYkOcczJxsO3gZh/ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=EJZH3Bye; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PwITHwAI/J9ZpXlfoMfJNvhc0rvVT0WYEUmL2ZbIp+U=; b=EJZH3Bye9TzCh+jaoOH6sMg5Zz
	rHB9FL8lYNTJvpcwUmi+BVqrpY2XGnwcqbFWigEwgi/ZZSx/q5lC0xYVCO7UaZdGm14iXtQZn2JM+
	OMKqbSmOU+APa9Cmox2UZLcE93naBbkTdRinyyQUdyiv/04RmNdHlOu0eS/+r3bdB9PIZQ7zXhQVQ
	DtC+FS2AODLa0GXzbN5g8qFNoprHwrTSikyQs6O6Ufzpftm2TLMrwtyWDEbNZxcsvYY4xitLpWXFo
	PdSn3ViPQ3OH2uvnJoGEsUsL4N47cQhVx3tyAveEbkZdeSPh9y1dK1tI1mnEBcJYhNDWAFDHk+lge
	dZRWOWaw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37104 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vHNS8-000000006gu-3A6S;
	Fri, 07 Nov 2025 14:28:36 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vHNS6-0000000DkSV-39Ff;
	Fri, 07 Nov 2025 14:28:34 +0000
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
Subject: [PATCH net-next 07/16] net: stmmac: meson8b: use PHY_INTF_SEL_xxx
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vHNS6-0000000DkSV-39Ff@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Fri, 07 Nov 2025 14:28:34 +0000

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index a50782994b97..f485b9b858bf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -26,8 +26,8 @@
 #define PRG_ETH0_RGMII_MODE		BIT(0)
 
 #define PRG_ETH0_EXT_PHY_MODE_MASK	GENMASK(2, 0)
-#define PRG_ETH0_EXT_RGMII_MODE		1
-#define PRG_ETH0_EXT_RMII_MODE		4
+#define PRG_ETH0_EXT_RGMII_MODE		PHY_INTF_SEL_RGMII
+#define PRG_ETH0_EXT_RMII_MODE		PHY_INTF_SEL_RMII
 
 /* mux to choose between fclk_div2 (bit unset) and mpll2 (bit set) */
 #define PRG_ETH0_CLK_M250_SEL_MASK	GENMASK(4, 4)
-- 
2.47.3


