Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF5321859F
	for <lists+linux-mips@lfdr.de>; Wed,  8 Jul 2020 13:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728722AbgGHLJx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Jul 2020 07:09:53 -0400
Received: from elvis.franken.de ([193.175.24.41]:54232 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728701AbgGHLJw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 8 Jul 2020 07:09:52 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jt7xS-0008Fx-00; Wed, 08 Jul 2020 13:09:46 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C25CDC07D4; Wed,  8 Jul 2020 11:37:35 +0200 (CEST)
Date:   Wed, 8 Jul 2020 11:37:35 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] MIPS: Loongson64: Adjust IRQ layout
Message-ID: <20200708093735.GD9458@alpha.franken.de>
References: <1594030916-7520-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594030916-7520-1-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jul 06, 2020 at 06:21:56PM +0800, Huacai Chen wrote:
> Adjust IRQ layout in order to use IRQ resources more efficiently, which
> is done by adjusting NR_IRQS and MIPS_CPU_IRQ_BASE.
> 
> Before this patch:
> 0~15:    ISA/LPC IRQs;
> 16~55:   Dynamic IRQs;
> 56~63:   MIPS CPU IRQs;
> 64~127:  PCH IRQs;
> 128~255: Dynamic IRQs.
> 
> After this patch:
> 0~15:    ISA/LPC IRQs;
> 16~23:   MIPS CPU IRQs;
> 24~87:   PCH IRQs;
> 88~280:  Dynamic IRQs.
> 
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  arch/mips/include/asm/mach-loongson64/irq.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
