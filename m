Return-Path: <linux-mips+bounces-8793-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85819A9E0BF
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 10:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F020164860
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 08:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9433248883;
	Sun, 27 Apr 2025 08:19:05 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F801E5B70;
	Sun, 27 Apr 2025 08:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745741945; cv=none; b=ui2Zm0ie+ZcJ1AaVneZMEbR29Pq6gH5ho/VlmXi2OY88nEUJuG1yjKVbFOK/um+vECdekwCqzcTiuYswu2HFylrUX+QeUuFSPlVuJUwCtoUJPTeJ391S5ZaXnyDlUIPmq58zNAc7WIpkggbZYavghDPGn78haoO8fZC9R0des+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745741945; c=relaxed/simple;
	bh=OjOVHRKl00qf7ebsaNQ7cBxmG2t6RRyVhkeJXzM0cok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kI7tSoVkSdeZDxNgCDdqBUR4uNkBJDgPrO0ZlPjFd1gwmmNOUP1jHdunR+gHkmiG1xDq3cbSDZ6uKRAquDucpBADOLkF/duTxggNSyK8qwSf1EGGKzp2TZmIQjJ/KKtb6T7txGgRzibGJ3NwQS366PTr+wFosBnAPh8v7oFNZHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1u8xE4-0007QP-00; Sun, 27 Apr 2025 10:19:00 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 76B29C01A2; Sun, 27 Apr 2025 10:03:32 +0200 (CEST)
Date: Sun, 27 Apr 2025 10:03:32 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Kees Cook <kees@kernel.org>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] mips: Add -std= flag specified in KBUILD_CFLAGS to
 vdso CFLAGS
Message-ID: <aA3k1MqAHzE76vpQ@alpha.franken.de>
References: <20250329153903.32963-1-raj.khem@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250329153903.32963-1-raj.khem@gmail.com>

On Sat, Mar 29, 2025 at 08:39:03AM -0700, Khem Raj wrote:
> GCC 15 changed the default C standard dialect from gnu17 to gnu23,
> which should not have impacted the kernel because it explicitly requests
> the gnu11 standard in the main Makefile. However, mips/vdso code uses
> its own CFLAGS without a '-std=' value, which break with this dialect
> change because of the kernel's own definitions of bool, false, and true
> conflicting with the C23 reserved keywords.
> 
>   include/linux/stddef.h:11:9: error: cannot use keyword 'false' as enumeration constant
>      11 |         false   = 0,
>         |         ^~~~~
>   include/linux/stddef.h:11:9: note: 'false' is a keyword with '-std=c23' onwards
>   include/linux/types.h:35:33: error: 'bool' cannot be defined via 'typedef'
>      35 | typedef _Bool                   bool;
>         |                                 ^~~~
>   include/linux/types.h:35:33: note: 'bool' is a keyword with '-std=c23' onwards
> 
> Add -std as specified in KBUILD_CFLAGS to the decompressor and purgatory
> CFLAGS to eliminate these errors and make the C standard version of these
> areas match the rest of the kernel.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: stable@vger.kernel.org
> ---
> v2: Filter the -std flag from KBUILD_CFLAGS instead of hardcoding
> v3: Adjust subject and commit message
> 
>  arch/mips/vdso/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
> index fb4c493aaffa..69d4593f64fe 100644
> --- a/arch/mips/vdso/Makefile
> +++ b/arch/mips/vdso/Makefile
> @@ -27,6 +27,7 @@ endif
>  # offsets.
>  cflags-vdso := $(ccflags-vdso) \
>  	$(filter -W%,$(filter-out -Wa$(comma)%,$(KBUILD_CFLAGS))) \
> +	$(filter -std=%,$(KBUILD_CFLAGS)) \
>  	-O3 -g -fPIC -fno-strict-aliasing -fno-common -fno-builtin -G 0 \
>  	-mrelax-pic-calls $(call cc-option, -mexplicit-relocs) \
>  	-fno-stack-protector -fno-jump-tables -DDISABLE_BRANCH_PROFILING \

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

