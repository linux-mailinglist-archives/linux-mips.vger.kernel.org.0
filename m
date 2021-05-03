Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3BB2371575
	for <lists+linux-mips@lfdr.de>; Mon,  3 May 2021 14:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233570AbhECMyu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 May 2021 08:54:50 -0400
Received: from mail-ua1-f43.google.com ([209.85.222.43]:46794 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbhECMyt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 3 May 2021 08:54:49 -0400
Received: by mail-ua1-f43.google.com with SMTP id d30so283171uae.13;
        Mon, 03 May 2021 05:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6sRTDx/pvT9oKMRoUjacP8gFXuJ+4JRD0jTuVOJOzkc=;
        b=SkpUYlGCA04B6Ljct1NGDG3Py2gDKkl1BJqlsrdAS+t7rVOuLntIeubOPYEUSsvA/C
         NlVVsKIPh0qbnaj49cIdr3ZNoiZHZtRhwVfwgwmrFITcDh/hgxE3q6+zzmm/9ooZqjSZ
         2b2b/9219cesIp9W6nmEzmj0DegvSSVBlx1LXclJWBVv1SjuXZ73DV/bD7MMkyCygHHR
         p4eFExKNBeArHiDZwFVXdOo4Pval7vrTymI5HBlmh71yygjZc3Fxh4gxK35Y+JI1oVft
         LwO8uwYyHITRwFTUd8WUlokBpfiLsKY5R2YpoBfjre+sjq/Vn6e6jR07ueSUZjlx8MOo
         aMKQ==
X-Gm-Message-State: AOAM532k/Qw2rwU0QzBxMmYsr7/2L0FV+qxcC258+0RGPFaJfceQeb/k
        Bs/H+8mozP89t4Vgo1/oS7bCyLjthdKSvmeiTyk=
X-Google-Smtp-Source: ABdhPJyY6HmMK+W9rt69v5I2kwTL7IQIj/ouQs0jw6zSbbR1oc5JQ0kbR20w16rDCmSsQz7HN14LdrNs2RquXDAeA5o=
X-Received: by 2002:ab0:5f8d:: with SMTP id b13mr14381698uaj.4.1620046435558;
 Mon, 03 May 2021 05:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210501172437.156926-1-masahiroy@kernel.org> <20210501172437.156926-2-masahiroy@kernel.org>
In-Reply-To: <20210501172437.156926-2-masahiroy@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 3 May 2021 14:53:44 +0200
Message-ID: <CAMuHMdUsXpvUeF4vUWTmAk-ADivHXoVYo-YOw7hB2OGT7qxqLw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arch: use cross_compiling to check whether it is a
 cross build or not
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Chris Zankel <chris@zankel.net>,
        Helge Deller <deller@gmx.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Rich Felker <dalias@libc.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Yamada-san,

On Sat, May 1, 2021 at 7:26 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> 'cross_compiling' is defined by the top Makefile and available for
> arch Makefiles to check whether it is a cross build or not. A good
> thing is the variable name 'cross_compiling' is self-documenting.
>
> This is a simple replacement for m68k, mips, sh, for which $(ARCH)
> and $(SRCARCH) always match.
>
> No functional change is intended for xtensa, either.
>
> This is rather a fix for parisc because arch/parisc/Makefile defines
> UTS_MATCHINE depending on CONFIG_64BIT, therefore cc-cross-prefix
> is not working in Kconfig time.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

>  arch/m68k/Makefile   | 2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
