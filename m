Return-Path: <linux-mips+bounces-654-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEAF80CBFD
	for <lists+linux-mips@lfdr.de>; Mon, 11 Dec 2023 14:56:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE1B228214E
	for <lists+linux-mips@lfdr.de>; Mon, 11 Dec 2023 13:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BEF547A4C;
	Mon, 11 Dec 2023 13:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RnKkYg0U"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DF4358A9;
	Mon, 11 Dec 2023 13:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 643C4C433C7;
	Mon, 11 Dec 2023 13:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702302998;
	bh=tUwhSQ0MnlY3X/Klwwizqwrr4QqE+T/3H1wVR3q2ljI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RnKkYg0U/ZMcmUye+MzUKx0SYAPacRtt4O4TMmqSUGvNOqg4x+e97kJGTUZnWJqZR
	 a3UJUDY3p459in65ZNFDktulTzVd031+AS2xU88d7lLGbzVyRQHYc0e3c4Zm1mOc7A
	 OZrCMPCdoOacSLeXH7ZYM+AWUT8DPTYHhT3kEj5firtpk3jV+gRquEsVhm4SRMYnoi
	 pQBQQ6qPZBdiTy7nTSS8QgnKsAh98fJaw25XGob+S6GcIIn5XnFOk2fxTqBVW4XGdJ
	 qW2u1Staz28AVj+TCgJ1BSta8bxhkcUVJW388cVAowWa4F6NGoXnL7XKI1D5XDDuQh
	 Y5GtXW1JQEnIQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Stefan Wiehler <stefan.wiehler@nokia.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>,
	chenhuacai@kernel.org,
	tglx@linutronix.de,
	jiaxun.yang@flygoat.com,
	linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 22/29] mips/smp: Call rcutree_report_cpu_starting() earlier
Date: Mon, 11 Dec 2023 08:54:06 -0500
Message-ID: <20231211135457.381397-22-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231211135457.381397-1-sashal@kernel.org>
References: <20231211135457.381397-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.66
Content-Transfer-Encoding: 8bit

From: Stefan Wiehler <stefan.wiehler@nokia.com>

[ Upstream commit 55702ec9603ebeffb15e6f7b113623fe1d8872f4 ]

rcutree_report_cpu_starting() must be called before
clockevents_register_device() to avoid the following lockdep splat triggered by
calling list_add() when CONFIG_PROVE_RCU_LIST=y:

  WARNING: suspicious RCU usage
  ...
  -----------------------------
  kernel/locking/lockdep.c:3680 RCU-list traversed in non-reader section!!

  other info that might help us debug this:

  RCU used illegally from offline CPU!
  rcu_scheduler_active = 1, debug_locks = 1
  no locks held by swapper/1/0.
  ...
  Call Trace:
  [<ffffffff8012a434>] show_stack+0x64/0x158
  [<ffffffff80a93d98>] dump_stack_lvl+0x90/0xc4
  [<ffffffff801c9e9c>] __lock_acquire+0x1404/0x2940
  [<ffffffff801cbf3c>] lock_acquire+0x14c/0x448
  [<ffffffff80aa4260>] _raw_spin_lock_irqsave+0x50/0x88
  [<ffffffff8021e0c8>] clockevents_register_device+0x60/0x1e8
  [<ffffffff80130ff0>] r4k_clockevent_init+0x220/0x3a0
  [<ffffffff801339d0>] start_secondary+0x50/0x3b8

raw_smp_processor_id() is required in order to avoid calling into lockdep
before RCU has declared the CPU to be watched for readers.

See also commit 29368e093921 ("x86/smpboot:  Move rcu_cpu_starting() earlier"),
commit de5d9dae150c ("s390/smp: move rcu_cpu_starting() earlier") and commit
99f070b62322 ("powerpc/smp: Call rcu_cpu_starting() earlier").

Signed-off-by: Stefan Wiehler <stefan.wiehler@nokia.com>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/kernel/smp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 1d93b85271ba8..b951ce3a53ab0 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -333,10 +333,11 @@ early_initcall(mips_smp_ipi_init);
  */
 asmlinkage void start_secondary(void)
 {
-	unsigned int cpu;
+	unsigned int cpu = raw_smp_processor_id();
 
 	cpu_probe();
 	per_cpu_trap_init(false);
+	rcutree_report_cpu_starting(cpu);
 	mips_clockevent_init();
 	mp_ops->init_secondary();
 	cpu_report();
@@ -348,7 +349,6 @@ asmlinkage void start_secondary(void)
 	 */
 
 	calibrate_delay();
-	cpu = smp_processor_id();
 	cpu_data[cpu].udelay_val = loops_per_jiffy;
 
 	set_cpu_sibling_map(cpu);
-- 
2.42.0


