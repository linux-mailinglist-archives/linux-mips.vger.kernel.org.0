Return-Path: <linux-mips+bounces-10366-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AACBFB2B493
	for <lists+linux-mips@lfdr.de>; Tue, 19 Aug 2025 01:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56E6D1B25C68
	for <lists+linux-mips@lfdr.de>; Mon, 18 Aug 2025 23:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8091E7C2D;
	Mon, 18 Aug 2025 23:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iDZdhzFV"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3763451BF
	for <linux-mips@vger.kernel.org>; Mon, 18 Aug 2025 23:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755559450; cv=none; b=Q4qBzfayvsFsKiRzF9L2ouQmyTzvq3BHHYzZdLVSTPvBbyLdDtwb+6VYMWfuNN2BRCvE+CnE88iPgid8NMFFxK/3NvwSBWqwNiV1u0K8YFPFvVkTMmT42I7Sc2y318UWVJXPFU33ezIA62nMlyQlxcNgYNp94sTAebfVxbmrw34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755559450; c=relaxed/simple;
	bh=88pFRxPpReZuhh52+eqRfeXx6L+V5nMjiJpTP1SIHQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MGr9zktngJeJzRW62S4Hj3f07ptA4C8TDn1490WFADrAE0AuFrrWqTtrG5H/+Hp7Dal8/5wE3Lw+KcWYQ3daClcePqcAbjyXzVar1b4506BmziBWAwNGPRGLwpb7kV3E4jrfNSVHdWBLeV90286EdVdLYO8S4jZxPlfGN0KKg/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iDZdhzFV; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3e56ff1c11eso26343645ab.0
        for <linux-mips@vger.kernel.org>; Mon, 18 Aug 2025 16:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755559448; x=1756164248; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RhajVtK66yTySwyrLZ2p1bbpHPegFOXW1beKh398ayc=;
        b=iDZdhzFVJfxw1MAPUbHO23epDWa7vElcnbwd6TkhM7kl6xvYdBdZI+uOES7JkjRfUl
         vbCaRGdSxXctYsBOsWdtxSZ/wqek+DiGQX4hETIwqFL9CNS0xBduEDHyeS84LZ4CZ7eS
         OOFtaRvTUXfP8KHgN8w2imHlc3u3gbRRmvNcRZ5YfeTqZ4hMc8+8JW16EyRZNiIK2/yV
         2fX5HjuYy/Lxqf032/Tn0wHBR7RdAjQZaS5fHW00skHqx2/DskYsuSpnReahhV9LTWmI
         QixStgZOX3rcQJ0lPSPgYi0t/GPURbJ8Ku31qV5JQJH29h5I/PHxQu8PtI5P3yeT7zKR
         QBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755559448; x=1756164248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhajVtK66yTySwyrLZ2p1bbpHPegFOXW1beKh398ayc=;
        b=bMTuvP6YI7308I4w96OfxbFyGRzJdJLQunKncxPqeVA0+I1Izqtx33ZEL+iz/6CNbV
         0gdvrXGIDQYlUS4po4P/1zx/PVWIT2j81oSeMnkdbppuR2qca+2KfL1Zn4bNk35NWCnc
         iIi/lRUud4FwmGaJNvVH+2mRQILl1tLoKkj8ykOm9YmgnU+MtT3ylDFWSs6FRmhOxmFE
         atR8LvezKV/IhAic63sLTOBJ0MlE3Z3VXALTlRdgNAAG8dr2anJbR1DPYRD1rJfqWr1i
         9dOmq3UbV/iaaalc1fhqgWfJa/I6UARrV2z3IkZOsLF+V2UGG2X+EJxNO8L5AHDm4k1w
         +0aQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsjBdQBL+twfl24J4y15yFsN+ogE7vk2zVNlBgYQStl9KMERZ3bJkJvFznSuhFOtoc9WcPDF1QrBFU@vger.kernel.org
