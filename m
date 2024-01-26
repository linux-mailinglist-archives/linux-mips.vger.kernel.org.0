Return-Path: <linux-mips+bounces-1170-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F80183D829
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jan 2024 11:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A242F1C2790E
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jan 2024 10:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361471CD39;
	Fri, 26 Jan 2024 10:16:05 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B81A1CD1C
	for <linux-mips@vger.kernel.org>; Fri, 26 Jan 2024 10:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706264165; cv=none; b=i58zFDPL/cMlBoHNiyTsIUfDg2LHgCzxmp5u2rc5bwvvWj/s/F7WEg+LT+4U0MOSz0tKWrQqxLWuf8HLEq7LLXenxj2EszEr45q7WiVCcFFTKAaw+C5ETS2pRfYPbI5Jzg/DjTEIWagF7ibMTOqERyqo8MzEtRb2rWiFWuEB7h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706264165; c=relaxed/simple;
	bh=vJJw3XH8OvfuV2OuartLbvJTnJafJ6IPpuPpK/dCTAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CmtKtq7r6QiN7YmZ2LUltAH//teYAjamrbi/4ToIarev+AMMDqRqzTT2dm8HmxV2CmIF8dBYLPAEMCntY/G+nBtnDam3Y2PAUzJGaTsm56NGl7Siu7dccX5Ppf3OLvV7u+AlFREywA7+k3oPXC4Q3fSPpOI+jqNq1aD1VLEe0ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rTJFY-0003wg-00; Fri, 26 Jan 2024 11:15:52 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id B635EC0489; Fri, 26 Jan 2024 11:12:12 +0100 (CET)
Date: Fri, 26 Jan 2024 11:12:12 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Huang Pei <huangpei@loongson.cn>
Cc: Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Burton <paulburton@kernel.org>,
	Li Xuefeng <lixuefeng@loongson.cn>,
	Yang Tiezhu <yangtiezhu@loongson.cn>,
	Gao Juxin <gaojuxin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 1/2] MIPS: reserve exception vector space ONLY ONCE
Message-ID: <ZbOFfA4nG6bQ/6WG@alpha.franken.de>
References: <ZZ29Wr9yfAcqGxrN@alpha.franken.de>
 <20240123014758.12718-1-huangpei@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240123014758.12718-1-huangpei@loongson.cn>

On Tue, Jan 23, 2024 at 09:47:57AM +0800, Huang Pei wrote:
> "cpu_probe" is called both by BP and APs, but reserving exception vector
> (like 0x0-0x1000) called by "cpu_probe" need once and calling on APs is
> too late since memblock is unavailable at that time.
> 
> So, reserve exception vector ONLY by BP.
> 
> Suggested-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> ---
>  arch/mips/kernel/traps.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> index 246c6a6b0261..5b778995d448 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -2007,7 +2007,13 @@ unsigned long vi_handlers[64];
>  
>  void reserve_exception_space(phys_addr_t addr, unsigned long size)
>  {
> -	memblock_reserve(addr, size);
> +	/*
> +	 * reserve exception space on CPUs other than CPU0
> +	 * is too late, since memblock is unavailable when APs
> +	 * up
> +	 */
> +	if (smp_processor_id() == 0)
> +		memblock_reserve(addr, size);
>  }
>  
>  void __init *set_except_vector(int n, void *addr)
> -- 
> 2.30.2

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

