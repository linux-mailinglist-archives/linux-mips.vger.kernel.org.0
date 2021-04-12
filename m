Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9556435BB17
	for <lists+linux-mips@lfdr.de>; Mon, 12 Apr 2021 09:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236924AbhDLHo7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Apr 2021 03:44:59 -0400
Received: from mail-ua1-f52.google.com ([209.85.222.52]:36376 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbhDLHo7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Apr 2021 03:44:59 -0400
Received: by mail-ua1-f52.google.com with SMTP id c2so3957888uaj.3;
        Mon, 12 Apr 2021 00:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JXZ2evZ1HlMgd5dQiMnzV28T68ypmIxoPU4uM5YLJDY=;
        b=Vinz3BFRyvpJ+vPsgG2IHGgWyJ+J8qtd8bLpImK4DDLmbkCUPCNIMZWEKt+NjupWm5
         2ILHj0eESMASOTNIFBtSPfAdJWqP1PHkH5HWbngQ7Rfz+H7RFXEscjS8U9sfznVSHZxB
         TMEl4824r/zv2tbc4odVjVsq62lxAhXO2f0YuytydOybUOaEie3QRaZH3Y5aNNoLI1YA
         oU2fXBbPCcMJGxfWKKIVClOAPXWGKJ+l81wD0GqmDq7z0+oHtB1qydmJEJrN85j9ovdi
         gxArkn6VmNu/345caKMkTAz0r1bZKOnyURoJEWSQv28ms+MNpMbj6UKKWTjwjAfCOua/
         kcfg==
X-Gm-Message-State: AOAM530g4qnct9/xmuRglWUL0gvLG1tg+K8SIrH+6cXJ1FdymOznW8EV
        ZNPAMXL2HBI0vPy+QJBBsO4Z7BNRjKop0d2D5WO2+7LiPko=
X-Google-Smtp-Source: ABdhPJx+WwlU+f/sxyzlKoozSp4V5pjbJlg2tOYyn632dPGmXpWO0oMiT+z+uxKe9nNXFSbUevs6IBKhAohcjgM8HOo=
X-Received: by 2002:a9f:262c:: with SMTP id 41mr8642842uag.4.1618213481107;
 Mon, 12 Apr 2021 00:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210411135532.219797-1-masahiroy@kernel.org>
In-Reply-To: <20210411135532.219797-1-masahiroy@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Apr 2021 09:44:29 +0200
Message-ID: <CAMuHMdUtqSv6PUfLtuGoBSgqqM4CkwSkT3nKstXRKN1tuXrQ_g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: use ?= to assign CROSS_COMPILE by arch-Makefile
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Helge Deller <deller@gmx.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Rich Felker <dalias@libc.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vineet Gupta <vgupta@synopsys.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        arcml <linux-snps-arc@lists.infradead.org>,
        "moderated list:H8/300 ARCHITECTURE" 
        <uclinux-h8-devel@lists.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Yamada-san,

On Sun, Apr 11, 2021 at 3:56 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> Use ?= operator to let arch/*/Makefile to assign CROSS_COMPILE only
> when CROSS_COMPILE is undefined.
>
> This allows arch-Makefiles to drop the ifeq ($(CROSS_COMPILE),)
> conditional.
>
> This slightly changes the behavior; the arch-Makefile previously
> overrode CROSS_COMPILE when CROSS_COMPILE has already been made empty
> via an environment variable as in 'export CROSS_COMPILE='.
>
> With this commit, arch-Makefle will respect the user's environment
> set-up, which seems to be a more correct behavior.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for your patch!

> ---
>
>  arch/arc/Makefile    | 4 +---
>  arch/h8300/Makefile  | 4 +---
>  arch/m68k/Makefile   | 4 +---
>  arch/mips/Makefile   | 4 +---
>  arch/parisc/Makefile | 6 ++----
>  arch/sh/Makefile     | 4 +---

What about arch/xtensa/Makefile?

> --- a/arch/m68k/Makefile
> +++ b/arch/m68k/Makefile
> @@ -17,10 +17,8 @@
>  KBUILD_DEFCONFIG := multi_defconfig
>
>  ifneq ($(SUBARCH),$(ARCH))
> -       ifeq ($(CROSS_COMPILE),)
> -               CROSS_COMPILE := $(call cc-cross-prefix, \
> +       CROSS_COMPILE ?= $(call cc-cross-prefix, \
>                         m68k-linux-gnu- m68k-linux- m68k-unknown-linux-gnu-)
> -       endif
>  endif

This does not seem to work as expected: my standard build scripts
(using "make ARCH=m68k") no longer pick up the cross-compiler,
but fall back to the native compiler, thus breaking the build.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
