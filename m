Return-Path: <linux-mips+bounces-471-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E54580238E
	for <lists+linux-mips@lfdr.de>; Sun,  3 Dec 2023 12:58:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF4FB280CF0
	for <lists+linux-mips@lfdr.de>; Sun,  3 Dec 2023 11:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708C3C148;
	Sun,  3 Dec 2023 11:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SUojLJ0D"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CD18F69
	for <linux-mips@vger.kernel.org>; Sun,  3 Dec 2023 11:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7623C433CA;
	Sun,  3 Dec 2023 11:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701604707;
	bh=pziQ1U7QdvFt6jazsNDQct2z9qMxwW1lVib4eO04oAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SUojLJ0D+hYzFpx4UrmEnt9hX3wdMqFvaPaScNdRJdBUkFxOK1TgiKTlQA2imiz1s
	 Skxn+cTAEJn+ljsDkSEMFy6RotyZEf1HHA+eExaEgkxR6pz74CYXB9ujxCIn52F6bb
	 EnmjraVq10aj62PL9SvsO/gowrBB7a1dSx5kbhdE6egTVL+10D8duPz3mFV3GtQtLI
	 dvdAxoXf2IXlKZXq4LV+TN9wB1Hrw4UD9xL6+ONRE7YxrMg11jPbRzh4x9d5lpsAUy
	 LV7TN9ebLHkYgrT6QIOORyT7xIYLG+w40wV+i5W9Lw+BSooqjNZRKsM2MJdJPMsZl6
	 7jI5bQTF5NFtQ==
Date: Sun, 3 Dec 2023 13:58:15 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/mm_init.c: Extend init unavailable range doc info
Message-ID: <20231203115815.GM636165@kernel.org>
References: <20231202111855.18392-1-fancer.lancer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231202111855.18392-1-fancer.lancer@gmail.com>

On Sat, Dec 02, 2023 at 02:18:52PM +0300, Serge Semin wrote:
> Besides of the already described reasons the pages backended memory holes
> might present due to having non-memory regions covered by the contiguous
> flatmem mapping. Add such note to the init_unavailable_range() method kdoc
> in order to point out to one more reason of having the function executed
> for such regions.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> 
> ---
> 
> Link: https://lore.kernel.org/linux-mips/20231122182419.30633-6-fancer.lancer@gmail.com/
> Changelog v2:
> - The holes in the memory are actually justified by having the flatmem
>   mapping model. Change the patch and the log accordingly. (@Mike)
> ---
>  mm/mm_init.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 077bfe393b5e..824bf53e8253 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -796,6 +796,7 @@ overlap_memmap_init(unsigned long zone, unsigned long *pfn)
>   * - physical memory bank size is not necessarily the exact multiple of the
>   *   arbitrary section size
>   * - early reserved memory may not be listed in memblock.memory
> + * - non-memory regions covered by the contigious flatmem mapping
>   * - memory layouts defined with memmap= kernel parameter may not align
>   *   nicely with memmap sections
>   *
> -- 
> 2.42.1
> 

-- 
Sincerely yours,
Mike.

