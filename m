Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83920233484
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jul 2020 16:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728297AbgG3Odb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Jul 2020 10:33:31 -0400
Received: from elvis.franken.de ([193.175.24.41]:55279 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726535AbgG3Odb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Jul 2020 10:33:31 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k19cb-0005pd-00; Thu, 30 Jul 2020 16:33:25 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id CB504C0A9D; Thu, 30 Jul 2020 14:31:17 +0200 (CEST)
Date:   Thu, 30 Jul 2020 14:31:17 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Huacai Chen <chenhc@lemote.com>, Rob Herring <robh+dt@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-mips@vger.kernel.org, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Fuxin Zhang <zhangfx@lemote.com>
Subject: Re: [PATCH V2 0/5] MIPS: Loongson64: Fix and improve irqchip drivers
Message-ID: <20200730123117.GA4509@alpha.franken.de>
References: <1596099090-23516-1-git-send-email-chenhc@lemote.com>
 <159611041857.27532.12008177304488845888.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <159611041857.27532.12008177304488845888.b4-ty@kernel.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jul 30, 2020 at 01:06:03PM +0100, Marc Zyngier wrote:
> On Thu, 30 Jul 2020 16:51:25 +0800, Huacai Chen wrote:
> > Modernized Loongson64 platforms use a hierarchical interrupt controller
> > architecture. For LS7A PCH, the hierarchy (from inside to outside) is
> > CPUINTC --> LIOINTC --> HTVEC --> PCHPIC/PCHMSI. However, the current
> > status is that there are several bugs in the LIOINTC and PCHPIC drivers,
> > and the HTVEC driver should be improved to support 8 groups of vectors.
> > Loonson64C support only 4 groups of HT vectors, and Loongson64G support
> > as many as 8 groups, so the .dts file and dt-bindings description should
> > also be updated.
> > 
> > [...]
> 
> Applied to irq/irqchip-next, thanks!
> 
> [1/5] dt-bindings: interrupt-controller: Update Loongson HTVEC description
>       commit: 8fea4b2e804ab8ff93bd0d67a3dadee1d1a3e24f
> [3/5] irqchip/loongson-liointc: Fix misuse of gc->mask_cache
>       commit: c9c73a05413ea4a465cae1cb3593b01b190a233f
> [4/5] irqchip/loongson-htvec: Support 8 groups of HT vectors
>       commit: c47e388cfc648421bd821f5d9fda9e76eefe29cd
> [5/5] irqchip/loongson-pch-pic: Fix the misused irq flow handler
>       commit: ac62460c24126eb2442e3653a266ebbf05b004d8
> 
> Please note that I haven't taken patch #2, as it doesn't apply on top 
> of irqchip/next. Please route it via the MIPS tree.

I'll take it.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
