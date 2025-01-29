Return-Path: <linux-mips+bounces-7634-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31952A21D28
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jan 2025 13:33:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95B2518866E0
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jan 2025 12:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B02F4A1E;
	Wed, 29 Jan 2025 12:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZEQc7PM"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820D110F9;
	Wed, 29 Jan 2025 12:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738153980; cv=none; b=maQ/sQ3ffp2KXnzL2WrY/pPCtZcEljoQ1hVnzIB0PyCb3dfztWdTVpvD90SBgV2V3B+Vs8XdsWZeTygAEqZq+nJmgBc55eqcKbJcZmR2VKKb6xAaO8NxtOQcRjcMLrQ9NmYj5/VojhV0d9qN5UTjFs1a3VGwyvzINFSIrR297gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738153980; c=relaxed/simple;
	bh=juegPF0QAfCy/64jfsXI53FQb/EgNPwFWBJGG+Zvlro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KBRE7DOLcJQlw67kY1pWSCm2i5Q0VXYtAT12THH6yaWgRUu8jlNyMObptWNcMPJcVDiov3KrsIuzYSbHFdQVwrDBWcXWXvzFk3SIFMbgFQBJARYpthOvctNleYsocb7BeLrlX0wuMrJMkZgEP78+Jd2KBvRkkHICoH4/8/l8vgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZEQc7PM; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aab6fa3e20eso1141264966b.2;
        Wed, 29 Jan 2025 04:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738153976; x=1738758776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxVQmw22U/pUgtkzMWu3ru0gpeZOa1eNAUYZCGmjfkg=;
        b=hZEQc7PMGnJchTvW+VkroSoOX8orXBbLq5kAKvVKbkC4GkZiJ1jnJ8p1FkxFd6ZprH
         WryY0YqwXiJ5VkPcz00SbH0kuQ6nfaC3YFHkxbZ/VUiW4vPSu+Y5ImFNoE3UQ3ngi7OS
         7cGhIZKSh3fYgnJ4L1AHEQ8B6oeTbhqCl8l3xnmA8iiLSjB3BmpsR95SMN4qOWPalVGx
         U0gKw1l9HzWdQdOlH3x1rZou9V0LVnOhrvXCro5U3PY8wQ5mwBAj+gNWLLUKUkphfxT9
         +UlK6l8gmykt/j24kVrjTQgi5fsdXS+YQTYD3WMO3BonTPNFaBtTbkRK29MoAQbM475w
         bLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738153976; x=1738758776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxVQmw22U/pUgtkzMWu3ru0gpeZOa1eNAUYZCGmjfkg=;
        b=wUAx2CvLl+kfgwljTpcQ75mLcHHK6gxEkpJR5CCdLfRZFRz9uughvaJ+AMEjA6PXjX
         s8uyH8y81xYWW2S80IYlkYXsbjHWr5qfGm31jeFmIfK0ITzUDHUszv2iKO9yNP2LJEMp
         ZvD3dtOLoigl3Uk2XD6pPA6Bbk0/wOpjuhh20c0ACxnYlsT25yPbyHSFwOf/kMLDTQkT
         3dUZDPJ9Z0pntJyvj2p+dbTrYQvhfLjN9tmlLRaDgFEG36l8zGTF51EYU6QMhxyhzXJc
         rUDBoNR5fg+nt1uD7s2qY4HIQC1P9u5Zv0WGbOb3I7ruNgC2tZoYw2l/6x+LoysAd+Is
         imPA==
X-Gm-Message-State: AOJu0YxjyksVOjrRRdQ7IfL59iJz5V1UYIYgU9WYGqyoCUntFRGQOmQN
	+gifhtnPHLTPic/YEFzcmq8DkXpe7VT2aGCbXQWbh5yX43PbiozNq+qKhbak
X-Gm-Gg: ASbGnct64zmzCAgxH6b6OjY9aQWnmcJGdYNc4x0DtU4M4GstyT8MaEVfPWBhYNaK8C8
	e5ksMOfETOV/7LERVQ+zKHSvLx01Kl8kWcFhqcSCp8NOgWT6H35Jfiu9768Tz4MThKew8z6QAKP
	+hn2T7HvJe8lgBMTZQk2hvhH/A7tSvJGxYNFuaQwJb00OLVHppUahl9XhdcAaOy/QB4md2ehiGB
	/gVGcUBxtSOAFpCkMN/5RJAR0EyQNIoiFbXak7t74EdUlHCe+3SLZhCWujk2l/8QQ3sOmPuw8bR
	22au/5Q3iiVEbTPtwLN8gwosWR4sFo4dCPQ=
