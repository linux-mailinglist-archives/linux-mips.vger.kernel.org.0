Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 943133E8C85
	for <lists+linux-mips@lfdr.de>; Wed, 11 Aug 2021 10:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236374AbhHKIwD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Aug 2021 04:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236440AbhHKIwA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Aug 2021 04:52:00 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC241C0617A0
        for <linux-mips@vger.kernel.org>; Wed, 11 Aug 2021 01:51:35 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
        by xavier.telenet-ops.be with bizsmtp
        id g8rH2500H1gJxCh018rHUg; Wed, 11 Aug 2021 10:51:32 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mDjxF-001yaF-1h; Wed, 11 Aug 2021 10:51:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mDjxD-0058xR-F6; Wed, 11 Aug 2021 10:51:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Kossifidis <mick@ics.forth.gr>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Frank Rowand <frowand.list@gmail.com>,
        Dave Young <dyoung@redhat.com>
Cc:     Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
        Mike Rapoport <rppt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v5 7/9] arm64: kdump: Remove custom linux,elfcorehdr handling
Date:   Wed, 11 Aug 2021 10:51:05 +0200
Message-Id: <3b8f801f9b92066855e87f3079fafc153ab20f69.1628670468.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628670468.git.geert+renesas@glider.be>
References: <cover.1628670468.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove the architecture-specific code for handling the
"linux,elfcorehdr" property under the "/chosen" node in DT, as the
platform-agnostic handling in the FDT core code already takes care of
this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v5:
  - Remove all handling, not just parsing,

v4:
  - s/handlng/parsing/ in patch description.
---
 arch/arm64/mm/init.c | 53 --------------------------------------------
 1 file changed, 53 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 8490ed2917ff2430..bac4f06bb7d900a2 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -124,57 +124,6 @@ static void __init reserve_crashkernel(void)
 }
 #endif /* CONFIG_KEXEC_CORE */
 
-#ifdef CONFIG_CRASH_DUMP
-static int __init early_init_dt_scan_elfcorehdr(unsigned long node,
-		const char *uname, int depth, void *data)
-{
-	const __be32 *reg;
-	int len;
-
-	if (depth != 1 || strcmp(uname, "chosen") != 0)
-		return 0;
-
-	reg = of_get_flat_dt_prop(node, "linux,elfcorehdr", &len);
-	if (!reg || (len < (dt_root_addr_cells + dt_root_size_cells)))
-		return 1;
-
-	elfcorehdr_addr = dt_mem_next_cell(dt_root_addr_cells, &reg);
-	elfcorehdr_size = dt_mem_next_cell(dt_root_size_cells, &reg);
-
-	return 1;
-}
-
-/*
- * reserve_elfcorehdr() - reserves memory for elf core header
- *
- * This function reserves the memory occupied by an elf core header
- * described in the device tree. This region contains all the
- * information about primary kernel's core image and is used by a dump
- * capture kernel to access the system memory on primary kernel.
- */
-static void __init reserve_elfcorehdr(void)
-{
-	of_scan_flat_dt(early_init_dt_scan_elfcorehdr, NULL);
-
-	if (!elfcorehdr_size)
-		return;
-
-	if (memblock_is_region_reserved(elfcorehdr_addr, elfcorehdr_size)) {
-		pr_warn("elfcorehdr is overlapped\n");
-		return;
-	}
-
-	memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
-
-	pr_info("Reserving %lldKB of memory at 0x%llx for elfcorehdr\n",
-		elfcorehdr_size >> 10, elfcorehdr_addr);
-}
-#else
-static void __init reserve_elfcorehdr(void)
-{
-}
-#endif /* CONFIG_CRASH_DUMP */
-
 /*
  * Return the maximum physical address for a zone accessible by the given bits
  * limit. If DRAM starts above 32-bit, expand the zone to the maximum
@@ -395,8 +344,6 @@ void __init arm64_memblock_init(void)
 
 	early_init_fdt_scan_reserved_mem();
 
-	reserve_elfcorehdr();
-
 	high_memory = __va(memblock_end_of_DRAM() - 1) + 1;
 }
 
-- 
2.25.1

