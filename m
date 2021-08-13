Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDFF13EB658
	for <lists+linux-mips@lfdr.de>; Fri, 13 Aug 2021 15:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240153AbhHMNzS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Aug 2021 09:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240714AbhHMNzR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Aug 2021 09:55:17 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E4EEC061756;
        Fri, 13 Aug 2021 06:54:50 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id y7so15771335ljp.3;
        Fri, 13 Aug 2021 06:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O1XdnwWUF59vgK1x0K9t+2GQQ4pwaV3DLawK5UlUo80=;
        b=hb3nT9IcrGjePqClT5j5lBJ/wY/I9PPAMN9oFbjkvfk+RJH3cP/HUD07Vfdf5eA9su
         3ESIFrv9OVVZqEfSHWPMS2Vwry6fxX7B3kE/YvuCvp5fon+J9SmhTuNpadxrKOCidR7p
         3LsN7woGUmLwnLl9JivGGllxsmbkN0NxXnqXeEDP25+qpLSaWQvCdctZQCrqjj8wQE1+
         cyc/xLmcvgsRPJLq1dCRnhy347bNqgMOl4ysDjOkWSicH7BONijeMZUQDB/r8G3aTxf8
         CoN6lJXKC7TnbDbJpz+hH5tQ41fUezjCv4wh3dawz77W4mqedjfKNY09JJ5yzoth5ity
         mUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O1XdnwWUF59vgK1x0K9t+2GQQ4pwaV3DLawK5UlUo80=;
        b=d/LGd26uhI2hT1vv+QlOfm/mANNyFuMMi4ZhVTR/MUXp+5C63yN9zgiVyeimhNzsKy
         3z0wA7p2zhxgOkzj2zHWH2SeaUTVGP+POLG1SV+S7gd8OsbeBANCdl2ohFOycPaMzGw4
         q1ALluwfeuiH9yoOJs04n+rs7sCJ6Suv39fKs7eAoAW4k1bl3gfIelDlCCGXzfB2OzZl
         BBARYvkLiQRbU/wkvWBQLxsPvwbbpuc+tqgU7SaE6Vnxp4JSPyjpG/17ScKipekDattz
         0xGveKNBssCOeSRhy9fXBUoArS+qFN7k/spYaR+zQ+j35Jn/LKcGttOUO4hvDrCC1Q4z
         qv7Q==
X-Gm-Message-State: AOAM532jx/4Yo6VwXtm+ZgiGv0daR8aVGIwsbNHhAF2DTN4hNpJBKVtq
        2aLRfO1VKuVJq3ea4oSI5JKySuJIVuGBWUZy
X-Google-Smtp-Source: ABdhPJzrzQR6pAQaUauD6jgHqgRU0Gc25T0BsXZGtG7vhxsbrUSc7RIh+xcxRhLpMe1qAiecXoW9Kw==
X-Received: by 2002:a2e:a209:: with SMTP id h9mr1930492ljm.249.1628862888667;
        Fri, 13 Aug 2021 06:54:48 -0700 (PDT)
Received: from localhost.localdomain (45-11-60-78.ip4.greenlan.pl. [45.11.60.78])
        by smtp.googlemail.com with ESMTPSA id j16sm178626lja.82.2021.08.13.06.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 06:54:48 -0700 (PDT)
From:   Marcin Chojnacki <marcinch7@gmail.com>
Cc:     marcinch7@gmail.com,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mips: mm: correct build errors for debug code in tlb-r3k
Date:   Fri, 13 Aug 2021 15:54:33 +0200
Message-Id: <20210813135434.1015906-1-marcinch7@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

tlb-r3k has debug code hidden under DEBUG_TLB define. This flag
is undefined by default which results in the code not being compiled.
If one would enable the flag, the file would not build because of
the code being not up to date with the rest of this file.

This commit fixes the normally hidden debug code to bring it in line
with the rest of the file and make it build with the debug flag enabled.

