Return-Path: <linux-mips+bounces-10367-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDC0B2B4F7
	for <lists+linux-mips@lfdr.de>; Tue, 19 Aug 2025 01:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 859483B1AAA
	for <lists+linux-mips@lfdr.de>; Mon, 18 Aug 2025 23:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF4A27E060;
	Mon, 18 Aug 2025 23:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R+y7Ozgy"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED671FBE87
	for <linux-mips@vger.kernel.org>; Mon, 18 Aug 2025 23:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755560438; cv=none; b=O+vKCPtFoMLh1lLZQlTN5BvbsyJ+FEN2ClABMJ2eWn0SOWRcMQr8jJWntZ5+7e6vS1C+0jKSfoTOlhqe4GHH8SMFvT2qMot8XqdYY84YvfwiCMR+jhbWYEZ9V/1MneYE3rUIf8EF4UjaO6q8gLORe98SG1tvtR3xpdwiu3uA+bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755560438; c=relaxed/simple;
	bh=wb94KLjt5N8FwYnn6nR18SO9z15Pu5lGZqzVknWG76c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4JM0EswiPBzDbmFt879zbtJUPxGnQYJSJGmThl+IBLabzIB8tOtiRhkcip1i5iWWl52BrLCEr8DAmU+RLFL9fZV6/wFH3885fkVheD9HJ4MkgKuHuFm8BB/ouCZxGyek6JHy1RyF2Tufve2Hgh0bBAUDEW+zM6saGUyz4wssrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R+y7Ozgy; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3e57376f655so37272825ab.0
        for <linux-mips@vger.kernel.org>; Mon, 18 Aug 2025 16:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755560436; x=1756165236; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wA2dGu/eo8bDyGQ+eks03J0QXMslB/lfrKKitSgi3Fs=;
        b=R+y7OzgylI0PmwLLY44VEJGslW53N7wa4Aa1IHi4gPWnrSX1bZqBcX3rVnKKVOgT4b
         x3lYoiBRJa/GtF4URuEI5HCUAJWiz53hIpkbfiUpho/OaSuwzaKVkxaWmTBcRfcy+Ovv
         EFoeK7NiDodFCpOAh8LlzzCWHMg2B+SeWisi4OilVMadak1FAFB3Q7SAAygJ2WOLerO6
         xMy7896zI7dHz9JysJsT56ti3wVRTlPuj5kLEi4ysoIAFHXFHKH1jNr/AqA4+HB+9HAt
         sxOqs+t/Tv9+zQgxwHdXZsjBoKWV4csd3Kw92+fdT0KS8ST5hQTIlgwYRaPuaLhkIxN4
         rK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755560436; x=1756165236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wA2dGu/eo8bDyGQ+eks03J0QXMslB/lfrKKitSgi3Fs=;
        b=litmSTLWRm0ipwqJfYSnnRcnmvSz5HzUppObbEHnrkovhhez4A3rhOJr2e9K3W1qCk
         rNOIgW6nQVjlWYYTpG/XpPnts3wHUgHkomcp6BBaNJmYZnJJEltapD2ATGKTfzOPnfqa
         nq6pAjiYw+cc27aYxyLL+/RAbNqxf+d3TkrKiRNr1GK7GVy2y7ApYOW3izDq+80t/TVr
         lzf3QADjPUImHTkeiZoSgNgrIbh39xc7K02S2ihJlsW+MRECc6y2ra0qYkusnVhD53EW
         ighnVPFbSFpnYvGER2b+obSjcYiae6CzVnDlDdw14UX1H8gwLz9mUGx8wwGLQdSmkXqx
         UZfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPJjx3DDOJ0APCkfqjK3WuJTerjZnGgapQdaFQdshi5oW/WKaIrR3z5nwIHxZVbEXhwrJRMbkagDSD@vger.kernel.org
