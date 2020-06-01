Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73A751EA77D
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jun 2020 18:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgFAQFJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Jun 2020 12:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgFAQFI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Jun 2020 12:05:08 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83D35C05BD43;
        Mon,  1 Jun 2020 09:05:08 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id p21so3706681pgm.13;
        Mon, 01 Jun 2020 09:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RG6UdC9TUfGea0WQL6jywKNDRhC1UaMF2yVsM4Fey0I=;
        b=pojnZOyaCbsuP8bnUPPOlspZ/Kq5/QwY8uiQPgU75d6fbS7p6qdiSR56zI3gyxfJA8
         bFS9qeKYVe62D7EmRt2s5c3+MFcEx+t+cF5Lkr0basIyRilAD3ekvrGT8DpWIs4ZU1n8
         /2fTRVTpFo5jR5lCTuPHlIrDNxQR9OVVH5hSjLUs2cGP3fedK4KUnCK8VXfea9w1uqaj
         fp8AAIW8SiCO/zRtX1PpOjipmhouRQAlzITuD86UhCoCWk+GN7VuvSB7Sj7v5JCmUmHk
         K8Z5AokZ7AaFeasNtUoJ2aOsYnrVkAg/xeTtmb84h+FI2cIPbo05dT5zehDj9tABV+bT
         rsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RG6UdC9TUfGea0WQL6jywKNDRhC1UaMF2yVsM4Fey0I=;
        b=ia3fzxHpnRoKysbfY/l1mAguGieBYn7qe0A/wQPlIBULC5SWeH/PYXqbq9Z9hm4w9b
         7UbzpMxHI9ethtAULwqmBWOQRSTOx15rdRS/J9J0K7ER5UibMyy1WpD2CMbu1BhcQqYd
         0bCeCHJ1iBo2u83aFam+UNcZiy+m47f6LCOHYEy5TnyEVg4qucb+OF34ljKe34jERTF3
         lKnzrafWfvf3/vQ56Xmnm/SWgMpEUSUwl276iruTUjqDii5/BmrLwYCjbXCk+nwUJWZX
         p/feEJW2odNTaCBNhG0HPMn1T7U57ifTsZp2bmiLFvQPlqg3NTWi3b5xYAl6W2Ri0+O7
         WF9Q==
X-Gm-Message-State: AOAM531FKrPyQwVECPSlv3U8PP40ey6s0nV2yJ7AuWmorBjqgHVNArxP
        muQQWbmfHQDkPjbnY1upDUEmNK3IaMwWTYex6hg=
X-Google-Smtp-Source: ABdhPJw3knNb15z4FhKEBkZ7mw+2rVkrut34pw5x2NvfgPIGu2YuHOR221MFARKL1AHyxfOQimy0VNMrbBF1ulHL8EQ=
X-Received: by 2002:a63:545a:: with SMTP id e26mr19368497pgm.4.1591027507937;
 Mon, 01 Jun 2020 09:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200601122121.15809-1-Sergey.Semin@baikalelectronics.ru>
 <20200601122121.15809-7-Sergey.Semin@baikalelectronics.ru>
 <CAHp75Vec8DA+dVDGif7UhBtxDPFZG0nnCav=qLJON=j8=9QxSA@mail.gmail.com>
 <20200601151903.ipd5ikw35z53eq2t@mobilestation> <CAHp75VdQYBqRUbUEHqjp0XE8bEsRcfTuDRn=R-j4c9TYH6niqw@mail.gmail.com>
 <20200601155204.hsatjbukj6haxhld@mobilestation>
In-Reply-To: <20200601155204.hsatjbukj6haxhld@mobilestation>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 1 Jun 2020 19:04:51 +0300
Message-ID: <CAHp75Vej9gRAVspzfruciQ7weFunNBtj8GxbgBCVWtGwk5_ntQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] MAINTAINERS: Add maintainers for MIPS core drivers
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Joe Perches <joe@perches.com>
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

On Mon, Jun 1, 2020 at 6:52 PM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
> On Mon, Jun 01, 2020 at 06:30:22PM +0300, Andy Shevchenko wrote:
> > On Mon, Jun 1, 2020 at 6:19 PM Serge Semin
> > <Sergey.Semin@baikalelectronics.ru> wrote:
> > > On Mon, Jun 01, 2020 at 04:56:21PM +0300, Andy Shevchenko wrote:
> > > > On Mon, Jun 1, 2020 at 3:26 PM Serge Semin
> > > > <Sergey.Semin@baikalelectronics.ru> wrote:
> > > > >
> > > > > Add myself as a maintainer of MIPS CPU and GIC IRQchip, MIPS GIC timer
> > > > > and MIPS CPS CPUidle drivers.
> > > > ...
> > > > > +MIPS CORE DRIVERS
> > > > > +M:     Serge Semin <fancer.lancer@gmail.com>
> > > > > +L:     linux-mips@vger.kernel.org
> > > > > +S:     Supported
> > > > > +F:     drivers/bus/mips_cdmm.c
> > > > > +F:     drivers/irqchip/irq-mips-cpu.c
> > > > > +F:     drivers/irqchip/irq-mips-gic.c
> > > > > +F:     drivers/clocksource/mips-gic-timer.c
> > > > > +F:     drivers/cpuidle/cpuidle-cps.c
> > > >
> > > > I think nowadays checkpatch.pl warns on wrong ordering in this data base.
> > >
> > > Alas it doesn't.
> >
>
> > Ah, it definitely will.
> > it was relatively recently added by:
> > commit 9bbce40a4f72fe01a65669aee9f4036baa7fa26e
> > Author: Joe Perches <joe@perches.com>
> > Date:   Tue May 26 10:36:34 2020 +1000
> >
> >    checkpatch: additional MAINTAINER section entry ordering checks
> >
> >
> > > Good point though.
> >
> > You're welcome.
>
> Next time I won't forget that then. BTW the notes at the top of the MAINTAINERS
> file don't explicitly say about the files-list order. Only about the
> whole maintainers list entries order. Seeing the rest of the sub-entries like
> L:, M:, etc. aren't ordered then it's probably better to have an explicit
> statement, that files should be alphabetically listed, especially when
> checkpatch.pl starts warning about that.

Joe, what do you think?

-- 
With Best Regards,
Andy Shevchenko
