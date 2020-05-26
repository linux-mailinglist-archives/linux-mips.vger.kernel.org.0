Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 745021B7DC9
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2020 20:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbgDXSWy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Apr 2020 14:22:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:58350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727022AbgDXSWy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 24 Apr 2020 14:22:54 -0400
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3D9722098B;
        Fri, 24 Apr 2020 18:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587752573;
        bh=NN7KH/01CjjCVfZkqtsBjk/cS34fN6CB4PsPi86+USM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tHLRxe9Nox57l9mkDt4okVgptxg9ojGtTkzQIRLjYOz/LlcAjJHFKlm2do7tywrOd
         PBnMzXY5jymGq1fnbHW+vkkEgI2T4bF8K2R6RTF5iWAsnnUWPuabRI7fWME6LDjNzH
         mFv8YLZPnGVvGlq1vMCfSqKRFTedRnC9nQ6F5E9c=
Received: by mail-qk1-f179.google.com with SMTP id g74so11102894qke.13;
        Fri, 24 Apr 2020 11:22:53 -0700 (PDT)
X-Gm-Message-State: AGi0Pua1M9UCqZVgsTAEDreLl9GJIjyZ/C75P7ap+rFIIYS/7nYh7+Ni
        MVzntO/66sWLa5zP53h3AxJn04YO8rpaFt78NQ==
X-Google-Smtp-Source: APiQypJmFqOC+sy7aVOyAJ5vn8TwlugsJh0TghBU5Td86UVaArrCjPtzOAxIeemC8rbry02p17POx2xbqFizcSbBTYQ=
X-Received: by 2002:a05:620a:1595:: with SMTP id d21mr10753237qkk.223.1587752571996;
 Fri, 24 Apr 2020 11:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200424130847.328584-1-jiaxun.yang@flygoat.com> <20200424130847.328584-4-jiaxun.yang@flygoat.com>
In-Reply-To: <20200424130847.328584-4-jiaxun.yang@flygoat.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 24 Apr 2020 13:22:39 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJnQ-_+0WiNfPtk+g+Kr6vXS16q9pw0_YEK6CUaBHtcmA@mail.gmail.com>
Message-ID: <CAL_JsqJnQ-_+0WiNfPtk+g+Kr6vXS16q9pw0_YEK6CUaBHtcmA@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] PCI: Add Loongson PCI Controller support
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     PCI <linux-pci@vger.kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Andrew Murray <amurray@thegoodpenguin.co.uk>,
        Paul Burton <paulburton@kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Apr 24, 2020 at 8:10 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> This controller can be found on Loongson-2K SoC, Loongson-3
