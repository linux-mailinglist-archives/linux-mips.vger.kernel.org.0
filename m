Return-Path: <linux-mips+bounces-12100-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 853F1C3F542
	for <lists+linux-mips@lfdr.de>; Fri, 07 Nov 2025 11:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDCC73A226F
	for <lists+linux-mips@lfdr.de>; Fri,  7 Nov 2025 10:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02F203016EF;
	Fri,  7 Nov 2025 10:07:53 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4D12F3C18;
	Fri,  7 Nov 2025 10:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762510072; cv=none; b=l59k/h+Pikpd+nkK2ej2MKw1K6sjgR/dg5xWFzWC5If2l2Xt031jyADay0QlofYB3B8pBptvOPIst8ZomtybFDN10DqSwyXN2e+lkki+Sc6EbD1hx8LxUTtRSOWOhrVEKps2CjrwJFQSJTOXU/c/da1sACRETjcdZKb7uSFHTpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762510072; c=relaxed/simple;
	bh=dlOyn81Zua1sUZXJuprlTCWWBUHkiLyOLBgAn0kGMzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f2BOTkQuQGaaEVp8m9X1Qfnbr/OHKmMCosSFdp1CAYl6WsyDocFo/upazrrS2H/8E/Peg5j4VO4o5WQ5R2ovWnE7IqpvP309A+CCopsUkSdkc1/4ATFIQ+bL81NlBbBQesOfKGbBV9XzUpKt5tSsRqZ1E/faL2GD/tWJ36Jb42g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vHIx6-000492-00; Fri, 07 Nov 2025 10:40:16 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 5D811C0256; Fri,  7 Nov 2025 10:39:37 +0100 (CET)
Date: Fri, 7 Nov 2025 10:39:37 +0100
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 6/7] MIPS: mobileye: eyeq5: add two Cadence GEM
 Ethernet controllers
Message-ID: <aQ2-WZkptVKJTM0a@alpha.franken.de>
References: <20251101-macb-phy-v2-0-c1519eef16d3@bootlin.com>
 <20251101-macb-phy-v2-6-c1519eef16d3@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251101-macb-phy-v2-6-c1519eef16d3@bootlin.com>

On Sat, Nov 01, 2025 at 09:53:34AM +0100, Théo Lebrun wrote:
> Add both MACB/GEM instances found in the Mobileye EyeQ5 SoC.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  arch/mips/boot/dts/mobileye/eyeq5.dtsi | 45 ++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

