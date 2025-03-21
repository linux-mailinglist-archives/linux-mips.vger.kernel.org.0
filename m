Return-Path: <linux-mips+bounces-8291-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C8BA6C499
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 21:52:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 470F04852A2
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 20:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F112230BD4;
	Fri, 21 Mar 2025 20:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="0vkm2BTD"
X-Original-To: linux-mips@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D0E230BD1;
	Fri, 21 Mar 2025 20:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742590306; cv=none; b=b5JIzGzsjHEx72oEgQ4qym58NBl5SUKQnytlJ78wQzM3TjR2YSgMAmISjzxEiQ1aBLpfpHkxUVfA9TC9WBiWODQd45eZpp+rAuf2MEAJkPU1gl8foHAAqMZ9MK8D3b7KgNe0TlMgRuvo1iZ/H99qh8XmTle2Ry4lxp5CVZwzbjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742590306; c=relaxed/simple;
	bh=1EBcTuXEqnBF1VAbjl8o3mVCG750rnXjOs/6/Z6qGik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RX9Mx6NXubflRIMxLId0fn6KKhSlasgFCdf2O1Gatfs70PXJZwcVOvruDVVjFuJdkgCq3b6X+XTTLi3PPqzW1Lt9aiFlTxb1FDjnUjIwZv4S+aH3u6pKQplXCLw77JJTw3ulDiZpc3rDSKnib/EkbOBVG+6YtQZs9EJg8bDgKk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=0vkm2BTD; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=tQEWBqlrgGAnmKeq2g+GPEUKgYEJfU5L6gUJF2xBgtc=; b=0v
	km2BTDi9qP/O+MeAXIGY7TAS1x/4BUJtaI7cAeMEj2gztjFPd/Lq6kt1UTFlVVG2MQr1FEKa1OP8i
	m9qWWscJXiR356rQsIs8qA9Bfbpx5wBHPYSbMuc+IiAh68vQinXyAI5cD/19brj3RL9R/fIbyegEJ
	4snRy3j/klDIGF8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tvjL2-006eXP-1n; Fri, 21 Mar 2025 21:51:32 +0100
Date: Fri, 21 Mar 2025 21:51:32 +0100
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
Subject: Re: [PATCH net-next 05/13] net: macb: add no LSO capability
 (MACB_CAPS_NO_LSO)
Message-ID: <43cb322e-f630-4263-9bf7-6bf5d08b835e@lunn.ch>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-5-537b7e37971d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250321-macb-v1-5-537b7e37971d@bootlin.com>

On Fri, Mar 21, 2025 at 08:09:36PM +0100, Théo Lebrun wrote:
> LSO is runtime-detected using the PBUF_LSO field inside register
> designcfg_debug6/GEM_DCFG6. Allow disabling that feature if it is
> broken by using struct macb_config->caps.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

