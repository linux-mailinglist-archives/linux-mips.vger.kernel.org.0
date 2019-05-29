Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACF932E5DA
	for <lists+linux-mips@lfdr.de>; Wed, 29 May 2019 22:12:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbfE2UMN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 May 2019 16:12:13 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35024 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726192AbfE2UMN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 29 May 2019 16:12:13 -0400
Received: by mail-pf1-f194.google.com with SMTP id d126so2354819pfd.2
        for <linux-mips@vger.kernel.org>; Wed, 29 May 2019 13:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PGcw43rEtHfebZ1ykAg+O3oB9Ib7l867UUY+4n/dk/Q=;
        b=mD+XA/C1RPTuYpF3bAQXZIvQOGFykfuFTGv2T4SJe7rylVcI8w0NDLRy0IsBLJ66C4
         yVcYvfhvVtwxJaG6tBzpFRpEcG+JM4ZK+8yr+Vmhnc0lkQZ9h7mnNWkXgsjQ03iN9T3Y
         xn9BTzPrq4mJgfWOD9cwdHXpGjo9qYZ06UsdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PGcw43rEtHfebZ1ykAg+O3oB9Ib7l867UUY+4n/dk/Q=;
        b=Yrgq5vTEd35wB1mJ49BzFPxA9FfFcvIaHslmjqlhop/dCvZp0wSIz33XnjJ3AP3jt9
         nqV8HhanAcAtlXuDwMeCZ32jwsG4sR63Mip8SP0FNynP24EQ69nfiCFTDkBr8Qhr1b0r
         hcaIiyBeAz08VfkZcjCI+Y5uKkhGLjFidm0t/mYcbi2E3aXMsopiWObZ60ottU25VPb2
         /s7lLuFuSma9QojfbhKD0GI55fbUNjib2kZZCajT4eHF6Ypj+WReDCjUI3tdLrHV2eAd
         jJUJqyx3NcDLUTjrT4Gbc/gEcPWAnFs0NT7WOhobW+LjZNUgmfUlfx4aNGQ914qmEciz
         51jA==
X-Gm-Message-State: APjAAAXclYvDRyTRc4rlxOmYfsexX5qllyC2HtvAU2l3J+5eup3b71UH
        OLuhnPh6PlaN0w4gpVusf3KTmg==
X-Google-Smtp-Source: APXvYqwDEJpc5XVklT3bHvSVgN9OxPIFPApr20V/GjXll3oEfIoQdqDbKTvTIc6ODp034anrn4Q3IQ==
X-Received: by 2002:a63:f551:: with SMTP id e17mr11828943pgk.329.1559160732491;
        Wed, 29 May 2019 13:12:12 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j2sm494584pfb.157.2019.05.29.13.12.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 May 2019 13:12:11 -0700 (PDT)
Date:   Wed, 29 May 2019 13:12:10 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Alexandre Ghiti <alex@ghiti.fr>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Palmer Dabbelt <palmer@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Luis Chamberlain <mcgrof@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 11/14] mips: Adjust brk randomization offset to fit
 generic version
Message-ID: <201905291311.7E88A71@keescook>
References: <20190526134746.9315-1-alex@ghiti.fr>
 <20190526134746.9315-12-alex@ghiti.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190526134746.9315-12-alex@ghiti.fr>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, May 26, 2019 at 09:47:43AM -0400, Alexandre Ghiti wrote:
> This commit simply bumps up to 32MB and 1GB the random offset
> of brk, compared to 8MB and 256MB, for 32bit and 64bit respectively.
> 
> Suggested-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  arch/mips/mm/mmap.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/mips/mm/mmap.c b/arch/mips/mm/mmap.c
> index ffbe69f3a7d9..c052565b76fb 100644
> --- a/arch/mips/mm/mmap.c
> +++ b/arch/mips/mm/mmap.c
> @@ -16,6 +16,7 @@
>  #include <linux/random.h>
>  #include <linux/sched/signal.h>
>  #include <linux/sched/mm.h>
> +#include <linux/sizes.h>
>  
>  unsigned long shm_align_mask = PAGE_SIZE - 1;	/* Sane caches */
>  EXPORT_SYMBOL(shm_align_mask);
> @@ -189,11 +190,11 @@ static inline unsigned long brk_rnd(void)
>  	unsigned long rnd = get_random_long();
>  
>  	rnd = rnd << PAGE_SHIFT;
> -	/* 8MB for 32bit, 256MB for 64bit */
> +	/* 32MB for 32bit, 1GB for 64bit */
>  	if (TASK_IS_32BIT_ADDR)
> -		rnd = rnd & 0x7ffffful;
> +		rnd = rnd & SZ_32M;
>  	else
> -		rnd = rnd & 0xffffffful;
> +		rnd = rnd & SZ_1G;
>  
>  	return rnd;
>  }
> -- 
> 2.20.1
> 

-- 
Kees Cook
