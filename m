Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1581B5466
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2020 07:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbgDWFuR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Apr 2020 01:50:17 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:40353 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbgDWFuR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Apr 2020 01:50:17 -0400
Received: by mail-io1-f66.google.com with SMTP id p10so5126231ioh.7;
        Wed, 22 Apr 2020 22:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P7tJCPQuybZ/e9S8U6s7JJRd9S9RL2+vckDwnZyVJhE=;
        b=Xr8WmnSfhK3OGhZjwpucnXT40Mn3OQpmKGxL5jQWYC0j7CJ4Bmz2DDsXEde3IRzWCb
         erQTmcP+fZEDjWjosAFUtxiWQ7dRzXsQfhl32fC5dEpBgYv42MiYKwLjgd4c/hPua2ko
         C05KHBE2itrZMm04hWmsGA5tXoiRwRlU7hbEVDNLKElygvFkVYAO5P/lCS07Y4uuglD9
         onJ1U+uSWFMQOIHTNb/YAh8jY4CTOWnBDGp/s0p3meMfTeGjf6HeNBK4+CGM/2SzIPbB
         G0G8kx/TcIFPv49louEAS5bi62Wi8EPLINm6nOBtTY5tZaeRLG/P55/2O7tSd6YobHEG
         KQKQ==
X-Gm-Message-State: AGi0Pubc/SIMOKEGpFP263IagseZ1NS/2dhx6XWs2VIz9HFd1MAtIBO3
        4+xJduJuCtSGUjGzJ+J+2goBOxIym+hR1gU33O6oV31Bx2c=
X-Google-Smtp-Source: APiQypJev8Szn+Twa+6GRHeTsUa4x2iVY2OgkP+6c9aER+klHYDlQ7Zv4GcxFpdcrjCDA31uJFiUYMqqXrWrOkWq8PY=
X-Received: by 2002:a6b:7317:: with SMTP id e23mr2192028ioh.72.1587621015197;
 Wed, 22 Apr 2020 22:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200422142428.1249684-1-jiaxun.yang@flygoat.com> <20200422142428.1249684-6-jiaxun.yang@flygoat.com>
In-Reply-To: <20200422142428.1249684-6-jiaxun.yang@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Thu, 23 Apr 2020 13:57:12 +0800
Message-ID: <CAAhV-H7gdzktCCFveTb3_1tj4JAcugELj4Ry7x6s=gr_4Wfx9g@mail.gmail.com>
Subject: Re: [PATCH 5/6] irqchip: Add Loongson PCH MSI controller
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Jiaxun

On Wed, Apr 22, 2020 at 10:27 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> This controller appears on Loongson-7A family of PCH to transform
Please use "Loongson's LS7A family" here.

