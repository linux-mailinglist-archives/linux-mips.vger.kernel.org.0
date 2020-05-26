Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09EE01BF465
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 11:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbgD3Jp3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Apr 2020 05:45:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726396AbgD3Jp2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Apr 2020 05:45:28 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2124C035494
        for <linux-mips@vger.kernel.org>; Thu, 30 Apr 2020 02:45:28 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id t40so490462pjb.3
        for <linux-mips@vger.kernel.org>; Thu, 30 Apr 2020 02:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=4AEa1PSGrXJDWUUpiUe1Pt40unN/gyP4NzQq+JJVpCQ=;
        b=ZGb/M+TQrMBJu+t2M7jTC07EgLyHkHczFWttrb5pXVHv0gieHrGv10dR7vvEp8menK
         uYSnMtQsrcHM8Qzwcig1C8jjvx/EvCATAypIgQAVeMPrzF9Rb71oOrqkBNbunuGVDSQH
         zPNGsGVoGvBfyz6hVbjAR7WdOHNCJ8MoRDf7GJA12twhZ+4IrThw/al7Jwlqclvv7Alg
         ZP3CYYFOMQClAxky9YGq5sLb82xOD+fu7Mkl/CPttrsYF8589UpO+qxHDsVrOgHtv95c
         PwQnV44AlhibaGDZdeBMr6h+kNZRgsOLuKaTFMMDYf9CJygn6krW0cDbc8QlK+r75xhW
         AbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=4AEa1PSGrXJDWUUpiUe1Pt40unN/gyP4NzQq+JJVpCQ=;
        b=sAr2uHEBmGTNXGDDvhXKduK4w5/8MxaV7EXJvR6Yhk0jXodBWvuzmW3okE9YOlPjv3
         t+gSAUjyx7GcNHQmlqtAJfs0I3ygKJtUlhoNGrjkXIQZKs4RwbLSEGaT5HrzwmzsNKmr
         y1/Ho5NxAxs93KQWk4Vnaf83+Dpss68fRa/FTSdJFurYLEYOQeOXEP38n9tYlKuQciff
         8oKEEkRx7ERB4vN6ijtOI3iGJyknmmkwhEaVYLExfj5DAcruqt+UQsuO/AZIKejU2Wo+
         2PcVS8dKKqOUfSNDKkSTUKWFHPi+BoE/EA590qUuzHBn62Gs9FXoWqv/VhHqOvNxNFfO
         QhGA==
X-Gm-Message-State: AGi0PuZ8alpgHY8k+cP6qhffen2DV3TjTdCE8bx5aPBauDm3XznOrnco
        k8D5Ommv4UK18h6I4ZkJfrU/AJKmFtM=
X-Google-Smtp-Source: APiQypKChLArMlrQIMhaUOyWFujjk0lSIN8U0Ca7K1gCIJ8PXcNlixAMa1tgshLC5GaOfu4oRtnMVw==
X-Received: by 2002:a17:902:7809:: with SMTP id p9mr2864731pll.190.1588239928286;
        Thu, 30 Apr 2020 02:45:28 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id a99sm1317377pje.35.2020.04.30.02.45.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Apr 2020 02:45:27 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V3 1/2] MIPS: perf: Add hardware perf events support for new Loongson-3
Date:   Thu, 30 Apr 2020 17:45:16 +0800
Message-Id: <1588239917-23054-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

New Loongson-3 means Loongson-3A R2 (Loongson-3A2000) and newer CPUs.
Loongson-3 processors have three types of PMU types (so there are three
event maps): Loongson-3A1000/Loonngson-3B1000/Loongson-3B1500 is Type-1,
Loongson-3A2000/Loongson-3A3000 is Type-2, Loongson-3A4000+ is Type-3.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 .../asm/mach-loongson64/cpu-feature-overrides.h    |   1 +
 arch/mips/kernel/perf_event_mipsxx.c               | 365 +++++++++++++++++++--
 2 files changed, 337 insertions(+), 29 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h b/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
index 4fab38c..b6e9c99 100644
--- a/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
@@ -48,5 +48,6 @@
 #define cpu_hwrena_impl_bits	0xc0000000
 #define cpu_has_mac2008_only	1
 #define cpu_has_mips_r2_exec_hazard 0
