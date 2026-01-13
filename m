Return-Path: <linux-mips+bounces-12894-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3818D18B4A
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jan 2026 13:28:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFADC3030D95
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jan 2026 12:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C7B38F252;
	Tue, 13 Jan 2026 12:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=gaisler.com header.i=@gaisler.com header.b="NC76RtxI"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B203314DE;
	Tue, 13 Jan 2026 12:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.231.106.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768307303; cv=none; b=JNA+RLjS5Y8SZOBzhmSgH3Fy+wZwbHWQt//YzfZjR9tsQkbD5XHOh0zOCEFNQPJVSfNg9lMFCAo+YGzTSlO6AjLB73t2Xs1kZ7JFC1Hz+qVWGBTTt2Mn4lINIfATerFs2gUgUceF9ZlujHYK2jLHQA8ec1i2p7GcKqhiHuGu35U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768307303; c=relaxed/simple;
	bh=21w0GG0eda5bCVdiXvdOHRzVIFvjNUj4U9+O+neqMZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UY5Y1Gh9c1lzUpnzfUi9x4+9c7CsQBhRGyZmGT44Yg0Dr4G2+xqYlVA6Mjsnm5yOokth1FtvRnuyBu4bFV8uVFXv0DOwM6y/dTgWSvMlJce3Vh/nNOyuEIqLqaiPZ5zzSajU4yioFounomIUtC7WM3ZRecQDpkEIBdHeyH1oZ0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; spf=pass smtp.mailfrom=gaisler.com; dkim=fail (0-bit key) header.d=gaisler.com header.i=@gaisler.com header.b=NC76RtxI reason="key not found in DNS"; arc=none smtp.client-ip=94.231.106.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gaisler.com
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4dr7nT4CQCz1DR2r;
	Tue, 13 Jan 2026 13:28:13 +0100 (CET)
Received: from [192.168.0.25] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4dr7nQ25vMz1DDgf;
	Tue, 13 Jan 2026 13:28:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=simplycom2; t=1768307293;
	bh=guD8ZDnRvesT5KvXlXi5P5IpxaFCA5kIle2X5/2VdEk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NC76RtxIq9CvKMBZ8e8fqDdeh4TXwyvNkvf30sHXNOLOnEVZmRBj+bHCDi8FufU/c
	 kWfZWHOIxSWOKL03enthax76m8YsczdRizVAQDjKjHPFRaRl/L5Y0iqK2UA8boHs2h
	 YUuM9qT6Ba/QEyyAn4GTFzIGpGi10RKIEp9TlTeLGd8zC+Hr/coq6gBL6LosZXZTF1
	 gt8Mie1XHzB/bpnFnld9TZavLmhYmlgBWFsXaCVZw4vobFyvtSEkURaEmNJU94ewFm
	 w3pY4SkxqHFB/QXGBXfUllqNu8tQIWuZ/XTNBQs4TvEhLsgrM+Wzf2b59+1+UOXxo8
	 bJQ987lvmGGqA==
Message-ID: <7566eef3-bce4-4100-8a11-d88ef1e887a9@gaisler.com>
Date: Tue, 13 Jan 2026 13:28:09 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/29] sparc: introduce arch_zone_limits_init()
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Corbet <corbet@lwn.net>, Klara Modin <klarasmodin@gmail.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Ritesh Harjani <ritesh.list@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, x86@kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org
References: <20260111082105.290734-1-rppt@kernel.org>
 <20260111082105.290734-20-rppt@kernel.org>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <20260111082105.290734-20-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-01-11 09:20, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Move calculations of zone limits to a dedicated arch_zone_limits_init()
> function.
> 
> Later MM core will use this function as an architecture specific callback
> during nodes and zones initialization and thus there won't be a need to
> call free_area_init() from every architecture.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/sparc/mm/init_64.c |  6 ++++++
>  arch/sparc/mm/srmmu.c   | 12 ++++++++----
>  2 files changed, 14 insertions(+), 4 deletions(-)

Hi Mike,

Thanks for this nice cleanup series.


> diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
> index df9f7c444c39..fbaad449dfc9 100644
> --- a/arch/sparc/mm/init_64.c
> +++ b/arch/sparc/mm/init_64.c
> @@ -2279,6 +2279,11 @@ static void __init reduce_memory(phys_addr_t limit_ram)
>  	memblock_enforce_memory_limit(limit_ram);
>  }
>  
> +void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
> +{
> +	max_zone_pfns[ZONE_NORMAL] = last_valid_pfn;
> +}
> +
>  void __init paging_init(void)
>  {
>  	unsigned long end_pfn, shift, phys_base;
> @@ -2461,6 +2466,7 @@ void __init paging_init(void)
>  
>  		max_zone_pfns[ZONE_NORMAL] = end_pfn;

This old initialization of max_zone_pfns[ZONE_NORMAL] should also be
removed, right? With that removed it makes the local end_pfn variable
set but unused, so could you please also remove that one?

I know that this whole code block gets removed later, but the cleanup
max_zone_pfns[ZONE_NORMAL] and the removal of end_pfn (that is not done
later in this version of the series) fits logically in this patch.

>  
> +		arch_zone_limits_init(max_zone_pfns);
>  		free_area_init(max_zone_pfns);
>  	}
>  
> diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
> index f8fb4911d360..81e90151db90 100644
> --- a/arch/sparc/mm/srmmu.c
> +++ b/arch/sparc/mm/srmmu.c
> @@ -884,6 +884,13 @@ static void __init map_kernel(void)
>  
>  void (*poke_srmmu)(void) = NULL;
>  
> +void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
> +{
> +	max_zone_pfns[ZONE_DMA] = max_low_pfn;
> +	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
> +	max_zone_pfns[ZONE_HIGHMEM] = highend_pfn;
> +}
> +
>  void __init srmmu_paging_init(void)
>  {
>  	int i;
> @@ -967,10 +974,7 @@ void __init srmmu_paging_init(void)
>  	{
>  		unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
>  
> -		max_zone_pfn[ZONE_DMA] = max_low_pfn;
> -		max_zone_pfn[ZONE_NORMAL] = max_low_pfn;
> -		max_zone_pfn[ZONE_HIGHMEM] = highend_pfn;
> -
> +		arch_zone_limits_init(max_zone_pfn);
>  		free_area_init(max_zone_pfn);
>  	}
>  }

With the feedback for arch/sparc/mm/init_64.c addressed:

Acked-by: Andreas Larsson <andreas@gaisler.com>

Cheers,
Andreas


