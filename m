Return-Path: <linux-mips+bounces-8298-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F826A6C4DD
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 22:11:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BC2216F56F
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 21:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A570822FF5E;
	Fri, 21 Mar 2025 21:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="judIglNn"
X-Original-To: linux-mips@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5F51EE005;
	Fri, 21 Mar 2025 21:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742591498; cv=none; b=pC5xTXXJZBitlLYZDvE03uh4lcSIchINzEmLy8+Gp+KrZsQee8ht6Z9whcaT5a/ZeP1beKx02g7Yc796A4WwAAB5mKQtl3Ztw62bGxnb6lnaDnaq1fQ5+HDsdQl0uga/xFBFGvQQqK+y36PN9+HqbtPUFm+PLMuWJyzQ4nkFjxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742591498; c=relaxed/simple;
	bh=PyMFYnLJE+m4nGVWpoteHV8scDMZxrXgyoVcEKQCtYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MyolkMiJSPT/vjb/eOttFkxghoTfRNwsFpthr4y0cQEtuyGu9QPGupnKXgX1vkFD4u/alsCckpAw2liliPgezE6Jox7jS/QbgPsBSgaGIB7n4QX1yZ6cZpJTtsGWxBXRwp1Xn4tyZJCokJM+BHM3utIrywqM0cZMqqO8olV6JWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=judIglNn; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=r8w5RJEEILxXI0lbjw5Sdn/gGtvMveeImDnq3hMjMTA=; b=ju
	dIglNnfPO8hHYwll2ZmwL6L/2i5qpVlwdDQ8aCdOwDoyckVlj6nnVokuiDGjxQuUxDlFLVBquv0Tq
	7TbNeLXA5mT81yWi8BHwskSIMQnAyLAR2e4DZ7akZGdESfBrolZFFg9Dtihnj6xaaZEfSAzFa+yrY
	jS9uLtRkBAPeZCY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tvjeF-006ek3-Q5; Fri, 21 Mar 2025 22:11:23 +0100
Date: Fri, 21 Mar 2025 22:11:23 +0100
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
Subject: Re: [PATCH net-next 09/13] net: macb: sort #includes
Message-ID: <2a34aa77-5a9b-48e1-974a-d3d5d8714844@lunn.ch>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-9-537b7e37971d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250321-macb-v1-9-537b7e37971d@bootlin.com>

On Fri, Mar 21, 2025 at 08:09:40PM +0100, Théo Lebrun wrote:
> Sort #include preprocessor directives.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

