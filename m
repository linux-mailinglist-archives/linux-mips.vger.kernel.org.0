Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 788321C77A1
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2020 19:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729997AbgEFRRU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 May 2020 13:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbgEFRRT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 May 2020 13:17:19 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74378C061A0F
        for <linux-mips@vger.kernel.org>; Wed,  6 May 2020 10:17:18 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t16so764313plo.7
        for <linux-mips@vger.kernel.org>; Wed, 06 May 2020 10:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/k/x3jvD4hIY8pDNsyuRYJAWCjnjlkQj95o1100b+nU=;
        b=AoWlyDRvgvgfz7OXgRvmqbZq6U8eVGyvK/25YzVKraEel8OmtkOdz2BW5cyKKN+B9T
         lEgbKudq8lqfvZcc0Bi648R42oxIhUjrYoffQ8Pl1H0dbp92fpYcf/ynrRCKVnTxHnc2
         jkJnZkh325ckYdhrmmHLfDG16i0rJSiyd+Zv3Qt4C+5MhFk8kmN7vsaFKHVJhFnVi28I
         BUftmHbmElrqRsxk91bDZkkdM2b6RMZpk2ctFThP4FhABx3J6RNF4W7EfO8FzFbMsf7v
         CCXjr9xbkvksrdNlppx8YSdgFiilZJpQOX2Atv6Tgjvh+0RwwMnHTy8wof2Roe99T5MU
         Cf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/k/x3jvD4hIY8pDNsyuRYJAWCjnjlkQj95o1100b+nU=;
        b=bFV5aIKCExeuwfhrA1Jm9AHamD+pvZ3ZJtEjleuOvB8XeMojEj66oOb9JI357ZKMgE
         Q0lYAgnNQllGJXA0/LrsBSI0uDT3t5djxO+pZGaCh+iZeMTop+hjBbaMFTOIxFexJQ97
         +TTfao3dpsj5bzHW2hJJgq88ABvp76p/aQ1voj+Sr1JrZBkfDkTcc5YOMOgf8NC69kwt
         xa8v2ni4sn32tV+01yyeAdgFVlXY5HhLZkLi/VEexY5Fsa0oQnfqIhv5jZmsMAdCaFbh
         9UqxDUUyNxcBcfr9RB5KF0hw0WhOXEaoXEAZlW38vy/lb9GoN4eyxVnp3hmBQGTuQ04H
         gz9w==
X-Gm-Message-State: AGi0PuZuu9iG9jf2FFQ1MP2mtwR3ASMevny/eJcyOeydLnH8N3IDhUs2
        8Pz0mmjh6YjVa0ysQ0fZcQonIYmo2ZZhm4TGRUCnnpEV
X-Google-Smtp-Source: APiQypLnpQ9fey9MWfkvN5jK3cTisnhcJeTBQn37c1umPrLJpul/zCxeo6IzqY/pYCZUn/CL8vsxMaNBNscsUYb0zG8=
X-Received: by 2002:a17:902:ac87:: with SMTP id h7mr8736134plr.119.1588785437559;
 Wed, 06 May 2020 10:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200506055245.3013374-1-jiaxun.yang@flygoat.com>
In-Reply-To: <20200506055245.3013374-1-jiaxun.yang@flygoat.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 6 May 2020 10:17:06 -0700
Message-ID: <CAKwvOdkmK7QdbZFKCCao9W8cJcOR_M-LyOkL3_Ms7amegv499w@mail.gmail.com>
Subject: Re:
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "Maciej W . Rozycki" <macro@linux-mips.org>,
        Fangrui Song <maskray@google.com>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jouni Hogander <jouni.hogander@unikie.com>,
        Kevin Darbyshire-Bryant <ldir@darbyshire-bryant.me.uk>,
        Borislav Petkov <bp@suse.de>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 5, 2020 at 10:52 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> Subject: [PATCH v6] MIPS: Truncate link address into 32bit for 32bit kernel
