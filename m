Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48B263135A9
	for <lists+linux-mips@lfdr.de>; Mon,  8 Feb 2021 15:51:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232950AbhBHOvg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Feb 2021 09:51:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233025AbhBHOvX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Feb 2021 09:51:23 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09534C0617A7;
        Mon,  8 Feb 2021 06:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=WiQAMeQ0kgFXqaD5iUMdsN7nTVIUxksUiQmYnowcw5A=; b=ook2soWI0Cmcm700GIwpXBWFcN
        XjPuqUnDG7G7rwpAYSOsnST70emP7hNt/wiiGF5R2zjrjUO6h4uR8f3l0Jpa59LnME+PmkCpGMyJK
        FCo5VuijlSW9Efl1omBxV22GUTGTrDqUwBPLn+nn1k8P0GlGiDXXP7473mC4O+E4fkO+QjgXFYB8x
        dV0R5UwBoYk77GChmggBEoYfCvlC9bewv3kyEDNDo73NtQP5KfWNBJhiYGb96MZWTWUWSCRFaFyjp
        /4HvlDjh++1HsQhOd8Gs276TV2NIFEU2kLpfNszI03dGyieJ0KAR/lanpbIs5WlUCuZJ5aR7UR13H
        u7Ig5/Sg==;
Received: from [2001:4bb8:184:7d04:e3ed:f9d6:78e2:6f0f] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l97s8-0066eA-Bc; Mon, 08 Feb 2021 14:50:40 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: [PATCH 5/6] driver core: lift dma_default_coherent into common code
Date:   Mon,  8 Feb 2021 15:50:23 +0100
Message-Id: <20210208145024.3320420-6-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208145024.3320420-1-hch@lst.de>
References: <20210208145024.3320420-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Lift the dma_default_coherent variable from the mips architecture code
to the driver core.  This allows an architecture to sdefault all device
to be DMA coherent at run time, even if the kernel is build with support
for DMA noncoherent device.  By allowing device_initialize to ѕet the
->dma_coherent field to this default the amount of arch hooks required
for this behavior can be greatly reduced.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/Kconfig                     |  9 ++-------
 arch/mips/alchemy/common/setup.c      |  2 +-
 arch/mips/include/asm/dma-coherence.h | 22 ----------------------
 arch/mips/kernel/setup.c              |  6 ------
 arch/mips/mm/c-r4k.c                  |  2 +-
 arch/mips/mm/dma-noncoherent.c        |  1 -
 arch/mips/mti-malta/malta-setup.c     |  4 ++--
 arch/mips/pci/pci-alchemy.c           |  2 +-
 arch/mips/pistachio/init.c            |  1 -
 drivers/base/core.c                   |  6 ++++++
 include/linux/dma-map-ops.h           |  5 ++---
 kernel/dma/Kconfig                    |  3 ---
 kernel/dma/mapping.c                  |  2 ++
 13 files changed, 17 insertions(+), 48 deletions(-)
 delete mode 100644 arch/mips/include/asm/dma-coherence.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 0a17bedf4f0dba..1f1603a08a6d2d 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -181,7 +181,7 @@ config MIPS_ALCHEMY
 	select CEVT_R4K
 	select CSRC_R4K
 	select IRQ_MIPS_CPU
-	select DMA_MAYBE_COHERENT	# Au1000,1500,1100 aren't, rest is
+	select DMA_NONCOHERENT		# Au1000,1500,1100 aren't, rest is
 	select MIPS_FIXUP_BIGPHYS_ADDR if PCI
 	select SYS_HAS_CPU_MIPS32_R1
 	select SYS_SUPPORTS_32BIT_KERNEL
@@ -546,7 +546,7 @@ config MIPS_MALTA
 	select CLKSRC_MIPS_GIC
 	select COMMON_CLK
 	select CSRC_R4K
-	select DMA_MAYBE_COHERENT
+	select DMA_NONCOHERENT
 	select GENERIC_ISA_DMA
 	select HAVE_PCSPKR_PLATFORM
 	select HAVE_PCI