X-Gm-Message-State: AOJu0YzBdBzvcj9o7uAlPH0gK+r8OCUyL1hImWbIN68n46TwI/zYaqfu
	AIIGLStUH16KSPGvkaqR7XCLseqInJp8MrPQ2bDO4gQwr5YxVMzLnT6RiMKS5KaFyA==
X-Gm-Gg: ASbGncuKsgFlEBHz8LHTnebrJm6CZm124CuP6DdeTl74kmgxKvC5tqO/8NqwW35u0o7
	bwFNsFW9pluS4aIqOkJiYbs25As8rZZeiRtjvLajCQNffMa2QvT2Qr5wmqvbWlHYy7hS/5ktfUg
	nuB4SsSfv/biiSVJOVo0u+CTJjQK+AlWmUpmxYr1/RBEhdkpvbTlpYydQvMFoHUVDdsYWjhLL7D
	LJJRhWLwOCIz1bfZ0mxb380YbJSicnAv+nkjQF3iUnBAN+SuA+Ls2SQ11W6qxE0l7Uz3hE26ndu
	PtBHMKVuOKsKhjMS42UlfelWrv5eNDBXgUTynu/06H0wRcaV2ybvi2GqtKA/im+E9fbghlDXNgS
	tMm1N8UzhECrZiJ60SmtVYedn2/HWRNFdx3Lexhzrwz/jwyFYgydwD7te7H8UBPo=
X-Google-Smtp-Source: AGHT+IFW67NxhKSu0Fp/FRczJDzd+y9jHARgkjmLy8eub8JVPX4L9X4bg29UADbaCuXul/vURpj+Kg==
X-Received: by 2002:a05:6e02:156e:b0:3e5:738c:3f3a with SMTP id e9e14a558f8ab-3e67667beb6mr10658085ab.21.1755559447494;
        Mon, 18 Aug 2025 16:24:07 -0700 (PDT)
Received: from google.com (2.82.29.34.bc.googleusercontent.com. [34.29.82.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50c94998c07sm2973697173.49.2025.08.18.16.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 16:24:06 -0700 (PDT)
Date: Mon, 18 Aug 2025 16:24:03 -0700
From: Justin Stitt <justinstitt@google.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-hardening@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] MIPS: sgi-ip22: Replace deprecated strcpy() in
 plat_mem_setup()
Message-ID: <j5eb4ffqiz65prvai6ufn2zi5ywupirrwk5zfdlnafeye6i7ei@m2vipesyx7z7>
References: <20250817183728.612012-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817183728.612012-1-thorsten.blum@linux.dev>

Hi,

On Sun, Aug 17, 2025 at 08:37:11PM +0200, Thorsten Blum wrote:
> strcpy() is deprecated; use strscpy() instead.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Justin Stitt <justinstitt@google.com>

> ---
>  arch/mips/sgi-ip22/ip22-setup.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/sgi-ip22/ip22-setup.c b/arch/mips/sgi-ip22/ip22-setup.c
> index e06a818fe792..f083b25be13b 100644
> --- a/arch/mips/sgi-ip22/ip22-setup.c
> +++ b/arch/mips/sgi-ip22/ip22-setup.c
> @@ -11,6 +11,7 @@
>  #include <linux/types.h>
>  #include <linux/console.h>
>  #include <linux/sched.h>
> +#include <linux/string.h>
>  #include <linux/tty.h>
>  
>  #include <asm/addrspace.h>
> @@ -65,7 +66,7 @@ void __init plat_mem_setup(void)
>  		static char options[8] __initdata;
>  		char *baud = ArcGetEnvironmentVariable("dbaud");
>  		if (baud)
> -			strcpy(options, baud);
> +			strscpy(options, baud);
>  		add_preferred_console("ttyS", *(ctype + 1) == '2' ? 1 : 0,
>  				      baud ? options : NULL);
>  	} else if (!ctype || *ctype != 'g') {
> -- 
> 2.50.1
> 
>

Thanks
Justin

