Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3963535E452
	for <lists+linux-mips@lfdr.de>; Tue, 13 Apr 2021 18:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346927AbhDMQtx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 12:49:53 -0400
Received: from mail-il1-f176.google.com ([209.85.166.176]:41649 "EHLO
        mail-il1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346986AbhDMQtq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 13 Apr 2021 12:49:46 -0400
Received: by mail-il1-f176.google.com with SMTP id n4so14616291ili.8;
        Tue, 13 Apr 2021 09:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4N+A7JHqsPi3LJOroFEI2mgQArNrOPRIvko2qHk/rCQ=;
        b=BzPQBCFzF1/896bpY9dwtLzrDwrAVURne1cSYDEQ4Ac9m/4yxlNf2YkV/sH8+gm+ut
         wgHIY++vidtSeFVeR0oyH/FDWZsbReUDuphQoZWlTPXzmMvenqx8lVkF0WxC/l5fOfFF
         iWYvwcMm0obXZ06ZH7igve10yjMiNuxaouF3BWzXgBt7HaxhqURYVGDsQVfiZlVtpKC9
         eWNJfwhWcyHpArE93t1LFBggurjcBsmOSQrgw3n1ep7BuKMXJAkhAhYKROSQWNkT5afy
         7TFIoAfs1ZZkiTxXx8x283fVLqBAVnQFgfVneWNO2WARZ0DOha1eeNTNufp5jSh9nj2j
         8o+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4N+A7JHqsPi3LJOroFEI2mgQArNrOPRIvko2qHk/rCQ=;
        b=R2/W0cVAHo1iv/XqK/VrTWGFdKwybIJo3im4xPNJ40N7vONewCb2w2g/rQUZPUzNOB
         K7q1ck36Ez7Mcs4BZiSfA3VIJvn/ZAhkiHPla588UKm7krerdu0AQhX3FpEFiOMad6/R
         TIwdmj19PH+P0Qr70YOqpsRMh35bqzbE39u7Cs298Wg84Ok8ER9xwCN5s4m4B/GruHu3
         pDEO0a46rGziP3lUTpdXfOUFUHG86xK0rGtXiNehVgCbU0GVrNNanmmUQ66uNjMWFyba
         w1NL46z2PYGGL1RDBwZ8F6aLNoeu9It6ZYuY5VMv10LwlYKCDtGjCM/XeW83g/73vpIX
         UN5g==
X-Gm-Message-State: AOAM531AjQosHRF+0hw0eYmeR8VS6vbPg8cjirFLSb+wrae9Xu0/QSUo
        V9oHlxG4DtalbKmlr5bic4JWV4BElCMJcUybAS0=
X-Google-Smtp-Source: ABdhPJz5siUN+3y1/HFaLtpTOgbPIQav1074OpujWOobUWyohcU2pSfhjIyFMYZQYa9L1oXKnuaSCMSv1tvc4DL7Zhc=
X-Received: by 2002:a05:6e02:1b0e:: with SMTP id i14mr27489961ilv.58.1618332506241;
 Tue, 13 Apr 2021 09:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210413062146.389690-1-ilya.lipnitskiy@gmail.com>
 <20210413062146.389690-3-ilya.lipnitskiy@gmail.com> <CAHNKnsS5Kn86g2QkFJ0qYsGPf9htmF=n-imVQBWDKYn0C+qOSA@mail.gmail.com>
 <CAHNKnsTy71bOAbWJD5p768V8i5cGC5hu9VaZhaT+_kizw3yXmQ@mail.gmail.com>
In-Reply-To: <CAHNKnsTy71bOAbWJD5p768V8i5cGC5hu9VaZhaT+_kizw3yXmQ@mail.gmail.com>
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Date:   Tue, 13 Apr 2021 09:48:15 -0700
Message-ID: <CALCv0x1CNnGCqmOC3U=kJPDQ0a9VrtjB4C4M5JX=LyVYgRGtCw@mail.gmail.com>
Subject: Re: [PATCH 2/8] MIPS: pci-rt2880: remove unneeded locks
To:     Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Sergey,

On Tue, Apr 13, 2021 at 6:40 AM Sergey Ryazanov <ryazanov.s.a@gmail.com> wrote:
>
> On Tue, Apr 13, 2021 at 4:28 PM Sergey Ryazanov <ryazanov.s.a@gmail.com> wrote:
> > On Tue, Apr 13, 2021 at 9:22 AM Ilya Lipnitskiy
> > <ilya.lipnitskiy@gmail.com> wrote:
> > > Mirror pci-rt3883 fix from commit e5067c718b3a ("MIPS: pci-rt3883:
> > > Remove odd locking in PCI config space access code"). pci-rt2880 shares
> > > the driver layout with pci-rt3883 and the same reasons apply.
> > >
> > > Caller (generic PCI code) already does proper locking, so no need to add
> > > another one here. Local PCI read/write functions are never called
> > > simultaneously, also they do not require synchronization with the PCI
> > > controller ops, since they are used before the controller registration.
> > >
> > > Suggested-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>
> > > Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> > > ---
> > >  arch/mips/pci/pci-rt2880.c | 13 -------------
> > >  1 file changed, 13 deletions(-)
> > >
> > > diff --git a/arch/mips/pci/pci-rt2880.c b/arch/mips/pci/pci-rt2880.c
> > > index 19f7860fb28b..b4ee07cbcf2a 100644
> > > --- a/arch/mips/pci/pci-rt2880.c
> > > +++ b/arch/mips/pci/pci-rt2880.c
> > > @@ -41,7 +41,6 @@
> > >  #define RT2880_PCI_REG_ARBCTL          0x80
> > >
> > >  static void __iomem *rt2880_pci_base;
> > > -static DEFINE_SPINLOCK(rt2880_pci_lock);
> > >
> > >  static u32 rt2880_pci_reg_read(u32 reg)
> > >  {
> > > @@ -63,7 +62,6 @@ static inline u32 rt2880_pci_get_cfgaddr(unsigned int bus, unsigned int slot,
> > >  static int rt2880_pci_config_read(struct pci_bus *bus, unsigned int devfn,
> > >                                   int where, int size, u32 *val)
> > >  {
> > > -       unsigned long flags;
> > >         u32 address;
> > >         u32 data;
> > >         int busn = 0;
> > > @@ -74,10 +72,8 @@ static int rt2880_pci_config_read(struct pci_bus *bus, unsigned int devfn,
> > >         address = rt2880_pci_get_cfgaddr(busn, PCI_SLOT(devfn), PCI_FUNC(devfn),
> > >                                          where);
> > >
> > > -       spin_lock_irqsave(&rt2880_pci_lock, flags);
> > >         rt2880_pci_reg_write(address, RT2880_PCI_REG_CONFIG_ADDR);
> > >         data = rt2880_pci_reg_read(RT2880_PCI_REG_CONFIG_DATA);
> > > -       spin_unlock_irqrestore(&rt2880_pci_lock, flags);
> > >
> > >         switch (size) {
> > >         case 1:
> > > @@ -97,7 +93,6 @@ static int rt2880_pci_config_read(struct pci_bus *bus, unsigned int devfn,
> > >  static int rt2880_pci_config_write(struct pci_bus *bus, unsigned int devfn,
> > >                                    int where, int size, u32 val)
> > >  {
> > > -       unsigned long flags;
> > >         u32 address;
> > >         u32 data;
> > >         int busn = 0;
> > > @@ -108,7 +103,6 @@ static int rt2880_pci_config_write(struct pci_bus *bus, unsigned int devfn,
> > >         address = rt2880_pci_get_cfgaddr(busn, PCI_SLOT(devfn), PCI_FUNC(devfn),
> > >                                          where);
> > >
> > > -       spin_lock_irqsave(&rt2880_pci_lock, flags);
> > >         rt2880_pci_reg_write(address, RT2880_PCI_REG_CONFIG_ADDR);
> > >         data = rt2880_pci_reg_read(RT2880_PCI_REG_CONFIG_DATA);
> > >
> > > @@ -127,7 +121,6 @@ static int rt2880_pci_config_write(struct pci_bus *bus, unsigned int devfn,
> > >         }
> > >
> > >         rt2880_pci_reg_write(data, RT2880_PCI_REG_CONFIG_DATA);
> > > -       spin_unlock_irqrestore(&rt2880_pci_lock, flags);
> > >
> > >         return PCIBIOS_SUCCESSFUL;
> > >  }
> > > @@ -159,31 +152,25 @@ static struct pci_controller rt2880_pci_controller = {
> > >
> > >  static inline u32 rt2880_pci_read_u32(unsigned long reg)
> > >  {
> > > -       unsigned long flags;
> > >         u32 address;
> > >         u32 ret;
> > >
> > >         address = rt2880_pci_get_cfgaddr(0, 0, 0, reg);
> > >
> > > -       spin_lock_irqsave(&rt2880_pci_lock, flags);
> > >         rt2880_pci_reg_write(address, RT2880_PCI_REG_CONFIG_ADDR);
> > >         ret = rt2880_pci_reg_read(RT2880_PCI_REG_CONFIG_DATA);
> > > -       spin_unlock_irqrestore(&rt2880_pci_lock, flags);
> > >
> > >         return ret;
> > >  }
> > >
> > >  static inline void rt2880_pci_write_u32(unsigned long reg, u32 val)
> > >  {
> > > -       unsigned long flags;
> > >         u32 address;
> > >
> > >         address = rt2880_pci_get_cfgaddr(0, 0, 0, reg);
> > >
> > > -       spin_lock_irqsave(&rt2880_pci_lock, flags);
> > >         rt2880_pci_reg_write(address, RT2880_PCI_REG_CONFIG_ADDR);
> > >         rt2880_pci_reg_write(val, RT2880_PCI_REG_CONFIG_DATA);
> > > -       spin_unlock_irqrestore(&rt2880_pci_lock, flags);
> > >  }
> > >
> > >  int pcibios_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
> >
> > RT2880 PCI driver calls rt2880_pci_write_u32()/rt2880_pci_read_u32()
> > from pcibios_map_irq(), which is called outside the scope of the
> > pci_lock spinlock that is defined in /drivers/pci/access.c. So it
> > looks like this could lead to a race between
> > rt2880_pci_write_u32()/rt2880_pci_read_u32() and
> > rt2880_pci_config_read()/rt2880_pci_config_write() functions.
> >
> > The code that uses rt2880_pci_write_u32()/rt2880_pci_read_u32() in the
> > pcibios_map_irq() duplicates a BAR initialization procedure, which is
> > already performed by the rt288x_pci_probe().
> >
> > Maybe we should remove duplicated code in the pcibios_map_irq() to
> > reduce duplication and to avoid possible race in configuration space
> > access?
> >
> > If you fix this possible race, feel free to add in the next patch version my
> > Reviewed-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>
>
> Whoops, I just checked the whole series on the patchwork and realized
> that you already removed this duplicated code in the first patch of
> the series. In such a case this patch is Ok. Sorry for bothering.
Thanks for your prompt review. I think you may still have a point,
since I do call rt2880_pci_{read,write}_u32 and
rt2880_pci_config_{read,write} from pcibios_plat_dev_init, which
happens after PCI bus enumeration. I think I can rework it to make it
cleaner and use pci_{read,write}_config_byte.

I will respin the series soon.

Ilya
