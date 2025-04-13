Return-Path: <linux-mips+bounces-8584-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E655A8737A
	for <lists+linux-mips@lfdr.de>; Sun, 13 Apr 2025 21:12:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC3F77A5280
	for <lists+linux-mips@lfdr.de>; Sun, 13 Apr 2025 19:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233061E7C2D;
	Sun, 13 Apr 2025 19:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="E/u5tsrt"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E436229D19;
	Sun, 13 Apr 2025 19:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744571570; cv=none; b=kGPZJtB3QyLZCO0zNt2p6WSwlF9ORyKJY+28OoGxlmfcW+fqZe/cqvuE6wDa4gDsxTnyFQ0Axxp8VTYQajkuoK2ToB6SHXHqBEeVnQlUY8nx4kFAd2qXB6/QEvZ2VB7lsWKmj4pyqtly0RMJfwLOBpVxvJE58w8YsdRosLIoHMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744571570; c=relaxed/simple;
	bh=QMkSUO+xFyLpesHo/rtDCMPD8DylSwKw+UPXoZij6YM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tM6I5OpcN+Nkh7C4BcuOh7HUAkLaZCUMeeYzczqal8bWa97M/lzMCCjzX/fhcctfPSkZirkWxo8xpzKmZlbWdGT8TB91Ut8F5NPQ18ye2Y6Wd5JOr8D4eyv5PcnS8b6voYw3J4EP+ijeL2ER/Tl8UcD2PcV/jpklJgd7YJRcBXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=E/u5tsrt; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D72043A48;
	Sun, 13 Apr 2025 19:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744571559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hafZ4yNk+voYEIZB0KH9G7yt0rov6Uv3t+PFXc6R67A=;
	b=E/u5tsrtbYq0/wHfJFKoVcTknvpyjW+5rim5HsBr3w5Uu8LrSaSst88EucyLy55Hj28K+N
	zEaws1pn4RErRTq+dr273sjuf6xtQtaPEPoUg+aFmZFaM8Sx2RaE5c+R8ZhI63A5aWurDG
	ZGUjVAj5J2JXdp6r/OsghFBzWviK82ASNLXKFM2/2PCgPMjMXvjk1yF9DO92FdAILyLUfe
	3RKo0MIAn5lDGy8rqZsbFxzhiLZBKrYXS2D2x6RrTi2rzLc+kF1KxAtbsQnubEvFREoQ+m
	JAgiuAg0/g7HzAubOFLaCx8jZ7Ui47rxVSwgcUlLYTlBERcS9Rsw7FE/9JlhCA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Sun, 13 Apr 2025 21:12:32 +0200
Subject: [PATCH] MIPS: SMP: Implement parallel CPU bring up for EyeQ
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250413-parallel-cpu-bringup-v1-1-a19d36ec229b@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAJ8M/GcC/x3MQQqEMAxA0atI1gZsVZx6FXERNWqg1JKiCOLdp
 7h8i/8fSKzCCfriAeVLkhwhw5QFzDuFjVGWbLCVbavGGIyk5D17nOOJk0rYzojdzzlHztYtE+Q
 0Kq9yf9thfN8/lclC8WYAAAA=
X-Change-ID: 20250411-parallel-cpu-bringup-78999a9235ea
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudekgeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthekredtredtjeenucfhrhhomhepifhrvghgohhrhicuvefngffogffpvfcuoehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvheehjeevleeggfelfffgjedugfduleduuedthfelieduveffgeeuleekffduhfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmeefuggtmegvvgektdemhedvvdehmedvgeejgeemiegrugdtmegtugeiugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemfegutgemvggvkedtmeehvddvheemvdegjeegmeeirggutdemtgguiegupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvr
 hhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhlrgguihhmihhrrdhkohhnughrrghtihgvvhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtohepthgrfihfihhkrdgsrgihohhukhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: gregory.clement@bootlin.com

Added support for starting CPUs in parallel on EyeQ to speed up boot time.

On EyeQ5, booting 8 CPUs is now ~90ms faster.
On EyeQ6, booting 32 CPUs is now ~650ms faster.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
Hello,

This patch allows CPUs to start in parallel. It has been tested on
EyeQ5 and EyeQ6, which are both MIPS64 and use the I6500 design. These
systems use CPS to support SMP.

As noted in the commit log, on EyeQ6, booting 32 CPUs is now ~650ms
faster.

Currently, this support is only for EyeQ SoC. However, it should also
work for other CPUs using CPS. I am less sure about MT ASE support,
but this patch can be a good starting point. If anyone wants to add
support for other systems, I can share some ideas, especially for the
MIPS_GENERIC setup that needs to handle both types of SMP setups.

Gregory
---
 arch/mips/Kconfig                |  2 ++
 arch/mips/include/asm/topology.h |  3 +++
 arch/mips/kernel/smp-cps.c       |  2 ++
 arch/mips/kernel/smp.c           | 18 ++++++++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index fc0772c1bad4ab736d440a18b972faf66a610783..e0e6ce2592b4168facf337b60fd889d76e81a407 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -617,6 +617,7 @@ config EYEQ
 	select USB_UHCI_BIG_ENDIAN_DESC if CPU_BIG_ENDIAN
 	select USB_UHCI_BIG_ENDIAN_MMIO if CPU_BIG_ENDIAN
 	select USE_OF
