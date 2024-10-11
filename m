Return-Path: <linux-mips+bounces-5986-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5588299A2BE
	for <lists+linux-mips@lfdr.de>; Fri, 11 Oct 2024 13:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBD541F2331B
	for <lists+linux-mips@lfdr.de>; Fri, 11 Oct 2024 11:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E227217315;
	Fri, 11 Oct 2024 11:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aV0lMeAO"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8622A1D0E15;
	Fri, 11 Oct 2024 11:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728646399; cv=none; b=S49URikK25zqHIePuaIhJA5dWklQw2iO/TdsyCkOzc/KoJLJqDOqPAe2ddrdgqmdP8T9B+aFjxwVJUPULk+BuDLK3THUzzcQyuphSk1vk874fRefiWgca9d7rVgoLlImDB4rwPUp3V9tZDhLCD5YLtS7x6eL1FTezWbeJgieb1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728646399; c=relaxed/simple;
	bh=LSJxirvi62JUn406nxAA8pyzT2E2hR+/8i6a2rLZwV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Gtu5450aQ9Lul2xRGKGFCNVwOf9QdJH9yvbBCNNANxcg4fUGShCiA7W0ZIKI03/fEKK8TY9toT2CipW5WIOCvyQ5+Iz1pOcMwuG+V3b6kvh+wOuyIZXAzZ+amcykMIo+LHIpzz+2nI4SwG6ssnlR800mLtvXMeoGdcLjy99AMvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aV0lMeAO; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66C4060003;
	Fri, 11 Oct 2024 11:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728646393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FhnACtzICH6VaKQ4blevH/hD4rLeANe6ECj14NLS3xI=;
	b=aV0lMeAOYyrtz2R4wOWFbq/1yF3ezG++ZbCap/4lUgSq9ksL1JKFzq1rDVMoArDgLg+Smm
	OB2NlmSwheJa50ZHq5gUwR3XBUjl2Bk1oBO9DWA8aeQfoS7raVvo4KjP2kip03+gVlEzPe
	C7rkD0q5Xnvm8WBJ2lF7D5F/ujgHlKBW/NS2Jj3k7gwaKrdfgJ+hkGTyDd9Fhuc7u8il69
	JzhyZNKDZW3MUVzAffg+XoPXX279W/6BmY+IzWpQotWzlwtZ1brGw/bkJ5zwXbeuyFnDKH
	35cSZT9QlQ0W/QteDd1CBkjxd/PjOZHuRS9bcUjIl71NIj+MsJVdjM/egksaPw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 11 Oct 2024 13:32:57 +0200
Subject: [PATCH] MIPS: Allow using more than 32-bit addresses for reset
 vectors when possible
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241011-eyeq6h-smp-v1-1-866417772cd7@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAOgMCWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDA0ND3dTK1EKzDN3i3ALdNDND09REI6M0Y3NTJaCGgqLUtMwKsGHRsbW
 1AOAhXMRcAAAA
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-Sasl: gregory.clement@bootlin.com

While most MIPS64 CPUs use 32-bit values for their VP Local Reset
Exception Base registers, some I6500 CPUs can utilize a 64-bit value,
allowing addressing up to 47 bits of physical memory.

For the EyeQ6H CPU, where physical memory addresses exceed the 4GB
limit, utilizing this feature is mandatory to enable SMP support.

Unfortunately, there is no way to detect this capability based solely
on the ID of the CPU. According to Imagination, which designed the
CPU, the only reliable method is to fill the reset base field with
0xFF and then read back its value. If the upper part of the read-back
value is zero, it indicates that the address space is limited to 32
bits.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
Hello,

The following patch enables SMP on EyeQ6H SoCs.

It was successfully tested on EyeQ5 and EyeQ6H, as well as on MIPS32
CPUs such as ocelot on board PCB123 and JZ4780 on CI20. However, I
must admit that none of these platforms ran SMP. The ocelot has only
one core, and while the JZ4780 does have SMP capabilities, its support
is not yet available in the mainline kernel.

Gregory
---
 arch/mips/include/asm/mips-cm.h |  2 ++
 arch/mips/kernel/smp-cps.c      | 47 +++++++++++++++++++++++++++++++++++------
 2 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
index 1e782275850a3..23ce951f445bb 100644
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@ -326,7 +326,9 @@ GCR_CX_ACCESSOR_RW(32, 0x018, other)
 
 /* GCR_Cx_RESET_BASE - Configure where powered up cores will fetch from */
 GCR_CX_ACCESSOR_RW(32, 0x020, reset_base)