> In-Reply-To: <20200413062651.3992652-1-jiaxun.yang@flygoat.com>
>
> LLD failed to link vmlinux with 64bit load address for 32bit ELF
> while bfd will strip 64bit address into 32bit silently.
> To fix LLD build, we should truncate load address provided by platform
> into 32bit for 32bit kernel.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/786
> Link: https://sourceware.org/bugzilla/show_bug.cgi?id=25784
> Reviewed-by: Fangrui Song <maskray@google.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Tested-by: Nathan Chancellor <natechancellor@gmail.com>
> Cc: Maciej W. Rozycki <macro@linux-mips.org>

Cool, this revision looks a bit simpler. Thanks for chasing this.
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> V2: Take MaskRay's shell magic.
>
> V3: After spent an hour on dealing with special character issue in
> Makefile, I gave up to do shell hacks and write a util in C instead.
> Thanks Maciej for pointing out Makefile variable problem.
>
> v4: Finally we managed to find a Makefile method to do it properly
> thanks to Kees. As it's too far from the initial version, I removed
> Review & Test tag from Nick and Fangrui and Cc instead.
>
> v5: Care vmlinuz as well.
>
> v6: Rename to LIKER_LOAD_ADDRESS
> ---
>  arch/mips/Makefile                 | 13 ++++++++++++-
>  arch/mips/boot/compressed/Makefile |  2 +-
>  arch/mips/kernel/vmlinux.lds.S     |  2 +-
>  3 files changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index e1c44aed8156..68c0f22fefc0 100644
> --- a/arch/mips/Makefile
> +++ b/arch/mips/Makefile
> @@ -288,12 +288,23 @@ ifdef CONFIG_64BIT
>    endif
>  endif
>
> +# When linking a 32-bit executable the LLVM linker cannot cope with a
> +# 32-bit load address that has been sign-extended to 64 bits.  Simply
> +# remove the upper 32 bits then, as it is safe to do so with other
> +# linkers.
> +ifdef CONFIG_64BIT
> +       load-ld                 = $(load-y)
> +else
> +       load-ld                 = $(subst 0xffffffff,0x,$(load-y))
> +endif
> +
>  KBUILD_AFLAGS  += $(cflags-y)
>  KBUILD_CFLAGS  += $(cflags-y)
> -KBUILD_CPPFLAGS += -DVMLINUX_LOAD_ADDRESS=$(load-y)
> +KBUILD_CPPFLAGS += -DVMLINUX_LOAD_ADDRESS=$(load-y) -DLINKER_LOAD_ADDRESS=$(load-ld)
>  KBUILD_CPPFLAGS += -DDATAOFFSET=$(if $(dataoffset-y),$(dataoffset-y),0)
>
>  bootvars-y     = VMLINUX_LOAD_ADDRESS=$(load-y) \
> +                 LINKER_LOAD_ADDRESS=$(load-ld) \
>                   VMLINUX_ENTRY_ADDRESS=$(entry-y) \
>                   PLATFORM="$(platform-y)" \
>                   ITS_INPUTS="$(its-y)"
> diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
> index 0df0ee8a298d..3d391256ab7e 100644
> --- a/arch/mips/boot/compressed/Makefile
> +++ b/arch/mips/boot/compressed/Makefile
> @@ -90,7 +90,7 @@ ifneq ($(zload-y),)
>  VMLINUZ_LOAD_ADDRESS := $(zload-y)
>  else
>  VMLINUZ_LOAD_ADDRESS = $(shell $(obj)/calc_vmlinuz_load_addr \
> -               $(obj)/vmlinux.bin $(VMLINUX_LOAD_ADDRESS))
> +               $(obj)/vmlinux.bin $(LINKER_LOAD_ADDRESS))
>  endif
>  UIMAGE_LOADADDR = $(VMLINUZ_LOAD_ADDRESS)
>
> diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
> index a5f00ec73ea6..5226cd8e4bee 100644
> --- a/arch/mips/kernel/vmlinux.lds.S
> +++ b/arch/mips/kernel/vmlinux.lds.S
> @@ -55,7 +55,7 @@ SECTIONS
>         /* . = 0xa800000000300000; */
>         . = 0xffffffff80300000;
>  #endif
> -       . = VMLINUX_LOAD_ADDRESS;
> +       . = LINKER_LOAD_ADDRESS;
>         /* read-only */
>         _text = .;      /* Text and read-only data */
>         .text : {
>
> --

-- 
Thanks,
~Nick Desaulniers
