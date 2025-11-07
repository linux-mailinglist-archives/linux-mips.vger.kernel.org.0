Return-Path: <linux-mips+bounces-12118-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D1EC4057E
	for <lists+linux-mips@lfdr.de>; Fri, 07 Nov 2025 15:28:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 42D5B34F639
	for <lists+linux-mips@lfdr.de>; Fri,  7 Nov 2025 14:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35139329366;
	Fri,  7 Nov 2025 14:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="Sv2JOcAS"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C1F328B6D;
	Fri,  7 Nov 2025 14:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762525666; cv=none; b=JNz5sEd3vlm8+KsuWeOWeQ9kY6RHDaUt2iic1uTeA/Px7ytdqqUVgMLrEq+CD9RAaOPWJu5eMmmusGHhVh9J3cOVxertoa2L/RNw7IJtPTyZLB/RWhjgoBm/hBg54S722fG96/WtbX+NLYBdZ2fzu4kMTmvBM54FHbNV4rOT9r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762525666; c=relaxed/simple;
	bh=C7RTs0UfOLfvRiHfWw28KPclbZbgfhVx/x07DT7oMMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YJsckK3QEjT4itZzOJ3dKzKPPyHh+Ygx33sWROKq2A1fBicNSQAoBdoYyrP55rN70ASoepNbtdUJkx7OeTCTAWXaUrcLTdYcvvr/eAVgZ18cxcf2ACHeh7MW7M7K/GPbxqigb86Z5OLusv4kaOV3wNkz1Zad3bV32Tk4PHmcGxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=Sv2JOcAS; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8Ih8W61/2igKq+jp/SUxQHmllcTXqE/WlAIvDUyh2EU=; b=Sv2JOcASNdoVjoCSMJAI1x806j
	BVVEdQJEpYIfEsWwJHQIeQIDdFjDQM9jtB72wRYVxzUkOkahUCltipp6IKZctSffgWUeGACG/jAVQ
	0m5Lu+6djvKgPEVmWx7HCRViE1p83152mFDp/CRBj7qXZeOZ87WyLg7KOWfANxGnAxUzfLfhV17p1
	kYnTMee7NGFexO57WRopGMM0q+GHIRbDl8shLQVWW5KYCEiHR5gFD7gWdHId6la8Kwfbbthr9r8Uq
	p+E2FO24+ckTNfzRLUESN1NJrivmwe8IhFWOQwC/cYgL+i7xxCevwFmdXxJnEUoiB+OZUR2wUFJju
	e9KG134g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57930)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vHNR4-000000006eH-3lYr;
	Fri, 07 Nov 2025 14:27:30 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vHNQu-000000007ef-41bA;
	Fri, 07 Nov 2025 14:27:20 +0000
Date: Fri, 7 Nov 2025 14:27:20 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
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
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 00/16] net: stmmac: convert glue drivers to use
 stmmac_get_phy_intf_sel()
Message-ID: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

This series converts the remaining glue drivers that support
multi-interface to use stmmac_get_phy_intf_sel(). The reason these
drivers are not converted to the set_phy_intf_sel() method is
because it is unclear whether there are ordering dependencies that
would prevent it.

For example, reading the stm32mp2 documentation, it is required to
set the ETH1_SEL field while the dwmac core is in reset and before
clocks are enabled. This requirement can not be satsified at the
moment (but could with further changes.)

 .../net/ethernet/stmicro/stmmac/dwmac-loongson1.c  | 18 ++---
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   | 77 ++++++++--------------
 .../net/ethernet/stmicro/stmmac/dwmac-meson8b.c    | 30 +++------
 .../net/ethernet/stmicro/stmmac/dwmac-starfive.c   | 26 +++-----
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c  | 44 +++++++------
 .../net/ethernet/stmicro/stmmac/dwmac-visconti.c   | 26 ++------
 6 files changed, 82 insertions(+), 139 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

