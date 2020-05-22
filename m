Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2711DE0FB
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2020 09:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbgEVHbH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 May 2020 03:31:07 -0400
Received: from elvis.franken.de ([193.175.24.41]:34151 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728369AbgEVHbF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 May 2020 03:31:05 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jc28x-0003HE-06; Fri, 22 May 2020 09:30:59 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9B7DAC015D; Fri, 22 May 2020 09:29:40 +0200 (CEST)
Date:   Fri, 22 May 2020 09:29:40 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 11/13] mips: Add udelay lpj numbers adjustment
Message-ID: <20200522072940.GG7331@alpha.franken.de>
References: <20200521140725.29571-1-Sergey.Semin@baikalelectronics.ru>
 <20200521140725.29571-12-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521140725.29571-12-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 21, 2020 at 05:07:22PM +0300, Serge Semin wrote:
> Loops-per-jiffies is a special number which represents a number of
> noop-loop cycles per CPU-scheduler quantum - jiffies. As you
> understand aside from CPU-specific implementation it depends on
> the CPU frequency. So when a platform has the CPU frequency fixed,
> we have no problem and the current udelay interface will work
> just fine. But as soon as CPU-freq driver is enabled and the cores
> frequency changes, we'll end up with distorted udelay's. In order
> to fix this we have to accordinly adjust the per-CPU udelay_val
> (the same as the global loops_per_jiffy) number. This can be done
> in the CPU-freq transition event handler. We subscribe to that event
> in the MIPS arch time-inititalization method.
> 
> Co-developed-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  arch/mips/kernel/time.c | 70 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