> interrupts from PCI MSI into HyperTransport vectorized interrrupts
> and send them to procrssor's HT vector controller.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  drivers/irqchip/Kconfig                |  10 +
>  drivers/irqchip/Makefile               |   1 +
>  drivers/irqchip/irq-loongson-pch-msi.c | 265 +++++++++++++++++++++++++
>  3 files changed, 276 insertions(+)
>  create mode 100644 drivers/irqchip/irq-loongson-pch-msi.c
>
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 4ab7a9b1a5c2..9f2935418f33 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -548,4 +548,14 @@ config LOONGSON_PCH_PIC
>         help
>           Support for the Loongson PCH PIC Controller.
>
> +config LOONGSON_PCH_MSI
> +       bool "Loongson PCH PIC Controller"
> +       depends on MACH_LOONGSON64 || COMPILE_TEST
> +       depends on PCI
> +       default MACH_LOONGSON64
> +       select IRQ_DOMAIN_HIERARCHY
> +       select PCI_MSI
> +       help
> +         Support for the Loongson PCH MSI Controller.
> +
>  endmenu
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index acc72331cec8..3a4ce283189a 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -109,3 +109,4 @@ obj-$(CONFIG_LOONGSON_LIOINTC)              += irq-loongson-liointc.o
>  obj-$(CONFIG_LOONGSON_HTPIC)           += irq-loongson-htpic.o
>  obj-$(CONFIG_LOONGSON_HTVEC)           += irq-loongson-htvec.o
>  obj-$(CONFIG_LOONGSON_PCH_PIC)         += irq-loongson-pch-pic.o
> +obj-$(CONFIG_LOONGSON_PCH_MSI)         += irq-loongson-pch-msi.o
> diff --git a/drivers/irqchip/irq-loongson-pch-msi.c b/drivers/irqchip/irq-loongson-pch-msi.c
> new file mode 100644
> index 000000000000..4bb00f2ce86a
> --- /dev/null
> +++ b/drivers/irqchip/irq-loongson-pch-msi.c
> @@ -0,0 +1,265 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  Copyright (C) 2020, Jiaxun Yang <jiaxun.yang@flygoat.com>
> + *  Loongson PCH MSI support
> + */
> +
> +#define pr_fmt(fmt) "pch-msi: " fmt
> +
> +#include <linux/irqchip.h>
> +#include <linux/msi.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_pci.h>
> +#include <linux/pci.h>
> +#include <linux/slab.h>
> +
> +struct pch_msi_data {
> +       spinlock_t msi_map_lock;
> +       phys_addr_t addr;
> +       u32 irq_first;          /* The vectoe number that MSIs start */
> +       u32 num_irqs;           /* The number of vector for MSIs */
> +       unsigned long *msi_map;
> +};
> +
> +static void pch_msi_mask_msi_irq(struct irq_data *d)
> +{
> +       pci_msi_mask_irq(d);
> +       irq_chip_mask_parent(d);
> +}
> +
> +static void pch_msi_unmask_msi_irq(struct irq_data *d)
> +{
> +       pci_msi_unmask_irq(d);
> +       irq_chip_unmask_parent(d);
> +}
> +
> +static struct irq_chip pch_msi_irq_chip = {
> +       .name                   = "PCH MSI",
> +       .irq_mask               = pch_msi_mask_msi_irq,
> +       .irq_unmask             = pch_msi_unmask_msi_irq,
> +       .irq_set_affinity       = irq_chip_set_affinity_parent,
> +};
> +
> +static int pch_msi_allocate_hwirq(struct pch_msi_data *priv, int num_req)
> +{
> +       int first;
> +
> +       spin_lock(&priv->msi_map_lock);
> +
> +       first = bitmap_find_next_zero_area(priv->msi_map, priv->num_irqs, 0,
> +                                          num_req, 0);
> +       if (first >= priv->num_irqs) {
> +               spin_unlock(&priv->msi_map_lock);
> +               return -ENOSPC;
> +       }
> +
> +       bitmap_set(priv->msi_map, first, num_req);
> +
> +       spin_unlock(&priv->msi_map_lock);
> +
> +       return priv->irq_first + first;
> +}
> +
> +static void pch_msi_free_hwirq(struct pch_msi_data *priv,
> +                               int hwirq, int num_req)
> +{
> +       int first = hwirq - priv->irq_first;
> +
> +       spin_lock(&priv->msi_map_lock);
> +
> +       bitmap_clear(priv->msi_map, first, num_req);
> +
> +       spin_unlock(&priv->msi_map_lock);
> +}
> +
> +static void pch_msi_compose_msi_msg(struct irq_data *data,
> +                                       struct msi_msg *msg)
> +{
> +       struct pch_msi_data *priv = irq_data_get_irq_chip_data(data);
> +       phys_addr_t msg_addr = priv->addr;
> +
> +       msg->address_hi = upper_32_bits(msg_addr);
> +       msg->address_lo = lower_32_bits(msg_addr);
> +       msg->data = data->hwirq;
> +}
> +
> +static struct msi_domain_info pch_msi_domain_info = {
> +       .flags          = MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
> +                         MSI_FLAG_MULTI_PCI_MSI | MSI_FLAG_PCI_MSIX,
> +       .chip   = &pch_msi_irq_chip,
> +};
> +
> +static struct irq_chip middle_irq_chip = {
> +       .name                   = "PCH MSI Middle",
> +       .irq_mask               = irq_chip_mask_parent,
> +       .irq_unmask             = irq_chip_unmask_parent,
> +       .irq_set_affinity       = irq_chip_set_affinity_parent,
> +       .irq_compose_msi_msg    = pch_msi_compose_msi_msg,
> +};
> +
> +static int pch_msi_parent_domain_alloc(struct irq_domain *domain,
> +                                       unsigned int virq, int hwirq)
> +{
> +       struct irq_fwspec fwspec;
> +       int ret;
> +
> +       if (!is_of_node(domain->parent->fwnode))
> +               return -EINVAL;
> +
> +       fwspec.fwnode = domain->parent->fwnode;
> +       fwspec.param_count = 1;
> +       fwspec.param[0] = hwirq;
> +
> +       ret = irq_domain_alloc_irqs_parent(domain, virq, 1, &fwspec);
> +       if (ret)
> +               return ret;
> +
> +       irq_domain_set_info(domain, virq, hwirq,
> +                           &middle_irq_chip, NULL,
> +                           handle_simple_irq, NULL, NULL);
> +       irq_set_probe(virq);
> +
> +       return 0;
> +}
> +
> +static int pch_msi_middle_domain_alloc(struct irq_domain *domain,
> +                                          unsigned int virq,
> +                                          unsigned int nr_irqs, void *args)
> +{
> +       struct pch_msi_data *priv = domain->host_data;
> +       int hwirq, err, i;
> +
> +       hwirq = pch_msi_allocate_hwirq(priv, nr_irqs);
> +       if (hwirq < 0)
> +               return hwirq;
> +
> +       for (i = 0; i < nr_irqs; i++) {
> +               err = pch_msi_parent_domain_alloc(domain, virq + i, hwirq + i);
> +               if (err)
> +                       goto err_hwirq;
> +
> +               irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
> +                                             &middle_irq_chip, priv);
> +       }
> +
> +       return 0;
> +err_hwirq:
> +       while (--i >= 0)
> +               irq_domain_free_irqs_parent(domain, virq, i);
> +
> +       pch_msi_free_hwirq(priv, hwirq, nr_irqs);
> +       return err;
> +}
> +
> +static void pch_msi_middle_domain_free(struct irq_domain *domain,
> +                                          unsigned int virq,
> +                                          unsigned int nr_irqs)
> +{
> +       struct irq_data *d = irq_domain_get_irq_data(domain, virq);
> +       struct pch_msi_data *priv = irq_data_get_irq_chip_data(d);
> +
> +       irq_domain_free_irqs_parent(domain, virq, nr_irqs);
> +       pch_msi_free_hwirq(priv, d->hwirq, nr_irqs);
> +}
> +
> +static const struct irq_domain_ops pch_msi_middle_domain_ops = {
> +       .alloc  = pch_msi_middle_domain_alloc,
> +       .free   = pch_msi_middle_domain_free,
> +};
> +
> +static int pch_msi_init_domains(struct pch_msi_data *priv,
> +                               struct device_node *node,
> +                               struct device_node *parent)
> +{
> +       struct irq_domain *middle_domain, *msi_domain, *parent_domain;
> +
> +       parent_domain = irq_find_host(parent);
> +       if (!parent_domain) {
> +               pr_err("Failed to find the parent domain\n");
> +               return -ENXIO;
> +       }
> +
> +       middle_domain = irq_domain_add_tree(NULL,
> +                                           &pch_msi_middle_domain_ops,
> +                                           priv);
> +       if (!middle_domain) {
> +               pr_err("Failed to create the MSI middle domain\n");
> +               return -ENOMEM;
> +       }
> +
> +       middle_domain->parent = parent_domain;
> +
> +       msi_domain = pci_msi_create_irq_domain(of_node_to_fwnode(node),
> +                                              &pch_msi_domain_info,
> +                                              middle_domain);
> +       if (!msi_domain) {
> +               pr_err("Failed to create MSI domain\n");
> +               irq_domain_remove(middle_domain);
> +               return -ENOMEM;
> +       }
> +
> +       return 0;
> +}
> +
> +static int pch_msi_init(struct device_node *node,
> +                           struct device_node *parent)
> +{
> +       struct pch_msi_data *priv;
> +       struct resource res;
> +       int ret;
> +
> +       priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       spin_lock_init(&priv->msi_map_lock);
> +
> +       ret = of_address_to_resource(node, 0, &res);
> +       if (ret) {
> +               pr_err("Failed to allocate resource\n");
> +               goto err_priv;
> +       }
> +
> +       priv->addr = res.start;
> +
> +       if (of_property_read_u32(node, "loongson,msi-base-vec",
> +                               &priv->irq_first)) {
> +               pr_err("Unable to parse MSI vec base\n");
> +               ret = -EINVAL;
> +               goto err_priv;
> +       }
> +
> +       if (of_property_read_u32(node, "loongson,msi-num-vecs",
> +                               &priv->num_irqs)) {
> +               pr_err("Unable to parse MSI vec number\n");
> +               ret = -EINVAL;
> +               goto err_priv;
> +       }
> +
> +       priv->msi_map = kcalloc(BITS_TO_LONGS(priv->num_irqs),
> +                               sizeof(*priv->msi_map),
> +                               GFP_KERNEL);
> +       if (!priv->msi_map) {
> +               ret = -ENOMEM;
> +               goto err_priv;
> +       }
> +
> +       pr_debug("Registering %d MSIs, starting at %d\n",
> +                priv->num_irqs, priv->irq_first);
> +
> +       ret = pch_msi_init_domains(priv, node, parent);
> +       if (ret)
> +               goto err_map;
> +
> +       return 0;
> +
> +err_map:
> +       kfree(priv->msi_map);
> +err_priv:
> +       kfree(priv);
> +       return ret;
> +}
> +
> +IRQCHIP_DECLARE(pch_msi, "loongson,pch-msi-1.0", pch_msi_init);
> --
> 2.26.0.rc2
>
