Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD56135E04B
	for <lists+linux-mips@lfdr.de>; Tue, 13 Apr 2021 15:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346028AbhDMNlR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 09:41:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346031AbhDMNlN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 13 Apr 2021 09:41:13 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE1C8C06175F;
        Tue, 13 Apr 2021 06:40:52 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id b3so2238239oie.5;
        Tue, 13 Apr 2021 06:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q8k5KIoAJxTz7nY48b7FVrEzjbp0a4CTUPK+PZNjOiw=;
        b=QaJGW2XuJ2X/EKwBxViTCtNoxjSPCHBZDX+JQn1WZqG2qn4IvSRFX0RYFZPp53tOhc
         lTFiMOFatNEyJd7elgR6U8KMjyQxWPY55BZcPXjAfr7iBXGxiU+UsFs058d5SqsBvh0I
         6NM9DeWwuduE5PyWwQlYnRYYvg5eCBdg29UFWibP0xp1Tfy8UH6NhCAvmaqzhb4gX4lx
         jxz4XFc/9ZdnpMRV7vlDFUv2LSf9IPPl89Ezvd1K1BYaXLu+ZXL8FiH4eqYjEYFQ56yU
         VDwXhZZVSkoCH9nU5hzliQ8jmquR3Xz6+BpvIECg9CR0WKUMIeSEJ4464ymCkzR7zmlz
         dy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q8k5KIoAJxTz7nY48b7FVrEzjbp0a4CTUPK+PZNjOiw=;
        b=FFBbKmk8azhN7qPQdJBucfkFiOktE8RfpYkkr6fLDD6VVcWlQ1WRfcwFzsoJkWFyQ3
         cEzNbYS2zpkmTBT+x8hgJtqvIuNieLjlHpBlhgEFznZuWD02vtzj9thTVinAE+EYlQlI
         2bx9CkNFyr9hSCcrywhdinOSt/wI22PD3nFSxhhasbQWFFSwM4Hz6ICi1o5hL4EDD3kC
         oOO2pu3TrnBswtDc0Us23BEjZZHN59fe7NwX8mM4Uc5mVCVrhe7RJZNuLG4xHI/y6W0g
         HD6dxkjD7l5V7BxtMX99Y3jNTe1logreu1xmclJG79+ITgDRY27viDtxJUrlLiHL9l/s
         v7EQ==
X-Gm-Message-State: AOAM531H9d7ZHhMPJem3qnDn9CtkbA5q1JPccXWya2W7KQ7qkC4HTaou
        rtzRDu5gWJXufJ076074GW28QGQNRZEp/WKj3+TFWGNCxzw=
X-Google-Smtp-Source: ABdhPJx83050fzmWpOfTrCUsFSOkOrMRtlkheldRZu1idqC4hm8VTNvtSJ91w664VC4CnFZ0h653iZeUF4o4Ili34tg=
X-Received: by 2002:aca:d90a:: with SMTP id q10mr48222oig.63.1618321252146;
 Tue, 13 Apr 2021 06:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210413062146.389690-1-ilya.lipnitskiy@gmail.com>
 <20210413062146.389690-3-ilya.lipnitskiy@gmail.com> <CAHNKnsS5Kn86g2QkFJ0qYsGPf9htmF=n-imVQBWDKYn0C+qOSA@mail.gmail.com>
