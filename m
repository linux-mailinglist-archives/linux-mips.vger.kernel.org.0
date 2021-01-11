Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD222F1FED
	for <lists+linux-mips@lfdr.de>; Mon, 11 Jan 2021 20:54:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391321AbhAKTyW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 Jan 2021 14:54:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391120AbhAKTyV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 11 Jan 2021 14:54:21 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80493C061794
        for <linux-mips@vger.kernel.org>; Mon, 11 Jan 2021 11:53:41 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id s15so50976plr.9
        for <linux-mips@vger.kernel.org>; Mon, 11 Jan 2021 11:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kqzAS7vv3isJxvxaKX99/4deyJqxK70Am6O+u1zhufI=;
        b=nXAUtCl5E6clL+2HewBlse6knjeO3Qp1aPdeuYBpDlz8EnXwTACfUnrSGm0VuMOjw1
         NeS74Ipb8j/qW34RmwJt2LVEnF+By3NNt3nJYOYr9sp3TttH9K1qA3p2N9EIH3AitKXC
         YPuAv5EsYMTsYTnNVAx1szkPJdL9X18yzs2F0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kqzAS7vv3isJxvxaKX99/4deyJqxK70Am6O+u1zhufI=;
        b=e0JgwZB3rJsH+/OMfnINwYCPpRLnKO6C4ozjZDcrW+MQI9MoFVo+/wHfW7oDRUQi8X
         bNHzPzLA7ZvlwxhSH/JT/vDjRQT7qHIY+5eMMkQEpPkNb3i/dQ+Ms0xMRkzQ598MGo01
         fYm9RhdlIpqDTl5EpbUwZmGhZ6iqfGzBkvvXEKGBQCvI6xWNDL1uhO9RzqW8LbHGtQmc
         uQYlUaSXyAlc1kMX0XeuBLf336thGApZQyFZvGpVBiGoM45kWAgcY1Nr1DoTmN21sOZ7
         qsz8/pAF+vVFBNpkFBtt0U8XxhQ3CVO5ApeIVNDQg6uBMo7ysF22ij8eSFQYJDmsz/Tc
         o6YQ==
X-Gm-Message-State: AOAM530MCXbk/aL2F+RmZUcvo5xnXlztw+jYtF13F2qFeUue0h8DW2zF
        nRtoHzASqlaRQy+KU2BzqF0FKg==
X-Google-Smtp-Source: ABdhPJzvYP86OQ4uqkMtM24wFDq6qEnqHZO8PCbrEqVvaJXgt7NLlNssoaUa0+LDD1I6B0iBoCU/JQ==
X-Received: by 2002:a17:902:eb53:b029:da:da92:c187 with SMTP id i19-20020a170902eb53b02900dada92c187mr1378702pli.34.1610394821104;
        Mon, 11 Jan 2021 11:53:41 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a23sm214136pjh.19.2021.01.11.11.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 11:53:40 -0800 (PST)
Date:   Mon, 11 Jan 2021 11:53:39 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Alexander Lobakin <alobakin@pm.me>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Pei Huang <huangpei@loongson.cn>,
        Fangrui Song <maskray@google.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Corey Minyard <cminyard@mvista.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org, stable@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH v5 mips-next 0/9] MIPS: vmlinux.lds.S sections fixes &
 cleanup
Message-ID: <202101111153.AE5123B6@keescook>
References: <20210110115245.30762-1-alobakin@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210110115245.30762-1-alobakin@pm.me>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Jan 10, 2021 at 11:53:50AM +0000, Alexander Lobakin wrote:
> This series hunts the problems discovered after manual enabling of
> ARCH_WANT_LD_ORPHAN_WARN. Notably:
>  - adds the missing PAGE_ALIGNED_DATA() section affecting VDSO
>    placement (marked for stable);
>  - stops blind catching of orphan text sections with .text.*
>    directive;
>  - properly stops .eh_frame section generation.
> 
> Compile and runtime tested on MIPS32R2 CPS board with no issues
> using two different toolkits:
>  - Binutils 2.35.1, GCC 10.2.1 (with Alpine patches);
>  - LLVM stack: 11.0.0 and from latest Git snapshot.
> 
> Since v4 [3]:
>  - new: drop redundant .text.cps-vec creation and blind inclusion
>    of orphan text sections via .text.* directive in vmlinux.lds.S;
>  - don't assert SIZEOF(.rel.dyn) as it's reported that it may be not
>    empty on certain machines and compilers (Thomas);
>  - align GOT table like it's done for ARM64;
>  - new: catch UBSAN's "unnamed data" sections in generic definitions
>    when building with LD_DEAD_CODE_DATA_ELIMINATION;
>  - collect Reviewed-bys (Kees, Nathan).

Looks good; which tree will this land through?

-Kees

> 
> Since v3 [2]:
>  - fix the third patch as GNU stack emits .rel.dyn into VDSO for
>    some reason if .cfi_sections is specified.
> 
> Since v2 [1]:
>  - stop discarding .eh_frame and just prevent it from generating
>    (Kees);
>  - drop redundant sections assertions (Fangrui);
>  - place GOT table in .text instead of asserting as it's not empty
>    when building with LLVM (Nathan);
>  - catch compound literals in generic definitions when building with
>    LD_DEAD_CODE_DATA_ELIMINATION (Kees);
>  - collect two Reviewed-bys (Kees).
> 
> Since v1 [0]:
>  - catch .got entries too as LLD may produce it (Nathan);
>  - check for unwanted sections to be zero-sized instead of
>    discarding (Fangrui).
> 
> [0] https://lore.kernel.org/linux-mips/20210104121729.46981-1-alobakin@pm.me
> [1] https://lore.kernel.org/linux-mips/20210106200713.31840-1-alobakin@pm.me
> [2] https://lore.kernel.org/linux-mips/20210107115120.281008-1-alobakin@pm.me
> [3] https://lore.kernel.org/linux-mips/20210107123331.354075-1-alobakin@pm.me
> 
> Alexander Lobakin (9):
>   MIPS: vmlinux.lds.S: add missing PAGE_ALIGNED_DATA() section
>   MIPS: CPS: don't create redundant .text.cps-vec section
>   MIPS: vmlinux.lds.S: add ".gnu.attributes" to DISCARDS
>   MIPS: properly stop .eh_frame generation
>   MIPS: vmlinux.lds.S: explicitly catch .rel.dyn symbols
>   MIPS: vmlinux.lds.S: explicitly declare .got table
>   vmlinux.lds.h: catch compound literals into data and BSS
>   vmlinux.lds.h: catch UBSAN's "unnamed data" into data
>   MIPS: select ARCH_WANT_LD_ORPHAN_WARN
> 
>  arch/mips/Kconfig                 |  1 +
>  arch/mips/include/asm/asm.h       | 18 ++++++++++++++++++
>  arch/mips/kernel/cps-vec.S        |  1 -
>  arch/mips/kernel/vmlinux.lds.S    | 11 +++++++++--
>  include/asm-generic/vmlinux.lds.h |  6 +++---
>  5 files changed, 31 insertions(+), 6 deletions(-)
> 
> -- 
> 2.30.0
> 
> 

-- 
Kees Cook
