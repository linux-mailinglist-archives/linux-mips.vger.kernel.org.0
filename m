Return-Path: <linux-mips+bounces-5546-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DB99765B0
	for <lists+linux-mips@lfdr.de>; Thu, 12 Sep 2024 11:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13FF31C215E1
	for <lists+linux-mips@lfdr.de>; Thu, 12 Sep 2024 09:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB051A264F;
	Thu, 12 Sep 2024 09:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHxvXhFz"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C331A2629;
	Thu, 12 Sep 2024 09:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726133472; cv=none; b=ShuY8pKle0Q79XiKGE9r1GCWWbCWfwPGskoKUi3lSx07VNC9XJOe2gpk6mguuiBl3CCPhKa2v+lpuovcUn3MqwNo3A3tNzBzTprHKXIn1JFHuwt+zgg2UxcKZD5yRlPDJuvh9Qvsx/Pks8CWP37N+rENNxVKa2rEs2A6CmkA1bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726133472; c=relaxed/simple;
	bh=QKto5A9MIMK/IEg/kWynx+UpUoTjf00hu+AW07gvz90=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=boi/sgICyDnEdOGUyjyKEgPoV+gt61xM1PX5xVAXK7145YPvhb9Tk8rhm6B8CZZ+rqkyhOyPikEsQ2PjKhtrv6wIXI8POTFKF5Gh413GjyYkMQXPPHLq6g2957GKbPmyYDwmpikXAXrfuD9XF6lMpFxrZvVr/WydYlYk6jev1Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHxvXhFz; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cb1e623d1so6861195e9.0;
        Thu, 12 Sep 2024 02:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726133469; x=1726738269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Wui8yC11QzS3zuL6au0E0B/rgxgmkQnWbsEcia4kwc=;
        b=dHxvXhFzPyOPhHn7XgXThDBU/osrJRzY3uMW/+aJrDY/iwqtuGX/2U+BdCt1WvfMpD
         LNLsS5WUsj4rl4Zsz34dW3GX0cYQxHfnMmkqHMK+cJuWTBLY8ua8W3teoMBRcCn+yQ+F
         ZHjlcBuDc+IISIiwobG8Kfyejk50TU2fmXR6/2xkV3Gq2gS8eXPCVba59SrG2OOesG2q
         16559qxyFylDUDRqiOeWpwuLrpPuBpy/49u4nmCTVUo5ZNxx5jdBxPi/57sfv7Udd0Mq
         1OIUv8f3lv2KeQX7Q72NzPcRjkEeVPauejCrF9bXNhhTneroFBe17U0jyGWyBUg/lT8V
         rgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726133469; x=1726738269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Wui8yC11QzS3zuL6au0E0B/rgxgmkQnWbsEcia4kwc=;
        b=OZx/0dVkqH2DWYFiJsLHpIlkAXegCkXjm1KvV7DU7KhoY3yl8c26tTtJFagAjeg838
         CuKIYEYmAoQocw8QBUmBGlIRb1ndA8yHVa9Wg/kDxRfM0zbJBc4W+Qri1v8J9uosX+xe
         +QVpuMBMwmnrxktZcisaQKXet+WAtqfTY33FhxpbLwYEYbehzC5LWQotLz2rBxJiH/D/
         Ns90EKkPp3iRSMqpPz5Od789jHseDRo2uRYpba5f5+WcsFv2efuHR2yvKGlPvF5Ww1DX
         DkguEQVCbgxXwUldNHQKywXS8ByG6TQIPe8nnDtZ+TsJtMtPAZQY6q/oDXgAVWT4QlZD
         22Kg==
X-Forwarded-Encrypted: i=1; AJvYcCV+IqRCRhzaUUJsvnV64daexcAg7YIPf/gfjsqlRus5U6OLSk99Dq/6C+ohA2PcLTwFFgpSDLD4bzFLnZE=@vger.kernel.org, AJvYcCVvNlqJJ/OzFsGdYiNVrsPd0+7CchS0U9E7Udg9uJYhO0NkA9PoTDUKrHjnvz8mClO7CeahZgLI3VNW+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzV+nppZbNDtw6mz7oRHZkslVmxS0Oe65wN9M0018bhud2wsHlk
	xrUVNTJPaognuFIqP2GtkIxKqSsimWojKf5hAdtW0NkauayzX4ow
X-Google-Smtp-Source: AGHT+IGp1wkVvQWdjaHcKTwqKUkmNIxMIKB8Y7zndoWBL1GCFcS3YugVMp+fB/uTdIsF04nJrJ0l5A==
X-Received: by 2002:a05:600c:1c29:b0:42c:bd27:4be4 with SMTP id 5b1f17b1804b1-42cdb531e7emr17811645e9.8.1726133469021;
        Thu, 12 Sep 2024 02:31:09 -0700 (PDT)
Received: from localhost.localdomain ([212.200.182.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cc137556esm76688225e9.1.2024.09.12.02.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 02:31:08 -0700 (PDT)
From: Aleksandar Rikalo <arikalo@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Aleksandar Rikalo <arikalo@gmail.com>,
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
	Thomas Gleixner <tglx@linutronix.de>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH v6 7/9] MIPS: pm-cps: Use per-CPU variables as per-CPU, not per-core
Date: Thu, 12 Sep 2024 11:30:49 +0200
Message-Id: <20240912093051.452172-8-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240912093051.452172-1-arikalo@gmail.com>
References: <20240912093051.452172-1-arikalo@gmail.com>
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