> systems with RS780E/LS7A PCH.
>
> The RS780E part of code was previously located at
> arch/mips/pci/ops-loongson3.c and now it can use generic PCI
> driver implementation.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
> --
> v2:
>         - Clean up according to rob's suggestions
>         - Claim that it can't work as a module
> v3:
>         - Fix a typo
> ---
>  drivers/pci/controller/Kconfig        |   9 +
>  drivers/pci/controller/Makefile       |   1 +
>  drivers/pci/controller/pci-loongson.c | 257 ++++++++++++++++++++++++++
>  3 files changed, 267 insertions(+)
>  create mode 100644 drivers/pci/controller/pci-loongson.c
>
> diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
> index 91bfdb784829..7d7e70402ebd 100644
> --- a/drivers/pci/controller/Kconfig
> +++ b/drivers/pci/controller/Kconfig
> @@ -258,6 +258,16 @@ config PCI_HYPERV_INTERFACE
>           The Hyper-V PCI Interface is a helper driver allows other drivers to
>           have a common interface with the Hyper-V PCI frontend driver.
>
> +config PCI_LOONGSON
> +       bool "LOONGSON PCI Controller"
> +       depends on MACH_LOONGSON64 || COMPILE_TEST
> +       depends on OF
> +       depends on PCI_QUIRKS
> +       default MACH_LOONGSON64
> +       help
> +         Say Y here if you want to enable PCI controller support on
> +         Loongson systems.
> +
>  source "drivers/pci/controller/dwc/Kconfig"
>  source "drivers/pci/controller/mobiveil/Kconfig"
>  source "drivers/pci/controller/cadence/Kconfig"
> diff --git a/drivers/pci/controller/Makefile b/drivers/pci/controller/Makefile
> index 158c59771824..fbac4b0190a0 100644
> --- a/drivers/pci/controller/Makefile
> +++ b/drivers/pci/controller/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_PCIE_MEDIATEK) += pcie-mediatek.o
>  obj-$(CONFIG_PCIE_TANGO_SMP8759) += pcie-tango.o
>  obj-$(CONFIG_VMD) += vmd.o
>  obj-$(CONFIG_PCIE_BRCMSTB) += pcie-brcmstb.o
> +obj-$(CONFIG_PCI_LOONGSON) += pci-loongson.o
>  # pcie-hisi.o quirks are needed even without CONFIG_PCIE_DW
>  obj-y                          += dwc/
>  obj-y                          += mobiveil/
> diff --git a/drivers/pci/controller/pci-loongson.c b/drivers/pci/controller/pci-loongson.c
> new file mode 100644
> index 000000000000..0bd3b52c14fb
> --- /dev/null
> +++ b/drivers/pci/controller/pci-loongson.c
> @@ -0,0 +1,257 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Loongson PCI Host Controller Driver
> + *
> + * Copyright (C) 2020 Jiaxun Yang <jiaxun.yang@flygoat.com>
> + */
> +
> +#include <linux/of_address.h>

Don't think this is needed.

> +#include <linux/of_pci.h>
> +#include <linux/of_platform.h>

This should be of_device.h instead.

