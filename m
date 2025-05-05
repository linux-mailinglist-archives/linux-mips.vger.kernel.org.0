Return-Path: <linux-mips+bounces-8924-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB33FAAAFB7
	for <lists+linux-mips@lfdr.de>; Tue,  6 May 2025 05:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9033C1BA1A02
	for <lists+linux-mips@lfdr.de>; Tue,  6 May 2025 03:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8FE2F54A0;
	Mon,  5 May 2025 23:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UajxFALu"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6271C36EF20;
	Mon,  5 May 2025 23:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486995; cv=none; b=F87O28VpB7ToThDZynqFvu/5b0dl/ls9lDNQ7/CyKbtWof7kDY2m/w/CyjkP8y7B5+bY6rqLI7jjiP11wFIjNqyskFwWrnny2Vvv2noFAFuKokGJKZ6DsM+V1jhFN7Xe5W0g2Mifd+scLQi9oS3aC0u80AS7wHNL9iYv9amyGBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486995; c=relaxed/simple;
	bh=9UGdHSS8asS9PAcd3QKXZyEnq18ZNSJR23cUPFhNCoQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FN1u0p6o33xKNZ2i2/8r3PM9lZBny50qOgbPRC1YGRui7kCt5aeyRkDypWHbGoeQz1sf6i8kAroNk1nkWQLxQD3P37ufrv5VlrSKvE2LLDPCgZPeF0rtrCAQRbXBNCojtqb1rqysw9/3fGL8uTzfWgEWX6cUSXRXX+bBKLMGEuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UajxFALu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4638C4CEE4;
	Mon,  5 May 2025 23:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486993;
	bh=9UGdHSS8asS9PAcd3QKXZyEnq18ZNSJR23cUPFhNCoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UajxFALumYBllGgbGL7J8wc3iMUdNDGwcvtXqwHASwUuS43VGZH+Accyk9MWm/LH8
	 ZmGAUIs6K7lFhM2GwIMXeLpra4dpiP6hw9SZwlACMXm9ln8zkKWjbmUu5xSckrMT9I
	 bCJwR5UsYCCzQyRZ0uPuw5dw8ggMa0+tB1yDGSaNvL8tm9SbJipZrRnMzF8Pm2xjFS
	 Y2LAvvjhGzHrjoCNKbHpq2vr+q9EE0H4fLyw+GpxerPPlRskqXMKuOTRaY7u4N353D
	 8XH/P4XDIf7ntwBNsIv5xoq7S2tDhs04+azflkSJcbHGEugvoM2CCrnNUcYj50fhd6
	 ZPCVp6RcDUU9Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Paul Burton <paulburton@kernel.org>,
	Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>,
	linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 096/153] MIPS: pm-cps: Use per-CPU variables as per-CPU, not per-core
Date: Mon,  5 May 2025 19:12:23 -0400
Message-Id: <20250505231320.2695319-96-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231320.2695319-1-sashal@kernel.org>
References: <20250505231320.2695319-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.181
Content-Transfer-Encoding: 8bit

From: Paul Burton <paulburton@kernel.org>

[ Upstream commit 00a134fc2bb4a5f8fada58cf7ff4259149691d64 ]

The pm-cps code has up until now used per-CPU variables indexed by core,
rather than CPU number, in order to share data amongst sibling CPUs (ie.
VPs/threads in a core). This works fine for single cluster systems, but
with multi-cluster systems a core number is no longer unique in the
system, leading to sharing between CPUs that are not actually siblings.

Avoid this issue by using per-CPU variables as they are more generally
used - ie. access them using CPU numbers rather than core numbers.
Sharing between siblings is then accomplished by:
 - Assigning the same pointer to entries for each sibling CPU for the
   nc_asm_enter & ready_count variables, which allow this by virtue of
   being per-CPU pointers.

 - Indexing by the first CPU set in a CPUs cpu_sibling_map in the case
   of pm_barrier, for which we can't use the previous approach because
   the per-CPU variable is not a pointer.

