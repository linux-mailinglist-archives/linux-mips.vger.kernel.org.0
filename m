Return-Path: <linux-mips+bounces-8294-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 046D2A6C4B4
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 21:57:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0688A1898DFC
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 20:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7D5231A2A;
	Fri, 21 Mar 2025 20:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="yNk5RdcJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4F11EB184;
	Fri, 21 Mar 2025 20:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742590655; cv=none; b=tHZcR3r5N9JxfsKAVHxYiaMvoanJhMqSMYSNzpq76zSus+orOv/IhEpbQ/vrKCbxs+Lir0Y/ElgY6FlRP9QEUeRrZptU6uQtLCDiCm+RBpnhyShhLyAUNRmjAXt+HYD/u8xNQyuCqFdEaB/yHVVBX2s9NGYU9fxxd+gaQktxG+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742590655; c=relaxed/simple;
	bh=ej6gq67mIyNmEWjWJryudKBbRH5LA+pHLN5k4uhclrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pJCc3c/Qxgc1cpVX6Pi/WmXyP8AXWQxIUtiO4f8gxF1BKIkPF/uBllupxSR4mPtLHYdBpRDNBnOVCZmka9G0fF+FQJdrE8YDcmvUnltIbeEfgquAlF3/nJIGwqKdsqaOZh4qRaDp6tkdz1BaQpHYoVndEeQa7kgfcIpY6UTs1hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=yNk5RdcJ; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=kd/LOXc2hK0rFV/RZv6EziZTaeljqABnxpQVD76cq5s=; b=yN
	k5RdcJr7nXPEYApyt0Sf4vKbvkk1NmIidaKI2PoZWMB+D1yiCgRvWSVG5pEN46soseD3v7ks81OF0
	MnVROFbDhG6csm2yiE83Jk6CyRlCzzXgOQZRYdpSLn3CXV7qQPGhhjzuQbpVUnhyKq1CFxXljJdB9
	B4W9vYeJvBrpXEw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tvjQg-006ee0-6h; Fri, 21 Mar 2025 21:57:22 +0100
Date: Fri, 21 Mar 2025 21:57:22 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH net-next 06/13] net: macb: simplify macb_probe() code
 touching match data
Message-ID: <18adb857-35c8-4ef2-bfd2-ebe1dbdeaeea@lunn.ch>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-6-537b7e37971d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250321-macb-v1-6-537b7e37971d@bootlin.com>

On Fri, Mar 21, 2025 at 08:09:37PM +0100, Théo Lebrun wrote:
> Remove local variables clk_init and init. Those function pointers are
> always equivalent to macb_config->clk_init and macb_config->init.
> 
> Also remove NULL checks on macb_config as it is always valid:
>  - either it is its default value &default_gem_config,
>  - or it got overridden using match data.

I probably would of made this two patches. But otherwise it looks O.K.

  Andrew

