Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA813550ED
	for <lists+linux-mips@lfdr.de>; Tue,  6 Apr 2021 12:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233086AbhDFKcd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 6 Apr 2021 06:32:33 -0400
Received: from mail-vk1-f169.google.com ([209.85.221.169]:39891 "EHLO
        mail-vk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233025AbhDFKcc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 6 Apr 2021 06:32:32 -0400
Received: by mail-vk1-f169.google.com with SMTP id c5so3067501vkm.6;
        Tue, 06 Apr 2021 03:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ad26/T6d/ZnNr0Tc5NnJUf1s5ObiAcmgTWkpXBwrq1s=;
        b=YXwyiDAAm0rPSpsZg95ioR95mBA8TPbyquvhtOMdHdY6vVgh1e4CIsDPuarHmRBS3l
         30fBawZq2JJK00v9NFUjXvpuk3UYcg79cEDhlT4R7bvXrVa6XgUD1jU59KI/1aTJvTIY
         akDa4JJWAFA7/e3id8HBJOqE2S7nzWX02f0qH4LWGhHY8zQzzkJ6InyMRP+RMO7ypkKQ
         bkcHQ1gvn9AvFvyx8csrgB7iGphxMXr9/8Ja703Qhu0M0pj0nFONJb2i01gZy0mMfmuF
         2JEs7TBX1QeS0FVUFD2y2emiNoPygpIqSlGJfAe7zGpScrkMRw+/myEMCx0/Y2BHZ+wL
         A0tw==
X-Gm-Message-State: AOAM530DYT9VGjGJpYHOryw+SMIon5ADWHKZz7BjcQsw+jYtIITbDDc9
        x8h0lRDCt4y/BBBbWEWhYiDr5sVwbtkqkKgJhYA=
X-Google-Smtp-Source: ABdhPJy1swYAK/t2TkG9rGJSNoiYM20SgQO0c4AaA+qpOekp59c92sXbMIYRR9yEXm+63bCKT7TrhAbrySdgxepVyHQ=
X-Received: by 2002:ac5:ce04:: with SMTP id j4mr15807523vki.1.1617705144686;
 Tue, 06 Apr 2021 03:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210406093557.1073423-1-maz@kernel.org> <20210406093557.1073423-5-maz@kernel.org>
In-Reply-To: <20210406093557.1073423-5-maz@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 6 Apr 2021 12:32:13 +0200
Message-ID: <CAMuHMdU3vo1AWuDr69WK8-1w38+Q7KturAoL=cFpspZiYr2ssA@mail.gmail.com>
Subject: Re: [PATCH 4/9] sh: intc: Drop the use of irq_create_identity_mapping()
To:     Marc Zyngier <maz@kernel.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Daniel Mack <daniel@zonque.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Marc,

On Tue, Apr 6, 2021 at 11:44 AM Marc Zyngier <maz@kernel.org> wrote:
> Instead of playing games with using irq_create_identity_mapping()
> and irq_domain_associate(), drop the use of the former and only
> use the latter, together with the allocation of the irq_desc
> as needed.
>
> It doesn't make the code less awful, but at least the intent
> is clearer.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Thanks for your patch!

> --- a/drivers/sh/intc/core.c
> +++ b/drivers/sh/intc/core.c
> @@ -179,6 +179,23 @@ static unsigned int __init save_reg(struct intc_desc_int *d,
>         return 0;
>  }
>
> +static bool __init intc_map(struct irq_domain *domain, int irq)
> +{
> +       int res;

warning: unused variable ‘res’ [-Wunused-variable]

> +
> +       if (!irq_to_desc(irq) && irq_alloc_desc_at(irq, NUMA_NO_NODE) != irq) {
> +               pr_err("uname to allocate IRQ %d\n", irq);
> +               return false;
> +       }
> +
> +       if (irq_domain_associate(domain, irq, irq)) {
> +               pr_err("domain association failure\n");
> +               return false;
> +       }
> +
> +       return true;
> +}
> +
>  int __init register_intc_controller(struct intc_desc *desc)
>  {
>         unsigned int i, k, smp;
> @@ -316,19 +333,8 @@ int __init register_intc_controller(struct intc_desc *desc)

warning: unused variable ‘res’ [-Wunused-variable]

>                 if (!vect->enum_id)
>                         continue;
>
> -               res = irq_create_identity_mapping(d->domain, irq);


> -               if (unlikely(res)) {
> -                       if (res == -EEXIST) {
> -                               res = irq_domain_associate(d->domain, irq, irq);
> -                               if (unlikely(res)) {
> -                                       pr_err("domain association failure\n");
> -                                       continue;
> -                               }
> -                       } else {
> -                               pr_err("can't identity map IRQ %d\n", irq);
> -                               continue;
> -                       }
> -               }
> +               if (!intc_map(d->domain, irq))
> +                       continue;
>
>                 intc_irq_xlate_set(irq, vect->enum_id, d);
>                 intc_register_irq(desc, d, vect->enum_id, irq);

Otherwise this seems to work fine on real hardware (landisk) and qemu
(rts7751r2d).  I did verify that the new function intc_map() is called.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
