Return-Path: <linux-mips+bounces-12384-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4ADC96715
	for <lists+linux-mips@lfdr.de>; Mon, 01 Dec 2025 10:46:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C283F4E29D6
	for <lists+linux-mips@lfdr.de>; Mon,  1 Dec 2025 09:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF7D302CB0;
	Mon,  1 Dec 2025 09:45:08 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D3B3016E8;
	Mon,  1 Dec 2025 09:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764582308; cv=none; b=NZS2NWGjIpsAY9czXiZMCVrV8bSDeNXSCNn1i1eHn4rpVu8flJat+g1Ax82iQMAKjK+OXY6nZtnMM5o82fjac75mjvv0ERXGutzjrB7E0f5dIO7o64fPSvGEH5REdMl7rTxAR23KaDZoydUEuHH4SDKEA4AuhjI9Efk4zWfmoYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764582308; c=relaxed/simple;
	bh=gad9gMctkG6LMdjZ60iQSvdHjiUl9czGhkGCC/O9qUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fh9cHG+nJYY3TmR2q06ueYFVO/d+uGE31F3RSVPRP5Dj3xgJopxjXq5ybb0hlsC3gfTqJsRKgt1sK4Ao1vf7OiU+CyQghxKnMh2nM+ICaNrVz/HElmwJkNv7IM9tbvwgPEMDb3S3i0++iC5ojisYFkbyo/6K+pmAJsKTyWfHSOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vQ0Sm-0002fm-00; Mon, 01 Dec 2025 10:44:56 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 74162C0778; Mon,  1 Dec 2025 10:41:40 +0100 (CET)
Date: Mon, 1 Dec 2025 10:41:40 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: Remove __GFP_HIGHMEM masking
Message-ID: <aS1i1HrCrLhj_Gxx@alpha.franken.de>
References: <20251107232758.105850-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107232758.105850-1-vishal.moola@gmail.com>

On Fri, Nov 07, 2025 at 03:27:58PM -0800, Vishal Moola (Oracle) wrote:
> Remove unnecessary __GFP_HIGHMEM masking, which was introduced with
> commit 3e14fb19ad7c ("mips: convert various functions to use ptdescs").
> GFP_KERNEL doesn't contain __GFP_HIGHMEM.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  arch/mips/include/asm/pgalloc.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
> index 942af87f1cdd..7a04381efa0b 100644
> --- a/arch/mips/include/asm/pgalloc.h
> +++ b/arch/mips/include/asm/pgalloc.h
> @@ -81,8 +81,7 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
>  static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
>  {
>  	pud_t *pud;
> -	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL & ~__GFP_HIGHMEM,
> -			PUD_TABLE_ORDER);
> +	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, PUD_TABLE_ORDER);
>  
>  	if (!ptdesc)
>  		return NULL;
> -- 
> 2.51.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

