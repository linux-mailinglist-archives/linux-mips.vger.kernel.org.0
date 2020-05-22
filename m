Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52AA31DE102
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2020 09:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728959AbgEVHbY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 May 2020 03:31:24 -0400
Received: from elvis.franken.de ([193.175.24.41]:34185 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728801AbgEVHbL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 May 2020 03:31:11 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jc28x-0003HE-07; Fri, 22 May 2020 09:30:59 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 29B17C015D; Fri, 22 May 2020 09:29:57 +0200 (CEST)
Date:   Fri, 22 May 2020 09:29:57 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Alexander Lobakin <alobakin@dlink.ru>,
        Huacai Chen <chenhc@lemote.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 12/13] mips: csrc-r4k: Mark R4K timer as unstable if
 CPU freq changes
Message-ID: <20200522072957.GH7331@alpha.franken.de>
References: <20200521140725.29571-1-Sergey.Semin@baikalelectronics.ru>
 <20200521140725.29571-13-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521140725.29571-13-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 21, 2020 at 05:07:23PM +0300, Serge Semin wrote:
> Commit 07d69579e7fe ("MIPS: Don't register r4k sched clock when CPUFREQ
> enabled") disabled the r4k-clock usage for scheduler ticks counting due
> to the scheduler being non-tolerant for unstable clocks sources. For the
> same reason the clock should be used in the system clocksource framework
> with care. As soon as CPU frequency changes the clocksource framework
> should be notified about this by marking the R4K timer being unstable
> (which it really is, since the ticks rate has been changed synchronously
> with the CPU frequency).
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  arch/mips/Kconfig           |  1 +
>  arch/mips/kernel/csrc-r4k.c | 40 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 41 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
