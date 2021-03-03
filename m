Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83F4632BDA0
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 23:24:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346281AbhCCQRv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 11:17:51 -0500
Received: from elvis.franken.de ([193.175.24.41]:39192 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349800AbhCCLfS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Mar 2021 06:35:18 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lHO0q-0005hN-00; Wed, 03 Mar 2021 10:41:48 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 4E8B9C0477; Wed,  3 Mar 2021 10:41:34 +0100 (CET)
Date:   Wed, 3 Mar 2021 10:41:34 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-mips@vger.kernel.org, rppt@kernel.org,
        fancer.lancer@gmail.com, guro@fb.com, akpm@linux-foundation.org,
        paul@crapouillou.net,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: BMIPS: Reserve exception base to prevent corruption
Message-ID: <20210303094134.GA18354@alpha.franken.de>
References: <20210301092241.i7dxo7zbg3ar55d6@mobilestation>
 <20210302041940.3663823-1-f.fainelli@gmail.com>
 <20210302235411.GA3897@alpha.franken.de>
 <4e3640d4-7fc2-96dc-de00-599b3ac80757@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e3640d4-7fc2-96dc-de00-599b3ac80757@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 02, 2021 at 05:30:18PM -0800, Florian Fainelli wrote:
> 
> 
> On 3/2/2021 3:54 PM, Thomas Bogendoerfer wrote:
> > On Mon, Mar 01, 2021 at 08:19:38PM -0800, Florian Fainelli wrote:
> >> BMIPS is one of the few platforms that do change the exception base.
> >> After commit 2dcb39645441 ("memblock: do not start bottom-up allocations
> >> with kernel_end") we started seeing BMIPS boards fail to boot with the
> >> built-in FDT being corrupted.
> >>
> >> Before the cited commit, early allocations would be in the [kernel_end,
> >> RAM_END] range, but after commit they would be within [RAM_START +
> >> PAGE_SIZE, RAM_END].
> >>
> >> The custom exception base handler that is installed by
> >> bmips_ebase_setup() done for BMIPS5000 CPUs ends-up trampling on the
> >> memory region allocated by unflatten_and_copy_device_tree() thus
> >> corrupting the FDT used by the kernel.
> >>
> >> To fix this, we need to perform an early reservation of the custom
> >> exception that is going to be installed and this needs to happen at
> >> plat_mem_setup() time to ensure that unflatten_and_copy_device_tree()
> >> finds a space that is suitable, away from reserved memory.
> >>
> >> Huge thanks to Serget for analysing and proposing a solution to this
> >> issue.
> >>
> >> Fixes: Fixes: 2dcb39645441 ("memblock: do not start bottom-up allocations with kernel_end")
> >> Debugged-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> >> Reported-by: Kamal Dasu <kdasu.kdev@gmail.com>
> >> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> >> ---
> >> Thomas,
> >>
> >> This is intended as a stop-gap solution for 5.12-rc1 and to be picked up
> >> by the stable team for 5.11. We should find a safer way to avoid these
> >> problems for 5.13 maybe.
> > 
> > let's try to make it in one ago. Hwo about reserving vector space in
> > cpu_probe, if it's known there and leave the rest to trap_init() ?
> > 
> > Below patch got a quick test on IP22 (real hardware) and malta (qemu).
> > Not sure, if I got all BMIPS parts correct, so please check/test.
> 
> Works for me here:

perfect, I only forgot about R3k... I'll submit a formal patch submission
later today.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
