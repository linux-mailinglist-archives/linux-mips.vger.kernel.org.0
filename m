Return-Path: <linux-mips+bounces-4042-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8CE91D035
	for <lists+linux-mips@lfdr.de>; Sun, 30 Jun 2024 08:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB12FB2108A
	for <lists+linux-mips@lfdr.de>; Sun, 30 Jun 2024 06:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE9B39FE4;
	Sun, 30 Jun 2024 06:56:31 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB4B2837B;
	Sun, 30 Jun 2024 06:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719730591; cv=none; b=gR/w08RI4zfNN6VUONea0Hg8+hW/0XHwKU/BIZKhWhqhJvWiSwZ2+CgvUbN59aTZl8FPWYmrncFJJ7YX5YtmF69KeizXJ6LIQDgLmSTbudWNoWkGUK9798MStMYzuIZDLpBShhf9cVlbxZl04SVTn7L/3LMjoE5oxnsN0NlN55c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719730591; c=relaxed/simple;
	bh=blR4af+oJUOjmsjaK4tAkHlJHHKTe0N/YlteM2/+gdc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mTkasqj02MOeyj8PEGhWMBbuUuDdaiNzhjbcER27OoaPSTjoCcftBkYtdFPfSjqjJUHucMCNi6zxSB9+zuhSPdILClcKaIeG3EZH469U5am7qbRo+mSRsoNusTI2UiU9V9HULG1AMXsbbpQPSh0wDW2XVbfynEXIfYNZSBlXV0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id E52BE92009C; Sun, 30 Jun 2024 08:56:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id D7A9192009B;
	Sun, 30 Jun 2024 07:56:19 +0100 (BST)
Date: Sun, 30 Jun 2024 07:56:19 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Shiji Yang <yangshiji66@outlook.com>
cc: linux-mips@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Arnd Bergmann <arnd@arndb.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Javier Martinez Canillas <javierm@redhat.com>, 
    Khalid Aziz <khalid@gonehiking.org>, Baoquan He <bhe@redhat.com>, 
    Jiaxun Yang <jiaxun.yang@flygoat.com>, 
    Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org, 
    Mieczyslaw Nalewaj <namiltd@yahoo.com>
Subject: Re: [PATCH v3] mips: kernel: fix detect_memory_region() function
In-Reply-To: <TYCP286MB0895F65439037ED134FEA7DDBCD12@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <alpine.DEB.2.21.2406300615200.43454@angie.orcam.me.uk>
References: <TYCP286MB0895F65439037ED134FEA7DDBCD12@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 29 Jun 2024, Shiji Yang wrote:

> 1. Do not use memcmp() on unallocated memory, as the new introduced
>   fortify dynamic object size check[1] will return unexpected result.

 That seems like a bug in the check to me.  Why would `memcmp' referring 
to a location within the data section cause an unexpected result, forcing 
code to use an equivalent handcoded sequence?  This defeats the purpose of 
having possibly optimised code in `memcmp' for this.

> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 12a1a4ffb602..4197c7568f49 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -86,21 +86,26 @@ static struct resource bss_resource = { .name = "Kernel bss", };
>  unsigned long __kaslr_offset __ro_after_init;
>  EXPORT_SYMBOL(__kaslr_offset);
>  
> -static void *detect_magic __initdata = detect_memory_region;
> -
>  #ifdef CONFIG_MIPS_AUTO_PFN_OFFSET
>  unsigned long ARCH_PFN_OFFSET;
>  EXPORT_SYMBOL(ARCH_PFN_OFFSET);
>  #endif
>  
> +#define MIPS_MEM_TEST_PATTERN		0xaa5555aa
> +
>  void __init detect_memory_region(phys_addr_t start, phys_addr_t sz_min, phys_addr_t sz_max)
>  {
> -	void *dm = &detect_magic;
> +	u32 detect_magic;
> +	volatile u32 *dm = (volatile u32 *)CKSEG1ADDR_OR_64BIT(&detect_magic);
>  	phys_addr_t size;
>  
>  	for (size = sz_min; size < sz_max; size <<= 1) {
> -		if (!memcmp(dm, dm + size, sizeof(detect_magic)))
> -			break;
> +		*dm = MIPS_MEM_TEST_PATTERN;
> +		if (*dm == *(volatile u32 *)((void *)dm + size)) {
> +			*dm = ~MIPS_MEM_TEST_PATTERN;
> +			if (*dm == *(volatile u32 *)((void *)dm + size))

 Can't you just do *(dm + (size >> 2)) and avoid all the horrible casting?  
Or maybe even dm[0] == dm[size >> 2]?

> +				break;
> +		}
>  	}

 Anyway this code makes no sense to me, with or without the change.  What 
is it exactly supposed to peek at, the location of `detect_magic' plus 
some offset?

 What about the `start' parameter?  What is it for, given that it's not 
used in probing, but only for reporting and adding the memory region?  Is 
it not where probing is supposed to happen in the first place?

 I can see how `ath79_detect_mem_size' this mess has come from made some 
sense as in 9b75733b7b5e0^:arch/mips/ath79/setup.c -- a bit hackish, but 
the size of the probing window set to 1024 bytes combined with comparing 
against machine code from `ath79_detect_mem_size' made a false hit highly 
unlikely.  That sense has been lost since and your change partially fixes 
it by making a check against both the straight and the complemented value 
of a test pattern.  Good.

 But still that does not fix the issue with `start'.  Given how this code 
has been written I'm not even sure if it's suitable for nonzero `start' at 
all.  Or should the call to `memblock_add' just be adjusted accordingly:

	memblock_add(start, size - start);

?  This might make sense and if suitable, then it should be documented as 
the feature of `detect_memory_region' (as should probably be that it will 
round the amount of memory available down to the nearest power of two).

 Alternatively the code can start probing at `start', but then it'll have 
to be rewritten, because obviously `detect_magic' may not necessarily be 
above `start'.

  Maciej

