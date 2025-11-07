Return-Path: <linux-mips+bounces-12101-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5028C3F543
	for <lists+linux-mips@lfdr.de>; Fri, 07 Nov 2025 11:08:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60A43188D01E
	for <lists+linux-mips@lfdr.de>; Fri,  7 Nov 2025 10:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6841302147;
	Fri,  7 Nov 2025 10:08:12 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC89302142;
	Fri,  7 Nov 2025 10:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762510092; cv=none; b=pS4AAoIYCuThf+Tnuz48tM/tg7Hxz3CVn6NEDwZ7uKSY91kOFbj/JPKCZxaASlTljBHNvMLKVaXhRE54/shTLnrmkEO18nNnypuX/0q4eBlj+TayHFqh5hICJ8gqvWLadsjAjvATE3j/5T7zdk4ATTCv+rZHytY/z1MWydVLvPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762510092; c=relaxed/simple;
	bh=vieHkYqW3YWrq0xCZE2px6pnxQjBQRiOI/cNhBb93So=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qUFEO1H/VQ0x9gaOl+EnWfQ0OlhCeu9xZQQJiyt2Wz7Ubm8VtRraarCxXI3dZj90pg72FyXsWx742kI3SVzCYIr6R499exBSx5T4YZL2PEDM0vWMKiz8NRxG6PK1BjadpH1Gs+ZXYNeFAK0io5qifOu6Y5JYjVAlpf3BZVDdGKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vHIx6-000494-00; Fri, 07 Nov 2025 10:40:16 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id C1DDCC06A7; Fri,  7 Nov 2025 10:39:52 +0100 (CET)
Date: Fri, 7 Nov 2025 10:39:52 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Gr=E9gory?= Clement <gregory.clement@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-clk@vger.kernel.org,
	=?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 7/7] MIPS: mobileye: eyeq5-epm: add two Cadence GEM
 Ethernet PHYs
Message-ID: <aQ2-aNtzp-VUBjrp@alpha.franken.de>
References: <20251101-macb-phy-v2-0-c1519eef16d3@bootlin.com>
 <20251101-macb-phy-v2-7-c1519eef16d3@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251101-macb-phy-v2-7-c1519eef16d3@bootlin.com>

On Sat, Nov 01, 2025 at 09:53:35AM +0100, Théo Lebrun wrote:
> The Mobileye EyeQ5 eval board (EPM) embeds two MDIO PHYs.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  arch/mips/boot/dts/mobileye/eyeq5-epm5.dts | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