@@ -1127,11 +1127,6 @@ config FW_CFE
 config ARCH_SUPPORTS_UPROBES
 	bool
 
-config DMA_MAYBE_COHERENT
-	select ARCH_HAS_DMA_COHERENCE_H
-	select DMA_NONCOHERENT
-	bool
-
 config DMA_PERDEV_COHERENT
 	bool
 	select ARCH_HAS_SETUP_DMA_OPS
diff --git a/arch/mips/alchemy/common/setup.c b/arch/mips/alchemy/common/setup.c
index 39e5b9cd882b10..2388d68786f4a7 100644
--- a/arch/mips/alchemy/common/setup.c
+++ b/arch/mips/alchemy/common/setup.c
@@ -28,8 +28,8 @@
 #include <linux/init.h>
 #include <linux/ioport.h>
 #include <linux/mm.h>
+#include <linux/dma-map-ops.h> /* for dma_default_coherent */
 
-#include <asm/dma-coherence.h>
 #include <asm/mipsregs.h>
 
 #include <au1000.h>
diff --git a/arch/mips/include/asm/dma-coherence.h b/arch/mips/include/asm/dma-coherence.h
deleted file mode 100644
index 846c5ade30d12d..00000000000000
--- a/arch/mips/include/asm/dma-coherence.h
+++ /dev/null
@@ -1,22 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2006  Ralf Baechle <ralf@linux-mips.org>
- *
- */
-#ifndef __ASM_DMA_COHERENCE_H
-#define __ASM_DMA_COHERENCE_H
-
-#ifdef CONFIG_DMA_MAYBE_COHERENT
-extern bool dma_default_coherent;
-static inline bool dev_is_dma_coherent(struct device *dev)
-{
-	return dma_default_coherent;
-}
-#else
-#define dma_default_coherent	(!IS_ENABLED(CONFIG_DMA_NONCOHERENT))
-#endif
-
-#endif
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 85690957525ac9..d95f195dddcb36 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -37,7 +37,6 @@
 #include <asm/cdmm.h>
 #include <asm/cpu.h>
 #include <asm/debug.h>
-#include <asm/dma-coherence.h>
 #include <asm/sections.h>
 #include <asm/setup.h>
 #include <asm/smp-ops.h>
@@ -805,8 +804,3 @@ static int __init debugfs_mips(void)
 }
 arch_initcall(debugfs_mips);
 #endif
-
-#ifdef CONFIG_DMA_NONCOHERENT
-bool dma_default_coherent;
-EXPORT_SYMBOL_GPL(dma_default_coherent);
-#endif
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 58afbc3e4ada03..3c4a50e12cebd4 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -19,6 +19,7 @@
 #include <linux/mm.h>
 #include <linux/export.h>
 #include <linux/bitops.h>
+#include <linux/dma-map-ops.h> /* for dma_default_coherent */
 
 #include <asm/bcache.h>
 #include <asm/bootinfo.h>
@@ -35,7 +36,6 @@
 #include <asm/war.h>
 #include <asm/cacheflush.h> /* for run_uncached() */
 #include <asm/traps.h>
-#include <asm/dma-coherence.h>
 #include <asm/mips-cps.h>
 
 /*
diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoherent.c
index 38d3d9143b47fb..90b562753eb892 100644
--- a/arch/mips/mm/dma-noncoherent.c
+++ b/arch/mips/mm/dma-noncoherent.c
@@ -10,7 +10,6 @@
 
 #include <asm/cache.h>
 #include <asm/cpu-type.h>
-#include <asm/dma-coherence.h>
 #include <asm/io.h>
 
 /*
diff --git a/arch/mips/mti-malta/malta-setup.c b/arch/mips/mti-malta/malta-setup.c
index e98cc977a735b2..f8c9663e7faa10 100644
--- a/arch/mips/mti-malta/malta-setup.c
+++ b/arch/mips/mti-malta/malta-setup.c
@@ -13,8 +13,8 @@
 #include <linux/pci.h>
 #include <linux/screen_info.h>
 #include <linux/time.h>
+#include <linux/dma-map-ops.h> /* for dma_default_coherent */
 
