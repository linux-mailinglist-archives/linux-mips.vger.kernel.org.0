Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D76F13595B
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2020 13:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729143AbgAIMe4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jan 2020 07:34:56 -0500
Received: from mx2.suse.de ([195.135.220.15]:37960 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730942AbgAIMeJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 Jan 2020 07:34:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 17702B2209;
        Thu,  9 Jan 2020 12:34:05 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/14] MIPS: SGI-IP27: get rid of asm/sn/sn0/ip27.h
Date:   Thu,  9 Jan 2020 13:33:41 +0100
Message-Id: <20200109123353.5656-5-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200109123353.5656-1-tbogendoerfer@suse.de>
References: <20200109123353.5656-1-tbogendoerfer@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The only piece needed in ip27.h is SEND_NMI. Move the define to the only
place where it's used and remove ip27.h

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/include/asm/sn/sn0/ip27.h | 85 -----------------------------
 arch/mips/sgi-ip27/ip27-init.c      |  1 -
 arch/mips/sgi-ip27/ip27-nmi.c       |  3 +
 arch/mips/sgi-ip27/ip27-smp.c       |  1 -
 arch/mips/sgi-ip27/ip27-timer.c     |  1 -
 5 files changed, 3 insertions(+), 88 deletions(-)
 delete mode 100644 arch/mips/include/asm/sn/sn0/ip27.h

diff --git a/arch/mips/include/asm/sn/sn0/ip27.h b/arch/mips/include/asm/sn/sn0/ip27.h
deleted file mode 100644
index 3b5efeefcc3f..000000000000
--- a/arch/mips/include/asm/sn/sn0/ip27.h
+++ /dev/null
@@ -1,85 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Derived from IRIX <sys/SN/SN0/IP27.h>.
- *
- * Copyright (C) 1992 - 1997, 1999 Silicon Graphics, Inc.
- * Copyright (C) 1999, 2006 by Ralf Baechle
- */
-#ifndef _ASM_SN_SN0_IP27_H
-#define _ASM_SN_SN0_IP27_H
-
-#include <asm/mipsregs.h>
-
-/*
- * Simple definitions for the masks which remove SW bits from pte.
- */
-
-#define TLBLO_HWBITSHIFT	0		/* Shift value, for masking */
-
-#ifndef __ASSEMBLY__
-
-#define CAUSE_BERRINTR		IE_IRQ5
-
-#define ECCF_CACHE_ERR	0
-#define ECCF_TAGLO	1
-#define ECCF_ECC	2
-#define ECCF_ERROREPC	3
-#define ECCF_PADDR	4
-#define ECCF_SIZE	(5 * sizeof(long))
-
-#endif /* !__ASSEMBLY__ */
-
-#ifdef __ASSEMBLY__
-
-/*
- * KL_GET_CPUNUM (similar to EV_GET_SPNUM for EVEREST platform) reads
- * the processor number of the calling processor.  The proc parameters
- * must be a register.
- */
-#define KL_GET_CPUNUM(proc)				\
-	dli	proc, LOCAL_HUB(0);			\
-	ld	proc, PI_CPU_NUM(proc)
-
-#endif /* __ASSEMBLY__ */
-
-/*
- * R10000 status register interrupt bit mask usage for IP27.
- */
-#define SRB_SWTIMO	IE_SW0		/* 0x0100 */
-#define SRB_NET		IE_SW1		/* 0x0200 */
-#define SRB_DEV0	IE_IRQ0		/* 0x0400 */
-#define SRB_DEV1	IE_IRQ1		/* 0x0800 */
-#define SRB_TIMOCLK	IE_IRQ2		/* 0x1000 */
-#define SRB_PROFCLK	IE_IRQ3		/* 0x2000 */
-#define SRB_ERR		IE_IRQ4		/* 0x4000 */
-#define SRB_SCHEDCLK	IE_IRQ5		/* 0x8000 */
-
-#define SR_IBIT_HI	SRB_DEV0
-#define SR_IBIT_PROF	SRB_PROFCLK
-
-#define SRB_SWTIMO_IDX		0
-#define SRB_NET_IDX		1
-#define SRB_DEV0_IDX		2
-#define SRB_DEV1_IDX		3
-#define SRB_TIMOCLK_IDX		4
-#define SRB_PROFCLK_IDX		5
-#define SRB_ERR_IDX		6
-#define SRB_SCHEDCLK_IDX	7
-
-#define NUM_CAUSE_INTRS		8
-
-#define SCACHE_LINESIZE 128
-#define SCACHE_LINEMASK (SCACHE_LINESIZE - 1)
-
-#include <asm/sn/addrs.h>
-
-#define LED_CYCLE_MASK	0x0f
-#define LED_CYCLE_SHFT	4
-
-#define SEND_NMI(_nasid, _slice)	\
-	  REMOTE_HUB_S((_nasid),  (PI_NMI_A + ((_slice) * PI_NMI_OFFSET)), 1)
-
-#endif /* _ASM_SN_SN0_IP27_H */
diff --git a/arch/mips/sgi-ip27/ip27-init.c b/arch/mips/sgi-ip27/ip27-init.c
index b8758af4c5b7..484db3b73b7d 100644
--- a/arch/mips/sgi-ip27/ip27-init.c
+++ b/arch/mips/sgi-ip27/ip27-init.c
@@ -32,7 +32,6 @@
 #include <asm/thread_info.h>
 #include <asm/sn/launch.h>
 #include <asm/sn/sn_private.h>
-#include <asm/sn/sn0/ip27.h>
 #include <asm/sn/mapped_kernel.h>
 
 #include "ip27-common.h"
diff --git a/arch/mips/sgi-ip27/ip27-nmi.c b/arch/mips/sgi-ip27/ip27-nmi.c
index 916e795fdac7..84889b57d5ff 100644
--- a/arch/mips/sgi-ip27/ip27-nmi.c
+++ b/arch/mips/sgi-ip27/ip27-nmi.c
@@ -17,6 +17,9 @@
 #define NODE_NUM_CPUS(n)	CPUS_PER_NODE
 #endif
 
+#define SEND_NMI(_nasid, _slice)	\
+	REMOTE_HUB_S((_nasid),  (PI_NMI_A + ((_slice) * PI_NMI_OFFSET)), 1)
+
 typedef unsigned long machreg_t;
 
 static arch_spinlock_t nmi_lock = __ARCH_SPIN_LOCK_UNLOCKED;
diff --git a/arch/mips/sgi-ip27/ip27-smp.c b/arch/mips/sgi-ip27/ip27-smp.c
index 1ae053ecf75c..0f6df00ca00f 100644
--- a/arch/mips/sgi-ip27/ip27-smp.c
+++ b/arch/mips/sgi-ip27/ip27-smp.c
@@ -24,7 +24,6 @@
 #include <asm/sn/mapped_kernel.h>
 #include <asm/sn/sn_private.h>
 #include <asm/sn/types.h>
-#include <asm/sn/sn0/ip27.h>
 
 #include "ip27-common.h"
 
diff --git a/arch/mips/sgi-ip27/ip27-timer.c b/arch/mips/sgi-ip27/ip27-timer.c
index 1b285c042ca7..62c7da59f55a 100644
--- a/arch/mips/sgi-ip27/ip27-timer.c
+++ b/arch/mips/sgi-ip27/ip27-timer.c
@@ -27,7 +27,6 @@
 #include <asm/sn/addrs.h>
 #include <asm/sn/agent.h>
 #include <asm/sn/sn_private.h>
-#include <asm/sn/sn0/ip27.h>
 
 #define TICK_SIZE (tick_nsec / 1000)
 
-- 
2.24.1