+	select HOTPLUG_PARALLEL if SMP
 	help
 	  Select this to build a kernel supporting EyeQ SoC from Mobileye.
 
@@ -2287,6 +2288,7 @@ config MIPS_CPS
 	select MIPS_CM
 	select MIPS_CPS_PM if HOTPLUG_CPU
 	select SMP
+	select HOTPLUG_SMT if HOTPLUG_PARALLEL
 	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
 	select SYNC_R4K if (CEVT_R4K || CSRC_R4K)
 	select SYS_SUPPORTS_HOTPLUG_CPU
diff --git a/arch/mips/include/asm/topology.h b/arch/mips/include/asm/topology.h
index 0673d2d0f2e6dd02ed14d650e5af7b8a3c162b6f..5158c802eb6574d292f6ad2512cc7772fece4aae 100644
--- a/arch/mips/include/asm/topology.h
+++ b/arch/mips/include/asm/topology.h
@@ -16,6 +16,9 @@
 #define topology_core_id(cpu)			(cpu_core(&cpu_data[cpu]))
 #define topology_core_cpumask(cpu)		(&cpu_core_map[cpu])
 #define topology_sibling_cpumask(cpu)		(&cpu_sibling_map[cpu])
+
+extern struct cpumask __cpu_primary_thread_mask;
+#define cpu_primary_thread_mask ((const struct cpumask *)&__cpu_primary_thread_mask)
 #endif
 
 #endif /* __ASM_TOPOLOGY_H */
diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index e85bd087467e8caf0640ad247ee5f8eb65107591..02bbd7ecd1b9557003186b9d3d98ae17eac5eb9f 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -236,6 +236,7 @@ static void __init cps_smp_setup(void)
 			/* Use the number of VPEs in cluster 0 core 0 for smp_num_siblings */
 			if (!cl && !c)
 				smp_num_siblings = core_vpes;
+			cpumask_set_cpu(nvpes, &__cpu_primary_thread_mask);
 
 			for (v = 0; v < min_t(int, core_vpes, NR_CPUS - nvpes); v++) {
 				cpu_set_cluster(&cpu_data[nvpes + v], cl);
@@ -364,6 +365,7 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
 	cl = cpu_cluster(&current_cpu_data);
 	c = cpu_core(&current_cpu_data);
 	cluster_bootcfg = &mips_cps_cluster_bootcfg[cl];
+	cpu_smt_set_num_threads(core_vpes, core_vpes);
 	core_bootcfg = &cluster_bootcfg->core_config[c];
 	bitmap_set(cluster_bootcfg->core_power, cpu_core(&current_cpu_data), 1);
 	atomic_set(&core_bootcfg->vpe_mask, 1 << cpu_vpe_id(&current_cpu_data));
diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 39e193cad2b9e4f877e920b71bbbb210e52607d0..1726744f2b2ec10a44420a7b9b9cd04f06c4d2f6 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -56,8 +56,10 @@ EXPORT_SYMBOL(cpu_sibling_map);
 cpumask_t cpu_core_map[NR_CPUS] __read_mostly;
 EXPORT_SYMBOL(cpu_core_map);
 
+#ifndef CONFIG_HOTPLUG_PARALLEL
 static DECLARE_COMPLETION(cpu_starting);
 static DECLARE_COMPLETION(cpu_running);
+#endif
 
 /*
  * A logical cpu mask containing only one VPE per core to
@@ -74,6 +76,8 @@ static cpumask_t cpu_core_setup_map;
 
 cpumask_t cpu_coherent_mask;
 
+struct cpumask __cpu_primary_thread_mask __read_mostly;
+
 unsigned int smp_max_threads __initdata = UINT_MAX;
 
 static int __init early_nosmt(char *s)
@@ -374,10 +378,15 @@ asmlinkage void start_secondary(void)
 	set_cpu_core_map(cpu);
 
 	cpumask_set_cpu(cpu, &cpu_coherent_mask);
+#ifdef CONFIG_HOTPLUG_PARALLEL
+	cpuhp_ap_sync_alive();
+#endif
 	notify_cpu_starting(cpu);
 
+#ifndef CONFIG_HOTPLUG_PARALLEL
 	/* Notify boot CPU that we're starting & ready to sync counters */
 	complete(&cpu_starting);
+#endif
 
 	synchronise_count_slave(cpu);
 
@@ -386,11 +395,13 @@ asmlinkage void start_secondary(void)
 
 	calculate_cpu_foreign_map();
 
+#ifndef CONFIG_HOTPLUG_PARALLEL
 	/*
 	 * Notify boot CPU that we're up & online and it can safely return
 	 * from __cpu_up
 	 */
 	complete(&cpu_running);
+#endif
 
 	/*
 	 * irq will be enabled in ->smp_finish(), enabling it too early
@@ -447,6 +458,12 @@ void __init smp_prepare_boot_cpu(void)
 	set_cpu_online(0, true);
 }
 
+#ifdef CONFIG_HOTPLUG_PARALLEL
+int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tidle)
+{
+	return mp_ops->boot_secondary(cpu, tidle);
+}
+#else
 int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 {
 	int err;
@@ -466,6 +483,7 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 	wait_for_completion(&cpu_running);
 	return 0;
 }
+#endif
 
 #ifdef CONFIG_PROFILING
 /* Not really SMP stuff ... */

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250411-parallel-cpu-bringup-78999a9235ea

Best regards,
-- 
Grégory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


