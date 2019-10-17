Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12598DAB4C
	for <lists+linux-mips@lfdr.de>; Thu, 17 Oct 2019 13:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391191AbfJQLgq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Oct 2019 07:36:46 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38492 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391251AbfJQLgq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 17 Oct 2019 07:36:46 -0400
Received: by mail-oi1-f194.google.com with SMTP id m16so1847163oic.5
        for <linux-mips@vger.kernel.org>; Thu, 17 Oct 2019 04:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ek2+c1gCnkTxEM4APFDQa44Mx9QjBoPczi35Tjcy5EY=;
        b=iE6P0o043pzZI0I+i9GA6LZMTbL9fxZUIPH9LDIEgHhMyjDd7JKvpFB8aMurQ8eE1+
         XEV7iTOoVAqumk4RwoUqIKcd8cyXh1jQlnLeysieMQn5uPn3sSOtfyKQtmTvxZG9MTuI
         ezBLdO5qjaoGPbwrTiWrdl7jys0uDlRf3RcBU80ItZ1c+4axF2asWmDtx5XnBigxDHvE
         l2mKnTEuRtmj40k4L3pED0n9SPOs2cjYYIMWqV3yZo5NOCE9+JZbfjt4XyqGiUDBXefN
         PTnJ3T7HAlhZCRzz2GDZLFmhqtGgfPQmGv6aaKyVyt56A3ogZahablhYyoF6yWkfIGgS
         W/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ek2+c1gCnkTxEM4APFDQa44Mx9QjBoPczi35Tjcy5EY=;
        b=QP4A/exJCV8RsyWwuJF73rDGwtl4+QwBAPvIL6wsTfQGhDnqb51jXll4p5eForUHhY
         hcbXpQz7+3FdvTLlEMhFssYLRH8wA86aUeExDUXND83SHEHTVTP/vcR2ETJ1Q2vN6RWy
         iaLqooqGPmCEzFvDdGtiA1j1QNjD9YdbRPIQYabjkJuCloQTkrBmkrjn2i8U7/0HuGV5
         mrDLlQaaLfYVMNziloQZ914NhQ3FxJzwbAUJ7+e62bI0WoNzC+WLHgCERjGmf7He4DEn
         BH4qop4MyBf8IZUCsAZhej6XemfKfrHqgWtd286hxKxigXytdn9oT60rA8ydB/pJNy/7
         /xJQ==
X-Gm-Message-State: APjAAAXucVGPTxvHCI+z7Q3oVrJ3du7sv4efECBmfIX81AU5/8N5yYWn
        ks6UHAIbW1Ywv/V3eouKhJY++wcbUF4bptBFVaw=
X-Google-Smtp-Source: APXvYqymEtzfglS3sll2XGoZy7Jy+Hh+ixoRUBQy3Pd9Cj1T7S7G5Mn2LcRcU8DFm3CPbj1MzzMR0aVY495z9Ub7zUY=
X-Received: by 2002:aca:d44e:: with SMTP id l75mr2809435oig.44.1571312203428;
 Thu, 17 Oct 2019 04:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAMhs-H93MvRBPpR2ra33wf667V_wyDmQGWY0n_rB=puq_aBGog@mail.gmail.com>
 <87v9sopd5f.fsf@notabene.neil.brown.name> <CAMhs-H9p7aLah05ua5uRJMmLWjqq4DvnYsFVv6qGBaQcuQ2nVQ@mail.gmail.com>
In-Reply-To: <CAMhs-H9p7aLah05ua5uRJMmLWjqq4DvnYsFVv6qGBaQcuQ2nVQ@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Thu, 17 Oct 2019 13:36:32 +0200
Message-ID: <CAMhs-H8e7zmnyaQ5XgxjVfZSjzfWd7BN7__1H8th_LTGk2AHYA@mail.gmail.com>
Subject: Re: PCI support for SOC_MT7621
To:     NeilBrown <neil@brown.name>
Cc:     hauke@hauke-m.de, paul.burton@mips.com, linux-mips@vger.kernel.org,
        ralf@linux-mips.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Oct 17, 2019 at 8:12 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> Hi Neil,
>
> On Wed, Oct 16, 2019 at 11:57 PM NeilBrown <neil@brown.name> wrote:
> >
> > On Wed, Oct 16 2019, Sergio Paracuellos wrote:
> >
> > > Hi all,
> > >
> > > I have a concern about commit:
> > >
> > > c4d48cf5e2f0 ("MIPS: ralink: deactivate PCI support for SOC_MT7621")
> > >
> > > This commit make a regression for my kernel configuration for gnubee
> > > board which is mt7621 SOC based and also has PCI. With this applied
> > > PCI_DRIVERS_GENERIC is not selectable anymore and it becomes into a
> > > PCI_DRIVERS_LEGACY configuration making impossible to compile
> > > mt7621-pci driver for this board.
> > >
> > > I think this should be reverted. Am I missing something here?
> >
> > The commit reports a build error without the patch, and we don't want
> > that.
>
> I didn't understand properly the commit message. Yes, of course we
> don't want a build
> fail :).
>
> > Maybe change the
> >   select HAVE_PCI
> > to
> >   select HAVE_PCI if STAGING
> > or
> >   select HAVE_PCI if PCI_MT7621
>
> I think the second one could be more accurate in this case.

Actually I tested this two changes with my current configuration.
PCI_MT7621 depends on PCI so the second one gets into a recursive
dependency problem. We can skip depends on PCI and only select
PCI_DRIVERS_GENERIC in mt7621_pci Kconfig file to avoid this. The
following change works,  but I don't know if this is the correct thing
to do:

$ git diff arch/mips/ralink/Kconfig drivers/staging/mt7621-pci/Kconfig
diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
index 1434fa60f3db..94e9ce994494 100644
--- a/arch/mips/ralink/Kconfig
+++ b/arch/mips/ralink/Kconfig
@@ -51,6 +51,7 @@ choice
                select MIPS_GIC
                select COMMON_CLK
                select CLKSRC_MIPS_GIC
+               select HAVE_PCI if PCI_MT7621
 endchoice

 choice
diff --git a/drivers/staging/mt7621-pci/Kconfig
b/drivers/staging/mt7621-pci/Kconfig
index af928b75a940..ce58042f2f21 100644
--- a/drivers/staging/mt7621-pci/Kconfig
+++ b/drivers/staging/mt7621-pci/Kconfig
@@ -2,7 +2,6 @@
 config PCI_MT7621
        tristate "MediaTek MT7621 PCI Controller"
        depends on RALINK
-       depends on PCI
        select PCI_DRIVERS_GENERIC
        help
          This selects a driver for the MediaTek MT7621 PCI Controller.

In the other hand, the "select HAVE_PCI if STAGING" one works as it is.

Thanks,
    Sergio Paracuellos
>
> >
> > Hauke: do either of those fix your compile error?
> >
>
> If so, I don't have any problem to send a patch with this fixed if you
> are busy. Just let me know.
>
> > Thanks,
> > NeilBrown
>
> Best regards,
>     Sergio Paracuellos
> >
> >
> > >
> > > Thanks in advance for your time.
> > >
> > > Best regards,
> > >     Sergio Paracuellos