X-Gm-Message-State: AOJu0YyEWwJwb3nL3kmcYubLE0EpPLZi/nNcMUTjuEJMQkVhfpNRCi4K
	6i1Zs5gTAjp4L1TlOK9Quz7dudFb+e2xotQ7k87YtZKeM3NLkXeOuLSR1PlRyJ0ewg==
X-Gm-Gg: ASbGnct61wAWIWDhJgXQmBlBB3ExTRCqQTOuVp7omi1N+AiwW32/cXN//beLv+WjD3+
	vsRRPLUANq9CmT736tAkvq5RPCJiHnecLLn6522L4ljhZLIY6cmmFYOYD/av5gJUcHQ6UVcMnET
	b7IEZ6mSwbcOlT8z7VEPuvRWfTETrdmkKDnx/lix58GtSUq9caYWcomu5dygc5+qBBlAZigyTUz
	n6N2GW1E7t/OSsB4hpikmWuHwSnzaRcaRM6p/nquaA82TZ8nCnw2Ls8DzldouMICpbgCvKIvCu7
	y9gnXsmR9SZqtkYZ/HAV77m9v//3lo0BXRir3VVFefCrd3/L1tnxjf7MuenSlAb3Grq8q+BxrH1
	wRnCXHS9JroAJkT5jLsVqBls8tECwZtkBrpkp1U2n3+xSfRMz7mJiJXPg4keefXM=
X-Google-Smtp-Source: AGHT+IFinOuMzyrwtYFXdoNFknlpEPk5CHa0T0D9qEO7QHRs26OORGLd2trxJDntZT6T7ED5hQka9w==
X-Received: by 2002:a05:6e02:1a6e:b0:3e5:50a5:a7dc with SMTP id e9e14a558f8ab-3e67665cac2mr12677825ab.18.1755560435840;
        Mon, 18 Aug 2025 16:40:35 -0700 (PDT)
Received: from google.com (2.82.29.34.bc.googleusercontent.com. [34.29.82.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e66ed69ccdsm11182285ab.22.2025.08.18.16.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 16:40:35 -0700 (PDT)
Date: Mon, 18 Aug 2025 16:40:33 -0700
From: Justin Stitt <justinstitt@google.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-hardening@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] MIPS: sgi-ip32: Replace deprecated strcpy() in
 plat_mem_setup()
Message-ID: <6d7mznlomgbhqexp64tswbozmlqk7svrek66zggjnhljsdzan3@3f66zsc5jm5y>
References: <20250817183728.612012-1-thorsten.blum@linux.dev>
 <20250817183728.612012-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817183728.612012-2-thorsten.blum@linux.dev>

Hi,

On Sun, Aug 17, 2025 at 08:37:12PM +0200, Thorsten Blum wrote:
> strcpy() is deprecated; use strscpy() instead.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/mips/sgi-ip32/ip32-setup.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/sgi-ip32/ip32-setup.c b/arch/mips/sgi-ip32/ip32-setup.c
> index aeb0805aae57..c2ebc4bbd866 100644
> --- a/arch/mips/sgi-ip32/ip32-setup.c
> +++ b/arch/mips/sgi-ip32/ip32-setup.c
> @@ -14,6 +14,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/param.h>
>  #include <linux/sched.h>
> +#include <linux/string.h>

This new include isn't strictly necessary as it was building with
strcpy() fine before?

>  
>  #include <asm/bootinfo.h>
>  #include <asm/mipsregs.h>
> @@ -90,7 +91,7 @@ void __init plat_mem_setup(void)
>  			static char options[8] __initdata;
>  			char *baud = ArcGetEnvironmentVariable("dbaud");
>  			if (baud)
> -				strcpy(options, baud);
> +				strscpy(options, baud);
>  			add_preferred_console("ttyS", *(con + 1) == '2' ? 1 : 0,
>  					      baud ? options : NULL);
>  		}
> -- 
> 2.50.1
> 
>

Thanks
Justin

