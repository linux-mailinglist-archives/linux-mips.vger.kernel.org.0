Return-Path: <linux-mips+bounces-10370-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 101CBB2B530
	for <lists+linux-mips@lfdr.de>; Tue, 19 Aug 2025 02:02:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C85BA52517D
	for <lists+linux-mips@lfdr.de>; Tue, 19 Aug 2025 00:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E453F469D;
	Tue, 19 Aug 2025 00:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W4tMuMFn"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D7C4690
	for <linux-mips@vger.kernel.org>; Tue, 19 Aug 2025 00:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755561741; cv=none; b=Zi11occ9E1h9p2SO4kjGlmt7aQtB08msqbhHfLk7oYyXiB8hlnXUFD0RqHjGy6sGhNo0aQcUGLn0w6zb/icYNSr9iG7YTlSz1QZwbEEBdfp1tRJVEAimN4WM517khPTmYG5GXHmAU2TOyG4+PhgpvazQFxIjOncjMv3eANwRdAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755561741; c=relaxed/simple;
	bh=IYI91/LE9Llcly1/RR9GAXRgHt5xZK04GitaKe7QsYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XL02ElLKQ7YaTyK9nen2ciZuERgT6ICyAaFS5cNeljDoY0ArJoc7DmmfMITBJYWKcStNMmAy6QautD+c7Jpny0bdXkuHvjCTqyfT/mt0XMhBrQ4ijvj85FqXkJwbeJcpj6e9sePCeQizjXAlGJcEISNH9cXSscxr2AWib4owKgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W4tMuMFn; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-435de702f1fso2717552b6e.1
        for <linux-mips@vger.kernel.org>; Mon, 18 Aug 2025 17:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755561738; x=1756166538; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oMsgbwBVAVhf//iwhRHAmazuWGfkfHKPwkTozN8mYH0=;
        b=W4tMuMFnm25GdNZbPYhPn7cwIhzmZU7JAQ54Nx5hcDY4ZvarRH/o5jDOkUL2YAbG2g
         lnuGIGF3aGFdgaF+4j7mDk3X8CFNvDQEjhIdrA6JvyvYgUj9nEzBFu8nCXyEKqa8TuaY
         cZBaOpOCAPNNFmVe5dnw5ERkOMAMsMo9kWnMT8snfWi7+mGq/bfBE2NJj1WpokRLBnFp
         h+JJWEeA1G/NHsQoY6lm844YTdNfHv6aAxKLpWIVg1m31FpNgyWm0n0Xh0/1ggAmxs4a
         Ewyco05MWIm8QQNy2bzdIXppbPBbdBDBPoB7tZu/p8wuCOajACLWd5wBsQ9efx00YLv3
         k+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755561738; x=1756166538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMsgbwBVAVhf//iwhRHAmazuWGfkfHKPwkTozN8mYH0=;
        b=d8O2hJ9o4A9xnFr5Kky0vunHLnLKlkOjvaGal0sz8aXVsYsSV+vvRiuc6SLNHSIyca
         Jsf4MRe68j4HIC1X6DD/rxOU7IPooWy5SPqQnAqizOaa/Dqbx4E12wRiajgCn7r0W600
         46nMu0LUwkt2vPlZM0JJMHJ7zA+z7UEGNIzGQWW/U+h9AlvIgfTABeLSFEC5cZHEFj5E
         TpttGI4RD0bNh/VJ1WFNPHS1/1Mu2QVLyZPUMdCtpLk9cUIf4dcA4LWAto0k0aFkQ4g3
         v8J3RYEReI5GFzIQUUP12P8FQWEWzPcO8jjl3X8+9Kew3rmWTQZmc141tj36srbJK+gB
         nZMg==
X-Forwarded-Encrypted: i=1; AJvYcCUIXcv5rD0mRjQqskMvNDIps9jiweO3fIpAJthpGMv+l95N/wU0qo1hXLHtKtOY1JKX9f92TyXza/cZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr8vdBMTvn1SBrgNwD2q/1y0lfA7HuaWT45Jveb3xItgpr1M59
	bvPix/RWxJe8x3hg26ePA61vkXozkTTRADmD7DDGapE64izqL4Rgvlb4oeMmwVgG8spfy7M74AC
	6hvupxg==
