Return-Path: <linux-mips+bounces-6520-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AF89B3895
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 19:01:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAA7A1F21DD1
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 18:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31161DF991;
	Mon, 28 Oct 2024 18:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WgWzMqmo"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B1D1E0DB5;
	Mon, 28 Oct 2024 17:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730138401; cv=none; b=DdnZuLJRrYvxvC6KhHaiN8V9iPSJffGVpTuRYbzG23hOJrVz7Qsf4bSRzRrhmsWHtDHVLNkl9RFSnbgAw5uXgPGFAdqb2Ct1GsXt1CURrJxIISaLM5Qlqjhhr5b1YNwaXe0pVPlJmZgIOdShdE04CkTUoh3YgH1xjE5wBG+nFoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730138401; c=relaxed/simple;
	bh=wiHGtSxfl3n0xkDe/1B57xJyBQzlskJcWg8mMgof1LQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qTIEvel47vsPk+Rghv2ELkrtZo4X0ZMvMireQ/HRGmImpWal/zenWFD2y+OMKoX/C9CzkMpWRRb0CH+LaE1ivhkXFrGHXVCeIMgump9sqipIVQQLejVaAucwKOCYyF+Rtppz74vK3WCZL9qHrPU92/EdTjVwYvOzYjVHCgcc+EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WgWzMqmo; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9a1b71d7ffso695142466b.1;
        Mon, 28 Oct 2024 10:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730138397; x=1730743197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cuV9PDzEHrhcFYzAlFi29DYFvb0ar6cl1lK3srcUt1I=;
        b=WgWzMqmoGH7AhKFtr6MbNBcCNuOLas8XjYPIkYEhyzSzVoGgcIKfbCGL2XFPiN91gD
         TSTTTk+E9/wOg8dixoOZ7zOwS9hGbbfathbpzdYSyuhfkTNZ6Ygedy85g5gTAla84qFP
         iMIoJZmCZnrC+VrRDoxd0qVv8uggZOg7NfWG0+7AULlXIqoZUQDWfjP9Sq0e0N/vbk3B
         4YhLyF7y2MZpmUdb18nzqcoxH4Ge5n9kLDrS3FIZn6dA3HBstPpKwFQmE0cwkxW+JVPN
         rCLvX1j+fk07wggRygIy69MM7HHKimuynwFd8LBwe3ToK7+gbswbVvP+ul4qhzCcwZ20
         RDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730138397; x=1730743197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cuV9PDzEHrhcFYzAlFi29DYFvb0ar6cl1lK3srcUt1I=;
        b=eTP+Ue4DCMjTE7A464+R5Dihl7RQFSuCwReX8YnFXhIEnGi2r1sNB/E0psnSWbU1n8
         IlEd+pMSaG3ZFp6nMCyE1T5hLd8IdSf1br9+y/YrIhRNihRIlwiLSqkM2VeCb37APga1
         z9vJFjoq7pjlr8Rl43TpGBM9CzOvI1ewiT20Iv8OrXxYg7epf1DB2UjhmZjnJKQ5Exjb
         Q0xgQWtuabz4y8d3bNiR3owF7+jBgkaWJHtcuRqoziYaPlFkCrAZP8W52pahPXykIFXC
         BVcVhJp+fR1U+nboUtIh54iltIMZvt2vdP5/HCBhLi2FZZpntVwK8yoY50Nm7P2L9K4C
         BAvA==
X-Forwarded-Encrypted: i=1; AJvYcCVOWrXLbXHPRklkZyKBG3HHbs1vjQABtHQN5opHIDVVioZLUl9mhAJiNvYAq5sM7uPYmwVZhX6Fn0lu/fOt@vger.kernel.org, AJvYcCXTWP2U/35Kb2ALRXL7QBtdP5zCiLSLkuZ4oUfuhhcWkyPGkj50MZJQ3zHD6jfja6bDqsrpKiUqiIlO@vger.kernel.org, AJvYcCXzn/ERo3ARw44gRBYl8k4KVhiEbEaSoYHe8Bcbputz2abqaTpDQY9jvMGANzgeFsendiG4gQCvXJZmFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRQPCRnCQZHCSjT+EBFqhCpRsL87FyP72fwrXx/IGbHyr1cQfr
	7TzDuwpe5OW8QuUgeIshT/XeFN268PdA6fwpSSMGtfYF1Y+Rz3Kf
