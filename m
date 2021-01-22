Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE9A8300281
	for <lists+linux-mips@lfdr.de>; Fri, 22 Jan 2021 13:08:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727807AbhAVME2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Jan 2021 07:04:28 -0500
Received: from elvis.franken.de ([193.175.24.41]:42480 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727823AbhAVKyi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 Jan 2021 05:54:38 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l2u4h-0006yq-02; Fri, 22 Jan 2021 11:53:55 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 5D1DCC0BF1; Fri, 22 Jan 2021 11:49:48 +0100 (CET)
Date:   Fri, 22 Jan 2021 11:49:48 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] MIPS: mm: abort uaccess retries upon fatal signal
Message-ID: <20210122104948.GB8146@alpha.franken.de>
References: <20210121160416.111298-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121160416.111298-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
> ---
>  arch/mips/mm/fault.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
