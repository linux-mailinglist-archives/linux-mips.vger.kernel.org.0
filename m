Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 993F74389E8
	for <lists+linux-mips@lfdr.de>; Sun, 24 Oct 2021 17:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231771AbhJXPjv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 Oct 2021 11:39:51 -0400
Received: from elvis.franken.de ([193.175.24.41]:37635 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231730AbhJXPju (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 24 Oct 2021 11:39:50 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mefYq-0006bc-02; Sun, 24 Oct 2021 17:37:24 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 935C3C265F; Sun, 24 Oct 2021 17:33:00 +0200 (CEST)
Date:   Sun, 24 Oct 2021 17:33:00 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc:     Jiri Kosina <trivial@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Hauke Mehrtens <hauke@hauke-m.de>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] MIPS: kernel: proc: fix style and add CPU option
 reporting
Message-ID: <20211024153300.GJ4721@alpha.franken.de>
References: <20211014054018.6179-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211014054018.6179-1-ilya.lipnitskiy@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 13, 2021 at 10:40:15PM -0700, Ilya Lipnitskiy wrote:
> Fix checkpatch errors and use seq_puts instead of seq_printf where
> possible.
> 
> Re-send an old patch that adds CPU option reporting.
> 
> Tested against MT7621 on OpenWrt running v5.10 kernel.
> 
> MT7621 output:
>   Options implemented   : tlb 4kex 4k_cache prefetch mcheck ejtag llsc
>   pindexed_dcache userlocal vint perf_cntr_intr_bit cdmm perf
> 
> ---
> v2: Add missing options that were added since the original patch
> v3: Resend after 6 months and add Hauke's Acked-by
> 
> Hauke Mehrtens (1):
>   MIPS: kernel: proc: add CPU option reporting
> 
> Ilya Lipnitskiy (2):
>   MIPS: kernel: proc: fix trivial style errors
>   MIPS: kernel: proc: use seq_puts instead of seq_printf
> 
>  arch/mips/kernel/proc.c | 227 ++++++++++++++++++++++++++++++++--------
>  1 file changed, 184 insertions(+), 43 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
