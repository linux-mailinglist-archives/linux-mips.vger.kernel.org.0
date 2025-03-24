Return-Path: <linux-mips+bounces-8336-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7E3A6E281
	for <lists+linux-mips@lfdr.de>; Mon, 24 Mar 2025 19:37:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A5B316D8C0
	for <lists+linux-mips@lfdr.de>; Mon, 24 Mar 2025 18:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46CCE264FA7;
	Mon, 24 Mar 2025 18:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="O1ktSCBf"
X-Original-To: linux-mips@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B2C264F84;
	Mon, 24 Mar 2025 18:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742841390; cv=none; b=W0BvPYv0eF76wl6ZzrIdQE+6iyyv6jUgulSk6ODvl3jg6pcVjFnY9d+lm+f0jPQePtwTDcDq1pt4/HT9YrjxK6B59tiO3PsSmSXR8DieSjnFDb+FHh/rJ7FRfP/ZHLpRFP9psrBoKL2slx5KMv+24EKGGQOxhv9hcrLAA047P2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742841390; c=relaxed/simple;
	bh=+tHTwQCl+rKNDLbsUQWAeB9cYvBtkmAj1qT/QM8FuTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hUZnkyZ9Qh2oQ2ctxKJfGtfU+IWZ4wV4KNQHPaTutFVMV4zvTThmZ4756VCpc4yvNcAPKH4xl9PPFn3EwRaKd3OBa1Y/A3GYgXP3p5b7r0yVSzo8Nvgo13/KHGjNv6l2SQpEzFWT4PZfcz9IkMeiPkjcEN1x3niMJOtrxM16ZE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=O1ktSCBf; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=X4F3sqvTWUFr3hm2OdD/nyNotX8RIX6/b7P9siq4rRk=; b=O1
	ktSCBftk6ilHFHI8FsPU/AMeKO4wrvczxzcGq4nXakKm9e7dUZrW2uwOeycO6IoajlOuCHcT9ITm1
	CT7GrwHUOAwCtujspynPvj2k6kGpmUDJSLQxtiygO89/y9H7VqqA6JkRwAMraFHOi6pFGb0hgYqCg
	guyfF9TnKcsQ75s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1twmec-006y0k-WC; Mon, 24 Mar 2025 19:36:07 +0100
Date: Mon, 24 Mar 2025 19:36:06 +0100
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
Message-ID: <967fcb66-6a64-4e97-8293-a38b0ef1bc01@lunn.ch>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-7-537b7e37971d@bootlin.com>
 <45b3e613-90c6-4499-b50b-383106172184@lunn.ch>
 <D8OOPAXK16CI.3TE75O760JRSL@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D8OOPAXK16CI.3TE75O760JRSL@bootlin.com>

On Mon, Mar 24, 2025 at 06:49:05PM +0100, Théo Lebrun wrote:
> Hello Andrew,
> 
> On Fri Mar 21, 2025 at 10:06 PM CET, Andrew Lunn wrote:
> > On Fri, Mar 21, 2025 at 08:09:38PM +0100, Théo Lebrun wrote:
> >> The controller does IP alignment (two bytes).
> >
> > I'm a bit confused here. Is this hard coded, baked into the silicon?
> > It will always do IP alignment? It cannot be turned off?
> 
> Yes, the alignment is baked inside the silicon.
> I looked but haven't seen any register to configure the alignment.
> 
> Sorry the commit message isn't clear, it needs improvements.
> 
> >> 	skb_reserve(skb, NET_IP_ALIGN);
> >
> > Why not just replace this with
> >
> >         skb_reserve(skb, 2);
> 
> On arm64, NET_IP_ALIGN=0. I don't have HW to test, but the current code
> is telling us that the silicon doesn't do alignment on those:

This is part of the confusion. You say the hardware does alignment,
and then say it does not....

>    skb = netdev_alloc_skb(...);
>    paddr = dma_map_single(..., skb->data, ...);
>    macb_set_addr(..., paddr);
> 
>    // arm   => NET_IP_ALIGN=2 => silicon does alignment
>    // arm64 => NET_IP_ALIGN=0 => silicon doesn't do alignment
>    skb_reserve(skb, NET_IP_ALIGN);
> 
> The platform we introduce is the first one where the silicon alignment
> (0 bytes) is different from the NET_IP_ALIGN value (MIPS, 2 bytes).

This is starting to make it clearer. So the first statement that the
controller does IP alignment (two bytes) is not the full story. I
would start there, explain the full story, otherwise readers get the
wrong idea.

> >>     Compatible             |  DTS folders              |  hw_ip_align
> >>    ------------------------|---------------------------|----------------
> >>    cdns,at91sam9260-macb   | arch/arm/                 | 2
> >>    cdns,macb               | arch/{arm,riscv}/         | NET_IP_ALIGN
> >>    cdns,np4-macb           | NULL                      | NET_IP_ALIGN
> >>    cdns,pc302-gem          | NULL                      | NET_IP_ALIGN
> >>    cdns,gem                | arch/{arm,arm64}/         | NET_IP_ALIGN
> >>    cdns,sam9x60-macb       | arch/arm/                 | 2
> >>    atmel,sama5d2-gem       | arch/arm/                 | 2
> >>    atmel,sama5d29-gem      | arch/arm/                 | 2
> >>    atmel,sama5d3-gem       | arch/arm/                 | 2
> >>    atmel,sama5d3-macb      | arch/arm/                 | 2
> >>    atmel,sama5d4-gem       | arch/arm/                 | 2
> >>    cdns,at91rm9200-emac    | arch/arm/                 | 2
> >>    cdns,emac               | arch/arm/                 | 2
> >>    cdns,zynqmp-gem         | *same as xlnx,zynqmp-gem* | 0
> >>    cdns,zynq-gem           | *same as xlnx,zynq-gem*   | 2
> >>    sifive,fu540-c000-gem   | arch/riscv/               | 2
> >>    microchip,mpfs-macb     | arch/riscv/               | 2
> >>    microchip,sama7g5-gem   | arch/arm/                 | 2
> >>    microchip,sama7g5-emac  | arch/arm/                 | 2
> >>    xlnx,zynqmp-gem         | arch/arm64/               | 0
> >>    xlnx,zynq-gem           | arch/arm/                 | 2
> >>    xlnx,versal-gem         | NULL                      | NET_IP_ALIGN

I'm not sure this table is useful. What might be more interesting is

     Compatible             |  architecture |  hw_ip_align | value of NET_IP_ALIGN

We can then see if there are cases when the 3rd and 4th column differ.

	Andrew

