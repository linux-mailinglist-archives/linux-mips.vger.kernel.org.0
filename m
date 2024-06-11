Return-Path: <linux-mips+bounces-3561-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B03B59036FD
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 10:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB26D1C209A1
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 08:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E49517625A;
	Tue, 11 Jun 2024 08:49:14 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B737D174EEB;
	Tue, 11 Jun 2024 08:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718095754; cv=none; b=M4aVGEOXbRx2/HKL6Dg7VU0BOhIVNNP3nqvO6WjCyylWI6OQ5VZW6h/ubiefy3nKQw6JETiTvALw7+Io4rBXkf6rqeMkMDMLYFdH2LisbmBx02WOB9csv69XVkzV2O9Jz3qV181wxVNR7uOvB83GzjQC87J/MWi3g6UGNgJJRU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718095754; c=relaxed/simple;
	bh=VzGR99xlpFa3GaomhkvJhiym98T4Eg8GZP1oS+rOTyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQ3nXTWgx1xa9CyzZ92mxl+/s8FiS86LEPoMqJ8n295CHBr3ssJexM1ix2Dvbfj2qI6S8EwhBvmY+VQXr4XvsQQRoNAhJaylokpaQH7Ney9G+2AFOgA9N074rqPd2C+s1vaBtI8evwjd1tORPmX8bO8KaE2mauLkV45BAEVwhaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sGxBU-0000Ni-00; Tue, 11 Jun 2024 10:48:52 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 5457EC031A; Tue, 11 Jun 2024 10:44:16 +0200 (CEST)
Date: Tue, 11 Jun 2024 10:44:16 +0200
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
Message-ID: <ZmgOYI8Mj86PIart@alpha.franken.de>
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
> diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
> index 66a8ba19c287..dba789ec75b3 100644
> --- a/arch/mips/bmips/setup.c
> +++ b/arch/mips/bmips/setup.c
> @@ -111,7 +111,7 @@ static void bcm6358_quirks(void)
>  	 * because the bootloader is not initializing it properly.
>  	 */
>  	bmips_rac_flush_disable = !!(read_c0_brcm_cmt_local() & (1 << 31)) ||
> -				  !!BMIPS_GET_CBR();
> +				  !!bmips_cbr_addr;

this hunk doesn't apply to mips-next, please respin.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

