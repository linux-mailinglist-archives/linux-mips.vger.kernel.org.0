Return-Path: <linux-mips+bounces-5547-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DB59765B2
	for <lists+linux-mips@lfdr.de>; Thu, 12 Sep 2024 11:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23CBBB244A0
	for <lists+linux-mips@lfdr.de>; Thu, 12 Sep 2024 09:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA31E1A2854;
	Thu, 12 Sep 2024 09:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbG7oeNM"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5D01A2650;
	Thu, 12 Sep 2024 09:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726133474; cv=none; b=W9gNKi/txA2OLp21l9Ysx1QtEtpkSrGMyB/XschyVsc6unaK6sP070REEqIUy2EnNoTzjznzt7wEZibdrdNBBsffszpf0gR6oboDVl5houhr/uWrgKppIqvHWEcHe1AV70QAezX5PgZPMQENNAr34dcTw7YD5+8tA/aVRU8ll5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726133474; c=relaxed/simple;
	bh=iEpl4bRLYAAHUaWD31rzMEtaXYAiMCWoJzhMYBOfe3A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a56vtbUVYc+8TJUOnlsKBPgxtRgxuSwnZPb5Hcs+CHxfQAtkDZz6SfnDnLEsxkSes70RNp3XVwwHcPuSn6HpVQDgcjMHMNAFVLqCumC0keFiyZpQxtu4AX7KqP9WkFw6a3BMtMtodTj0ZiMMjhbsMb1cQtIllo1EIgjeGw3i5PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbG7oeNM; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42ca4e0299eso5498455e9.2;
        Thu, 12 Sep 2024 02:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726133471; x=1726738271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFSiDVa5A8xiC3Vbc7Dsg+Rdaig6Ej2jHPtoNOjMC84=;
        b=IbG7oeNME+byEFGYZni7ReTRNq4HFefhrSq6DydH/y4xFG2M2rspnqD9zS1LQivguV
         ISa3gE86jzddOiXEKSQs/UNi+jAF1LSgCjRf9bSY05/ymbT0wdPTWoZZWTliZ5WXtKjZ
         ZgBal8pq3wibzKtQH5d37uB9xqINy9b4KMB3ZTSyDnBZ+M9/I/hYhE0JaQRSajSNQK2g
         wY06U3jNXq+WB4AE13eig3tGWL93bc9sE33VoP6ZpEAhSfq/t8Pefhnp0JE92ge5xHqe
         pVYDavbAo8sXCwrurQ8BVqKasXlgz1BCG8r3Xycg+p3BJxKFmCRORxTPmN0OebJFDaHZ
         gNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726133471; x=1726738271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HFSiDVa5A8xiC3Vbc7Dsg+Rdaig6Ej2jHPtoNOjMC84=;
        b=Le2LLE1gVCQlIqqhsU3tQYNJA2ccq2AHQJQ+1q8tE5wfCeMbe+sWlbW6TAUGTBX4MT
         qD6I/8DMDVDb0t4U9jvWRpqE2bPvyrZpDpj1pX2kIeItBsYv20WA1v5NTvXvJoNwk3+F
         scBWmBfbPAaxuWT7MYslRPYl2kEBreJlMirCJ2lmgulR/dor/r5Q0lL17uxdKVbaRJih
         ODudkxakYOMr2+wbgEvOGD0RTpjz7MVpaRthFS5GwE8Twcfdjq6Q0fOh+nZKezNv+KVg
         G2PGQKOq4Agi0vc6r/eoIEzz0nlU0SmTJIBUV0LF6kL3cAjypgUOLPWirEgTJOwrNA4Q
         xYiA==
X-Forwarded-Encrypted: i=1; AJvYcCUvnZz4socJ6SzJXuy4eOAoW+oyfZ/kLdBpQlZTAARO4Ty1uDM04QrF+brtiRSt/CZ84X5NW6ex4wc1Rg==@vger.kernel.org, AJvYcCWPD6l/wBQPuE4wqp+FWMhkVEZ/svFHi1LruyEXQuOG5ct9V+V5Z7msMefUSMOXNhvQgSojBHueseg/WPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa3elTmdX3cwrvKfPwB2eytiow1T8RgyWmGb3ygSMqCgo8mvfz
	xtig7ECjrOI01Se610lFiTyvAqY6g1SxLWhB9TRyyZxhjbx6cD54
X-Google-Smtp-Source: AGHT+IHGuNuUY7yMXI11BDkP0q3VzvlK7W/t/gPVV20GhxBqHiMuEjvmUHAgQViKsMlFsXmrw02ySA==
X-Received: by 2002:a05:600c:4fc2:b0:42b:af1c:66e with SMTP id 5b1f17b1804b1-42cdb5299e8mr17325085e9.9.1726133471016;
        Thu, 12 Sep 2024 02:31:11 -0700 (PDT)
