Return-Path: <linux-mips+bounces-8299-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BA7A6C4ED
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 22:17:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 503C2189940C
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 21:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C09A230BDC;
	Fri, 21 Mar 2025 21:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="PL4SZiXh"
X-Original-To: linux-mips@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111731E9B34;
	Fri, 21 Mar 2025 21:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742591828; cv=none; b=Dm9SZSRvviOXIeQ+dx1ISRAB07ZjYVHmlco6F+d5oOFvLK9Vp8hcaYdAprhtdgC/Qd3JzRloE0lek5Hv7smJa3R9r8FLFYA4uVFZ/5Oy0dWdFe+wpMe87Bz8x4iM0FoXz/VONbE4tUpxdcpZLJ8mEu82fK81hppZglCS1ddMc8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742591828; c=relaxed/simple;
	bh=1FhOQ8K+GLTJrHZH020JuhGD9vw3YFls8XQrZwgxKRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQhwrf4cXgar/grNt8162/75bINMDfg/kjPYLGona1VgYRNBJN/DhpLWMFWigXgUoo0ZQuijWRrH2S6mldSCfCztltaSPo9UClyJYvNcav2AsLxGxXvPEr2HPxd9273pAWyyDKLvfoh69yqj4X4GBmWyL9XTcVHpBT3H+Xikqpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=PL4SZiXh; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=9I1UFRdpTQORdgr7JFOGekbkH0vyOzdoO/6a82DByUk=; b=PL
	4SZiXhSRtaDXCa/X5vPcQA+OKp1MG594XOOAMZye6xybAFFrxnFUBJOSlyGV4ZQ06509oIl6JrUGB
	kWm8bptJMhaxP64fxjvOFZ0oQkzLr0CAqMrGb0lFt3NSVkkz/xH3/Je14iIPgMncOosy6yuNNGG57
	4r22yXvEXLxjNvw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tvjja-006em6-2R; Fri, 21 Mar 2025 22:16:54 +0100
Date: Fri, 21 Mar 2025 22:16:54 +0100
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
Subject: Re: [PATCH net-next 13/13] MIPS: mobileye: eyeq5-epm: add two
 Cadence GEM Ethernet PHYs
Message-ID: <905d367f-ff06-4a3b-b410-1e3c65e31f54@lunn.ch>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-13-537b7e37971d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250321-macb-v1-13-537b7e37971d@bootlin.com>

On Fri, Mar 21, 2025 at 08:09:44PM +0100, Théo Lebrun wrote:
> The Mobileye EyeQ5 eval board (EPM) embeds two MDIO PHYs.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  arch/mips/boot/dts/mobileye/eyeq5-epm5.dts | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts b/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
> index 6898b2d8267dfadeea511a84d1df3f70744f17bb..20dfc85681bb03330981ca0f11b2edfff3fa57bc 100644
> --- a/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
> +++ b/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
> @@ -21,3 +21,29 @@ memory@0 {
>  		      <0x8 0x02000000 0x0 0x7E000000>;
>  	};
>  };
> +
> +&macb0 {
> +	phy-mode = "sgmii";
> +	phy-handle = <&macb0_phy>;
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		macb0_phy: ethernet-phy@e {
> +			reg = <0xE>;

The DT coding style might say this should be lower case?

> +		};
> +	};
> +};
> +
> +&macb1 {
> +	phy-mode = "rgmii-id";

Hurrah.  A correct rgmii phy-mode.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

