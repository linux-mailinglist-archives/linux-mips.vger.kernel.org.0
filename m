Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A45E194360
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2020 16:39:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgCZPjW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 26 Mar 2020 11:39:22 -0400
Received: from elvis.franken.de ([193.175.24.41]:36575 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726296AbgCZPjW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 26 Mar 2020 11:39:22 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jHUbE-0001g0-00; Thu, 26 Mar 2020 16:39:16 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D17DCC0D4A; Thu, 26 Mar 2020 16:38:49 +0100 (CET)
Date:   Thu, 26 Mar 2020 16:38:49 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, maz@kernel.org, chenhc@lemote.com
Subject: Re: [RFC PATCH 0/6] MIPS: Handle CPU IRQ in domain's way
Message-ID: <20200326153849.GA14951@alpha.franken.de>
References: <20200326061704.387483-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326061704.387483-1-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 26, 2020 at 02:16:56PM +0800, Jiaxun Yang wrote:
> In [1], we discussed about why MIPS CPU IRQ doesn't fit simple IRQ domain.
> I felt it's time to remove this barrier and "modernize" the whole flow.
> 
> This set is simply a proof of concept of removing the whole MIPS_CPU_IRQ_BASE
> and use the irq_domain's way.
> 
> Currently only Loongson64 and ip22 are adapted for testing purpose,
> if everybody is happy with it, then I'll take a look at more platforms.
> 
> Btw: Thomas, are you still willing to drop some platforms in 5.8?

yes, I didn't receive feedback to not drop them. So after merge
window is over I'm going to post a patch to remove LASAT, NEC_MARKEINS
and PMC_MSP.

>  arch/mips/include/asm/irq_cpu.h      | 19 +++++++++++++++++-
>  arch/mips/include/asm/sgi/ip22.h     | 30 ++++++++++++++--------------
>  arch/mips/kernel/cevt-r4k.c          |  2 +-
>  arch/mips/kernel/perf_event_mipsxx.c |  3 ++-
>  arch/mips/kernel/rtlx-mt.c           |  7 +++++--
>  arch/mips/loongson64/smp.c           |  6 ++++--
>  arch/mips/sgi-ip22/ip22-int.c        | 14 ++++++++-----
>  drivers/irqchip/irq-mips-cpu.c       | 22 ++++++++++++++------
>  8 files changed, 70 insertions(+), 33 deletions(-)

Adding more code for doing the same thing doesn't sound like the
best approach. Is there a big need for that change (like someone
getting rid of irq_domain_add_legacy) ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
