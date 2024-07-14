Return-Path: <linux-mips+bounces-4315-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E364A930858
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2024 04:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B88E1F2154F
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2024 02:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EABCF8F5C;
	Sun, 14 Jul 2024 02:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="Map/egI4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZnjeeUbS"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4889479CE;
	Sun, 14 Jul 2024 02:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720924875; cv=none; b=swQFW9Wz385qTHxLFkcVd4REUedgcnfRMZPQRXSo/Kfiys10ApPe9uSAia+NdXb5Xp/dNPnBdRXJwXF8U2lqQaVtMNZUYtrMv9WUAGDxy3V8LrahvmTmpCInpgG/C6xpJ5QVAiETawPYawB8TErjXVC/cuMgK3fF8CDGQU2Rrko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720924875; c=relaxed/simple;
	bh=+BMX64LMqIy0Yju1SylS95nPoAjrSTts7QMuygG+Spc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bDG5+DmsR+b6nn/m6Ly7rn1YlSWF6a4No24/A4WWY8h85ZHWzeO/DFwGoObe2mLN7rRoxZYvmTTJUd4M1CJI97q9x2vDeM7yJOhNzUPN/gor2RmmiXB4R7D6kmQjr3C/E9HYtJE3ZbMpetr6qjhojfdVE4BH7PJzsznFWqRKVy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=Map/egI4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZnjeeUbS; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 5007F11400DB;
	Sat, 13 Jul 2024 22:41:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 13 Jul 2024 22:41:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1720924873; x=1721011273; bh=xn
	qUZ7ptKpNpUMU0XCyTUpnBsFgodd+EgetEiyr0qeo=; b=Map/egI4wUvRso32AA
	LzcQB+NTDwlb0cc/Bpdt8z7gHyRg+bqyw+uuW5cKqlNlD1db0nRBSMmDkOjofLn3
	PxkHV7ymYBscgCfL/qsfuWLO5oCTTC+pEfyjiqByVd4jIx4QivJkRG0eFWQWwk+v
	QDDUz9D9+8KuMPsVqWPfPuNP/56UamVW6B5jJKfTen5ng5YSmbyPy/eMzsL5t8ru
	lzb0BR8w2C5Shny8E5QznIgeXB68JvUkgfcmH+OiWGcjhY00xwB1tDwXpxt7dSWy
	7DnFutegnjt7JJq4iay5bweTHnKTDBLf/ewPH81YfQLmunNF8pCqbEy9aQq6kjhR
	5nsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1720924873; x=1721011273; bh=xnqUZ7ptKpNpU
	MU0XCyTUpnBsFgodd+EgetEiyr0qeo=; b=ZnjeeUbSie/WaVHq4YmIo+SlseDAH
	MJMOhIeeAUxUUDDK0USDwerp3ORyFnR4+bb9zCHFWagBt/c0L6Ok8yZhjhXl8sEJ
	w5RW+LyatraADw5TX0B+DTyG5g866O3MzdVh8h/tDHyTxlXUCdCqLXvVUuki4Cjr
	9uADKk3O2f+5sqocAeK8MPAqEl/BawgCVPCiwtw4IsiiatE/9i/PHQmgzKU2ou4J
	wDejKEla1iQXMM8xAsyk/4QRP3rK+rqmZF7kXNi/oOS7l9/KYwFJsrj04J16n/aT
	4lkT+isjJ5NeF/ER8wufCpE2BafNZzTvYinFEeDrWa2lbY3N/CE4RUFiA==
X-ME-Sender: <xms:yDqTZnKu2b6FFdvNxaOk7aMNmIMe_WFHB4eSolMdNIzfH1vcK9tnsA>
    <xme:yDqTZrLOd8r7fGTRZlTXtfPmKqZo-ual81klNhh-Rfm-AcQWmdecAeL8lf3k2dlby
    a8VSNMMmz7rBK_4fi4>
X-ME-Received: <xmr:yDqTZvtFL7g8-QauEXiVKJmONTMDzRMQkPGUjon5zmaSp9lzpnvsDS_0mClgMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfeelgdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheplfhirgiguhhn
    ucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenucggtf
    frrghtthgvrhhnpeffteeugeektdfgjeevuedvgffhgedtvdfghedugefhgeehteeuudeh
    udevjeethfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:yDqTZga6R1fn5LwwmHfe8Iynd9G7jBMwSNygpPsUG1D17_DuoD-PRg>
    <xmx:yDqTZuZcd4gQdDBBST630SkfSVMsBFNNshdIkvCyDOJWVcIbXsCvlA>
    <xmx:yDqTZkDON_E5o_nl0E-hQZZ9Gruh-bxl2QWnLOaFgHTPNFBw7Qc27w>
    <xmx:yDqTZsbire2SfMnUiGvo6zqky8rgoQN6RXpH4AtXddutZf4odwFGCQ>
    <xmx:yTqTZlzsxvZtQJS8VsbxLNpVhqqpuYt0Tj5byMy7WmlbFUcycAvygQQM>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Jul 2024 22:41:09 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 14 Jul 2024 10:41:05 +0800
