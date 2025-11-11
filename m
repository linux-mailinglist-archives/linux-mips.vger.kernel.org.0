Return-Path: <linux-mips+bounces-12189-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F49C4C5A3
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 09:20:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEF733A4DFB
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 08:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A139A3016E7;
	Tue, 11 Nov 2025 08:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="lc+6AEWn"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C012EC54A;
	Tue, 11 Nov 2025 08:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762848779; cv=none; b=XIG1F5v9/+/FNrAzS/3XJsUmZ0q8qkCf0auizBszsoGRSEUtQbmpu3Isw+CvBu4a+dUA3dCqYbdNWgksO5iIzIfe9AG7qCzr+yh9FhztgCFFbJUmNQqEOAXo2qUCooqHLCoiun0FRYOs/sPwUGDOaWhrN7oJ/6tOW9Aj2nlQJfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762848779; c=relaxed/simple;
	bh=U5tT8RqlZdQ3hHWGtAdqTjrgibZo1a3MpY82fV70xKE=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=F45woKUqIAAmc/juSrocfTiHt6vx8L+g6Z6FjTIDBL9VevEGKcYNisqhkLwC3IfG5z1qkXOwGHDTs/rpXWWsPbjjuO+VApQNOmdLM+nyC0W4q1awwV/SbBgDAMFM5aTllm6IDWnzyNrrQY8Ng0g5iZBkmVbcaB5u4u64znDizds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=lc+6AEWn; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6tHEJW/uohGXrC6WjLOnZ8INtuIGiGHzzYLj1JRrzuw=; b=lc+6AEWnYSukl3ln04NyyqoPuQ
	TV8lXIR0sbIFJcEhfgt+03eTpCog8aBCYj9piDG1ZjyR6HX6UhEmhCqhZE+lfEW0EIL4A7Zxf+WfU
	EwHk7blQOm1hQ0doXr4I9oJB9QDhgBjLOyYJljv0QWFxGGdKTmecC7WtB2IrdMnky4tB4ZPn9VLZr
	1lNy9eBs/yY9rKi7s6rJ9dRGYP3inwPmd792QFPc/Ow6b7OnRO5qTrQjUwpw0GASm0DZJcOnjtbKB
	dNpD5uOnvSwmx36lJy5A7ULzZUqw+fYqPVrMrvjAoQYhAnextQ3NF0in4RR6zKlhI98o95xvqR45x
	tvQgkC4A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57350 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vIjUc-000000002DA-17lS;
	Tue, 11 Nov 2025 08:12:46 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vIjUZ-0000000Dqu5-2sDI;
	Tue, 11 Nov 2025 08:12:43 +0000
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
Subject: [PATCH net-next v2 12/13] net: stmmac: visconti: use PHY_INTF_SEL_x
 to select PHY interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vIjUZ-0000000Dqu5-2sDI@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 11 Nov 2025 08:12:43 +0000

Convert dwmac-visconti to use the PHY_INTF_SEL_x definitions. The
original definitions used constant 0, BIT(0) (==1) and BIT(2) (==4)
to define these, but the values of the bits corresponds with the
PHY_INTF_SEL_x values, so it is highly likely that these are not
individual bits, but the PHY_INTF_SEL_x bitfield.

This removes this incorrect use of BIT().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
index bd65d4239054..7b6b048e1be0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
@@ -42,9 +42,9 @@
 
 #define ETHER_CLK_SEL_RX_TX_CLK_EN (ETHER_CLK_SEL_RX_CLK_EN | ETHER_CLK_SEL_TX_CLK_EN)
 
-#define ETHER_CONFIG_INTF_MII 0
-#define ETHER_CONFIG_INTF_RGMII BIT(0)
-#define ETHER_CONFIG_INTF_RMII BIT(2)
+#define ETHER_CONFIG_INTF_MII	PHY_INTF_SEL_GMII_MII
+#define ETHER_CONFIG_INTF_RGMII	PHY_INTF_SEL_RGMII
+#define ETHER_CONFIG_INTF_RMII	PHY_INTF_SEL_RMII
 
 struct visconti_eth {
 	void __iomem *reg;
-- 
2.47.3


