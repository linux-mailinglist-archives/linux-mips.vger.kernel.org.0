Return-Path: <linux-mips+bounces-9664-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08407AFCC66
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jul 2025 15:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F6914A5326
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jul 2025 13:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A60C2DEA81;
	Tue,  8 Jul 2025 13:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Wh2downz"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6792264B0;
	Tue,  8 Jul 2025 13:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751982383; cv=none; b=Aqph0V31emn/uBIpsGI1gReKoFakDqdC0rEv7jZjXFvCBdVRNTzmIWsuZQ0zoi3Xby1DLb2yjByF3t/818PJQJqWwZsh1ga1DPijPS7LowgFv5rgiCPuQi2Mg69lL9aXhjrKnQ/fT9XwezhbK7WI4c7DnHI4GpRfPQ+jmfXTv4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751982383; c=relaxed/simple;
	bh=Lr82PX4N9X+gT/KdYsj2EuGP+lYsxw1GdqaGQp3vXVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p/mdvUlWgdz4GXQn1YTMYMYQ26NHR0eMyt9vbx5juysGV0+FMS+UxVAjk6AikmHwXXPnE26sIqTDxdY41dOHjtAS+5u9McAqw6AaE7vBEjqrhJkPVYz5IsS3Gp8S6rhFfNll1I4F+cL1ZWJTmm9BKpXgDy4h3azVRDaW9ytehXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Wh2downz; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76FD743976;
	Tue,  8 Jul 2025 13:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751982378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s93gvfxLj9zjVh9uh/NE71PGdJHBQa7yq+J70RRMUSE=;
	b=Wh2downz8CN8sgA4aTQ2S/65CbphBuLUPWaAIWemfwsy80Wc+9dgyrUjE+vQmVX5HogWXV
	DaLKXC3YiuWAblVq8e6RHZEEa7S1MeMMg33NADX5MQXU5hqwtqFaAASHTauwOrovEnspwb
	5xbR7n31gT7HQcu25m+Jv5qjKNQM9uF8hkM6fvqFDvX5r+z+fM0qn04ILiN9nXHygPJTfq
	ez/3xEPeZnMA6DEkq/QYxv6caxHRh4aIOs0bnSbz3uXxUOxL2YpeNEp+fTKcJg+O2dxp89
	tLWpM/UXsS+SA4+ur6CsgMkH+OBc6WdcRNyb9YoIS04eVvLVinNoB7XS+qGoCg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Tue, 08 Jul 2025 15:46:11 +0200
Subject: [PATCH v3 1/2] MIPS: CPS: Improve
 mips_cps_first_online_in_cluster()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-smp_calib-v3-1-6dabf01a7d9f@bootlin.com>
References: <20250708-smp_calib-v3-0-6dabf01a7d9f@bootlin.com>
In-Reply-To: <20250708-smp_calib-v3-0-6dabf01a7d9f@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefgeekfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfedvffevfefhieefteeuieeuleevgffhveegvdegueegjeehfeejudettdegvdffnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemieejgedtmeeftdgrleemheguleejmegrvdegleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemieejgedtmeeftdgrleemheguleejmegrvdegledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfr
 hgrnhhkvghnrdguvgdprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhrtghpthhtohepthgrfihfihhkrdgsrgihohhukhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomh
X-GND-Sasl: gregory.clement@bootlin.com

The initial implementation of this function goes through all the CPUs
in a cluster to determine if the current CPU is the only one
running. This process occurs every time the function is called.

However, during boot, we already perform this task, so let's take
advantage of this opportunity to create and fill a CPU bitmask that
can be easily and efficiently used later.

This patch modifies the function to allow providing the first
available online CPU when one already exists, which is necessary for
delay CPU calibration optimization.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/include/asm/mips-cps.h |  4 +++-
 arch/mips/include/asm/smp-cps.h  |  1 +
 arch/mips/kernel/mips-cm.c       | 47 ++++++++++++++--------------------------
 arch/mips/kernel/smp-cps.c       |  5 ++++-
 4 files changed, 24 insertions(+), 33 deletions(-)

diff --git a/arch/mips/include/asm/mips-cps.h b/arch/mips/include/asm/mips-cps.h
index 917009b80e6951dc7e2b308ad7fb42cd9fbbf7d7..1fffd47a4564fb891d3c1e3ae3895b34d6700e5e 100644
--- a/arch/mips/include/asm/mips-cps.h
+++ b/arch/mips/include/asm/mips-cps.h
@@ -258,6 +258,8 @@ static inline bool mips_cps_multicluster_cpus(void)
 
 /**
  * mips_cps_first_online_in_cluster() - Detect if CPU is first online in cluster
+ * @first_cpu: The first other online CPU in cluster, or nr_cpu_ids if
+ * the function returns true.
  *
  * Determine whether the local CPU is the first to be brought online in its
  * cluster - that is, whether there are any other online CPUs in the local
@@ -265,6 +267,6 @@ static inline bool mips_cps_multicluster_cpus(void)
  *
  * Returns true if this CPU is first online, else false.
  */
