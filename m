Return-Path: <linux-mips+bounces-7636-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEA4A21D2D
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jan 2025 13:33:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5109416710B
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jan 2025 12:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C67C1BC20;
	Wed, 29 Jan 2025 12:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfPGQB50"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA96D8BE5;
	Wed, 29 Jan 2025 12:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738153983; cv=none; b=C1BOP/ltAdp86m+JTMVCZ/XHZBzrLV5my3pA/GvVGlYBydwowelNgwefk2FBhzDLHX0yqXe8UdaUSP6HSXUtDmTvY2FZY+Jblm47bzpzmmU+HQXCx7p6HO7eyT8lHPpUopva9XxH9KRyUsy29R5wRjW6/w9nwmX48bdemAFNu98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738153983; c=relaxed/simple;
	bh=zJKStGWSsAVAMdDBvqbntgtAynZCg9dDBy8AbCoCFyY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R2ChP+s7NRk7WoHqTXbPI1VFBPBWlSU4AfTJw+VjMyVPzg4twLUnJJyY9Vva2flN6Ez90kOZG19oJ64eiC5r/ME6ehunMVslBCSBq24v4bFaSd5tn2aFqVjBwhKmfGIvLEhnyLZR9JHTZq8YrUerQudhStiQH9HKQU9wfVmkogM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfPGQB50; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaedd529ba1so963879366b.1;
        Wed, 29 Jan 2025 04:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738153979; x=1738758779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XApyNSP9uDFDI6OWCTrLcEi5qIPQR7kGpmHTRZfXEM=;
        b=hfPGQB501I2Rle+L7avJ6yhEIt+tuncQMI0jPxfwCSR5d17D+ut2gQYvU/N7Jol+Ls
         P85PxjKVqFrp9aymglHuOWpht8M0f434lDihN33LMKbX7oVv50oqoshJcG04uQZiDWno
         rxNlI8WvyMWkfPNSgQlXeRCfK1sPRE37Tmjv7k5LSis1KfelpHySpCmji59DfjZz0KZ2
         pFgFguWOD0mQCfEKcIVFyfHNrm0hbE8xIutTtUXIBqRzwMTgYDnuBTC6Aj8dqukXLexo
         Qpv1XElhqr/SMijkReAFE10QVwoag+JmuOErdn5309u0uXQlNc24kHuc9DrcIdxeY48N
         cPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738153979; x=1738758779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7XApyNSP9uDFDI6OWCTrLcEi5qIPQR7kGpmHTRZfXEM=;
        b=IMVUhKIwGvgZrLuroBuULA2nLY3kD/iT0ajK2aHiJlIMIp7TxZEF040/o+4OHrENh6
         41ehZU6sTdw2n+CiWK9RGcx9UU13Ie+J9k2dbkg0IDqtQmXIGnjCyk7D1UNqQyqtWdbn
         145V7V9MjKUmTMhQq3pEIYV0+9lJyE0q6B4CFmDvQGnj7F3nhC+WNU+QegdoS0/D6M5w
         vlmKUm7qcES07ZdLtuIyTBKjiYbWexQpMD0YbvJF8sqYhDhTbHZGO/BDQMCN+wFr1tyR
         dmITSIuNUCunKKcHPfXhxXnZ5Ob2zXo8G+QNcpCbeplvQg65YF/IW8665UADYkQQiD6H
         f7tg==
X-Gm-Message-State: AOJu0YxB9eXrRVFbb903zdbylgaFe/E7pk75ck7LEzgFx2Hn7mWPKGTG
	0usrMIC2iHI28oHa2MjH2tA+VMPkmYNcCI0U5um9ScZMuthJmMRyITU53yMC
X-Gm-Gg: ASbGncveHJ/mKHsVEdlDb6qgO7bVW56QpVlbDyn8MVetUooL6cQGGfozY1DSQ28Hl1t
	Tm7tAsi25taskn60aX2nH+nFmN7YTjpRQtcPkindaaxF/Bkp6qBq5YGIDMtZTzOZlqTyt/RKGBT
	D5po6D0OR12VyUk/uYEhVQh0mkhsu4quNTn23YWknc4xzSI+mvznU3Mx9wkXFj9czxkyGr+IeEB
	hOsqUONrOriFMDTHPFp/6A67i330ZK580+xi6v6VmT3YNCT+baKl2gIsyhqBVYUyr3aIUMfAOMF
	GZS9bMg7HFPhqkGBgjJyY4nw
