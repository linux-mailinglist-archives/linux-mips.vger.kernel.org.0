Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 448A02CEDB6
	for <lists+linux-mips@lfdr.de>; Fri,  4 Dec 2020 13:11:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729402AbgLDMKx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Dec 2020 07:10:53 -0500
Received: from elvis.franken.de ([193.175.24.41]:48102 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729344AbgLDMKx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 4 Dec 2020 07:10:53 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kl9ue-0005Nb-00; Fri, 04 Dec 2020 13:10:12 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 5F672C02E5; Fri,  4 Dec 2020 13:09:32 +0100 (CET)
Date:   Fri, 4 Dec 2020 13:09:32 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Alexander A Sverdlin <alexander.sverdlin@nokia.com>
Cc:     linux-mips@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
        Leonid Rosenboim <lrosenboim@caviumnetworks.com>,
        Corey Minyard <cminyard@mvista.com>,
        linux-kernel@vger.kernel.org,
        Serge Semin <fancer.lancer@gmail.com>,
        "Maciej W . Rozycki" <macro@linux-mips.org>,
        Jinyang He <hejinyang@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 1/2] MIPS: Don't round up kernel sections size for
 memblock_add()
Message-ID: <20201204120932.GF10011@alpha.franken.de>
References: <20201203123649.44046-1-alexander.sverdlin@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203123649.44046-1-alexander.sverdlin@nokia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Dec 03, 2020 at 01:36:48PM +0100, Alexander A Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> Linux doesn't own the memory immediately after the kernel image. On Octeon
> bootloader places a shared structure right close after the kernel _end,
> refer to "struct cvmx_bootinfo *octeon_bootinfo" in cavium-octeon/setup.c.
> 
> If check_kernel_sections_mem() rounds the PFNs up, first memblock_alloc()
> inside early_init_dt_alloc_memory_arch() <= device_tree_init() returns
> memory block overlapping with the above octeon_bootinfo structure, which
> is being overwritten afterwards.
> 
> Fixes: a94e4f24ec83 ("MIPS: init: Drop boot_mem_map")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
>  arch/mips/kernel/setup.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
