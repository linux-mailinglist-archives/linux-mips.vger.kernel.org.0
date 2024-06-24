Return-Path: <linux-mips+bounces-3909-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEC6915859
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 22:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 684331C23B9E
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 20:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 686FF1A073B;
	Mon, 24 Jun 2024 20:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CGcjseBw"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351C345010;
	Mon, 24 Jun 2024 20:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719262621; cv=none; b=uawyvukfrPc45KMrJGWK6oPVDAM/Mh5Hz9644oiYijUzUxJefjzYyrNZ1RTsSFtVPbDBGvF37uoELULIv+dHtJx+U7BuLkCtVu0WmxQNaby1N744FpMF8PNfaJjkgBaJiNvYlL6GLW6JOZ024B3Fm2rnut33oK1d4bmqcF9LlZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719262621; c=relaxed/simple;
	bh=95fdFeKlIJQaOSK88eu3YruFZOuuR7eAP6N0waxJM10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7pAYQzj6QkyQ01bTDUHNIDqFqIhI6weGZBGjTe/IiXgjEj+v3dkiv/JukHn4S4ZJxqXoX3t8kfbIYnlOJqcokp0qgvo8qPo7I541qGx2jOnBOcwehq1nHJZZPFOGdpPjEXSCdHbsog6Rh3poOSkAJs3tJkAHCStHYslqYweYR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CGcjseBw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46958C2BBFC;
	Mon, 24 Jun 2024 20:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719262620;
	bh=95fdFeKlIJQaOSK88eu3YruFZOuuR7eAP6N0waxJM10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CGcjseBwVHp8LKIEzzmvaaffa/dpkvTlqW9L8+cilYLVXRHc5NdTfTuRERtlcLH1E
	 2i6jIDQEi5dMidUHgp6blHVrs6e4CrX9eOWuPkuISpDZIdjVPeeSqr3141DgI8M+yN
	 rca9KUK9BoFJ2404YxuLeKlWAlGOvHYEW2kerH/9LRlrU97pg98yTaZLDcttzltUh8
	 5JXfAtlGywLgUjo/4npYUD41+eL0gRAOgUwE1MlQUnkP8WREmRT46w1xE2H5pUntRB
	 g1xXUHFCg12ohpL68kR6VDVAPwUAV7PmgQ2rWe+t2hfuaOuJ3E8EerQ0wSZpHlOJjU
	 7ByJq9qm+6kLg==
Date: Mon, 24 Jun 2024 14:56:59 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	linux-gpio@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-clk@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Lee Jones <lee@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v3 4/9] dt-bindings: soc: mobileye: add EyeQ OLB system
 controller
Message-ID: <171926261715.405330.8493876031546375299.robh@kernel.org>
References: <20240620-mbly-olb-v3-0-5f29f8ca289c@bootlin.com>
 <20240620-mbly-olb-v3-4-5f29f8ca289c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240620-mbly-olb-v3-4-5f29f8ca289c@bootlin.com>


On Thu, 20 Jun 2024 19:30:56 +0200, Théo Lebrun wrote:
> Add documentation to describe the "Other Logic Block" system-controller.
> It deals with three platforms: EyeQ5, EyeQ6L and EyeQ6H. First two have
> a single instance, whereas EyeQ6H has seven named instances.
> 
> Features provided are:
>  - Clocks, children to main crystal. Some PLLs and divider clocks.
>  - Resets. Some instances DO NOT have reset.
>  - Pinctrl. Only EyeQ5 has such feature.
> 
> Those are NOT the only features exposed in OLB system-controllers! Many
> individual registers, related to IP block integration, can be found.
> Additional features will be exposed over time.
> 
> We simplify devicetree phandles to OLB in two ways:
> 
>  - Compatibles exposing a single clock do not ask for a index argument.
>    This means we use EyeQ6H OLB south (it has four clocks):
> 
>       clocks = <&olb_south EQ6HC_SOUTH_PLL_PER>;
> 
>    But use EyeQ6H OLB east (it has one clock):
> 
>       clocks = <&olb_east>;
> 
>  - Compatibles exposing a single reset domain do not ask for a domain
>    index, only a reset index.
>    This means we use EyeQ5 OLB (it has three domains):
> 
>      resets = <&olb 0 10>;
> 
>    But use EyeQ6H west reset (it has one domain):
> 
>       resets = <&olb_west 3>;
> 
> About pinctrl subnodes: all pins have two functionality, either GPIO or
> something-else. The latter is pin dependent, we express constraints
> using many if-then.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  .../bindings/soc/mobileye/mobileye,eyeq5-olb.yaml  | 374 +++++++++++++++++++++
>  MAINTAINERS                                        |   2 +
>  include/dt-bindings/clock/mobileye,eyeq5-clk.h     |  21 ++
>  3 files changed, 397 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


