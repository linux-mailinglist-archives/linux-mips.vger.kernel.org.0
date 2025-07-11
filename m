Return-Path: <linux-mips+bounces-9737-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9DAB018D9
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jul 2025 11:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B23D8E2310
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jul 2025 09:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF125288C0C;
	Fri, 11 Jul 2025 09:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="M+OGkxYR"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFAF27E7EC;
	Fri, 11 Jul 2025 09:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752227673; cv=none; b=oeSj85vD/x0nAdtoOHhc6SJlylxyHLriG3EY56Ddb0RvTCGl1CVs54P/JcxnZddwbKawGVI0fl08qVLNRZnSZ1KqvYwnv3G0uDsxyp4xim/NhSv+DFwWrdHjAX9ZSQmlMeQQncGCOAl18cy4R5mjLwV+0Gxfp/RL/r5nan/lQK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752227673; c=relaxed/simple;
	bh=/gqVAWtATuGgyqceq550CiX9qghIV0VspklYTNPJhhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lM3TOo9onicTXlAliF7OgbPQkvpY8lOqBMDgqi2yCgj6b0wy5pIeaVGmriBvrMQkJYcBElR70/ZWNNgu/0q49KEQYXO49r2R/PAuiIGoCJz5NyvyA6qt+wh1079uyVPk9Xl6O6GKcpktpVFbltgLuTzCNQ/OVtDYBsqTOA4788U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=M+OGkxYR; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C756943AED;
	Fri, 11 Jul 2025 09:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752227664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DU0WYSRtBex+0qVbneNSBZHkJiI3BwiF7BI4r8kXm+4=;
	b=M+OGkxYRHFQg0IaZxdaENXs9RNac0u6dHIiNmedbO7OVzqvOlZ9ppIX8F1etbIYVXwAZVI
	SJcVAmQJtmdNuMumaSNsDXtNyr92ITOkwx3tr4d0Lw/RpioQF2VCyM0ym9y/1KzeQxLpiQ
	5QyFgKxLFeqZ1HqlWI1B3vYexSalXHIrdHnZj6TL+xCFe4QadNGpUV/N1bxANmxJgCdiM9
	wUTxQS99Cfp0z5cI3I+QDd9pqPwhOVZZ0ot+gPQGMdknW3U+J2qm97wnCjdKzRh28FjpLx
	GqAQ8tqdIcQRMQig7/CFme6zbC4HzqbQqMH7pRYvhr7gghdOkcoJi7mVKagIRg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 11 Jul 2025 11:54:20 +0200
Subject: [PATCH v4 1/2] MIPS: CPS: Improve
 mips_cps_first_online_in_cluster()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-smp_calib-v4-1-1e743b225bcc@bootlin.com>
References: <20250711-smp_calib-v4-0-1e743b225bcc@bootlin.com>
In-Reply-To: <20250711-smp_calib-v4-0-1e743b225bcc@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegfedtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfedvffevfefhieefteeuieeuleevgffhveegvdegueegjeehfeejudettdegvdffnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemgegtjeekmedvkegtvgemfegtjeegmeefgeegtgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemgegtjeekmedvkegtvgemfegtjeegmeefgeegtgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhot
 hhlihhnrdgtohhmpdhrtghpthhtohepvhhlrgguihhmihhrrdhkohhnughrrghtihgvvhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehlihhnuhigqdhmihhpshesvhhgvghrrdhkvghrnhgvlhdrohhrgh
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

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
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
index 43cb1e20baed3648ff83bb5d3bbe6a726072e063..8c559ad60d92a24a52f314925534fc7e7f6ba290 100644
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
+	if  (IS_ENABLED(CONFIG_MIPS_CPS) && mips_cps_cluster_bootcfg)
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


