Return-Path: <linux-mips+bounces-494-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 302AB8031E2
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 12:57:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF6E3280F1B
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 11:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C7A22F10;
	Mon,  4 Dec 2023 11:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LzcRxiI0"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE5322EFC
	for <linux-mips@vger.kernel.org>; Mon,  4 Dec 2023 11:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B065C433C8;
	Mon,  4 Dec 2023 11:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701691064;
	bh=Q7aKYl16T9hR/qQEjfnP6gJmVaTl43MdZYWT4vZwXfM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LzcRxiI031g/Z1uZIBzHwViMtMXVNlngq1Ad9smqiSwZpt4mon1kpcdJOzDK1U38L
	 t9ughdAYz4mRMcsmfCQhz6dC1cHL4a+cu9ndFnyiVorg/YtvfVly2w6S0qQr2iOOIs
	 UgzVeUp13PzUxlwhUcTG53mmeLWpfwtPR/uYmfEDlxn86sWJr3bJz5k38QYIjT7uIL
	 vWm2IakasQKJZBcZ1KKPi2atPF5fBIHV0vh9u1FnRLfhQesYB3z7TYBg+P6Tdxnemb
	 2TA9B3eFMU1c0BxB/ektdBk0i4+9/i2eMBK2i+c208NKX4QbYwJSO+hcK/MFqEbF03
	 ilIvzwo5E4lOA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mips@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Andrew Morton" <akpm@linux-foundation.org>,
	"Stephen Rothwell" <sfr@rothwell.id.au>,
	"Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: [PATCH 13/20] mips: add missing declarations
Date: Mon,  4 Dec 2023 12:57:03 +0100
Message-Id: <20231204115710.2247097-14-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204115710.2247097-1-arnd@kernel.org>
References: <20231204115710.2247097-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

These are three more functions that are only called from assembler and
only need a declaration to avoid the -Wmissing-prototypes warnings:

arch/mips/kernel/signal.c:904:17: error: no previous prototype for 'do_notify_resume' [-Werror=missing-prototypes]
arch/mips/kernel/traps.c:370:6: error: no previous prototype for 'show_registers' [-Werror=missing-prototypes]
arch/mips/kernel/smp.c:352:17: error: no previous prototype for 'start_secondary' [-Werror=missing-prototypes]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/include/asm/processor.h | 2 ++
 arch/mips/include/asm/signal.h    | 1 +
 arch/mips/include/asm/smp.h       | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/arch/mips/include/asm/processor.h b/arch/mips/include/asm/processor.h
index ae2cd37a38f0..ca7662cc65a7 100644
--- a/arch/mips/include/asm/processor.h
+++ b/arch/mips/include/asm/processor.h
@@ -402,4 +402,6 @@ extern int mips_set_process_fp_mode(struct task_struct *task,
 #define GET_FP_MODE(task)		mips_get_process_fp_mode(task)
 #define SET_FP_MODE(task,value)		mips_set_process_fp_mode(task, value)
 
+void show_registers(struct pt_regs *regs);
+
 #endif /* _ASM_PROCESSOR_H */
diff --git a/arch/mips/include/asm/signal.h b/arch/mips/include/asm/signal.h
index 23d6b8015c79..8de81ccef7ad 100644
--- a/arch/mips/include/asm/signal.h
+++ b/arch/mips/include/asm/signal.h
@@ -31,5 +31,6 @@ extern struct mips_abi mips_abi_32;
 
 extern int protected_save_fp_context(void __user *sc);
 extern int protected_restore_fp_context(void __user *sc);
+void do_notify_resume(struct pt_regs *regs, void *unused, __u32 thread_info_flags);
 
 #endif /* _ASM_SIGNAL_H */
diff --git a/arch/mips/include/asm/smp.h b/arch/mips/include/asm/smp.h
index f3b18b4a5e44..19190e413223 100644
--- a/arch/mips/include/asm/smp.h
+++ b/arch/mips/include/asm/smp.h
@@ -61,6 +61,8 @@ extern asmlinkage void smp_bootstrap(void);
 
 extern void calculate_cpu_foreign_map(void);
 
+asmlinkage void start_secondary(void);
+
 /*
  * this function sends a 'reschedule' IPI to another CPU.
  * it goes straight through and wastes no time serializing
-- 
2.39.2


