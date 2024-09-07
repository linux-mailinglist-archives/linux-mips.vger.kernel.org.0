Return-Path: <linux-mips+bounces-5389-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE609700E0
	for <lists+linux-mips@lfdr.de>; Sat,  7 Sep 2024 10:27:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AB4B2842BD
	for <lists+linux-mips@lfdr.de>; Sat,  7 Sep 2024 08:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2C514AD22;
	Sat,  7 Sep 2024 08:27:27 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 265711B85DC;
	Sat,  7 Sep 2024 08:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725697647; cv=none; b=ojW0QIwWTrMUi1gCB7tl5LVOcNMHf33ANyhgIqTFqUW+l6nvY7xpK3pEwec9HNn92ccih96CkMsqOAe3Wh9n3jAIk4YcpdCAOoNJA2ud8B2O1K9Pq6U7lju4WiudGhQVSX/xQmbkOn1lxvuyxkF5F1HoLDf8ID3ypqlGiGM/zlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725697647; c=relaxed/simple;
	bh=i+dsDE/I0D1lKf66AAYYx0gu5rFBsU18yAz5QAfMXdc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SVKBLAd+b5sxWSK3F2nWv4ukRG6+Tue9HOkrWUYVwAOLjZ2JOBqsWEVcfTM+RIE56RhIWW88Tg+8D+arDqAYIz2OlZgpqFl0GnfNdaq1rLiv6QDjUMdKsvhOLpVIkuLm8hEuCdG5OgnjppNus+5WBtxg+Yokj9bn96UIDP7Nav0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8Bx++lpDtxmxxMBAA--.2755S3;
	Sat, 07 Sep 2024 16:27:21 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMDxcNZoDtxmd+0AAA--.5018S2;
	Sat, 07 Sep 2024 16:27:21 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Naveen N Rao <naveen@kernel.org>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] smp: Mark smp_prepare_boot_cpu() __init
Date: Sat,  7 Sep 2024 16:27:20 +0800
Message-Id: <20240907082720.452148-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxcNZoDtxmd+0AAA--.5018S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Function smp_prepare_boot_cpu() is only called at boot stage, here
mark it as __init.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kernel/smp.c | 2 +-
 arch/mips/kernel/smp.c      | 2 +-
 arch/powerpc/kernel/smp.c   | 2 +-
 include/linux/smp.h         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
index ca405ab86aae..be2655c4c414 100644
--- a/arch/loongarch/kernel/smp.c
+++ b/arch/loongarch/kernel/smp.c
@@ -476,7 +476,7 @@ core_initcall(ipi_pm_init);
 #endif
 
 /* Preload SMP state for boot cpu */
-void smp_prepare_boot_cpu(void)
+void __init smp_prepare_boot_cpu(void)
 {
 	unsigned int cpu, node, rr_node;
 
diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 0362fc5df7b0..39e193cad2b9 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -439,7 +439,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 }
 
 /* preload SMP state for boot cpu */
-void smp_prepare_boot_cpu(void)
+void __init smp_prepare_boot_cpu(void)
 {
 	if (mp_ops->prepare_boot_cpu)
 		mp_ops->prepare_boot_cpu();
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 46e6d2cd7a2d..4ab9b8cee77a 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1166,7 +1166,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	cpu_smt_set_num_threads(num_threads, threads_per_core);
 }
 
-void smp_prepare_boot_cpu(void)
+void __init smp_prepare_boot_cpu(void)
 {
 	BUG_ON(smp_processor_id() != boot_cpuid);
 #ifdef CONFIG_PPC64
diff --git a/include/linux/smp.h b/include/linux/smp.h
index fcd61dfe2af3..6a0813c905d0 100644
--- a/include/linux/smp.h
+++ b/include/linux/smp.h
@@ -109,7 +109,7 @@ static inline void on_each_cpu_cond(smp_cond_func_t cond_func,
  * Architecture specific boot CPU setup.  Defined as empty weak function in
  * init/main.c. Architectures can override it.
  */
-void smp_prepare_boot_cpu(void);
+void __init smp_prepare_boot_cpu(void);
 
 #ifdef CONFIG_SMP
 

base-commit: b31c4492884252a8360f312a0ac2049349ddf603
-- 
2.39.3


