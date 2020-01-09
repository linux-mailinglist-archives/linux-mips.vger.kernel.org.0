Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A52B135951
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2020 13:35:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731047AbgAIMeg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jan 2020 07:34:36 -0500
Received: from mx2.suse.de ([195.135.220.15]:38032 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730971AbgAIMeL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 Jan 2020 07:34:11 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id C8582B2212;
        Thu,  9 Jan 2020 12:34:06 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 11/14] MIPS: SGI-IP27: Move all shared IP27 declarations to ip27-common.h
Date:   Thu,  9 Jan 2020 13:33:48 +0100
Message-Id: <20200109123353.5656-12-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200109123353.5656-1-tbogendoerfer@suse.de>
References: <20200109123353.5656-1-tbogendoerfer@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Move all IP27 declarations into one file.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/include/asm/sn/sn_private.h | 19 -------------------
 arch/mips/sgi-ip27/ip27-common.h      | 13 ++++++++++++-
 arch/mips/sgi-ip27/ip27-console.c     |  3 ++-
 arch/mips/sgi-ip27/ip27-init.c        |  1 -
 arch/mips/sgi-ip27/ip27-klnuma.c      |  3 ++-
 arch/mips/sgi-ip27/ip27-memory.c      |  2 +-
 arch/mips/sgi-ip27/ip27-smp.c         |  1 -
 arch/mips/sgi-ip27/ip27-timer.c       |  3 ++-
 8 files changed, 19 insertions(+), 26 deletions(-)
 delete mode 100644 arch/mips/include/asm/sn/sn_private.h

diff --git a/arch/mips/include/asm/sn/sn_private.h b/arch/mips/include/asm/sn/sn_private.h
deleted file mode 100644
index 63a2c30d81c6..000000000000
--- a/arch/mips/include/asm/sn/sn_private.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_SN_SN_PRIVATE_H
-#define __ASM_SN_SN_PRIVATE_H
-
-#include <asm/sn/types.h>
-
-extern nasid_t master_nasid;
-
-extern void cpu_node_probe(void);
-extern void hub_rtc_init(nasid_t nasid);
-extern void cpu_time_init(void);
-extern void per_cpu_init(void);
-extern void install_cpu_nmi_handler(int slice);
-extern void install_ipi(void);
-extern void setup_replication_mask(void);
-extern void replicate_kernel_text(void);
-extern unsigned long node_getfirstfree(nasid_t nasid);
-
-#endif /* __ASM_SN_SN_PRIVATE_H */
diff --git a/arch/mips/sgi-ip27/ip27-common.h b/arch/mips/sgi-ip27/ip27-common.h
index 3ffbcf9bfd41..cdebf1726e4a 100644
--- a/arch/mips/sgi-ip27/ip27-common.h
+++ b/arch/mips/sgi-ip27/ip27-common.h
@@ -3,8 +3,19 @@
 #ifndef __IP27_COMMON_H
 #define __IP27_COMMON_H
 
-extern void ip27_reboot_setup(void);
+extern nasid_t master_nasid;
+
+extern void cpu_node_probe(void);
+extern void cpu_time_init(void);
 extern void hub_rt_clock_event_init(void);
+extern void hub_rtc_init(nasid_t nasid);
+extern void install_cpu_nmi_handler(int slice);
+extern void install_ipi(void);
+extern void ip27_reboot_setup(void);
 extern const struct plat_smp_ops ip27_smp_ops;
+extern unsigned long node_getfirstfree(nasid_t nasid);
+extern void per_cpu_init(void);
+extern void replicate_kernel_text(void);
+extern void setup_replication_mask(void);
 
 #endif /* __IP27_COMMON_H */
diff --git a/arch/mips/sgi-ip27/ip27-console.c b/arch/mips/sgi-ip27/ip27-console.c
index 441b14907826..7737a88c6569 100644
--- a/arch/mips/sgi-ip27/ip27-console.c
+++ b/arch/mips/sgi-ip27/ip27-console.c
@@ -12,11 +12,12 @@
 #include <asm/sn/agent.h>
 #include <asm/sn/klconfig.h>
 #include <asm/sn/ioc3.h>
-#include <asm/sn/sn_private.h>
 
 #include <linux/serial.h>
 #include <linux/serial_core.h>
 
+#include "ip27-common.h"
+
 #define IOC3_CLK	(22000000 / 3)
 #define IOC3_FLAGS	(0)
 
diff --git a/arch/mips/sgi-ip27/ip27-init.c b/arch/mips/sgi-ip27/ip27-init.c
index a2da78bc9f76..9822f7a8ad62 100644
--- a/arch/mips/sgi-ip27/ip27-init.c
+++ b/arch/mips/sgi-ip27/ip27-init.c
@@ -31,7 +31,6 @@
 #include <asm/mmu_context.h>
 #include <asm/thread_info.h>
 #include <asm/sn/launch.h>
-#include <asm/sn/sn_private.h>
 #include <asm/sn/mapped_kernel.h>
 
 #include "ip27-common.h"
diff --git a/arch/mips/sgi-ip27/ip27-klnuma.c b/arch/mips/sgi-ip27/ip27-klnuma.c
index 9c5e799bcdb9..abd7a84df7dd 100644
--- a/arch/mips/sgi-ip27/ip27-klnuma.c
+++ b/arch/mips/sgi-ip27/ip27-klnuma.c
@@ -17,7 +17,8 @@
 #include <asm/sn/arch.h>
 #include <asm/sn/gda.h>
 #include <asm/sn/mapped_kernel.h>
-#include <asm/sn/sn_private.h>
+
+#include "ip27-common.h"
 
 static nodemask_t ktext_repmask;
 
diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
index db3759e551b3..a45691e6ab90 100644
--- a/arch/mips/sgi-ip27/ip27-memory.c
+++ b/arch/mips/sgi-ip27/ip27-memory.c
@@ -27,8 +27,8 @@
 #include <asm/sn/arch.h>
 #include <asm/sn/agent.h>
 #include <asm/sn/klconfig.h>
-#include <asm/sn/sn_private.h>
 
+#include "ip27-common.h"
 
 #define SLOT_PFNSHIFT		(SLOT_SHIFT - PAGE_SHIFT)
 #define PFN_NASIDSHFT		(NASID_SHFT - PAGE_SHIFT)
diff --git a/arch/mips/sgi-ip27/ip27-smp.c b/arch/mips/sgi-ip27/ip27-smp.c
index 0f6df00ca00f..3966716835ea 100644
--- a/arch/mips/sgi-ip27/ip27-smp.c
+++ b/arch/mips/sgi-ip27/ip27-smp.c
@@ -22,7 +22,6 @@
 #include <asm/sn/klconfig.h>
 #include <asm/sn/launch.h>
 #include <asm/sn/mapped_kernel.h>
-#include <asm/sn/sn_private.h>
 #include <asm/sn/types.h>
 
 #include "ip27-common.h"
diff --git a/arch/mips/sgi-ip27/ip27-timer.c b/arch/mips/sgi-ip27/ip27-timer.c
index 62c7da59f55a..9cbbf326fe01 100644
--- a/arch/mips/sgi-ip27/ip27-timer.c
+++ b/arch/mips/sgi-ip27/ip27-timer.c
@@ -26,7 +26,8 @@
 #include <asm/sn/arch.h>
 #include <asm/sn/addrs.h>
 #include <asm/sn/agent.h>
-#include <asm/sn/sn_private.h>
+
+#include "ip27-common.h"
 
 #define TICK_SIZE (tick_nsec / 1000)
 
-- 
2.24.1