-extern unsigned int mips_cps_first_online_in_cluster(void);
+extern unsigned int mips_cps_first_online_in_cluster(int *first_cpu);
 
 #endif /* __MIPS_ASM_MIPS_CPS_H__ */
diff --git a/arch/mips/include/asm/smp-cps.h b/arch/mips/include/asm/smp-cps.h
index 10d3ebd890cb2f3ac2b1db5a541cfe9e7f1a0c99..88cfae5d22c83e44451200ad3daae12fced03303 100644
--- a/arch/mips/include/asm/smp-cps.h
+++ b/arch/mips/include/asm/smp-cps.h
@@ -24,6 +24,7 @@ struct core_boot_config {
 
 struct cluster_boot_config {
 	unsigned long *core_power;
+	struct cpumask cpumask;
 	struct core_boot_config *core_config;
 };
 
diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
index 43cb1e20baed3648ff83bb5d3bbe6a726072e063..f49138f551d3c347c6a98afe05ad5027b0d91637 100644
--- a/arch/mips/kernel/mips-cm.c
+++ b/arch/mips/kernel/mips-cm.c
@@ -10,6 +10,7 @@
 #include <linux/spinlock.h>
 
 #include <asm/mips-cps.h>
+#include <asm/smp-cps.h>
 #include <asm/mipsregs.h>
 
 void __iomem *mips_gcr_base;
@@ -529,39 +530,23 @@ void mips_cm_error_report(void)
 	write_gcr_error_cause(cm_error);
 }
 
-unsigned int mips_cps_first_online_in_cluster(void)
+unsigned int mips_cps_first_online_in_cluster(int *first_cpu)
 {
-	unsigned int local_cl;
-	int i;
-
-	local_cl = cpu_cluster(&current_cpu_data);
+	unsigned int local_cl = cpu_cluster(&current_cpu_data);
+	struct cpumask *local_cl_mask;
 
 	/*
-	 * We rely upon knowledge that CPUs are numbered sequentially by
-	 * cluster - ie. CPUs 0..X will be in cluster 0, CPUs X+1..Y in cluster
-	 * 1, CPUs Y+1..Z in cluster 2 etc. This means that CPUs in the same
-	 * cluster will immediately precede or follow one another.
-	 *
-	 * First we scan backwards, until we find an online CPU in the cluster
-	 * or we move on to another cluster.
+	 * mips_cps_cluster_bootcfg is allocated in cps_prepare_cpus. If it is
+	 * not yet done, then we are so early that only one CPU is running, so
+	 * it is the first online CPU in the cluster.
 	 */
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
+	if (mips_cps_cluster_bootcfg)
+		local_cl_mask = &mips_cps_cluster_bootcfg[local_cl].cpumask;
+	else
+		return true;
+
+	*first_cpu = cpumask_any_and_but(local_cl_mask,
+					 cpu_online_mask,
+					 smp_processor_id());
+	return (*first_cpu >= nr_cpu_ids);
 }
diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index 7b0e69af4097025196b93115139a5e89c1d71fcc..6c5f15293a8e58a701601b242f43ba19a6814f06 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -283,7 +283,7 @@ static void __init cps_smp_setup(void)
 
 static void __init cps_prepare_cpus(unsigned int max_cpus)
 {
-	unsigned int nclusters, ncores, core_vpes, c, cl, cca;
+	unsigned int nclusters, ncores, core_vpes, nvpe = 0, c, cl, cca;
 	bool cca_unsuitable, cores_limited;
 	struct cluster_boot_config *cluster_bootcfg;
 	struct core_boot_config *core_bootcfg;
@@ -356,10 +356,13 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
 
 		/* Allocate VPE boot configuration structs */
 		for (c = 0; c < ncores; c++) {
+			int v;
 			core_vpes = core_vpe_count(cl, c);
 			core_bootcfg[c].vpe_config = kcalloc(core_vpes,
 					sizeof(*core_bootcfg[c].vpe_config),
 					GFP_KERNEL);
+			for (v = 0; v < core_vpes; v++)
+				cpumask_set_cpu(nvpe++, &mips_cps_cluster_bootcfg[cl].cpumask);
 			if (!core_bootcfg[c].vpe_config)
 				goto err_out;
 		}

-- 
2.47.2


