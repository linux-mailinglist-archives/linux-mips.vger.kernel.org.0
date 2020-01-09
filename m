Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDD43135944
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2020 13:35:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730979AbgAIMeL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jan 2020 07:34:11 -0500
Received: from mx2.suse.de ([195.135.220.15]:37968 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730368AbgAIMeK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 Jan 2020 07:34:10 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id AFE54B2207;
        Thu,  9 Jan 2020 12:34:04 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 03/14] MIPS: SGI-IP27: use asm/sn/agent.h for including HUB related stuff
Date:   Thu,  9 Jan 2020 13:33:40 +0100
Message-Id: <20200109123353.5656-4-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200109123353.5656-1-tbogendoerfer@suse.de>
References: <20200109123353.5656-1-tbogendoerfer@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

By including agent.h where hub related defines/structs are needed, we
have only one place to select, which agent chip (HUB or BEDROCK) is used.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 .../include/asm/mach-ip27/kernel-entry-init.h   |  2 +-
 arch/mips/include/asm/mach-ip27/mmzone.h        |  3 ++-
 arch/mips/include/asm/mach-ip27/topology.h      |  1 -
 arch/mips/include/asm/sn/arch.h                 |  4 ++++
 arch/mips/include/asm/sn/hub.h                  | 17 -----------------
 arch/mips/include/asm/sn/types.h                |  4 ++++
 arch/mips/pci/pci-ip27.c                        |  2 +-
 arch/mips/sgi-ip27/ip27-berr.c                  |  2 +-
 arch/mips/sgi-ip27/ip27-console.c               |  2 +-
 arch/mips/sgi-ip27/ip27-hubio.c                 |  4 +++-
 arch/mips/sgi-ip27/ip27-init.c                  |  5 +----
 arch/mips/sgi-ip27/ip27-irq.c                   |  1 -
 arch/mips/sgi-ip27/ip27-klnuma.c                |  1 -
 arch/mips/sgi-ip27/ip27-memory.c                |  1 -
 arch/mips/sgi-ip27/ip27-nmi.c                   |  2 +-
 arch/mips/sgi-ip27/ip27-reset.c                 |  2 +-
 arch/mips/sgi-ip27/ip27-smp.c                   |  3 +--
 arch/mips/sgi-ip27/ip27-timer.c                 |  5 +----
 arch/mips/sgi-ip27/ip27-xtalk.c                 |  1 -
 19 files changed, 22 insertions(+), 40 deletions(-)
 delete mode 100644 arch/mips/include/asm/sn/hub.h

diff --git a/arch/mips/include/asm/mach-ip27/kernel-entry-init.h b/arch/mips/include/asm/mach-ip27/kernel-entry-init.h
index f992c1db876b..ef31d9fcf806 100644
--- a/arch/mips/include/asm/mach-ip27/kernel-entry-init.h
+++ b/arch/mips/include/asm/mach-ip27/kernel-entry-init.h
@@ -10,7 +10,7 @@
 #define __ASM_MACH_IP27_KERNEL_ENTRY_H
 
 #include <asm/sn/addrs.h>
