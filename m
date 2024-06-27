Return-Path: <linux-mips+bounces-3982-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 097DD91A21B
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 11:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39E7A1C21698
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 09:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA4F13777E;
	Thu, 27 Jun 2024 09:02:46 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0571386D1;
	Thu, 27 Jun 2024 09:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719478966; cv=none; b=uCXpn85hMZNb/jb/KLW1U1RJ8I95v4tzz9rdn0TLGSwZt+EZrkbekxWIjzRNOa4anIusSuKcGzmh3K7xN2BV/7nbjKvf85fAmv84yepUFnwx574Hkqi3+QR6gXKLUbALYyBC5hZZcsz+Da/cLPVU1k7W+SSWbGX0bcXnU0YVbjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719478966; c=relaxed/simple;
	bh=BYinFI9Yc/ToOx7KoWT43cxkkp0FbG/qTn0QT7Q6Nu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UUarUg87SdQFsgQo13Y6e+TQpUgmKD0ZZIHdsntge4YkJBEQFUZ/vt1bczBRSaAJ9Rz7czXoNgA0y/Yb7aSaaLoW2iTc/WXdC4ExHR6s5CqPxq9KPxE0VNUejGJp14qtDCz9W3axdYQ4kpifwPrZenHCbS3NHdfpenwSdSTJuOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sMl1G-0002g2-00; Thu, 27 Jun 2024 11:02:18 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 468FEC0411; Thu, 27 Jun 2024 11:01:02 +0200 (CEST)
Date: Thu, 27 Jun 2024 11:01:02 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/4] mips: bmips: improve handling of RAC and CBR addr
Message-ID: <Zn0qTnESrqlTy5wL@alpha.franken.de>
References: <20240620152649.994-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240620152649.994-1-ansuelsmth@gmail.com>

On Thu, Jun 20, 2024 at 05:26:41PM +0200, Christian Marangi wrote:
> Hi,
> 
> this simple series improve handling of RAC and CBR address and try to
> upstream these simple patch we have in OpenWrt for a while.
> 
> The first patch fix a straight kernel panic where some Bootloader might
> enable RAC but misconfigure the CBR address. The current logic only
> check if RAC is enabled but doesn't verify if the CBR address is usable.
> 
> The DMA sync function cause a kernel panic for invalid write. (as CBR is
> 0 or something like 0xa)
> 
> The second is preparation for making the CBR address configurable in DT.
> Since this address doesn't change, we can cache it and reference it with
> a local variable instead of calling the register to access the value.
> 
> The 4th patch make it configurable with 2 DT property, one to actually
> set the reg and the other to force set it.
> 
> The first property is used when CBR is set to 0. The second property is
> to force it if the Bootloader sets it to something wrong.
> 
> If the CBR value is not 0 and is not forced with the second property a
> WARN is printed and the DT value is ignored.
> 
> The 4th patch enable RAC on BMIPS4350.
> 
> These has been tested on BCM6358 (HG556a) and BCM6368 (VH4032N) and
> reported correct functionality.
> 
> Changes v8:
> - Drop fix patch (applied to mips-fixes)
> - Rework CBR cache patch to handle bcm47xx not compiling smp-bmips.c
> Changes v7:
> - Add ACK and Reviewed-by tag for dt patch from v5
> Changes v6:
> - Add missing patch that got lost in v5
> - Fix missing header for legacy bcm47xx
> - Fix compilation error with gcc 10.2.1
> Changes v5:
> - Add Ack tags
> - Improve DT descriptions as suggested by Conor
> Changes v4:
> - Fix compilation error with legacy brcm target
> - Improve property description in DT commit (give
>   CBR meaning and drop reference to linux functions)
> - Use only __read_mostly as we can't add variable to
>   multiple data sections
> - In patch 4 use local cbr variable instead of global
>   one.
> Changes v3:
> - Drop broken-cbr-reg property
> - Fix anyOf+const with enum
> Changes v2:
> - Prefix brcm vendor in the added property
> - Drop last patch (cpu switch from DMA sync)
> - Validate CBR addr from DT to be outside DRAM
> - Reduce indentation in DT CBR check
> - Reduce delta and use local variable for CBR where possible
> - Fix and improve typo and spelling mistake
> - Use 0xf instead of 0xa for BCM6358 RAC enable
> 
> Christian Marangi (3):
>   mips: bmips: rework and cache CBR addr handling
>   dt-bindings: mips: brcm: Document brcm,bmips-cbr-reg property
>   mips: bmips: setup: make CBR address configurable
> 
> Daniel González Cabanelas (1):
>   mips: bmips: enable RAC on BMIPS4350
> 
>  .../devicetree/bindings/mips/brcm/soc.yaml    | 24 +++++++++++++
>  arch/mips/bcm47xx/prom.c                      |  3 ++
>  arch/mips/bcm47xx/setup.c                     |  8 +++++
>  arch/mips/bcm63xx/prom.c                      |  3 ++
>  arch/mips/bcm63xx/setup.c                     |  8 +++++
>  arch/mips/bmips/dma.c                         |  2 +-
>  arch/mips/bmips/setup.c                       | 35 +++++++++++++++++--
>  arch/mips/include/asm/bmips.h                 |  1 +
>  arch/mips/kernel/smp-bmips.c                  | 22 ++++++++++--
>  9 files changed, 101 insertions(+), 5 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

