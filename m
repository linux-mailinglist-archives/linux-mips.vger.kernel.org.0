Return-Path: <linux-mips+bounces-10610-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 864F6B35EBA
	for <lists+linux-mips@lfdr.de>; Tue, 26 Aug 2025 14:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A1E1361908
	for <lists+linux-mips@lfdr.de>; Tue, 26 Aug 2025 11:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F80529BDB8;
	Tue, 26 Aug 2025 11:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ubPX1amN"
X-Original-To: linux-mips@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F939286D57;
	Tue, 26 Aug 2025 11:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756209121; cv=none; b=aM8TeZCSB1syPmY8M7QwuaKbFWVzHxsYGb0kJCwfjeJhshjQpWTdU0H6fBpf0vYZ9VLkndcspU5sYMcF7QJ5KWoCNPYOtcPN2mWnia4OYKyoTYY4l+Iev0uD0E8KU1ciaDRf2EyRAyLfD0QoIXI9Ag7jYkXmDwsq1d96+hNtw1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756209121; c=relaxed/simple;
	bh=ZSeR+xDmWnuglFSrG20AI4myAYDMAl0a9GSppGLrSqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+i+nFO/7cp4rjxweWJh1XOIUk94Ns1T1rrjSEsFkAzmOxBOV4ON2t/yBSRtUW/ypaz/QUKh3PqGD5g0Is9oaap2Jni7XvOQ0mHhstbMt+hh1PG1xGjrhvOolxHnenJlY8UysRhwQHpos5MfdB7n8J4YBETHued5xIZCUtTjo6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ubPX1amN; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aeWcMmtGU27RiHkVsjvjCiSraFzVxUlIfCo0EiMxcYM=; b=ubPX1amNhC4glLCYSkxvTZRMGh
	2ejzDNTCZnSvAvHTGCOuOeFQRXn6WZlN8JL3/MGsZ5/TMxw6L0GD5RqTUvaUqzAePjDQEbZoVHKHN
	Qci7j9Ami1xdSxgfH9UP4Sqx+xA+CbCpOxI7TbmbQ4TpvAPlGdjrrdyY2gF4ykvnA3TGmUk7DsXHp
	k8UB0Aq5gNKiHgZs96g9XLIOR4hYWLDRZKYu7tNTpswfhYsv3oH9NQadIFT2Ic9K/CzyMW5LHuFK7
	9e8+IV7w8XkmuYbdED/sHqpW2NwuKC8LLAZZ+nWC9UOaMibByUV86DbWECpW4Z2+kL+SXdX+48mFd
	72n0RTNg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqsDU-00000000wNi-2iwA;
	Tue, 26 Aug 2025 11:51:56 +0000
Date: Tue, 26 Aug 2025 12:51:56 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Nicola Vetrini <nicola.vetrini@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	regressions@lists.linux.dev, tsbogend@alpha.franken.de,
	anders.roxell@linaro.org, naresh.kamboju@linaro.org
Subject: Re: [PATCH] mips: fix compilation error
Message-ID: <aK2f3C9bT-cvPR87@casper.infradead.org>
References: <20250825214245.1838158-1-nicola.vetrini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250825214245.1838158-1-nicola.vetrini@gmail.com>

On Mon, Aug 25, 2025 at 11:42:45PM +0200, Nicola Vetrini wrote:
> The following build error occurs on a mips build configuration
> (32r2el_defconfig and similar ones)
> ./arch/mips/include/asm/cacheflush.h:42:34: error: passing argument 2 of ‘set_bit’
> from incompatible pointer type [-Werror=incompatible-pointer-types]
>    42 |         set_bit(PG_dcache_dirty, &(folio)->flags)
>       |                                  ^~~~~~~~~~~~~~~
>       |                                  |
>       |                                  memdesc_flags_t *
> 
> This is due to changes introduced by
> commit 30f45bf18d55 ("mm: introduce memdesc_flags_t"), which did not update
> these usage sites.
> 
> Link: https://lore.kernel.org/lkml/CA+G9fYvkpmqGr6wjBNHY=dRp71PLCoi2341JxOudi60yqaeUdg@mail.gmail.com/
> Fixes: 30f45bf18d55 ("mm: introduce memdesc_flags_t")
> Signed-off-by: Nicola Vetrini <nicola.vetrini@gmail.com>
> ---
> First time sending a Linux patch, so I may have gotten some part of
> it wrong.

Well, Naresh was the one who got it wrong BY NOT CCing THE AUTHOR
OF THE PATCH THAT IT WAS BISECTED TO.  Honestly, Naresh, do better.
syzbot manages this, and it's a shell script.

Anyway, this can just be fixed up as the patch is still in mm-new.
Andrew, please apply.

> Bisection was done at the provided link.
> ---
>  arch/mips/include/asm/cacheflush.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/mips/include/asm/cacheflush.h b/arch/mips/include/asm/cacheflush.h
> index 1f14132b3fc9..5d283ef89d90 100644
> --- a/arch/mips/include/asm/cacheflush.h
> +++ b/arch/mips/include/asm/cacheflush.h
> @@ -37,11 +37,11 @@
>  #define PG_dcache_dirty			PG_arch_1
>  
>  #define folio_test_dcache_dirty(folio)		\
> -	test_bit(PG_dcache_dirty, &(folio)->flags)
> +	test_bit(PG_dcache_dirty, &(folio)->flags.f)
>  #define folio_set_dcache_dirty(folio)	\
> -	set_bit(PG_dcache_dirty, &(folio)->flags)
> +	set_bit(PG_dcache_dirty, &(folio)->flags.f)
>  #define folio_clear_dcache_dirty(folio)	\
> -	clear_bit(PG_dcache_dirty, &(folio)->flags)
> +	clear_bit(PG_dcache_dirty, &(folio)->flags.f)
>  
>  extern void (*flush_cache_all)(void);
>  extern void (*__flush_cache_all)(void);
> 
> base-commit: 6c68f4c0a147c025ae0b25fab688c7c47964a02f
> -- 
> 2.43.0
> 

