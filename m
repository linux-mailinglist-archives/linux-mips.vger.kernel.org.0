Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A592742D4A7
	for <lists+linux-mips@lfdr.de>; Thu, 14 Oct 2021 10:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbhJNITy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Oct 2021 04:19:54 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:55754 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbhJNITy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 Oct 2021 04:19:54 -0400
X-Greylist: delayed 507 seconds by postgrey-1.27 at vger.kernel.org; Thu, 14 Oct 2021 04:19:53 EDT
Date:   Thu, 14 Oct 2021 11:09:16 +0300
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.baikalelectronics.ru 1A485803014B
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiri Kosina <trivial@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/3] MIPS: kernel: proc: fix style and add CPU option
 reporting
Message-ID: <20211014080916.4l2soxzdwouyawvi@mobilestation>
References: <20211014054018.6179-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211014054018.6179-1-ilya.lipnitskiy@gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
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

Seems very useful. Thanks for the set:
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Sergey

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
> 
> -- 
> 2.33.0
> 
