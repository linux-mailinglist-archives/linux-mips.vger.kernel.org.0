Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A916132F7F4
	for <lists+linux-mips@lfdr.de>; Sat,  6 Mar 2021 04:08:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbhCFDHb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Mar 2021 22:07:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:58210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229597AbhCFDHE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 5 Mar 2021 22:07:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA0B065014;
        Sat,  6 Mar 2021 03:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615000023;
        bh=zn0JFhWLOx0WKJo1sTK7pkbGvSLJIhKUGcL1D3bVCD8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bEVVbEpTudN8Y2ipurYkBGUn4RvhuwNINHyTxFqxGPRuYxhCmwZZkgJLcdZwbds8u
         dgQJWFbdwmbaYVTCDkL60yjtpETVcR36dVKFb5sLh0XETFNGMx45WypasWGI7dsvb+
         qLjU5wazV1qfS2IWO09NtzYHbfk3J4qGf91ofr4pdYi0T9pv3KAsexIkeVWUWoXcJm
         yYkIGJJxAcSOWxSqH0RoA3LUDCccTCmfInByyx+CBGDTETLPPvw+JZqbQFC5DfAfI7
         l8IZ2OXmfj0Q+YR1yO7XGT1UpkD402MkLsmCLthTU9+blgEB8Xmg3KyKuZIOrsEm9+
         2G/X2gz83gf4A==
Received: by mail-il1-f182.google.com with SMTP id g9so3847761ilc.3;
        Fri, 05 Mar 2021 19:07:03 -0800 (PST)
X-Gm-Message-State: AOAM531f2cPdbvI3GfZXE+UCOJDZsuun69/kRgtjka4vIEa2dyChzabX
        2H9e37os5fRFr6+XDeymnwhxWXiOsq+EN2ttqbU=
X-Google-Smtp-Source: ABdhPJwU2xZ1RY207vdVebt1O7FNVEfwrFz4GeIUIch52Xl3MSqUGTVF8NpNxvoTFd9J7zH42cxwsrtTlcglABgmUA8=
X-Received: by 2002:a05:6e02:b2c:: with SMTP id e12mr11142438ilu.143.1615000023173;
 Fri, 05 Mar 2021 19:07:03 -0800 (PST)
MIME-Version: 1.0
References: <20210306023633.9579-1-zhangqing@loongson.cn> <20210306023633.9579-6-zhangqing@loongson.cn>
In-Reply-To: <20210306023633.9579-6-zhangqing@loongson.cn>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Sat, 6 Mar 2021 11:06:51 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7vrq2GRL0m7ZAhvK2XOELx_3s8-VjmkMJn1ZkL28fwfQ@mail.gmail.com>
Message-ID: <CAAhV-H7vrq2GRL0m7ZAhvK2XOELx_3s8-VjmkMJn1ZkL28fwfQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] irqchip/loongson-liointc: irqchip add 2.0 version
To:     Qing Zhang <zhangqing@loongson.cn>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, wangming01@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Qing,

On Sat, Mar 6, 2021 at 10:36 AM Qing Zhang <zhangqing@loongson.cn> wrote:
>
> Add IO interrupt controller support for Loongson 2k1000, different
> from the 3a series is that 2K1000 has 64 interrupt sources, 0-31
> correspond to the device tree liointc0 device node, and the other
> correspond to liointc1 node.
Use the formal name (Loongson-2K1000, Loongson-3A series), please.

