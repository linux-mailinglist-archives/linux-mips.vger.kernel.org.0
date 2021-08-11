Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2063E8C77
	for <lists+linux-mips@lfdr.de>; Wed, 11 Aug 2021 10:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236571AbhHKIwC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Aug 2021 04:52:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236462AbhHKIwA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Aug 2021 04:52:00 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF545C0617A3
        for <linux-mips@vger.kernel.org>; Wed, 11 Aug 2021 01:51:35 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
        by xavier.telenet-ops.be with bizsmtp
        id g8rG2500m1gJxCh018rGUb; Wed, 11 Aug 2021 10:51:32 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mDjxE-001yaA-I3; Wed, 11 Aug 2021 10:51:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mDjxD-0058x3-C2; Wed, 11 Aug 2021 10:51:15 +0200
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
Subject: [PATCH v5 4/9] of: fdt: Add generic support for handling usable memory range property
Date:   Wed, 11 Aug 2021 10:51:02 +0200
Message-Id: <3bd69bada93ee59b7d23c38b3527fc1654e19343.1628670468.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628670468.git.geert+renesas@glider.be>
References: <cover.1628670468.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for handling the "linux,usable-memory-range" property in the
"/chosen" node to the FDT core code.  This can co-exist safely with the
architecture-specific handling, until the latter has been removed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
About the change to chosen.txt: I have a similar change for
schemas/chosen.yaml in dt-schema.

v5:
  - Handle the actual capping in generic code, too,

v4:
  - New.
---
 Documentation/devicetree/bindings/chosen.txt |  6 ++--
 drivers/of/fdt.c                             | 30 ++++++++++++++++++++
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
index 5b0b94eb2d04e79d..1cc3aa10dcb10588 100644
--- a/Documentation/devicetree/bindings/chosen.txt
+++ b/Documentation/devicetree/bindings/chosen.txt
@@ -79,9 +79,9 @@ a different secondary CPU release mechanism)
 linux,usable-memory-range
 -------------------------
 
-This property (arm64 only) holds a base address and size, describing a
-limited region in which memory may be considered available for use by
-the kernel. Memory outside of this range is not available for use.
+This property holds a base address and size, describing a limited region in
+which memory may be considered available for use by the kernel. Memory outside
+of this range is not available for use.
 
 This property describes a limitation: memory within this range is only
 valid when also described through another mechanism that the kernel
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 99be3e03af29089f..bc041d8141e86e62 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -956,6 +956,32 @@ static void __init early_init_dt_check_for_elfcorehdr(unsigned long node)
 		 elfcorehdr_addr, elfcorehdr_size);
 }
 
+static phys_addr_t cap_mem_addr;
+static phys_addr_t cap_mem_size;
+
+/**
+ * early_init_dt_check_for_usable_mem_range - Decode usable memory range
+ * location from flat tree
+ * @node: reference to node containing usable memory range location ('chosen')
+ */
+static void __init early_init_dt_check_for_usable_mem_range(unsigned long node)
+{
+	const __be32 *prop;
+	int len;
+
+	pr_debug("Looking for usable-memory-range property... ");
+
+	prop = of_get_flat_dt_prop(node, "linux,usable-memory-range", &len);
+	if (!prop || (len < (dt_root_addr_cells + dt_root_size_cells)))
+		return;
+
+	cap_mem_addr = dt_mem_next_cell(dt_root_addr_cells, &prop);
+	cap_mem_size = dt_mem_next_cell(dt_root_size_cells, &prop);
+
+	pr_debug("cap_mem_start=%pa cap_mem_size=%pa\n", &cap_mem_addr,
+		 &cap_mem_size);
+}
+
 #ifdef CONFIG_SERIAL_EARLYCON
 
 int __init early_init_dt_scan_chosen_stdout(void)
@@ -1104,6 +1130,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 
 	early_init_dt_check_for_initrd(node);
 	early_init_dt_check_for_elfcorehdr(node);
+	early_init_dt_check_for_usable_mem_range(node);
 
 	/* Retrieve command line */
 	p = of_get_flat_dt_prop(node, "bootargs", &l);
@@ -1258,6 +1285,9 @@ void __init early_init_dt_scan_nodes(void)
 
 	/* Setup memory, calling early_init_dt_add_memory_arch */
 	of_scan_flat_dt(early_init_dt_scan_memory, NULL);
+
+	/* Handle linux,usable-memory-range property */
+	memblock_cap_memory_range(cap_mem_addr, cap_mem_size);
 }
 
 bool __init early_init_dt_scan(void *params)
-- 
2.25.1

