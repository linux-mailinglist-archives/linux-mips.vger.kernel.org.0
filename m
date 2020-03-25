Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B444191EAE
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 02:45:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbgCYBpm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 21:45:42 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:37014 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727189AbgCYBpm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Mar 2020 21:45:42 -0400
Received: by mail-il1-f193.google.com with SMTP id a6so441213ilr.4;
        Tue, 24 Mar 2020 18:45:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f4D6B9MrkGLZB2AIEqGTRqzOxW30N5+6gdlWcIa45lc=;
        b=J3uwS3Cec42SW6eWzYZzfp/8fGv/eaXm0osEKAnUNcgI2KvfNjbRRAI8V+foDst3sX
         FTZ9zlvc/loEyxQWJQJm45lILHveMvIdsWVZ0xTlYOxmzYGkwwBo1XHiYv22cTBcryud
         pKgZIOJC6evk7oxxK3EUJYqBtIWF5Nyjm+iCj5TgtlpWsDCE3kReQcEWpcGIFx/7r54L
         uf7CSyZGWZpV9FInZPdmRhdCBAtTqxfUXrRaBmXSuzlZMmBzIHC1A3WxHmYuh4B0G28E
         U11yg5DnBfUSkFyaJ0Mex/+gJdxuFFxsVy9FtlRxevE/XjRSlw3nCivA2kZRp3QY3zju
         l69w==
X-Gm-Message-State: ANhLgQ09t1mBmMTWuKgg8i6gM3ssaRGL7+8iHTuTOAdAGjdjiN6JSxMR
        veKqC/P0ax8o68pVajnmgU5JpuLMzPRfuWKu5D0m2Eam
X-Google-Smtp-Source: ADFU+vuSQONXJlK8DCLnl3/KGz7ZQKK5ZiNMyS2gUS4INYXRJmqEDqZCv0Gd42u4BjkIiTkvjaXHVHVh/8X3OVHllyM=
X-Received: by 2002:a92:8510:: with SMTP id f16mr1332299ilh.208.1585100741368;
 Tue, 24 Mar 2020 18:45:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200324153624.23109-1-jiaxun.yang@flygoat.com> <20200324153624.23109-3-jiaxun.yang@flygoat.com>
In-Reply-To: <20200324153624.23109-3-jiaxun.yang@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Wed, 25 Mar 2020 09:52:26 +0800
Message-ID: <CAAhV-H7__WmeWZ4w8Kc37WztRZ+-du9nKbVkRJeK7=ZhPaVY3g@mail.gmail.com>
Subject: Re: [PATCH v6 02/11] irqchip: loongson-liointc: Workaround LPC IRQ Errata
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Jiaxun,

On Tue, Mar 24, 2020 at 11:39 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> The 1.0 version of that controller has a bug that status bit
> of LPC IRQ sometimes doesn't get set correctly.
>
> So we can always blame LPC IRQ when spurious interrupt happens
> at the parent interrupt line which LPC IRQ supposed to route
> to.
>
> Co-developed-by: Huacai Chen <chenhc@lemote.com>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  drivers/irqchip/irq-loongson-liointc.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-loongson-liointc.c
> index 8b6d7b8ddaca..d5054e90eab8 100644
> --- a/drivers/irqchip/irq-loongson-liointc.c
> +++ b/drivers/irqchip/irq-loongson-liointc.c
> @@ -32,6 +32,8 @@
>
>  #define LIOINTC_SHIFT_INTx     4
>
> +#define LIOINTC_ERRATA_IRQ     10
> +
>  struct liointc_handler_data {
>         struct liointc_priv     *priv;
>         u32                     parent_int_map;
> @@ -41,6 +43,7 @@ struct liointc_priv {
>         struct irq_chip_generic         *gc;
>         struct liointc_handler_data     handler[LIOINTC_NUM_PARENT];
>         u8                              map_cache[LIOINTC_CHIP_IRQ];
> +       bool                            have_lpc_irq_errata;
Maybe has_lpc_irq_errata?

>  };
>
>  static void liointc_chained_handle_irq(struct irq_desc *desc)
> @@ -54,8 +57,14 @@ static void liointc_chained_handle_irq(struct irq_desc *desc)
>
>         pending = readl(gc->reg_base + LIOINTC_REG_INTC_STATUS);
>
> -       if (!pending)
> -               spurious_interrupt();
> +       if (!pending) {
> +               /* Always blame LPC IRQ if we have that bug and LPC IRQ is enabled */
> +               if (handler->priv->have_lpc_irq_errata &&
> +                       (handler->parent_int_map & ~gc->mask_cache & BIT(LIOINTC_ERRATA_IRQ)))
> +                       pending = BIT(LIOINTC_ERRATA_IRQ);
> +               else
> +                       spurious_interrupt();
> +       }
>
>         while (pending) {
>                 int bit = __ffs(pending);
> @@ -164,6 +173,9 @@ int __init liointc_of_init(struct device_node *node,
>                 goto out_iounmap;
>         }
>
> +       if (of_device_is_compatible(node, "loongson,liointc-1.0"))
> +               priv->have_lpc_irq_errata = true;
> +
>         sz = of_property_read_variable_u32_array(node, "loongson,parent_int_map",
>                                                 &of_parent_int_map[0], LIOINTC_NUM_PARENT,
>                                                 LIOINTC_NUM_PARENT);
> --
> 2.26.0.rc2
>
>

Regards,
Huacai Chen
