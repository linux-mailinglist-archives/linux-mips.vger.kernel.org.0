Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD3A141B7AB
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 21:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242538AbhI1Th6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 15:37:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:51702 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242535AbhI1Th5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Sep 2021 15:37:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF3FA61131;
        Tue, 28 Sep 2021 19:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632857777;
        bh=/hPKLMPJTNrhU1SP0bMA34z2EYxtK4mD++/ujAwU6A4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=h6eGGH0fk6/SkY3p+QaFpdTDka6h9KtK4CpJIjQVf8LiUKr8o+llRxPFcV7LkqV8M
         Z3+hSITUMhBWOBM2/ITWO0IyxyiKGeDl607P7bOazNx5NQbndOq4lieEc+Wyw12tN8
         JOgzDoGxiFUZDjfFNrLZI/af0nt8o+C8qPTkKeGO7Vy4ezfLCYV83GcDdeGAZvFLJD
         nsaEh2q2AhB3eyn708Mfk0UpJq3UzrhLpjTcz80BwIrbgPIoogknndzNBguE5Y/kqL
         e1nweHR9yTNeX6ZXkne0h52alGpPBYgo8VDGfJ/BdTfu8ejPsguJBhAbS/yE4lX/RY
         N20xF3Twn9VIw==
Received: by mail-ed1-f45.google.com with SMTP id r18so11548545edv.12;
        Tue, 28 Sep 2021 12:36:17 -0700 (PDT)
X-Gm-Message-State: AOAM532jdaDAcW49axkMVF+rx0kVtRbH+NvDM/6yM0rictaltYDnVGZU
        V4E+64ttQcMKGd548XNSvnVCVdsFOOIIdB+SaA==
X-Google-Smtp-Source: ABdhPJxkN1rAEe0u7at9IuCHUo7sUflpWJWdcsHHnqh3vlDJJdBMkZRw+1OPM2MmSyluZXfETP88gy0YMvDpRaQqOk4=
X-Received: by 2002:a17:906:fa8a:: with SMTP id lt10mr8741415ejb.320.1632857776271;
 Tue, 28 Sep 2021 12:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210928182139.652896-1-f.fainelli@gmail.com> <20210928182139.652896-10-f.fainelli@gmail.com>
In-Reply-To: <20210928182139.652896-10-f.fainelli@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 28 Sep 2021 14:36:04 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+Hcpj6CCM6hYFC5hpNfm9fcqZXDuyxR4vKn9hzRK-QiA@mail.gmail.com>
Message-ID: <CAL_Jsq+Hcpj6CCM6hYFC5hpNfm9fcqZXDuyxR4vKn9hzRK-QiA@mail.gmail.com>
Subject: Re: [PATCH v3 09/14] irqchip: Provide platform_device to of_irq_init_cb_t
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "moderated list:ARM SUB-ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 28, 2021 at 1:22 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> Provide the platform device mapping to the interrupt controller node to
> the of_irq_init_cb_t callback such that drivers can make use of it.
>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  drivers/irqchip/irqchip.c | 2 +-
>  drivers/of/irq.c          | 2 +-
>  include/linux/of_irq.h    | 5 ++++-
>  3 files changed, 6 insertions(+), 3 deletions(-)

Less invasive than I thought as we lose any function typing. Maybe at
least the one platform driver, drivers/irqchip/qcom-pdc.c, should have
its function parameters updated.

Reviewed-by: Rob Herring <robh@kernel.org>

>
> diff --git a/drivers/irqchip/irqchip.c b/drivers/irqchip/irqchip.c
> index 3570f0a588c4..289784eefd00 100644
> --- a/drivers/irqchip/irqchip.c
> +++ b/drivers/irqchip/irqchip.c
> @@ -55,6 +55,6 @@ int platform_irqchip_probe(struct platform_device *pdev)
>         if (par_np && !irq_find_matching_host(par_np, DOMAIN_BUS_ANY))
>                 return -EPROBE_DEFER;
>
> -       return irq_init_cb(np, par_np);
> +       return irq_init_cb(np, par_np, pdev);
>  }
>  EXPORT_SYMBOL_GPL(platform_irqchip_probe);
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 352e14b007e7..18f3f5c00c87 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -538,7 +538,7 @@ void __init of_irq_init(const struct of_device_id *matches)
>                                  desc->dev,
>                                  desc->dev, desc->interrupt_parent);
>                         ret = desc->irq_init_cb(desc->dev,
> -                                               desc->interrupt_parent);
> +                                               desc->interrupt_parent, NULL);
>                         if (ret) {
>                                 of_node_clear_flag(desc->dev, OF_POPULATED);
>                                 kfree(desc);
> diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
> index aaf219bd0354..89acc8b089f0 100644
> --- a/include/linux/of_irq.h
> +++ b/include/linux/of_irq.h
> @@ -9,7 +9,10 @@
>  #include <linux/ioport.h>
>  #include <linux/of.h>
>
> -typedef int (*of_irq_init_cb_t)(struct device_node *, struct device_node *);
> +struct platform_device;
> +
> +typedef int (*of_irq_init_cb_t)(struct device_node *, struct device_node *,
> +                               struct platform_device *);
>
>  /*
>   * Workarounds only applied to 32bit powermac machines
> --
> 2.25.1
>
