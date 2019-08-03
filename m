Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2F108076B
	for <lists+linux-mips@lfdr.de>; Sat,  3 Aug 2019 19:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726862AbfHCRd5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 3 Aug 2019 13:33:57 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40419 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbfHCRd4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 3 Aug 2019 13:33:56 -0400
Received: by mail-ot1-f66.google.com with SMTP id l15so24131509oth.7;
        Sat, 03 Aug 2019 10:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a73iM0e1gPWjjRBi3/LsFQbixuEHj+TrPlcXhkLNbHk=;
        b=KJgjf/Ze0bomvSK3eoP82aftItOEt2KoT40KuFK+E3nFGSuDP4ADawxFdJ7mYutbCB
         FIPgRWYB6oNloDOv12BXfCdjKLoSmiS7Z3L7G+OoctWtODsfW3fkQqfhMHUIINz4LM9B
         nw9xgemXYy9JUhYCMs/+WQJ6p0KkG5frwJFTxGYZ5OpiyNpL8LdVAbdM15ntZXDA0ggg
         DhpmVnDNM4ORl++VVkFzt26gybaaL2kCQujfhV8z+1hYheqnPj2jUG797DLjffdeXArv
         aEfECj2pAXhgjOLuZSw6FrxB3jC1TX8r6LNWCiqnL3450QT2dZRDFKuq01CkAlaqDD63
         j3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a73iM0e1gPWjjRBi3/LsFQbixuEHj+TrPlcXhkLNbHk=;
        b=BlzJSDfc9q0jgqbsiR070lVpD82eb/UTJ/GadFhtpC+YqMqPArkI7hzRnPqnWFLrte
         wbE6xPKNx3Fk/MFVU4S7va1Lq3RmeYissg/u0tvrzGmRtvN0auuYGTrM/YCImxFCzN2r
         JkQ4O6xITtpoLbiejRbUe5F/47WNg+h1M64ziOW+NrWBsqK8Swz6krWI97+sMOyxO4p5
         iOd5iJ2QCgd9rAURuXueushmWwOm8+Z4wU/hOIP98cWfJvlzh2M65WJerfujvgoKDJP2
         vqQRw659FifP9SJo3XGTgjTKOnnwj6ZcOv8ceWO3NiWxipiZbEnhP7F19JG9AmpuqiG+
         4gRA==
X-Gm-Message-State: APjAAAUG9aPz3Z/nHQzqmGUnRlJYEZbBk/k2y4UAcSNAsnK+poGnWNde
        Qgj6JzPeAn7TXip07u+83cpXYs4+uL1/VzoO7iw=
X-Google-Smtp-Source: APXvYqzARiKQOmIFeC82NX4vTy2Cl293F6MvbG/RYu/jrYovez6E9n9htWgDtFz/z9hUSB0GpMAo/P02OBy1FSW61Lk=
X-Received: by 2002:a9d:6d8d:: with SMTP id x13mr36621465otp.6.1564853635352;
 Sat, 03 Aug 2019 10:33:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190727175315.28834-1-martin.blumenstingl@googlemail.com>
 <20190727175315.28834-4-martin.blumenstingl@googlemail.com>
 <86y30imq9p.wl-marc.zyngier@arm.com> <CAFBinCCb4aTfuxaSrUp8xbUjjefi_qHOUJLjzH+acUTLY+6Geg@mail.gmail.com>
 <86o916mx2m.wl-maz@kernel.org>
In-Reply-To: <86o916mx2m.wl-maz@kernel.org>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sat, 3 Aug 2019 19:33:44 +0200
Message-ID: <CAFBinCDRBmG39Pa4XBa2Bu8K6GH7iz_YyKoJ795XKTnEz2b4VQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] MIPS: lantiq: add an irq_domain and irq_chip for EBU
To:     Marc Zyngier <maz@kernel.org>
Cc:     tglx@linutronix.de, jason@lakedaemon.net, ralf@linux-mips.org,
        paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        john@phrozen.org, Hauke Mehrtens <hauke@hauke-m.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Marc,

On Sat, Aug 3, 2019 at 11:12 AM Marc Zyngier <maz@kernel.org> wrote:
>
> Hi Martin,
>
> On Thu, 01 Aug 2019 18:42:42 +0100,
> Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>
> [...]
>
> > > > +static void ltq_ebu_irq_handler(struct irq_desc *desc)
> > > > +{
> > > > +     struct irq_domain *domain = irq_desc_get_handler_data(desc);
> > > > +     struct irq_chip *irqchip = irq_desc_get_chip(desc);
> > > > +
> > > > +     chained_irq_enter(irqchip, desc);
> > > > +
> > > > +     generic_handle_irq(irq_find_mapping(domain, 0));
> > >
> > > Having an irqdomain for a single interrupt is a bit over the top... Is
> > > that for the convenience of the DT infrastructure?
> > yes, I did it to get DT support
> > please let me know if there's a "better" way (preferably with another
> > driver as example)
>
> To be honest, the chained handler is what troubles me the most. You
> normally would use such a construct if you had a multiplexer. In your
> case, you have a 1:1 relationship between input and output. It is just
> that this irqchip allows the trigger to be adapted, which normally
> calls for a hierarchical implementation.
>
> In your case, with only a single interrupt, it doesn't matter much
> though.
I see, thank you for the explanation

can you name a driver for a hierarchical irqchip driver that you
consider "clean" which I could use as reference?
I am considering to still convert it to a hierarchical irqchip driver
to keep it consistent with at least two more upcoming Lantiq irqchip
drivers (which both seem to be similar use-cases as this one, they
just provide more than one interrupt):
- there's a PCI legacy interrupt controller in the PCIe controller's
app registers. it takes 4 parent interrupts and provides
PCI_INT{A,B,C,D}. the interrupts need to be enabled and ACK'ed in the
PCIe app registers as well as in the parent interrupt controller
- the EIU (External Interrupt Unit) in my own words is the GPIO
interrupt controller. it takes up to 6 parent interrupts and provides
one interrupt for each "EXIN GPIO". setting the IRQ type and ACK need
to happen through the EIU registers as well as the parent interrupt
controller

my initial thought is that it's best to follow one programming model
(which based on your suggestion would be a hierarchical irqchip) for
all three IRQ controllers

> >
> > [...]
> > > > +     irq_create_mapping(domain, 0);
> > >
> > > Why do you need to perform this eagerly? I'd expect this interrupt to
> > > be mapped when it is actually claimed by a driver.
> > I don't remember why I added it, it may be left-over from copying from
> > another driver
> > in v2 I'll try to drop it
> >
> > > > +
> > > > +     irq_set_chained_handler_and_data(irq, ltq_ebu_irq_handler, domain);
> > >
> > > And there is no HW initialisation whatsoever? I'd expect, at the very
> > > least, the sole interrupt to be configured as disabled/masked.
> > I can add that. is there any "best practice" on what I should
> > initialize (just disable it or also set a "default" mode like
> > LEVEL_LOW)?
>
> Whichever default state makes sense. What you want to avoid is to boot
> the kernel with a screaming interrupt because some firmware has left
> it enabled.
noted, thank you


Martin
