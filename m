Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46C5A26FF43
	for <lists+linux-mips@lfdr.de>; Fri, 18 Sep 2020 15:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgIRN5m (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 18 Sep 2020 09:57:42 -0400
Received: from elvis.franken.de ([193.175.24.41]:44598 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726129AbgIRN5e (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 18 Sep 2020 09:57:34 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kJGtG-0002UB-03; Fri, 18 Sep 2020 15:57:30 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 66375C0FDF; Fri, 18 Sep 2020 15:51:39 +0200 (CEST)
Date:   Fri, 18 Sep 2020 15:51:39 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH V2 1/2] MIPS: Loongson64: Increase NR_IRQS to 320
Message-ID: <20200918135139.GD19202@alpha.franken.de>
References: <1599819978-13999-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1599819978-13999-1-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Sep 11, 2020 at 06:26:17PM +0800, Huacai Chen wrote:
> Modernized Loongson64 uses a hierarchical organization for interrupt
> controllers (INTCs), all INTC nodes (not only leaf nodes) need some IRQ
> numbers. This means 280 (i.e., NR_IRQS_LEGACY + NR_MIPS_CPU_IRQS + 256)
> is not enough to represent all interrupts, so let's increase NR_IRQS to
> 320 (NR_IRQS_LEGACY + NR_MIPS_CPU_IRQS + NR_MAX_CHAINED_IRQS + 256).
> 
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  arch/mips/include/asm/mach-loongson64/irq.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
