Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E80F35E00F
	for <lists+linux-mips@lfdr.de>; Tue, 13 Apr 2021 15:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242545AbhDMN2j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 09:28:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242158AbhDMN2i (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 13 Apr 2021 09:28:38 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7C54C061574;
        Tue, 13 Apr 2021 06:28:17 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id a21so3900061oib.10;
        Tue, 13 Apr 2021 06:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0Lrtdi2DI7A27HaQOLaKVNVRqExZOSDdh3hl4iMSUq0=;
        b=TlLtDMtV+kjJh3l0KeAWuic2I0geqLbTTV8vxiRnhPVeQY9lm+H0e5hgM8Wc0529gy
         s59Bnqx5H5iBSa7OnRFtudAp/7iPPIUC8NOLIOXUC3cj90HJaNIBIE39EsyXCNFctCEM
         fOsovSL9wRKm+f9NYufB6qHki5m/MJ4GhJz44JjfBKg3AAHJGYmxRHzAzz44xpIJQ+7J
         4tDpsARZeHajTXvyH3Kv6bNdFpe8nJ1NdedC2HAnkUTHDqhrpGoJCu5SzZ2rzqBaphCa
         HpXjuormEcwWgmiE8x8R5590sel228M6e4cAOfDPzCYZ3L53LvvZihd+QIL1dKJg7NJz
         q0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0Lrtdi2DI7A27HaQOLaKVNVRqExZOSDdh3hl4iMSUq0=;
        b=PQqysRQvVPsq9+YhY/iQcKjnILjXoKUD1adXeg3va97g+D7PbIyZ8rHwpL7t32bCNx
         /PSZl5juSe3SZojeDUUOegzveBIbWMcDiMfoL6199Bl91N7ZbFghl7tbAzjl5yDkwCZs
         DhIdXV/9eOTwaH9dHM9xIL7rB5GQzGEXC+J5+v+VCPDmNEIoyz+QHLQ+gxs5VSVt+Xgw
         YsCNs+kCVF4522XxoW2snAkdBiGDFj0IT6VQYU/FslBusfH1YVHovACvZzOBtIV4Cw+I
         syZiA9XDoySwMl1bHGX+epmoJNz5zObiVHO41/JL6z/xcEpWnb52O65+ro+y1ftCfDrp
         KLmg==
X-Gm-Message-State: AOAM531rClAqbX9FDqIFpJqjCnzBSG5hpnx/4aoDlUtT9slhauptUbUs
        XfaiMl4qPpRlkEJMhsp5gmdQL6gvI0X92EkpfDY=
X-Google-Smtp-Source: ABdhPJxzy/1IHRMFUGjf5e3YSrD/uo+69w2cfoMFc0ZgcevQMQJDQe9Wf10uFmFFfA/ku85CVg27TIQC8iJUnkky0dM=
X-Received: by 2002:aca:a84b:: with SMTP id r72mr12921oie.17.1618320496879;
 Tue, 13 Apr 2021 06:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210413062146.389690-1-ilya.lipnitskiy@gmail.com> <20210413062146.389690-3-ilya.lipnitskiy@gmail.com>
In-Reply-To: <20210413062146.389690-3-ilya.lipnitskiy@gmail.com>
From:   Sergey Ryazanov <ryazanov.s.a@gmail.com>
Date:   Tue, 13 Apr 2021 16:28:06 +0300
Message-ID: <CAHNKnsS5Kn86g2QkFJ0qYsGPf9htmF=n-imVQBWDKYn0C+qOSA@mail.gmail.com>
Subject: Re: [PATCH 2/8] MIPS: pci-rt2880: remove unneeded locks
To:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Ilya,

On Tue, Apr 13, 2021 at 9:22 AM Ilya Lipnitskiy
<ilya.lipnitskiy@gmail.com> wrote:
> Mirror pci-rt3883 fix from commit e5067c718b3a ("MIPS: pci-rt3883:
> Remove odd locking in PCI config space access code"). pci-rt2880 shares
> the driver layout with pci-rt3883 and the same reasons apply.
>
> Caller (generic PCI code) already does proper locking, so no need to add
> another one here. Local PCI read/write functions are never called
> simultaneously, also they do not require synchronization with the PCI
> controller ops, since they are used before the controller registration.
>
> Suggested-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> ---
>  arch/mips/pci/pci-rt2880.c | 13 -------------
>  1 file changed, 13 deletions(-)
>
> diff --git a/arch/mips/pci/pci-rt2880.c b/arch/mips/pci/pci-rt2880.c
> index 19f7860fb28b..b4ee07cbcf2a 100644
> --- a/arch/mips/pci/pci-rt2880.c
> +++ b/arch/mips/pci/pci-rt2880.c
> @@ -41,7 +41,6 @@
>  #define RT2880_PCI_REG_ARBCTL          0x80
>
>  static void __iomem *rt2880_pci_base;
> -static DEFINE_SPINLOCK(rt2880_pci_lock);
>
>  static u32 rt2880_pci_reg_read(u32 reg)
>  {
> @@ -63,7 +62,6 @@ static inline u32 rt2880_pci_get_cfgaddr(unsigned int bus, unsigned int slot,
>  static int rt2880_pci_config_read(struct pci_bus *bus, unsigned int devfn,
>                                   int where, int size, u32 *val)
>  {
> -       unsigned long flags;
>         u32 address;
>         u32 data;
>         int busn = 0;
> @@ -74,10 +72,8 @@ static int rt2880_pci_config_read(struct pci_bus *bus, unsigned int devfn,
>         address = rt2880_pci_get_cfgaddr(busn, PCI_SLOT(devfn), PCI_FUNC(devfn),
>                                          where);
>
> -       spin_lock_irqsave(&rt2880_pci_lock, flags);
>         rt2880_pci_reg_write(address, RT2880_PCI_REG_CONFIG_ADDR);
>         data = rt2880_pci_reg_read(RT2880_PCI_REG_CONFIG_DATA);
> -       spin_unlock_irqrestore(&rt2880_pci_lock, flags);
>
>         switch (size) {
>         case 1:
> @@ -97,7 +93,6 @@ static int rt2880_pci_config_read(struct pci_bus *bus, unsigned int devfn,
>  static int rt2880_pci_config_write(struct pci_bus *bus, unsigned int devfn,
>                                    int where, int size, u32 val)
>  {
> -       unsigned long flags;
>         u32 address;
>         u32 data;
>         int busn = 0;
> @@ -108,7 +103,6 @@ static int rt2880_pci_config_write(struct pci_bus *bus, unsigned int devfn,
>         address = rt2880_pci_get_cfgaddr(busn, PCI_SLOT(devfn), PCI_FUNC(devfn),
>                                          where);
>
> -       spin_lock_irqsave(&rt2880_pci_lock, flags);
>         rt2880_pci_reg_write(address, RT2880_PCI_REG_CONFIG_ADDR);
>         data = rt2880_pci_reg_read(RT2880_PCI_REG_CONFIG_DATA);
>
> @@ -127,7 +121,6 @@ static int rt2880_pci_config_write(struct pci_bus *bus, unsigned int devfn,
>         }
>
>         rt2880_pci_reg_write(data, RT2880_PCI_REG_CONFIG_DATA);
> -       spin_unlock_irqrestore(&rt2880_pci_lock, flags);
>
>         return PCIBIOS_SUCCESSFUL;
>  }
> @@ -159,31 +152,25 @@ static struct pci_controller rt2880_pci_controller = {
>
>  static inline u32 rt2880_pci_read_u32(unsigned long reg)
>  {
> -       unsigned long flags;
>         u32 address;
>         u32 ret;
>
>         address = rt2880_pci_get_cfgaddr(0, 0, 0, reg);
>
> -       spin_lock_irqsave(&rt2880_pci_lock, flags);
>         rt2880_pci_reg_write(address, RT2880_PCI_REG_CONFIG_ADDR);
>         ret = rt2880_pci_reg_read(RT2880_PCI_REG_CONFIG_DATA);
> -       spin_unlock_irqrestore(&rt2880_pci_lock, flags);
>
>         return ret;
>  }
>
>  static inline void rt2880_pci_write_u32(unsigned long reg, u32 val)
>  {
> -       unsigned long flags;
>         u32 address;
>
>         address = rt2880_pci_get_cfgaddr(0, 0, 0, reg);
>
> -       spin_lock_irqsave(&rt2880_pci_lock, flags);
>         rt2880_pci_reg_write(address, RT2880_PCI_REG_CONFIG_ADDR);
>         rt2880_pci_reg_write(val, RT2880_PCI_REG_CONFIG_DATA);
> -       spin_unlock_irqrestore(&rt2880_pci_lock, flags);
>  }
>
>  int pcibios_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)

RT2880 PCI driver calls rt2880_pci_write_u32()/rt2880_pci_read_u32()
from pcibios_map_irq(), which is called outside the scope of the
pci_lock spinlock that is defined in /drivers/pci/access.c. So it
looks like this could lead to a race between
rt2880_pci_write_u32()/rt2880_pci_read_u32() and
rt2880_pci_config_read()/rt2880_pci_config_write() functions.

The code that uses rt2880_pci_write_u32()/rt2880_pci_read_u32() in the
pcibios_map_irq() duplicates a BAR initialization procedure, which is
already performed by the rt288x_pci_probe().

Maybe we should remove duplicated code in the pcibios_map_irq() to
reduce duplication and to avoid possible race in configuration space
access?

If you fix this possible race, feel free to add in the next patch version my
Reviewed-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>

-- 
Sergey
