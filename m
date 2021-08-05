Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB643E142F
	for <lists+linux-mips@lfdr.de>; Thu,  5 Aug 2021 13:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239455AbhHELyS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Aug 2021 07:54:18 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:41085 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230446AbhHELyR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Aug 2021 07:54:17 -0400
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 175BrnGx002703;
        Thu, 5 Aug 2021 20:53:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 175BrnGx002703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1628164430;
        bh=CsrL3IdMWK0F9Biu26lz+I5XiXsODgPZHQpYed3cgks=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BhiQqijILqqkwp0ix5/EpdHf/4twm9517pnXfbplS6d9UdnvNrPJkSHskduecFwHm
         eLon+nSw1xcefwJcu8/Ju8wYrfe8HeaBkzR8HgXs6z4qTLbEY20zZGvkniShuCF17m
         d5lThuwhO4zKXlsWf2FlqFhvhu1Wxm5wZ9ndEzFNaN9zCgluttX91uXILjMX+mQXXp
         rtUQ5PJ2+se/m2HrGL7kaL8T1dkO1KofqyYRK+Dik7MzWK97iRwODjvj/il++o8odn
         mo5X2CXmKTH0qtc7vieNhn+whDEwpHTy6xp1kbrERK4o8J3v+/QRgQoqJtpK7Omrvs
         8jus/uBUBf35g==
X-Nifty-SrcIP: [209.85.216.44]
Received: by mail-pj1-f44.google.com with SMTP id l19so8152561pjz.0;
        Thu, 05 Aug 2021 04:53:49 -0700 (PDT)
X-Gm-Message-State: AOAM5325ZJDNBbOMNYU7wIxSDGGKRICm/xuEDrPGP6v2qIZehb0RvXNG
        q46hez1pg91VSjliKQlrZYRXDxvHNN6up2xH9hw=
X-Google-Smtp-Source: ABdhPJwCLABAQnoXt+eS/QGSvvvnJtVkYZ910Oz0uZWtdMhQwEOWG3gXWiT++AvnmGLTSK+RZmlMTkd5eEoF5kU/WzY=
X-Received: by 2002:a63:1b5c:: with SMTP id b28mr420310pgm.175.1628164429105;
 Thu, 05 Aug 2021 04:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1625734629.git.hns@goldelico.com> <f1be72eb0fd589df5a535792a3f21949bd46da50.1625734629.git.hns@goldelico.com>
In-Reply-To: <f1be72eb0fd589df5a535792a3f21949bd46da50.1625734629.git.hns@goldelico.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 5 Aug 2021 20:53:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNARJbEZt_erpOw20S_fz-G5rZrEBTgY4RrHV5-+iTrxesg@mail.gmail.com>
Message-ID: <CAK7LNARJbEZt_erpOw20S_fz-G5rZrEBTgY4RrHV5-+iTrxesg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arch: mips: Fix non-POSIX regexp
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
> When cross compiling a MIPS kernel on a BSD based HOSTCC leads
> to errors like
>
>   SYNC    include/config/auto.conf.cmd - due to: .config
> egrep: empty (sub)expression
>   UPD     include/config/kernel.release
>   HOSTCC  scripts/dtc/dtc.o - due to target missing
>
> It turns out that egrep uses this egrep pattern:
>
>                 (|MINOR_|PATCHLEVEL_)
>
> This is not valid syntax or gives undefined results according
> to POSIX 9.5.3 ERE Grammar
>
>         https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap09.html
>
> It seems to be silently accepted by the Linux egrep implementation
> while a BSD host complains.
>
> Such patterns can be replaced by a transformation like
>
>         "(|p1|p2)" -> "(p1|p2)?"
>
> Fixes: 48c35b2d245f ("[MIPS] There is no __GNUC_MAJOR__")
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---

Applied to linux-kbuild/fixes.
Thanks.



>  arch/mips/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index 258234c35a096..674f68d16a73f 100644
> --- a/arch/mips/Makefile
> +++ b/arch/mips/Makefile
> @@ -321,7 +321,7 @@ KBUILD_LDFLAGS              += -m $(ld-emul)
>
>  ifdef CONFIG_MIPS
>  CHECKFLAGS += $(shell $(CC) $(KBUILD_CFLAGS) -dM -E -x c /dev/null | \
> -       egrep -vw '__GNUC_(|MINOR_|PATCHLEVEL_)_' | \
> +       egrep -vw '__GNUC_(MINOR_|PATCHLEVEL_)?_' | \
>         sed -e "s/^\#define /-D'/" -e "s/ /'='/" -e "s/$$/'/" -e 's/\$$/&&/g')
>  endif
>
> --
> 2.31.1
>


-- 
Best Regards
Masahiro Yamada
