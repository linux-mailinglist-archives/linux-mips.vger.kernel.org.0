Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1A0E419F58
	for <lists+linux-mips@lfdr.de>; Mon, 27 Sep 2021 21:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236605AbhI0Tpj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 15:45:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:48744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236610AbhI0Tpi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 27 Sep 2021 15:45:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D36661041;
        Mon, 27 Sep 2021 19:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632771840;
        bh=8GrvKu/IUbzbbcM+kL2hJO4c/ubmgYOvUvLZLycF9Vk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FCmXzIZyGDB0q81LQrHgBYVc22gJNKM4XS2kS49NDNIjzpQox4jTqNwDUUoUgqISc
         tAEeY3XkNfhf2j4NldvO4CBl5YyI2dqSc2qS1LnjiFYzNn7mQrJ34jPre0xGOMTLfK
         ShgtDMYy6WlfhbNpnly/x9Nn2+ums+zAhkZaPKioT9U7byyFEENU0HIMIE/xej+hPJ
         6rDOq9+39HVadw2KsYSDBbbYJA6H64cPz3YQlYVG2JFPaNCIJi2JLubUlxxQhWBvsX
         V9In+EXzzWZobxD1bB5nrlOlr5NtODACdm6y/B7qIKoBuhDT2SchJR8r9/wK2OBM3P
         YdUqbY2txNJ+g==
Received: by mail-ed1-f45.google.com with SMTP id ee50so73824957edb.13;
        Mon, 27 Sep 2021 12:43:59 -0700 (PDT)
X-Gm-Message-State: AOAM532UskswrjJxcs6O0GTWFodRRjPgqogXJu35Bl/c0XYmcvM7+5yt
        PyJEiBri+m71yqtCYTWkvvXsHDAl958VpdzDVQ==
X-Google-Smtp-Source: ABdhPJw0CYw78V/Ve0LRrStC/Z1ltF3mBSTTa+t2nz9TbflXF/Q5qk+QdRrlblPLEiSKsEprKHUdoxnZXde7l3xfk+s=
X-Received: by 2002:a17:906:a294:: with SMTP id i20mr2146924ejz.128.1632771838384;
 Mon, 27 Sep 2021 12:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210924170546.805663-1-f.fainelli@gmail.com> <20210924170546.805663-8-f.fainelli@gmail.com>
 <CAL_JsqLSiCb7-tHW3VTOTdMt=qahAij77zF2us-CZqXYAi0jmg@mail.gmail.com> <b9bf844c-b6c0-9277-07e0-7592527ce4e4@gmail.com>
In-Reply-To: <b9bf844c-b6c0-9277-07e0-7592527ce4e4@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 27 Sep 2021 14:43:47 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLv+RrmtDPTuMxtjbqAbGvEeAY_oOE5GqrPdP9ZpNGzqw@mail.gmail.com>
Message-ID: <CAL_JsqLv+RrmtDPTuMxtjbqAbGvEeAY_oOE5GqrPdP9ZpNGzqw@mail.gmail.com>
Subject: Re: [PATCH 07/11] of/irq: Export of_irq_count to drivers
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
        "open list:SUPERH" <linux-sh@vger.kernel.org>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <linux-mips@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Sep 27, 2021 at 2:28 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 9/27/21 12:08 PM, Rob Herring wrote:
> > On Fri, Sep 24, 2021 at 12:07 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> >>
> >> In order to build drivers/irqchip/irq-bcm7120-l2.c as a module, we will
> >> need to have of_irq_count() exported to modules.
> >>
> >> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> >> ---
> >>  drivers/of/irq.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> >> index 352e14b007e7..949b9d1f8729 100644
> >> --- a/drivers/of/irq.c
> >> +++ b/drivers/of/irq.c
> >> @@ -440,6 +440,7 @@ int of_irq_count(struct device_node *dev)
> >>
> >>         return nr;
> >>  }
> >> +EXPORT_SYMBOL_GPL(of_irq_count);
> >
> > Please convert to use platform_irq_count() instead.
>
> That requires a platform_device to be passed to platform_irq_count(),
> will that work even when the drivers remain built into the kernel and
> get initialized early on?

No, does your irqchip using this do both? Looks to me like it is
always a platform_device.

Rob
