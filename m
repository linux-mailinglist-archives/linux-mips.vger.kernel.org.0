Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26FB71DD28B
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 17:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728456AbgEUP6K (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 May 2020 11:58:10 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:39322 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727968AbgEUP6J (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 May 2020 11:58:09 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 411AD803087B;
        Thu, 21 May 2020 15:58:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id qtAkUXH4Z9NM; Thu, 21 May 2020 18:58:05 +0300 (MSK)
Date:   Thu, 21 May 2020 18:58:04 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Mark Brown <broonie@kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Georgy Vlasov <Georgy.Vlasov@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Clement Leger <cleger@kalray.eu>,
        linux-spi <linux-spi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 03/16] spi: dw: Discard static DW DMA slave structures
Message-ID: <20200521155804.qgaaqc23h2nll7r3@mobilestation>
References: <20200521012206.14472-1-Sergey.Semin@baikalelectronics.ru>
 <20200521012206.14472-4-Sergey.Semin@baikalelectronics.ru>
 <CAHp75VcOX-hZSxHqro_W2X=KzSShg1V=jAsxdz8L5TZpW0kBYA@mail.gmail.com>
 <20200521121228.aqplh6eftylnys3p@mobilestation>
 <20200521155143.GE4770@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200521155143.GE4770@sirena.org.uk>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 21, 2020 at 04:51:43PM +0100, Mark Brown wrote:
> On Thu, May 21, 2020 at 03:12:28PM +0300, Serge Semin wrote:
> 
> > Well, for me both solutions are equal except mine consumes less stack memory.
> > The only reason why your solution might be better is that if DW DMA driver or
> > the DMA engine subsystem changed the dw_dma_slave structure instance passed to
> > the dma_request_channel() method, which non of them do. So I'll leave this for
> > Mark to decide. Mark, could you give us your final word about this?
> 
> Honestly I'm struggling to care either way.  I guess saving a bit of
> stack is potentially useful.

Settled then. Let's leave the patch as is. I suppose we've finally finished a
review except a question Feng asked to the patch:
[PATCH v3 01/16] spi: dw: Add Tx/Rx finish wait methods to the MID DMA

If you are ok with my responses, then the patchset is ready for you further
actions.

-Sergey
