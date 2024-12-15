Return-Path: <linux-mips+bounces-7026-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 091DB9F264E
	for <lists+linux-mips@lfdr.de>; Sun, 15 Dec 2024 22:38:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 371C4165362
	for <lists+linux-mips@lfdr.de>; Sun, 15 Dec 2024 21:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E941B87C7;
	Sun, 15 Dec 2024 21:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="UdCshgYi"
X-Original-To: linux-mips@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64030653;
	Sun, 15 Dec 2024 21:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734298705; cv=none; b=FhQ19/54Z8nySbs6ZYm1EPZNwaW1kKl47j0A3DIbGT2QmULRcqchPn7ZCjSLaiN64dRYGNvk3zuqGCGuL3oqDIAtViNqcnS20fP5SXSYn82l8wJGujmImPBgI2G6CfVpxeH0D9CVv9NIAhEd4A0UxQZpRNaivJ53jUbyOo30r5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734298705; c=relaxed/simple;
	bh=9f4JwzMdqEK/9bVfXFnngJwBxR8hsm49QC4hfimtp3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DbwaFtnsopBWeBogUpPm6b20mvGfG2TR6fWtSxCZjYynPc9thU6nB9hDDu/xGP7dxHvDD7oSGVgilzpEZcTVok+L4B74pJvg0W1Pj3Dn+ZnXy+iLg2Bcg3BObamoxhZUgbHesM340AsPZ/zD1097d9LvgA8WhZlrK5dGCTlzx6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=UdCshgYi; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Oas2kXCSYIfG9qNfGS++PzQ3nfW6IDkiGNr6OHMRulA=; b=UdCshgYiui3/wTvrC9YZi8ImZT
	Tg93GRUDY1mS9/Vppr+Pny7J1U8AKiBoHLNaj8yam9E/9789mWadtMfOY0D/GMxuDeLoaPIjy6Qah
	DjhoDdDOJUxC183xHi0z6Mvr4u0njZbtXVl/FnyfZ3HYS+QKA/ygmkYz0skwIYi2UYRE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tMwJN-000WsW-7E; Sun, 15 Dec 2024 22:38:01 +0100
Date: Sun, 15 Dec 2024 22:38:01 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	tsbogend@alpha.franken.de, hkallweit1@gmail.com,
	linux@armlinux.org.uk, markus.stockhausen@gmx.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: net: Add Realtek MDIO controller
Message-ID: <825cf2a3-dea8-4bd6-9c60-bf9c431766b3@lunn.ch>
References: <20241211235342.1573926-1-chris.packham@alliedtelesis.co.nz>
 <20241211235342.1573926-2-chris.packham@alliedtelesis.co.nz>
 <77817fd0-cf79-4c4f-b09f-8ee9b3b136f9@lunn.ch>
 <4e59d81c-4af1-407b-a9c5-4b36eee35f96@alliedtelesis.co.nz>
 <b1117d56-87d9-46b2-b6aa-e6ca20bac322@lunn.ch>
 <bd481a13-73a3-4325-8e16-ea2b2c6b0f6e@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd481a13-73a3-4325-8e16-ea2b2c6b0f6e@alliedtelesis.co.nz>

> It's a part of the board design so I think it's something that should go
> into the device tree. For example I've got 3 different boards right now that
> use different arrangements of MDIO connections to the PHYs mostly for ease
> of board layout (and one because it has different PHYs).

O.K. Lets keep this property then.

	Andrew

