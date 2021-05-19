Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3760E388782
	for <lists+linux-mips@lfdr.de>; Wed, 19 May 2021 08:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbhESG3d (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 May 2021 02:29:33 -0400
Received: from lucky1.263xmail.com ([211.157.147.131]:45764 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbhESG3c (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 May 2021 02:29:32 -0400
Received: from localhost (unknown [192.168.167.69])
        by lucky1.263xmail.com (Postfix) with ESMTP id 6E6ACBA2D7;
        Wed, 19 May 2021 22:15:07 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [111.207.172.18])
        by smtp.263.net (postfix) whith ESMTP id P31907T140446896060160S1621405685834478_;
        Wed, 19 May 2021 14:28:06 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <cb7335d5501908e7aaab17af560893f5>
X-RL-SENDER: zhaoxiao@uniontech.com
X-SENDER: zhaoxiao@uniontech.com
X-LOGIN-NAME: zhaoxiao@uniontech.com
X-FST-TO: linux-mips@vger.kernel.org
X-RCPT-COUNT: 4
X-SENDER-IP: 111.207.172.18
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   zhaoxiao <zhaoxiao@uniontech.com>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, zhaoxiao <zhaoxiao@uniontech.com>
Subject: [PATCH] arch/mips/kernel/asm-offsets.c: Make local functions static
Date:   Wed, 19 May 2021 14:28:04 +0800
Message-Id: <20210519062804.30047-1-zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fixes the following W=1 kernel build warning(s):
arch/mips/kernel/asm-offsets.c:26:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
 void output_ptreg_defines(void)
      ^~~~~~~~~~~~~~~~~~~~
arch/mips/kernel/asm-offsets.c:78:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
 void output_task_defines(void)
      ^~~~~~~~~~~~~~~~~~~
arch/mips/kernel/asm-offsets.c:93:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
 void output_thread_info_defines(void)
      ^~~~~~~~~~~~~~~~~~~~~~~~~~
arch/mips/kernel/asm-offsets.c:109:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
 void output_thread_defines(void)
      ^~~~~~~~~~~~~~~~~~~~~
arch/mips/kernel/asm-offsets.c:137:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
 void output_thread_fpu_defines(void)
      ^~~~~~~~~~~~~~~~~~~~~~~~~
arch/mips/kernel/asm-offsets.c:180:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
 void output_mm_defines(void)
      ^~~~~~~~~~~~~~~~~
arch/mips/kernel/asm-offsets.c:241:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
 void output_sc_defines(void)
      ^~~~~~~~~~~~~~~~~
arch/mips/kernel/asm-offsets.c:254:6: warning: no previous prototype for 'output_signal_defined' [-Wmissing-prototypes]
 void output_signal_defined(void)
      ^~~~~~~~~~~~~~~~~~~~~
arch/mips/kernel/asm-offsets.c:347:6: warning: no previous prototype for 'output_kvm_defines' [-Wmissing-prototypes]
 void output_kvm_defines(void)

Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
---
 arch/mips/kernel/asm-offsets.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/mips/kernel/asm-offsets.c b/arch/mips/kernel/asm-offsets.c
index 5735b2cd6f2a..2dc1ecb12c00 100644
--- a/arch/mips/kernel/asm-offsets.c
+++ b/arch/mips/kernel/asm-offsets.c
@@ -23,7 +23,7 @@
 
 #include <linux/kvm_host.h>
 
-void output_ptreg_defines(void)
+static void output_ptreg_defines(void)
 {
 	COMMENT("MIPS pt_regs offsets.");
 	OFFSET(PT_R0, pt_regs, regs[0]);
@@ -75,7 +75,7 @@ void output_ptreg_defines(void)
 	BLANK();
 }
 
-void output_task_defines(void)
+static void output_task_defines(void)
 {
 	COMMENT("MIPS task_struct offsets.");
 	OFFSET(TASK_STATE, task_struct, state);
@@ -90,7 +90,7 @@ void output_task_defines(void)
 	BLANK();
 }
 
-void output_thread_info_defines(void)
+static void output_thread_info_defines(void)
 {
 	COMMENT("MIPS thread_info offsets.");
 	OFFSET(TI_TASK, thread_info, task);
@@ -106,7 +106,7 @@ void output_thread_info_defines(void)
 	BLANK();
 }
 
-void output_thread_defines(void)
+static void output_thread_defines(void)
 {
 	COMMENT("MIPS specific thread_struct offsets.");
 	OFFSET(THREAD_REG16, task_struct, thread.reg16);
@@ -134,7 +134,7 @@ void output_thread_defines(void)
 }
 
 #ifdef CONFIG_MIPS_FP_SUPPORT
-void output_thread_fpu_defines(void)
+static void output_thread_fpu_defines(void)
 {
 	OFFSET(THREAD_FPU, task_struct, thread.fpu);
 
@@ -177,7 +177,7 @@ void output_thread_fpu_defines(void)
 }
 #endif
 
-void output_mm_defines(void)
+static void output_mm_defines(void)
 {
 	COMMENT("Size of struct page");
 	DEFINE(STRUCT_PAGE_SIZE, sizeof(struct page));
@@ -216,7 +216,7 @@ void output_mm_defines(void)
 }
 
 #ifdef CONFIG_32BIT
-void output_sc_defines(void)
+static void output_sc_defines(void)
 {
 	COMMENT("Linux sigcontext offsets.");
 	OFFSET(SC_REGS, sigcontext, sc_regs);
@@ -238,7 +238,7 @@ void output_sc_defines(void)
 #endif
 
 #ifdef CONFIG_64BIT
-void output_sc_defines(void)
+static void output_sc_defines(void)
 {
 	COMMENT("Linux sigcontext offsets.");
 	OFFSET(SC_REGS, sigcontext, sc_regs);
@@ -251,7 +251,7 @@ void output_sc_defines(void)
 }
 #endif
 
-void output_signal_defined(void)
+static void output_signal_defined(void)
 {
 	COMMENT("Linux signal numbers.");
 	DEFINE(_SIGHUP, SIGHUP);
@@ -344,7 +344,7 @@ void output_pm_defines(void)
 #endif
 
 #ifdef CONFIG_MIPS_FP_SUPPORT
-void output_kvm_defines(void)
+static void output_kvm_defines(void)
 {
 	COMMENT(" KVM/MIPS Specific offsets. ");
 
-- 
2.20.1



