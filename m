Return-Path: <linux-mips+bounces-3752-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 548AE9108C8
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 16:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84B0F1C2134F
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 14:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352441AE877;
	Thu, 20 Jun 2024 14:46:02 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15ED1AC42B;
	Thu, 20 Jun 2024 14:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718894762; cv=none; b=g4B9oV6hue1XX+NDiesPEvu5Hu4sxRVGNJ2bkfU8w/cYYFdgfKdXpY2ScP/pHefp7GPEfmgo9OkYvDkbHPEAK652ovm96wAOKcaUIvwzsQAlqH+kFjAh3h6Bj2W4OIH8g0dttZLOes9Om5q9PWqhNtjYJUMCyCEK7BVqmQ28Fq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718894762; c=relaxed/simple;
	bh=9SWSdO9QAB7Azh3TzzyctLHLDP8tNGxckstEzvhXeyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjyqyf3b6tkOo/q+wPd2GjkrfXPxdKiHJhbol8sxGuDtzurIgjEWsdrmMYRVk503nhW3/X9hOadzagKi7NrEtQYEJOVfK8q2EcMRWOOeZHP2C/2I1I0YsOEzvvORaASTOrLgvpl8WZcDhoBMOoRTOdomZ/4tsufWoWLZx/kSXeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sKJ2m-0000tL-00; Thu, 20 Jun 2024 16:45:44 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id ED40EC031A; Thu, 20 Jun 2024 16:40:42 +0200 (CEST)
Date: Thu, 20 Jun 2024 16:40:42 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/5] mips: bmips: rework and cache CBR addr handling
Message-ID: <ZnQ/auhuPWb1SGjb@alpha.franken.de>
References: <20240611113538.9004-1-ansuelsmth@gmail.com>
 <20240611113538.9004-3-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611113538.9004-3-ansuelsmth@gmail.com>

On Tue, Jun 11, 2024 at 01:35:34PM +0200, Christian Marangi wrote:
> Rework the handling of the CBR address and cache it. This address
> doesn't change and can be cached instead of reading the register every
> time.
> 
> This is in preparation of permitting to tweak the CBR address in DT with
> broken SoC or bootloader.
> 
> bmips_cbr_addr is defined in smp-bmips.c to keep compatibility with
> legacy brcm47xx/brcm63xx and generic BMIPS target.
> 
> Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  arch/mips/bcm47xx/prom.c      | 3 +++
>  arch/mips/bcm63xx/prom.c      | 3 +++
>  arch/mips/bmips/dma.c         | 2 +-
>  arch/mips/bmips/setup.c       | 4 +++-
>  arch/mips/include/asm/bmips.h | 1 +
>  arch/mips/kernel/smp-bmips.c  | 6 ++++--
>  6 files changed, 15 insertions(+), 4 deletions(-)

still problems on a bcm47xx build:

mips64-linux-gnu-ld: arch/mips/bcm47xx/prom.o: in function `prom_init':
/local/tbogendoerfer/korg/linux/arch/mips/bcm47xx/prom.c:(.init.text+0x3c): undefined reference to `bmips_cbr_addr'
mips64-linux-gnu-ld: /local/tbogendoerfer/korg/linux/arch/mips/bcm47xx/prom.c:(.init.text+0x44): undefined reference to `bmips_cbr_addr'

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