+#define cpu_has_perf_cntr_intr_bit	0
 
 #endif /* __ASM_MACH_LOONGSON64_CPU_FEATURE_OVERRIDES_H */
diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
index 128fc99..d1e8147 100644
--- a/arch/mips/kernel/perf_event_mipsxx.c
+++ b/arch/mips/kernel/perf_event_mipsxx.c
@@ -90,6 +90,7 @@ struct mips_pmu {
 	unsigned int	num_counters;
 };
 
+static int counter_bits;
 static struct mips_pmu mipspmu;
 
 #define M_PERFCTL_EVENT(event)		(((event) << MIPS_PERFCTRL_EVENT_S) & \
@@ -118,6 +119,7 @@ static struct mips_pmu mipspmu;
 #define M_PERFCTL_CONFIG_MASK		0x1f
 #endif
 
+#define CNTR_BIT_MASK(n)	(((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
 
 #ifdef CONFIG_MIPS_PERF_SHARED_TC_COUNTERS
 static DEFINE_RWLOCK(pmuint_rwlock);
@@ -154,6 +156,31 @@ static void pause_local_counters(void);
 static irqreturn_t mipsxx_pmu_handle_irq(int, void *);
 static int mipsxx_pmu_handle_shared_irq(void);
 
+/* 0: Not Loongson-3
+ * 1: Loongson-3A1000/3B1000/3B1500
+ * 2: Loongson-3A2000/3A3000
+ * 3: Loongson-3A4000+
+ */
+
+#define LOONGSON_PMU_TYPE0 0
+#define LOONGSON_PMU_TYPE1 1
+#define LOONGSON_PMU_TYPE2 2
+#define LOONGSON_PMU_TYPE3 3
+
+static inline int get_loongson3_pmu_type(void)
+{
+	if (boot_cpu_type() != CPU_LOONGSON64)
+		return LOONGSON_PMU_TYPE0;
+	if ((boot_cpu_data.processor_id & PRID_COMP_MASK) == PRID_COMP_LEGACY)
+		return LOONGSON_PMU_TYPE1;
+	if ((boot_cpu_data.processor_id & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64C)
+		return LOONGSON_PMU_TYPE2;
+	if ((boot_cpu_data.processor_id & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64G)
+		return LOONGSON_PMU_TYPE3;
+
+	return LOONGSON_PMU_TYPE0;
+}
+
 static unsigned int mipsxx_pmu_swizzle_perf_idx(unsigned int idx)
 {
 	if (vpe_id() == 1)
@@ -186,17 +213,18 @@ static u64 mipsxx_pmu_read_counter(unsigned int idx)
 
 static u64 mipsxx_pmu_read_counter_64(unsigned int idx)
 {
+	u64 mask = CNTR_BIT_MASK(counter_bits);
 	idx = mipsxx_pmu_swizzle_perf_idx(idx);
 
 	switch (idx) {
 	case 0:
-		return read_c0_perfcntr0_64();
+		return read_c0_perfcntr0_64() & mask;
 	case 1:
-		return read_c0_perfcntr1_64();
+		return read_c0_perfcntr1_64() & mask;
 	case 2:
-		return read_c0_perfcntr2_64();
+		return read_c0_perfcntr2_64() & mask;
 	case 3:
-		return read_c0_perfcntr3_64();
+		return read_c0_perfcntr3_64() & mask;
 	default:
 		WARN_ONCE(1, "Invalid performance counter number (%d)\n", idx);
 		return 0;
@@ -225,6 +253,7 @@ static void mipsxx_pmu_write_counter(unsigned int idx, u64 val)
 
 static void mipsxx_pmu_write_counter_64(unsigned int idx, u64 val)
 {
+	val &= CNTR_BIT_MASK(counter_bits);
 	idx = mipsxx_pmu_swizzle_perf_idx(idx);
 
 	switch (idx) {
@@ -286,12 +315,16 @@ static int mipsxx_pmu_alloc_counter(struct cpu_hw_events *cpuc,
 				    struct hw_perf_event *hwc)
 {
 	int i;
+	unsigned long cntr_mask;
 
 	/*
 	 * We only need to care the counter mask. The range has been
 	 * checked definitely.
 	 */
-	unsigned long cntr_mask = (hwc->event_base >> 8) & 0xffff;
+	if (get_loongson3_pmu_type() == LOONGSON_PMU_TYPE2)
+		cntr_mask = (hwc->event_base >> 10) & 0xffff;
+	else
+		cntr_mask = (hwc->event_base >> 8) & 0xffff;
 
 	for (i = mipspmu.num_counters - 1; i >= 0; i--) {
 		/*
@@ -320,10 +353,16 @@ static void mipsxx_pmu_enable_event(struct hw_perf_event *evt, int idx)
 
 	WARN_ON(idx < 0 || idx >= mipspmu.num_counters);
 
-	cpuc->saved_ctrl[idx] = M_PERFCTL_EVENT(evt->event_base & 0xff) |
-		(evt->config_base & M_PERFCTL_CONFIG_MASK) |
-		/* Make sure interrupt enabled. */
-		MIPS_PERFCTRL_IE;
+	if (get_loongson3_pmu_type() == LOONGSON_PMU_TYPE2)
+		cpuc->saved_ctrl[idx] = M_PERFCTL_EVENT(evt->event_base & 0x3ff) |
+			(evt->config_base & M_PERFCTL_CONFIG_MASK) |
+			/* Make sure interrupt enabled. */
+			MIPS_PERFCTRL_IE;
+	else
+		cpuc->saved_ctrl[idx] = M_PERFCTL_EVENT(evt->event_base & 0xff) |
+			(evt->config_base & M_PERFCTL_CONFIG_MASK) |
+			/* Make sure interrupt enabled. */
+			MIPS_PERFCTRL_IE;
 
 	if (IS_ENABLED(CONFIG_CPU_BMIPS5000)) {
 		/* enable the counter for the calling thread */
@@ -396,6 +435,10 @@ static int mipspmu_event_set_period(struct perf_event *event,
 
 	local64_set(&hwc->prev_count, mipspmu.overflow - left);
 
+	if (get_loongson3_pmu_type() == LOONGSON_PMU_TYPE2)
+		mipsxx_pmu_write_control(idx,
+				M_PERFCTL_EVENT(hwc->event_base & 0x3ff));
+
 	mipspmu.write_counter(idx, mipspmu.overflow - left);
 
 	perf_event_update_userpage(event);
@@ -667,8 +710,14 @@ static unsigned int mipspmu_perf_event_encode(const struct mips_perf_event *pev)
 			(pev->event_id & 0xff);
 	else
 #endif /* CONFIG_MIPS_MT_SMP */
-		return ((pev->cntr_mask & 0xffff00) |
-			(pev->event_id & 0xff));
+	{
+		if (get_loongson3_pmu_type() == LOONGSON_PMU_TYPE2)
+			return (pev->cntr_mask & 0xfffc00) |
+				(pev->event_id & 0x3ff);
+		else
+			return (pev->cntr_mask & 0xffff00) |
+				(pev->event_id & 0xff);
+	}
 }
 
 static const struct mips_perf_event *mipspmu_map_general_event(int idx)
@@ -783,9 +832,87 @@ static int n_counters(void)
 	return counters;
 }
 
+static void loongson3_reset_counters(void *arg)
+{
+	int counters = (int)(long)arg;
+
+	switch (counters) {
+	case 4:
+		mipsxx_pmu_write_control(3, 0);
+		mipspmu.write_counter(3, 0);
+		mipsxx_pmu_write_control(3, 127<<5);
+		mipspmu.write_counter(3, 0);
+		mipsxx_pmu_write_control(3, 191<<5);
+		mipspmu.write_counter(3, 0);
+		mipsxx_pmu_write_control(3, 255<<5);
+		mipspmu.write_counter(3, 0);
+		mipsxx_pmu_write_control(3, 319<<5);
+		mipspmu.write_counter(3, 0);
+		mipsxx_pmu_write_control(3, 383<<5);
+		mipspmu.write_counter(3, 0);
+		mipsxx_pmu_write_control(3, 575<<5);
+		mipspmu.write_counter(3, 0);
+		/* fall through */
+	case 3:
+		mipsxx_pmu_write_control(2, 0);
+		mipspmu.write_counter(2, 0);
+		mipsxx_pmu_write_control(2, 127<<5);
+		mipspmu.write_counter(2, 0);
+		mipsxx_pmu_write_control(2, 191<<5);
+		mipspmu.write_counter(2, 0);
+		mipsxx_pmu_write_control(2, 255<<5);
+		mipspmu.write_counter(2, 0);
+		mipsxx_pmu_write_control(2, 319<<5);
+		mipspmu.write_counter(2, 0);
+		mipsxx_pmu_write_control(2, 383<<5);
+		mipspmu.write_counter(2, 0);
+		mipsxx_pmu_write_control(2, 575<<5);
+		mipspmu.write_counter(2, 0);
+		/* fall through */
+	case 2:
+		mipsxx_pmu_write_control(1, 0);
+		mipspmu.write_counter(1, 0);
+		mipsxx_pmu_write_control(1, 127<<5);
+		mipspmu.write_counter(1, 0);
+		mipsxx_pmu_write_control(1, 191<<5);
+		mipspmu.write_counter(1, 0);
+		mipsxx_pmu_write_control(1, 255<<5);
+		mipspmu.write_counter(1, 0);
+		mipsxx_pmu_write_control(1, 319<<5);
+		mipspmu.write_counter(1, 0);
+		mipsxx_pmu_write_control(1, 383<<5);
+		mipspmu.write_counter(1, 0);
+		mipsxx_pmu_write_control(1, 575<<5);
+		mipspmu.write_counter(1, 0);
+		/* fall through */
+	case 1:
+		mipsxx_pmu_write_control(0, 0);
+		mipspmu.write_counter(0, 0);
+		mipsxx_pmu_write_control(0, 127<<5);
+		mipspmu.write_counter(0, 0);
+		mipsxx_pmu_write_control(0, 191<<5);
+		mipspmu.write_counter(0, 0);
+		mipsxx_pmu_write_control(0, 255<<5);
+		mipspmu.write_counter(0, 0);
+		mipsxx_pmu_write_control(0, 319<<5);
+		mipspmu.write_counter(0, 0);
+		mipsxx_pmu_write_control(0, 383<<5);
+		mipspmu.write_counter(0, 0);
+		mipsxx_pmu_write_control(0, 575<<5);
+		mipspmu.write_counter(0, 0);
+		/* fall through */
+	}
+}
+
 static void reset_counters(void *arg)
 {
 	int counters = (int)(long)arg;
+
+	if (get_loongson3_pmu_type() == LOONGSON_PMU_TYPE2) {
+		loongson3_reset_counters(arg);
+		return;
+	}
+
 	switch (counters) {
 	case 4:
 		mipsxx_pmu_write_control(3, 0);
@@ -834,13 +961,30 @@ static const struct mips_perf_event i6x00_event_map[PERF_COUNT_HW_MAX] = {
 	[PERF_COUNT_HW_BRANCH_MISSES]       = { 0x16, CNTR_EVEN | CNTR_ODD },
 };
 
-static const struct mips_perf_event loongson3_event_map[PERF_COUNT_HW_MAX] = {
+static const struct mips_perf_event loongson3_event_map1[PERF_COUNT_HW_MAX] = {
 	[PERF_COUNT_HW_CPU_CYCLES] = { 0x00, CNTR_EVEN },
 	[PERF_COUNT_HW_INSTRUCTIONS] = { 0x00, CNTR_ODD },
 	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS] = { 0x01, CNTR_EVEN },
 	[PERF_COUNT_HW_BRANCH_MISSES] = { 0x01, CNTR_ODD },
 };
 
+static const struct mips_perf_event loongson3_event_map2[PERF_COUNT_HW_MAX] = {
+	[PERF_COUNT_HW_CPU_CYCLES] = { 0x80, CNTR_ALL },
+	[PERF_COUNT_HW_INSTRUCTIONS] = { 0x81, CNTR_ALL },
+	[PERF_COUNT_HW_CACHE_MISSES] = { 0x18, CNTR_ALL },
+	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS] = { 0x94, CNTR_ALL },
+	[PERF_COUNT_HW_BRANCH_MISSES] = { 0x9c, CNTR_ALL },
+};
+
+static const struct mips_perf_event loongson3_event_map3[PERF_COUNT_HW_MAX] = {
+	[PERF_COUNT_HW_CPU_CYCLES] = { 0x00, CNTR_ALL },
+	[PERF_COUNT_HW_INSTRUCTIONS] = { 0x01, CNTR_ALL },
+	[PERF_COUNT_HW_CACHE_REFERENCES] = { 0x1c, CNTR_ALL },
+	[PERF_COUNT_HW_CACHE_MISSES] = { 0x1d, CNTR_ALL },
+	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS] = { 0x02, CNTR_ALL },
+	[PERF_COUNT_HW_BRANCH_MISSES] = { 0x08, CNTR_ALL },
+};
+
 static const struct mips_perf_event octeon_event_map[PERF_COUNT_HW_MAX] = {
 	[PERF_COUNT_HW_CPU_CYCLES] = { 0x01, CNTR_ALL },
 	[PERF_COUNT_HW_INSTRUCTIONS] = { 0x03, CNTR_ALL },
@@ -1064,7 +1208,7 @@ static const struct mips_perf_event i6x00_cache_map
 },
 };
 
-static const struct mips_perf_event loongson3_cache_map
+static const struct mips_perf_event loongson3_cache_map1
 				[PERF_COUNT_HW_CACHE_MAX]
 				[PERF_COUNT_HW_CACHE_OP_MAX]
 				[PERF_COUNT_HW_CACHE_RESULT_MAX] = {
@@ -1109,12 +1253,127 @@ static const struct mips_perf_event loongson3_cache_map
 [C(BPU)] = {
 	/* Using the same code for *HW_BRANCH* */
 	[C(OP_READ)] = {
-		[C(RESULT_ACCESS)]      = { 0x02, CNTR_EVEN },
-		[C(RESULT_MISS)]        = { 0x02, CNTR_ODD },
+		[C(RESULT_ACCESS)]      = { 0x01, CNTR_EVEN },
+		[C(RESULT_MISS)]        = { 0x01, CNTR_ODD },
+	},
+	[C(OP_WRITE)] = {
+		[C(RESULT_ACCESS)]      = { 0x01, CNTR_EVEN },
+		[C(RESULT_MISS)]        = { 0x01, CNTR_ODD },
+	},
+},
+};
+
+static const struct mips_perf_event loongson3_cache_map2
+				[PERF_COUNT_HW_CACHE_MAX]
+				[PERF_COUNT_HW_CACHE_OP_MAX]
+				[PERF_COUNT_HW_CACHE_RESULT_MAX] = {
+[C(L1D)] = {
+	/*
+	 * Like some other architectures (e.g. ARM), the performance
+	 * counters don't differentiate between read and write
+	 * accesses/misses, so this isn't strictly correct, but it's the
+	 * best we can do. Writes and reads get combined.
+	 */
+	[C(OP_READ)] = {
+		[C(RESULT_ACCESS)]	= { 0x156, CNTR_ALL },
 	},
 	[C(OP_WRITE)] = {
-		[C(RESULT_ACCESS)]      = { 0x02, CNTR_EVEN },
-		[C(RESULT_MISS)]        = { 0x02, CNTR_ODD },
+		[C(RESULT_ACCESS)]	= { 0x155, CNTR_ALL },
+		[C(RESULT_MISS)]        = { 0x153, CNTR_ALL },
+	},
+},
+[C(L1I)] = {
+	[C(OP_READ)] = {
+		[C(RESULT_MISS)]	= { 0x18, CNTR_ALL },
+	},
+	[C(OP_WRITE)] = {
+		[C(RESULT_MISS)]        = { 0x18, CNTR_ALL },
+	},
+},
+[C(LL)] = {
+	[C(OP_READ)] = {
+		[C(RESULT_ACCESS)]	= { 0x1b6, CNTR_ALL },
+	},
+	[C(OP_WRITE)] = {
+		[C(RESULT_ACCESS)]	= { 0x1b7, CNTR_ALL },
+	},
+	[C(OP_PREFETCH)] = {
+		[C(RESULT_ACCESS)]	= { 0x1bf, CNTR_ALL },
+	},
+},
+[C(DTLB)] = {
+	[C(OP_READ)] = {
+		[C(RESULT_MISS)]        = { 0x92, CNTR_ALL },
+	},
+	[C(OP_WRITE)] = {
+		[C(RESULT_MISS)]        = { 0x92, CNTR_ALL },
+	},
+},
+[C(ITLB)] = {
+	[C(OP_READ)] = {
+		[C(RESULT_MISS)]	= { 0x1a, CNTR_ALL },
+	},
+	[C(OP_WRITE)] = {
+		[C(RESULT_MISS)]	= { 0x1a, CNTR_ALL },
+	},
+},
+[C(BPU)] = {
+	/* Using the same code for *HW_BRANCH* */
+	[C(OP_READ)] = {
+		[C(RESULT_ACCESS)]      = { 0x94, CNTR_ALL },
+		[C(RESULT_MISS)]        = { 0x9c, CNTR_ALL },
+	},
+},
+};
+
+static const struct mips_perf_event loongson3_cache_map3
+				[PERF_COUNT_HW_CACHE_MAX]
+				[PERF_COUNT_HW_CACHE_OP_MAX]
+				[PERF_COUNT_HW_CACHE_RESULT_MAX] = {
+[C(L1D)] = {
+	/*
+	 * Like some other architectures (e.g. ARM), the performance
+	 * counters don't differentiate between read and write
+	 * accesses/misses, so this isn't strictly correct, but it's the
+	 * best we can do. Writes and reads get combined.
+	 */
+	[C(OP_READ)] = {
+		[C(RESULT_ACCESS)]      = { 0x1e, CNTR_ALL },
+		[C(RESULT_MISS)]        = { 0x1f, CNTR_ALL },
+	},
+	[C(OP_PREFETCH)] = {
+		[C(RESULT_ACCESS)]	= { 0xaa, CNTR_ALL },
+		[C(RESULT_MISS)]	= { 0xa9, CNTR_ALL },
+	},
+},
+[C(L1I)] = {
+	[C(OP_READ)] = {
+		[C(RESULT_ACCESS)]	= { 0x1c, CNTR_ALL },
+		[C(RESULT_MISS)]	= { 0x1d, CNTR_ALL },
+	},
+},
+[C(LL)] = {
+	[C(OP_READ)] = {
+		[C(RESULT_ACCESS)]	= { 0x2e, CNTR_ALL },
+		[C(RESULT_MISS)]	= { 0x2f, CNTR_ALL },
+	},
+},
+[C(DTLB)] = {
+	[C(OP_READ)] = {
+		[C(RESULT_ACCESS)]      = { 0x14, CNTR_ALL },
+		[C(RESULT_MISS)]	= { 0x1b, CNTR_ALL },
+	},
+},
+[C(ITLB)] = {
+	[C(OP_READ)] = {
+		[C(RESULT_MISS)]	= { 0x1a, CNTR_ALL },
+	},
+},
+[C(BPU)] = {
+	/* Using the same code for *HW_BRANCH* */
+	[C(OP_READ)] = {
+		[C(RESULT_ACCESS)]      = { 0x02, CNTR_ALL },
+		[C(RESULT_MISS)]        = { 0x08, CNTR_ALL },
 	},
 },
 };
@@ -1178,7 +1437,6 @@ static const struct mips_perf_event bmips5000_cache_map
 },
 };
 
-
 static const struct mips_perf_event octeon_cache_map
 				[PERF_COUNT_HW_CACHE_MAX]
 				[PERF_COUNT_HW_CACHE_OP_MAX]
@@ -1512,6 +1770,7 @@ static irqreturn_t mipsxx_pmu_handle_irq(int irq, void *dev)
 static const struct mips_perf_event *mipsxx_pmu_map_raw_event(u64 config)
 {
 	/* currently most cores have 7-bit event numbers */
+	int pmu_type;
 	unsigned int raw_id = config & 0xff;
 	unsigned int base_id = raw_id & 0x7f;
 
@@ -1624,8 +1883,33 @@ static const struct mips_perf_event *mipsxx_pmu_map_raw_event(u64 config)
 				raw_id > 127 ? CNTR_ODD : CNTR_EVEN;
 		break;
 	case CPU_LOONGSON64:
-		raw_event.cntr_mask = raw_id > 127 ? CNTR_ODD : CNTR_EVEN;
-	break;
+		pmu_type = get_loongson3_pmu_type();
+
+		switch (pmu_type) {
+		case LOONGSON_PMU_TYPE1:
+			raw_event.cntr_mask =
+				raw_id > 127 ? CNTR_ODD : CNTR_EVEN;
+			break;
+		case LOONGSON_PMU_TYPE2:
+			base_id = config & 0x3ff;
+			raw_event.cntr_mask = CNTR_ALL;
+
+			if ((base_id >= 1 && base_id < 28) ||
+				(base_id >= 64 && base_id < 90) ||
+				(base_id >= 128 && base_id < 164) ||
+				(base_id >= 192 && base_id < 200) ||
+				(base_id >= 256 && base_id < 274) ||
+				(base_id >= 320 && base_id < 358) ||
+				(base_id >= 384 && base_id < 574))
+				break;
+			else
+				return ERR_PTR(-EOPNOTSUPP);
+		case LOONGSON_PMU_TYPE3:
+			base_id = raw_id;
+			raw_event.cntr_mask = CNTR_ALL;
+			break;
+		}
+		break;
 	}
 
 	raw_event.event_id = base_id;
@@ -1683,8 +1967,7 @@ static const struct mips_perf_event *xlp_pmu_map_raw_event(u64 config)
 static int __init
 init_hw_perf_events(void)
 {
-	int counters, irq;
-	int counter_bits;
+	int counters, irq, pmu_type;
 
 	pr_info("Performance counters: ");
 
@@ -1771,8 +2054,25 @@ init_hw_perf_events(void)
 		break;
 	case CPU_LOONGSON64:
 		mipspmu.name = "mips/loongson3";
-		mipspmu.general_event_map = &loongson3_event_map;
-		mipspmu.cache_event_map = &loongson3_cache_map;
+		pmu_type = get_loongson3_pmu_type();
+
+		switch (pmu_type) {
+		case LOONGSON_PMU_TYPE1:
+			counters = 2;
+			mipspmu.general_event_map = &loongson3_event_map1;
+			mipspmu.cache_event_map = &loongson3_cache_map1;
+			break;
+		case LOONGSON_PMU_TYPE2:
+			counters = 4;
+			mipspmu.general_event_map = &loongson3_event_map2;
+			mipspmu.cache_event_map = &loongson3_cache_map2;
+			break;
+		case LOONGSON_PMU_TYPE3:
+			counters = 4;
+			mipspmu.general_event_map = &loongson3_event_map3;
+			mipspmu.cache_event_map = &loongson3_cache_map3;
+			break;
+		}
 		break;
 	case CPU_CAVIUM_OCTEON:
 	case CPU_CAVIUM_OCTEON_PLUS:
@@ -1803,19 +2103,26 @@ init_hw_perf_events(void)
 	mipspmu.irq = irq;
 
 	if (read_c0_perfctrl0() & MIPS_PERFCTRL_W) {
-		mipspmu.max_period = (1ULL << 63) - 1;
-		mipspmu.valid_count = (1ULL << 63) - 1;
-		mipspmu.overflow = 1ULL << 63;
+		if (get_loongson3_pmu_type() == LOONGSON_PMU_TYPE2) {
+			counter_bits = 48;
+			mipspmu.max_period = (1ULL << 47) - 1;
+			mipspmu.valid_count = (1ULL << 47) - 1;
+			mipspmu.overflow = 1ULL << 47;
+		} else {
+			counter_bits = 64;
+			mipspmu.max_period = (1ULL << 63) - 1;
+			mipspmu.valid_count = (1ULL << 63) - 1;
+			mipspmu.overflow = 1ULL << 63;
+		}
 		mipspmu.read_counter = mipsxx_pmu_read_counter_64;
 		mipspmu.write_counter = mipsxx_pmu_write_counter_64;
-		counter_bits = 64;
 	} else {
+		counter_bits = 32;
 		mipspmu.max_period = (1ULL << 31) - 1;
 		mipspmu.valid_count = (1ULL << 31) - 1;
 		mipspmu.overflow = 1ULL << 31;
 		mipspmu.read_counter = mipsxx_pmu_read_counter;
 		mipspmu.write_counter = mipsxx_pmu_write_counter;
-		counter_bits = 32;
 	}
 
 	on_each_cpu(reset_counters, (void *)(long)counters, 1);
-- 
2.7.0

