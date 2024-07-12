Return-Path: <linux-mips+bounces-4299-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2A492F981
	for <lists+linux-mips@lfdr.de>; Fri, 12 Jul 2024 13:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 454911C21A9E
	for <lists+linux-mips@lfdr.de>; Fri, 12 Jul 2024 11:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F0E7EF09;
	Fri, 12 Jul 2024 11:23:03 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E75A624
	for <linux-mips@vger.kernel.org>; Fri, 12 Jul 2024 11:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720783383; cv=none; b=VZYBk2KwiQbK/qnUP0tdJfFrARy5Kd92K0K+Kwye3T3vMUY3QC2y+N5jl77pmqqW6TQ20uKL4iKZUB3ZiOTH3FwTNA9ZWM3hTAcpOFt2bt4y6ktpDxQZZGp28WWjrixuq2jls7nVk1aIub1xuo6q5UVtg2C+b44cgGd7ipHB8Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720783383; c=relaxed/simple;
	bh=HpAXErJj+fUwlJrA5i+rHkjFbzP3tt6Tu8vcWpUH1Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vp9izU8rARA9jFqGRyIV05jf/33cUEhnSHunpI4Z1V+LQyqHTtBGTiY0u43bwjF9WWc8jjwQZR84DLjn8ancWSj9VsbkKlBGj6N9VMDw/cpxVxcBx+HuMMsD28t5YF1T5tMzYzd/EdeZ+u4edGDNrjlAhzM37DX02A/hzaU2wDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sSEMM-0003Fb-00; Fri, 12 Jul 2024 13:22:42 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 03E4FC0688; Fri, 12 Jul 2024 13:22:27 +0200 (CEST)
Date: Fri, 12 Jul 2024 13:22:26 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: john@phrozen.org, robh@kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: lantiq: improve USB initialization
Message-ID: <ZpER8nVqbu1agikT@alpha.franken.de>
References: <20240708222304.2728412-1-hauke@hauke-m.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708222304.2728412-1-hauke@hauke-m.de>

On Tue, Jul 09, 2024 at 12:23:04AM +0200, Hauke Mehrtens wrote:
> This adds code to initialize the USB controller and PHY also on Danube,
> Amazon SE and AR10. This code is based on the Vendor driver from
> different UGW versions and compared to the hardware documentation.
> 
> This patch is included in OpenWrt for many years.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  arch/mips/lantiq/xway/sysctrl.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/mips/lantiq/xway/sysctrl.c b/arch/mips/lantiq/xway/sysctrl.c
> index 3ed078225222..5a75283d17f1 100644
> --- a/arch/mips/lantiq/xway/sysctrl.c
> +++ b/arch/mips/lantiq/xway/sysctrl.c
> @@ -247,6 +247,25 @@ static void pmu_disable(struct clk *clk)
>  		pr_warn("deactivating PMU module failed!");
>  }
>  
> +static void usb_set_clock(void)
> +{
> +	unsigned int val = ltq_cgu_r32(ifccr);
> +
> +	if (of_machine_is_compatible("lantiq,ar10") ||
> +	    of_machine_is_compatible("lantiq,grx390")) {
> +		val &= ~0x03; /* XTAL divided by 3 */
> +	} else if (of_machine_is_compatible("lantiq,ar9") ||
> +		   of_machine_is_compatible("lantiq,vr9")) {
> +		/* TODO: this depends on the XTAL frequency */
> +		val |= 0x03; /* XTAL divided by 3 */
> +	} else if (of_machine_is_compatible("lantiq,ase")) {
> +		val |= 0x20; /* from XTAL */
> +	} else if (of_machine_is_compatible("lantiq,danube")) {
> +		val |= 0x30; /* 12 MHz, generated from 36 MHz */
> +	}
> +	ltq_cgu_w32(val, ifccr);
> +}
> +
>  /* the pci enable helper */
>  static int pci_enable(struct clk *clk)
>  {
> @@ -588,4 +607,5 @@ void __init ltq_soc_init(void)
>  		clkdev_add_pmu("1e116000.mei", "dfe", 1, 0, PMU_DFE);
>  		clkdev_add_pmu("1e100400.serial", NULL, 1, 0, PMU_ASC0);
>  	}
> +	usb_set_clock();
>  }
> -- 
> 2.45.2

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

