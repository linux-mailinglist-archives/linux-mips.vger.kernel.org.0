Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF0AD7FFC
	for <lists+linux-mips@lfdr.de>; Tue, 15 Oct 2019 21:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727900AbfJOTU2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Oct 2019 15:20:28 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:45659 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389394AbfJOTSn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Oct 2019 15:18:43 -0400
Received: from localhost ([127.0.0.1] helo=localhost.localdomain)
        by Galois.linutronix.de with esmtp (Exim 4.80)
        (envelope-from <bigeasy@linutronix.de>)
        id 1iKSL6-00067i-45; Tue, 15 Oct 2019 21:18:36 +0200
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     linux-kernel@vger.kernel.org
Cc:     tglx@linutronix.de, Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 12/34] MIPS: Use CONFIG_PREEMPTION
Date:   Tue, 15 Oct 2019 21:17:59 +0200
Message-Id: <20191015191821.11479-13-bigeasy@linutronix.de>
In-Reply-To: <20191015191821.11479-1-bigeasy@linutronix.de>
References: <20191015191821.11479-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Thomas Gleixner <tglx@linutronix.de>

CONFIG_PREEMPTION is selected by CONFIG_PREEMPT and by CONFIG_PREEMPT_RT.
Both PREEMPT and PREEMPT_RT require the same functionality which today
depends on CONFIG_PREEMPT.

Switch the entry code and assmebly macros over to use CONFIG_PREEMPTION.

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@mips.com>
Cc: James Hogan <jhogan@kernel.org>
Cc: linux-mips@vger.kernel.org
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/mips/include/asm/asmmacro.h | 4 ++--
 arch/mips/kernel/entry.S         | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/asmmacro.h b/arch/mips/include/asm/asmma=
cro.h
index feb069cbf44e8..655f40ddb6d1e 100644
--- a/arch/mips/include/asm/asmmacro.h
+++ b/arch/mips/include/asm/asmmacro.h
@@ -63,7 +63,7 @@
 	.endm
=20
 	.macro	local_irq_disable reg=3Dt0
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
index 5469d43b69668..4849a48afc0f8 100644
--- a/arch/mips/kernel/entry.S
+++ b/arch/mips/kernel/entry.S
@@ -19,7 +19,7 @@
 #include <asm/thread_info.h>
 #include <asm/war.h>
=20
-#ifndef CONFIG_PREEMPT
+#ifndef CONFIG_PREEMPTION
 #define resume_kernel	restore_all
 #else
 #define __ret_from_irq	ret_from_exception
@@ -27,7 +27,7 @@
=20
 	.text
 	.align	5
-#ifndef CONFIG_PREEMPT
+#ifndef CONFIG_PREEMPTION
 FEXPORT(ret_from_exception)
 	local_irq_disable			# preempt stop
 	b	__ret_from_irq
@@ -53,7 +53,7 @@ FEXPORT(__ret_from_irq)
 	bnez	t0, work_pending
 	j	restore_all
=20
-#ifdef CONFIG_PREEMPT
+#ifdef CONFIG_PREEMPTION
 resume_kernel:
 	local_irq_disable
 	lw	t0, TI_PRE_COUNT($28)
--=20
2.23.0

