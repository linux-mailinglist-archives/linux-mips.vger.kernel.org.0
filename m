Return-Path: <linux-mips+bounces-9720-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CDFB005D2
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jul 2025 16:55:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8CE31C87CB5
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jul 2025 14:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F892270568;
	Thu, 10 Jul 2025 14:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Vsr4mGrM"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5023778C91;
	Thu, 10 Jul 2025 14:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752159295; cv=none; b=kOteN6kz//zrYspBGUWkaigV8zW5ycPnm83E90bNf+hGT4m57IDkPd+Ivj5F0rK4MYAWT+nQtRIVyiuoumREx0VBa6pTq9kHL2aiY444raqPgJ59WAFZRXBVr0FendDWqKrmhd6jBJeq4vHIisXjS8GFHoVUpVX2zHlg3eJkaIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752159295; c=relaxed/simple;
	bh=wTyeVRD0Q/j3OoiHKwSFCjExWzADBgvyKL0ki3NGjO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AyXxrYRPnSzeeocIlxXyZnqxwgHDaBmBj+U0NGT3lBXAH+gooIxdLwFUnVA9nB6Fm1m1cgmb1WXNVXEMcvWOIpXz4O4Q57g4/PGI/gas9RntIAfMkHQel+IFzsoa1QxirN5brCkzkSF18aSbQbdkFhC2iW7waQ/74TVG69nCMus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Vsr4mGrM; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 135F11FD35;
	Thu, 10 Jul 2025 14:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752159290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+3hw0/oTfer0nFWTeOY53i4aNoZrfHZL7BqccUK6WXo=;
	b=Vsr4mGrMRcbSgc+FOykmG4WuWUwIGy95hAMLxAURbEgFQRfHln5F8vUSpw99ZKOgIpKLcO
	dOKNG0udye0OS8q/bv1EP680SF4JCTDii7yFTsugjhG5PpIOuoh6Y0Z/TIuUOxyKyybDNT
	gaqn7KdJVYd3L2BrXb3GeczQNcSEVdU9go8Gxup0P38o+38d8jEOYq5ljb99wZNUdtVJ+x
	RdPDY9YVkCDLek/D3FXogNVWdljOAwTHFP68799ZXU/IeqOS+Hk+uFmZIf5sP9kk9sWGhx
	dX1xsTuJH2HCm5TOhsYcrmKHaylcvrGreq5pUEs5GLQ7qOcPge/onpyGX3Ex2Q==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Thu, 10 Jul 2025 16:54:42 +0200
Subject: [PATCH v2] MIPS: disable MMID when not supported by the hardware
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250710-mmid_disable_no_ginv_on_noc-v2-1-228aa2056dfa@bootlin.com>
X-B4-Tracking: v=1; b=H4sIADHUb2gC/42NQQ6CMBBFr0JmbU0pUtCV9zCkKXSESaBjWtJoC
 He3cgJ3//3FextEDIQRbsUGARNFYp9BnQoYJutHFOQyg5KqllrVYlnIGUfR9jMaz2Yknwz7PAe
 hL7pBdW1r61rIhlfAJ70P+6PLPFFcOXyOWCp/73/eVIpSVK2trlJp2djm3jOvM/nzwAt0+75/A
 Ux0pirIAAAA
X-Change-ID: 20250625-mmid_disable_no_ginv_on_noc-6467e2985ad8
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegtdejfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtkeertdertdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteelfeduieekteejjeekueelueevhffhudduheejfedugfdtueefgeehgefgveetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeektghftgemieeksgdtmeeiieduudemvdgssgehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeektghftgemieeksgdtmeeiieduudemvdgssgehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrt
 ghomhdprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthgrfihfihhkrdgsrgihohhukhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepvhhlrgguihhmihhrrdhkohhnughrrghtihgvvhesmhhosghilhgvhigvrdgtohhm
X-GND-Sasl: gregory.clement@bootlin.com

It is possible that MMID is supported at the CPU level, but its
integration in a SoC prevents its usage. For instance, if the
System-level Interconnect (also known as Network on Chip) does not
support global invalidation, then the MMID feature is not usable. The
current implementation of MMID relies on the GINV* instructions.

This patch allows the disabling of MMID based on a device tree
property, as this issue cannot be detected at runtime.

MMID is set up very early during the boot process, even before device
tree data can be accessed. Therefore, when we determine whether MMID
needs to be disabled, some MMID setup has already been performed for
the boot CPU. Consequently, we must revert the MMID setup on the first
CPU before disabling the feature for the subsequent CPUs that will be
initialized later.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
Since the issue around MMID support cannot be detected at runtime,
this patch now relies on a device tree property instead of a Kconfig
option, as requested by Jiaxun and Thomas. However, as I pointed out
in the commit log, MMID is enabled very early in the boot
process. Therefore, I had to track all the parts of the kernel where
MMID was set up before being able to access the device tree.

I found that MMID was only set up for the first CPU, and I also
ensured that we can revert the MMID configuration. Indeed, the MMID
feature is not actively used until paging is set up, which occurs
later in the boot process.