Subject: [PATCH] MIPS: Loongson64: Switch to SYNC_R4K
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240714-loongson64-cevt-r4k-v1-1-98afed7260aa@flygoat.com>
X-B4-Tracking: v=1; b=H4sIAMA6k2YC/x3MTQqAIBBA4avErBuwGPq7SrQwnWwoNDQiiO6et
 PwW7z2QOAonGIoHIl+SJPiMqizArNo7RrHZUKuaVFsR7iF4l4JvCA1fJ0bakOeWLGnbd2Qgl0f
 kRe7/Ok7v+wE9a/iSZQAAAA==
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Huacai Chen <chenhuacai@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3712;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=+BMX64LMqIy0Yju1SylS95nPoAjrSTts7QMuygG+Spc=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTJVkd7zltMkbIqOLC29dCT2Z1/+F5WNfycEOlsr+ZRs
 ijlRv/bjlIWBjEuBlkxRZYQAaW+DY0XF1x/kPUHZg4rE8gQBi5OAZhIsBQjwzX1Z+WslauZIxPU
 PvRf5548zfnMQTOx6u6Zlyp8kre8EmH4n+cfbXFdwoGpuEmWPfjJc9mPSbl9Bqq7XIR5traL9Bp
 zAwA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Nowadays SYNC_R4K is performing better than Loongson64's
custom sync mechanism.

Switch to SYNC_R4K to improve performance and reduce code
duplication.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
Last minute for 6.11 :-)
---
 arch/mips/Kconfig           |  1 +
 arch/mips/include/asm/smp.h |  1 -
 arch/mips/loongson64/smp.c  | 35 ++---------------------------------
 3 files changed, 3 insertions(+), 34 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 1236ea122061..e163059dd4d3 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -478,6 +478,7 @@ config MACH_LOONGSON64
 	select BOARD_SCACHE
 	select CSRC_R4K
 	select CEVT_R4K
+	select SYNC_R4K
 	select FORCE_PCI
 	select ISA
 	select I8259
diff --git a/arch/mips/include/asm/smp.h b/arch/mips/include/asm/smp.h
index bc2c240f414b..2427d76f953f 100644
--- a/arch/mips/include/asm/smp.h
+++ b/arch/mips/include/asm/smp.h
@@ -50,7 +50,6 @@ extern int __cpu_logical_map[NR_CPUS];
 #define SMP_CALL_FUNCTION	0x2
 /* Octeon - Tell another core to flush its icache */
 #define SMP_ICACHE_FLUSH	0x4
-#define SMP_ASK_C0COUNT		0x8
 
 /* Mask of CPUs which are currently definitely operating coherently */
 extern cpumask_t cpu_coherent_mask;
diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index 66d049cdcf14..147acd972a07 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -33,7 +33,6 @@ static void __iomem *ipi_clear0_regs[16];
 static void __iomem *ipi_status0_regs[16];
 static void __iomem *ipi_en0_regs[16];
 static void __iomem *ipi_mailbox_buf[16];
-static uint32_t core0_c0count[NR_CPUS];
 
 static u32 (*ipi_read_clear)(int cpu);
 static void (*ipi_write_action)(int cpu, u32 action);
@@ -382,11 +381,10 @@ loongson3_send_ipi_mask(const struct cpumask *mask, unsigned int action)
 		ipi_write_action(cpu_logical_map(i), (u32)action);
 }
 
-
 static irqreturn_t loongson3_ipi_interrupt(int irq, void *dev_id)
 {
-	int i, cpu = smp_processor_id();
-	unsigned int action, c0count;
+	int cpu = smp_processor_id();
+	unsigned int action;
 
 	action = ipi_read_clear(cpu);
 
@@ -399,26 +397,14 @@ static irqreturn_t loongson3_ipi_interrupt(int irq, void *dev_id)
 		irq_exit();
 	}
 
-	if (action & SMP_ASK_C0COUNT) {
-		BUG_ON(cpu != 0);
-		c0count = read_c0_count();
-		c0count = c0count ? c0count : 1;
-		for (i = 1; i < nr_cpu_ids; i++)
-			core0_c0count[i] = c0count;
-		nudge_writes(); /* Let others see the result ASAP */
-	}
-
 	return IRQ_HANDLED;
 }
 
-#define MAX_LOOPS 800
 /*
  * SMP init and finish on secondary CPUs
  */
 static void loongson3_init_secondary(void)
 {
-	int i;
-	uint32_t initcount;
 	unsigned int cpu = smp_processor_id();
 	unsigned int imask = STATUSF_IP7 | STATUSF_IP6 |
 			     STATUSF_IP3 | STATUSF_IP2;
@@ -432,23 +418,6 @@ static void loongson3_init_secondary(void)
 		     cpu_logical_map(cpu) % loongson_sysconf.cores_per_package);
 	cpu_data[cpu].package =
 		cpu_logical_map(cpu) / loongson_sysconf.cores_per_package;
-
-	i = 0;
-	core0_c0count[cpu] = 0;
-	loongson3_send_ipi_single(0, SMP_ASK_C0COUNT);
-	while (!core0_c0count[cpu]) {
-		i++;
-		cpu_relax();
-	}
-
-	if (i > MAX_LOOPS)
-		i = MAX_LOOPS;
-	if (cpu_data[cpu].package)
-		initcount = core0_c0count[cpu] + i;
-	else /* Local access is faster for loops */
-		initcount = core0_c0count[cpu] + i/2;
-
-	write_c0_count(initcount);
 }
 
 static void loongson3_smp_finish(void)

---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240714-loongson64-cevt-r4k-eb74d4ad984c

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>


