Return-Path: <linux-mips+bounces-6790-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0258B9D68BB
	for <lists+linux-mips@lfdr.de>; Sat, 23 Nov 2024 12:05:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 990D11614FD
	for <lists+linux-mips@lfdr.de>; Sat, 23 Nov 2024 11:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293DA1A01BE;
	Sat, 23 Nov 2024 11:04:51 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1BC517BEC6;
	Sat, 23 Nov 2024 11:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732359891; cv=none; b=GMQomEauNJgNe/uW9izsHPt6gsnP8zm8prYbWAPiO0xCShcXKVFdulPaRpZFLYGsTFhUpdg1Z7Nm9VGmjh4Eq6JDYwUD1Apex+f8qPdDejA6G3G/GyzoV8xBKp+ZsWE/1jjH9p83iTA5W34n52G/OGVLRF21p/SBLL+n+C8Mxi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732359891; c=relaxed/simple;
	bh=Elm+niio9h7GNaF7Xxw+3uHvlJT9oLEOJ3APoNVr5pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVLl9gqHxCZSOE0Et1/9nCsoFVAnZd6K2EfNkO67kjcSILPQ63IoMK9MultI97i+JJcNI2v07tIpEyIec1tasTUy0cppN7IiDdewYIGXCqZ4izvV3WV6v47WGf0S1vt/jDtYAzbzhdT7hrimPK1VQWhhzZebGsw+m/LJG4rOj6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tEnw5-0005uk-00; Sat, 23 Nov 2024 12:04:21 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 67E34C014D; Sat, 23 Nov 2024 12:03:18 +0100 (CET)
Date: Sat, 23 Nov 2024 12:03:18 +0100
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
Subject: Re: [PATCH v2 10/10] MIPS: mobileye: eyeq6h: add OLB nodes OLB and
 remove fixed clocks
Message-ID: <Z0G2drN8kxjlsDwM@alpha.franken.de>
References: <20241106-mbly-clk-v2-0-84cfefb3f485@bootlin.com>
 <20241106-mbly-clk-v2-10-84cfefb3f485@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241106-mbly-clk-v2-10-84cfefb3f485@bootlin.com>

On Wed, Nov 06, 2024 at 05:04:01PM +0100, Théo Lebrun wrote:
> Change the declaration of clocks: remove all fixed clocks and declare
> system-controllers (OLB) as clock providers.
> 
> Remove eyeq6h-fixed-clocks.dtsi and move the crystal clock to the main
> eyeq6h.dtsi file.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  .../boot/dts/mobileye/eyeq6h-fixed-clocks.dtsi     | 52 ---------------
>  arch/mips/boot/dts/mobileye/eyeq6h.dtsi            | 73 ++++++++++++++++++++--
>  2 files changed, 69 insertions(+), 56 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

