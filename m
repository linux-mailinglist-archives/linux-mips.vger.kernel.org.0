Return-Path: <linux-mips+bounces-5989-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0089199A51F
	for <lists+linux-mips@lfdr.de>; Fri, 11 Oct 2024 15:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17E7E1C25DB3
	for <lists+linux-mips@lfdr.de>; Fri, 11 Oct 2024 13:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96D0216A3B;
	Fri, 11 Oct 2024 13:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JSiElrhs"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A717B28E7;
	Fri, 11 Oct 2024 13:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728653661; cv=none; b=jB33/DAaehnf4ZkxV7+AN11hbWKxgzNVql9XIwEdNqi8SQ/hBhsGYNIikIUrRIJ4zC35kDaCiIdrd8j7+gYP/A+62rksXK3c3wLExOSsKtGmD82r0qcvP1QjKCKoo9z0N+UkIVztCtiAS5JWDKGeyAijJK2iga/bYkFZ/i7IdSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728653661; c=relaxed/simple;
	bh=oWTNbmGHPDCrID2KgcAKai9GNhD2zdd7lHp2hMHUJbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kgKCPk3sj+c/qtvvHPopDlwVML7/tqVHCuk22afmmYWg8nJ7wpiul/nAjdi98GhOWL4vm96XYICnkZq+4yXingno3MGdyh+g+nt3x2NkF+5ykYwRMqEDCl8f5htrD6WdsFK3qskS+CoHaHKzPp3CAVb6cdb5arH3DrI8x/Z3+d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JSiElrhs; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6F6F20008;
	Fri, 11 Oct 2024 13:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728653657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aueBH+lVpYMUXJgkH5Q2tsSfZVEnADtuEBiwUoEShhw=;
	b=JSiElrhsnIc58seLVXGCZnj9YXhxsv+3fZKFK2v1fDPN2sCYRi8QufWYiaXgJncLzxRIYd
	XVFiReI45zP0HtV5GmYhcE0kVFLC/f1HWyyQP176/vG4i/+mZwQEpCaAJoiLpfV2t/dHZF
	d3RgAK5/LhAD0O2Gpoa1cUeLLNuBSwS1bgADWDMzFQ9OlidsG2b56H4B+/HsCKVoAqxa2B
	TP2tNa9Tq9RUcpuXyBMYZvG7X9C0pTCu93OlEEel5WsnhXirCiKFmb3Cu7Ts8l9qYGHhnT
	aL9LhHPnkb6pNKtNA+jzqKYGQ7S2A5OMLbqpNZCm0haUN50ZJEYJd7IOY0alaQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 11 Oct 2024 15:34:08 +0200
Subject: [PATCH v2] MIPS: Allow using more than 32-bit addresses for reset
 vectors when possible
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241011-eyeq6h-smp-v2-1-8381edf8a5c6@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAE8pCWcC/23MQQ6CMBCF4auQWVvDVGiNK+9hWGCZ2kmkhZY0E
 sLdraxd/i953waJIlOCW7VBpMyJgy8hTxUY1/sXCR5Kg6xlgzWioJVm5UQaJ2EVttRLaS+6hXK
 YIln+HNijK+04LSGuh53xt/5lMgoUV6Ua1FpLM+j7M4Tlzf5swgjdvu9f1u9jsqYAAAA=
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

In the first version, I forgot to remove a line from
check_64bit_reset() that was originally used to print debug
information, but is no longer required. Sorry for the inconvenience.

Gregory
---
Changes in v2:
- Removed a leftover line of code that was used during development
- Link to v1: https://lore.kernel.org/r/20241011-eyeq6h-smp-v1-1-866417772cd7@bootlin.com
---
 arch/mips/include/asm/mips-cm.h |  2 ++
 arch/mips/kernel/smp-cps.c      | 46 ++++++++++++++++++++++++++++++++++-------
 2 files changed, 41 insertions(+), 7 deletions(-)

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
index 395622c373258..82c8f9b9573cc 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -37,7 +37,7 @@ enum label_id {
 UASM_L_LA(_not_nmi)
 
 static DECLARE_BITMAP(core_power, NR_CPUS);
-static uint32_t core_entry_reg;
+static u64 core_entry_reg;
 static phys_addr_t cps_vec_pa;
 
 struct core_boot_config *mips_cps_core_bootcfg;
@@ -94,6 +94,20 @@ static void __init *mips_cps_build_core_entry(void *addr)
 	return p;
 }
 
+static bool __init check_64bit_reset(void)
+{
+	bool cx_64bit_reset = false;
+
+	mips_cm_lock_other(0, 0, 0, CM_GCR_Cx_OTHER_BLOCK_LOCAL);
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
@@ -105,11 +119,23 @@ static int __init allocate_cps_vecs(void)
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
@@ -308,7 +334,10 @@ static void boot_core(unsigned int core, unsigned int vpe_id)
 	mips_cm_lock_other(0, core, 0, CM_GCR_Cx_OTHER_BLOCK_LOCAL);
 
 	/* Set its reset vector */
-	write_gcr_co_reset_base(core_entry_reg);
+	if (mips_cm_is64)
+		write_gcr_co_reset64_base(core_entry_reg);
+	else
+		write_gcr_co_reset_base(core_entry_reg);
 
 	/* Ensure its coherency is disabled */
 	write_gcr_co_coherence(0);
@@ -411,7 +440,10 @@ static int cps_boot_secondary(int cpu, struct task_struct *idle)
 
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