X-Google-Smtp-Source: AGHT+IFsu0YKRHr/4LPFmGHJN+gVGyvvqKwEY83xOQ3oYfcisc0uZK+xisM8KM3WxklVh10MtPwSkg==
X-Received: by 2002:a05:6402:1d4e:b0:5db:f423:19cf with SMTP id 4fb4d7f45d1cf-5dc5efbf1b3mr6232741a12.9.1738153978516;
        Wed, 29 Jan 2025 04:32:58 -0800 (PST)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab69051b1ddsm733540766b.180.2025.01.29.04.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 04:32:58 -0800 (PST)
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
Subject: [PATCH v9 4/4] MIPS: CPS: Boot CPUs in secondary clusters
Date: Wed, 29 Jan 2025 13:32:50 +0100
Message-Id: <20250129123250.711910-5-arikalo@gmail.com>
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
index 23ce951f445b..1afa85db1fb3 100644
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
index 3d8cf3098656..b20ea4048429 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -36,12 +36,56 @@ enum label_id {
 
 UASM_L_LA(_not_nmi)
 
-static DECLARE_BITMAP(core_power, NR_CPUS);
 static u64 core_entry_reg;
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
@@ -178,6 +222,9 @@ static void __init cps_smp_setup(void)
 			pr_cont(",");
 		pr_cont("{");
 
+		if (mips_cm_revision() >= CM_REV_CM3_5)
+			power_up_other_cluster(cl);
+
 		ncores = mips_cps_numcores(cl);
 		for (c = 0; c < ncores; c++) {
 			core_vpes = core_vpe_count(cl, c);
@@ -205,8 +252,8 @@ static void __init cps_smp_setup(void)
 
 	/* Indicate present CPUs (CPU being synonymous with VPE) */
 	for (v = 0; v < min_t(unsigned, nvpes, NR_CPUS); v++) {
-		set_cpu_possible(v, cpu_cluster(&cpu_data[v]) == 0);
-		set_cpu_present(v, cpu_cluster(&cpu_data[v]) == 0);
+		set_cpu_possible(v, true);
+		set_cpu_present(v, true);
 		__cpu_number_map[v] = v;
 		__cpu_logical_map[v] = v;
 	}
@@ -214,9 +261,6 @@ static void __init cps_smp_setup(void)
 	/* Set a coherent default CCA (CWB) */
 	change_c0_config(CONF_CM_CMASK, 0x5);
 
-	/* Core 0 is powered up (we're running on it) */
-	bitmap_set(core_power, 0, 1);
-
 	/* Initialise core 0 */
 	mips_cps_core_init();
 
@@ -298,6 +342,10 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
 			goto err_out;
 		mips_cps_cluster_bootcfg[cl].core_config = core_bootcfg;
 
+		mips_cps_cluster_bootcfg[cl].core_power =
+			kcalloc(BITS_TO_LONGS(ncores), sizeof(unsigned long),
+				GFP_KERNEL);
+
 		/* Allocate VPE boot configuration structs */
 		for (c = 0; c < ncores; c++) {
 			core_vpes = core_vpe_count(cl, c);
@@ -309,11 +357,12 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
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
@@ -341,13 +390,118 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
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
 	if (mips_cm_is64)
@@ -416,7 +570,17 @@ static void boot_core(unsigned int core, unsigned int vpe_id)
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
@@ -442,10 +606,6 @@ static int cps_boot_secondary(int cpu, struct task_struct *idle)
 	unsigned int remote;
 	int err;
 
-	/* We don't yet support booting CPUs in other clusters */
-	if (cpu_cluster(&cpu_data[cpu]) != cpu_cluster(&raw_current_cpu_data))
-		return -ENOSYS;
-
 	vpe_cfg->pc = (unsigned long)&smp_bootstrap;
 	vpe_cfg->sp = __KSTK_TOS(idle);
 	vpe_cfg->gp = (unsigned long)task_thread_info(idle);
@@ -454,14 +614,15 @@ static int cps_boot_secondary(int cpu, struct task_struct *idle)
 
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
 		if (mips_cm_is64)
 			write_gcr_co_reset64_base(core_entry_reg);
 		else
@@ -671,11 +832,15 @@ static void cps_cpu_die(unsigned int cpu) { }
 
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
@@ -727,7 +892,7 @@ static void cps_cleanup_dead_cpu(unsigned cpu)
 		} while (1);
 
 		/* Indicate the core is powered off */
-		bitmap_clear(core_power, core, 1);
+		bitmap_clear(cluster_cfg->core_power, core, 1);
 	} else if (cpu_has_mipsmt) {
 		/*
 		 * Have a CPU with access to the offlined CPUs registers wait
-- 
2.25.1


