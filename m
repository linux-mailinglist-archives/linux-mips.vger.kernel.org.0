Return-Path: <linux-mips+bounces-8296-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5B4A6C4D1
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 22:06:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C471017FFC7
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 21:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBECF22CBF8;
	Fri, 21 Mar 2025 21:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="NG8RHjTH"
X-Original-To: linux-mips@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691312AF1B;
	Fri, 21 Mar 2025 21:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742591195; cv=none; b=j2gODrExPvUy+O01zO5lHB5hNC9ht9m0Ro9L/5o4SDynrmUcQGIdRCUMLbL7zo04gKAR2dAim6MoH856IAkB7Uj8ivsNZMhy7fd9GO0p7Rt+UM1hPmMEnuhEHDmwi5Ou1K7DfkAigGwh8uI+PeeX5KquE4AAe04QenD37zRcPA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742591195; c=relaxed/simple;
	bh=9riql/oH3fcMg2Z11Amu5t8EaVzKgqVadwWXmHzNEmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0Qm0dhxc76cxCpT9/It/2upgfcDNfd8RelzadqMcIUgwnODvlB/iTXKQ6iGeym+5cFWpGIuwriIEq4Pb07Axf+FYxTd7cA00xbS60roVi759dxHSoek2by+jVNs82sJnbaWpj/DcoJasXdZaT5JFd4AvjnECIDIj33IZFzmJmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=NG8RHjTH; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=buUh30Oz9yzO2/ro6EDCpMmAZW/F4GUFW3had039J1M=; b=NG
	8RHjTH4PsYo7d4kavqAQLOQu8x9oErOGpm34Sd5TXukty8lLPiNgrEE+3S1bWeqc0SdxWsnzznxA8
	uq0KJxz55GYICV0LFFn4KCuU71h7ZgLIuC9rC2LyVeloigEBWrzWCsM8S1HzVpG9SNfj+m2ZTmv12
	xBE77m5deunc41w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tvjZK-006ehx-5I; Fri, 21 Mar 2025 22:06:18 +0100
Date: Fri, 21 Mar 2025 22:06:18 +0100
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
Subject: Re: [PATCH net-next 07/13] net: macb: move HW IP alignment value to
 macb_config
Message-ID: <45b3e613-90c6-4499-b50b-383106172184@lunn.ch>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-7-537b7e37971d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250321-macb-v1-7-537b7e37971d@bootlin.com>

On Fri, Mar 21, 2025 at 08:09:38PM +0100, Théo Lebrun wrote:
> The controller does IP alignment (two bytes).

I'm a bit confused here. Is this hard coded, baked into the silicon?
It will always do IP alignment? It cannot be turned off?

> 	skb_reserve(skb, NET_IP_ALIGN);

Why not just replace this with

        skb_reserve(skb, 2);

> The NET_IP_ALIGN value is arch-dependent and picked based on unaligned
> CPU access performance. The hardware alignment value should be
> compatible-specific rather than arch-specific. Offer a path forward by
> adding a hw_ip_align field inside macb_config.
> 
> Values for macb_config->hw_ip_align are picked based on upstream
> devicetrees:
> 
>     Compatible             |  DTS folders              |  hw_ip_align
>    ------------------------|---------------------------|----------------
>    cdns,at91sam9260-macb   | arch/arm/                 | 2
>    cdns,macb               | arch/{arm,riscv}/         | NET_IP_ALIGN
>    cdns,np4-macb           | NULL                      | NET_IP_ALIGN
>    cdns,pc302-gem          | NULL                      | NET_IP_ALIGN
>    cdns,gem                | arch/{arm,arm64}/         | NET_IP_ALIGN
>    cdns,sam9x60-macb       | arch/arm/                 | 2
>    atmel,sama5d2-gem       | arch/arm/                 | 2
>    atmel,sama5d29-gem      | arch/arm/                 | 2
>    atmel,sama5d3-gem       | arch/arm/                 | 2
>    atmel,sama5d3-macb      | arch/arm/                 | 2
>    atmel,sama5d4-gem       | arch/arm/                 | 2
>    cdns,at91rm9200-emac    | arch/arm/                 | 2
>    cdns,emac               | arch/arm/                 | 2
>    cdns,zynqmp-gem         | *same as xlnx,zynqmp-gem* | 0
>    cdns,zynq-gem           | *same as xlnx,zynq-gem*   | 2
>    sifive,fu540-c000-gem   | arch/riscv/               | 2
>    microchip,mpfs-macb     | arch/riscv/               | 2
>    microchip,sama7g5-gem   | arch/arm/                 | 2
>    microchip,sama7g5-emac  | arch/arm/                 | 2
>    xlnx,zynqmp-gem         | arch/arm64/               | 0
>    xlnx,zynq-gem           | arch/arm/                 | 2
>    xlnx,versal-gem         | NULL                      | NET_IP_ALIGN

I don't remember seeing any other driver doing anything like
this. That often means it is wrong....

      Andrew

