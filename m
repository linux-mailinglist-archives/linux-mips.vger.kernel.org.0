Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B057444B19C
	for <lists+linux-mips@lfdr.de>; Tue,  9 Nov 2021 17:58:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234770AbhKIRBK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Nov 2021 12:01:10 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:23895 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234305AbhKIRBJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Nov 2021 12:01:09 -0500
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 1A9Gw5u9006278;
        Wed, 10 Nov 2021 01:58:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 1A9Gw5u9006278
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1636477086;
        bh=l+imeXQRv/2ldtFA8MBPtPRVxIzMgeJ7ou5whGv8vFY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uAXqOxNGCl/Cj/dsBHTWGSA7WisXjdy1hxmuZgWALn9MsxrL4BUtjwsvXkG/BCFGV
         n99RT7ZEodKwTUxwHdFOniItwzMT81oPknzgq3EXn5C2tbG4b7YrCJOpxnuJy5yGs6
         Tx/V0+f8gGidFs3P1o3icQ3F7ktzJKxIj+KiuyaEQtMHfvF1+aPnahSqaJXP0K/Yq5
         msRfqfS7hBKUoj22FEBHdUce5mJ2uPugVJ+GjajxFn7LDHTcwlGqTAtjisit1K+BGN
         bz2aNiZ22ehqdZ6lIqnLShJLq44rOImL4dQ7PMYwFZ+VolI8lfWnxChBpAVCbzj7+K
         Tft83bJ3ZPOtQ==
X-Nifty-SrcIP: [209.85.214.169]
Received: by mail-pl1-f169.google.com with SMTP id o14so22012820plg.5;
        Tue, 09 Nov 2021 08:58:06 -0800 (PST)
X-Gm-Message-State: AOAM533+kck0LMA8eQjMMYXaJGRHsjVue4Y/CgWdUu3K1cWiKxTjcDjZ
        pjLa55O6yLbqSAFso69xznPm7QE7qPLMdovEkEQ=
X-Google-Smtp-Source: ABdhPJwi7qZkjQtFz6PpSaTX0nPHD0JjSTOcq/P29C1qjkyah+OwYACj5iWAqG88HBFpYIkkM6M/jI202Qe0SL1RcoQ=
X-Received: by 2002:a17:90b:1d0e:: with SMTP id on14mr8786047pjb.119.1636477085348;
 Tue, 09 Nov 2021 08:58:05 -0800 (PST)
MIME-Version: 1.0
References: <20211105023815.85784-1-masahiroy@kernel.org> <YG0B2R.AN2GMAOFSVCK1@crapouillou.net>
In-Reply-To: <YG0B2R.AN2GMAOFSVCK1@crapouillou.net>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 10 Nov 2021 01:57:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQzUDerTOpaNjSSRAWqwQHC8RY2MX3VeEk_uJS9AXK82w@mail.gmail.com>
Message-ID: <CAK7LNAQzUDerTOpaNjSSRAWqwQHC8RY2MX3VeEk_uJS9AXK82w@mail.gmail.com>
Subject: Re: [PATCH] mips: decompressor: do not copy source files while building
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Alexander Lobakin <alobakin@pm.me>,
        Arnd Bergmann <arnd@arndb.de>,
        Xingxing Su <suxingxing@loongson.cn>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        zhaoxiao <zhaoxiao@uniontech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Nov 9, 2021 at 9:10 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Hi Masahiro,
>
> Le ven., nov. 5 2021 at 11:38:14 +0900, Masahiro Yamada
> <masahiroy@kernel.org> a =C3=A9crit :
> > As commit 7ae4a78daacf ("ARM: 8969/1: decompressor: simplify libfdt
> > builds") stated, copying source files during the build time may not
> > end up with as clean code as expected.
> >
> > Do similar for mips to clean up the Makefile and .gitignore.
>
> What did you base this patch on?
>
> It does not apply cleanly here. It tries to create ashldi3.c and
> bswapsi.c, which already exist.
>

Please remove them manually
before 'git am'.


--=20
Best Regards
Masahiro Yamada
