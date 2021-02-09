Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7FD3314F31
	for <lists+linux-mips@lfdr.de>; Tue,  9 Feb 2021 13:41:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbhBIMka (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Feb 2021 07:40:30 -0500
Received: from elvis.franken.de ([193.175.24.41]:36506 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229601AbhBIMj5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Feb 2021 07:39:57 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l9SIV-0003IE-06; Tue, 09 Feb 2021 13:39:15 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 24C2EC0DBF; Tue,  9 Feb 2021 13:38:34 +0100 (CET)
Date:   Tue, 9 Feb 2021 13:38:34 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Paul Burton <paulburton@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "mips: Manually call fdt_init_reserved_mem()
 method"
Message-ID: <20210209123834.GF11264@alpha.franken.de>
References: <20210208134614.5585-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210208134614.5585-1-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Feb 08, 2021 at 04:46:14PM +0300, Serge Semin wrote:
> This reverts commit 3751cbda8f223549d7ea28803cbec8ac87e43ed2.
> 
> Originally the patch was created to fix the reserved-memory DT-node
> parsing failure on the early stages of the platform memory initialization.
> That happened due to the two early memory allocators utilization that
> time: bootmem and memblock. At first the platform-specific memory mapping
> array was initialized. Then the early_init_fdt_scan_reserved_mem() was
> called, which couldn't fully parse the "reserved-memory" DT-node since
> neither memblock nor bootmem allocators hadn't been initialized at that
> stage, so the fdt_init_reserved_mem() method failed on the memory
> allocation calls. Only after that the platform-specific memory mapping
> were used to create proper bootmem and memblock structures and let the
> early memory allocations work.  That's why we had to call the
> fdt_init_reserved_mem() method one more time to retry the initialization
> of the features like CMA.
> 
> The necessity to have that fix was disappeared after the full memblock
> support had been added to the MIPS kernel and all plat_mem_setup() had
> been fixed to add the memory regions right into the memblock memory pool.
> Let's revert that patch then especially after having Paul reported that
> the second fdt_init_reserved_mem() call causes the reserved memory pool
> being created twice bigger than implied.
> 
> Fixes: a94e4f24ec83 ("MIPS: init: Drop boot_mem_map")
> Reported-by: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  arch/mips/kernel/setup.c | 3 ---
>  1 file changed, 3 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
