Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 937F31EA6E5
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jun 2020 17:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbgFAPae (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Jun 2020 11:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbgFAPae (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Jun 2020 11:30:34 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 343DDC05BD43;
        Mon,  1 Jun 2020 08:30:34 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id k2so5366259pjs.2;
        Mon, 01 Jun 2020 08:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QNaKpABssQJsIlmIF2vPUt4np9zB8hELHW04He8nqOQ=;
        b=a0Av2hNBqtgTdTAr+p2x/f5zus91eXE7rEuen753Wg8t6WpX8Onv25F1FWjZ4Y+5w5
         WjXstB58G18EiOcn5M9q86QQjdr5NoDvkQH0gWrGEd5PsgrLYhrK858qz+PKpIOvktVI
         wHIgJ3ssYy/O54LzZ8UJt9ZNXniRD9v5+ioGCo+6I0hrkAjvan5vAZtyAE2iHpA65P6Y
         5pS3lh1jmVmfkjau6vhvbVOHZfSW2BMSr7qUP8w2bPO8KLv4xnIT7S9JetXJkE14kMhg
         ndGyccT/gyT94inbc3zAdWBOutq2F8TzojDkA0IKdSTIq/S42Xan/hBRMKqjV4yP8pqc
         ObSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QNaKpABssQJsIlmIF2vPUt4np9zB8hELHW04He8nqOQ=;
        b=mQATNh0s0nkQDOJcmZZhDLSgB6iByZafqyU8M8YLTIQJatylP8oDVNRTGF+HdkSQAu
         ufkN1GIHOd//gHomdBWX4kWVMkpYK0P1lqiXeJzcK2HJtBChYtWDr/P5hHknhq9gqTuX
         bGbRsbspPR/BX2dlNv/7gLEKIu3EsDPkdIHA5dYiIcDChLvtTJdhBgUstWCGaFbLZao4
         B2tWJqY68bqlvQloO4rr5rzMTPjrcRQLV2o4sdYvsvrv+o/3pBT9qEEi5uDNrNMLFCru
         VqV/d004DyHVEZVjq1+B5m0kK3/v6HoLFF+RUfQmt7HUFucfL0GkjGcKnshMN2emEUqR
         c4pw==
X-Gm-Message-State: AOAM530aKBn3G+C71Qxhl6MHT0uet4tjUKxtVimGIzwnp+GMrJxL8ITC
        tkcMmf52UquqQ3eJutU8/pRAQRatnHl+MNBivVc=
X-Google-Smtp-Source: ABdhPJzZxvxDjXZNs819EKHyv35SZfKuwSiIyR7eIVz5AFob0gjXfZUxAiuuSdL9SnD3wyRpbn2NpfXwMVkYj2HS6xc=
X-Received: by 2002:a17:90a:1704:: with SMTP id z4mr23663623pjd.181.1591025433717;
 Mon, 01 Jun 2020 08:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200601122121.15809-1-Sergey.Semin@baikalelectronics.ru>
 <20200601122121.15809-7-Sergey.Semin@baikalelectronics.ru>
 <CAHp75Vec8DA+dVDGif7UhBtxDPFZG0nnCav=qLJON=j8=9QxSA@mail.gmail.com> <20200601151903.ipd5ikw35z53eq2t@mobilestation>
In-Reply-To: <20200601151903.ipd5ikw35z53eq2t@mobilestation>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 1 Jun 2020 18:30:22 +0300
Message-ID: <CAHp75VdQYBqRUbUEHqjp0XE8bEsRcfTuDRn=R-j4c9TYH6niqw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] MAINTAINERS: Add maintainers for MIPS core drivers
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paul.burton@imgtec.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jun 1, 2020 at 6:19 PM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
> On Mon, Jun 01, 2020 at 04:56:21PM +0300, Andy Shevchenko wrote:
> > On Mon, Jun 1, 2020 at 3:26 PM Serge Semin
> > <Sergey.Semin@baikalelectronics.ru> wrote:
> > >
> > > Add myself as a maintainer of MIPS CPU and GIC IRQchip, MIPS GIC timer
> > > and MIPS CPS CPUidle drivers.
> > ...
> > > +MIPS CORE DRIVERS
> > > +M:     Serge Semin <fancer.lancer@gmail.com>
> > > +L:     linux-mips@vger.kernel.org
> > > +S:     Supported
> > > +F:     drivers/bus/mips_cdmm.c
> > > +F:     drivers/irqchip/irq-mips-cpu.c
> > > +F:     drivers/irqchip/irq-mips-gic.c
> > > +F:     drivers/clocksource/mips-gic-timer.c
> > > +F:     drivers/cpuidle/cpuidle-cps.c
> >
> > I think nowadays checkpatch.pl warns on wrong ordering in this data base.
>
> Alas it doesn't.

Ah, it definitely will.
it was relatively recently added by:
commit 9bbce40a4f72fe01a65669aee9f4036baa7fa26e
Author: Joe Perches <joe@perches.com>
Date:   Tue May 26 10:36:34 2020 +1000

   checkpatch: additional MAINTAINER section entry ordering checks


> Good point though.

You're welcome.

-- 
With Best Regards,
Andy Shevchenko
