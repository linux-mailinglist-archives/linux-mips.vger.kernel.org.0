Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E57BF3133A2
	for <lists+linux-mips@lfdr.de>; Mon,  8 Feb 2021 14:49:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbhBHNru (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Feb 2021 08:47:50 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:56470 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbhBHNrC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Feb 2021 08:47:02 -0500
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] Revert "mips: Manually call fdt_init_reserved_mem() method"
Date:   Mon, 8 Feb 2021 16:46:14 +0300
Message-ID: <20210208134614.5585-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This reverts commit 3751cbda8f223549d7ea28803cbec8ac87e43ed2.

Originally the patch was created to fix the reserved-memory DT-node
parsing failure on the early stages of the platform memory initialization.
That happened due to the two early memory allocators utilization that
time: bootmem and memblock. At first the platform-specific memory mapping
array was initialized. Then the early_init_fdt_scan_reserved_mem() was
called, which couldn't fully parse the "reserved-memory" DT-node since
neither memblock nor bootmem allocators hadn't been initialized at that
stage, so the fdt_init_reserved_mem() method failed on the memory
allocation calls. Only after that the platform-specific memory mapping
were used to create proper bootmem and memblock structures and let the
early memory allocations work.  That's why we had to call the
fdt_init_reserved_mem() method one more time to retry the initialization
of the features like CMA.

The necessity to have that fix was disappeared after the full memblock
support had been added to the MIPS kernel and all plat_mem_setup() had
been fixed to add the memory regions right into the memblock memory pool.
Let's revert that patch then especially after having Paul reported that
the second fdt_init_reserved_mem() call causes the reserved memory pool
being created twice bigger than implied.

Fixes: a94e4f24ec83 ("MIPS: init: Drop boot_mem_map")
Reported-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 arch/mips/kernel/setup.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 101812960ca0..a60ecd6db0c3 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -27,7 +27,6 @@
 #include <linux/dma-map-ops.h>
 #include <linux/decompress/generic.h>
 #include <linux/of_fdt.h>
-#include <linux/of_reserved_mem.h>
 #include <linux/dmi.h>
 
 #include <asm/addrspace.h>
@@ -686,8 +685,6 @@ static void __init arch_mem_init(char **cmdline_p)
 	memblock_reserve(__pa_symbol(&__nosave_begin),
 		__pa_symbol(&__nosave_end) - __pa_symbol(&__nosave_begin));
 
-	fdt_init_reserved_mem();
-
 	early_memtest(PFN_PHYS(ARCH_PFN_OFFSET), PFN_PHYS(max_low_pfn));
 }
 
-- 
2.29.2

