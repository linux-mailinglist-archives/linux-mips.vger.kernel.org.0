Return-Path: <linux-mips+bounces-483-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8277D8031D7
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 12:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25204B2096A
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 11:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1F622EFC;
	Mon,  4 Dec 2023 11:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fhAUsG1z"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA9A14F9C
	for <linux-mips@vger.kernel.org>; Mon,  4 Dec 2023 11:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD456C433C9;
	Mon,  4 Dec 2023 11:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701691043;
	bh=IbjKyf0hdtAvqPD1GTOpKbdNaas5xVKf1Zdp6x9MKL4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fhAUsG1z0ypiGchO8PAikx1OrT66HMzPMSZknlE9PFGU1wZ2gvqbzqt16ue4eQtk3
	 3p8rW9ftXw/QQcUyL86s168LH4Y/0loprenU33OVLXo1eqjTfrPbxmGV7Y3g/oc/jS
	 kQ4YM2YM5X67Q/heA0v2GsWKLxiAeEdU9RF+/AAKJLOdeUgwnw8n0LjiRVNavv1Bme
	 4H1UjIdhJt8ZF3LIaPc2NmG47cEjahf1tLXwRTZHpSXcBW5DFSstOu872CaoW4zqBA
	 DjkUXumc8hDa6EZjcmB9CoiZaibYiGdDMGHs4TeyHbcK06j54OAFlzrX1ioAjBL5s0
	 U93KC0jL3MS2g==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mips@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Andrew Morton" <akpm@linux-foundation.org>,
	"Stephen Rothwell" <sfr@rothwell.id.au>,
	"Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: [PATCH 02/20] mips: add asm/syscalls.h header
Date: Mon,  4 Dec 2023 12:56:52 +0100
Message-Id: <20231204115710.2247097-3-arnd@kernel.org>
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

System call prototypes are generally in linux/syscalls.h, but there are
a couple of mips specific entry points that are missing there:

arch/mips/kernel/signal.c:636:17: error: no previous prototype for 'sys_sigreturn' [-Werror=missing-prototypes]
arch/mips/kernel/signal.c:673:17: error: no previous prototype for 'sys_rt_sigreturn' [-Werror=missing-prototypes]
arch/mips/kernel/syscall.c:51:16: error: no previous prototype for 'sysm_pipe' [-Werror=missing-prototypes]
arch/mips/kernel/mips-mt-fpaff.c:65:17: error: no previous prototype for 'mipsmt_sys_sched_setaffinity' [-Werror=missing-prototypes]
arch/mips/kernel/mips-mt-fpaff.c:157:17: error: no previous prototype for 'mipsmt_sys_sched_getaffinity' [-Werror=missing-prototypes]

Add these to a new asm/syscalls.h as we have in other architectures.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/include/asm/syscalls.h | 33 ++++++++++++++++++++++++++++++++
 arch/mips/kernel/linux32.c       |  1 +
 arch/mips/kernel/mips-mt-fpaff.c |  1 +
 arch/mips/kernel/signal.c        |  1 +
 arch/mips/kernel/signal32.c      |  1 +
 arch/mips/kernel/signal_n32.c    |  1 +
 arch/mips/kernel/signal_o32.c    |  1 +
 arch/mips/kernel/syscall.c       |  1 +
 8 files changed, 40 insertions(+)
 create mode 100644 arch/mips/include/asm/syscalls.h

