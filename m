Return-Path: <linux-mips+bounces-12217-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DD6C556C3
	for <lists+linux-mips@lfdr.de>; Thu, 13 Nov 2025 03:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF68E3B65E6
	for <lists+linux-mips@lfdr.de>; Thu, 13 Nov 2025 02:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748BA2F6569;
	Thu, 13 Nov 2025 02:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CSQv8g5l"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498AE18D636;
	Thu, 13 Nov 2025 02:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763000455; cv=none; b=E/QWNBLzMaudjspT+OMLQmI3YNzyAhGQ7E6eFBSfNZj7pRtm/i8N3iM0KgW+RfJYBezs4uPzRzgQFq3Kj5lnmxYMEHG9n1wjdA5PScrsjs0LADSQObBt8vt5HHy7kWTdXKqpgvacgC984ah3XjuZ1QZBYyIBy1w10hAfdS912Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763000455; c=relaxed/simple;
	bh=8ejBa8X0oQZTOqEW8wmzYE3T4O7hj6OmR6op+Ep2U6k=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Avf67wufc0EPErnnUeuvbLvY+zdLLbfUttPJYkYmODRQqjO+TrFYY+mdeWETuaRv6gHKYB1gRUQMFvzwPDHREfdVliAAP9djNs/DFxreKqCI4iDcZHUKzzNtE0Ev0y0X9Qw1f9Ppcsk3O0gNbv9EjF5zMBljBrIpt21UJaYo3do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CSQv8g5l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C71C16AAE;
	Thu, 13 Nov 2025 02:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763000454;
	bh=8ejBa8X0oQZTOqEW8wmzYE3T4O7hj6OmR6op+Ep2U6k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CSQv8g5loeBZqGzmCvUsSPniqMoFRVNtpoRs0afr+bvThoG+hh30q0camffgh4MaO
	 JQG6cihmoYGnghBOeRxp6mBxZgq5Hcd2/K4DBMk7XhNwmmWaIFoEop/WrRN6cOVaF+
	 ovE1OTaKveGq0UT+DQc4wQfxrfG2KTb1Fu8Oo3H9WYK7ZWb+WpxkpP98OIof4+sATD
	 Joj+Z8Ka9I6buzx809VpN5D55WncG6CnYu0rHOF5E5yR44VUZT7zcGUWjHnKOKj8UK
	 i+7Z6au5q+VA7oNQ0Ci+SvOlR0hFYuNYaAa4C39P2V40SNmkRQeZ37fO+IR2HlmXn1
	 MpVw3p+2vu4Cw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E533A40FD1;
	Thu, 13 Nov 2025 02:20:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 00/13] net: stmmac: convert glue drivers to
 use
 stmmac_get_phy_intf_sel()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176300042425.285552.5459936972326957453.git-patchwork-notify@kernel.org>
Date: Thu, 13 Nov 2025 02:20:24 +0000
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
In-Reply-To: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com,
 davem@davemloft.net, kernel@esmil.dk, edumazet@google.com, kuba@kernel.org,
 keguang.zhang@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, matthias.bgg@gmail.com,
 mcoquelin.stm32@gmail.com, minda.chen@starfivetech.com,
 netdev@vger.kernel.org, nobuhiro.iwamatsu.x90@mail.toshiba, pabeni@redhat.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 11 Nov 2025 08:11:25 +0000 you wrote:
> This series converts the remaining glue drivers that support
> multi-interface to use stmmac_get_phy_intf_sel(). The reason these
> drivers are not converted to the set_phy_intf_sel() method is
> because it is unclear whether there are ordering dependencies that
> would prevent it.
> 
> For example, reading the stm32mp2 documentation, it is required to
> set the ETH1_SEL field while the dwmac core is in reset and before
> clocks are enabled. This requirement can not be satsified at the
> moment (but could with further changes.)
> 
> [...]

Here is the summary with links:
  - [net-next,v2,01/13] net: stmmac: loongson1: use PHY_INTF_SEL_x
    https://git.kernel.org/netdev/net-next/c/5d88b24c1de8
  - [net-next,v2,02/13] net: stmmac: loongson1: use PHY_INTF_SEL_x directly
    https://git.kernel.org/netdev/net-next/c/031f7a05d4b3
  - [net-next,v2,03/13] net: stmmac: loongson1: use stmmac_get_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/83eb6c7e1864
  - [net-next,v2,04/13] net: stmmac: mediatek: use PHY_INTF_SEL_x
    https://git.kernel.org/netdev/net-next/c/c3308d380e2c
  - [net-next,v2,05/13] net: stmmac: mediatek: use stmmac_get_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/d9c7964fd934
  - [net-next,v2,06/13] net: stmmac: mediatek: simplify set_interface() methods
    https://git.kernel.org/netdev/net-next/c/f06620091fe7
  - [net-next,v2,07/13] net: stmmac: starfive: use PHY_INTF_SEL_x to select PHY interface
    https://git.kernel.org/netdev/net-next/c/f0917b475378
  - [net-next,v2,08/13] net: stmmac: starfive: use stmmac_get_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/d22045997b53
  - [net-next,v2,09/13] net: stmmac: stm32: use PHY_INTF_SEL_x to select PHY interface
    https://git.kernel.org/netdev/net-next/c/73130c298fa0
  - [net-next,v2,10/13] net: stmmac: stm32: use PHY_INTF_SEL_x directly
    https://git.kernel.org/netdev/net-next/c/07669cf12ea8
  - [net-next,v2,11/13] net: stmmac: stm32: use stmmac_get_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/45c5e24a53f1
  - [net-next,v2,12/13] net: stmmac: visconti: use PHY_INTF_SEL_x to select PHY interface
    https://git.kernel.org/netdev/net-next/c/bb68e0183e04
  - [net-next,v2,13/13] net: stmmac: visconti: use stmmac_get_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/ccb4ff9f24e2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



