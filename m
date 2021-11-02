Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D4A2442B92
	for <lists+linux-mips@lfdr.de>; Tue,  2 Nov 2021 11:23:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbhKBK0T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Nov 2021 06:26:19 -0400
Received: from elvis.franken.de ([193.175.24.41]:55796 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229778AbhKBK0R (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 2 Nov 2021 06:26:17 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mhqx9-0003gx-01; Tue, 02 Nov 2021 11:23:39 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 94380C291E; Tue,  2 Nov 2021 11:20:51 +0100 (CET)
Date:   Tue, 2 Nov 2021 11:20:51 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Zhaolong Zhang <zhangzl2013@126.com>
Cc:     Alexander Lobakin <alobakin@pm.me>,
        Yanteng Si <siyanteng@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: fix HUGETLB function without THP enabled
Message-ID: <20211102102051.GA7512@alpha.franken.de>
References: <20211102082437.3319235-1-zhangzl2013@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102082437.3319235-1-zhangzl2013@126.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Nov 02, 2021 at 04:24:37PM +0800, Zhaolong Zhang wrote:
> ltp test futex_wake04 without THP enabled leads to below bt:
>   [<ffffffff80a03728>] BUG+0x0/0x8
>   [<ffffffff80a0624c>] internal_get_user_pages_fast+0x81c/0x820
>   [<ffffffff8093ac18>] get_futex_key+0xa0/0x480
>   [<ffffffff8093b074>] futex_wait_setup+0x7c/0x1a8
>   [<ffffffff8093b2c0>] futex_wait+0x120/0x228
>   [<ffffffff8093dbe8>] do_futex+0x140/0xbd8
>   [<ffffffff8093e78c>] sys_futex+0x10c/0x1c0
>   [<ffffffff808703d0>] syscall_common+0x34/0x58
> 
> Move pmd_write() and pmd_page() from TRANSPARENT_HUGEPAGE scope to
> MIPS_HUGE_TLB_SUPPORT scope, because both THP and HUGETLB will need
> them.
> 
> Signed-off-by: Zhaolong Zhang <zhangzl2013@126.com>
> ---
>  arch/mips/include/asm/pgtable.h | 40 +++++++++++++++++----------------
>  1 file changed, 21 insertions(+), 19 deletions(-)

applied to mips-next.

> 
> diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
> index 804889b70965..1fcf4be5cd20 100644
> --- a/arch/mips/include/asm/pgtable.h
> +++ b/arch/mips/include/asm/pgtable.h
> @@ -86,10 +86,12 @@ extern void paging_init(void);
>   */
>  #define pmd_phys(pmd)		virt_to_phys((void *)pmd_val(pmd))
>  
> +#ifndef CONFIG_MIPS_HUGE_TLB_SUPPORT
>  #define __pmd_page(pmd)		(pfn_to_page(pmd_phys(pmd) >> PAGE_SHIFT))
>  #ifndef CONFIG_TRANSPARENT_HUGEPAGE
>  #define pmd_page(pmd)		__pmd_page(pmd)
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE  */
> +#endif /* CONFIG_MIPS_HUGE_TLB_SUPPORT */

While applying I've simplified that hunk to

-#define __pmd_page(pmd)                (pfn_to_page(pmd_phys(pmd) >> PAGE_SHIFT))
-#ifndef CONFIG_TRANSPARENT_HUGEPAGE
-#define pmd_page(pmd)          __pmd_page(pmd)
-#endif /* CONFIG_TRANSPARENT_HUGEPAGE  */
+#ifndef CONFIG_MIPS_HUGE_TLB_SUPPORT
+#define pmd_page(pmd)          (pfn_to_page(pmd_phys(pmd) >> PAGE_SHIFT))
+#endif /* CONFIG_MIPS_HUGE_TLB_SUPPORT */

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
