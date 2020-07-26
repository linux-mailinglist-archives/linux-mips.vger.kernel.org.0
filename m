Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B184D22DED3
	for <lists+linux-mips@lfdr.de>; Sun, 26 Jul 2020 13:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgGZL5q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Jul 2020 07:57:46 -0400
Received: from elvis.franken.de ([193.175.24.41]:49287 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725848AbgGZL5q (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 26 Jul 2020 07:57:46 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jzfHf-0005a4-00; Sun, 26 Jul 2020 13:57:39 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 17E9BC0A2D; Sun, 26 Jul 2020 13:57:17 +0200 (CEST)
Date:   Sun, 26 Jul 2020 13:57:17 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jinyang He <hejinyang@loongson.cn>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: Fix unable to reserve memory for Crash kernel
Message-ID: <20200726115717.GA7191@alpha.franken.de>
References: <1595656598-10859-1-git-send-email-hejinyang@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1595656598-10859-1-git-send-email-hejinyang@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jul 25, 2020 at 01:56:38PM +0800, Jinyang He wrote:
> Use 0 as the align parameter in memblock_find_in_range() is
> incorrect when we reserve memory for Crash kernel.
> 
> The environment as follows:
> [    0.000000] MIPS: machine is loongson,loongson64c-4core-rs780e
> ...
> [    1.951016]     crashkernel=64M@128M
> 
> The warning as follows:
> [    0.000000] Invalid memory region reserved for crash kernel
> 
> And the iomem as follows:
> 00200000-0effffff : System RAM
>   04000000-0484009f : Kernel code
>   048400a0-04ad7fff : Kernel data
>   04b40000-05c4c6bf : Kernel bss
> 1a000000-1bffffff : pci@1a000000
> ...
> 
> The align parameter may be finally used by round_down() or round_up().
> Like the following call tree:
> 
> mips-next: mm/memblock.c
> 
> memblock_find_in_range
> └── memblock_find_in_range_node
>     ├── __memblock_find_range_bottom_up
>     │   └── round_up
>     └── __memblock_find_range_top_down
>         └── round_down
> \#define round_up(x, y) ((((x)-1) | __round_mask(x, y))+1)
> \#define round_down(x, y) ((x) & ~__round_mask(x, y))
> \#define __round_mask(x, y) ((__typeof__(x))((y)-1))
> 
> The round_down(or round_up)'s second parameter must be a power of 2.
> If the second parameter is 0, it both will return 0.
> 
> Use 1 as the parameter to fix the bug and the iomem as follows:
> 00200000-0effffff : System RAM
>   04000000-0484009f : Kernel code
>   048400a0-04ad7fff : Kernel data
>   04b40000-05c4c6bf : Kernel bss
>   08000000-0bffffff : Crash kernel
> 1a000000-1bffffff : pci@1a000000
> ...
> 
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> ---
>  arch/mips/kernel/setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