-#include <asm/sn/sn0/hubni.h>
+#include <asm/sn/agent.h>
 #include <asm/sn/klkernvars.h>
 
 /*
diff --git a/arch/mips/include/asm/mach-ip27/mmzone.h b/arch/mips/include/asm/mach-ip27/mmzone.h
index f463826515df..534a50f79147 100644
--- a/arch/mips/include/asm/mach-ip27/mmzone.h
+++ b/arch/mips/include/asm/mach-ip27/mmzone.h
@@ -4,7 +4,8 @@
 
 #include <asm/sn/addrs.h>
 #include <asm/sn/arch.h>
-#include <asm/sn/hub.h>
+#include <asm/sn/agent.h>
+#include <asm/sn/klkernvars.h>
 
 #define pa_to_nid(addr)		NASID_GET(addr)
 
diff --git a/arch/mips/include/asm/mach-ip27/topology.h b/arch/mips/include/asm/mach-ip27/topology.h
index be61ddcdacab..3c94ffc06a70 100644
--- a/arch/mips/include/asm/mach-ip27/topology.h
+++ b/arch/mips/include/asm/mach-ip27/topology.h
@@ -2,7 +2,6 @@
 #ifndef _ASM_MACH_TOPOLOGY_H
 #define _ASM_MACH_TOPOLOGY_H	1
 
-#include <asm/sn/hub.h>
 #include <asm/sn/types.h>
 #include <asm/mmzone.h>
 
diff --git a/arch/mips/include/asm/sn/arch.h b/arch/mips/include/asm/sn/arch.h
index f8b34d34d872..afe9fcf36198 100644
--- a/arch/mips/include/asm/sn/arch.h
+++ b/arch/mips/include/asm/sn/arch.h
@@ -25,6 +25,10 @@
 #define INVALID_MODULE		(moduleid_t)-1
 #define INVALID_PARTID		(partid_t)-1
 
+#ifndef __ASSEMBLY__
+
 extern nasid_t get_nasid(void);
 
+#endif
+
 #endif /* _ASM_SN_ARCH_H */
diff --git a/arch/mips/include/asm/sn/hub.h b/arch/mips/include/asm/sn/hub.h
deleted file mode 100644
index 45878fbefbae..000000000000
--- a/arch/mips/include/asm/sn/hub.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_SN_HUB_H
-#define __ASM_SN_HUB_H
-
-#include <linux/types.h>
-#include <linux/cpumask.h>
-#include <asm/sn/types.h>
-#include <asm/sn/io.h>
-#include <asm/sn/klkernvars.h>
-#include <asm/xtalk/xtalk.h>
-
-/* ip27-hubio.c */
-extern unsigned long hub_pio_map(nasid_t nasid, xwidgetnum_t widget,
-			  unsigned long xtalk_addr, size_t size);
-extern void hub_pio_init(nasid_t nasid);
-
-#endif /* __ASM_SN_HUB_H */
diff --git a/arch/mips/include/asm/sn/types.h b/arch/mips/include/asm/sn/types.h
index 203c927e84d1..451ba1ee41ad 100644
--- a/arch/mips/include/asm/sn/types.h
+++ b/arch/mips/include/asm/sn/types.h
@@ -11,6 +11,8 @@
 
 #include <linux/types.h>
 
+#ifndef __ASSEMBLY__
+
 typedef unsigned long	cpuid_t;
 typedef signed short	nasid_t;	/* node id in numa-as-id space */
 typedef signed char	partid_t;	/* partition ID type */
@@ -18,4 +20,6 @@ typedef signed short	moduleid_t;	/* user-visible module number type */
 
 typedef dev_t		vertex_hdl_t;	/* hardware graph vertex handle */
 
+#endif
+
 #endif /* _ASM_SN_TYPES_H */
diff --git a/arch/mips/pci/pci-ip27.c b/arch/mips/pci/pci-ip27.c
index 8e26b120f994..d85cbf84e41c 100644
--- a/arch/mips/pci/pci-ip27.c
+++ b/arch/mips/pci/pci-ip27.c
@@ -10,7 +10,7 @@
 #include <asm/sn/addrs.h>
 #include <asm/sn/types.h>
 #include <asm/sn/klconfig.h>
-#include <asm/sn/hub.h>
+#include <asm/sn/agent.h>
 #include <asm/sn/ioc3.h>
 #include <asm/pci/bridge.h>
 
diff --git a/arch/mips/sgi-ip27/ip27-berr.c b/arch/mips/sgi-ip27/ip27-berr.c
index 73ad29b180fb..65635f765645 100644
--- a/arch/mips/sgi-ip27/ip27-berr.c
+++ b/arch/mips/sgi-ip27/ip27-berr.c
@@ -16,8 +16,8 @@
 
 #include <asm/ptrace.h>
 #include <asm/sn/addrs.h>
+#include <asm/sn/agent.h>
 #include <asm/sn/arch.h>
-#include <asm/sn/sn0/hub.h>
 #include <asm/tlbdebug.h>
 #include <asm/traps.h>
 #include <linux/uaccess.h>
