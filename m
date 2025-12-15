Return-Path: <linux-mips+bounces-12476-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA99CBF394
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 18:25:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0204D301B2D1
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 17:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2242332EB1;
	Mon, 15 Dec 2025 17:18:39 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F737246782;
	Mon, 15 Dec 2025 17:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765819119; cv=none; b=ZM7xdsDYHCHrcJXqY7sfIxYh5c1PFvzVSw8XHk8wIMgdDDBpqDoxjhHr046laXlDPyX/rGGJf19L+nUXjDQ0YRNCmRezzrBO5Kn4hjBYVXwlqq81VV3Ee1hoAMZtRrxVH+Hmp+FSg6UncePJ6HXKD6YoP04kzZXI9yoJ82ePZp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765819119; c=relaxed/simple;
	bh=a4M4M+WX3HFlOjW5WL9d61ShPRntPw5N71BSN2iEQOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EC5gwo8Jtrsc9qCbsGvh+ByaxRdzXfHoCEFXQ1KPHnROh6sv8qEZ4dZpG8tcTWrc7btF7xTVNZf8WH9qHXMlaFhUmre6bhQuZ8u16SMwiGvDKhYeDexvwUHmZOHFEQN2TWxzk761P8CUa5yy3HgAU2skP5u8gx3db75pPEaWMIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vVCDQ-0007w0-00; Mon, 15 Dec 2025 18:18:32 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 9FB2DC0778; Mon, 15 Dec 2025 18:17:57 +0100 (CET)
Date: Mon, 15 Dec 2025 18:17:57 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Alchemy: Remove bogus static/inline specifiers
Message-ID: <aUBCxRk1DfJdhtDh@alpha.franken.de>
References: <20251029150316.2522555-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029150316.2522555-1-thierry.reding@gmail.com>

On Wed, Oct 29, 2025 at 04:03:16PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The recent io_remap_pfn_range() rework applied the static and inline
> specifiers to the implementation of io_remap_pfn_range_pfn() on MIPS
> Alchemy, mirroring the same change on other platforms. However, this
> function is defined in a source file and that definition causes a
> conflict with its declaration. Fix this by dropping the specifiers.
> 
> Fixes: 8efb51ad1b05 ("mm: abstract io_remap_pfn_range() based on PFN")
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/mips/alchemy/common/setup.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/mips/alchemy/common/setup.c b/arch/mips/alchemy/common/setup.c
> index c35b4f809d51..992134a8c23a 100644
> --- a/arch/mips/alchemy/common/setup.c
> +++ b/arch/mips/alchemy/common/setup.c
> @@ -94,8 +94,7 @@ phys_addr_t fixup_bigphys_addr(phys_addr_t phys_addr, phys_addr_t size)
>  	return phys_addr;
>  }
>  
> -static inline unsigned long io_remap_pfn_range_pfn(unsigned long pfn,
> -		unsigned long size)
> +unsigned long io_remap_pfn_range_pfn(unsigned long pfn, unsigned long size)
>  {
>  	phys_addr_t phys_addr = fixup_bigphys_addr(pfn << PAGE_SHIFT, size);
>  
> -- 
> 2.51.0

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

