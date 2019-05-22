Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7377225F30
	for <lists+linux-mips@lfdr.de>; Wed, 22 May 2019 10:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728159AbfEVIPl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 May 2019 04:15:41 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:39592 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbfEVIPl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 May 2019 04:15:41 -0400
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id FLFd2000k3XaVaC01LFdtJ; Wed, 22 May 2019 10:15:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hTMPR-00075Y-Ny; Wed, 22 May 2019 10:15:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hTMPR-0004KC-LR; Wed, 22 May 2019 10:15:37 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Serge Semin <fancer.lancer@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Cc:     Mike Rapoport <rppt@linux.ibm.com>,
        "Maciej W . Rozycki" <macro@linux-mips.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] MIPS: TXx9: Fix boot crash in free_initmem()
Date:   Wed, 22 May 2019 10:15:35 +0200
Message-Id: <20190522081535.16583-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On rbtx4927:

    BUG: Bad page state in process swapper  pfn:00001
    page:804b7820 refcount:0 mapcount:-128 mapping:00000000 index:0x1
    flags: 0x0()
    raw: 00000000 00000100 00000200 00000000 00000001 00000000 ffffff7f 00000000
    page dumped because: nonzero mapcount
    Modules linked in:
    CPU: 0 PID: 1 Comm: swapper Not tainted 5.2.0-rc1-rbtx4927-00468-g3c05ea3d4077b756 #141
    Stack : 00000000 10008400 8040dc4c 87c1b974 8044af63 8040dc4c 00000001 804a3490
            00000001 81000000 0030f231 80148558 00000003 10008400 87c1dd80 3d0f9a2c
            00000000 00000000 804b0000 00000000 00000007 00000000 00000081 00000000
            62722d31 00000080 804b0000 39347874 00000000 804b7820 8040ce18 81000010
            00000001 00000007 00000001 81000000 00000018 8021de24 00000000 804a0000
            ...
    Call Trace:
    [<8010adec>] show_stack+0x74/0x104
    [<801a5e44>] bad_page+0x130/0x138
    [<801a654c>] free_pcppages_bulk+0x17c/0x3b0
    [<801a789c>] free_unref_page+0x40/0x68
    [<801120f4>] free_init_pages+0xec/0x104
    [<803bdde8>] free_initmem+0x10/0x58
    [<803bdb8c>] kernel_init+0x20/0x100
    [<801057c8>] ret_from_kernel_thread+0x14/0x1c

As of commit b93ddc4f9156205e ("mips: Reserve memory for the kernel
image resources"), bootmem_init() no longer reserves the memory below
the kernel, while prom_free_prom_memory() still frees it.

Fix this by reverting commit b6263ff2d6e58cc2 ("MIPS: TXx9: Implement
prom_free_prom_memory").

Suggested-by: Serge Semin <fancer.lancer@gmail.com>
Fixes: b93ddc4f9156205e ("mips: Reserve memory for the kernel image resources")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Looks like arch/mips/dec/prom/memory.c needs a similar but more
complicated fix, due to declance handling?
---
 arch/mips/txx9/generic/setup.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/mips/txx9/generic/setup.c b/arch/mips/txx9/generic/setup.c
index 46537c2ca86a2eae..6d0fd0e055b4ba4a 100644
--- a/arch/mips/txx9/generic/setup.c
+++ b/arch/mips/txx9/generic/setup.c
@@ -33,7 +33,6 @@
 #include <asm/time.h>
 #include <asm/reboot.h>
 #include <asm/r4kcache.h>
-#include <asm/sections.h>
 #include <asm/setup.h>
 #include <asm/txx9/generic.h>
 #include <asm/txx9/pci.h>
@@ -343,11 +342,6 @@ void __init prom_init(void)
 
 void __init prom_free_prom_memory(void)
 {
-	unsigned long saddr = PAGE_SIZE;
-	unsigned long eaddr = __pa_symbol(&_text);
-
-	if (saddr < eaddr)
-		free_init_pages("prom memory", saddr, eaddr);
 }
 
 const char *get_system_type(void)
-- 
2.17.1

