Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3458A428902
	for <lists+linux-mips@lfdr.de>; Mon, 11 Oct 2021 10:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235223AbhJKIoM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 Oct 2021 04:44:12 -0400
Received: from mail-ua1-f49.google.com ([209.85.222.49]:45712 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234936AbhJKIoM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 11 Oct 2021 04:44:12 -0400
Received: by mail-ua1-f49.google.com with SMTP id 64so11671870uab.12;
        Mon, 11 Oct 2021 01:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ILfhQ1xCyJpzVVyTRUeYiOGgGsjH3OkmEIE6ubpYA5A=;
        b=FmIlOOWO69ryaHyJx9sVvXIoK1zLqjzsxRP6/9q9w78J1/0DCt+bFWQGbGCO+Jlr4V
         8RE8tJAp90EyDEZzZaORJjuDf1p1PoA0VUO84aQPqyaqmBMTeF0+KAhX3b87U5lO5HGZ
         m7Yag8LTAtHytL51LxIQf04N6B4u2ChnNXfcHc8lj3c7ZBj0/WajX7ou+VXmasJXqr48
         1+sj0G7ckK4dFURv0Q9bVx8xhn1rZG1hiiyT6nBBi/n6+0uevXgIVVRifdo8E06tio1v
         pZLEHl0o3dPddOVN7cflv/XuyApTuP7Q8VGmP/onCnVu+tv8v2I+v33odoyAaab45rwG
         /DYQ==
X-Gm-Message-State: AOAM531gHA6AUEJrHsoSPBLam1Lnn3Aw0ZIKuicDQ5owpUtQDZ9OYkui
        hvV/nvkm2lXptAxBVThJHUgCMhs+pnf8l/M6XZA=
X-Google-Smtp-Source: ABdhPJwa+ZKiDHz9Zuw89anDy7yDddQI/ykQ73DcJ03VPWJOB8v+U/bqxFKnAP+C/tFj6uQTW+VjIp5j6a2L9ifXyto=
X-Received: by 2002:ab0:538a:: with SMTP id k10mr13426605uaa.14.1633941731939;
 Mon, 11 Oct 2021 01:42:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210928075216.4193128-1-arnd@kernel.org> <9dedf9bb-5377-9f2c-cbb1-2a57b40493da@molgen.mpg.de>
In-Reply-To: <9dedf9bb-5377-9f2c-cbb1-2a57b40493da@molgen.mpg.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Oct 2021 10:42:00 +0200
Message-ID: <CAMuHMdXspk27xd95YAsXa73ES8rfKxii3RUEtsBtxQTk9qLztA@mail.gmail.com>
Subject: Re: [PATCH 1/2] firmware: include drivers/firmware/Kconfig unconditionally
To:     Paul Menzel <pmenzel@molgen.mpg.de>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Oct 9, 2021 at 11:24 AM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
> [Cc: +linuxppc-dev@lists.ozlabs.org]
>
> Am 28.09.21 um 09:50 schrieb Arnd Bergmann:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Compile-testing drivers that require access to a firmware layer
> > fails when that firmware symbol is unavailable. This happened
> > twice this week:
> >
> >   - My proposed to change to rework the QCOM_SCM firmware symbol
> >     broke on ppc64 and others.
> >
> >   - The cs_dsp firmware patch added device specific firmware loader
> >     into drivers/firmware, which broke on the same set of
> >     architectures.
> >
> > We should probably do the same thing for other subsystems as well,
> > but fix this one first as this is a dependency for other patches
> > getting merged.
> >

> With this change, I have the new entries below in my .config:
>
> ```
> $ diff -u .config.old .config
> --- .config.old 2021-10-07 11:38:39.544000000 +0200
> +++ .config     2021-10-09 10:02:03.156000000 +0200
> @@ -1992,6 +1992,25 @@
>
>   CONFIG_CONNECTOR=y
>   CONFIG_PROC_EVENTS=y
> +
> +#
> +# Firmware Drivers
> +#
> +
> +#
> +# ARM System Control and Management Interface Protocol
> +#
> +# end of ARM System Control and Management Interface Protocol
> +
> +# CONFIG_FIRMWARE_MEMMAP is not set
> +# CONFIG_GOOGLE_FIRMWARE is not set
> +
> +#
> +# Tegra firmware driver
> +#
> +# end of Tegra firmware driver
> +# end of Firmware Drivers
> +
>   # CONFIG_GNSS is not set
>   CONFIG_MTD=m
>   # CONFIG_MTD_TESTS is not set
> ```
>
> No idea if the entries could be hidden for platforms not supporting them.
>
>          ARM System Control and Management Interface Protocol  ----
>      [ ] Add firmware-provided memory map to sysfs
>      [ ] Google Firmware Drivers  ----
>          Tegra firmware driver  ----

GOOGLE_FIRMWARE should probably depend on something.
I highly doubt Google is running servers on e.g. h8300 and nds32.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