Gregory
---
Changes in v2:
- Remove Kconfig dependencies
- Rely on device tree property
- Link to v1: https://lore.kernel.org/r/20250625-mmid_disable_no_ginv_on_noc-v1-1-38a3902607a7@bootlin.com
---
 arch/mips/include/asm/cpu-info.h |  1 +
 arch/mips/kernel/cpu-probe.c     | 42 ++++++++++++++++++++++++++++++++++++++--
 arch/mips/kernel/mips-cm.c       |  5 +++++
 3 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/cpu-info.h b/arch/mips/include/asm/cpu-info.h
index a600670d00e970f4c9f02ce68ad71cde8b9255a8..fd60837ce50bc0a944eef459f9546a98be536c0d 100644
--- a/arch/mips/include/asm/cpu-info.h
+++ b/arch/mips/include/asm/cpu-info.h
@@ -123,6 +123,7 @@ extern struct cpuinfo_mips cpu_data[];
 
 extern void cpu_probe(void);
 extern void cpu_report(void);
+extern void cpu_disable_mmid(void);
 
 extern const char *__cpu_name[];
 #define cpu_name_string()	__cpu_name[raw_smp_processor_id()]
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index af7412549e6ea4484543dfe5846d58b632778ff2..04dc9ab555244db7df0a4e0853ec7444b38a1397 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -9,6 +9,7 @@
  */
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/mmu_context.h>
 #include <linux/ptrace.h>
 #include <linux/smp.h>
 #include <linux/stddef.h>
@@ -37,6 +38,8 @@
 unsigned int elf_hwcap __read_mostly;
 EXPORT_SYMBOL_GPL(elf_hwcap);
 
+static bool mmid_disabled_quirk;
+
 static inline unsigned long cpu_get_msa_id(void)
 {
 	unsigned long status, msa_id;
@@ -645,7 +648,7 @@ static inline unsigned int decode_config5(struct cpuinfo_mips *c)
 	config5 &= ~(MIPS_CONF5_UFR | MIPS_CONF5_UFE);
 
 	if (cpu_has_mips_r6) {
-		if (!__builtin_constant_p(cpu_has_mmid) || cpu_has_mmid)
+		if (!mmid_disabled_quirk && (!__builtin_constant_p(cpu_has_mmid) || cpu_has_mmid))
 			config5 |= MIPS_CONF5_MI;
 		else
 			config5 &= ~MIPS_CONF5_MI;
@@ -708,7 +711,6 @@ static inline unsigned int decode_config5(struct cpuinfo_mips *c)
 					max_mmid_width);
 				asid_mask = GENMASK(max_mmid_width - 1, 0);
 			}
-
 			set_cpu_asid_mask(c, asid_mask);
 		}
 	}
@@ -2046,3 +2048,39 @@ void cpu_set_vpe_id(struct cpuinfo_mips *cpuinfo, unsigned int vpe)
 	cpuinfo->globalnumber &= ~MIPS_GLOBALNUMBER_VP;
 	cpuinfo->globalnumber |= vpe << MIPS_GLOBALNUMBER_VP_SHF;
 }
+
+void cpu_disable_mmid(void)
+{
+	int i;
+	unsigned long asid_mask;
+	unsigned int cpu = smp_processor_id();
+	struct cpuinfo_mips *c = &current_cpu_data;
+	unsigned int config4 = read_c0_config4();
+	unsigned int config5 =  read_c0_config5();
+
+	/* Setup the initial ASID mask based on config4 */
+	asid_mask = MIPS_ENTRYHI_ASID;
+	if (config4 & MIPS_CONF4_AE)
+		asid_mask |= MIPS_ENTRYHI_ASIDX;
+	set_cpu_asid_mask(c, asid_mask);
+
+	/* Disable MMID in the C0 and update cpuinfo_mips accordingly */
+	config5 &= ~(MIPS_CONF5_UFR | MIPS_CONF5_UFE);
+	config5 &= ~MIPS_CONF5_MI;
+	write_c0_config5(config5);
+	/* Ensure the write to config5 above takes effect */
+	back_to_back_c0_hazard();
+	c->options &= ~MIPS_CPU_MMID;
+
+	/* Setup asid cache value cleared in per_cpu_trap_init() */
+	cpu_data[cpu].asid_cache = asid_first_version(cpu);
+
+	/* Reinit context for each CPU */
+	for_each_possible_cpu(i)
+		set_cpu_context(i, &init_mm, 0);
+
+	/* Ensure that now MMID will be seen as disable */
+	mmid_disabled_quirk = true;
+
+	pr_info("MMID support disabled due to hardware support issue\n");
+}
diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
index 43cb1e20baed3648ff83bb5d3bbe6a726072e063..96c607dbb3a09f6c8d7dbcccf22ed276f4f51f5c 100644
--- a/arch/mips/kernel/mips-cm.c
+++ b/arch/mips/kernel/mips-cm.c
@@ -248,6 +248,11 @@ void mips_cm_update_property(void)
 		return;
 	pr_info("HCI (Hardware Cache Init for the L2 cache) in GCR_L2_RAM_CONFIG from the CM3 is broken");
 	mips_cm_is_l2_hci_broken = true;
+
+	/* Disable MMID only if it was configured */
+	if (cpu_has_mmid)
+		cpu_disable_mmid();
+
 	of_node_put(cm_node);
 }
 

---
base-commit: 86731a2a651e58953fc949573895f2fa6d456841
change-id: 20250625-mmid_disable_no_ginv_on_noc-6467e2985ad8

Best regards,
-- 
Grégory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


