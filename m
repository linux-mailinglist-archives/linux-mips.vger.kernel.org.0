Return-Path: <linux-mips+bounces-12369-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9842FC9186C
	for <lists+linux-mips@lfdr.de>; Fri, 28 Nov 2025 10:54:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BEAC3AA7DB
	for <lists+linux-mips@lfdr.de>; Fri, 28 Nov 2025 09:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CCC4306498;
	Fri, 28 Nov 2025 09:54:15 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC682FD671;
	Fri, 28 Nov 2025 09:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764323655; cv=none; b=chRIgVep5pCxQfaKH6NSbDCCKpkX8DPxZc4mm281F7vckPtYzZ66exrdm34z9IVxpmPxpj3DEGc331YWyCUL3dvja4JLV2aVXa797KJJX5pGekIoq7IPldSpOsJRIgav/lrL/HID91Q2pCrnjFPFD7rRpW0+HcQapJx/i8z3COo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764323655; c=relaxed/simple;
	bh=JH/R9UTyYsWPZ6IBn4L2XBPs5mBDgr6w0IJ2t3YRhig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FzCKbL+nhd8t3V2eq7dsxfbGsttV1SgNa1Kk/PCZheloFV84J7QJwe0HY0UfZS0OWbumrGQklniohZQVHcX96yxwkSX5Rbo4BOX872KYGane+LosWwaJRwK9iX7AcH1Qrgboy+tb1DR+YhQ1w9oJtiTPTXeIC3Fb+rbyOgeFY6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vOvAv-0004i5-00; Fri, 28 Nov 2025 10:54:01 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 777D6C0256; Fri, 28 Nov 2025 10:53:28 +0100 (CET)
Date: Fri, 28 Nov 2025 10:53:28 +0100
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
Message-ID: <aSlxGFPP-oURLpPq@alpha.franken.de>
References: <20251124-macb-phy-v4-0-955c625a81a7@bootlin.com>
 <20251124-macb-phy-v4-6-955c625a81a7@bootlin.com>
 <87y0nq4hd2.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y0nq4hd2.fsf@BLaptop.bootlin.com>

On Fri, Nov 28, 2025 at 10:49:13AM +0100, Gregory CLEMENT wrote:
> Hello Thomas,
> 
> > Add both MACB/GEM instances found in the Mobileye EyeQ5 SoC.
> >
> > Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> 
> Can you confirm that you will include this patch and the following one
> in your mips-next branch?

I haven't planned doing this.

> As you gave your Acked-by on it, I believe this will be the case, but I
> want to be sure they aren't forgotten.

the  Acked-by is meant for including the patches into the tree, where the
rest of this series is going in.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

