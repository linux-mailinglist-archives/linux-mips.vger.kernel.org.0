Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3958E0865
	for <lists+linux-mips@lfdr.de>; Tue, 22 Oct 2019 18:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389253AbfJVQNW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Oct 2019 12:13:22 -0400
Received: from mx2.suse.de ([195.135.220.15]:59766 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732118AbfJVQNW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 22 Oct 2019 12:13:22 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id BA110B383;
        Tue, 22 Oct 2019 16:13:20 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] MIPS: SGI-IP27: collect externs in new header file
Date:   Tue, 22 Oct 2019 18:13:11 +0200
Message-Id: <20191022161315.4194-1-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

IP27 code has a few externs distributed over .c files. Collect them
together into one commcon header file.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/sgi-ip27/ip27-common.h | 9 +++++++++
 arch/mips/sgi-ip27/ip27-init.c   | 4 ++--
 arch/mips/sgi-ip27/ip27-reset.c  | 2 ++
 arch/mips/sgi-ip27/ip27-smp.c    | 4 ++--
 arch/mips/sgi-ip27/ip27-timer.c  | 2 ++
 5 files changed, 17 insertions(+), 4 deletions(-)
 create mode 100644 arch/mips/sgi-ip27/ip27-common.h

diff --git a/arch/mips/sgi-ip27/ip27-common.h b/arch/mips/sgi-ip27/ip27-common.h
new file mode 100644
index 000000000000..e9e9f1dc8c20
--- /dev/null
+++ b/arch/mips/sgi-ip27/ip27-common.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __IP27_COMMON_H
+#define __IP27_COMMON_H
+
+extern void ip27_reboot_setup(void);
+extern void hub_rt_clock_event_init(void);
+
+#endif /* __IP27_COMMON_H */
diff --git a/arch/mips/sgi-ip27/ip27-init.c b/arch/mips/sgi-ip27/ip27-init.c
index 1dad799758c4..f48e2b3990f6 100644
--- a/arch/mips/sgi-ip27/ip27-init.c
+++ b/arch/mips/sgi-ip27/ip27-init.c
@@ -36,6 +36,8 @@
 #include <asm/sn/sn0/ip27.h>
 #include <asm/sn/mapped_kernel.h>
 
+#include "ip27-common.h"
+
 #define CPU_NONE		(cpuid_t)-1
 
 static DECLARE_BITMAP(hub_init_mask, MAX_COMPACT_NODES);
@@ -113,8 +115,6 @@ get_nasid(void)
 			 >> NSRI_NODEID_SHFT);
 }
 
-extern void ip27_reboot_setup(void);
-
 void __init plat_mem_setup(void)
 {
 	u64 p, e, n_mode;
diff --git a/arch/mips/sgi-ip27/ip27-reset.c b/arch/mips/sgi-ip27/ip27-reset.c
index c90228d0d4c2..74d078247e49 100644
--- a/arch/mips/sgi-ip27/ip27-reset.c
+++ b/arch/mips/sgi-ip27/ip27-reset.c
@@ -26,6 +26,8 @@
 #include <asm/sn/gda.h>
 #include <asm/sn/sn0/hub.h>
 
+#include "ip27-common.h"
+
 void machine_restart(char *command) __noreturn;
 void machine_halt(void) __noreturn;
 void machine_power_off(void) __noreturn;
diff --git a/arch/mips/sgi-ip27/ip27-smp.c b/arch/mips/sgi-ip27/ip27-smp.c
index 386702abe660..c38df7c62964 100644
--- a/arch/mips/sgi-ip27/ip27-smp.c
+++ b/arch/mips/sgi-ip27/ip27-smp.c
@@ -27,6 +27,8 @@
 #include <asm/sn/sn0/hubio.h>
 #include <asm/sn/sn0/ip27.h>
 
+#include "ip27-common.h"
+
 /*
  * Takes as first input the PROM assigned cpu id, and the kernel
  * assigned cpu id as the second.
@@ -147,8 +149,6 @@ static void ip27_init_cpu(void)
 
 static void ip27_smp_finish(void)
 {
-	extern void hub_rt_clock_event_init(void);
-
 	hub_rt_clock_event_init();
 	local_irq_enable();
 }
diff --git a/arch/mips/sgi-ip27/ip27-timer.c b/arch/mips/sgi-ip27/ip27-timer.c
index 9ca775465a91..d53a29070e12 100644
--- a/arch/mips/sgi-ip27/ip27-timer.c
+++ b/arch/mips/sgi-ip27/ip27-timer.c
@@ -38,6 +38,8 @@
 #include <asm/sn/sn0/hubio.h>
 #include <asm/pci/bridge.h>
 
+#include "ip27-common.h"
+
 static int rt_next_event(unsigned long delta, struct clock_event_device *evt)
 {
 	unsigned int cpu = smp_processor_id();
-- 
2.16.4