Received: from localhost.localdomain ([212.200.182.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cc137556esm76688225e9.1.2024.09.12.02.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 02:31:10 -0700 (PDT)
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
Subject: [PATCH v6 8/9] MIPS: CPS: Introduce struct cluster_boot_config
Date: Thu, 12 Sep 2024 11:30:50 +0200
Message-Id: <20240912093051.452172-9-arikalo@gmail.com>
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

In preparation for supporting multi-cluster systems, introduce a struct
cluster_boot_config as an extra layer in the boot configuration
maintained by the MIPS Coherent Processing System (CPS) SMP
implementation. For now only one struct cluster_boot_config will be
allocated & we'll simply defererence its core_config field to find the
struct core_boot_config array which can be used to boot as usual.

Signed-off-by: Paul Burton <paulburton@kernel.org>
Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
---
 arch/mips/include/asm/smp-cps.h |  6 ++-
 arch/mips/kernel/asm-offsets.c  |  3 ++
 arch/mips/kernel/cps-vec.S      | 19 ++++++--
 arch/mips/kernel/pm-cps.c       |  5 +-
 arch/mips/kernel/smp-cps.c      | 82 +++++++++++++++++++++------------
 5 files changed, 81 insertions(+), 34 deletions(-)

diff --git a/arch/mips/include/asm/smp-cps.h b/arch/mips/include/asm/smp-cps.h
index ab94e50f62b8..a629e948a6fd 100644
--- a/arch/mips/include/asm/smp-cps.h
+++ b/arch/mips/include/asm/smp-cps.h
@@ -22,7 +22,11 @@ struct core_boot_config {
 	struct vpe_boot_config *vpe_config;
 };
 
-extern struct core_boot_config *mips_cps_core_bootcfg;
+struct cluster_boot_config {
+	struct core_boot_config *core_config;
+};
+
+extern struct cluster_boot_config *mips_cps_cluster_bootcfg;
 
 extern void mips_cps_core_boot(int cca, void __iomem *gcr_base);
 extern void mips_cps_core_init(void);
diff --git a/arch/mips/kernel/asm-offsets.c b/arch/mips/kernel/asm-offsets.c
index cb1045ebab06..b29944160b28 100644
--- a/arch/mips/kernel/asm-offsets.c
+++ b/arch/mips/kernel/asm-offsets.c
@@ -404,6 +404,9 @@ void output_cps_defines(void)
 {
 	COMMENT(" MIPS CPS offsets. ");
 
+	OFFSET(CLUSTERBOOTCFG_CORECONFIG, cluster_boot_config, core_config);
+	DEFINE(CLUSTERBOOTCFG_SIZE, sizeof(struct cluster_boot_config));
+
 	OFFSET(COREBOOTCFG_VPEMASK, core_boot_config, vpe_mask);
 	OFFSET(COREBOOTCFG_VPECONFIG, core_boot_config, vpe_config);
 	DEFINE(COREBOOTCFG_SIZE, sizeof(struct core_boot_config));
diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
index f876309130ad..2ae7034a3d5c 100644
--- a/arch/mips/kernel/cps-vec.S
+++ b/arch/mips/kernel/cps-vec.S
@@ -19,6 +19,10 @@
 #define GCR_CPC_BASE_OFS	0x0088
 #define GCR_CL_COHERENCE_OFS	0x2008
 #define GCR_CL_ID_OFS		0x2028
+#define  CM3_GCR_Cx_ID_CLUSTER_SHF	8
+#define  CM3_GCR_Cx_ID_CLUSTER_MSK	(0xff << 8)
+#define  CM3_GCR_Cx_ID_CORENUM_SHF	0
+#define  CM3_GCR_Cx_ID_CORENUM_MSK	(0xff << 0)
 
 #define CPC_CL_VC_STOP_OFS	0x2020
 #define CPC_CL_VC_RUN_OFS	0x2028
@@ -271,12 +275,21 @@ LEAF(mips_cps_core_init)
  */
 LEAF(mips_cps_get_bootcfg)
 	/* Calculate a pointer to this cores struct core_boot_config */
+	PTR_LA	v0, mips_cps_cluster_bootcfg
+	PTR_L	v0, 0(v0)
 	lw	t0, GCR_CL_ID_OFS(s1)
+#ifdef CONFIG_CPU_MIPSR6
+	ext	t1, t0, CM3_GCR_Cx_ID_CLUSTER_SHF, 8
+	li	t2, CLUSTERBOOTCFG_SIZE
+	mul	t1, t1, t2
+	PTR_ADDU \
+		v0, v0, t1
+#endif
+	PTR_L	v0, CLUSTERBOOTCFG_CORECONFIG(v0)
+	andi	t0, t0, CM3_GCR_Cx_ID_CORENUM_MSK
 	li	t1, COREBOOTCFG_SIZE
 	mul	t0, t0, t1
-	PTR_LA	t1, mips_cps_core_bootcfg
-	PTR_L	t1, 0(t1)
-	PTR_ADDU v0, t0, t1
+	PTR_ADDU v0, v0, t0
 
 	/* Calculate this VPEs ID. If the core doesn't support MT use 0 */
 	li	t9, 0
diff --git a/arch/mips/kernel/pm-cps.c b/arch/mips/kernel/pm-cps.c
index 9369a8dc385e..3de0e05e0511 100644
--- a/arch/mips/kernel/pm-cps.c
+++ b/arch/mips/kernel/pm-cps.c
@@ -101,12 +101,14 @@ static void coupled_barrier(atomic_t *a, unsigned online)
 int cps_pm_enter_state(enum cps_pm_state state)
 {
 	unsigned cpu = smp_processor_id();
+	unsigned int cluster = cpu_cluster(&current_cpu_data);
 	unsigned core = cpu_core(&current_cpu_data);
 	unsigned online, left;
 	cpumask_t *coupled_mask = this_cpu_ptr(&online_coupled);
 	u32 *core_ready_count, *nc_core_ready_count;
 	void *nc_addr;
 	cps_nc_entry_fn entry;
+	struct cluster_boot_config *cluster_cfg;
 	struct core_boot_config *core_cfg;
 	struct vpe_boot_config *vpe_cfg;
 	atomic_t *barrier;
@@ -136,7 +138,8 @@ int cps_pm_enter_state(enum cps_pm_state state)
 		if (!mips_cps_smp_in_use())
 			return -EINVAL;
 
-		core_cfg = &mips_cps_core_bootcfg[core];
+		cluster_cfg = &mips_cps_cluster_bootcfg[cluster];
+		core_cfg = &cluster_cfg->core_config[core];
 		vpe_cfg = &core_cfg->vpe_config[cpu_vpe_id(&current_cpu_data)];
 		vpe_cfg->pc = (unsigned long)mips_cps_pm_restore;
 		vpe_cfg->gp = (unsigned long)current_thread_info();
diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index 395622c37325..f71e2bb58318 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -40,7 +40,7 @@ static DECLARE_BITMAP(core_power, NR_CPUS);
 static uint32_t core_entry_reg;
 static phys_addr_t cps_vec_pa;
 
-struct core_boot_config *mips_cps_core_bootcfg;
+struct cluster_boot_config *mips_cps_cluster_bootcfg;
 
 static unsigned __init core_vpe_count(unsigned int cluster, unsigned core)
 {
@@ -212,8 +212,10 @@ static void __init cps_smp_setup(void)
 
 static void __init cps_prepare_cpus(unsigned int max_cpus)
 {
-	unsigned ncores, core_vpes, c, cca;
+	unsigned int nclusters, ncores, core_vpes, c, cl, cca;
 	bool cca_unsuitable, cores_limited;
+	struct cluster_boot_config *cluster_bootcfg;
+	struct core_boot_config *core_bootcfg;
 
 	mips_mt_set_cpuoptions();
 
@@ -255,40 +257,54 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
 
 	setup_cps_vecs();
 
-	/* Allocate core boot configuration structs */
-	ncores = mips_cps_numcores(0);
-	mips_cps_core_bootcfg = kcalloc(ncores, sizeof(*mips_cps_core_bootcfg),
-					GFP_KERNEL);
-	if (!mips_cps_core_bootcfg) {
-		pr_err("Failed to allocate boot config for %u cores\n", ncores);
-		goto err_out;
-	}
+	/* Allocate cluster boot configuration structs */
+	nclusters = mips_cps_numclusters();
+	mips_cps_cluster_bootcfg = kcalloc(nclusters,
+					   sizeof(*mips_cps_cluster_bootcfg),
+					   GFP_KERNEL);
 
-	/* Allocate VPE boot configuration structs */
-	for (c = 0; c < ncores; c++) {
-		core_vpes = core_vpe_count(0, c);
-		mips_cps_core_bootcfg[c].vpe_config = kcalloc(core_vpes,
-				sizeof(*mips_cps_core_bootcfg[c].vpe_config),
-				GFP_KERNEL);
-		if (!mips_cps_core_bootcfg[c].vpe_config) {
-			pr_err("Failed to allocate %u VPE boot configs\n",
-			       core_vpes);
+	for (cl = 0; cl < nclusters; cl++) {
+		/* Allocate core boot configuration structs */
+		ncores = mips_cps_numcores(cl);
+		core_bootcfg = kcalloc(ncores, sizeof(*core_bootcfg),
+					GFP_KERNEL);
+		if (!core_bootcfg)
 			goto err_out;
+		mips_cps_cluster_bootcfg[cl].core_config = core_bootcfg;
+
+		/* Allocate VPE boot configuration structs */
+		for (c = 0; c < ncores; c++) {
+			core_vpes = core_vpe_count(cl, c);
+			core_bootcfg[c].vpe_config = kcalloc(core_vpes,
+					sizeof(*core_bootcfg[c].vpe_config),
+					GFP_KERNEL);
+			if (!core_bootcfg[c].vpe_config)
+				goto err_out;
 		}
 	}
 
 	/* Mark this CPU as booted */
-	atomic_set(&mips_cps_core_bootcfg[cpu_core(&current_cpu_data)].vpe_mask,
-		   1 << cpu_vpe_id(&current_cpu_data));
+	cl = cpu_cluster(&current_cpu_data);
+	c = cpu_core(&current_cpu_data);
+	cluster_bootcfg = &mips_cps_cluster_bootcfg[cl];
+	core_bootcfg = &cluster_bootcfg->core_config[c];
+	atomic_set(&core_bootcfg->vpe_mask, 1 << cpu_vpe_id(&current_cpu_data));
 
 	return;
 err_out:
 	/* Clean up allocations */
-	if (mips_cps_core_bootcfg) {
-		for (c = 0; c < ncores; c++)
-			kfree(mips_cps_core_bootcfg[c].vpe_config);
-		kfree(mips_cps_core_bootcfg);
-		mips_cps_core_bootcfg = NULL;
+	if (mips_cps_cluster_bootcfg) {
+		for (cl = 0; cl < nclusters; cl++) {
+			cluster_bootcfg = &mips_cps_cluster_bootcfg[cl];
+			ncores = mips_cps_numcores(cl);
+			for (c = 0; c < ncores; c++) {
+				core_bootcfg = &cluster_bootcfg->core_config[c];
+				kfree(core_bootcfg->vpe_config);
+			}
+			kfree(mips_cps_cluster_bootcfg[c].core_config);
+		}
+		kfree(mips_cps_cluster_bootcfg);
+		mips_cps_cluster_bootcfg = NULL;
 	}
 
 	/* Effectively disable SMP by declaring CPUs not present */
@@ -376,17 +392,23 @@ static void boot_core(unsigned int core, unsigned int vpe_id)
 
 static void remote_vpe_boot(void *dummy)
 {
+	unsigned int cluster = cpu_cluster(&current_cpu_data);
 	unsigned core = cpu_core(&current_cpu_data);
-	struct core_boot_config *core_cfg = &mips_cps_core_bootcfg[core];
+	struct cluster_boot_config *cluster_cfg =
+		&mips_cps_cluster_bootcfg[cluster];
+	struct core_boot_config *core_cfg = &cluster_cfg->core_config[core];
 
 	mips_cps_boot_vpes(core_cfg, cpu_vpe_id(&current_cpu_data));
 }
 
 static int cps_boot_secondary(int cpu, struct task_struct *idle)
 {
+	unsigned int cluster = cpu_cluster(&cpu_data[cpu]);
 	unsigned core = cpu_core(&cpu_data[cpu]);
 	unsigned vpe_id = cpu_vpe_id(&cpu_data[cpu]);
-	struct core_boot_config *core_cfg = &mips_cps_core_bootcfg[core];
+	struct cluster_boot_config *cluster_cfg =
+		&mips_cps_cluster_bootcfg[cluster];
+	struct core_boot_config *core_cfg = &cluster_cfg->core_config[core];
 	struct vpe_boot_config *vpe_cfg = &core_cfg->vpe_config[vpe_id];
 	unsigned int remote;
 	int err;
@@ -544,12 +566,14 @@ static void cps_kexec_nonboot_cpu(void)
 static int cps_cpu_disable(void)
 {
 	unsigned cpu = smp_processor_id();
+	struct cluster_boot_config *cluster_cfg;
 	struct core_boot_config *core_cfg;
 
 	if (!cps_pm_support_state(CPS_PM_POWER_GATED))
 		return -EINVAL;
 
-	core_cfg = &mips_cps_core_bootcfg[cpu_core(&current_cpu_data)];
+	cluster_cfg = &mips_cps_cluster_bootcfg[cpu_cluster(&current_cpu_data)];
+	core_cfg = &cluster_cfg->core_config[cpu_core(&current_cpu_data)];
 	atomic_sub(1 << cpu_vpe_id(&current_cpu_data), &core_cfg->vpe_mask);
 	smp_mb__after_atomic();
 	set_cpu_online(cpu, false);
-- 
2.25.1


