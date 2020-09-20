Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1107B271361
	for <lists+linux-mips@lfdr.de>; Sun, 20 Sep 2020 13:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726280AbgITLHX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Sep 2020 07:07:23 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:53208 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgITLHW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 20 Sep 2020 07:07:22 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id E64828030718;
        Sun, 20 Sep 2020 11:00:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id fpkgHK4YMOV0; Sun, 20 Sep 2020 14:00:45 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        "Maciej W . Rozycki" <macro@linux-mips.org>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] mips: Introduce some IO-accessors optimizations
Date:   Sun, 20 Sep 2020 14:00:08 +0300
Message-ID: <20200920110010.16796-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

It has been discovered that on our MIPS P5600-based CPU the IO accessors
aren't that rapid as they could be even taking into account a relatively
slow AXI2APB bridge embedded into the system interconnect. Turned out we
can introduce two types of optimizations. First we can remove the
execution barriers from the relaxed IO-accessors as our CPU conforms to
the MIPS Coherency Protocol Specification [1, 2]. Of course it also
concerns the IO interconnect implementation. So in accordance with [3] we
suggest to remove the barriers at least for the platforms which conform
the specification the same way as ours. Second there is a dedicated
Coherency Manager control register, which can be also used to tune the IO
methods up. For some reason it hasn't been added to the MIPS arch code so
far, while it provides flags for instance to speed the SYNC barrier for
the platforms with non-re-ordering IO interconnect, to set the cache ops
serialization limits, enable the speculative reads, etc. For now we
suggest to add just the macro with the CM2 GCR_CONTROL register accessors
and fields description. So any platform could use it to activate the
corresponding optimization. Our platform-wise we'll do this in the
framework of our Baikal-T1 platform code in the prom_init() method.

[1] MIPS Coherence Protocol Specification, Document Number: MD00605,
    Revision 01.01. September 14, 2015, 4.2 Execution Order Behavior,
    p. 33

[2] MIPS Coherence Protocol Specification, Document Number: MD00605,
    Revision 01.01. September 14, 2015, 4.8.1 IO Device Access, p. 58

[3] "LINUX KERNEL MEMORY BARRIERS", Documentation/memory-barriers.txt,
Section "KERNEL I/O BARRIER EFFECTS"

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Cc: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
Cc: Maciej W. Rozycki <macro@linux-mips.org>
Cc: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Serge Semin (2):
  mips: Add strong UC ordering config
  mips: Introduce MIPS CM2 GCR Control register accessors

 arch/mips/Kconfig               |  8 ++++++++
 arch/mips/include/asm/io.h      | 20 ++++++++++----------
 arch/mips/include/asm/mips-cm.h | 15 +++++++++++++++
 3 files changed, 33 insertions(+), 10 deletions(-)

-- 
2.27.0

