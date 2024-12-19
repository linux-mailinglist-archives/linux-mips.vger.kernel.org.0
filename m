Return-Path: <linux-mips+bounces-7086-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD619F78AA
	for <lists+linux-mips@lfdr.de>; Thu, 19 Dec 2024 10:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82B41166C40
	for <lists+linux-mips@lfdr.de>; Thu, 19 Dec 2024 09:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92D1221473;
	Thu, 19 Dec 2024 09:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="jRveb21/"
X-Original-To: linux-mips@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07B3149DF4;
	Thu, 19 Dec 2024 09:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734601225; cv=none; b=Ak6J2Vg4O42g8t6TPwNc9xq5Wfsb8AiwiR/fYWN26YqLHGSFQADXstnLUEaLFoxSmjl5xgz1R5JiUZD/R8V1wW6wE7Lh80z1DR054KkeMm/rV2sUQQCh/7so3SwpJ9qn06zEgBbWl9GNnOrXsHDVmvwF2/rxjs8HonJt+STGXR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734601225; c=relaxed/simple;
	bh=m5hL27D6WE5GBp9PEU637dnb9/EImMC7RA6s6p9I4ZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLTEh+1p83XmAVWNaeKhRaNKIXBWsju/q2IkmllI0GVAtejYAdQ4HTUgfpchEzFx9SMd7Uoi/r2V3glMR88fjET228ZrJuhoKbwGIED10U8R/oHolB5ORiVNy5z1/UpeZ2fvaKBV0mzsT5Vco909oS0bvzZE1B0oCFpog2RdyMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=jRveb21/; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=CNq964i+6ZlpK5/5QoY6V1piSpQj5e1yvMZZodLGDs8=; b=jRveb21/IpMSGHLr70sho+3ww5
	c7hcND1BXR0be+Bn1yIqyCxViFMr6nxnz/JkV89yte2VaJ2rpX8iGihQz2ia8MXBF6PvDAl+LQpFl
	xBkh+YTeiWZGtI78TenTYTdTzk3sWIWttGMKN9X+FkEgt8nP5zjPp6PZEY2MwMkSciKQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tOD0j-001Z5y-6I; Thu, 19 Dec 2024 10:40:01 +0100
Date: Thu, 19 Dec 2024 10:40:01 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, lee@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, tsbogend@alpha.franken.de,
	hkallweit1@gmail.com, linux@armlinux.org.uk,
	markus.stockhausen@gmx.de, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 4/4] net: mdio: Add RTL9300 MDIO driver
Message-ID: <07073382-df51-4064-9802-cdbfcf732523@lunn.ch>
References: <20241216031346.2626805-1-chris.packham@alliedtelesis.co.nz>
 <20241216031346.2626805-5-chris.packham@alliedtelesis.co.nz>
 <CAJq09z49uBPPZqDyc3O+4nVppKoKdrJunQnQKBUfQmwzdV+ZFQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJq09z49uBPPZqDyc3O+4nVppKoKdrJunQnQKBUfQmwzdV+ZFQ@mail.gmail.com>

On Thu, Dec 19, 2024 at 01:46:41AM -0300, Luiz Angelo Daros de Luca wrote:
> Hello Chris,
> 
> > +++ b/drivers/net/mdio/mdio-realtek-rtl.c
> 
> I wonder if the name might be dubious in the future with other realtek
> products with MDIO. Realtek is quite a large company with many
> products. Would a version/model/family/usage in that name help a far
> future reader to identify what this file is about?

Isnt rtl the family name? Or would you prefer mdio-realtek-rtl9300.c?

> > +static int realtek_mdio_wait_ready(struct realtek_mdio_priv *priv)
> 
> All those realtek_mdio_* prefix might collide with realtek_mdio_* from
> drivers/net/dsa/realtek/realtek-mdio.c. This realtek_mdio_* is about a
> Realtek SoC MDIO interface with the switch. The other realtek_mdio_*
> is about the interface (MDIO or SMI) between (the other vendor) SoC
> and the switch. I don't know if the maintainers are OK with it but
> listing those symbols in alphabetic order from both sources might be
> confusing.

rtl9300_ as a prefix?

> > +static const struct of_device_id realtek_mdio_ids[] = {
> > +       { .compatible = "realtek,rtl9301-mdio" },
> > +       { .compatible = "realtek,rtl9302b-mdio" },
> > +       { .compatible = "realtek,rtl9302c-mdio" },
> > +       { .compatible = "realtek,rtl9303-mdio" },
> 
> Do these different compatible strings really matter? AFAIK, compatible
> are not for listing all supported models/variants but to describe
> devices that have a different behavior and indicating that (with
> different strings) is needed to decide how the driver will work. If
> the driver does not use which compatible was set, it might indicate
> that we don't really need 4 compatible but 1.

It can be useful when we initially think they are compatible, but
later find out they are not, and we need different behaviour.

FYI: Please trim the text when replying.

	Andrew

