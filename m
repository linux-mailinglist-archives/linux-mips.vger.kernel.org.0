Return-Path: <linux-mips+bounces-3559-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 917BD9036F7
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 10:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 338341F252DB
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 08:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85BAB17555C;
	Tue, 11 Jun 2024 08:49:12 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B72E9171E74;
	Tue, 11 Jun 2024 08:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718095752; cv=none; b=UuNdQkRmrDZOldIWtfknMGhp8uzwS42Yz0hDYbYF0eyoWByM7fiAKef4TClDjSxclxgDSGcvmZ4vAyXvD4W505P94KhTxQ0utQAGek0sW4FJGS8TCkHQ0ekYwGQGu9LZ+WwQhz4QjjqbduE7noErDsyRD06uHX4yyrDFAF5Hlig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718095752; c=relaxed/simple;
	bh=bhCKque7beYQO0j3fDOM4F/fSC8VkuX47NUftzng1xE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDO4/MNIdXrLFTliMwJKp21KRAI7NkZl34w62qJoCsrO0nuCacilfgbg6YZ7pOzjHLXLN+juNPa1zL5edt8R+OOyADPK/uDX7drMxxHpge+2E8hivw3ZgdZAR2KrrkMpHsuQOEpb3s45Np4BUHpPo5sEKtabyzr3Qgl5iPAFtB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sGxBU-0000Nk-00; Tue, 11 Jun 2024 10:48:52 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id D7606C07F6; Tue, 11 Jun 2024 10:45:37 +0200 (CEST)
Date: Tue, 11 Jun 2024 10:45:37 +0200
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] mips: bmips: rework and cache CBR addr handling
Message-ID: <ZmgOsZ+yvfOUDZoq@alpha.franken.de>
References: <20240511130349.23409-1-ansuelsmth@gmail.com>
 <20240511130349.23409-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240511130349.23409-2-ansuelsmth@gmail.com>

On Sat, May 11, 2024 at 03:03:45PM +0200, Christian Marangi wrote:
> diff --git a/arch/mips/bcm47xx/prom.c b/arch/mips/bcm47xx/prom.c
> index 99a1ba5394e0..49fe4c535161 100644
> --- a/arch/mips/bcm47xx/prom.c
> +++ b/arch/mips/bcm47xx/prom.c
> @@ -109,6 +109,8 @@ static __init void prom_init_mem(void)
>  
>  void __init prom_init(void)
>  {
> +	/* Cache CBR addr before CPU/DMA setup */
> +	bmips_cbr_addr = BMIPS_GET_CBR();
>  	prom_init_mem();
>  	setup_8250_early_printk_port(CKSEG1ADDR(BCM47XX_SERIAL_ADDR), 0, 0);
>  }

doesn't compile for me, probably missing and #include

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

