Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0F513594E
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2020 13:35:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730978AbgAIMec (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jan 2020 07:34:32 -0500
Received: from mx2.suse.de ([195.135.220.15]:38024 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730965AbgAIMeL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 Jan 2020 07:34:11 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id CB15EB220D;
        Thu,  9 Jan 2020 12:34:05 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 07/14] MIPS: SGI-IP27: Split kldir.h into generic SN and IP27 parts
Date:   Thu,  9 Jan 2020 13:33:44 +0100
Message-Id: <20200109123353.5656-8-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200109123353.5656-1-tbogendoerfer@suse.de>
References: <20200109123353.5656-1-tbogendoerfer@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGI-IP35 uses slightly different memory layout, so we move IP27
defines to IP27 specific files and keep the common stuff in kldir.h

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/include/asm/sn/kldir.h     | 193 +--------------------------
 arch/mips/include/asm/sn/sn0/kldir.h | 186 ++++++++++++++++++++++++++
 2 files changed, 192 insertions(+), 187 deletions(-)
 create mode 100644 arch/mips/include/asm/sn/sn0/kldir.h

diff --git a/arch/mips/include/asm/sn/kldir.h b/arch/mips/include/asm/sn/kldir.h
index bfb3aec94539..245f59bf3845 100644
--- a/arch/mips/include/asm/sn/kldir.h
+++ b/arch/mips/include/asm/sn/kldir.h
@@ -1,201 +1,16 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Derived from IRIX <sys/SN/kldir.h>, revision 1.21.
- *
- * Copyright (C) 1992 - 1997, 1999, 2000 Silicon Graphics, Inc.
- * Copyright (C) 1999, 2000 by Ralf Baechle
- */
+/* SPDX-License-Identifier: GPL-2.0 */
+
 #ifndef _ASM_SN_KLDIR_H
 #define _ASM_SN_KLDIR_H
 
-
-/*
- * The kldir memory area resides at a fixed place in each node's memory and
- * provides pointers to most other IP27 memory areas.  This allows us to
- * resize and/or relocate memory areas at a later time without breaking all
- * firmware and kernels that use them.	Indices in the array are
- * permanently dedicated to areas listed below.	 Some memory areas (marked
- * below) reside at a permanently fixed location, but are included in the
- * directory for completeness.
- */
-
 #define KLDIR_MAGIC		0x434d5f53505f5357
 
-/*
- * The upper portion of the memory map applies during boot
- * only and is overwritten by IRIX/SYMMON.
- *
- *				      MEMORY MAP PER NODE
- *
- * 0x2000000 (32M)	   +-----------------------------------------+
- *			   |	  IO6 BUFFERS FOR FLASH ENET IOC3    |
- * 0x1F80000 (31.5M)	   +-----------------------------------------+
- *			   |	  IO6 TEXT/DATA/BSS/stack	     |
- * 0x1C00000 (30M)	   +-----------------------------------------+
- *			   |	  IO6 PROM DEBUG TEXT/DATA/BSS/stack |
- * 0x0800000 (28M)	   +-----------------------------------------+
- *			   |	  IP27 PROM TEXT/DATA/BSS/stack	     |
- * 0x1B00000 (27M)	   +-----------------------------------------+
- *			   |	  IP27 CFG			     |
- * 0x1A00000 (26M)	   +-----------------------------------------+
- *			   |	  Graphics PROM			     |
- * 0x1800000 (24M)	   +-----------------------------------------+
- *			   |	  3rd Party PROM drivers	     |
- * 0x1600000 (22M)	   +-----------------------------------------+
- *			   |					     |
- *			   |	  Free				     |
- *			   |					     |
- *			   +-----------------------------------------+
- *			   |	  UNIX DEBUG Version		     |
- * 0x190000 (2M--)	   +-----------------------------------------+
- *			   |	  SYMMON			     |
- *			   |	  (For UNIX Debug only)		     |
- * 0x34000 (208K)	   +-----------------------------------------+
- *			   |	  SYMMON STACK [NUM_CPU_PER_NODE]    |
- *			   |	  (For UNIX Debug only)		     |
- * 0x25000 (148K)	   +-----------------------------------------+
- *			   |	  KLCONFIG - II (temp)		     |
- *			   |					     |
- *			   |	----------------------------	     |
- *			   |					     |
- *			   |	  UNIX NON-DEBUG Version	     |
- * 0x19000 (100K)	   +-----------------------------------------+
- *
- *
- * The lower portion of the memory map contains information that is
- * permanent and is used by the IP27PROM, IO6PROM and IRIX.
- *
- * 0x19000 (100K)	   +-----------------------------------------+
- *			   |					     |
- *			   |	  PI Error Spools (32K)		     |
- *			   |					     |
- * 0x12000 (72K)	   +-----------------------------------------+
- *			   |	  Unused			     |
- * 0x11c00 (71K)	   +-----------------------------------------+
- *			   |	  CPU 1 NMI Eframe area		     |
- * 0x11a00 (70.5K)	   +-----------------------------------------+
- *			   |	  CPU 0 NMI Eframe area		     |
- * 0x11800 (70K)	   +-----------------------------------------+
- *			   |	  CPU 1 NMI Register save area	     |
- * 0x11600 (69.5K)	   +-----------------------------------------+
- *			   |	  CPU 0 NMI Register save area	     |
- * 0x11400 (69K)	   +-----------------------------------------+
- *			   |	  GDA (1k)			     |
- * 0x11000 (68K)	   +-----------------------------------------+
- *			   |	  Early cache Exception stack	     |
- *			   |		 and/or			     |
- *			   |	  kernel/io6prom nmi registers	     |
- * 0x10800  (66k)	   +-----------------------------------------+
- *			   |	  cache error eframe		     |
- * 0x10400 (65K)	   +-----------------------------------------+
- *			   |	  Exception Handlers (UALIAS copy)   |
- * 0x10000 (64K)	   +-----------------------------------------+
- *			   |					     |
- *			   |					     |
- *			   |	  KLCONFIG - I (permanent) (48K)     |
- *			   |					     |
- *			   |					     |
- *			   |					     |
- * 0x4000 (16K)		   +-----------------------------------------+
- *			   |	  NMI Handler (Protected Page)	     |
- * 0x3000 (12K)		   +-----------------------------------------+
- *			   |	  ARCS PVECTORS (master node only)   |
- * 0x2c00 (11K)		   +-----------------------------------------+
- *			   |	  ARCS TVECTORS (master node only)   |
- * 0x2800 (10K)		   +-----------------------------------------+
- *			   |	  LAUNCH [NUM_CPU]		     |
- * 0x2400 (9K)		   +-----------------------------------------+
- *			   |	  Low memory directory (KLDIR)	     |
- * 0x2000 (8K)		   +-----------------------------------------+
- *			   |	  ARCS SPB (1K)			     |
- * 0x1000 (4K)		   +-----------------------------------------+
- *			   |	  Early cache Exception stack	     |
- *			   |		 and/or			     |
- *			   |	  kernel/io6prom nmi registers	     |
- * 0x800  (2k)		   +-----------------------------------------+
- *			   |	  cache error eframe		     |
- * 0x400 (1K)		   +-----------------------------------------+
- *			   |	  Exception Handlers		     |
- * 0x0	 (0K)		   +-----------------------------------------+
- */
-
-#ifdef __ASSEMBLY__
 #define KLDIR_OFF_MAGIC			0x00
 #define KLDIR_OFF_OFFSET		0x08
 #define KLDIR_OFF_POINTER		0x10
 #define KLDIR_OFF_SIZE			0x18
 #define KLDIR_OFF_COUNT			0x20
 #define KLDIR_OFF_STRIDE		0x28
-#endif /* __ASSEMBLY__ */
-
-/*
- * This is defined here because IP27_SYMMON_STK_SIZE must be at least what
- * we define here.  Since it's set up in the prom.  We can't redefine it later
- * and expect more space to be allocated.  The way to find out the true size
- * of the symmon stacks is to divide SYMMON_STK_SIZE by SYMMON_STK_STRIDE
- * for a particular node.
- */
-#define SYMMON_STACK_SIZE		0x8000
-
-#if defined(PROM)
-
-/*
- * These defines are prom version dependent.  No code other than the IP27
- * prom should attempt to use these values.
- */
-#define IP27_LAUNCH_OFFSET		0x2400
-#define IP27_LAUNCH_SIZE		0x400
-#define IP27_LAUNCH_COUNT		2
-#define IP27_LAUNCH_STRIDE		0x200
-
-#define IP27_KLCONFIG_OFFSET		0x4000
-#define IP27_KLCONFIG_SIZE		0xc000
-#define IP27_KLCONFIG_COUNT		1
-#define IP27_KLCONFIG_STRIDE		0
-
-#define IP27_NMI_OFFSET			0x3000
-#define IP27_NMI_SIZE			0x40
-#define IP27_NMI_COUNT			2
-#define IP27_NMI_STRIDE			0x40
-
-#define IP27_PI_ERROR_OFFSET		0x12000
-#define IP27_PI_ERROR_SIZE		0x4000
-#define IP27_PI_ERROR_COUNT		1
-#define IP27_PI_ERROR_STRIDE		0
-
-#define IP27_SYMMON_STK_OFFSET		0x25000
-#define IP27_SYMMON_STK_SIZE		0xe000
-#define IP27_SYMMON_STK_COUNT		2
-/* IP27_SYMMON_STK_STRIDE must be >= SYMMON_STACK_SIZE */
-#define IP27_SYMMON_STK_STRIDE		0x7000
-
-#define IP27_FREEMEM_OFFSET		0x19000
-#define IP27_FREEMEM_SIZE		-1
-#define IP27_FREEMEM_COUNT		1
-#define IP27_FREEMEM_STRIDE		0
-
-#endif /* PROM */
-/*
- * There will be only one of these in a partition so the IO6 must set it up.
- */
-#define IO6_GDA_OFFSET			0x11000
-#define IO6_GDA_SIZE			0x400
-#define IO6_GDA_COUNT			1
-#define IO6_GDA_STRIDE			0
-
-/*
- * save area of kernel nmi regs in the prom format
- */
-#define IP27_NMI_KREGS_OFFSET		0x11400
-#define IP27_NMI_KREGS_CPU_SIZE		0x200
-/*
- * save area of kernel nmi regs in eframe format
- */
-#define IP27_NMI_EFRAME_OFFSET		0x11800
-#define IP27_NMI_EFRAME_SIZE		0x200
 
 #define KLDIR_ENT_SIZE			0x40
 #define KLDIR_MAX_ENTRIES		(0x400 / 0x40)
@@ -214,4 +29,8 @@ typedef struct kldir_ent_s {
 } kldir_ent_t;
 #endif /* !__ASSEMBLY__ */
 
+#ifdef CONFIG_SGI_IP27
+#include <asm/sn/sn0/kldir.h>
+#endif
+
 #endif /* _ASM_SN_KLDIR_H */
diff --git a/arch/mips/include/asm/sn/sn0/kldir.h b/arch/mips/include/asm/sn/sn0/kldir.h
new file mode 100644
index 000000000000..1b10af6cbd5e
--- /dev/null
+++ b/arch/mips/include/asm/sn/sn0/kldir.h
@@ -0,0 +1,186 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Derived from IRIX <sys/SN/kldir.h>, revision 1.21.
+ *
+ * Copyright (C) 1992 - 1997, 1999, 2000 Silicon Graphics, Inc.
+ * Copyright (C) 1999, 2000 by Ralf Baechle
+ */
+#ifndef _ASM_SN_SN0_KLDIR_H
+#define _ASM_SN_SN0_KLDIR_H
+
+
+/*
+ * The kldir memory area resides at a fixed place in each node's memory and
+ * provides pointers to most other IP27 memory areas.  This allows us to
+ * resize and/or relocate memory areas at a later time without breaking all
+ * firmware and kernels that use them.	Indices in the array are
+ * permanently dedicated to areas listed below.	 Some memory areas (marked
+ * below) reside at a permanently fixed location, but are included in the
+ * directory for completeness.
+ */
+
+/*
+ * The upper portion of the memory map applies during boot
+ * only and is overwritten by IRIX/SYMMON.
+ *
+ *				      MEMORY MAP PER NODE
+ *
+ * 0x2000000 (32M)	   +-----------------------------------------+
+ *			   |	  IO6 BUFFERS FOR FLASH ENET IOC3    |
+ * 0x1F80000 (31.5M)	   +-----------------------------------------+
+ *			   |	  IO6 TEXT/DATA/BSS/stack	     |
+ * 0x1C00000 (30M)	   +-----------------------------------------+
+ *			   |	  IO6 PROM DEBUG TEXT/DATA/BSS/stack |
+ * 0x0800000 (28M)	   +-----------------------------------------+
+ *			   |	  IP27 PROM TEXT/DATA/BSS/stack	     |
+ * 0x1B00000 (27M)	   +-----------------------------------------+
+ *			   |	  IP27 CFG			     |
+ * 0x1A00000 (26M)	   +-----------------------------------------+
+ *			   |	  Graphics PROM			     |
+ * 0x1800000 (24M)	   +-----------------------------------------+
+ *			   |	  3rd Party PROM drivers	     |
+ * 0x1600000 (22M)	   +-----------------------------------------+
+ *			   |					     |
+ *			   |	  Free				     |
+ *			   |					     |
+ *			   +-----------------------------------------+
+ *			   |	  UNIX DEBUG Version		     |
+ * 0x190000 (2M--)	   +-----------------------------------------+
+ *			   |	  SYMMON			     |
+ *			   |	  (For UNIX Debug only)		     |
+ * 0x34000 (208K)	   +-----------------------------------------+
+ *			   |	  SYMMON STACK [NUM_CPU_PER_NODE]    |
+ *			   |	  (For UNIX Debug only)		     |
+ * 0x25000 (148K)	   +-----------------------------------------+
+ *			   |	  KLCONFIG - II (temp)		     |
+ *			   |					     |
+ *			   |	----------------------------	     |
+ *			   |					     |
+ *			   |	  UNIX NON-DEBUG Version	     |
+ * 0x19000 (100K)	   +-----------------------------------------+
+ *
+ *
+ * The lower portion of the memory map contains information that is
+ * permanent and is used by the IP27PROM, IO6PROM and IRIX.
+ *
+ * 0x19000 (100K)	   +-----------------------------------------+
+ *			   |					     |
+ *			   |	  PI Error Spools (32K)		     |
+ *			   |					     |
+ * 0x12000 (72K)	   +-----------------------------------------+
+ *			   |	  Unused			     |
+ * 0x11c00 (71K)	   +-----------------------------------------+
+ *			   |	  CPU 1 NMI Eframe area		     |
+ * 0x11a00 (70.5K)	   +-----------------------------------------+
+ *			   |	  CPU 0 NMI Eframe area		     |
+ * 0x11800 (70K)	   +-----------------------------------------+
+ *			   |	  CPU 1 NMI Register save area	     |
+ * 0x11600 (69.5K)	   +-----------------------------------------+
+ *			   |	  CPU 0 NMI Register save area	     |
+ * 0x11400 (69K)	   +-----------------------------------------+
+ *			   |	  GDA (1k)			     |
+ * 0x11000 (68K)	   +-----------------------------------------+
+ *			   |	  Early cache Exception stack	     |
+ *			   |		 and/or			     |
+ *			   |	  kernel/io6prom nmi registers	     |
+ * 0x10800  (66k)	   +-----------------------------------------+
+ *			   |	  cache error eframe		     |
+ * 0x10400 (65K)	   +-----------------------------------------+
+ *			   |	  Exception Handlers (UALIAS copy)   |
+ * 0x10000 (64K)	   +-----------------------------------------+
+ *			   |					     |
+ *			   |					     |
+ *			   |	  KLCONFIG - I (permanent) (48K)     |
+ *			   |					     |
+ *			   |					     |
+ *			   |					     |
+ * 0x4000 (16K)		   +-----------------------------------------+
+ *			   |	  NMI Handler (Protected Page)	     |
+ * 0x3000 (12K)		   +-----------------------------------------+
+ *			   |	  ARCS PVECTORS (master node only)   |
+ * 0x2c00 (11K)		   +-----------------------------------------+
+ *			   |	  ARCS TVECTORS (master node only)   |
+ * 0x2800 (10K)		   +-----------------------------------------+
+ *			   |	  LAUNCH [NUM_CPU]		     |
+ * 0x2400 (9K)		   +-----------------------------------------+
+ *			   |	  Low memory directory (KLDIR)	     |
+ * 0x2000 (8K)		   +-----------------------------------------+
+ *			   |	  ARCS SPB (1K)			     |
+ * 0x1000 (4K)		   +-----------------------------------------+
+ *			   |	  Early cache Exception stack	     |
+ *			   |		 and/or			     |
+ *			   |	  kernel/io6prom nmi registers	     |
+ * 0x800  (2k)		   +-----------------------------------------+
+ *			   |	  cache error eframe		     |
+ * 0x400 (1K)		   +-----------------------------------------+
+ *			   |	  Exception Handlers		     |
+ * 0x0	 (0K)		   +-----------------------------------------+
+ */
+
+/*
+ * This is defined here because IP27_SYMMON_STK_SIZE must be at least what
+ * we define here.  Since it's set up in the prom.  We can't redefine it later
+ * and expect more space to be allocated.  The way to find out the true size
+ * of the symmon stacks is to divide SYMMON_STK_SIZE by SYMMON_STK_STRIDE
+ * for a particular node.
+ */
+#define SYMMON_STACK_SIZE		0x8000
+
+#if defined(PROM)
+
+/*
+ * These defines are prom version dependent.  No code other than the IP27
+ * prom should attempt to use these values.
+ */
+#define IP27_LAUNCH_OFFSET		0x2400
+#define IP27_LAUNCH_SIZE		0x400
+#define IP27_LAUNCH_COUNT		2
+#define IP27_LAUNCH_STRIDE		0x200
+
+#define IP27_KLCONFIG_OFFSET		0x4000
+#define IP27_KLCONFIG_SIZE		0xc000
+#define IP27_KLCONFIG_COUNT		1
+#define IP27_KLCONFIG_STRIDE		0
+
+#define IP27_NMI_OFFSET			0x3000
+#define IP27_NMI_SIZE			0x40
+#define IP27_NMI_COUNT			2
+#define IP27_NMI_STRIDE			0x40
+
+#define IP27_PI_ERROR_OFFSET		0x12000
+#define IP27_PI_ERROR_SIZE		0x4000
+#define IP27_PI_ERROR_COUNT		1
+#define IP27_PI_ERROR_STRIDE		0
+
+#define IP27_SYMMON_STK_OFFSET		0x25000
+#define IP27_SYMMON_STK_SIZE		0xe000
+#define IP27_SYMMON_STK_COUNT		2
+/* IP27_SYMMON_STK_STRIDE must be >= SYMMON_STACK_SIZE */
+#define IP27_SYMMON_STK_STRIDE		0x7000
+
+#define IP27_FREEMEM_OFFSET		0x19000
+#define IP27_FREEMEM_SIZE		-1
+#define IP27_FREEMEM_COUNT		1
+#define IP27_FREEMEM_STRIDE		0
+
+#endif /* PROM */
+/*
+ * There will be only one of these in a partition so the IO6 must set it up.
+ */
+#define IO6_GDA_OFFSET			0x11000
+#define IO6_GDA_SIZE			0x400
+#define IO6_GDA_COUNT			1
+#define IO6_GDA_STRIDE			0
+
+/*
+ * save area of kernel nmi regs in the prom format
+ */
+#define IP27_NMI_KREGS_OFFSET		0x11400
+#define IP27_NMI_KREGS_CPU_SIZE		0x200
+/*
+ * save area of kernel nmi regs in eframe format
+ */
+#define IP27_NMI_EFRAME_OFFSET		0x11800
+#define IP27_NMI_EFRAME_SIZE		0x200
+
+#endif /* _ASM_SN_SN0_KLDIR_H */
-- 
2.24.1

