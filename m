Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3A344C891
	for <lists+linux-mips@lfdr.de>; Wed, 10 Nov 2021 20:08:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232674AbhKJTKf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Nov 2021 14:10:35 -0500
Received: from mail-ua1-f54.google.com ([209.85.222.54]:45760 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232658AbhKJTKf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Nov 2021 14:10:35 -0500
Received: by mail-ua1-f54.google.com with SMTP id ay21so6909483uab.12;
        Wed, 10 Nov 2021 11:07:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JVkOVIMojOtjUqioksXn7GnT56ja9tgOLgQ+4277MEE=;
        b=fjYd9yz6VcyU8bHkb7NCESnndM5ERwt/R6eMIB60oXmL6xMJGL4iOfVRaRj3ar0Jqb
         3ZEaNO3lrz49KdnI5FHckHwpOxhYjMlrxPX5Ht1GYJxlYUKn8PzRzHPzExqrPed2RG1C
         51EoQzXxOzZSyoy0OslIqvMdwKCKUzpJvz7Eq5T7nrMz/r/ATYp8sLlwVAIAJ+yHHY/f
         OVj0zYE5B0d1A2r9SKsvNNoP4gxzcqRnwrclwf1FFd/0RbJNlSsQK0r7NuCpxqNzqf83
         hYRxCeD1LFoto6cfVGkvcv3sKF+9UbmxlHRuHZK+0icxbNnFaGja5x3VBHoNj84zGlVK
         IHKw==
X-Gm-Message-State: AOAM533g65lhvf+wLaq1fqggmL6HldV4WSXOoQaNgbfc6eK3+4/3BDfJ
        0MG0Fpv7Tg2XgJwFuMV/zsC8KMHzrP9Gvg==
X-Google-Smtp-Source: ABdhPJz+5wSNqDwACFvZCj9Bqo/s6w8WqkMTykc6tiPrOZqv3IDJZ4PLRbigmePd99pI/3CXAQqrOQ==
X-Received: by 2002:a05:6102:d94:: with SMTP id d20mr2044416vst.12.1636571265982;
        Wed, 10 Nov 2021 11:07:45 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id u14sm592142vsi.2.2021.11.10.11.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Nov 2021 11:07:45 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id i6so6943206uae.6;
        Wed, 10 Nov 2021 11:07:45 -0800 (PST)
X-Received: by 2002:a05:6102:2910:: with SMTP id cz16mr2351290vsb.9.1636571265036;
 Wed, 10 Nov 2021 11:07:45 -0800 (PST)
MIME-Version: 1.0
References: <ef59d6fd3b2201b912d5eaa7f7a037d8f9adb744.1636561068.git.geert+renesas@glider.be>
 <ddcfa4b9-f7f4-04f5-89f2-b04c284e1945@prevas.dk>
In-Reply-To: <ddcfa4b9-f7f4-04f5-89f2-b04c284e1945@prevas.dk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 10 Nov 2021 20:07:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX_h9Tz8C-2SYyrS_G5BBbBNctqRA1mgKbhmYJxWzF-hg@mail.gmail.com>
Message-ID: <CAMuHMdX_h9Tz8C-2SYyrS_G5BBbBNctqRA1mgKbhmYJxWzF-hg@mail.gmail.com>
Subject: Re: [PATCH/RFC] of: Shrink struct of_device_id
To:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Rasmus,

On Wed, Nov 10, 2021 at 5:51 PM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
> On 10/11/2021 17.23, Geert Uytterhoeven wrote:
> > Currently struct of_device_id is 196 (32-bit) or 200 (64-bit) bytes
> > large.  It contains fixed-size strings for a name, a type, and a
> > compatible value, but the first two are barely used.
> > OF device ID tables contain multiple entries, plus an empty sentinel
> > entry.
> >
> > Statistics for my current kernel source tree:
> >   - 4487 tables with 16836 entries (3367200 bytes)
> >   - 176 names (average 6.7 max 23 chars)
> >   - 66 types (average 5.1 max 21 chars)
> >   - 12192 compatible values (average 18.0 max 45 chars)
> > Taking into account the minimum needed size to store the strings, only
> > 6.9% of the allocated space is used...
> >
> > Reduce kernel size by reducing the sizes of the fixed strings by one
> > half.
>
> Tried something like this 2.5 years ago:
> https://lore.kernel.org/lkml/20190425203101.9403-1-linux@rasmusvillemoes.dk/

I wasn't aware of that.  I reworked some code which used multiple
of_find_compatible_node() calls before, and noticed the end result
had grown a lot due to the sheer size of of_device_id
("[PATCH] soc: renesas: Consolidate product register handling",
 https://lore.kernel.org/all/057721f46c7499de4133135488f0f3da7fb39265.1636570669.git.geert+renesas@glider.be).

> I think that there might be some not-in-tree code that relies on the
> existing layout. I considered adding a CONFIG_ knob, either for these
> sizes in particular, or more generally a def_bool y "CONFIG_LEGACY"
> which embedded folks that build the entire distro from source and don't
> have any legacy things can turn off, and then get more sensible defaults
> all around.

Most of that should have been gone since the #ifdef KERNEL was removed
from include/linux/mod_devicetable.h in commit 6543becf26fff612
("mod/file2alias: make modalias generation safe for cross compiling").
Of course you can never know for sure...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