Huacai
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> ---
>
> v2-v3: No change
>
>  drivers/irqchip/irq-loongson-liointc.c | 55 +++++++++++++++++++++-----
>  1 file changed, 46 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-loongson-liointc.c
> index 09b91b81851c..1c3c80f7f9f5 100644
> --- a/drivers/irqchip/irq-loongson-liointc.c
> +++ b/drivers/irqchip/irq-loongson-liointc.c
> @@ -20,6 +20,7 @@
>
>  #define LIOINTC_CHIP_IRQ       32
>  #define LIOINTC_NUM_PARENT 4
> +#define LIOINTC_NUM_CORES      4
>
>  #define LIOINTC_INTC_CHIP_START        0x20
>
> @@ -42,6 +43,7 @@ struct liointc_handler_data {
>  struct liointc_priv {
>         struct irq_chip_generic         *gc;
>         struct liointc_handler_data     handler[LIOINTC_NUM_PARENT];
> +       void __iomem                    *core_isr[LIOINTC_NUM_CORES];
>         u8                              map_cache[LIOINTC_CHIP_IRQ];
>         bool                            has_lpc_irq_errata;
>  };
> @@ -51,11 +53,12 @@ static void liointc_chained_handle_irq(struct irq_desc *desc)
>         struct liointc_handler_data *handler = irq_desc_get_handler_data(desc);
>         struct irq_chip *chip = irq_desc_get_chip(desc);
>         struct irq_chip_generic *gc = handler->priv->gc;
> +       int core = get_ebase_cpunum() % LIOINTC_NUM_CORES;
>         u32 pending;
>
>         chained_irq_enter(chip, desc);
>
> -       pending = readl(gc->reg_base + LIOINTC_REG_INTC_STATUS);
> +       pending = readl(handler->priv->core_isr[core]);
>
>         if (!pending) {
>                 /* Always blame LPC IRQ if we have that bug */
> @@ -141,6 +144,15 @@ static void liointc_resume(struct irq_chip_generic *gc)
>  }
>
>  static const char * const parent_names[] = {"int0", "int1", "int2", "int3"};
> +static const char * const core_reg_names[] = {"isr0", "isr1", "isr2", "isr3"};
> +
> +static void __iomem *liointc_get_reg_byname(struct device_node *node,
> +                                               const char *name)
> +{
> +       int index = of_property_match_string(node, "reg-names", name);
> +
> +       return of_iomap(node, index);
> +}
>
>  static int __init liointc_of_init(struct device_node *node,
>                                   struct device_node *parent)
> @@ -159,10 +171,28 @@ static int __init liointc_of_init(struct device_node *node,
>         if (!priv)
>                 return -ENOMEM;
>
> -       base = of_iomap(node, 0);
> -       if (!base) {
> -               err = -ENODEV;
> -               goto out_free_priv;
> +       if (of_device_is_compatible(node, "loongson,liointc-2.0")) {
> +               base = liointc_get_reg_byname(node, "main");
> +               if (!base) {
> +                       err = -ENODEV;
> +                       goto out_free_priv;
> +               }
> +               for (i = 0; i < LIOINTC_NUM_CORES; i++) {
> +                       priv->core_isr[i] =
> +                               liointc_get_reg_byname(node, core_reg_names[i]);
> +               }
> +               if (!priv->core_isr[0]) {
> +                       err = -ENODEV;
> +                       goto out_iounmap_base;
> +               }
> +       } else {
> +               base = of_iomap(node, 0);
> +               if (!base) {
> +                       err = -ENODEV;
> +                       goto out_free_priv;
> +               }
> +               for (i = 0; i < LIOINTC_NUM_CORES; i++)
> +                       priv->core_isr[i] = base + LIOINTC_REG_INTC_STATUS;
>         }
>
>         for (i = 0; i < LIOINTC_NUM_PARENT; i++) {
> @@ -172,7 +202,7 @@ static int __init liointc_of_init(struct device_node *node,
>         }
>         if (!have_parent) {
>                 err = -ENODEV;
> -               goto out_iounmap;
> +               goto out_iounmap_isr;
>         }
>
>         sz = of_property_read_variable_u32_array(node,
> @@ -183,7 +213,7 @@ static int __init liointc_of_init(struct device_node *node,
>         if (sz < 4) {
>                 pr_err("loongson-liointc: No parent_int_map\n");
>                 err = -ENODEV;
> -               goto out_iounmap;
> +               goto out_iounmap_isr;
>         }
>
>         for (i = 0; i < LIOINTC_NUM_PARENT; i++)
> @@ -195,7 +225,7 @@ static int __init liointc_of_init(struct device_node *node,
>         if (!domain) {
>                 pr_err("loongson-liointc: cannot add IRQ domain\n");
>                 err = -EINVAL;
> -               goto out_iounmap;
> +               goto out_iounmap_isr;
>         }
>
>         err = irq_alloc_domain_generic_chips(domain, 32, 1,
> @@ -260,7 +290,13 @@ static int __init liointc_of_init(struct device_node *node,
>
>  out_free_domain:
>         irq_domain_remove(domain);
> -out_iounmap:
> +out_iounmap_isr:
> +       for (i = 0; i < LIOINTC_NUM_CORES; i++) {
> +               if (!priv->core_isr[i])
> +                       continue;
> +               iounmap(priv->core_isr[i]);
> +       }
> +out_iounmap_base:
>         iounmap(base);
>  out_free_priv:
>         kfree(priv);
> @@ -270,3 +306,4 @@ static int __init liointc_of_init(struct device_node *node,
>
>  IRQCHIP_DECLARE(loongson_liointc_1_0, "loongson,liointc-1.0", liointc_of_init);
>  IRQCHIP_DECLARE(loongson_liointc_1_0a, "loongson,liointc-1.0a", liointc_of_init);
> +IRQCHIP_DECLARE(loongson_liointc_2_0, "loongson,liointc-2.0", liointc_of_init);
> --
> 2.20.1
>
