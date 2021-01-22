Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA63300021
	for <lists+linux-mips@lfdr.de>; Fri, 22 Jan 2021 11:26:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727898AbhAVKNz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Jan 2021 05:13:55 -0500
Received: from foss.arm.com ([217.140.110.172]:39546 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727851AbhAVKMq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 Jan 2021 05:12:46 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDA58139F;
        Fri, 22 Jan 2021 02:12:00 -0800 (PST)
Received: from C02TD0UTHF1T.local (unknown [10.57.41.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 179393F719;
        Fri, 22 Jan 2021 02:11:59 -0800 (PST)
Date:   Fri, 22 Jan 2021 10:11:57 +0000
From:   Mark Rutland <mark.rutland@arm.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: mm: abort uaccess retries upon fatal signal
Message-ID: <20210122101157.GB29124@C02TD0UTHF1T.local>
References: <20210121160416.111298-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121160416.111298-1-tsbogend@alpha.franken.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jan 21, 2021 at 05:04:16PM +0100, Thomas Bogendoerfer wrote:
> When there's a fatal signal pending, MIPS's do_page_fault()
> implementation returns. The intent is that we'll return to the
> faulting userspace instruction, delivering the signal on the way.
> 
> However, if we take a fatal signal during fixing up a uaccess, this
> results in a return to the faulting kernel instruction, which will be
> instantly retried, resulting in the same fault being taken forever. As
> the task never reaches userspace, the signal is not delivered, and the
> task is left unkillable. While the task is stuck in this state, it can
> inhibit the forward progress of the system.
> 
> To avoid this, we must ensure that when a fatal signal is pending, we
> apply any necessary fixup for a faulting kernel instruction. Thus we
> will return to an error path, and it is up to that code to make forward
> progress towards delivering the fatal signal.
> 
> [ Description taken from commit 746a272e4414 ("ARM: 8692/1: mm: abort
>    uaccess retries upon fatal signal") ]
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

FWIW, this looks right to me, from a scan of the no_context path. I
don't have any MIPS system to test on, but FWIW:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Thanks for spinning this!

Mark.

> ---
>  arch/mips/mm/fault.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/mm/fault.c b/arch/mips/mm/fault.c
> index 7c871b14e74a..e7abda9c013f 100644
> --- a/arch/mips/mm/fault.c
> +++ b/arch/mips/mm/fault.c
> @@ -156,8 +156,11 @@ static void __kprobes __do_page_fault(struct pt_regs *regs, unsigned long write,
>  	 */
>  	fault = handle_mm_fault(vma, address, flags, regs);
>  
> -	if (fault_signal_pending(fault, regs))
> +	if (fault_signal_pending(fault, regs)) {
> +		if (!user_mode(regs))
> +			goto no_context;
>  		return;
> +	}
>  
>  	if (unlikely(fault & VM_FAULT_ERROR)) {
>  		if (fault & VM_FAULT_OOM)
> -- 
> 2.29.2
> 
