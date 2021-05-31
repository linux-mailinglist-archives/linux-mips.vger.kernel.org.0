Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 960CE395A98
	for <lists+linux-mips@lfdr.de>; Mon, 31 May 2021 14:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231626AbhEaMdS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 May 2021 08:33:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:38656 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231535AbhEaMdH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 31 May 2021 08:33:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F3E666135F;
        Mon, 31 May 2021 12:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622464288;
        bh=309tkdm9I1/k2Co/st23BvuJob0lzdLSyQqCb3FEq5k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=shfDXUt5Lezf1d+wGhhu727XGfae1hwajag2YZ137cnZTl0B/na6Vf8bUHnNhLWcT
         WDL60Wfo8EfCCBAwsr7gWELh2vywN4mSg5ZuH+KeAq3Pwl9n/EDdaxpSqRqzGw6lzF
         jz6t+S3yWvR8fD8/I/efykYVq8goZPliRZ+lqDA5PjiEl6id5iWfqxcXzTHq2SSf5P
         R3XUx/1lBgKklG8b5Ne/MMyJIdOZS4ey4MqYOW5bOIodhNki11uKX8zEIFwq4Y0P09
         r9mcdDDc6cqMoPniLqJq3r7YlX/GBrJfp7Qn5kf3ivzA2MwWHqNFhEZcADG5BrH2I9
         gIFsiBwqkFhgA==
From:   Mike Rapoport <rppt@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-s390@vger.kernel.org
Subject: [RFC/RFT PATCH 4/5] MIPS: switch to generic memblock_setup_resources
Date:   Mon, 31 May 2021 15:29:58 +0300
Message-Id: <20210531122959.23499-5-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210531122959.23499-1-rppt@kernel.org>
References: <20210531122959.23499-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

MIPS version of resource setup is very similar to the generic one. The only
difference is the reservation of the crash kernel area that is spread among
several functions.

Switch MIPS to use the generic version.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/mips/kernel/setup.c | 78 +++-------------------------------------
 1 file changed, 5 insertions(+), 73 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 23a140327a0b..be49217f0f22 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -79,10 +79,6 @@ static const char builtin_cmdline[] __initconst = "";
 unsigned long mips_io_port_base = -1;
 EXPORT_SYMBOL(mips_io_port_base);
 
-static struct resource code_resource = { .name = "Kernel code", };
-static struct resource data_resource = { .name = "Kernel data", };
-static struct resource bss_resource = { .name = "Kernel bss", };
-
 unsigned long __kaslr_offset __ro_after_init;
 EXPORT_SYMBOL(__kaslr_offset);
 
@@ -469,31 +465,18 @@ static void __init mips_parse_crashkernel(void)
 		}
 	}
 
+	memblock_reserve(crashk_res.start, resource_size(&crashk_res));
+
 	crashk_res.start = crash_base;
 	crashk_res.end	 = crash_base + crash_size - 1;
-}
-
-static void __init request_crashkernel(struct resource *res)
-{
-	int ret;
-
-	if (crashk_res.start == crashk_res.end)
-		return;
 
-	ret = request_resource(res, &crashk_res);
-	if (!ret)
-		pr_info("Reserving %ldMB of memory at %ldMB for crashkernel\n",
-			(unsigned long)(resource_size(&crashk_res) >> 20),
-			(unsigned long)(crashk_res.start  >> 20));
+	pr_info("Reserving %lldMB of memory at %lldMB for crashkernel\n",
+		crash_base >> 20, crash_size);
 }
 #else /* !defined(CONFIG_KEXEC)		*/
 static void __init mips_parse_crashkernel(void)
 {
 }
-
-static void __init request_crashkernel(struct resource *res)
-{
-}
 #endif /* !defined(CONFIG_KEXEC)  */
 
 static void __init check_kernel_sections_mem(void)
@@ -656,10 +639,6 @@ static void __init arch_mem_init(char **cmdline_p)
 	mips_reserve_vmcore();
 
 	mips_parse_crashkernel();
-#ifdef CONFIG_KEXEC
-	if (crashk_res.start != crashk_res.end)
-		memblock_reserve(crashk_res.start, resource_size(&crashk_res));
-#endif
 	device_tree_init();
 
 	/*
@@ -683,53 +662,6 @@ static void __init arch_mem_init(char **cmdline_p)
 	early_memtest(PFN_PHYS(ARCH_PFN_OFFSET), PFN_PHYS(max_low_pfn));
 }
 
-static void __init resource_init(void)
-{
-	phys_addr_t start, end;
-	u64 i;
-
-	if (UNCAC_BASE != IO_BASE)
-		return;
-
-	code_resource.start = __pa_symbol(&_text);
-	code_resource.end = __pa_symbol(&_etext) - 1;
-	data_resource.start = __pa_symbol(&_etext);
-	data_resource.end = __pa_symbol(&_edata) - 1;
-	bss_resource.start = __pa_symbol(&__bss_start);
-	bss_resource.end = __pa_symbol(&__bss_stop) - 1;
-
-	for_each_mem_range(i, &start, &end) {
-		struct resource *res;
-
-		res = memblock_alloc(sizeof(struct resource), SMP_CACHE_BYTES);
-		if (!res)
-			panic("%s: Failed to allocate %zu bytes\n", __func__,
-			      sizeof(struct resource));
-
-		res->start = start;
-		/*
-		 * In memblock, end points to the first byte after the
-		 * range while in resourses, end points to the last byte in
-		 * the range.
-		 */
-		res->end = end - 1;
-		res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
-		res->name = "System RAM";
-
-		request_resource(&iomem_resource, res);
-
-		/*
-		 *  We don't know which RAM region contains kernel data,
-		 *  so we try it repeatedly and let the resource manager
-		 *  test it.
-		 */
-		request_resource(res, &code_resource);
-		request_resource(res, &data_resource);
-		request_resource(res, &bss_resource);
-		request_crashkernel(res);
-	}
-}
-
 #ifdef CONFIG_SMP
 static void __init prefill_possible_map(void)
 {
@@ -771,7 +703,7 @@ void __init setup_arch(char **cmdline_p)
 	arch_mem_init(cmdline_p);
 	dmi_setup();
 
-	resource_init();
+	memblock_setup_resources();
 	plat_smp_setup();
 	prefill_possible_map();
 
-- 
2.28.0

