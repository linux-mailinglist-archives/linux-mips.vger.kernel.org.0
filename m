Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 747603B44A5
	for <lists+linux-mips@lfdr.de>; Fri, 25 Jun 2021 15:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbhFYNlx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Jun 2021 09:41:53 -0400
Received: from elvis.franken.de ([193.175.24.41]:49749 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229573AbhFYNlw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 25 Jun 2021 09:41:52 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lwm3G-0005Tx-00; Fri, 25 Jun 2021 15:39:22 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 93769C071C; Fri, 25 Jun 2021 15:39:09 +0200 (CEST)
Date:   Fri, 25 Jun 2021 15:39:09 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     zhanglianjie <zhanglianjie@uniontech.com>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        tangyouling@loongson.cn
Subject: Re: [PATCH] mm: Fix the problem of mips architecture Oops
Message-ID: <20210625133909.GA2565@alpha.franken.de>
References: <20210624032212.24769-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624032212.24769-1-zhanglianjie@uniontech.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jun 24, 2021 at 11:22:12AM +0800, zhanglianjie wrote:
> The cause of the problem is as follows:
> 1. when cat /sys/devices/system/memory/memory0/valid_zones,
>    test_pages_in_a_zone() will be called.
> 2. test_pages_in_a_zone() finds the zone according to stat_pfn = 0.
>    The smallest pfn of the numa node in the mips architecture is 128,
>    and the page corresponding to the previous 0~127 pfn is not
>    initialized (page->flags is 0xFFFFFFFF)
> 3. The nid and zonenum obtained using page_zone(pfn_to_page(0)) are out
>    of bounds in the corresponding array,
>    &NODE_DATA(page_to_nid(page))->node_zones[page_zonenum(page)],
>    access to the out-of-bounds zone member variables appear abnormal,
>    resulting in Oops.
> Therefore, it is necessary to keep the page between 0 and the minimum
> pfn to prevent Oops from appearing.
> 
> Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
> ---
>  arch/mips/kernel/setup.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 23a140327a0b..f1da2b2ba5e9 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -653,6 +653,8 @@ static void __init arch_mem_init(char **cmdline_p)
>  	 */
>  	memblock_set_current_limit(PFN_PHYS(max_low_pfn));
> 
> +	memblock_reserve(0, PAGE_SIZE * NODE_DATA(0)->node_start_pfn);
> +

which platform needs this ? This look it should be better fixed in
the platform memory registration code.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
