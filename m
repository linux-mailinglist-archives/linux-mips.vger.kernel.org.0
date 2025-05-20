Return-Path: <linux-mips+bounces-9032-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 822F8ABD051
	for <lists+linux-mips@lfdr.de>; Tue, 20 May 2025 09:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32CF01674BD
	for <lists+linux-mips@lfdr.de>; Tue, 20 May 2025 07:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7200525D216;
	Tue, 20 May 2025 07:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLZScHyD"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EE025D207;
	Tue, 20 May 2025 07:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747725700; cv=none; b=nVSSvfC7amTn+fGI7sWyKU3l6cc+d3oyZ2bD9kWGhvInGjrzihQBb/2J5XH8sKQIXyAFk6w6ashfKoj23j29ucUUXDVRzYjywkJz5PnfIyZFSWdiEKdfQIJ9kNAHAVQC6iqXCpAVxBJs9G/6MbNb1dctj9luMa4A/i4K+YSXrlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747725700; c=relaxed/simple;
	bh=EicbBjvBOl2PIAvcrFVGoALjS8v7qICxDpr/x4X2WsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p75W6DLtSAxpp1AyalZMMLQk84ZHjBbti73gj9WU5DPpMeREEcrRgK9FTo4t8yfk8LLMrPfI7wDZYjPBjC76F6SiRy71yk2hn54QlmQb9fkHhAJVlKvs+NcMnkljHWl3V4qEJns6p/zWm3eeY09uzqL0vFP0cmC+xkXnqMhqlMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLZScHyD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E45C4CEE9;
	Tue, 20 May 2025 07:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747725699;
	bh=EicbBjvBOl2PIAvcrFVGoALjS8v7qICxDpr/x4X2WsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mLZScHyD6IAQocUyL5rQds44XBEDCD0AkH/pIKGwacAiAyj2zqSSo1LDAnx1Rxr/h
	 KZgzRNweczR1Sf6k9Qzy7Lh6wt/rkwVfxqunjU1bxvfUNnhrGSpV4I30oTst37JUXZ
	 COYS2qzUwHOeD2fDavIEhss6xrqps7yV9Xvf/0x/JEptGxApcEfuVMOL2SFQJ6Hy5O
	 DCcV7UxmWm1u3hFVIU+YgNmjjmEuH2rqA+HNtUhjbT3wbo8nDTqGhmZe5C00wQ3my1
	 L5HapCRwP5YZuipAM36z1sOirqOGOA/2aqiWp2L7Ms02O8DTiXOAEp3YJto85FNc0t
	 J4EeUnQB1RBQQ==
Date: Tue, 20 May 2025 08:21:33 +0100
From: Simon Horman <horms@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Vladimir Oltean <olteanv@gmail.com>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Thangaraj Samynathan <Thangaraj.S@microchip.com>,
	Rengarajan Sundararajan <Rengarajan.S@microchip.com>,
	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
	Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
	Russell King - ARM Linux <linux@armlinux.org.uk>,
	David Miller <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	Linux USB Mailing List <linux-usb@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [PATCH net-next 2/3] net: phy: fixed_phy: remove irq argument
 from fixed_phy_register
Message-ID: <20250520072133.GO365796@horms.kernel.org>
References: <4d4c468e-300d-42c7-92a1-eabbdb6be748@gmail.com>
 <31cdb232-a5e9-4997-a285-cb9a7d208124@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31cdb232-a5e9-4997-a285-cb9a7d208124@gmail.com>

On Sat, May 17, 2025 at 10:35:56PM +0200, Heiner Kallweit wrote:
> All callers pass PHY_POLL, therefore remove irq argument from
> fixed_phy_register().
> 
> Note: I keep the irq argument in fixed_phy_add_gpiod() for now,
> for the case that somebody may want to use a GPIO interrupt in
> the future, by e.g. adding a call to fwnode_irq_get() to
> fixed_phy_get_gpiod().
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>


