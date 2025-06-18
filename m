Return-Path: <linux-mips+bounces-9378-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A49AADE94D
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 12:42:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48FEA3A6489
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 10:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E946283FDF;
	Wed, 18 Jun 2025 10:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="xRNdrcC+"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FB227F177;
	Wed, 18 Jun 2025 10:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750243302; cv=none; b=Rn2PkLXjz+gTg+XNUJgMMhmiIf+AkuzyUNcUne9c+wTCvjQf2C73prE76Z1If8RIL0sW//7pBXBtnHky/l+BZoNzxYSrs3x1lDIQPaappXvY5C9EQ5m2y32ybMwmVROvJ5QM1XQ4UoMX+VR+EbfqlYOwqbIkYnNKcon8phUtsSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750243302; c=relaxed/simple;
	bh=4MWy2YUMCsaOlFgUjdLpNG2BqypAZmGxZCgUKaSlvho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=grvY1ZIHgc/VkkWaWIpyTh688L+JHbfq1I34yrsMFjUNbOLg9oxyKSd2BevXUNObKZMuVCpG4UIDQ//fm0R5U9pSPdDuJlFDecjWmYlx3NYzmm1c38I3acf3vBqjl+6UvWDrJ7M3MzXfIhKZY/10AF12v2t2K1CXfhcj6UENOeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=xRNdrcC+; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XstzbsMdBgpvXArLU4IX3djhcZ4PMHanS8IZaEUIMI4=; b=xRNdrcC+zURL0NKyh0g6GsbHfY
	yaflu1bcQCB0dmciBV+BhHLDxPuZN61101U+qg8MTeXALW6Yg9MqbLqtL607rohL1AuTPSj2fc40v
	OrdMblsRRDcE6ZViNkmCZ7keP5ysfrPu2eoRpYopdKU7Qx2urW530Wg/SG05oupiukG592YT1uFpP
	D0C95bPcJFgnALcLkr1C5p3Bvw+9cqBoEwJOaLdoG1vz4BaIctAiaHg1CUT00EUnsMqlWpGizRdFr
	57C94Lm4Z9ndFRzQoJTTIvpT4apCsPGMcamLLjXKU+jz3v8fdeUuS8QsDrqk98A64VZznuUXPp7yh
	AsBIonjg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53870)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uRqEN-0006IK-0i;
	Wed, 18 Jun 2025 11:41:23 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uRqEJ-0006lZ-02;
	Wed, 18 Jun 2025 11:41:19 +0100
Date: Wed, 18 Jun 2025 11:41:18 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 0/2] net: stmmac: loongson1: cleanups
Message-ID: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

Hi,

A couple of patches to cleanup loongson1. First, introducing a match
data struct to allow the per-match data to be extended beyond the init
function pointer, and then adding a setup method to allow the resource
base address to be translated to the MAC index at probe time rather
than repeatedly in the setup function.

 .../net/ethernet/stmicro/stmmac/dwmac-loongson1.c  | 73 ++++++++++++++++------
 1 file changed, 55 insertions(+), 18 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

