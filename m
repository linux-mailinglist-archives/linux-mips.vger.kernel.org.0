Return-Path: <linux-mips+bounces-1015-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC66832CFD
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jan 2024 17:15:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33C83281CDA
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jan 2024 16:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C3C554BFD;
	Fri, 19 Jan 2024 16:15:44 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358A652F61
	for <linux-mips@vger.kernel.org>; Fri, 19 Jan 2024 16:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705680944; cv=none; b=WL8QPXlJbvNm9k75L+3aDKboNW0X6NOyOepOB2vmUM8ZuimB+WJm4KByD8qg7hb7/WeOpnDTwIphzwmsivHN1W1a89sPygU/0srfr/L2UCILwG93QfRsuDQNTt50rTEK4jUdHdsOf0EHgQ92k/XLIQ2Fji/WKzyr2/ohWJ6MzD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705680944; c=relaxed/simple;
	bh=JwAzxbDsFJuDvPz4h3i1sXjzrIsdceZVJeTpvojZ5jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pz3mOTKjhPGXzKluaA1iVUO3K5lMSLYp1CL1jGTvMsp7OVdcdufRKnfeflJPt3GrfqwwFjvbT9WzpJOoAowrfVmKc65qhJ/LQbDMx+WT0g4Bau0o9EYpy6O16I3R5n46ZxiFuRIfZzLiHhIwgxp6XqctXRyUOa9FIcmJf9xAfeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rQrWk-00039x-00; Fri, 19 Jan 2024 17:15:30 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 2D0B1C0135; Fri, 19 Jan 2024 17:15:02 +0100 (CET)
Date: Fri, 19 Jan 2024 17:15:02 +0100
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
Message-ID: <ZaqgBugqaPLZTofT@alpha.franken.de>
References: <ZZ29Wr9yfAcqGxrN@alpha.franken.de>
 <20240119040240.392442-1-huangpei@loongson.cn>
 <20240119040240.392442-2-huangpei@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240119040240.392442-2-huangpei@loongson.cn>

On Fri, Jan 19, 2024 at 12:02:39PM +0800, Huang Pei wrote:
> "cpu_probe" is called both by BP and APs, but reserving exception vector
> (like 0x0-0x1000) called by "cpu_probe" need once and calling on BPs is
> too late since memblock is unavailable at that time.
> 
> So, reserve exception vector ONLY by BP.
> 
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> ---
>  arch/mips/kernel/cpu-probe.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index b406d8bfb15a..6939d0de2a03 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -1581,7 +1581,9 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
>  			__cpu_name[cpu] = "Broadcom BMIPS4380";
>  			set_elf_platform(cpu, "bmips4380");
>  			c->options |= MIPS_CPU_RIXI;
> -			reserve_exception_space(0x400, VECTORSPACING * 64);
> +			if (cpu == 0) {
> +				reserve_exception_space(0x400, VECTORSPACING * 64);
> +			}

why not do a 

if (smp_processor_id() == 0)
	memblock_reserve(...)
		
in reserve_exception_space() ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