Signed-off-by: Paul Burton <paulburton@kernel.org>
Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Tested-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/kernel/pm-cps.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/arch/mips/kernel/pm-cps.c b/arch/mips/kernel/pm-cps.c
index 9bf60d7d44d36..a7bcf2b814c86 100644
--- a/arch/mips/kernel/pm-cps.c
+++ b/arch/mips/kernel/pm-cps.c
@@ -56,10 +56,7 @@ static DEFINE_PER_CPU_ALIGNED(u32*, ready_count);
 /* Indicates online CPUs coupled with the current CPU */
 static DEFINE_PER_CPU_ALIGNED(cpumask_t, online_coupled);
 
-/*
- * Used to synchronize entry to deep idle states. Actually per-core rather
- * than per-CPU.
- */
+/* Used to synchronize entry to deep idle states */
 static DEFINE_PER_CPU_ALIGNED(atomic_t, pm_barrier);
 
 /* Saved CPU state across the CPS_PM_POWER_GATED state */
@@ -118,9 +115,10 @@ int cps_pm_enter_state(enum cps_pm_state state)
 	cps_nc_entry_fn entry;
 	struct core_boot_config *core_cfg;
 	struct vpe_boot_config *vpe_cfg;
+	atomic_t *barrier;
 
 	/* Check that there is an entry function for this state */
-	entry = per_cpu(nc_asm_enter, core)[state];
+	entry = per_cpu(nc_asm_enter, cpu)[state];
 	if (!entry)
 		return -EINVAL;
 
@@ -156,7 +154,7 @@ int cps_pm_enter_state(enum cps_pm_state state)
 	smp_mb__after_atomic();
 
 	/* Create a non-coherent mapping of the core ready_count */
-	core_ready_count = per_cpu(ready_count, core);
+	core_ready_count = per_cpu(ready_count, cpu);
 	nc_addr = kmap_noncoherent(virt_to_page(core_ready_count),
 				   (unsigned long)core_ready_count);
 	nc_addr += ((unsigned long)core_ready_count & ~PAGE_MASK);
@@ -164,7 +162,8 @@ int cps_pm_enter_state(enum cps_pm_state state)
 
 	/* Ensure ready_count is zero-initialised before the assembly runs */
 	WRITE_ONCE(*nc_core_ready_count, 0);
-	coupled_barrier(&per_cpu(pm_barrier, core), online);
+	barrier = &per_cpu(pm_barrier, cpumask_first(&cpu_sibling_map[cpu]));
+	coupled_barrier(barrier, online);
 
 	/* Run the generated entry code */
 	left = entry(online, nc_core_ready_count);
@@ -635,12 +634,14 @@ static void *cps_gen_entry_code(unsigned cpu, enum cps_pm_state state)
 
 static int cps_pm_online_cpu(unsigned int cpu)
 {
-	enum cps_pm_state state;
-	unsigned core = cpu_core(&cpu_data[cpu]);
+	unsigned int sibling, core;
 	void *entry_fn, *core_rc;
+	enum cps_pm_state state;
+
+	core = cpu_core(&cpu_data[cpu]);
 
 	for (state = CPS_PM_NC_WAIT; state < CPS_PM_STATE_COUNT; state++) {
-		if (per_cpu(nc_asm_enter, core)[state])
+		if (per_cpu(nc_asm_enter, cpu)[state])
 			continue;
 		if (!test_bit(state, state_support))
 			continue;
@@ -652,16 +653,19 @@ static int cps_pm_online_cpu(unsigned int cpu)
 			clear_bit(state, state_support);
 		}
 
-		per_cpu(nc_asm_enter, core)[state] = entry_fn;
+		for_each_cpu(sibling, &cpu_sibling_map[cpu])
+			per_cpu(nc_asm_enter, sibling)[state] = entry_fn;
 	}
 
-	if (!per_cpu(ready_count, core)) {
+	if (!per_cpu(ready_count, cpu)) {
 		core_rc = kmalloc(sizeof(u32), GFP_KERNEL);
 		if (!core_rc) {
 			pr_err("Failed allocate core %u ready_count\n", core);
 			return -ENOMEM;
 		}
-		per_cpu(ready_count, core) = core_rc;
+
+		for_each_cpu(sibling, &cpu_sibling_map[cpu])
+			per_cpu(ready_count, sibling) = core_rc;
 	}
 
 	return 0;
-- 
2.39.5


