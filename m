Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0287DEBCFE
	for <lists+linux-mips@lfdr.de>; Fri,  1 Nov 2019 06:09:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729712AbfKAFI7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 Nov 2019 01:08:59 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46444 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728737AbfKAFI7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 Nov 2019 01:08:59 -0400
Received: by mail-ot1-f66.google.com with SMTP id 89so7399168oth.13
        for <linux-mips@vger.kernel.org>; Thu, 31 Oct 2019 22:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=86dy+UvmqqhMa4o990r262R3NCWsufaFyCZcPiyIBG8=;
        b=Ec8bn2d5x5Plx7wItl6XzxufaPRxVJwNpyxzu88zlfTmFe+a4z9sR/QgGwjTNrsn0W
         B+qnkV/s3HZPEanmY03rLRgU99pZggxrb0FOZ4bRah6+Z+Y9QxHdQ6TqXLkjJ8C84wDB
         sdEupEqwjca52TxoUcKE4cyXFMgmSSGCGhEmRsNtU/m7W+XgXjGReySm1OBxDQDBTbbE
         YQ9wJ/0JFQL99S1dF9fk2FwXeGbbOexe28f+wrdBpXc84B1+kjmKEf/xT1yOqAmTQ9DT
         4lWIWwLkKOBGmuQNAWcziSpQN/I/eQ787OmF1DsevMF2QT2MAw0jcakYL1q0hTCvQUlI
         VnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=86dy+UvmqqhMa4o990r262R3NCWsufaFyCZcPiyIBG8=;
        b=BUfNoMYK7zc6TPXJbF7eCxdEqcfOa0ti3H6FHoWjJOXX1tSxwlxcefLbwvnff7qgK2
         OmUqSO10u3PeqWRvseMPMF4cgtgoDwVijzr8Lw4WoG/tK5dkVTGVPDN/NdPiYb2fDwCP
         dGew69Q8zv4LcuQMoclgRtJ6BoKby5LB/sbsrusuhpioB+4bxp9tDTsA5e69e0eJYlsp
         k2p47pujXmt7+UUANeYHHLm9We1zkJZ8aj3XM3q8PIr9gdpRMisSHDgBF8UbL8aj+alb
         IopAG84kuPzDF41cZ5oocntMg8R4wbRfaterRYLDMB2fujINl0Y2D/PtyMnw+xIRCluH
         c0bA==
X-Gm-Message-State: APjAAAXzoYF+xmHSRToomA4tRLiD1gOHd4iocjdcC2uL+QFI4aHO+VOk
        OQmStu121FUhDHFo2fe3UXFiJNO6ZzzN5Pufrto=
X-Google-Smtp-Source: APXvYqwTiqTTduhMxjahA81qEeMz1cRSxjGZujq79eVQdExbCMrCHmuVqXpo0B3B/NT12FP814KtFXzP5SVZ+0fnTZQ=
X-Received: by 2002:a9d:4b89:: with SMTP id k9mr7404091otf.273.1572584938091;
 Thu, 31 Oct 2019 22:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <20191031071124.22102-1-sergio.paracuellos@gmail.com> <20191031213656.iycqiijz3nd5xtkr@lantea.localdomain>
In-Reply-To: <20191031213656.iycqiijz3nd5xtkr@lantea.localdomain>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Fri, 1 Nov 2019 06:08:46 +0100
Message-ID: <CAMhs-H82t8Rmr2Hz-SmQbw+KNyB_7-N+6Ys0LFA-mptGJ3YR1g@mail.gmail.com>
Subject: Re: [PATCH RESEND] MIPS: ralink: enable PCI support only if driver
 for mt7621 SoC is selected
To:     Paul Burton <paulburton@kernel.org>
Cc:     Hauke Mehrtens <hauke@hauke-m.de>,
        Paul Burton <paul.burton@mips.com>, ralf@linux-mips.org,
        jhogan@kernel.org, John Crispin <john@phrozen.org>,
        NeilBrown <neil@brown.name>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

Thanks for the review.

On Thu, Oct 31, 2019 at 10:36 PM Paul Burton <paulburton@kernel.org> wrote:
>
> Hi Sergio,
>
> On Thu, Oct 31, 2019 at 08:11:24AM +0100, Sergio Paracuellos wrote:
> > diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
> > index 1434fa60f3db..94e9ce994494 100644
> > --- a/arch/mips/ralink/Kconfig
> > +++ b/arch/mips/ralink/Kconfig
> > @@ -51,6 +51,7 @@ choice
> >               select MIPS_GIC
> >               select COMMON_CLK
> >               select CLKSRC_MIPS_GIC
> > +             select HAVE_PCI if PCI_MT7621
> >  endchoice
> >
> >  choice
> > diff --git a/drivers/staging/mt7621-pci/Kconfig b/drivers/staging/mt7621-pci/Kconfig
> > index af928b75a940..ce58042f2f21 100644
> > --- a/drivers/staging/mt7621-pci/Kconfig
> > +++ b/drivers/staging/mt7621-pci/Kconfig
> > @@ -2,7 +2,6 @@
> >  config PCI_MT7621
> >       tristate "MediaTek MT7621 PCI Controller"
> >       depends on RALINK
> > -     depends on PCI
> >       select PCI_DRIVERS_GENERIC
> >       help
> >         This selects a driver for the MediaTek MT7621 PCI Controller.
>
> This doesn't seem right to me - doesn't this now allow the PCI
> controller driver to build without PCI support enabled? Are you sure
> that won't allow more build failures?

No, I am not really sure. I don't really know what is the best
approach to be able to avoid the build failure reported in
c4d48cf5e2f0 ("MIPS: ralink: deactivate PCI support for SOC_MT7621")
but this commit is a regression and avoid to properly build the
MediaTek MT7621 PCI Controller driver located in staging.

>
> How does enabling the driver change whether or not the SoC has PCI
> support? The SoC is always the same hardware regardless of whether you
> enable the driver for it, so this doesn't seem right to me.

So, this SOC has three PCI's, so "select HAVE_PCI" seems the right
thing to do for the SoC config but it seems in some versions that has
build failures.

>
> Hauke - do you recall what the build failure you mentioned in commit
> c4d48cf5e2f0 ("MIPS: ralink: deactivate PCI support for SOC_MT7621")
> was?

It would be awesome to know that to be able to get a general valid solution.

>
> Thanks,
>     Paul

Best regards,
    Sergio Paracuellos