X-Google-Smtp-Source: AGHT+IF6PpweLBWPFmSMHCgyDq/AB+g9BAzY6m5iUbJ6saY0o+mz14J/YtCK+tskBjH5wauHcZKvQQ==
X-Received: by 2002:a17:906:7949:b0:a9a:80cc:d7b0 with SMTP id a640c23a62f3a-a9de6157a62mr674908966b.44.1730138396874;
        Mon, 28 Oct 2024 10:59:56 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1dfbdfe2sm396990766b.36.2024.10.28.10.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:59:56 -0700 (PDT)
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
Subject: [PATCH v8 09/13] MIPS: CPS: Boot CPUs in secondary clusters
Date: Mon, 28 Oct 2024 18:59:31 +0100
Message-Id: <20241028175935.51250-10-arikalo@gmail.com>
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

Probe for & boot CPUs (cores & VPs) in secondary clusters (ie. not the
cluster that began booting Linux) when they are present in systems with
CM 3.5 or higher.

Signed-off-by: Paul Burton <paulburton@kernel.org>
Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Tested-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/include/asm/mips-cm.h |  18 +++
 arch/mips/include/asm/smp-cps.h |   1 +
 arch/mips/kernel/mips-cm.c      |   4 +-
 arch/mips/kernel/smp-cps.c      | 205 ++++++++++++++++++++++++++++----
 4 files changed, 207 insertions(+), 21 deletions(-)

diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
index 1e782275850a..4d47163647dd 100644
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@ -255,6 +255,12 @@ GCR_ACCESSOR_RW(32, 0x130, l2_config)
 GCR_ACCESSOR_RO(32, 0x150, sys_config2)
 #define CM_GCR_SYS_CONFIG2_MAXVPW		GENMASK(3, 0)
 
+/* GCR_L2-RAM_CONFIG - Configuration & status of L2 cache RAMs */
+GCR_ACCESSOR_RW(64, 0x240, l2_ram_config)
+#define CM_GCR_L2_RAM_CONFIG_PRESENT		BIT(31)
+#define CM_GCR_L2_RAM_CONFIG_HCI_DONE		BIT(30)
+#define CM_GCR_L2_RAM_CONFIG_HCI_SUPPORTED	BIT(29)
+
 /* GCR_L2_PFT_CONTROL - Controls hardware L2 prefetching */
 GCR_ACCESSOR_RW(32, 0x300, l2_pft_control)
 #define CM_GCR_L2_PFT_CONTROL_PAGEMASK		GENMASK(31, 12)
@@ -266,6 +272,18 @@ GCR_ACCESSOR_RW(32, 0x308, l2_pft_control_b)
 #define CM_GCR_L2_PFT_CONTROL_B_CEN		BIT(8)
 #define CM_GCR_L2_PFT_CONTROL_B_PORTID		GENMASK(7, 0)
 
+/* GCR_L2_TAG_ADDR - Access addresses in L2 cache tags */
+GCR_ACCESSOR_RW(64, 0x600, l2_tag_addr)
+
+/* GCR_L2_TAG_STATE - Access L2 cache tag state */
+GCR_ACCESSOR_RW(64, 0x608, l2_tag_state)
+
+/* GCR_L2_DATA - Access data in L2 cache lines */
+GCR_ACCESSOR_RW(64, 0x610, l2_data)
+
+/* GCR_L2_ECC - Access ECC information from L2 cache lines */
+GCR_ACCESSOR_RW(64, 0x618, l2_ecc)
+
 /* GCR_L2SM_COP - L2 cache op state machine control */
 GCR_ACCESSOR_RW(32, 0x620, l2sm_cop)
 #define CM_GCR_L2SM_COP_PRESENT			BIT(31)
diff --git a/arch/mips/include/asm/smp-cps.h b/arch/mips/include/asm/smp-cps.h
index a629e948a6fd..10d3ebd890cb 100644
--- a/arch/mips/include/asm/smp-cps.h
+++ b/arch/mips/include/asm/smp-cps.h
@@ -23,6 +23,7 @@ struct core_boot_config {
 };
 
 struct cluster_boot_config {
+	unsigned long *core_power;
 	struct core_boot_config *core_config;
 };
 
diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
index 3eb2cfb893e1..9854bc2b6895 100644
--- a/arch/mips/kernel/mips-cm.c
+++ b/arch/mips/kernel/mips-cm.c
@@ -308,7 +308,9 @@ void mips_cm_lock_other(unsigned int cluster, unsigned int core,
 		      FIELD_PREP(CM3_GCR_Cx_OTHER_VP, vp);
 
 		if (cm_rev >= CM_REV_CM3_5) {
-			val |= CM_GCR_Cx_OTHER_CLUSTER_EN;
+			if (cluster != cpu_cluster(&current_cpu_data))
+				val |= CM_GCR_Cx_OTHER_CLUSTER_EN;
+			val |= CM_GCR_Cx_OTHER_GIC_EN;
 			val |= FIELD_PREP(CM_GCR_Cx_OTHER_CLUSTER, cluster);
 			val |= FIELD_PREP(CM_GCR_Cx_OTHER_BLOCK, block);
 		} else {
diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index f71e2bb58318..4f344c890a23 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -36,12 +36,56 @@ enum label_id {
 
 UASM_L_LA(_not_nmi)
 
-static DECLARE_BITMAP(core_power, NR_CPUS);
 static uint32_t core_entry_reg;
 static phys_addr_t cps_vec_pa;
 
 struct cluster_boot_config *mips_cps_cluster_bootcfg;
 
+static void power_up_other_cluster(unsigned int cluster)
+{
+	u32 stat, seq_state;
+	unsigned int timeout;
+
+	mips_cm_lock_other(cluster, CM_GCR_Cx_OTHER_CORE_CM, 0,
+			   CM_GCR_Cx_OTHER_BLOCK_LOCAL);
+	stat = read_cpc_co_stat_conf();
+	mips_cm_unlock_other();
+
+	seq_state = stat & CPC_Cx_STAT_CONF_SEQSTATE;
+	seq_state >>= __ffs(CPC_Cx_STAT_CONF_SEQSTATE);
+	if (seq_state == CPC_Cx_STAT_CONF_SEQSTATE_U5)
+		return;
+
+	/* Set endianness & power up the CM */
+	mips_cm_lock_other(cluster, 0, 0, CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
+	write_cpc_redir_sys_config(IS_ENABLED(CONFIG_CPU_BIG_ENDIAN));
+	write_cpc_redir_pwrup_ctl(1);
+	mips_cm_unlock_other();
+
+	/* Wait for the CM to start up */
+	timeout = 1000;
+	mips_cm_lock_other(cluster, CM_GCR_Cx_OTHER_CORE_CM, 0,
+			   CM_GCR_Cx_OTHER_BLOCK_LOCAL);
+	while (1) {
+		stat = read_cpc_co_stat_conf();
+		seq_state = stat & CPC_Cx_STAT_CONF_SEQSTATE;
+		seq_state >>= __ffs(CPC_Cx_STAT_CONF_SEQSTATE);
+		if (seq_state == CPC_Cx_STAT_CONF_SEQSTATE_U5)
+			break;
+
+		if (timeout) {
+			mdelay(1);
+			timeout--;
+		} else {
+			pr_warn("Waiting for cluster %u CM to power up... STAT_CONF=0x%x\n",
+				cluster, stat);
+			mdelay(1000);
+		}
+	}
+
+	mips_cm_unlock_other();
+}
+
 static unsigned __init core_vpe_count(unsigned int cluster, unsigned core)
 {
 	return min(smp_max_threads, mips_cps_numvps(cluster, core));
@@ -152,6 +196,9 @@ static void __init cps_smp_setup(void)
 			pr_cont(",");
 		pr_cont("{");
 
+		if (mips_cm_revision() >= CM_REV_CM3_5)
+			power_up_other_cluster(cl);
+
 		ncores = mips_cps_numcores(cl);
 		for (c = 0; c < ncores; c++) {
 			core_vpes = core_vpe_count(cl, c);
@@ -179,8 +226,8 @@ static void __init cps_smp_setup(void)
 
 	/* Indicate present CPUs (CPU being synonymous with VPE) */
 	for (v = 0; v < min_t(unsigned, nvpes, NR_CPUS); v++) {
-		set_cpu_possible(v, cpu_cluster(&cpu_data[v]) == 0);
-		set_cpu_present(v, cpu_cluster(&cpu_data[v]) == 0);
+		set_cpu_possible(v, true);
+		set_cpu_present(v, true);
 		__cpu_number_map[v] = v;
 		__cpu_logical_map[v] = v;
 	}
@@ -188,9 +235,6 @@ static void __init cps_smp_setup(void)
 	/* Set a coherent default CCA (CWB) */
 	change_c0_config(CONF_CM_CMASK, 0x5);
 
-	/* Core 0 is powered up (we're running on it) */
-	bitmap_set(core_power, 0, 1);
-
 	/* Initialise core 0 */
 	mips_cps_core_init();
 
@@ -272,6 +316,10 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
 			goto err_out;
 		mips_cps_cluster_bootcfg[cl].core_config = core_bootcfg;
 
+		mips_cps_cluster_bootcfg[cl].core_power =
+			kcalloc(BITS_TO_LONGS(ncores), sizeof(unsigned long),
+				GFP_KERNEL);
+
 		/* Allocate VPE boot configuration structs */
 		for (c = 0; c < ncores; c++) {
 			core_vpes = core_vpe_count(cl, c);
@@ -283,11 +331,12 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
 		}
 	}
 
-	/* Mark this CPU as booted */
+	/* Mark this CPU as powered up & booted */
 	cl = cpu_cluster(&current_cpu_data);
 	c = cpu_core(&current_cpu_data);
 	cluster_bootcfg = &mips_cps_cluster_bootcfg[cl];
 	core_bootcfg = &cluster_bootcfg->core_config[c];
+	bitmap_set(cluster_bootcfg->core_power, cpu_core(&current_cpu_data), 1);
 	atomic_set(&core_bootcfg->vpe_mask, 1 << cpu_vpe_id(&current_cpu_data));
 
 	return;
@@ -315,13 +364,118 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
 	}
 }
 
-static void boot_core(unsigned int core, unsigned int vpe_id)
+static void init_cluster_l2(void)
 {
-	u32 stat, seq_state;
-	unsigned timeout;
+	u32 l2_cfg, l2sm_cop, result;
+
+	while (1) {
+		l2_cfg = read_gcr_redir_l2_ram_config();
+
+		/* If HCI is not supported, use the state machine below */
+		if (!(l2_cfg & CM_GCR_L2_RAM_CONFIG_PRESENT))
+			break;
+		if (!(l2_cfg & CM_GCR_L2_RAM_CONFIG_HCI_SUPPORTED))
+			break;
+
+		/* If the HCI_DONE bit is set, we're finished */
+		if (l2_cfg & CM_GCR_L2_RAM_CONFIG_HCI_DONE)
+			return;
+	}
+
+	l2sm_cop = read_gcr_redir_l2sm_cop();
+	if (WARN(!(l2sm_cop & CM_GCR_L2SM_COP_PRESENT),
+		 "L2 init not supported on this system yet"))
+		return;
+
+	/* Clear L2 tag registers */
+	write_gcr_redir_l2_tag_state(0);
+	write_gcr_redir_l2_ecc(0);
+
+	/* Ensure the L2 tag writes complete before the state machine starts */
+	mb();
+
+	/* Wait for the L2 state machine to be idle */
+	do {
+		l2sm_cop = read_gcr_redir_l2sm_cop();
+	} while (l2sm_cop & CM_GCR_L2SM_COP_RUNNING);
+
+	/* Start a store tag operation */
+	l2sm_cop = CM_GCR_L2SM_COP_TYPE_IDX_STORETAG;
+	l2sm_cop <<= __ffs(CM_GCR_L2SM_COP_TYPE);
+	l2sm_cop |= CM_GCR_L2SM_COP_CMD_START;
+	write_gcr_redir_l2sm_cop(l2sm_cop);
+
+	/* Ensure the state machine starts before we poll for completion */
+	mb();
+
+	/* Wait for the operation to be complete */
+	do {
+		l2sm_cop = read_gcr_redir_l2sm_cop();
+		result = l2sm_cop & CM_GCR_L2SM_COP_RESULT;
+		result >>= __ffs(CM_GCR_L2SM_COP_RESULT);
+	} while (!result);
+
+	WARN(result != CM_GCR_L2SM_COP_RESULT_DONE_OK,
+	     "L2 state machine failed cache init with error %u\n", result);
+}
+
+static void boot_core(unsigned int cluster, unsigned int core,
+		      unsigned int vpe_id)
+{
+	struct cluster_boot_config *cluster_cfg;
+	u32 access, stat, seq_state;
+	unsigned int timeout, ncores;
+
+	cluster_cfg = &mips_cps_cluster_bootcfg[cluster];
+	ncores = mips_cps_numcores(cluster);
+
+	if ((cluster != cpu_cluster(&current_cpu_data)) &&
+	    bitmap_empty(cluster_cfg->core_power, ncores)) {
+		power_up_other_cluster(cluster);
+
+		mips_cm_lock_other(cluster, core, 0,
+				   CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
+
+		/* Ensure cluster GCRs are where we expect */
+		write_gcr_redir_base(read_gcr_base());
+		write_gcr_redir_cpc_base(read_gcr_cpc_base());
+		write_gcr_redir_gic_base(read_gcr_gic_base());
+
+		init_cluster_l2();
+
+		/* Mirror L2 configuration */
+		write_gcr_redir_l2_only_sync_base(read_gcr_l2_only_sync_base());
+		write_gcr_redir_l2_pft_control(read_gcr_l2_pft_control());
+		write_gcr_redir_l2_pft_control_b(read_gcr_l2_pft_control_b());
+
+		/* Mirror ECC/parity setup */
+		write_gcr_redir_err_control(read_gcr_err_control());
+
+		/* Set BEV base */
+		write_gcr_redir_bev_base(core_entry_reg);
+
+		mips_cm_unlock_other();
+	}
+
+	if (cluster != cpu_cluster(&current_cpu_data)) {
+		mips_cm_lock_other(cluster, core, 0,
+				   CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
+
+		/* Ensure the core can access the GCRs */
+		access = read_gcr_redir_access();
+		access |= BIT(core);
+		write_gcr_redir_access(access);
+
+		mips_cm_unlock_other();
+	} else {
+		/* Ensure the core can access the GCRs */
+		access = read_gcr_access();
+		access |= BIT(core);
+		write_gcr_access(access);
+	}
 
 	/* Select the appropriate core */
-	mips_cm_lock_other(0, core, 0, CM_GCR_Cx_OTHER_BLOCK_LOCAL);
+	mips_cm_lock_other(cluster, core, 0, CM_GCR_Cx_OTHER_BLOCK_LOCAL);
 
 	/* Set its reset vector */
 	write_gcr_co_reset_base(core_entry_reg);
@@ -387,7 +541,17 @@ static void boot_core(unsigned int core, unsigned int vpe_id)
 	mips_cm_unlock_other();
 
 	/* The core is now powered up */
-	bitmap_set(core_power, core, 1);
+	bitmap_set(cluster_cfg->core_power, core, 1);
+
+	/*
+	 * Restore CM_PWRUP=0 so that the CM can power down if all the cores in
+	 * the cluster do (eg. if they're all removed via hotplug.
+	 */
+	if (mips_cm_revision() >= CM_REV_CM3_5) {
+		mips_cm_lock_other(cluster, 0, 0, CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
+		write_cpc_redir_pwrup_ctl(0);
+		mips_cm_unlock_other();
+	}
 }
 
 static void remote_vpe_boot(void *dummy)
@@ -413,10 +577,6 @@ static int cps_boot_secondary(int cpu, struct task_struct *idle)
 	unsigned int remote;
 	int err;
 
-	/* We don't yet support booting CPUs in other clusters */
-	if (cpu_cluster(&cpu_data[cpu]) != cpu_cluster(&raw_current_cpu_data))
-		return -ENOSYS;
-
 	vpe_cfg->pc = (unsigned long)&smp_bootstrap;
 	vpe_cfg->sp = __KSTK_TOS(idle);
 	vpe_cfg->gp = (unsigned long)task_thread_info(idle);
@@ -425,14 +585,15 @@ static int cps_boot_secondary(int cpu, struct task_struct *idle)
 
 	preempt_disable();
 
-	if (!test_bit(core, core_power)) {
+	if (!test_bit(core, cluster_cfg->core_power)) {
 		/* Boot a VPE on a powered down core */
-		boot_core(core, vpe_id);
+		boot_core(cluster, core, vpe_id);
 		goto out;
 	}
 
 	if (cpu_has_vp) {
-		mips_cm_lock_other(0, core, vpe_id, CM_GCR_Cx_OTHER_BLOCK_LOCAL);
+		mips_cm_lock_other(cluster, core, vpe_id,
+				   CM_GCR_Cx_OTHER_BLOCK_LOCAL);
 		write_gcr_co_reset_base(core_entry_reg);
 		mips_cm_unlock_other();
 	}
@@ -639,11 +800,15 @@ static void cps_cpu_die(unsigned int cpu) { }
 
 static void cps_cleanup_dead_cpu(unsigned cpu)
 {
+	unsigned int cluster = cpu_cluster(&cpu_data[cpu]);
 	unsigned core = cpu_core(&cpu_data[cpu]);
 	unsigned int vpe_id = cpu_vpe_id(&cpu_data[cpu]);
 	ktime_t fail_time;
 	unsigned stat;
 	int err;
+	struct cluster_boot_config *cluster_cfg;
+
+	cluster_cfg = &mips_cps_cluster_bootcfg[cluster];
 
 	/*
 	 * Now wait for the CPU to actually offline. Without doing this that
@@ -695,7 +860,7 @@ static void cps_cleanup_dead_cpu(unsigned cpu)
 		} while (1);
 
 		/* Indicate the core is powered off */
-		bitmap_clear(core_power, core, 1);
+		bitmap_clear(cluster_cfg->core_power, core, 1);
 	} else if (cpu_has_mipsmt) {
 		/*
 		 * Have a CPU with access to the offlined CPUs registers wait
-- 
2.25.1