In-Reply-To: <CAHNKnsS5Kn86g2QkFJ0qYsGPf9htmF=n-imVQBWDKYn0C+qOSA@mail.gmail.com>
From:   Sergey Ryazanov <ryazanov.s.a@gmail.com>
Date:   Tue, 13 Apr 2021 16:40:41 +0300
Message-ID: <CAHNKnsTy71bOAbWJD5p768V8i5cGC5hu9VaZhaT+_kizw3yXmQ@mail.gmail.com>
Subject: Re: [PATCH 2/8] MIPS: pci-rt2880: remove unneeded locks
To:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 13, 2021 at 4:28 PM Sergey Ryazanov <ryazanov.s.a@gmail.com> wrote:
> On Tue, Apr 13, 2021 at 9:22 AM Ilya Lipnitskiy
> <ilya.lipnitskiy@gmail.com> wrote:
> > Mirror pci-rt3883 fix from commit e5067c718b3a ("MIPS: pci-rt3883:
> > Remove odd locking in PCI config space access code"). pci-rt2880 shares
> > the driver layout with pci-rt3883 and the same reasons apply.
> >
> > Caller (generic PCI code) already does proper locking, so no need to add
> > another one here. Local PCI read/write functions are never called
> > simultaneously, also they do not require synchronization with the PCI
> > controller ops, since they are used before the controller registration.
> >
> > Suggested-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>
> > Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> > ---
> >  arch/mips/pci/pci-rt2880.c | 13 -------------
> >  1 file changed, 13 deletions(-)
> >
> > diff --git a/arch/mips/pci/pci-rt2880.c b/arch/mips/pci/pci-rt2880.c
> > index 19f7860fb28b..b4ee07cbcf2a 100644
> > --- a/arch/mips/pci/pci-rt2880.c
> > +++ b/arch/mips/pci/pci-rt2880.c
> > @@ -41,7 +41,6 @@
> >  #define RT2880_PCI_REG_ARBCTL          0x80
> >
> >  static void __iomem *rt2880_pci_base;
> > -static DEFINE_SPINLOCK(rt2880_pci_lock);
> >
> >  static u32 rt2880_pci_reg_read(u32 reg)
> >  {
> > @@ -63,7 +62,6 @@ static inline u32 rt2880_pci_get_cfgaddr(unsigned int bus, unsigned int slot,
> >  static int rt2880_pci_config_read(struct pci_bus *bus, unsigned int devfn,
> >                                   int where, int size, u32 *val)
> >  {
> > -       unsigned long flags;
> >         u32 address;
> >         u32 data;
> >         int busn = 0;
> > @@ -74,10 +72,8 @@ static int rt2880_pci_config_read(struct pci_bus *bus, unsigned int devfn,
> >         address = rt2880_pci_get_cfgaddr(busn, PCI_SLOT(devfn), PCI_FUNC(devfn),
> >                                          where);
> >
> > -       spin_lock_irqsave(&rt2880_pci_lock, flags);
> >         rt2880_pci_reg_write(address, RT2880_PCI_REG_CONFIG_ADDR);
> >         data = rt2880_pci_reg_read(RT2880_PCI_REG_CONFIG_DATA);
> > -       spin_unlock_irqrestore(&rt2880_pci_lock, flags);
> >
> >         switch (size) {
> >         case 1:
> > @@ -97,7 +93,6 @@ static int rt2880_pci_config_read(struct pci_bus *bus, unsigned int devfn,
> >  static int rt2880_pci_config_write(struct pci_bus *bus, unsigned int devfn,
> >                                    int where, int size, u32 val)
> >  {
> > -       unsigned long flags;
> >         u32 address;
> >         u32 data;
> >         int busn = 0;
> > @@ -108,7 +103,6 @@ static int rt2880_pci_config_write(struct pci_bus *bus, unsigned int devfn,
> >         address = rt2880_pci_get_cfgaddr(busn, PCI_SLOT(devfn), PCI_FUNC(devfn),
> >                                          where);
> >
> > -       spin_lock_irqsave(&rt2880_pci_lock, flags);
> >         rt2880_pci_reg_write(address, RT2880_PCI_REG_CONFIG_ADDR);
> >         data = rt2880_pci_reg_read(RT2880_PCI_REG_CONFIG_DATA);
> >
> > @@ -127,7 +121,6 @@ static int rt2880_pci_config_write(struct pci_bus *bus, unsigned int devfn,
> >         }
> >
> >         rt2880_pci_reg_write(data, RT2880_PCI_REG_CONFIG_DATA);
> > -       spin_unlock_irqrestore(&rt2880_pci_lock, flags);
> >
> >         return PCIBIOS_SUCCESSFUL;
> >  }
> > @@ -159,31 +152,25 @@ static struct pci_controller rt2880_pci_controller = {
> >
> >  static inline u32 rt2880_pci_read_u32(unsigned long reg)
> >  {
> > -       unsigned long flags;
> >         u32 address;
> >         u32 ret;
> >
> >         address = rt2880_pci_get_cfgaddr(0, 0, 0, reg);
> >
> > -       spin_lock_irqsave(&rt2880_pci_lock, flags);
> >         rt2880_pci_reg_write(address, RT2880_PCI_REG_CONFIG_ADDR);
> >         ret = rt2880_pci_reg_read(RT2880_PCI_REG_CONFIG_DATA);
> > -       spin_unlock_irqrestore(&rt2880_pci_lock, flags);
> >
> >         return ret;
> >  }
> >
> >  static inline void rt2880_pci_write_u32(unsigned long reg, u32 val)
> >  {
> > -       unsigned long flags;
> >         u32 address;
> >
> >         address = rt2880_pci_get_cfgaddr(0, 0, 0, reg);
> >
> > -       spin_lock_irqsave(&rt2880_pci_lock, flags);
> >         rt2880_pci_reg_write(address, RT2880_PCI_REG_CONFIG_ADDR);
> >         rt2880_pci_reg_write(val, RT2880_PCI_REG_CONFIG_DATA);
> > -       spin_unlock_irqrestore(&rt2880_pci_lock, flags);
> >  }
> >
> >  int pcibios_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
>
> RT2880 PCI driver calls rt2880_pci_write_u32()/rt2880_pci_read_u32()
> from pcibios_map_irq(), which is called outside the scope of the
> pci_lock spinlock that is defined in /drivers/pci/access.c. So it
> looks like this could lead to a race between
> rt2880_pci_write_u32()/rt2880_pci_read_u32() and
> rt2880_pci_config_read()/rt2880_pci_config_write() functions.
>
> The code that uses rt2880_pci_write_u32()/rt2880_pci_read_u32() in the
> pcibios_map_irq() duplicates a BAR initialization procedure, which is
> already performed by the rt288x_pci_probe().
>
> Maybe we should remove duplicated code in the pcibios_map_irq() to
> reduce duplication and to avoid possible race in configuration space
> access?
>
> If you fix this possible race, feel free to add in the next patch version my
> Reviewed-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>

Whoops, I just checked the whole series on the patchwork and realized
that you already removed this duplicated code in the first patch of
the series. In such a case this patch is Ok. Sorry for bothering.

Reviewed-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>

-- 
Sergey
