Return-Path: <linux-mips+bounces-6754-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E81E49CDC2A
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2024 11:09:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D90DB22363
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2024 10:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC75E192B9D;
	Fri, 15 Nov 2024 10:08:59 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC3118B483;
	Fri, 15 Nov 2024 10:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731665339; cv=none; b=b63ZeplBjY5r53IE/1MV06yoYwQGu8JJxpuvxj9fyW63kCBvWrVeIwfbRzR6GWGWxnc4vFRQ/vty1A1MHeUMdI0EfeJmetYniMAcSb6l+vz/GLoEMz3sAmNY1F8I1kIgXUffzdm3tm93Yyi1j5xk4k0pu0tbcGRQZjOEYOEnUeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731665339; c=relaxed/simple;
	bh=X1ESOFAbXZjOe9jhisfFqkL1OKnfBcBEINp7w8fOdxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXjFwdFYuXQXF5l8Zb3JKUFQIiE4SLdZRaawEGo5XcYXlfjxTbH/gz/TY0HSk4iafJwrSqg4SqDVOpwo+fAWaqUc2XaG5t7SEzc8SzQpNcB4FHTwg6sQf0J3YhHxrr7DA1B9kk+7WCslZOrLXL5mVRwyx5DEH8bEXARRP0Qr/qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tBtFg-0005Do-00; Fri, 15 Nov 2024 11:08:32 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 6ED69C0110; Fri, 15 Nov 2024 10:34:14 +0100 (CET)
Date: Fri, 15 Nov 2024 10:34:14 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Gr=E9gory?= Clement <gregory.clement@bootlin.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v2 00/10] Usable clocks on Mobileye EyeQ5 & EyeQ6H
Message-ID: <ZzcVlrbnMw7CXEC4@alpha.franken.de>
References: <20241106-mbly-clk-v2-0-84cfefb3f485@bootlin.com>
 <D5MN6O1SHWV7.31HDXZG3NEOCK@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D5MN6O1SHWV7.31HDXZG3NEOCK@bootlin.com>

On Fri, Nov 15, 2024 at 10:24:29AM +0100, Théo Lebrun wrote:
> Hello Thomas,
> 
> On Wed Nov 6, 2024 at 5:03 PM CET, Théo Lebrun wrote:
> > Now that clk-eyeq is in the clk-next tree, we can add the small(-ish)
> > details required to make the platform work fully. The work is mostly
> > about updating devicetrees to rely on the system-controller nodes as
> > clock providers.
> 
> [...]
> 
> >  - clk:
> >    [PATCH v2 01/10] dt-bindings: soc: mobileye: set `#clock-cells = <1>` for all compatibles
> >    [PATCH v2 02/10] dt-bindings: clock: eyeq: add more Mobileye EyeQ5/EyeQ6H clocks
> >    [PATCH v2 03/10] clk: fixed-factor: add clk_hw_register_fixed_factor_index() function
> >    [PATCH v2 04/10] clk: eyeq: require clock index with phandle in all cases
> >    [PATCH v2 05/10] clk: eyeq: add fixed factor clocks infrastructure
> >    [PATCH v2 06/10] clk: eyeq: add EyeQ5 fixed factor clocks
> >    [PATCH v2 07/10] clk: eyeq: add EyeQ6H central fixed factor clocks
> >    [PATCH v2 08/10] clk: eyeq: add EyeQ6H west fixed factor clocks
> >
> >  - MIPS:
> >    [PATCH v2 09/10] MIPS: mobileye: eyeq5: use OLB as provider for fixed factor clocks
> >    [PATCH v2 10/10] MIPS: mobileye: eyeq6h: add OLB nodes OLB and remove fixed clocks
> 
> Do you think we can make those two patches go in before the next merge
> window? Stephen just accepted the above patches. This makes both MIPS
> platforms usable on upstream kernels!

I've applied, but not pushed, because this

Error: /local/tbogendoerfer/korg/linux/arch/mips/boot/dts/mobileye/eyeq5.dtsi:20.19-20 syntax error
FATAL ERROR: Unable to parse input treeo

My tree misses the new CLK defines.

I haven't decided whether I'll ignore that and push it now or put them
into a second request vor 6.13.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

