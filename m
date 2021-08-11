Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B6A63E8C96
	for <lists+linux-mips@lfdr.de>; Wed, 11 Aug 2021 10:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236463AbhHKIw1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Aug 2021 04:52:27 -0400
Received: from leibniz.telenet-ops.be ([195.130.137.77]:51926 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236397AbhHKIwA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Aug 2021 04:52:00 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4Gl3TL07DBzMqjMh
        for <linux-mips@vger.kernel.org>; Wed, 11 Aug 2021 10:51:34 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
        by baptiste.telenet-ops.be with bizsmtp
        id g8rG250061gJxCh018rG45; Wed, 11 Aug 2021 10:51:33 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mDjxD-001yaH-W7; Wed, 11 Aug 2021 10:51:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mDjxD-0058xf-H6; Wed, 11 Aug 2021 10:51:15 +0200
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
Subject: [PATCH v5 9/9] ARM: uncompress: Parse "linux,usable-memory-range" DT property
Date:   Wed, 11 Aug 2021 10:51:07 +0200
Message-Id: <5b71846020ce8b715423734365fa4f94aa65d77a.1628670468.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628670468.git.geert+renesas@glider.be>
References: <cover.1628670468.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for parsing the "linux,usable-memory-range" DT property.
This property is used to describe the usable memory reserved for the
crash dump kernel, and thus makes the memory reservation explicit.
If present, Linux no longer needs to mask the program counter, and rely
on the "mem=" kernel parameter to obtain the start and size of usable
memory.

For backwards compatibility, the traditional method to derive the start
of memory is still used if "linux,usable-memory-range" is absent.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
The corresponding patch for kexec-tools is "[PATCH] arm: kdump: Add DT
properties to crash dump kernel's DTB", which is still valid:
https://lore.kernel.org/linux-arm-kernel/20200902154129.6358-1-geert+renesas@glider.be/

v5:
  - Remove the addition of "linux,elfcorehdr" and
    "linux,usable-memory-range" handling to arch/arm/mm/init.c,

v4:
  - Remove references to architectures in chosen.txt, to avoid having to
    change this again when more architectures copy kdump support,
  - Remove the architecture-specific code for parsing
    "linux,usable-memory-range" and "linux,elfcorehdr", as the FDT core
    code now takes care of this,
  - Move chosen.txt change to patch changing the FDT core,
  - Use IS_ENABLED(CONFIG_CRASH_DUMP) instead of #ifdef,

v3:
  - Rebase on top of accepted solution for DTB memory information
    handling, which is part of v5.12-rc1,

v2:
  - Rebase on top of reworked DTB memory information handling.
---
 .../arm/boot/compressed/fdt_check_mem_start.c | 48 ++++++++++++++++---
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/compressed/fdt_check_mem_start.c b/arch/arm/boot/compressed/fdt_check_mem_start.c
index 62450d824c3ca180..9291a2661bdfe57f 100644
--- a/arch/arm/boot/compressed/fdt_check_mem_start.c
+++ b/arch/arm/boot/compressed/fdt_check_mem_start.c
@@ -55,16 +55,17 @@ static uint64_t get_val(const fdt32_t *cells, uint32_t ncells)
  * DTB, and, if out-of-range, replace it by the real start address.
  * To preserve backwards compatibility (systems reserving a block of memory
  * at the start of physical memory, kdump, ...), the traditional method is
- * always used if it yields a valid address.
+ * used if it yields a valid address, unless the "linux,usable-memory-range"
+ * property is present.
  *
  * Return value: start address of physical memory to use
  */
 uint32_t fdt_check_mem_start(uint32_t mem_start, const void *fdt)
 {
-	uint32_t addr_cells, size_cells, base;
+	uint32_t addr_cells, size_cells, usable_base, base;
 	uint32_t fdt_mem_start = 0xffffffff;
-	const fdt32_t *reg, *endp;
-	uint64_t size, end;
+	const fdt32_t *usable, *reg, *endp;
+	uint64_t size, usable_end, end;
 	const char *type;
 	int offset, len;
 
@@ -80,6 +81,27 @@ uint32_t fdt_check_mem_start(uint32_t mem_start, const void *fdt)
 	if (addr_cells > 2 || size_cells > 2)
 		return mem_start;
 
+	/*
+	 * Usable memory in case of a crash dump kernel
+	 * This property describes a limitation: memory within this range is
+	 * only valid when also described through another mechanism
+	 */
+	usable = get_prop(fdt, "/chosen", "linux,usable-memory-range",
+			  (addr_cells + size_cells) * sizeof(fdt32_t));
+	if (usable) {
+		size = get_val(usable + addr_cells, size_cells);
+		if (!size)
+			return mem_start;
+
+		if (addr_cells > 1 && fdt32_ld(usable)) {
+			/* Outside 32-bit address space */
+			return mem_start;
+		}
+
+		usable_base = fdt32_ld(usable + addr_cells - 1);
+		usable_end = usable_base + size;
+	}
+
 	/* Walk all memory nodes and regions */
 	for (offset = fdt_next_node(fdt, -1, NULL); offset >= 0;
 	     offset = fdt_next_node(fdt, offset, NULL)) {
@@ -107,7 +129,20 @@ uint32_t fdt_check_mem_start(uint32_t mem_start, const void *fdt)
 
 			base = fdt32_ld(reg + addr_cells - 1);
 			end = base + size;
-			if (mem_start >= base && mem_start < end) {
+			if (usable) {
+				/*
+				 * Clip to usable range, which takes precedence
+				 * over mem_start
+				 */
+				if (base < usable_base)
+					base = usable_base;
+
+				if (end > usable_end)
+					end = usable_end;
+
+				if (end <= base)
+					continue;
+			} else if (mem_start >= base && mem_start < end) {
 				/* Calculated address is valid, use it */
 				return mem_start;
 			}
@@ -123,7 +158,8 @@ uint32_t fdt_check_mem_start(uint32_t mem_start, const void *fdt)
 	}
 
 	/*
-	 * The calculated address is not usable.
+	 * The calculated address is not usable, or was overridden by the
+	 * "linux,usable-memory-range" property.
 	 * Use the lowest usable physical memory address from the DTB instead,
 	 * and make sure this is a multiple of 2 MiB for phys/virt patching.
 	 */
-- 
2.25.1

