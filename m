Return-Path: <linux-mips+bounces-12283-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C31A1C6DE83
	for <lists+linux-mips@lfdr.de>; Wed, 19 Nov 2025 11:12:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id A7B7B2EEE5
	for <lists+linux-mips@lfdr.de>; Wed, 19 Nov 2025 10:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB3363370EC;
	Wed, 19 Nov 2025 10:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="kpFo9qM7"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE3B32A3C8;
	Wed, 19 Nov 2025 10:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763546627; cv=none; b=k7s+ISUnY1dSJivN7umwnws6CABoNt+sg4wF2+ks8Q7ArFNhLD2LWxpgi93vC+Uj7W/Radm3cS62SYo5ngWms1MwM2Ehe0z9S08J+5icrk7naUJAfg77P4iJbPUfpiJ53glaG2pyxx/duZRxhDxYJz1Nr3JGS15Uu/3HI2oiqlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763546627; c=relaxed/simple;
	bh=h9QjrqcAykY5VUto6sGBKZPUvaRZiFnE4qVIX1eiuGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rYhShZvmV2zMEtCVey/ICNaK4QGJciRD9NTnVYtZHa+OTqk5C2Am4fMpf9eXeBPu5z7brnB/dK66Ltl1CwvANJbVem37NtV0h5Jr4AWl7NA3wx6zmBh1E7VjbLuvgdUzQ3ljvlL1aVCi6vD0EKty0Ubo5n/lWnrsVkvjAg9v7Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=kpFo9qM7; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Y+sgIiXuLSX8878BXnZdAURbfpZ/7Ejmg1bqP8JP5ck=; b=kpFo9qM7iuPsdM+zYOjqS02txO
	4M7kLehtYNmXBJfY73fpDpk3On1guAxfTdG3f4/+cB+hDWj4idMIug9TUrx8eqs7yy0IupTxLV2qG
	D6959asz+TtdSGQiUzwGyJ4MlKUAo0S3goHu9FNs4pswpYkWgv/PECttzzMI6yzoyzHSjhKtgy2zE
	u2QeQIJ7CmdDzj1QOIkaOS0RvSIGGF22MtkkLBSY9+bfqK+zczx8GFugnk1THmhmI88MPrFpWROJ9
	lhZ220fN1y6GKdujBRN0FEIb8nFjbSX2LL3amzluVFeyhPXQB6rGX5QLGe0v3wHRI9GytQ6/g7Ouc
	+KwYFJeg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52384)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vLf1k-000000004QW-32gK;
	Wed, 19 Nov 2025 10:03:04 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vLf1d-000000003Ji-0q5P;
	Wed, 19 Nov 2025 10:02:57 +0000
Date: Wed, 19 Nov 2025 10:02:56 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <fustini@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, s32@nxp.com,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH net-next 0/3] net: stmmac: pass struct device to init/exit
Message-ID: <aR2V0Kib7j0L4FNN@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

Rather than passing the platform device to the ->init() and ->exit()
methods, make these methods useful for other devices by passing the
struct device instead. Update the implementations appropriately for
this change.

Move the calls for these methods into the core driver's probe and
remove methods from the stmmac_platform layer.

Convert dwmac-rk to use ->init() and ->exit().

 .../net/ethernet/stmicro/stmmac/dwmac-anarion.c    |  4 +-
 .../net/ethernet/stmicro/stmmac/dwmac-eic7700.c    |  4 +-
 .../net/ethernet/stmicro/stmmac/dwmac-loongson1.c  | 12 +++---
 .../ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c  |  4 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c     | 47 +++++++++-------------
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c    | 14 +++----
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c    |  4 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  | 10 ++---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c  |  4 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c  |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 47 ++++++++++++++++------
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 35 +++++-----------
 include/linux/stmmac.h                             |  4 +-
 14 files changed, 94 insertions(+), 99 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

