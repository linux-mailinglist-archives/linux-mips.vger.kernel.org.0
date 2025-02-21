Return-Path: <linux-mips+bounces-7893-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A99A3F8F9
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 16:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD3AB7A45A7
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 15:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF211DDA1E;
	Fri, 21 Feb 2025 15:37:18 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216471B2182;
	Fri, 21 Feb 2025 15:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740152238; cv=none; b=mn64WmIjZ0jefh4AS1u+PQxCml/sBThxuOlZgJ8cxkS6OEctr08P4q5VTfOzeeKDVBKkvV8be9n5xMpIT/Vod6CKJKMbSHSGNz/7a5pefhHjUmEnDxnJtbmTjd1qKBe7QxeCpZIG6sNNNlcQtIghhtXyKj7eBjTd/EgNPuSESuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740152238; c=relaxed/simple;
	bh=sQl+NDH4ucP23zlzdeyljU809ENGdXus6bFkv3gGXLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oXxnxC9KqwlyJgSdhvRTMeo5AT5ZWRY+kLFCjLc3yCXld3m98LJWYgqUREKh8rcuYDWS3JtLACsfffNDwaQ4n51dR7cJUXt9KvQyP8X/ZhljdARENnNuex2IIfHVRJScD1iHUnSnEVzgf4BPjlEGYpYuwd9/oK8EV/CvCcgluzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tlV5S-0001AM-00; Fri, 21 Feb 2025 16:37:10 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 4C698C0135; Fri, 21 Feb 2025 16:27:25 +0100 (CET)
Date: Fri, 21 Feb 2025 16:27:25 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Sander Vanheule <sander@svanheule.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/9] mips: dts: Split Realtek devicetrees
Message-ID: <Z7ibXewhvwU1d1G3@alpha.franken.de>
References: <20250119183424.259353-1-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250119183424.259353-1-sander@svanheule.net>

On Sun, Jan 19, 2025 at 07:34:15PM +0100, Sander Vanheule wrote:
> This patch series intends to clean up the base includes, shared between
> hardware devicetrees. To get rid of some dtbs_check warnings, some cpu
> clock prorerties are also modified.
> 
> To indicate why the split-up is required, the series concludes with
> adding some CPU peripherals to rtl838x.dtsi, which are then used to add
> a gpio-restart for the Cisco SG220-26P.
> 
> Sander Vanheule (9):
>   mips: dts: realtek: Decouple RTL930x base DTSI
>   mips: dts: realtek: Clean up CPU clocks
>   mips: dts: realtek: Add address to SoC node name
>   mips: dts: realtek: Fold rtl83xx into rtl838x
>   mips: dts: realtek: Add SoC IRQ node for RTL838x
>   mips: dts: realtek: Correct uart interrupt-parent
>   mips: dts: realtek: Replace uart clock property
>   mips: dts: realtek: Add RTL838x SoC peripherals
>   mips: dts: realtek: Add restart to Cisco SG220-26P
> 
>  arch/mips/boot/dts/realtek/cisco_sg220-26.dts |  10 +-
>  arch/mips/boot/dts/realtek/rtl838x.dtsi       | 111 +++++++++++++-
>  arch/mips/boot/dts/realtek/rtl83xx.dtsi       |  59 --------
>  arch/mips/boot/dts/realtek/rtl930x.dtsi       | 136 +++++++++++-------
>  4 files changed, 202 insertions(+), 114 deletions(-)
>  delete mode 100644 arch/mips/boot/dts/realtek/rtl83xx.dtsi

series applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

