Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C65C2339E1
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jul 2020 22:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbgG3UlC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Jul 2020 16:41:02 -0400
Received: from elvis.franken.de ([193.175.24.41]:55583 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726880AbgG3UlC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Jul 2020 16:41:02 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k1FMJ-0008UI-00; Thu, 30 Jul 2020 22:40:59 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B747DC0AA0; Thu, 30 Jul 2020 22:19:05 +0200 (CEST)
Date:   Thu, 30 Jul 2020 22:19:05 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH V2 2/5] MIPS: DTS: Fix number of msi vectors for
 Loongson64G
Message-ID: <20200730201905.GA4944@alpha.franken.de>
References: <1596099090-23516-1-git-send-email-chenhc@lemote.com>
 <1596099090-23516-3-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596099090-23516-3-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jul 30, 2020 at 04:51:27PM +0800, Huacai Chen wrote:
> HT irqs vectors are 8 groups, each group has 32 irqs, Loongson64C CPUs
> can use only 4 groups and Loongson64G CPUs can use all 8 groups. So the
> number of msi vectors of Loongson64G is 192 (32*8 - 64 = 192).
> 
> Fixes: 24af105962c8004edb9f5bf84 ("MIPS: Loongson64: DeviceTree for LS7A PCH")
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dts | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
