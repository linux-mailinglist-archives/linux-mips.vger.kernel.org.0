Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89D282CE10F
	for <lists+linux-mips@lfdr.de>; Thu,  3 Dec 2020 22:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729584AbgLCVrY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Dec 2020 16:47:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727487AbgLCVrY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Dec 2020 16:47:24 -0500
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35F0DC061A52;
        Thu,  3 Dec 2020 13:46:44 -0800 (PST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kkwR0-00GJSM-3X; Thu, 03 Dec 2020 21:46:42 +0000
From:   Al Viro <viro@ZenIV.linux.org.uk>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-mips@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 05/10] mips: kill unused definitions in binfmt_elf[on]32.c
Date:   Thu,  3 Dec 2020 21:46:36 +0000
Message-Id: <20201203214641.3887979-5-viro@ZenIV.linux.org.uk>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201203214641.3887979-1-viro@ZenIV.linux.org.uk>
References: <20201203214529.GB3579531@ZenIV.linux.org.uk>
 <20201203214641.3887979-1-viro@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Al Viro <viro@zeniv.linux.org.uk>

elf_caddr_t: unused since 2002
jiffies_to_timeval: unused since 2015
TASK_SIZE: used only downstream of SET_PERSONALITY2(), and after that
point the normal definition results in TASK_SIZE32 just fine.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/mips/kernel/binfmt_elfn32.c | 18 ------------------
 arch/mips/kernel/binfmt_elfo32.c | 18 ------------------
 2 files changed, 36 deletions(-)

diff --git a/arch/mips/kernel/binfmt_elfn32.c b/arch/mips/kernel/binfmt_elfn32.c
index b78821a2b216..4f8bfaf414f5 100644
--- a/arch/mips/kernel/binfmt_elfn32.c
+++ b/arch/mips/kernel/binfmt_elfn32.c
@@ -54,28 +54,10 @@ struct elf_prstatus32
 };
 #define elf_prpsinfo compat_elf_prpsinfo
 
-#define elf_caddr_t	u32
 #define init_elf_binfmt init_elfn32_binfmt
 
-#define jiffies_to_timeval jiffies_to_old_timeval32
-static __inline__ void
-jiffies_to_old_timeval32(unsigned long jiffies, struct old_timeval32 *value)
-{
-	/*
-	 * Convert jiffies to nanoseconds and separate with
-	 * one divide.
-	 */
-	u64 nsec = (u64)jiffies * TICK_NSEC;
-	u32 rem;
-	value->tv_sec = div_u64_rem(nsec, NSEC_PER_SEC, &rem);
-	value->tv_usec = rem / NSEC_PER_USEC;
-}
-
 #define ELF_CORE_EFLAGS EF_MIPS_ABI2
 
-#undef TASK_SIZE
-#define TASK_SIZE TASK_SIZE32
-
 #undef ns_to_kernel_old_timeval
 #define ns_to_kernel_old_timeval ns_to_old_timeval32
 
diff --git a/arch/mips/kernel/binfmt_elfo32.c b/arch/mips/kernel/binfmt_elfo32.c
index e94afbd3adc5..9755ff12a9fe 100644
--- a/arch/mips/kernel/binfmt_elfo32.c
+++ b/arch/mips/kernel/binfmt_elfo32.c
@@ -59,26 +59,8 @@ struct elf_prstatus32
 };
 #define elf_prpsinfo compat_elf_prpsinfo
 
-#define elf_caddr_t	u32
 #define init_elf_binfmt init_elf32_binfmt
 
-#define jiffies_to_timeval jiffies_to_old_timeval32
-static inline void
-jiffies_to_old_timeval32(unsigned long jiffies, struct old_timeval32 *value)
-{
-	/*
-	 * Convert jiffies to nanoseconds and separate with
-	 * one divide.
-	 */
-	u64 nsec = (u64)jiffies * TICK_NSEC;
-	u32 rem;
-	value->tv_sec = div_u64_rem(nsec, NSEC_PER_SEC, &rem);
-	value->tv_usec = rem / NSEC_PER_USEC;
-}
-
-#undef TASK_SIZE
-#define TASK_SIZE TASK_SIZE32
-
 #undef ns_to_kernel_old_timeval
 #define ns_to_kernel_old_timeval ns_to_old_timeval32
 
-- 
2.11.0

