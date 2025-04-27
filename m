Return-Path: <linux-mips+bounces-8801-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E608A9E12E
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 10:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 263283BC9BB
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 08:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D5D2512CA;
	Sun, 27 Apr 2025 08:48:43 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C9C250C0D;
	Sun, 27 Apr 2025 08:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745743723; cv=none; b=Bd/GycNsSYOyPxdM6PoDUWVXTL9WjGRANPV+s43gllUkwagI3wJswFpbnrjq6whEVbrOpNewRG7aSZuN6o+ClYcSfRWgnTcaWNHFUeZVUKOYfnlexv7gG3DFo8WKdj7r25h4NWfnZ+7Nt5NtopDufn1QSgO4Rw+Vjz6c1U96O+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745743723; c=relaxed/simple;
	bh=/kJSaWF/woN2yDR3Z9E5PVppXUY4wvCfcqDwftHVjCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cvnjlv76hoxQISmw3/1JyGBr7RqO+1SIqMVS7vxRd8vqOOd1Wh7JiqQ6d/UiaB+WtLSk3wgW0bSxzOez44NdNl2yAj0hnzT3ETsE9xYs8xKoiOOsFKn0NrhPGQuMJgZ32bcstqDPu05/5ju8ttM6YNY+hm5OlG421G2BHR6fqxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1u8wsd-0007Ko-00; Sun, 27 Apr 2025 09:56:51 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A6169C0B39; Sun, 27 Apr 2025 09:56:19 +0200 (CEST)
Date: Sun, 27 Apr 2025 09:56:19 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-hardening@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Replace strcpy() with strscpy() in vpe_elfload()
Message-ID: <aA3jI7dlNJZ1pTsG@alpha.franken.de>
References: <20250425074651.1362-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425074651.1362-2-thorsten.blum@linux.dev>

On Fri, Apr 25, 2025 at 09:46:48AM +0200, Thorsten Blum wrote:
> strcpy() is deprecated; use strscpy() instead.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/mips/kernel/vpe.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/kernel/vpe.c b/arch/mips/kernel/vpe.c
> index 737d0d4fdcd3..2b67c44adab9 100644
> --- a/arch/mips/kernel/vpe.c
> +++ b/arch/mips/kernel/vpe.c
> @@ -22,6 +22,7 @@
>  #include <linux/vmalloc.h>
>  #include <linux/elf.h>
>  #include <linux/seq_file.h>
> +#include <linux/string.h>
>  #include <linux/syscalls.h>
>  #include <linux/moduleloader.h>
>  #include <linux/interrupt.h>
> @@ -582,7 +583,7 @@ static int vpe_elfload(struct vpe *v)
>  	struct module mod; /* so we can re-use the relocations code */
>  
>  	memset(&mod, 0, sizeof(struct module));
> -	strcpy(mod.name, "VPE loader");
> +	strscpy(mod.name, "VPE loader");
>  
>  	hdr = (Elf_Ehdr *) v->pbuffer;
>  	len = v->plen;
> -- 
> 2.49.0

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

