Return-Path: <linux-mips+bounces-12371-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 410BBC91CE0
	for <lists+linux-mips@lfdr.de>; Fri, 28 Nov 2025 12:36:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF7933A6499
	for <lists+linux-mips@lfdr.de>; Fri, 28 Nov 2025 11:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6093C3093B8;
	Fri, 28 Nov 2025 11:36:33 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B56D168BD;
	Fri, 28 Nov 2025 11:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764329793; cv=none; b=n15/0ZpXPAHONrQa9/7ZopFK+YJSCqC2IKJ05lSNkZJsQsV8jSdb3k7CgSzIJhRKGlhDinfTJ9lqsuXtuy1gp4pPWCRlsRw/WOrHclJd7tlPOKmVly0RRShQar2Kx2hap6ICtXZXCdUJnAfT82G9hQboIdYmS1yEBVLA2+YzKho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764329793; c=relaxed/simple;
	bh=J+3r3lcldx1cvjmCqxhjji4xpIJl5BiY1yYDwhHBj2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rAI1/emsie69Tk5+/GHcm9B7/N1sb8wNZNV0s4gkw0QDFH9U6AqqeDCWNv1FW0NEcp4gGDuopwbaX4oBoxEPCrYncrRa6KSTtRuVFjljysaHfvUUVQcifpQdglbKrCCu8Tj/M49CHHS55UEpWTVTzUliCqze3xr2bt0aKKXrkD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vOwm4-0005X9-00; Fri, 28 Nov 2025 12:36:28 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 75E7FC0256; Fri, 28 Nov 2025 12:35:59 +0100 (CET)
Date: Fri, 28 Nov 2025 12:35:59 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
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
Subject: Re: [PATCH v4 6/7] MIPS: mobileye: eyeq5: add two Cadence GEM
 Ethernet controllers
Message-ID: <aSmJH7A7FfQ7Pfdo@alpha.franken.de>
References: <20251124-macb-phy-v4-0-955c625a81a7@bootlin.com>
 <20251124-macb-phy-v4-6-955c625a81a7@bootlin.com>
 <87y0nq4hd2.fsf@BLaptop.bootlin.com>
 <aSlxGFPP-oURLpPq@alpha.franken.de>
 <87v7iu4eob.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v7iu4eob.fsf@BLaptop.bootlin.com>

On Fri, Nov 28, 2025 at 11:47:16AM +0100, Gregory CLEMENT wrote:
> Thomas Bogendoerfer <tsbogend@alpha.franken.de> writes:
> 
> > On Fri, Nov 28, 2025 at 10:49:13AM +0100, Gregory CLEMENT wrote:
> >> Hello Thomas,
> >> 
> >> > Add both MACB/GEM instances found in the Mobileye EyeQ5 SoC.
> >> >
> >> > Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> >> 
> >> Can you confirm that you will include this patch and the following one
> >> in your mips-next branch?
> >
> > I haven't planned doing this.
> >
> >> As you gave your Acked-by on it, I believe this will be the case, but I
> >> want to be sure they aren't forgotten.
> >
> > the  Acked-by is meant for including the patches into the tree, where the
> > rest of this series is going in.
> 
> However, according to the cover letter, there are no build dependencies
> between these patches and the driver-related patch. Furthermore, since
> it introduces a new compatible string, even if the driver part is not
> yet merged, we won’t experience any regression. Therefore, I believe it
> is safe to merge these two patches unless you have any concerns about
> them.

no concerns, but aren't they useless without the code changes ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

