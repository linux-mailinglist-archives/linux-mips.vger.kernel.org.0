Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43ADB2D9AF1
	for <lists+linux-mips@lfdr.de>; Mon, 14 Dec 2020 16:30:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407036AbgLNP2I (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Dec 2020 10:28:08 -0500
Received: from elvis.franken.de ([193.175.24.41]:40263 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731884AbgLNP2G (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 14 Dec 2020 10:28:06 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kopkv-0006Cf-01; Mon, 14 Dec 2020 16:27:21 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A5C8EC037B; Mon, 14 Dec 2020 16:20:40 +0100 (CET)
Date:   Mon, 14 Dec 2020 16:20:40 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Alexander A Sverdlin <alexander.sverdlin@nokia.com>
Cc:     linux-mips@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Octeon: irq: Alloc desc before configuring IRQ
Message-ID: <20201214152040.GB9149@alpha.franken.de>
References: <20201127111355.28601-1-alexander.sverdlin@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201127111355.28601-1-alexander.sverdlin@nokia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 27, 2020 at 12:13:55PM +0100, Alexander A Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> Allocate the IRQ descriptors where necessary before configuring them via
> irq_set_chip_and_handler(). Fixes the following soft lockup:
> 
> watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [modprobe:72]
> Modules linked in:
> irq event stamp: 33288
> hardirqs last  enabled at (33287): [<ffffffff8012e680>] restore_partial+0x74/0x150
> hardirqs last disabled at (33288): [<ffffffff8012e9e8>] handle_int+0x128/0x178
> softirqs last  enabled at (33284): [<ffffffff80859c4c>] __do_softirq+0x5c4/0x6d0
> softirqs last disabled at (33279): [<ffffffff80164018>] irq_exit+0xe8/0xf0
> CPU: 5 PID: 72 Comm: modprobe Not tainted 4.19.80-... #1
> $ 0   : 0000000000000000 0000000000000001 0000000000000003 8000000002bdc640
> $ 4   : 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> $ 8   : 0000000000000001 0000000000000001 0000000000000000 ffffffff803076cc
> $12   : 0000000000000000 0000000000000000 ffffffff817f0000 0000000008000000
> $16   : ffffffff80a96d10 ffffffff80a90000 8000000002c41780 8000000002c41788
> $20   : 0000000000000001 ffffffff8013b248 800000008ef28080 ffffffff80bb8700
> $24   : 0000000003bf0000 ffffffff802d0610
> $28   : 800000008ef20000 800000008ef23bd0 0000000000000006 ffffffff8020d6f8
> Hi    : 0000000000000160
> Lo    : 0000000000000014
> epc   : ffffffff8020d72c smp_call_function_many+0x2f4/0x370
> ra    : ffffffff8020d6f8 smp_call_function_many+0x2c0/0x370
> Status: 10008ce3 KX SX UX KERNEL EXL IE
> Cause : 40808000 (ExcCode 00)
> PrId  : 000d900a (Cavium Octeon II)
> CPU: 5 PID: 72 Comm: modprobe Not tainted 4.19.80-... #1
> Stack : ffffffff80ab0000 00000051801c0da0 0000000010000ce0 5e70a8a65518aeac
>         5e70a8a65518aeac 0000000000000000 800000008e0cfb48 ffffffff81820000
>         800000008e0cfad4 00000000f0ce6f64 0000000000000001 0000000000000000
>         ffffffff801ccfb8 0000000000000000 0000000000000000 ffffffff817f0000
>         800000008531d840 ffffffff80a90000 fffe000000000000 0000000000000000
>         ffffffff80b20000 ffffffffffffffff ffffffff80bb3980 ffffffff80bb3980
>         ffffffff80a90000 00000000fffffffe ffffffff8057a760 0000000000000028
>         ffffffff80c50028 800000008ef20000 800000008e0cfb40 ffffffff80b20000
>         ffffffff80835d6c 0000000000000000 800000008e0cfc78 5e70a8a65518aeac
>         ffffffff80a9dbf7 ffffffff80835c2c ffffffff801357a4 ffffffff809bdd50
>         ...
> Call Trace:
> [<ffffffff801357a4>] show_stack+0x9c/0x130
> [<ffffffff80835d6c>] dump_stack+0xdc/0x140
> [<ffffffff8023d490>] watchdog_timer_fn+0x3e8/0x478
> [<ffffffff801f43e4>] __hrtimer_run_queues+0x18c/0x6d8
> [<ffffffff801f507c>] hrtimer_interrupt+0x104/0x2e8
> [<ffffffff801391a8>] c0_compare_interrupt+0x60/0x90
> [<ffffffff801d0fcc>] __handle_irq_event_percpu+0xb4/0x4a0
> [<ffffffff801d13ec>] handle_irq_event_percpu+0x34/0x90
> [<ffffffff801d6b24>] handle_percpu_irq+0x9c/0xe0
> [<ffffffff801d01f4>] generic_handle_irq+0x34/0x50
> [<ffffffff80859678>] do_IRQ+0x18/0x28
> [<ffffffff80107548>] plat_irq_dispatch+0x90/0x128
> [<ffffffff8012ea2c>] handle_int+0x16c/0x178
> [<ffffffff8020d72c>] smp_call_function_many+0x2f4/0x370
> [<ffffffff8020d7e8>] smp_call_function+0x40/0xa0
> [<ffffffff8013bc1c>] flush_tlb_mm+0x44/0x140
> [<ffffffff802d50b0>] tlb_flush_mmu+0x38/0x90
> [<ffffffff802d5154>] arch_tlb_finish_mmu+0x4c/0x88
> [<ffffffff802d52bc>] tlb_finish_mmu+0x24/0x50
> [<ffffffff802e0c54>] exit_mmap+0x11c/0x1b8
> [<ffffffff80157bb4>] mmput+0x84/0x138
> [<ffffffff80160ad4>] do_exit+0x314/0xc88
> [<ffffffff801628e0>] do_group_exit+0x48/0xb0
> [<ffffffff80162958>] __wake_up_parent+0x0/0x18
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
>  arch/mips/cavium-octeon/octeon-irq.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