X-Google-Smtp-Source: AGHT+IGlkcvzoCqeKuyPGWCfZinwGBT6ijEJr0VYZNs9MFCxAJom7Swwj+GI4SALGMZv8l3X4qFjwQ==
X-Received: by 2002:a17:907:2d08:b0:ab6:99b2:ad0c with SMTP id a640c23a62f3a-ab6cfe1753dmr283588066b.50.1738153975929;
        Wed, 29 Jan 2025 04:32:55 -0800 (PST)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab69051b1ddsm733540766b.180.2025.01.29.04.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 04:32:55 -0800 (PST)
From: Aleksandar Rikalo <arikalo@gmail.com>
To: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Burton <paulburton@kernel.org>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Chao-ying Fu <cfu@mips.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>
Subject: [PATCH v9 2/4] MIPS: pm-cps: Use per-CPU variables as per-CPU, not per-core
Date: Wed, 29 Jan 2025 13:32:48 +0100
Message-Id: <20250129123250.711910-3-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250129123250.711910-1-arikalo@gmail.com>
References: <20250129123250.711910-1-arikalo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Burton <paulburton@kernel.org>

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
---
 arch/mips/kernel/pm-cps.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/arch/mips/kernel/pm-cps.c b/arch/mips/kernel/pm-cps.c
index d09ca77e624d..9369a8dc385e 100644
--- a/arch/mips/kernel/pm-cps.c
+++ b/arch/mips/kernel/pm-cps.c
@@ -57,10 +57,7 @@ static DEFINE_PER_CPU_ALIGNED(u32*, ready_count);
 /* Indicates online CPUs coupled with the current CPU */
 static DEFINE_PER_CPU_ALIGNED(cpumask_t, online_coupled);
 
-/*
- * Used to synchronize entry to deep idle states. Actually per-core rather
- * than per-CPU.
- */
+/* Used to synchronize entry to deep idle states */
 static DEFINE_PER_CPU_ALIGNED(atomic_t, pm_barrier);
 
 /* Saved CPU state across the CPS_PM_POWER_GATED state */
@@ -112,9 +109,10 @@ int cps_pm_enter_state(enum cps_pm_state state)
 	cps_nc_entry_fn entry;
 	struct core_boot_config *core_cfg;
 	struct vpe_boot_config *vpe_cfg;
+	atomic_t *barrier;
 
 	/* Check that there is an entry function for this state */
-	entry = per_cpu(nc_asm_enter, core)[state];
+	entry = per_cpu(nc_asm_enter, cpu)[state];
 	if (!entry)
 		return -EINVAL;
 
@@ -150,7 +148,7 @@ int cps_pm_enter_state(enum cps_pm_state state)
 	smp_mb__after_atomic();
 
 	/* Create a non-coherent mapping of the core ready_count */
-	core_ready_count = per_cpu(ready_count, core);
+	core_ready_count = per_cpu(ready_count, cpu);
 	nc_addr = kmap_noncoherent(virt_to_page(core_ready_count),
 				   (unsigned long)core_ready_count);
 	nc_addr += ((unsigned long)core_ready_count & ~PAGE_MASK);
@@ -158,7 +156,8 @@ int cps_pm_enter_state(enum cps_pm_state state)
 
 	/* Ensure ready_count is zero-initialised before the assembly runs */
 	WRITE_ONCE(*nc_core_ready_count, 0);
-	coupled_barrier(&per_cpu(pm_barrier, core), online);
+	barrier = &per_cpu(pm_barrier, cpumask_first(&cpu_sibling_map[cpu]));
+	coupled_barrier(barrier, online);
 
 	/* Run the generated entry code */
 	left = entry(online, nc_core_ready_count);
@@ -629,12 +628,14 @@ static void *cps_gen_entry_code(unsigned cpu, enum cps_pm_state state)
 
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
@@ -646,16 +647,19 @@ static int cps_pm_online_cpu(unsigned int cpu)
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
2.25.1


