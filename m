Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4BC2279FDB
	for <lists+linux-mips@lfdr.de>; Sun, 27 Sep 2020 11:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgI0JLC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Sep 2020 05:11:02 -0400
Received: from elvis.franken.de ([193.175.24.41]:59876 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726149AbgI0JLC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 27 Sep 2020 05:11:02 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kMShv-0001nG-02; Sun, 27 Sep 2020 11:10:59 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 82AB8C1023; Sun, 27 Sep 2020 11:08:30 +0200 (CEST)
Date:   Sun, 27 Sep 2020 11:08:30 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Pujin Shi <shipujin.t@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: irq: Add missing prototypes for init_IRQ()
Message-ID: <20200927090830.GC4929@alpha.franken.de>
References: <20200923032650.1546-1-shipujin.t@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923032650.1546-1-shipujin.t@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Sep 23, 2020 at 11:26:50AM +0800, Pujin Shi wrote:
> init_IRQ() have no prototype, add one in irq.h
> 
> Fix the following warnings (treated as error in W=1):
> arch/mips/kernel/irq.c:52:13: error: no previous prototype for 'init_IRQ' [-Werror=missing-prototypes]
> 
> Signed-off-by: Pujin Shi <shipujin.t@gmail.com>
> ---
>  arch/mips/include/asm/irq.h | 1 +
>  arch/mips/kernel/irq.c      | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/mips/include/asm/irq.h b/arch/mips/include/asm/irq.h
> index c5d351786416..992f8040d3d9 100644
> --- a/arch/mips/include/asm/irq.h
> +++ b/arch/mips/include/asm/irq.h
> @@ -21,6 +21,7 @@
>  #define IRQ_STACK_START			(IRQ_STACK_SIZE - 16)
>  
>  extern void *irq_stack[NR_CPUS];
> +void init_IRQ(void);

putting it here hasn't any value. If you want to fix this properly,
move the extern void init_IRQ(void) in init/main.c to a common header
file and check that every arch to uses it.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
