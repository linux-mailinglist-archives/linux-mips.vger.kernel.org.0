Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B22641AFD2B
	for <lists+linux-mips@lfdr.de>; Sun, 19 Apr 2020 20:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgDSSRT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 19 Apr 2020 14:17:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbgDSSRS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 19 Apr 2020 14:17:18 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96141C061A0C;
        Sun, 19 Apr 2020 11:17:18 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id k133so6840695oih.12;
        Sun, 19 Apr 2020 11:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lVp5J3L7xx8RfXE2l8kRTsve29d/FePp3kDwKpOyzDI=;
        b=OFPZulq25UF5Y3RgTIxgelFvx960Yxgf5FCnStv1HtEKZb5UkQBgAl7dT4Q/nU+Nak
         l/lwtgyWuFi3bkOfgmCowMtHeDiHNL/GBtFOSZ85BoP3gGmXR+mMeFhh0U1h+T+LcLoo
         L+Q0w4AMISfeLKd+45klOzRkEoPCNPXRyQGMUig9xAbQCZJBbqSFRkJtCzYJaCecNPhe
         AKzX2fj/GItNfLMCi+SOpOQeBsFYUoQNI5w6fNXFHwFVMunlTl8+Q5zwbvTLKc8AEJqP
         U/Y0NlhUAstrzNaCxkxLgE7yhqmFx4XrZzzTXdCV+xTe0Jgjo7Kj4dsvk+oZ3/4x6MsS
         cdlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lVp5J3L7xx8RfXE2l8kRTsve29d/FePp3kDwKpOyzDI=;
        b=WdMlg8LpRYON/IEc6Nd1+GMIJDko19rqAzz7NBN8oy2rE15sO/f1tsGKwMha6JoBHq
         408OTVJkAjTiYlrljyCCvM4tqASfHeab4Ilq6+aAMy9gz7qzrOQiBqkSX5X+ODv+4L6V
         LHPwWYkvG0PoG0GQio//ChFbXWm6P1fmeY4ezZQYr9eE9Qo/jBrYNebrJMWdS8vDjL0C
         RG9mfgTv084xZF64eBkFYUCwSs2Ij6KTe3UKTcQU8UP37aGVmsT+A8/+SaGocXCCTACX
         293MqOwwsdntATbOWLYaCvLFZR/W3ojYTb128BfdLJ8GCT5FFKocogbdITlJHvsTCODR
         srlw==
X-Gm-Message-State: AGi0PubcLlvBbF5o0fJ+p1LlPAQWe067wYKJ/PiK0wrkjef/4ZcefGTj
        /Dgtw7PYw05UE+Vx55Wi86c=
X-Google-Smtp-Source: APiQypLC9nSr85KAnDCf/Fcm0RAg1jJAX5LAwsXyAPvAW1T3J4VBzxNDOpMV25OndERnFmP8FRHqUQ==
X-Received: by 2002:aca:c70f:: with SMTP id x15mr8168206oif.80.1587320237904;
        Sun, 19 Apr 2020 11:17:17 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::3])
        by smtp.gmail.com with ESMTPSA id r67sm9556198oie.19.2020.04.19.11.17.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Apr 2020 11:17:17 -0700 (PDT)
Date:   Sun, 19 Apr 2020 11:17:15 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH 2/2] MIPS: VDSO: Do not disable VDSO when linking with
 ld.lld
Message-ID: <20200419181715.GA36234@ubuntu-s3-xlarge-x86>
References: <20200419180445.26722-1-natechancellor@gmail.com>
 <20200419180445.26722-2-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200419180445.26722-2-natechancellor@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Apr 19, 2020 at 11:04:45AM -0700, Nathan Chancellor wrote:
> Currently, when linking with ld.lld, this warning pops up:
> 
>     arch/mips/vdso/Makefile:70: MIPS VDSO requires binutils >= 2.25
> 
> ld-ifversion calls ld-version, which calls scripts/ld-version.sh, which
> is specific to GNU ld. ld.lld has a completely different versioning
> scheme (as it follows LLVM's versioning) and it does not have the issue
> mentioned in the comment above this block so it should not be subjected
> to this check.
> 
> With this patch, the VDSO successfully links and shows P_MIPS_PC32 in
> vgettimeofday.o.
> 
> $ llvm-objdump -Dr arch/mips/vdso/vgettimeofday.o | grep R_MIPS_PC32
> 			00000024:  R_MIPS_PC32	_start
> 			000000b0:  R_MIPS_PC32	_start
> 			000002bc:  R_MIPS_PC32	_start
> 			0000036c:  R_MIPS_PC32	_start
> 			00000468:  R_MIPS_PC32	_start
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/785
> Link: https://github.com/llvm/llvm-project/commit/e364e2e9ce50c12eb2bf093560e1a1a8544d455a
> Reported-by: Dmitry Golovin <dima@golovin.in>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  arch/mips/vdso/Makefile | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
> index d7fe8408603e..f99e583d14a1 100644
> --- a/arch/mips/vdso/Makefile
> +++ b/arch/mips/vdso/Makefile
> @@ -65,9 +65,11 @@ DISABLE_VDSO := n
>  # the comments on that file.
>  #
>  ifndef CONFIG_CPU_MIPSR6
> -  ifeq ($(call ld-ifversion, -lt, 225000000, y),y)
> -    $(warning MIPS VDSO requires binutils >= 2.25)
> -    DISABLE_VDSO := y
> +  ifndef CONFIG_LD_IS_LLD
> +    ifeq ($(call ld-ifversion, -lt, 225000000, y),y)
> +      $(warning MIPS VDSO requires binutils >= 2.25)
> +      DISABLE_VDSO := y
> +    endif
>    endif
>  endif
>  
> -- 
> 2.26.1
> 

Hmmm, I still see this warning when first runing make <config>... I
assume because this Makefile gets parsed before Kconfig runs.

Perhaps it would be better to check if ld-version is 0 (since that means
we are not using GNU ld):

ifneq ($(call ld-ifversion, -eq, 0, y),y)

I am open to suggestions though.

Cheers,
Nathan
