Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01AE9419FD0
	for <lists+linux-mips@lfdr.de>; Mon, 27 Sep 2021 22:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236755AbhI0ULC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 16:11:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:59614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236750AbhI0ULC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 27 Sep 2021 16:11:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2F8F6103B;
        Mon, 27 Sep 2021 20:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632773363;
        bh=J4WKzNfsIiazj7H7fCzN53GkjN+q2BUUdv7RdPQ+jvs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=iz+rXT9iurX/Sbwxr0JiSOuhKGhkSJ/ZvA9uw914KWJpvAANWwMdb/MtedCiS54lS
         O4dVlseh6GqrUxg1YD+XyKKd+SwGAuj8FFf5ji70+pHdB4/pRrUxxo8jf8IudGCDtu
         LtBnr3LkhDr5Hfzmbruf/81BbM7+KWYfUt9oMhE2sH/EqooPTEMF5VjZ5LXEAAh9hO
         z2CiZ7lgLXGHXi7oXi2Td1tROFYJz/ERayeCuMoOF7473nW6Y0xZlsqx5Zblamfymm
         5XKvXVyLbE8UF++l1RJyUg7RBYeHIXiU6vEP5mRK5UT5zlQq7jHKbA1wRxDbH0Wixx
         nRXT2zqo1kryQ==
Received: by mail-ed1-f41.google.com with SMTP id v18so38724181edc.11;
        Mon, 27 Sep 2021 13:09:23 -0700 (PDT)
X-Gm-Message-State: AOAM531QT4+7eR985DjBPxx7rdtJt9rzt0fInld5E3uodnIFioP8EpAR
        i6/mC//ZFMbiFAx31iJcZp3aTs8w/7n66+C/PQ==
X-Google-Smtp-Source: ABdhPJxbTiYP0k9mhq1FBUZhdcuB5HPJYzGx22XyKvmETyk5vs8udAVSQV3XRcc2g52kNbQN3yNH7Cekm4PkAhhcRnQ=
X-Received: by 2002:a17:906:7217:: with SMTP id m23mr2177174ejk.466.1632773362346;
 Mon, 27 Sep 2021 13:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210924170546.805663-1-f.fainelli@gmail.com> <20210924170546.805663-8-f.fainelli@gmail.com>
 <CAL_JsqLSiCb7-tHW3VTOTdMt=qahAij77zF2us-CZqXYAi0jmg@mail.gmail.com>
 <b9bf844c-b6c0-9277-07e0-7592527ce4e4@gmail.com> <CAL_JsqLv+RrmtDPTuMxtjbqAbGvEeAY_oOE5GqrPdP9ZpNGzqw@mail.gmail.com>
 <ec13207a-08b4-cbc4-7f29-1ce25ce1ebd0@gmail.com>
In-Reply-To: <ec13207a-08b4-cbc4-7f29-1ce25ce1ebd0@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 27 Sep 2021 15:09:10 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKyFeSn=6PiFHNZR7oTy9A5VdmD7U3=Za0qyofPB6aoMA@mail.gmail.com>
Message-ID: <CAL_JsqKyFeSn=6PiFHNZR7oTy9A5VdmD7U3=Za0qyofPB6aoMA@mail.gmail.com>
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

On Mon, Sep 27, 2021 at 2:49 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 9/27/21 12:43 PM, Rob Herring wrote:
> > On Mon, Sep 27, 2021 at 2:28 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> >>
> >> On 9/27/21 12:08 PM, Rob Herring wrote:
> >>> On Fri, Sep 24, 2021 at 12:07 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> >>>>
> >>>> In order to build drivers/irqchip/irq-bcm7120-l2.c as a module, we will
> >>>> need to have of_irq_count() exported to modules.
> >>>>
> >>>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> >>>> ---
> >>>>  drivers/of/irq.c | 1 +
> >>>>  1 file changed, 1 insertion(+)
> >>>>
> >>>> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> >>>> index 352e14b007e7..949b9d1f8729 100644
> >>>> --- a/drivers/of/irq.c
> >>>> +++ b/drivers/of/irq.c
> >>>> @@ -440,6 +440,7 @@ int of_irq_count(struct device_node *dev)
> >>>>
> >>>>         return nr;
> >>>>  }
> >>>> +EXPORT_SYMBOL_GPL(of_irq_count);
> >>>
> >>> Please convert to use platform_irq_count() instead.
> >>
> >> That requires a platform_device to be passed to platform_irq_count(),
> >> will that work even when the drivers remain built into the kernel and
> >> get initialized early on?
> >
> > No, does your irqchip using this do both? Looks to me like it is
> > always a platform_device.
>
> On ARM/ARM64 not using GKI as well as MIPS, we would want the module to
> be built into the kernel image, however when using GKI that driver would
> become a module. How do you suggest reconciling both usages?

What's there to resolve? Every driver that works as a module can be
built-in. Is there something special about irqchip drivers?

The only issue I see here is platform_irqchip_probe() doesn't pass the
platform_device pointer to the irq_init_cb function. There's 3 ways to
fix that. Add a platform_device pointer to the init hook. That's a
global change though. That's the right thing to do IMO. Or you can use
of_find_device_by_node(). That's fairly expensive, but easy and
isolated. You could also set device_node.data pointer to the
platform_device, but ideally I'd like to get rid of that pointer as
it's hardly used.

Rob
