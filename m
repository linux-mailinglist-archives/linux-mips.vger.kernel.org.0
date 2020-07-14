Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D51FD21F3A6
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2020 16:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725931AbgGNOPJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jul 2020 10:15:09 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:33610 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbgGNOPJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Jul 2020 10:15:09 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id A21E68030867;
        Tue, 14 Jul 2020 14:15:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 3m-kbe7wnLov; Tue, 14 Jul 2020 17:15:06 +0300 (MSK)
Date:   Tue, 14 Jul 2020 17:15:04 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Arnd Bergmann <arnd@arndb.de>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, James Hogan <jhogan@kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 5/6] bus: cdmm: Add MIPS R5 arch support
Message-ID: <20200714141504.oybqzaii5hcdy7cq@mobilestation>
References: <20200714125753.22466-1-Sergey.Semin@baikalelectronics.ru>
 <20200714125753.22466-6-Sergey.Semin@baikalelectronics.ru>
 <CAK8P3a09RW+zCMJ9Luh2C3NkYPdY4Esu6EKk_QX_i4faV-rUjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAK8P3a09RW+zCMJ9Luh2C3NkYPdY4Esu6EKk_QX_i4faV-rUjg@mail.gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jul 14, 2020 at 03:28:30PM +0200, Arnd Bergmann wrote:
> On Tue, Jul 14, 2020 at 2:58 PM Serge Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:
> >
> >  config MIPS_CDMM
> >         bool "MIPS Common Device Memory Map (CDMM) Driver"
> > -       depends on CPU_MIPSR2
> > +       depends on CPU_MIPSR2 || CPU_MIPSR5
> >         help
> 

> Wouldn't a kernel built for P5600 have CPU_MIPSR2 set already?

No. P5600 core is based on MIPS32 r5, for which since 5.8 there has been a
dedicated kernel config CPU_MIPSR5 available. 

> I thought R5 was just a backwards-compatible extension of R2.

Yes, it's an extension and they are compatible in most of aspects, but
there are still differences, which when activated/used make kernel built
for R5 being incompatible with R2. For instance there is an ISA
extension in R5 which hasn't been available in R5 like "eretnc"
(return from exceptions with no atomic flag cleared), "mfhc/mthc0"
(extended C0 register move instructions), etc. There is some other
features/optimizations available since R5. Please see commit
ab7c01fdc3cf ("mips: Add MIPS Release 5 support") for details.

> 
> If not, what about R3?

Currently if some chip is equipped with R3, then the kernel must be built
for R2 with features like EVA enabled if it's required.

-Sergey

> 
>       Arnd