X-Gm-Gg: ASbGncs2+cf9SzygGZH+zRC7X6XZ34XOzMfVYheTjIfatgTA0EN4DF/lQGUmB5CeH93
	4v+zD5ykgaKOw44NTmp2UG0LSAejrBf3XtOBISmilWBnyj/pTYIUQExlzp0Qd/y1mocncXFgrsP
	N03vJ8FCpRhEwjLqBjOR8emW0lc/YToHFTp/rMcgQ9EeQ948rsYjTxaxkpWLkguodyNMEF1rZJt
	ZmSrIBzJzWVLlO81bwVKwZiwS5W94wVCVQOwYbVYy48x5BEm9F7bWU4i4Xqxq9O62W/BHoYNpa0
	RyRbMyJ1GSTwE0M6sETF2xdgNHJ3U0Db5C7v7tNf0vw0iKMo+7Ua5cQpDXAYzX8JiU+waO6xTs4
	QB0AtRdo7TwlOXN0z6YZ3KRcA3ButKPuZAbC6gTujeEgYAr5ftF+RtX2hrQz/mZU=
X-Google-Smtp-Source: AGHT+IHxC2a8ADbE8Man2mxRnjf7l32j3oW2wJDIpc4tYOrxF0mDpcOuNs9sRV+UqoA+G+aHiT1l0g==
X-Received: by 2002:a05:6808:11ce:b0:433:fe69:fd85 with SMTP id 5614622812f47-436da1e48dfmr462238b6e.20.1755561738182;
        Mon, 18 Aug 2025 17:02:18 -0700 (PDT)
Received: from google.com (2.82.29.34.bc.googleusercontent.com. [34.29.82.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50c94786c0fsm2917906173.3.2025.08.18.17.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 17:02:17 -0700 (PDT)
Date: Mon, 18 Aug 2025 17:02:14 -0700
From: Justin Stitt <justinstitt@google.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-hardening@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] MIPS: octeon: Replace memset(0) + deprecated
 strcpy() with strscpy_pad()
Message-ID: <mnqgvgvlnnamfyy7eb54thjs4edkrcdwqy6mg2ybqhf3nxtapu@rntlepvgtbd6>
References: <20250817183728.612012-1-thorsten.blum@linux.dev>
 <20250817183728.612012-6-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817183728.612012-6-thorsten.blum@linux.dev>

Hi,

On Sun, Aug 17, 2025 at 08:37:16PM +0200, Thorsten Blum wrote:
> Replace memset(0) followed by the deprecated strcpy() with strscpy_pad()
> to improve octeon_fdt_set_phy(). This avoids zeroing the memory before
> copying the string and ensures the destination buffer is only written to
> once, simplifying the code and improving efficiency.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Justin Stitt <justinstitt@google.com>

> ---
>  arch/mips/cavium-octeon/octeon-platform.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/cavium-octeon/octeon-platform.c b/arch/mips/cavium-octeon/octeon-platform.c
> index 5e1dd4e6e82f..47677b5d7ed0 100644
> --- a/arch/mips/cavium-octeon/octeon-platform.c
> +++ b/arch/mips/cavium-octeon/octeon-platform.c
> @@ -13,6 +13,7 @@
>  #include <linux/of_fdt.h>
>  #include <linux/platform_device.h>
>  #include <linux/libfdt.h>
> +#include <linux/string.h>
>  
>  #include <asm/octeon/octeon.h>
>  #include <asm/octeon/cvmx-helper-board.h>
> @@ -538,8 +539,7 @@ static void __init octeon_fdt_set_phy(int eth, int phy_addr)
>  
>  	if (octeon_has_88e1145()) {
>  		fdt_nop_property(initial_boot_params, phy, "marvell,reg-init");
> -		memset(new_name, 0, sizeof(new_name));
> -		strcpy(new_name, "marvell,88e1145");
> +		strscpy_pad(new_name, "marvell,88e1145");
>  		p = fdt_getprop(initial_boot_params, phy, "compatible",
>  				&current_len);
>  		if (p && current_len >= strlen(new_name))
> -- 
> 2.50.1
> 
>

Thanks
Justin