diff --git a/arch/mips/include/asm/syscalls.h b/arch/mips/include/asm/syscalls.h
new file mode 100644
index 000000000000..59f9c0c9fa0a
--- /dev/null
+++ b/arch/mips/include/asm/syscalls.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_MIPS_SYSCALLS_H
+#define _ASM_MIPS_SYSCALLS_H
+
+#include <linux/linkage.h>
+#include <linux/compat.h>
+
+asmlinkage void sys_sigreturn(void);
+asmlinkage void sys_rt_sigreturn(void);
+asmlinkage int sysm_pipe(void);
+asmlinkage long mipsmt_sys_sched_setaffinity(pid_t pid, unsigned int len,
+                                     unsigned long __user *user_mask_ptr);
+asmlinkage long mipsmt_sys_sched_getaffinity(pid_t pid, unsigned int len,
+                                     unsigned long __user *user_mask_ptr);
+asmlinkage long sys32_fallocate(int fd, int mode, unsigned offset_a2,
+				unsigned offset_a3, unsigned len_a4,
+				unsigned len_a5);
+asmlinkage long sys32_fadvise64_64(int fd, int __pad,
+				   unsigned long a2, unsigned long a3,
+				   unsigned long a4, unsigned long a5,
+				   int flags);
+asmlinkage ssize_t sys32_readahead(int fd, u32 pad0, u64 a2, u64 a3,
+				   size_t count);
+asmlinkage long sys32_sync_file_range(int fd, int __pad,
+				      unsigned long a2, unsigned long a3,
+				      unsigned long a4, unsigned long a5,
+				      int flags);
+asmlinkage void sys32_rt_sigreturn(void);
+asmlinkage void sys32_sigreturn(void);
+asmlinkage int sys32_sigsuspend(compat_sigset_t __user *uset);
+asmlinkage void sysn32_rt_sigreturn(void);
+
+#endif
diff --git a/arch/mips/kernel/linux32.c b/arch/mips/kernel/linux32.c
index 6b61be486303..a0c0a7a654e9 100644
--- a/arch/mips/kernel/linux32.c
+++ b/arch/mips/kernel/linux32.c
@@ -42,6 +42,7 @@
 #include <linux/uaccess.h>
 #include <asm/mmu_context.h>
 #include <asm/mman.h>
+#include <asm/syscalls.h>
 
 #ifdef __MIPSEB__
 #define merge_64(r1, r2) ((((r1) & 0xffffffffUL) << 32) + ((r2) & 0xffffffffUL))
diff --git a/arch/mips/kernel/mips-mt-fpaff.c b/arch/mips/kernel/mips-mt-fpaff.c
index 67e130d3f038..10172fc4f627 100644
--- a/arch/mips/kernel/mips-mt-fpaff.c
+++ b/arch/mips/kernel/mips-mt-fpaff.c
@@ -15,6 +15,7 @@
 #include <linux/security.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
+#include <asm/syscalls.h>
 
 /*
  * CPU mask used to set process affinity for MT VPEs/TCs with FPUs
diff --git a/arch/mips/kernel/signal.c b/arch/mips/kernel/signal.c
index 479999b7f2de..ccbf580827f6 100644
--- a/arch/mips/kernel/signal.c
+++ b/arch/mips/kernel/signal.c
@@ -38,6 +38,7 @@
 #include <asm/dsp.h>
 #include <asm/inst.h>
 #include <asm/msa.h>
+#include <asm/syscalls.h>
 
 #include "signal-common.h"
 
diff --git a/arch/mips/kernel/signal32.c b/arch/mips/kernel/signal32.c
index 59b8965433c2..73081d4ee8c1 100644
--- a/arch/mips/kernel/signal32.c
+++ b/arch/mips/kernel/signal32.c
@@ -18,6 +18,7 @@
 #include <asm/compat-signal.h>
 #include <linux/uaccess.h>
 #include <asm/unistd.h>
+#include <asm/syscalls.h>
 
 #include "signal-common.h"
 
diff --git a/arch/mips/kernel/signal_n32.c b/arch/mips/kernel/signal_n32.c
index cfc77b69420a..ff2043d620ba 100644
--- a/arch/mips/kernel/signal_n32.c
+++ b/arch/mips/kernel/signal_n32.c
@@ -24,6 +24,7 @@
 #include <asm/ucontext.h>
 #include <asm/fpu.h>
 #include <asm/cpu-features.h>
+#include <asm/syscalls.h>
 
 #include "signal-common.h"
 
diff --git a/arch/mips/kernel/signal_o32.c b/arch/mips/kernel/signal_o32.c
index 299a7a28ca33..4f0458459650 100644
--- a/arch/mips/kernel/signal_o32.c
+++ b/arch/mips/kernel/signal_o32.c
@@ -19,6 +19,7 @@
 #include <asm/dsp.h>
 #include <asm/sim.h>
 #include <asm/unistd.h>
+#include <asm/syscalls.h>
 
 #include "signal-common.h"
 
diff --git a/arch/mips/kernel/syscall.c b/arch/mips/kernel/syscall.c
index ae93a607ddf7..1bfc34a2e5b3 100644
--- a/arch/mips/kernel/syscall.c
+++ b/arch/mips/kernel/syscall.c
@@ -39,6 +39,7 @@
 #include <asm/shmparam.h>
 #include <asm/sync.h>
 #include <asm/sysmips.h>
+#include <asm/syscalls.h>
 #include <asm/switch_to.h>
 
 /*
-- 
2.39.2