Signed-off-by: Marcin Chojnacki <marcinch7@gmail.com>
---
 arch/mips/mm/tlb-r3k.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/mips/mm/tlb-r3k.c b/arch/mips/mm/tlb-r3k.c
index a36622ebe..ca53f3366 100644
--- a/arch/mips/mm/tlb-r3k.c
+++ b/arch/mips/mm/tlb-r3k.c
@@ -77,7 +77,7 @@ void local_flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		unsigned long size, flags;
 
 #ifdef DEBUG_TLB
-		printk("[tlbrange<%lu,0x%08lx,0x%08lx>]",
+		printk("[tlbrange<%llu,0x%08lx,0x%08lx>]",
 			cpu_context(cpu, mm) & asid_mask, start, end);
 #endif
 		local_irq_save(flags);
@@ -115,7 +115,7 @@ void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
 	unsigned long size, flags;
 
 #ifdef DEBUG_TLB
-	printk("[tlbrange<%lu,0x%08lx,0x%08lx>]", start, end);
+	printk("[tlbrange<0x%08lx,0x%08lx>]", start, end);
 #endif
 	local_irq_save(flags);
 	size = (end - start + (PAGE_SIZE - 1)) >> PAGE_SHIFT;
@@ -156,7 +156,7 @@ void local_flush_tlb_page(struct vm_area_struct *vma, unsigned long page)
 		int oldpid, newpid, idx;
 
 #ifdef DEBUG_TLB
-		printk("[tlbpage<%lu,0x%08lx>]", cpu_context(cpu, vma->vm_mm), page);
+		printk("[tlbpage<%llu,0x%08lx>]", cpu_context(cpu, vma->vm_mm), page);
 #endif
 		newpid = cpu_context(cpu, vma->vm_mm) & asid_mask;
 		page &= PAGE_MASK;
@@ -183,6 +183,9 @@ void __update_tlb(struct vm_area_struct *vma, unsigned long address, pte_t pte)
 	unsigned long asid_mask = cpu_asid_mask(&current_cpu_data);
 	unsigned long flags;
 	int idx, pid;
+#ifdef DEBUG_TLB
+	int cpu = smp_processor_id();
+#endif
 
 	/*
 	 * Handle debugger faulting in for debugee.
@@ -194,7 +197,7 @@ void __update_tlb(struct vm_area_struct *vma, unsigned long address, pte_t pte)
 
 #ifdef DEBUG_TLB
 	if ((pid != (cpu_context(cpu, vma->vm_mm) & asid_mask)) || (cpu_context(cpu, vma->vm_mm) == 0)) {
-		printk("update_mmu_cache: Wheee, bogus tlbpid mmpid=%lu tlbpid=%d\n",
+		printk("update_mmu_cache: Wheee, bogus tlbpid mmpid=%llu tlbpid=%d\n",
 		       (cpu_context(cpu, vma->vm_mm)), pid);
 	}
 #endif
@@ -229,7 +232,7 @@ void add_wired_entry(unsigned long entrylo0, unsigned long entrylo1,
 		unsigned long w;
 
 #ifdef DEBUG_TLB
-		printk("[tlbwired<entry lo0 %8x, hi %8x\n, pagemask %8x>]\n",
+		printk("[tlbwired<entry lo0 %8lx, hi %8lx\n, pagemask %8lx>]\n",
 		       entrylo0, entryhi, pagemask);
 #endif
 
@@ -253,7 +256,7 @@ void add_wired_entry(unsigned long entrylo0, unsigned long entrylo1,
 
 	} else if (wired < 8) {
 #ifdef DEBUG_TLB
-		printk("[tlbwired<entry lo0 %8x, hi %8x\n>]\n",
+		printk("[tlbwired<entry lo0 %8lx, hi %8lx\n>]\n",
 		       entrylo0, entryhi);
 #endif
 
-- 
2.30.2

