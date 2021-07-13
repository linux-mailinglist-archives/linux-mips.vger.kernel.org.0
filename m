Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 280283C75ED
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jul 2021 19:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233090AbhGMRwI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Jul 2021 13:52:08 -0400
Received: from smtprelay0219.hostedemail.com ([216.40.44.219]:55774 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230145AbhGMRwI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 13 Jul 2021 13:52:08 -0400
Received: from omf06.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id AA2D9182CED34;
        Tue, 13 Jul 2021 17:49:17 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf06.hostedemail.com (Postfix) with ESMTPA id C3A242448BC;
        Tue, 13 Jul 2021 17:49:16 +0000 (UTC)
Message-ID: <997c0cdbd57752252d87129185a973c7d42e491f.camel@perches.com>
Subject: [PATCH] MIPS: octeon: Remove vestiges of CONFIG_CAVIUM_RESERVE32
From:   Joe Perches <joe@perches.com>
To:     David Daney <david.daney@cavium.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Date:   Tue, 13 Jul 2021 10:49:15 -0700
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C3A242448BC
X-Spam-Status: No, score=-1.09
X-Stat-Signature: noibhr63sywfph683hp1cq8jj65dttn9
X-Rspamd-Server: rspamout02
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+RP6DANkgnMILu8gdNJRmDm7aiQfOSFvY=
X-HE-Tag: 1626198556-395381
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The config option CAVIUM_RESERVE32 is not used.
Remove the dead code controlled by it.

Signed-off-by: Joe Perches <joe@perches.com>
---

Uncompiled, untested.

Found using a grep for unused Kconfig entries:

$ git grep -P '^\s*#\s*if(?:def\s+|\s*defined\s*\(?\s*)CONFIG_[A-Z0-9_]+' | \
  grep -oh -P '\bCONFIG_[A-Z0-9_]+\b' | \
  sort | sed -e 's/^CONFIG_//' -e 's/_MODULE$//' | uniq | \
  while read config ; do \
    echo CONFIG_$config; \
    git grep -w $config -- '*/Kconfig*' | \
    wc -l; \
  done | \
  grep -B1 '^0'

with some additional inspection of the kernel source tree to verify.

 arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c | 21 +++---------
 arch/mips/cavium-octeon/setup.c                    | 38 +---------------------
 2 files changed, 5 insertions(+), 54 deletions(-)

diff --git a/arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c b/arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c
index 3839feba68f20..fb42e8e21ea0d 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c
@@ -57,27 +57,14 @@ EXPORT_SYMBOL_GPL(__cvmx_cmd_queue_state_ptr);
 static cvmx_cmd_queue_result_t __cvmx_cmd_queue_init_state_ptr(void)
 {
 	char *alloc_name = "cvmx_cmd_queues";
-#if defined(CONFIG_CAVIUM_RESERVE32) && CONFIG_CAVIUM_RESERVE32
-	extern uint64_t octeon_reserve32_memory;
-#endif
 
 	if (likely(__cvmx_cmd_queue_state_ptr))
 		return CVMX_CMD_QUEUE_SUCCESS;
 
-#if defined(CONFIG_CAVIUM_RESERVE32) && CONFIG_CAVIUM_RESERVE32
-	if (octeon_reserve32_memory)
-		__cvmx_cmd_queue_state_ptr =
-		    cvmx_bootmem_alloc_named_range(sizeof(*__cvmx_cmd_queue_state_ptr),
-						   octeon_reserve32_memory,
-						   octeon_reserve32_memory +
-						   (CONFIG_CAVIUM_RESERVE32 <<
-						    20) - 1, 128, alloc_name);
-	else
-#endif
-		__cvmx_cmd_queue_state_ptr =
-		    cvmx_bootmem_alloc_named(sizeof(*__cvmx_cmd_queue_state_ptr),
-					    128,
-					    alloc_name);
+	__cvmx_cmd_queue_state_ptr =
+		cvmx_bootmem_alloc_named(sizeof(*__cvmx_cmd_queue_state_ptr),
+					 128,
+					 alloc_name);
 	if (__cvmx_cmd_queue_state_ptr)
 		memset(__cvmx_cmd_queue_state_ptr, 0,
 		       sizeof(*__cvmx_cmd_queue_state_ptr));
diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
index ce4e2806159bb..0ddd3cc16ee47 100644
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -284,11 +284,6 @@ void octeon_crash_smp_send_stop(void)
 
 #endif /* CONFIG_KEXEC */
 
-#ifdef CONFIG_CAVIUM_RESERVE32
-uint64_t octeon_reserve32_memory;
-EXPORT_SYMBOL(octeon_reserve32_memory);
-#endif
-
 #ifdef CONFIG_KEXEC
 /* crashkernel cmdline parameter is parsed _after_ memory setup
  * we also parse it here (workaround for EHB5200) */
@@ -665,9 +660,7 @@ void __init prom_init(void)
 	int i;
 	u64 t;
 	int argc;
-#ifdef CONFIG_CAVIUM_RESERVE32
-	int64_t addr = -1;
-#endif
+
 	/*
 	 * The bootloader passes a pointer to the boot descriptor in
 	 * $a3, this is available as fw_arg3.
@@ -782,25 +775,6 @@ void __init prom_init(void)
 		cvmx_write_csr(CVMX_LED_UDD_DATX(1), 0);
 		cvmx_write_csr(CVMX_LED_EN, 1);
 	}
-#ifdef CONFIG_CAVIUM_RESERVE32
-	/*
-	 * We need to temporarily allocate all memory in the reserve32
-	 * region. This makes sure the kernel doesn't allocate this
-	 * memory when it is getting memory from the
-	 * bootloader. Later, after the memory allocations are
-	 * complete, the reserve32 will be freed.
-	 *
-	 * Allocate memory for RESERVED32 aligned on 2MB boundary. This
-	 * is in case we later use hugetlb entries with it.
-	 */
-	addr = cvmx_bootmem_phy_named_block_alloc(CONFIG_CAVIUM_RESERVE32 << 20,
-						0, 0, 2 << 20,
-						"CAVIUM_RESERVE32", 0);
-	if (addr < 0)
-		pr_err("Failed to allocate CAVIUM_RESERVE32 memory area\n");
-	else
-		octeon_reserve32_memory = addr;
-#endif
 
 #ifdef CONFIG_CAVIUM_OCTEON_LOCK_L2
 	if (cvmx_read_csr(CVMX_L2D_FUS3) & (3ull << 34)) {
@@ -1078,16 +1052,6 @@ void __init plat_mem_setup(void)
 	cvmx_bootmem_unlock();
 #endif /* CONFIG_CRASH_DUMP */
 
-#ifdef CONFIG_CAVIUM_RESERVE32
-	/*
-	 * Now that we've allocated the kernel memory it is safe to
-	 * free the reserved region. We free it here so that builtin
-	 * drivers can use the memory.
-	 */
-	if (octeon_reserve32_memory)
-		cvmx_bootmem_free_named("CAVIUM_RESERVE32");
-#endif /* CONFIG_CAVIUM_RESERVE32 */
-
 	if (total == 0)
 		panic("Unable to allocate memory from "
 		      "cvmx_bootmem_phy_alloc");

