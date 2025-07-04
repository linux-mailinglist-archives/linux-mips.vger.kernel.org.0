Return-Path: <linux-mips+bounces-9630-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 401E4AF9681
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jul 2025 17:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A38607BCA52
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jul 2025 15:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B20B2EE981;
	Fri,  4 Jul 2025 15:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="H8mVkJr3"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40042877C2;
	Fri,  4 Jul 2025 15:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751642013; cv=none; b=i48To9enIJJSO0PdC4JsivDs/y+PejZVw48+uVhg+o4KjOCwCEWUoSP5KvS81jPMAfxdKf9qJldBvhK9DyuImDdhRn8mgUOkaKU07hQzdeBjLqHQUrem+r/QsMRtYpSJoEQentbHG0niYQ0zaYOv53aKMmIcYmjVwgfukNUdurA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751642013; c=relaxed/simple;
	bh=Qel5rCPAfHdxNBguBsC7TWTVCVBwGuyoc+JjDnt63Fw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iI6lBixVN6GpNNzzjf+LqFpiCyi/8UzOG1TyxlMdpMvn1zwEEJ17w6nWGiwtrfCHvNKhVHnQN6VcNM4B59H/FKoxxOqml/vlbZBctd+mNIEWSelVni6u6aJAZBgfdwJjduMw2eX1JU6Q+e2UQlclAY9+f/Wk41QxLxQ++gHwN0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=H8mVkJr3; arc=none smtp.client-ip=217.70.178.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8BF8F4427A;
	Fri,  4 Jul 2025 15:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751642003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dsdT3TdhepGwaCrl6/fxZX7HlEBraKUA+MIpWAvv+gU=;
	b=H8mVkJr3NR8watBn6gDxTK3uLWwPLNYNPuT/kI80DsfYH57V/2ANutw0BS3RUZdJOz3gS+
	DRiO540I8cOSao67OPe0DCFGeVFgOeBy8qoA8gCfUl8Ml0wIRr650SM7kShjk+xiG94U+1
	C8J4JlzWZ+NH5xWL6atLQXdXLd1mUzgiXzIiFct4FbrzDU/WmUVTt1MmmSxDm24zgTySTc
	kdMZE/AUZN1WFLr3YAlvyc64YULWmhMDagh9hzQiVE5EnVJvHrmqLntTDS4jeTlypC2/JL
	kNPxZdH0FyBG6358qHTag199ghmABt+sil+uJTM9GMiqbdjYHDIzF7voBA1HEw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 04 Jul 2025 17:13:10 +0200
Subject: [PATCH v2 1/3] MIPS: CPS: Improve
 mips_cps_first_online_in_cluster()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-smp_calib-v2-1-bade7e9c0463@bootlin.com>
References: <20250704-smp_calib-v2-0-bade7e9c0463@bootlin.com>
In-Reply-To: <20250704-smp_calib-v2-0-bade7e9c0463@bootlin.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvfeeglecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfedvffevfefhieefteeuieeuleevgffhveegvdegueegjeehfeejudettdegvdffnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemuggrtdgumeejtdehheemugdtudgvmedugeekheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemuggrtdgumeejtdehheemugdtudgvmedugeekhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehtrgiffhhikhdrsggrhihou
 hhksehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhrtghpthhtohepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmihhpshesvhhgvghrrdhkvghrnhgvlhdrohhrgh

The initial implementation of this function goes through all the CPUs
in a cluster to determine if the current CPU is the only one
running. This process occurs every time the function is called.

However, during boot, we already perform this task, so let's take
advantage of this opportunity to create and fill a CPU bitmask that
can be easily and efficiently used later.

This requires creating a single CPU bitmask per cluster, which is why
it's essential to know how many clusters can be utilized. The default
setting is 4 clusters, but this value can be changed when configuring
the kernel or even customized for a given SoC family.

This patch modifies the function to allow providing the first
available online CPU when one already exists, which is necessary for
delay CPU calibration optimization.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/Kconfig                |  6 ++++++
 arch/mips/include/asm/mips-cps.h | 18 ++++++++++++++++--
 arch/mips/kernel/mips-cm.c       | 40 +++++++---------------------------------
 arch/mips/kernel/smp-cps.c       |  2 ++
 4 files changed, 31 insertions(+), 35 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 1e48184ecf1ec8e29c0a25de6452ece5da835e30..47aa3f8849f05632773c9064282147608483c715 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2329,6 +2329,12 @@ config MIPS_CPS
 	  no external assistance. It is safe to enable this when hardware
 	  support is unavailable.
 
+config MIPS_CPS_CLUSTER_MAX
+       int "Maximum cluster supported"
+       default 4
+       help
+	Maximum number of cluster available on the SoC.
+
 config MIPS_CPS_PM
 	depends on MIPS_CPS
 	bool
diff --git a/arch/mips/include/asm/mips-cps.h b/arch/mips/include/asm/mips-cps.h
index 917009b80e6951dc7e2b308ad7fb42cd9fbbf7d7..674f0628a2ded42f4f42c7362a667a457944caa0 100644
--- a/arch/mips/include/asm/mips-cps.h
+++ b/arch/mips/include/asm/mips-cps.h
@@ -12,6 +12,8 @@
 #include <linux/io.h>
 #include <linux/types.h>
 
