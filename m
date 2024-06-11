Return-Path: <linux-mips+bounces-3560-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A66F4903766
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 11:05:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98A0AB2D009
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 08:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5FE176237;
	Tue, 11 Jun 2024 08:49:13 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7339174EE4;
	Tue, 11 Jun 2024 08:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718095753; cv=none; b=ky1FlFOc5SceimSafshiSNbdGIeGAImdO0czrhfzLjypojyp+/cG7X+oGIVZCbdhsTnJ1OTqLMfcLEbKKE1Rhl034VJEyrn2AxBxy+BAULvOvJ38UPtcHdf7O9gNOefN8mzUSX8j+c7GLM8TNcXNXsrzI90G/+5NDM3AQmWh3P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718095753; c=relaxed/simple;
	bh=QFDtUcbFUqxfMhI1iWqTziSSZsRbXT9IPUS2qPxjXAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6mnOsgahNAcDDY6tDBmegGe1k1qGsrLC5pMJGqdlMNv5ME4ODSa4N1GqwP9GdaZT9AivDC0pt4oSyzaL0UpsCkB5AmrHMijmVmKIWBEa5bEWXkYflk6J3bvKRNb88OscqDtj8fMQCe6VUPj8mzr+ttC6LbCOIFEawc3bHz6oko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sGxBU-0000Nm-00; Tue, 11 Jun 2024 10:48:52 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 0FAC9C0A35; Tue, 11 Jun 2024 10:47:16 +0200 (CEST)
Date: Tue, 11 Jun 2024 10:47:16 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel =?iso-8859-1?Q?Gonz=E1lez?= Cabanelas <dgcbueu@gmail.com>,
	=?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Subject: Re: [PATCH v5 4/4] mips: bmips: enable RAC on BMIPS4350
Message-ID: <ZmgPFLSCxjed2EGZ@alpha.franken.de>
References: <20240511130349.23409-1-ansuelsmth@gmail.com>
 <20240511130349.23409-5-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240511130349.23409-5-ansuelsmth@gmail.com>

On Sat, May 11, 2024 at 03:03:48PM +0200, Christian Marangi wrote:
> From: Daniel González Cabanelas <dgcbueu@gmail.com>
> 
> The data RAC is left disabled by the bootloader in some SoCs, at least in
> the core it boots from.
> Enabling this feature increases the performance up to +30% depending on the
> task.
> 
> Signed-off-by: Daniel González Cabanelas <dgcbueu@gmail.com>
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> [ rework code and reduce code duplication ]
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  arch/mips/kernel/smp-bmips.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
> index 20e2fb10022d..52324738cbb3 100644
> --- a/arch/mips/kernel/smp-bmips.c
> +++ b/arch/mips/kernel/smp-bmips.c
> @@ -626,6 +626,23 @@ void bmips_cpu_setup(void)
>  		__raw_readl(cbr + BMIPS_RAC_ADDRESS_RANGE);
>  		break;
>  
> +	case CPU_BMIPS4350:
> +		u32 rac_addr = BMIPS_RAC_CONFIG_1;

my gcc 10.2.1 doesn't like the declaration here:

/local/tbogendoerfer/korg/linux/arch/mips/kernel/smp-bmips.c:630:3: error: a label can only be part of a statement and a declaration is not a statement
  630 |   u32 rac_addr = BMIPS_RAC_CONFIG_1;

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

