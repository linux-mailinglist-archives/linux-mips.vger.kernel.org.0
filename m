Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 763193E142D
	for <lists+linux-mips@lfdr.de>; Thu,  5 Aug 2021 13:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235289AbhHELyA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Aug 2021 07:54:00 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:16883 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230446AbhHELx7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Aug 2021 07:53:59 -0400
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 175BrSRx007538;
        Thu, 5 Aug 2021 20:53:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 175BrSRx007538
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1628164408;
        bh=ORYwhozUJBlRM/RJK04cowMpz8M1dCD144t5OP3d1Sc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TeL6ZnyyLtbxdTqufw7/WYNdRIqUf2bsQQrW3QRC7WAtU//a1Y03NCG4btrDBG+ja
         aTVsXrMs0en4EbL+mBsYYbkQYdd/pEax5kkT0wHuznxZyshcM3GI45OM/hyexN17bQ
         EQeejYCyMbBluAYMWG9n/Na8G097ueGbCqNVXgSSeqmP7eeF8yCViMoLEQJNIf+3Mm
         IFaZ9F7VV69FYS5qvhFghv1hBHWXzTvn5+Bh70JlmUbZxviajeBd6e3Qe5XRWbaPrF
         UixidW3mtoFN8BHwjYgnn58pBThqmT6Q58r31XZGca7EQBbwzROj+q9nXY9aCeanTy
         GVcjm4yke9rIA==
X-Nifty-SrcIP: [209.85.216.48]
Received: by mail-pj1-f48.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so14126315pjr.1;
        Thu, 05 Aug 2021 04:53:28 -0700 (PDT)
X-Gm-Message-State: AOAM530mQd+zlIJGkUXilg1HLFubanJITFSS06plY2wzSghmiTUj+Cz0
        R6EcV7k8Ds7sl3hmtOSEnayjmlrcyHhUh5MJLuU=
X-Google-Smtp-Source: ABdhPJw6NWtNPfvswF6dewwdjhmVauui1n1hxqI+TRo1tju5jKCB/aQbLRNctKm00zfqR4nxP9z980tJCUC19SYL8Fg=
X-Received: by 2002:a17:902:a5c5:b029:12c:a867:a839 with SMTP id
 t5-20020a170902a5c5b029012ca867a839mr1543296plq.71.1628164407907; Thu, 05 Aug
 2021 04:53:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1625734629.git.hns@goldelico.com> <81c6de380d932bfb94d96fb70459dd47afd6ed5d.1625734629.git.hns@goldelico.com>
In-Reply-To: <81c6de380d932bfb94d96fb70459dd47afd6ed5d.1625734629.git.hns@goldelico.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 5 Aug 2021 20:52:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNATJtBACoZ0Cyakgo5J1gBU+DNBrtKRYUoqnHNE3mqsSXA@mail.gmail.com>
Message-ID: <CAK7LNATJtBACoZ0Cyakgo5J1gBU+DNBrtKRYUoqnHNE3mqsSXA@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86/tools/relocs: Fix non-POSIX regexp
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        X86 ML <x86@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, "H. Peter Anvin" <hpa@zytor.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel@pyra-handheld.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jul 8, 2021 at 5:57 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
> Trying to run a cross-compiled x86 relocs tool on a BSD based
> HOSTCC leads to errors like
>
>   VOFFSET arch/x86/boot/compressed/../voffset.h - due to: vmlinux
>   CC      arch/x86/boot/compressed/misc.o - due to: arch/x86/boot/compressed/../voffset.h
>   OBJCOPY arch/x86/boot/compressed/vmlinux.bin - due to: vmlinux
>   RELOCS  arch/x86/boot/compressed/vmlinux.relocs - due to: vmlinux
> empty (sub)expressionarch/x86/boot/compressed/Makefile:118: recipe for target 'arch/x86/boot/compressed/vmlinux.relocs' failed
> make[3]: *** [arch/x86/boot/compressed/vmlinux.relocs] Error 1
>
> It turns out that relocs.c uses patterns like
>
>         "something(|_end)"
>
> This is not valid syntax or gives undefined results according
> to POSIX 9.5.3 ERE Grammar
>
>         https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap09.html
>
> It seems to be silently accepted by the Linux regexp() implementation
> while a BSD host complains.
>
> Such patterns can be replaced by a transformation like
>
>         "(|p1|p2)" -> "(p1|p2)?"
>
> Fixes: fd952815307f ("x86-32, relocs: Whitelist more symbols for ld bug workaround")
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---



Applied to linux-kbuild/fixes.
Thanks.





>  arch/x86/tools/relocs.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/x86/tools/relocs.c b/arch/x86/tools/relocs.c
> index 04c5a44b96827..9ba700dc47de4 100644
> --- a/arch/x86/tools/relocs.c
> +++ b/arch/x86/tools/relocs.c
> @@ -57,12 +57,12 @@ static const char * const sym_regex_kernel[S_NSYMTYPES] = {
>         [S_REL] =
>         "^(__init_(begin|end)|"
>         "__x86_cpu_dev_(start|end)|"
> -       "(__parainstructions|__alt_instructions)(|_end)|"
> -       "(__iommu_table|__apicdrivers|__smp_locks)(|_end)|"
> +       "(__parainstructions|__alt_instructions)(_end)?|"
> +       "(__iommu_table|__apicdrivers|__smp_locks)(_end)?|"
>         "__(start|end)_pci_.*|"
>         "__(start|end)_builtin_fw|"
> -       "__(start|stop)___ksymtab(|_gpl)|"
> -       "__(start|stop)___kcrctab(|_gpl)|"
> +       "__(start|stop)___ksymtab(_gpl)?|"
> +       "__(start|stop)___kcrctab(_gpl)?|"
>         "__(start|stop)___param|"
>         "__(start|stop)___modver|"
>         "__(start|stop)___bug_table|"
> --
> 2.31.1
>


-- 
Best Regards
Masahiro Yamada
