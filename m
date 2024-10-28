Return-Path: <linux-mips+bounces-6518-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A34F09B388F
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 19:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C77A41C22609
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 18:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 823331E0B7A;
	Mon, 28 Oct 2024 17:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQhJmqHw"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0B01DF976;
	Mon, 28 Oct 2024 17:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730138397; cv=none; b=jq1rhcwgThzS9ru1t8p9DfgtxPWGl++ZhW4qKcYDZsdGgpaS5hc1SgZ9QK7ujIklv88BePClQQTIOFkVNJDtTPoERsI5qxPYc5fbNkjNJllruv8yP5ESb4J02JgYQcNQ7Ccbq3XU/yzi/lGPaTckrmoKtUwesT8D6GY+hpIpPPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730138397; c=relaxed/simple;
	bh=juegPF0QAfCy/64jfsXI53FQb/EgNPwFWBJGG+Zvlro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nDdiOuc3LC/w2JdV/jHxI0yYjlolC1AZrK2aV8nlOnJ5xvFBLmdu5eW8O868B84pqJ5gAMs4TER7ZY9bklqShDLBgvKPGOK6ZNsCw8LEbhvW+Gi4KELu69RMMnsp9x+HSi0/PICUPTnUpFThdFnBKPbSD8Inq1PspC9uECDog3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQhJmqHw; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c935d99dc5so5240350a12.1;
        Mon, 28 Oct 2024 10:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730138393; x=1730743193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxVQmw22U/pUgtkzMWu3ru0gpeZOa1eNAUYZCGmjfkg=;
        b=aQhJmqHwHOsCNfGMOQ6d7YgekMkcmQNyUrPBq0FB0UHh4jujrBPRpcDhlqEn6Tf8dr
         /D1GFObo09bVxiB4WVUcNXRyqH4/YqHkFBPyXgUGK8Q34xLDKkJnRDBNRiY2ovyUO35E
         u/WCBT6YF1Ft1YRYbmWkNRTYHCJyhTt5gKynpd6toK4tB71viMwLqMOUa7sLIojV95OQ
         dUtGn4YdC0wDaOIPUVrrYCT7pNw/aGn3Q95V6dcDeYq6LB7X2C+UnAa36I3BURP1i+iL
         nfmW+juvvuJhGtHR5E+9cHvrO2YB5o3Td6Rh4HmlWNOXvMEP+B50hqEwalvpt+Akd3cF
         fZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730138393; x=1730743193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxVQmw22U/pUgtkzMWu3ru0gpeZOa1eNAUYZCGmjfkg=;
        b=QBvSS7jT43O+PMO9+x+40CrJ039uvdrTKyYgXA8MPl7NarWE3kHMQXhUPSerurJaUu
         +NHk5q6/iyYJ6iIeOZYnExOHH056JHOT3qG9AswzqVDq4snIM6hOQqo2m/E0emuQ0UFw
         d14jFfUsaTJopENEQrxv2oNZ/c/d1u5IPAmNAxRkNUHSlPCoCM1ARzHkDmyebKSjMjgy
         V5LftuaE5+uDpHED3OF15H+Oysh3loKcLlY6zRCl4/BpU+vsj+92w6ji5CW274+BFtap
         TCvCAziAir3mwcJTpj1CAvHjsIVuFjzOPDveVhnlaYuiILTLpv1YGvy3hlQQleanPvs7
         FI9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMMMA4pjr+hx+aPC/C3y2Buaf1p9LaDcOzmUnkuE0GUh235FJxiTVC644PSe0o8mo9ghimMereDYyuFiRv@vger.kernel.org, AJvYcCW458K65kN38YIrBD7QDBb/B6RdA5saZWgDA/3G7orQyNOD5lRSogw/9w2vcq2dFB4G8e8IKmCcCxJ7@vger.kernel.org, AJvYcCXvcH25KvSLd8MTH7+xMlTMGs70PRcT9wYZNqpk3sPe6bTMauKkyjPdJuFDyQnsG5ctT0l8sltDZyTsIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO0S0L57Fbwvf7H1rh+ZCSQkF3x3aoSatVnfnOIUgAvDGUGs0P
	Xkx7lkEpdTpfwMynXSU1WTCMQpYm7b2skDq6if/pmH3kCs96X7xB
X-Google-Smtp-Source: AGHT+IFskJ3dWZJhyzh76NiXogiRVmfnB0os/ljT/42MYxlNH3EIlxWwM5k43kzT7XbpQeNd+0qfnw==
X-Received: by 2002:a17:907:7e8e:b0:a99:e939:d69e with SMTP id a640c23a62f3a-a9de61d1a8cmr674720266b.51.1730138392955;
        Mon, 28 Oct 2024 10:59:52 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1dfbdfe2sm396990766b.36.2024.10.28.10.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:59:52 -0700 (PDT)
From: Aleksandar Rikalo <arikalo@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Theo Lebrun <theo.lebrun@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	devicetree@vger.kernel.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Chao-ying Fu <cfu@wavecomp.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Paul Burton <paulburton@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Aleksandar Rikalo <arikalo@gmail.com>
Subject: [PATCH v8 07/13] MIPS: pm-cps: Use per-CPU variables as per-CPU, not per-core
Date: Mon, 28 Oct 2024 18:59:29 +0100
Message-Id: <20241028175935.51250-8-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241028175935.51250-1-arikalo@gmail.com>
References: <20241028175935.51250-1-arikalo@gmail.com>
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


