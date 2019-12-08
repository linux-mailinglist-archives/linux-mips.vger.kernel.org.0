Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9691E1162A9
	for <lists+linux-mips@lfdr.de>; Sun,  8 Dec 2019 16:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbfLHO7g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 8 Dec 2019 09:59:36 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:36846 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726678AbfLHO6v (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 8 Dec 2019 09:58:51 -0500
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tip-bot2@linutronix.de>)
        id 1idy18-0000Y3-Ho; Sun, 08 Dec 2019 15:58:38 +0100
Received: from [127.0.1.1] (localhost [IPv6:::1])
        by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id 8041B1C288C;
        Sun,  8 Dec 2019 15:58:33 +0100 (CET)
Date:   Sun, 08 Dec 2019 14:58:33 -0000
From:   "tip-bot2 for Thomas Gleixner" <tip-bot2@linutronix.de>
Reply-to: linux-kernel@vger.kernel.org
To:     linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/rt, MIPS: Use CONFIG_PREEMPTION
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        James Hogan <jhogan@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Paul Burton <paul.burton@mips.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <20191015191821.11479-13-bigeasy@linutronix.de>
References: <20191015191821.11479-13-bigeasy@linutronix.de>
MIME-Version: 1.0
Message-ID: <157581711342.21853.13927903567551510480.tip-bot2@tip-bot2>
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot2.linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from these emails
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     098fa51b1d054fbc9ec1286a3c74231aebd6ff15
Gitweb:        https://git.kernel.org/tip/098fa51b1d054fbc9ec1286a3c74231aebd6ff15
Author:        Thomas Gleixner <tglx@linutronix.de>
AuthorDate:    Tue, 15 Oct 2019 21:17:59 +02:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Sun, 08 Dec 2019 14:37:34 +01:00

sched/rt, MIPS: Use CONFIG_PREEMPTION

CONFIG_PREEMPTION is selected by CONFIG_PREEMPT and by CONFIG_PREEMPT_RT.
Both PREEMPT and PREEMPT_RT require the same functionality which today
depends on CONFIG_PREEMPT.

Switch the entry code and assmebly macros over to use CONFIG_PREEMPTION.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: James Hogan <jhogan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Paul Burton <paul.burton@mips.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@vger.kernel.org
Link: https://lore.kernel.org/r/20191015191821.11479-13-bigeasy@linutronix.de
Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/mips/include/asm/asmmacro.h | 4 ++--
 arch/mips/kernel/entry.S         | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/asmmacro.h b/arch/mips/include/asm/asmmacro.h
index feb069c..655f40d 100644
--- a/arch/mips/include/asm/asmmacro.h
+++ b/arch/mips/include/asm/asmmacro.h
@@ -63,7 +63,7 @@
 	.endm
 
 	.macro	local_irq_disable reg=t0
-#ifdef CONFIG_PREEMPT
+#ifdef CONFIG_PREEMPTION
 	lw      \reg, TI_PRE_COUNT($28)
 	addi    \reg, \reg, 1
 	sw      \reg, TI_PRE_COUNT($28)
@@ -73,7 +73,7 @@
 	xori	\reg, \reg, 1
 	mtc0	\reg, CP0_STATUS
 	irq_disable_hazard
-#ifdef CONFIG_PREEMPT
+#ifdef CONFIG_PREEMPTION
 	lw      \reg, TI_PRE_COUNT($28)
 	addi    \reg, \reg, -1
 	sw      \reg, TI_PRE_COUNT($28)
diff --git a/arch/mips/kernel/entry.S b/arch/mips/kernel/entry.S
index 5469d43..4849a48 100644
--- a/arch/mips/kernel/entry.S
+++ b/arch/mips/kernel/entry.S
@@ -19,7 +19,7 @@
 #include <asm/thread_info.h>
 #include <asm/war.h>
 
-#ifndef CONFIG_PREEMPT
+#ifndef CONFIG_PREEMPTION
 #define resume_kernel	restore_all
 #else
 #define __ret_from_irq	ret_from_exception
@@ -27,7 +27,7 @@
 
 	.text
 	.align	5
-#ifndef CONFIG_PREEMPT
+#ifndef CONFIG_PREEMPTION
 FEXPORT(ret_from_exception)
 	local_irq_disable			# preempt stop
 	b	__ret_from_irq
@@ -53,7 +53,7 @@ resume_userspace:
 	bnez	t0, work_pending
 	j	restore_all
 
-#ifdef CONFIG_PREEMPT
+#ifdef CONFIG_PREEMPTION
 resume_kernel:
 	local_irq_disable
 	lw	t0, TI_PRE_COUNT($28)