+extern struct cpumask __cpu_cluster_mask[CONFIG_MIPS_CPS_CLUSTER_MAX] __read_mostly;
+
 extern unsigned long __cps_access_bad_size(void)
 	__compiletime_error("Bad size for CPS accessor");
 
@@ -114,10 +116,20 @@ static inline void clear_##unit##_##name(uint##sz##_t val)		\
  */
 static inline unsigned int mips_cps_numclusters(void)
 {
+	unsigned int nclusters;
+
 	if (mips_cm_revision() < CM_REV_CM3_5)
 		return 1;
 
-	return FIELD_GET(CM_GCR_CONFIG_NUM_CLUSTERS, read_gcr_config());
+	nclusters = FIELD_GET(CM_GCR_CONFIG_NUM_CLUSTERS, read_gcr_config());
+	if (nclusters > CONFIG_MIPS_CPS_CLUSTER_MAX) {
+		pr_warn("%d clusters detected but limited to %d because of CONFIG_MIPS_CPU_CLUSTER_MAX value\n"
+			"consider modifying it to match the hardware capability.\n",
+			nclusters, CONFIG_MIPS_CPS_CLUSTER_MAX);
+		nclusters = CONFIG_MIPS_CPS_CLUSTER_MAX;
+	}
+
+	return nclusters;
 }
 
 /**
@@ -258,6 +270,8 @@ static inline bool mips_cps_multicluster_cpus(void)
 
 /**
  * mips_cps_first_online_in_cluster() - Detect if CPU is first online in cluster
+ * @first_cpu: The first other online CPU in cluster, or nr_cpu_ids if
+ * the function returns true.
  *
  * Determine whether the local CPU is the first to be brought online in its
  * cluster - that is, whether there are any other online CPUs in the local
@@ -265,6 +279,6 @@ static inline bool mips_cps_multicluster_cpus(void)
  *
  * Returns true if this CPU is first online, else false.
  */
-extern unsigned int mips_cps_first_online_in_cluster(void);
+extern unsigned int mips_cps_first_online_in_cluster(int *first_cpu);
 
 #endif /* __MIPS_ASM_MIPS_CPS_H__ */
diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
index 43cb1e20baed3648ff83bb5d3bbe6a726072e063..d1d98e03559df5f891c3afce0955d63db7eb1c45 100644
--- a/arch/mips/kernel/mips-cm.c
+++ b/arch/mips/kernel/mips-cm.c
@@ -529,39 +529,13 @@ void mips_cm_error_report(void)
 	write_gcr_error_cause(cm_error);
 }
 
-unsigned int mips_cps_first_online_in_cluster(void)
+unsigned int mips_cps_first_online_in_cluster(int *first_cpu)
 {
-	unsigned int local_cl;
-	int i;
+	unsigned int local_cl = cpu_cluster(&current_cpu_data);
+	struct cpumask *local_cluster_mask = &__cpu_cluster_mask[local_cl];
 
-	local_cl = cpu_cluster(&current_cpu_data);
-
-	/*
-	 * We rely upon knowledge that CPUs are numbered sequentially by
-	 * cluster - ie. CPUs 0..X will be in cluster 0, CPUs X+1..Y in cluster
-	 * 1, CPUs Y+1..Z in cluster 2 etc. This means that CPUs in the same
-	 * cluster will immediately precede or follow one another.
-	 *
-	 * First we scan backwards, until we find an online CPU in the cluster
-	 * or we move on to another cluster.
-	 */
-	for (i = smp_processor_id() - 1; i >= 0; i--) {
-		if (cpu_cluster(&cpu_data[i]) != local_cl)
-			break;
-		if (!cpu_online(i))
-			continue;
-		return false;
-	}
-
-	/* Then do the same for higher numbered CPUs */
-	for (i = smp_processor_id() + 1; i < nr_cpu_ids; i++) {
-		if (cpu_cluster(&cpu_data[i]) != local_cl)
-			break;
-		if (!cpu_online(i))
-			continue;
-		return false;
-	}
-
-	/* We found no online CPUs in the local cluster */
-	return true;
+	*first_cpu = cpumask_any_and_but(local_cluster_mask,
+					 cpu_online_mask,
+					 smp_processor_id());
+	return (*first_cpu >= nr_cpu_ids);
 }
diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index 7b0e69af4097025196b93115139a5e89c1d71fcc..a5c538742769dcbf22e27d2d4485c071e2e64ec2 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -40,6 +40,7 @@ static u64 core_entry_reg;
 static phys_addr_t cps_vec_pa;
 
 struct cluster_boot_config *mips_cps_cluster_bootcfg;
+struct cpumask __cpu_cluster_mask[CONFIG_MIPS_CPS_CLUSTER_MAX] __read_mostly;
 
 static void power_up_other_cluster(unsigned int cluster)
 {
@@ -242,6 +243,7 @@ static void __init cps_smp_setup(void)
 				cpu_set_cluster(&cpu_data[nvpes + v], cl);
 				cpu_set_core(&cpu_data[nvpes + v], c);
 				cpu_set_vpe_id(&cpu_data[nvpes + v], v);
+				cpumask_set_cpu(nvpes + v, &__cpu_cluster_mask[cl]);
 			}
 
 			nvpes += core_vpes;

-- 
2.47.2


