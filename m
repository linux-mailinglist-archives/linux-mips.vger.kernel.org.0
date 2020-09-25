Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B0D4279030
	for <lists+linux-mips@lfdr.de>; Fri, 25 Sep 2020 20:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729593AbgIYSSN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Sep 2020 14:18:13 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:49158 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728069AbgIYSSN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 25 Sep 2020 14:18:13 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 3C2B7803202A;
        Fri, 25 Sep 2020 18:18:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id M9ydMZeshDge; Fri, 25 Sep 2020 21:18:03 +0300 (MSK)
Date:   Fri, 25 Sep 2020 21:18:02 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        "Maciej W . Rozycki" <macro@linux-mips.org>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] mips: Add strong UC ordering config
Message-ID: <20200925181802.bfhtu5ozxc6wkt6g@mobilestation>
References: <20200920110010.16796-1-Sergey.Semin@baikalelectronics.ru>
 <20200920110010.16796-2-Sergey.Semin@baikalelectronics.ru>
 <57fb837a-d884-b368-7a72-d010b5e52f2a@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <57fb837a-d884-b368-7a72-d010b5e52f2a@flygoat.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Sep 25, 2020 at 11:54:20AM +0800, Jiaxun Yang wrote:
> 
> 
> 在 2020/9/20 19:00, Serge Semin 写道:
> > In accordance with [1, 2] memory transactions using CCA=2 (Uncached
> > Cacheability and Coherency Attribute) are always strongly ordered. This
> > means the younger memory accesses using CCA=2 are never allowed to be
> > executed before older memory accesses using CCA=2 (no bypassing is
> > allowed), and Loads and Stores using CCA=2 are never speculative. It is
> > expected by the specification that the rest of the system maintains these
> > properties for processor initiated uncached accesses. So the system IO
> > interconnect doesn't reorder uncached transactions once they have left the
> > processor subsystem. Taking into account these properties and what [3]
> > says about the relaxed IO-accessors we can infer that normal Loads and
> > Stores from/to CCA=2 memory and without any additional execution barriers
> > will fully comply with the {read,write}X_relaxed() methods requirements.
> > 
> > Let's convert then currently generated relaxed IO-accessors to being pure
> > Loads and Stores. Seeing the commit 3d474dacae72 ("MIPS: Enforce strong
> > ordering for MMIO accessors") and commit 8b656253a7a4 ("MIPS: Provide
> > actually relaxed MMIO accessors") have already made a preparation in the
> > corresponding macro, we can do that just by replacing the "barrier"
> > parameter utilization with the "relax" one. Note the "barrier" macro
> > argument can be removed, since it isn't fully used anyway other than being
> > always assigned to 1.
> > 
> > Of course it would be fullish to believe that all the available MIPS-based
> > CPUs completely follow the denoted specification, especially considering
> > how old the architecture is. Instead we introduced a dedicated kernel
> > config, which when enabled will convert the relaxed IO-accessors to being
> > pure Loads and Stores without any additional barriers around. So if some
> > CPU supports the strongly ordered UC memory access, it can enable that
> > config and use a fully optimized relaxed IO-methods. For instance,
> > Baikal-T1 architecture support code will do that.
> > 
> > [1] MIPS Coherence Protocol Specification, Document Number: MD00605,
> >      Revision 01.01. September 14, 2015, 4.2 Execution Order Behavior,
> >      p. 33
> > 
> > [2] MIPS Coherence Protocol Specification, Document Number: MD00605,
> >      Revision 01.01. September 14, 2015, 4.8.1 IO Device Access, p. 58
> > 
> > [3] "LINUX KERNEL MEMORY BARRIERS", Documentation/memory-barriers.txt,
> >      Section "KERNEL I/O BARRIER EFFECTS"
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Cc: Maciej W. Rozycki <macro@linux-mips.org>

> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> 
> 
> Based on #mipslinus discussions, I suspect this option can be selected by
> most modern MIPS processors including all IMG/MTI cores,
> Ingenic and Loongson.

Thanks for reviewing the patch.

Regarding the option. Alas it's not that easy and we must be very careful
with assumption whether some processor supports the denoted feature. Even
if the MIPS cores do imply the strict UC load/stores ordering, the system
interconnects may still perform the out-of-order requests execution. For
instance, the P5600 cores installed into our Baikal-T1 SoC do support the
strong UC ordering, but there is a cascade of the OCP2AXI, AXI2AXI and
AXI2APB bridges behind the CPU memory interface, each of which is equipped
with an internal FIFO and some complicated logic of the traffic routing.
So each platform should be carefully analyzed and tested (if it's
possible) before enabling the suggested feature, otherwise we'll risk to end
up with in general working, but at some point buggy, systems. Needless to
say, that out-of-order exec problems is very hard to track and debug due
to a random nature of impact on the system.

-Sergey

> 
> Thanks.
> 
> - Jiaxun
> 
> > ---
> >   arch/mips/Kconfig          |  8 ++++++++
> >   arch/mips/include/asm/io.h | 20 ++++++++++----------
> >   2 files changed, 18 insertions(+), 10 deletions(-)
> > 
