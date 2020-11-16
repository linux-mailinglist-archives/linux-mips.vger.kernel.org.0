Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C19532B4E5B
	for <lists+linux-mips@lfdr.de>; Mon, 16 Nov 2020 18:49:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733151AbgKPRpY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Nov 2020 12:45:24 -0500
Received: from mx2.suse.de ([195.135.220.15]:38282 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731712AbgKPRpX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 16 Nov 2020 12:45:23 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id E4470AD11;
        Mon, 16 Nov 2020 17:45:21 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: kernel: Fix for_each_memblock conversion
Date:   Mon, 16 Nov 2020 18:45:15 +0100
Message-Id: <20201116174516.144243-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The loop over all memblocks works with PFN numbers and not physical
addresses, so we need for_each_mem_pfn_range().

Fixes: b10d6bca8720 ("arch, drivers: replace for_each_membock() with for_each_mem_range()")
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/kernel/setup.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 0d4253208bde..ca579deef939 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -262,8 +262,8 @@ static void __init bootmem_init(void)
 static void __init bootmem_init(void)
 {
 	phys_addr_t ramstart, ramend;
-	phys_addr_t start, end;
-	u64 i;
+	unsigned long start, end;
+	int i;
 
 	ramstart = memblock_start_of_DRAM();
 	ramend = memblock_end_of_DRAM();
@@ -300,7 +300,7 @@ static void __init bootmem_init(void)
 
 	min_low_pfn = ARCH_PFN_OFFSET;
 	max_pfn = PFN_DOWN(ramend);
-	for_each_mem_range(i, &start, &end) {
+	for_each_mem_pfn_range(i, MAX_NUMNODES, &start, &end, NULL) {
 		/*
 		 * Skip highmem here so we get an accurate max_low_pfn if low
 		 * memory stops short of high memory.
-- 
2.16.4