+GCR_CX_ACCESSOR_RW(64, 0x020, reset64_base)
 #define CM_GCR_Cx_RESET_BASE_BEVEXCBASE		GENMASK(31, 12)
+#define CM_GCR_Cx_RESET64_BASE_BEVEXCBASE	GENMASK_ULL(47, 12)
 #define CM_GCR_Cx_RESET_BASE_MODE		BIT(1)
 
 /* GCR_Cx_ID - Identify the current core */
diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index 395622c373258..556a1939a6e2e 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -37,7 +37,7 @@ enum label_id {
 UASM_L_LA(_not_nmi)
 
 static DECLARE_BITMAP(core_power, NR_CPUS);
-static uint32_t core_entry_reg;
+static u64 core_entry_reg;
 static phys_addr_t cps_vec_pa;
 
 struct core_boot_config *mips_cps_core_bootcfg;
@@ -94,6 +94,21 @@ static void __init *mips_cps_build_core_entry(void *addr)
 	return p;
 }
 
+static bool __init check_64bit_reset(void)
+{
+	bool cx_64bit_reset = false;
+
+	mips_cm_lock_other(0, 0, 0, CM_GCR_Cx_OTHER_BLOCK_LOCAL);
+	core_entry_reg = read_gcr_co_reset64_base();
+	write_gcr_co_reset64_base(CM_GCR_Cx_RESET64_BASE_BEVEXCBASE);
+	if ((read_gcr_co_reset64_base() & CM_GCR_Cx_RESET64_BASE_BEVEXCBASE) ==
+	    CM_GCR_Cx_RESET64_BASE_BEVEXCBASE)
+		cx_64bit_reset = true;
+	mips_cm_unlock_other();
+
+	return cx_64bit_reset;
+}
+
 static int __init allocate_cps_vecs(void)
 {
 	/* Try to allocate in KSEG1 first */
@@ -105,11 +120,23 @@ static int __init allocate_cps_vecs(void)
 					CM_GCR_Cx_RESET_BASE_BEVEXCBASE;
 
 	if (!cps_vec_pa && mips_cm_is64) {
-		cps_vec_pa = memblock_phys_alloc_range(BEV_VEC_SIZE, BEV_VEC_ALIGN,
-							0x0, SZ_4G - 1);
-		if (cps_vec_pa)
-			core_entry_reg = (cps_vec_pa & CM_GCR_Cx_RESET_BASE_BEVEXCBASE) |
+		phys_addr_t end;
+
+		if (check_64bit_reset()) {
+			pr_info("VP Local Reset Exception Base support 47 bits address\n");
+			end = MEMBLOCK_ALLOC_ANYWHERE;
+		} else {
+			end = SZ_4G - 1;
+		}
+		cps_vec_pa = memblock_phys_alloc_range(BEV_VEC_SIZE, BEV_VEC_ALIGN, 0, end);
+		if (cps_vec_pa) {
+			if (check_64bit_reset())
+				core_entry_reg = (cps_vec_pa & CM_GCR_Cx_RESET64_BASE_BEVEXCBASE) |
+					CM_GCR_Cx_RESET_BASE_MODE;
+			else
+				core_entry_reg = (cps_vec_pa & CM_GCR_Cx_RESET_BASE_BEVEXCBASE) |
 					CM_GCR_Cx_RESET_BASE_MODE;
+		}
 	}
 
 	if (!cps_vec_pa)
@@ -308,7 +335,10 @@ static void boot_core(unsigned int core, unsigned int vpe_id)
 	mips_cm_lock_other(0, core, 0, CM_GCR_Cx_OTHER_BLOCK_LOCAL);
 
 	/* Set its reset vector */
-	write_gcr_co_reset_base(core_entry_reg);
+	if (mips_cm_is64)
+		write_gcr_co_reset64_base(core_entry_reg);
+	else
+		write_gcr_co_reset_base(core_entry_reg);
 
 	/* Ensure its coherency is disabled */
 	write_gcr_co_coherence(0);
@@ -411,7 +441,10 @@ static int cps_boot_secondary(int cpu, struct task_struct *idle)
 
 	if (cpu_has_vp) {
 		mips_cm_lock_other(0, core, vpe_id, CM_GCR_Cx_OTHER_BLOCK_LOCAL);
-		write_gcr_co_reset_base(core_entry_reg);
+		if (mips_cm_is64)
+			write_gcr_co_reset64_base(core_entry_reg);
+		else
+			write_gcr_co_reset_base(core_entry_reg);
 		mips_cm_unlock_other();
 	}
 

---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241011-eyeq6h-smp-f615ea22f375

Best regards,
-- 
Gregory CLEMENT <gregory.clement@bootlin.com>