-#include <asm/dma-coherence.h>
 #include <asm/fw/fw.h>
 #include <asm/mips-cps.h>
 #include <asm/mips-boards/generic.h>
@@ -143,7 +143,7 @@ static void __init plat_setup_iocoherency(void)
 			pr_crit("IOCU OPERATION DISABLED BY SWITCH - DEFAULTING TO SW IO COHERENCY\n");
 	}
 
-	if (supported)
+	if (supported) {
 		if (dma_force_noncoherent) {
 			pr_info("Hardware DMA cache coherency disabled\n");
 			return;
diff --git a/arch/mips/pci/pci-alchemy.c b/arch/mips/pci/pci-alchemy.c
index 54c86b40d30498..1c722dd0c1302d 100644
--- a/arch/mips/pci/pci-alchemy.c
+++ b/arch/mips/pci/pci-alchemy.c
@@ -17,8 +17,8 @@
 #include <linux/init.h>
 #include <linux/syscore_ops.h>
 #include <linux/vmalloc.h>
+#include <linux/dma-map-ops.h> /* for dma_default_coherent */
 
-#include <asm/dma-coherence.h>
 #include <asm/mach-au1x00/au1000.h>
 #include <asm/tlbmisc.h>
 
diff --git a/arch/mips/pistachio/init.c b/arch/mips/pistachio/init.c
index 558995ed6fe886..7d3057e586d277 100644
--- a/arch/mips/pistachio/init.c
+++ b/arch/mips/pistachio/init.c
@@ -13,7 +13,6 @@
 #include <linux/of_fdt.h>
 
 #include <asm/cacheflush.h>
-#include <asm/dma-coherence.h>
 #include <asm/fw/fw.h>
 #include <asm/mips-boards/generic.h>
 #include <asm/mips-cps.h>
diff --git a/drivers/base/core.c b/drivers/base/core.c
index 6eb4c7a904c560..7c0406e675e98f 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -28,6 +28,7 @@
 #include <linux/sched/signal.h>
 #include <linux/sched/mm.h>
 #include <linux/sysfs.h>
+#include <linux/dma-map-ops.h> /* for dma_default_coherent */
 
 #include "base.h"
 #include "power/power.h"
@@ -2603,6 +2604,11 @@ void device_initialize(struct device *dev)
 	INIT_LIST_HEAD(&dev->links.suppliers);
 	INIT_LIST_HEAD(&dev->links.defer_sync);
 	dev->links.status = DL_DEV_NO_DRIVER;
+#if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
+    defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
+    defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
+	dev->dma_coherent = dma_default_coherent;
+#endif
 }
 EXPORT_SYMBOL_GPL(device_initialize);
 
diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 70fcd0f610ea48..1e98b8c1e055a9 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -229,11 +229,10 @@ bool dma_free_from_pool(struct device *dev, void *start, size_t size);
 int dma_direct_set_offset(struct device *dev, phys_addr_t cpu_start,
 		dma_addr_t dma_start, u64 size);
 
-#ifdef CONFIG_ARCH_HAS_DMA_COHERENCE_H
-#include <asm/dma-coherence.h>
-#elif defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
+#if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
 	defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
 	defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
+extern bool dma_default_coherent;
 static inline bool dev_is_dma_coherent(struct device *dev)
 {
 	return dev->dma_coherent;
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 479fc145acfc16..77b4055087430c 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -33,9 +33,6 @@ config NEED_DMA_MAP_STATE
 config ARCH_DMA_ADDR_T_64BIT
 	def_bool 64BIT || PHYS_ADDR_T_64BIT
 
-config ARCH_HAS_DMA_COHERENCE_H
-	bool
-
 config ARCH_HAS_DMA_SET_MASK
 	bool
 
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index f87a89d086544b..84de6b1c5fab49 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -16,6 +16,8 @@
 #include "debug.h"
 #include "direct.h"
 
+bool dma_default_coherent;
+
 /*
  * Managed DMA API
  */
-- 
2.29.2

