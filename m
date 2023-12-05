Return-Path: <linux-mips+bounces-550-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C24EA805CBF
	for <lists+linux-mips@lfdr.de>; Tue,  5 Dec 2023 19:02:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EBFCB2111B
	for <lists+linux-mips@lfdr.de>; Tue,  5 Dec 2023 18:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC236A329;
	Tue,  5 Dec 2023 18:01:52 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id BFDA21BD
	for <linux-mips@vger.kernel.org>; Tue,  5 Dec 2023 10:01:44 -0800 (PST)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rAZjs-0003nQ-00; Tue, 05 Dec 2023 19:01:44 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A282FC0A5A; Tue,  5 Dec 2023 18:53:48 +0100 (CET)
Date: Tue, 5 Dec 2023 18:53:48 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Stefan Wiehler <stefan.wiehler@nokia.com>
Cc: linux-mips@vger.kernel.org
Subject: Re: [PATCH v2] mips/smp: Call rcutree_report_cpu_starting() earlier
Message-ID: <ZW9jrPnM4/OXZzz/@alpha.franken.de>
References: <20231106121206.62650-1-stefan.wiehler@nokia.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106121206.62650-1-stefan.wiehler@nokia.com>

On Mon, Nov 06, 2023 at 01:12:07PM +0100, Stefan Wiehler wrote:
> rcutree_report_cpu_starting() must be called before
> clockevents_register_device() to avoid the following lockdep splat triggered by
> calling list_add() when CONFIG_PROVE_RCU_LIST=y:
> 
>   WARNING: suspicious RCU usage
>   ...
>   -----------------------------
>   kernel/locking/lockdep.c:3680 RCU-list traversed in non-reader section!!
> 
>   other info that might help us debug this:
> 
>   RCU used illegally from offline CPU!
>   rcu_scheduler_active = 1, debug_locks = 1
>   no locks held by swapper/1/0.
>   ...
>   Call Trace:
>   [<ffffffff8012a434>] show_stack+0x64/0x158
>   [<ffffffff80a93d98>] dump_stack_lvl+0x90/0xc4
>   [<ffffffff801c9e9c>] __lock_acquire+0x1404/0x2940
>   [<ffffffff801cbf3c>] lock_acquire+0x14c/0x448
>   [<ffffffff80aa4260>] _raw_spin_lock_irqsave+0x50/0x88
>   [<ffffffff8021e0c8>] clockevents_register_device+0x60/0x1e8
>   [<ffffffff80130ff0>] r4k_clockevent_init+0x220/0x3a0
>   [<ffffffff801339d0>] start_secondary+0x50/0x3b8
> 
> raw_smp_processor_id() is required in order to avoid calling into lockdep
> before RCU has declared the CPU to be watched for readers.
> 
> See also commit 29368e093921 ("x86/smpboot:  Move rcu_cpu_starting() earlier"),
> commit de5d9dae150c ("s390/smp: move rcu_cpu_starting() earlier") and commit
> 99f070b62322 ("powerpc/smp: Call rcu_cpu_starting() earlier").
> 
> Signed-off-by: Stefan Wiehler <stefan.wiehler@nokia.com>
> ---
> - Rename rcu_cpu_starting() to rcutree_report_cpu_starting() due to commit
> 448e9f34d91d ("rcu: Standardize explicit CPU-hotplug calls")
> ---
>  arch/mips/kernel/smp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

