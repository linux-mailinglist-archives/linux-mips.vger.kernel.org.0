Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6806A3DB814
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jul 2021 13:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238714AbhG3LyM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Jul 2021 07:54:12 -0400
Received: from mail-vs1-f43.google.com ([209.85.217.43]:44557 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238687AbhG3LyJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 30 Jul 2021 07:54:09 -0400
Received: by mail-vs1-f43.google.com with SMTP id t2so5247878vsa.11;
        Fri, 30 Jul 2021 04:54:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=10AbK6xK8RHobfuB2T0I9ydjpvpHcTKY9gPukwHCGGA=;
        b=YmhSWe4ysVoxpkFxv01nZcYjbowvxAt4AmXoLUb1J5l/9+OVzYtM/U91iSFuVd4j1T
         OOh41vU1X7Q5YEO2iFZlnSlMyK8akuCce5aqJaFeb4HurZk5i/1LZIHnxTCeF8Fjwtop
         KUappP524ABfwUd2AFwE09lg8Mmuo06WYnD5+apwUDyOJO5MIUq+Jvy/N2IttQwvOgF3
         R3LydwxxLjPTHCsCKY7xgLlYA4CXleO5UPOae10xxjHpDHHgznosWs8JvYeCihUtzmTY
         3duBjo7i7c1jqowm3jL2a8f78hL5inxsc9ylnmUxBqxfWiZUdlSJjQ3TXUE3/9wK14Pc
         H5vw==
X-Gm-Message-State: AOAM5303d4WMe9j/oJTT97blA0+lnvq55eCvWzmCWUDxkPK+X74oFZj1
        hH9ZuWXv8hGKrJNelNzFSAfwu74ds1W7dXLHTiM=
X-Google-Smtp-Source: ABdhPJz4vdafBihdMrOKEMxBFoPjbpJQjxu69DET98mge7/3K8Au1C7Ct04O+Z9CWQAOZ0tklY4nnHzuyfbZq+wo9hQ=
X-Received: by 2002:a05:6102:321c:: with SMTP id r28mr1030174vsf.40.1627646043462;
 Fri, 30 Jul 2021 04:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210728182115.4401-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210728182115.4401-1-lukas.bulwahn@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 30 Jul 2021 13:53:52 +0200
Message-ID: <CAMuHMdXt4tYHcgPNUZ0ZQ9iKhmZ_dC=ub=Ha35xDy+jR2-CroQ@mail.gmail.com>
Subject: Re: [PATCH] arch: Kconfig: clean up obsolete use of HAVE_IDE
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        Randy Dunlap <rdunlap@infradead.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:H8/300 ARCHITECTURE" 
        <uclinux-h8-devel@lists.sourceforge.jp>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jul 28, 2021 at 8:21 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> The arch-specific Kconfig files use HAVE_IDE to indicate if IDE is
> supported.
>
> As IDE support and the HAVE_IDE config vanishes with commit b7fb14d3ac63
> ("ide: remove the legacy ide driver"), there is no need to mention
> HAVE_IDE in all those arch-specific Kconfig files.
>
> The issue was identified with ./scripts/checkkconfigsymbols.py.
>
> Fixes: b7fb14d3ac63 ("ide: remove the legacy ide driver")
> Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

>  arch/m68k/Kconfig             | 1 -

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