diff --git a/arch/mips/sgi-ip27/ip27-console.c b/arch/mips/sgi-ip27/ip27-console.c
index 5886bee89d06..441b14907826 100644
--- a/arch/mips/sgi-ip27/ip27-console.c
+++ b/arch/mips/sgi-ip27/ip27-console.c
@@ -9,7 +9,7 @@
 #include <asm/page.h>
 #include <asm/setup.h>
 #include <asm/sn/addrs.h>
-#include <asm/sn/sn0/hub.h>
+#include <asm/sn/agent.h>
 #include <asm/sn/klconfig.h>
 #include <asm/sn/ioc3.h>
 #include <asm/sn/sn_private.h>
diff --git a/arch/mips/sgi-ip27/ip27-hubio.c b/arch/mips/sgi-ip27/ip27-hubio.c
index a538d0ceb61d..298cfdf8b44e 100644
--- a/arch/mips/sgi-ip27/ip27-hubio.c
+++ b/arch/mips/sgi-ip27/ip27-hubio.c
@@ -11,7 +11,9 @@
 #include <linux/mmzone.h>
 #include <asm/sn/addrs.h>
 #include <asm/sn/arch.h>
-#include <asm/sn/hub.h>
+#include <asm/sn/agent.h>
+#include <asm/sn/io.h>
+#include <asm/xtalk/xtalk.h>
 
 
 static int force_fire_and_forget = 1;
diff --git a/arch/mips/sgi-ip27/ip27-init.c b/arch/mips/sgi-ip27/ip27-init.c
index f597e1ee2df7..b8758af4c5b7 100644
--- a/arch/mips/sgi-ip27/ip27-init.c
+++ b/arch/mips/sgi-ip27/ip27-init.c
@@ -19,15 +19,12 @@
 #include <asm/pgtable.h>
 #include <asm/sgialib.h>
 #include <asm/time.h>
+#include <asm/sn/agent.h>
 #include <asm/sn/types.h>
-#include <asm/sn/sn0/addrs.h>
-#include <asm/sn/sn0/hubni.h>
-#include <asm/sn/sn0/hubio.h>
 #include <asm/sn/klconfig.h>
 #include <asm/sn/ioc3.h>
 #include <asm/mipsregs.h>
 #include <asm/sn/gda.h>
-#include <asm/sn/hub.h>
 #include <asm/sn/intr.h>
 #include <asm/current.h>
 #include <asm/processor.h>
diff --git a/arch/mips/sgi-ip27/ip27-irq.c b/arch/mips/sgi-ip27/ip27-irq.c
index c72ae330ea93..5a4a782ceae5 100644
--- a/arch/mips/sgi-ip27/ip27-irq.c
+++ b/arch/mips/sgi-ip27/ip27-irq.c
@@ -19,7 +19,6 @@
 #include <asm/sn/addrs.h>
 #include <asm/sn/agent.h>
 #include <asm/sn/arch.h>
-#include <asm/sn/hub.h>
 #include <asm/sn/intr.h>
 #include <asm/sn/irq_alloc.h>
 
diff --git a/arch/mips/sgi-ip27/ip27-klnuma.c b/arch/mips/sgi-ip27/ip27-klnuma.c
index af7b98c39dce..9c5e799bcdb9 100644
--- a/arch/mips/sgi-ip27/ip27-klnuma.c
+++ b/arch/mips/sgi-ip27/ip27-klnuma.c
@@ -16,7 +16,6 @@
 #include <asm/sn/types.h>
 #include <asm/sn/arch.h>
 #include <asm/sn/gda.h>
-#include <asm/sn/hub.h>
 #include <asm/sn/mapped_kernel.h>
 #include <asm/sn/sn_private.h>
 
diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
index a0c717662eb1..0ef2181db8d0 100644
--- a/arch/mips/sgi-ip27/ip27-memory.c
+++ b/arch/mips/sgi-ip27/ip27-memory.c
@@ -25,7 +25,6 @@
 #include <asm/sections.h>
 
 #include <asm/sn/arch.h>
-#include <asm/sn/hub.h>
 #include <asm/sn/klconfig.h>
 #include <asm/sn/sn_private.h>
 
