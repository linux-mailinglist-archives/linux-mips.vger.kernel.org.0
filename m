Return-Path: <linux-mips+bounces-205-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 252A57F5C23
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 11:19:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56E2F1C20C29
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 10:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E84224E0;
	Thu, 23 Nov 2023 10:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BfisG42w"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80D5224D7
	for <linux-mips@vger.kernel.org>; Thu, 23 Nov 2023 10:19:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E095FC433C7;
	Thu, 23 Nov 2023 10:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700734748;
	bh=BIsZoyFkGqybSMp8LsFEV/t0sEtZKTYGcLF/WgdEU8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BfisG42wNKSu3613Sr6vuiVrQghiiyZTRf7R1sFUOw1Oha90RgZu8eBFpTxci+zF1
	 agbbICZLrwQfHlza87s+C4NXEcoif+I8cE/Uql2TVYmm03S+sncf7anWPLPm9epCcW
	 b8NvfnciZgPu9yLK1bBbA7oWJfble2vM5hsF4SB1DIHmjv4XRW784yDrPu7L5vu7eA
	 rdFN0/essbPCun0V4WMDFBMNofYDMYllC1dWxjXHV0nS+4ZMoEdvncJ40jsOmz83pZ
	 A2YiFWVDVNq1DNhvUvopxNOLIIgwS91e6CfYOORHvJZi2r0qtc0dEDCJS1Tuwfggng
	 nrgAVeuDrFwnA==
Date: Thu, 23 Nov 2023 12:18:54 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
	Arnd Bergmann <arnd@arndb.de>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
	Chao-ying Fu <cfu@wavecomp.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Yinglu Yang <yangyinglu@loongson.cn>,
	Tiezhu Yang <yangtiezhu@loongson.cn>, Marc Zyngier <maz@kernel.org>,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] mm/mm_init.c: Extend init unavailable range doc info
Message-ID: <20231123101854.GF636165@kernel.org>
References: <20231122182419.30633-1-fancer.lancer@gmail.com>
 <20231122182419.30633-6-fancer.lancer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122182419.30633-6-fancer.lancer@gmail.com>

Hi Serge,

On Wed, Nov 22, 2023 at 09:24:03PM +0300, Serge Semin wrote:
> Besides of the already described reasons the pages backended memory holes
> might be persistent due to having memory mapped IO spaces behind those
> ranges in the framework of flatmem kernel config. Add such note to the
> init_unavailable_range() method kdoc in order to point out to one more
> reason of having the function executed for such regions.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> 
> ---
> 
> Please let me know if the IO-space pages must be initialized somehow
> differently rather relying on free_area_init() executing the
> init_unavailable_range() method.

Maybe I'm missing something, but why do you need struct pages in the
IO space?

> ---
>  mm/mm_init.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 077bfe393b5e..3fa33e2d32ba 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -796,6 +796,7 @@ overlap_memmap_init(unsigned long zone, unsigned long *pfn)
>   * - physical memory bank size is not necessarily the exact multiple of the
>   *   arbitrary section size
>   * - early reserved memory may not be listed in memblock.memory
> + * - memory mapped IO space
>   * - memory layouts defined with memmap= kernel parameter may not align
>   *   nicely with memmap sections
>   *
> -- 
> 2.42.1
> 

-- 
Sincerely yours,
Mike.

