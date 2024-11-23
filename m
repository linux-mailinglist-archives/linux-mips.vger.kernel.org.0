Return-Path: <linux-mips+bounces-6789-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D858D9D68B5
	for <lists+linux-mips@lfdr.de>; Sat, 23 Nov 2024 12:05:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DD2E281D81
	for <lists+linux-mips@lfdr.de>; Sat, 23 Nov 2024 11:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC41199384;
	Sat, 23 Nov 2024 11:04:49 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B7617A5A4;
	Sat, 23 Nov 2024 11:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732359889; cv=none; b=Z3Z+OwEGuMabc1k6cxAHuJUMBLcMg2D2kMm4JDRTQXLTkWSpNKHoWOKH+9FFRB52JKVA/gjM6VmkSNhgUxtQvSnnMSRHu97F3CRqh3l3zIKeL6LDoMUNqiOnIKDufNYEj8hLNYg4j/8dWHhbobMb/hexXS9A9ketVOOY7tYtEc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732359889; c=relaxed/simple;
	bh=dgHM1gZZha8nibl7OCw9ZIf2IALe7GGVwhciE5uLXqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITnoTtsNRxXrre87xOnXfIBFMOVt+87zswo1tnnehJ4VUeb3tMFQh8ZQ8Qqv9FN+lXGxU3VJ0QYGnFzw2Z5f3KHp64h6aZo8VIcLd5K4f/NOmY4HU2yaRDHCfFtLXm5qmxXX0u5wTFkVh+IEcGwkvO7PQOjK5GReWW+giRhj9SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tEnw5-0005uo-00; Sat, 23 Nov 2024 12:04:21 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 1FB76C0142; Sat, 23 Nov 2024 12:03:00 +0100 (CET)
Date: Sat, 23 Nov 2024 12:03:00 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Gr=E9gory?= Clement <gregory.clement@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH v2 09/10] MIPS: mobileye: eyeq5: use OLB as provider for
 fixed factor clocks
Message-ID: <Z0G2ZBN35glUupWn@alpha.franken.de>
References: <20241106-mbly-clk-v2-0-84cfefb3f485@bootlin.com>
 <20241106-mbly-clk-v2-9-84cfefb3f485@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241106-mbly-clk-v2-9-84cfefb3f485@bootlin.com>

On Wed, Nov 06, 2024 at 05:04:00PM +0100, Théo Lebrun wrote:
> Change the structure of the clock tree: rather than individual
> devicetree nodes registering each fixed factor clock derived from OLB
> PLLs, have the OLB node provide the necessary clocks.
> 
> Remove eyeq5-clocks.dtsi and move the three remaining "fixed-clock"s to
> the main eyeq5.dtsi file.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  arch/mips/boot/dts/mobileye/eyeq5-clocks.dtsi | 270 --------------------------
>  arch/mips/boot/dts/mobileye/eyeq5.dtsi        |  30 ++-
>  2 files changed, 24 insertions(+), 276 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

