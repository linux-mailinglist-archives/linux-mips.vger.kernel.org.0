Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45976357356
	for <lists+linux-mips@lfdr.de>; Wed,  7 Apr 2021 19:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234516AbhDGRlB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 7 Apr 2021 13:41:01 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:31176 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbhDGRlB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 7 Apr 2021 13:41:01 -0400
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 137HeX6u021198;
        Thu, 8 Apr 2021 02:40:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 137HeX6u021198
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1617817234;
        bh=hq2Csej9fmxjCgzuClcCpYDQCr85NYpxH/DhupGrcoc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=1YLZoc2ig+l+1hwk/kIAMuY6grDi2lQj1nbmadFMbpyGV61K4aHiTT7H9Rkkt6ptC
         y9Cza0HK0ZmSwhcGkYrzvET1BMC9Zsyd1GOEizAxqewRFyLp3eCdYJpHzvwRpWl15N
         3KikniB3363cyf/sS3Sf+agel0MNRjGroafwAM+ycqQI0/AtCsy4ZJ5kvbn9N7MWlz
         rBvS4TAxqik1SA+av38i0ifsWRqaxZfrNSWtG3OCTORWYHpK4KjJuNt5Ms0eHpFaIf
         ki2vkn8UxVljEwIoSK06BezvjyQe7Kyg+LRTdpRzlkaT3xRaoR16y22knv8A5GPosW
         yoeUSbFUXxxDw==
X-Nifty-SrcIP: [209.85.210.181]
Received: by mail-pf1-f181.google.com with SMTP id d124so4592809pfa.13;
        Wed, 07 Apr 2021 10:40:34 -0700 (PDT)
X-Gm-Message-State: AOAM531hPreCI78/IheKBiwSiM+LSjEL7vg92GbBQ0xWkyyJKCqM+x9U
        U7+9bLu1vg1BrIirpiwtyD2xwTwLeUIH7Cd1c8Q=
X-Google-Smtp-Source: ABdhPJzx46YE5Knkbg9eAF3YLlQfZdQ/ANxRnaFclCYNTG0JSnyVe9vciTTz0udAZI8XmiZJdc7ymvHUjedGTN+memY=
X-Received: by 2002:aa7:8d84:0:b029:1f8:3449:1bc6 with SMTP id
 i4-20020aa78d840000b02901f834491bc6mr3720630pfr.76.1617817233393; Wed, 07 Apr
 2021 10:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210407173543.3598006-1-ndesaulniers@google.com>
In-Reply-To: <20210407173543.3598006-1-ndesaulniers@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 8 Apr 2021 02:39:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNASbFWG+-fCPmaROvbT8v4=81Jkfpv1pM-NUcbSNX+-5kw@mail.gmail.com>
Message-ID: <CAK7LNASbFWG+-fCPmaROvbT8v4=81Jkfpv1pM-NUcbSNX+-5kw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: select ARCH_KEEP_MEMBLOCK unconditionally
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 8, 2021 at 2:35 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> While removing allnoconfig_y from Kconfig, ARCH=mips allnoconfig builds
> started failing with the error:
>
> WARNING: modpost: vmlinux.o(.text+0x9c70): Section mismatch in reference
> from the function reserve_exception_space() to the function
> .meminit.text:memblock_reserve()
> The function reserve_exception_space() references the function __meminit
> memblock_reserve().
> This is often because reserve_exception_space lacks a __meminit
> annotation or the annotation of memblock_reserve is wrong.
> ERROR: modpost: Section mismatches detected.
> Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.
>
> allnoconfig disables DEBUG_KERNEL and thus ARCH_KEEP_MEMBLOCK, which
> changes __init_memblock to be equivalent to __meminit triggering the
> above error.
>
> Link: https://lore.kernel.org/linux-kbuild/20210313194836.372585-11-masahiroy@kernel.org/
> Fixes: commit a8c0f1c634507 ("MIPS: Select ARCH_KEEP_MEMBLOCK if
> DEBUG_KERNEL to enable sysfs memblock debug")
> Cc: Masahiro Yamada <masahiroy@kernel.org>

Please replace it with:

Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks.



> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  arch/mips/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index e9893cd34992..702648f60e41 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -12,7 +12,7 @@ config MIPS
>         select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>         select ARCH_HAS_UBSAN_SANITIZE_ALL
>         select ARCH_HAS_GCOV_PROFILE_ALL
> -       select ARCH_KEEP_MEMBLOCK if DEBUG_KERNEL
> +       select ARCH_KEEP_MEMBLOCK
>         select ARCH_SUPPORTS_UPROBES
>         select ARCH_USE_BUILTIN_BSWAP
>         select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
> --
> 2.31.1.295.g9ea45b61b8-goog
>


--
Best Regards
Masahiro Yamada
