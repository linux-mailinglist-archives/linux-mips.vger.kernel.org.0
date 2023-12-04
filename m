Return-Path: <linux-mips+bounces-500-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC578031E8
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 12:58:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CE341C2095C
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 11:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA1A22F14;
	Mon,  4 Dec 2023 11:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kwK3J2ny"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3318C22EFC
	for <linux-mips@vger.kernel.org>; Mon,  4 Dec 2023 11:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B25C43397;
	Mon,  4 Dec 2023 11:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701691076;
	bh=2ybd8Cw7YtU9u9EHHq/wEoKMfFc0foeXptI4v618YLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kwK3J2nyRuMO7cc5FBlkOyQQSG16HXJjEpaaGw+7p6jnWH8JfDJgQ3aRzupuj+HKJ
	 I+Q8200Ouq+z26Ued3VzF7lulESo3RTxh/uBSoAXt01m8og1VH+yUqaXsK2186cN8P
	 H4LJD0/LOAXq+HryzMRBKBn4i6B8pThCUKG31eo0TspSza2nH3GMr8zKzFUWe/B/dP
	 D+pMcvarz9XNE5Eb2uDlXFlC+BV+C8HBlqr2gjbjKe06AcxFT/wqBX6UjZxsEzfEA4
	 1A1XeFtr+uHK8eNDjH6u4FmaZF/j66FI2sEgKFmXPZ5n93470IsO76PWFqSNOJEOak
	 r1N4zlmIlKQSQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mips@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Andrew Morton" <akpm@linux-foundation.org>,
	"Stephen Rothwell" <sfr@rothwell.id.au>,
	"Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: [PATCH 19/20] mips: smp: fix setup_profiling_timer() prototype
Date: Mon,  4 Dec 2023 12:57:09 +0100
Message-Id: <20231204115710.2247097-20-arnd@kernel.org>
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

The function is unconditionally defined in smp.c but is conditionally
declared in a header that is not included here.

arch/mips/kernel/smp.c:473:5: error: no previous prototype for 'setup_profiling_timer' [-Werror=missing-prototypes]

Add the missing #include and #ifdef to match the declaration.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/kernel/smp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 8fbef537fb88..774e4dcd86d2 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/profile.h>
 #include <linux/smp.h>
 #include <linux/spinlock.h>
 #include <linux/threads.h>
@@ -468,11 +469,13 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 	return 0;
 }
 
+#ifdef CONFIG_PROFILING
 /* Not really SMP stuff ... */
 int setup_profiling_timer(unsigned int multiplier)
 {
 	return 0;
 }
+#endif
 
 static void flush_tlb_all_ipi(void *info)
 {
-- 
2.39.2