> +#include <linux/pci.h>
> +#include <linux/pci_ids.h>
> +
> +#include "../pci.h"
> +
> +/* Device IDs */
> +#define DEV_PCIE_PORT_0        0x7a09
> +#define DEV_PCIE_PORT_1        0x7a19
> +#define DEV_PCIE_PORT_2        0x7a29
> +
> +#define DEV_LS2K_APB   0x7a02
> +#define DEV_LS7A_CONF  0x7a10
> +#define DEV_LS7A_LPC   0x7a0c
> +
> +#define FLAG_CFG0      BIT(0)
> +#define FLAG_CFG1      BIT(1)
> +#define FLAG_DEV_FIX   BIT(2)
> +
> +struct loongson_pci {
> +       void __iomem *cfg0_base;
> +       void __iomem *cfg1_base;
> +       struct platform_device *pdev;
> +       u32 flags;
> +};
> +
> +/* Fixup wrong class code in PCIe bridges */
> +static void bridge_class_quirk(struct pci_dev *dev)
> +{
> +       dev->class = PCI_CLASS_BRIDGE_PCI << 8;
> +}
> +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_LOONGSON,
> +                       DEV_PCIE_PORT_0, bridge_class_quirk);
> +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_LOONGSON,
> +                       DEV_PCIE_PORT_1, bridge_class_quirk);
> +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_LOONGSON,
> +                       DEV_PCIE_PORT_2, bridge_class_quirk);
> +
> +static void system_bus_quirk(struct pci_dev *pdev)
> +{
> +       u16 tmp;
> +
> +       pdev->mmio_always_on = 1;
> +       pdev->non_compliant_bars = 1;
> +       /* Enable MEM & IO Decoding */
> +       pci_read_config_word(pdev, PCI_STATUS, &tmp);
> +       tmp |= PCI_COMMAND_IO | PCI_COMMAND_MEMORY;
> +       pci_write_config_word(pdev, PCI_STATUS, tmp);
> +}
> +
> +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_LOONGSON,
> +                       DEV_LS2K_APB, system_bus_quirk);
> +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_LOONGSON,
> +                       DEV_LS7A_CONF, system_bus_quirk);
> +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_LOONGSON,
> +                       DEV_LS7A_LPC, system_bus_quirk);
> +
> +static void loongson_mrrs_quirk(struct pci_dev *dev)
> +{
> +       struct pci_bus *bus = dev->bus;
> +       struct pci_dev *bridge;
> +       static const struct pci_device_id bridge_devids[] = {
> +               { PCI_VDEVICE(LOONGSON, DEV_PCIE_PORT_0) },
> +               { PCI_VDEVICE(LOONGSON, DEV_PCIE_PORT_1) },
> +               { PCI_VDEVICE(LOONGSON, DEV_PCIE_PORT_2) },
> +               { 0, },
> +       };
> +
> +
> +       /* look for the matching bridge */
> +       while (!pci_is_root_bus(bus)) {
> +               bridge = bus->self;
> +               bus = bus->parent;
> +               /*
> +                * Some Loongson PCIE ports has a h/w limitation of
> +                * 256 bytes maximum read request size. It can't handle
> +                * anything higher than this. So force this limit on
> +                * any devices attached under these ports.
> +                */
> +               if (pci_match_id(bridge_devids, bridge)) {
> +                       if (pcie_get_readrq(dev) > 256) {
> +                               dev_info(&dev->dev, "limiting MRRS to 256\n");
> +                               pcie_set_readrq(dev, 256);
> +                       }
> +                       break;
> +               }
> +       }
> +}
> +DECLARE_PCI_FIXUP_ENABLE(PCI_ANY_ID, PCI_ANY_ID, loongson_mrrs_quirk);
> +
> +static void __iomem *cfg1_map(struct loongson_pci *priv, int bus, int dev,
> +                               int func, int where)
> +{
> +       unsigned long addroff = 0x0;
> +
> +       if (bus != 0)
> +               addroff |= BIT(28); /* Type 1 Access */
> +       addroff |= (where & 0xff) | ((where & 0xf00) << 16);
> +       addroff |= (bus << 16) | (dev << 11) | (func << 8);

You already had 'devfn', so just pass that in here and use it.

> +       return priv->cfg1_base + addroff;
> +}
> +
> +static void __iomem *cfg0_map(struct loongson_pci *priv, int bus, int dev,
> +                               int func, int where)
> +{
> +       unsigned long addroff = 0x0;
> +
> +       if (bus != 0)
> +               addroff |= BIT(24); /* Type 1 Access */
> +       addroff |= (bus << 16) | (dev << 11) | (func << 8) | where;

And here.

> +       return priv->cfg0_base + addroff;
> +}
> +
> +void __iomem *pci_loongson_map_bus(struct pci_bus *bus, unsigned int devfn,
> +                              int where)
> +{
> +       unsigned char busnum = bus->number;
> +       int device = PCI_SLOT(devfn);
> +       int function = PCI_FUNC(devfn);
> +       struct pci_host_bridge *bridge = pci_find_host_bridge(bus);
> +       struct loongson_pci *priv =  pci_host_bridge_priv(bridge);
> +
> +       /*
> +        * Do not read more than one device on the bus other than
> +        * the host bridge.
> +        */
> +       if (bus->primary != 0 && device > 0 &&
> +               priv->flags & FLAG_DEV_FIX)
> +               return NULL;
> +
> +       /* CFG0 can only access standard space */
> +       if (where < PCI_CFG_SPACE_SIZE && priv->flags & FLAG_CFG0 &&
> +               priv->cfg0_base)
> +               return cfg0_map(priv, busnum, device, function, where);
> +
> +       /* CFG1 can access exp space */
> +       if (where < PCI_CFG_SPACE_EXP_SIZE && priv->flags & FLAG_CFG1 &&
> +               priv->cfg1_base)

No need to check both priv->cfg1_base and FLAG_CFG1. I'd drop the flag.

> +               return cfg1_map(priv, busnum, device, function, where);
> +
> +       return NULL;
> +}
> +
> +static int loongson_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
> +{
> +       int irq;
> +       u8 val;
> +
> +       irq = of_irq_parse_and_map_pci(dev, slot, pin);
> +       if (irq > 0)
> +               return irq;
> +
> +       /* Care i8259 legacy systems */
> +       pci_read_config_byte(dev, PCI_INTERRUPT_LINE, &val);
> +       /* 0xff is also invalid */
> +       if (val == 0xff)
> +               return 0;
> +
> +       return val;
> +}
> +
> +/* H/w only accept 32-bit PCI operations */
> +static struct pci_ops loongson_pci_ops = {
> +       .map_bus = pci_loongson_map_bus,
> +       .read   = pci_generic_config_read32,
> +       .write  = pci_generic_config_write32,
> +};
> +
> +static const struct of_device_id loongson_pci_of_match[] = {
> +       { .compatible = "loongson,rs780e-pci",
> +               .data = (void *)(FLAG_CFG0), },
> +       { .compatible = "loongson,ls2k-pci",
> +               .data = (void *)(FLAG_CFG0 | FLAG_CFG1 | FLAG_DEV_FIX), },
> +       { .compatible = "loongson,ls7a-pci",
> +               .data = (void *)(FLAG_CFG0 | FLAG_CFG1 | FLAG_DEV_FIX), },
> +       {}
> +};
> +
> +static int loongson_pci_probe(struct platform_device *pdev)
> +{
> +       struct loongson_pci *priv;
> +       struct device *dev = &pdev->dev;
> +       struct device_node *node = dev->of_node;
> +       struct pci_host_bridge *bridge;
> +       struct resource *regs;
> +       int err;
> +
> +       if (!node)
> +               return -ENODEV;
> +
> +       bridge = devm_pci_alloc_host_bridge(dev, sizeof(*priv));
> +       if (!bridge)
> +               return -ENODEV;
> +
> +       priv = pci_host_bridge_priv(bridge);
> +       priv->pdev = pdev;
> +       priv->flags = (unsigned long)of_device_get_match_data(dev);
> +
> +       regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!regs) {
> +               dev_err(dev, "missing mem resources for cfg0\n");
> +               return -EINVAL;
> +       }
> +
> +       priv->cfg0_base = devm_pci_remap_cfg_resource(dev, regs);
> +       if (IS_ERR(priv->cfg0_base))
> +               return PTR_ERR(priv->cfg0_base);
> +
> +       /* CFG1 is optional */
> +       if (priv->flags & FLAG_CFG1) {
> +               regs = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +               if (!regs)
> +                       dev_info(dev, "missing mem resource for cfg1\n");
> +               else {
> +                       priv->cfg1_base = devm_pci_remap_cfg_resource(dev, regs);
> +                       if (IS_ERR(priv->cfg1_base))
> +                               priv->cfg1_base = NULL;
> +               }
> +       }
> +
> +

Drop the extra blank line.

> +       err = pci_parse_request_of_pci_ranges(dev, &bridge->windows,
> +                                               &bridge->dma_ranges, NULL);
> +       if (err) {
> +               dev_err(dev, "Failed to get bridge resources\n");
> +               return err;
> +       }
> +
> +       bridge->dev.parent = dev;
> +       bridge->sysdata = priv;
> +       bridge->ops = &loongson_pci_ops;
> +       bridge->map_irq = loongson_map_irq;
> +
> +       err = pci_host_probe(bridge);
> +       if (err)
> +               return err;
> +
> +       return 0;
> +}
> +
> +static struct platform_driver loongson_pci_driver = {
> +       .driver = {
> +               .name = "loongson-pci",
> +               .of_match_table = loongson_pci_of_match,
> +       },
> +       .probe = loongson_pci_probe,
> +};
> +builtin_platform_driver(loongson_pci_driver);
> --
> 2.26.0.rc2
>
