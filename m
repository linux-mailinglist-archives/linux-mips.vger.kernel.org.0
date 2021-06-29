Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70DC73B6F7C
	for <lists+linux-mips@lfdr.de>; Tue, 29 Jun 2021 10:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232516AbhF2IgE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 29 Jun 2021 04:36:04 -0400
Received: from elvis.franken.de ([193.175.24.41]:57434 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232479AbhF2IgD (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 29 Jun 2021 04:36:03 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1ly9BU-0004qC-01; Tue, 29 Jun 2021 10:33:32 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 84EDAC073D; Tue, 29 Jun 2021 10:32:23 +0200 (CEST)
Date:   Tue, 29 Jun 2021 10:32:23 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     zhanglianjie <zhanglianjie@uniontech.com>
Cc:     jiaxun.yang@flygoat.com, chenhuacai@kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm: Fix the problem of mips architecture Oops
Message-ID: <20210629083223.GB4650@alpha.franken.de>
References: <20210628091105.27641-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210628091105.27641-1-zhanglianjie@uniontech.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jun 28, 2021 at 05:11:05PM +0800, zhanglianjie wrote:
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
>  arch/mips/loongson64/numa.c | 3 +++
>  1 file changed, 3 insertions(+)

applied to mips-next (with subject changed to reflect what patch does).

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
