Return-Path: <linux-mips+bounces-4110-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E6A9264C2
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 17:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5306F1C21425
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 15:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFED717625D;
	Wed,  3 Jul 2024 15:24:55 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF94181319;
	Wed,  3 Jul 2024 15:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720020295; cv=none; b=lAlzX54T7DrKrR2z1i9UWCGssjvaccx4Iv5/3H7hI4xl7WlwI8ueiB2jrIPE3WFYB/rCbnGyL4MSqNCBVfPHeDTghUEQ9hDaQXmA6QYeL30JZ5+INfdU8mXd2T1Ys7MChatS64qbtzXKinpIReubqbLx7jH25pxwt5yFcpGRmBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720020295; c=relaxed/simple;
	bh=SDUShQ1tbUOslI0LcTwer3v9PI7e3+86m5hJM9hWDYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAsxsRiRTSUMv1t7IT/DeaLg3wb84V+OiOBXQNrJpYjtm/ApchApNH4i4BfC6Braryce4207PskgbZL78FJgZJo/41epFVygEsFQmL/yDmeQ5h0TSmd5jpkN5G+kTz8EVaVvkdWMHm9wLBFTENT4El4Ffp2GDKJfic9v/rU2b/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sP1qd-0000He-00; Wed, 03 Jul 2024 17:24:43 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 41B13C0411; Wed,  3 Jul 2024 17:19:14 +0200 (CEST)
Date: Wed, 3 Jul 2024 17:19:14 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Gr=E9gory?= Clement <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH 0/3] MIPS: Add Mobileye EyeQ OLB system-controller
Message-ID: <ZoVr8g3B7nUwRujO@alpha.franken.de>
References: <20240628-mbly-mips-v1-0-f53f5e4c422b@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240628-mbly-mips-v1-0-f53f5e4c422b@bootlin.com>

On Fri, Jun 28, 2024 at 06:11:49PM +0200, Théo Lebrun wrote:
> This is a new iteration on the Mobileye system-controller series [0].
> It has been split into separate series to facilitate merging.
> 
> This series contains a dt-bindings defining the system-controller
> (called OLB) used on EyeQ5, EyeQ6L and EyeQ6H. It then modifies the
> EyeQ5 devicetree to exploit that system-controller.
> 
> The last patch adds entries in MAINTAINERS for all related files. This
> is done in a single commit to avoid conflicts across trees.
> 
> Related series are targeted at clk [1], reset [2] and pinctrl [3].
> 
> Have a nice day,
> Théo
> 
> [0]: https://lore.kernel.org/lkml/20240620-mbly-olb-v3-0-5f29f8ca289c@bootlin.com/
> [1]: https://lore.kernel.org/lkml/20240628-mbly-clk-v1-0-edb1e29ea4c1@bootlin.com/
> [2]: https://lore.kernel.org/lkml/20240628-mbly-reset-v1-0-2a8294fd4392@bootlin.com/
> [3]: https://lore.kernel.org/lkml/20240628-mbly-pinctrl-v1-0-c878192d6b0a@bootlin.com/
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
> Changes since OLB v3 [0]:
>  - MAINTAINERS: Move changes into a separate commit to avoid merge
>    conflicts. This commit is in the present series.
>  - dt-bindings: Take Reviewed-by: Rob Herring.
> 
> ---
> Théo Lebrun (3):
>       dt-bindings: soc: mobileye: add EyeQ OLB system controller
>       MIPS: mobileye: eyeq5: add OLB system-controller node
>       MAINTAINERS: Mobileye: add OLB drivers and dt-bindings
> 
>  .../bindings/soc/mobileye/mobileye,eyeq5-olb.yaml  | 374 +++++++++++++++++++++
>  MAINTAINERS                                        |   5 +
>  .../{eyeq5-fixed-clocks.dtsi => eyeq5-clocks.dtsi} |  54 +--
>  arch/mips/boot/dts/mobileye/eyeq5-pins.dtsi        | 125 +++++++
>  arch/mips/boot/dts/mobileye/eyeq5.dtsi             |  22 +-
>  5 files changed, 541 insertions(+), 39 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