diff --git a/arch/mips/sgi-ip27/ip27-nmi.c b/arch/mips/sgi-ip27/ip27-nmi.c
index daf3670d94e7..916e795fdac7 100644
--- a/arch/mips/sgi-ip27/ip27-nmi.c
+++ b/arch/mips/sgi-ip27/ip27-nmi.c
@@ -9,7 +9,7 @@
 #include <asm/sn/addrs.h>
 #include <asm/sn/nmi.h>
 #include <asm/sn/arch.h>
-#include <asm/sn/sn0/hub.h>
+#include <asm/sn/agent.h>
 
 #if 0
 #define NODE_NUM_CPUS(n)	CNODE_NUM_CPUS(n)
diff --git a/arch/mips/sgi-ip27/ip27-reset.c b/arch/mips/sgi-ip27/ip27-reset.c
index 74d078247e49..5ac5ad638734 100644
--- a/arch/mips/sgi-ip27/ip27-reset.c
+++ b/arch/mips/sgi-ip27/ip27-reset.c
@@ -22,9 +22,9 @@
 #include <asm/reboot.h>
 #include <asm/sgialib.h>
 #include <asm/sn/addrs.h>
+#include <asm/sn/agent.h>
 #include <asm/sn/arch.h>
 #include <asm/sn/gda.h>
-#include <asm/sn/sn0/hub.h>
 
 #include "ip27-common.h"
 
diff --git a/arch/mips/sgi-ip27/ip27-smp.c b/arch/mips/sgi-ip27/ip27-smp.c
index de3711e9b1ba..1ae053ecf75c 100644
--- a/arch/mips/sgi-ip27/ip27-smp.c
+++ b/arch/mips/sgi-ip27/ip27-smp.c
@@ -15,6 +15,7 @@
 #include <asm/page.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
+#include <asm/sn/agent.h>
 #include <asm/sn/arch.h>
 #include <asm/sn/gda.h>
 #include <asm/sn/intr.h>
@@ -23,8 +24,6 @@
 #include <asm/sn/mapped_kernel.h>
 #include <asm/sn/sn_private.h>
 #include <asm/sn/types.h>
-#include <asm/sn/sn0/hubpi.h>
-#include <asm/sn/sn0/hubio.h>
 #include <asm/sn/sn0/ip27.h>
 
 #include "ip27-common.h"
diff --git a/arch/mips/sgi-ip27/ip27-timer.c b/arch/mips/sgi-ip27/ip27-timer.c
index d53a29070e12..1b285c042ca7 100644
--- a/arch/mips/sgi-ip27/ip27-timer.c
+++ b/arch/mips/sgi-ip27/ip27-timer.c
@@ -25,17 +25,14 @@
 #include <asm/sn/klconfig.h>
 #include <asm/sn/arch.h>
 #include <asm/sn/addrs.h>
+#include <asm/sn/agent.h>
 #include <asm/sn/sn_private.h>
 #include <asm/sn/sn0/ip27.h>
-#include <asm/sn/sn0/hub.h>
 
 #define TICK_SIZE (tick_nsec / 1000)
 
 /* Includes for ioc3_init().  */
 #include <asm/sn/types.h>
-#include <asm/sn/sn0/addrs.h>
-#include <asm/sn/sn0/hubni.h>
-#include <asm/sn/sn0/hubio.h>
 #include <asm/pci/bridge.h>
 
 #include "ip27-common.h"
diff --git a/arch/mips/sgi-ip27/ip27-xtalk.c b/arch/mips/sgi-ip27/ip27-xtalk.c
index 5218b900f855..000ede156bdc 100644
--- a/arch/mips/sgi-ip27/ip27-xtalk.c
+++ b/arch/mips/sgi-ip27/ip27-xtalk.c
@@ -15,7 +15,6 @@
 #include <asm/sn/addrs.h>
 #include <asm/sn/types.h>
 #include <asm/sn/klconfig.h>
-#include <asm/sn/hub.h>
 #include <asm/pci/bridge.h>
 #include <asm/xtalk/xtalk.h>
 
-- 
2.24.1

