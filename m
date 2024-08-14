Return-Path: <linux-mips+bounces-4897-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EB295191B
	for <lists+linux-mips@lfdr.de>; Wed, 14 Aug 2024 12:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7D071C22537
	for <lists+linux-mips@lfdr.de>; Wed, 14 Aug 2024 10:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D029B1AED23;
	Wed, 14 Aug 2024 10:39:39 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8721AE84F
	for <linux-mips@vger.kernel.org>; Wed, 14 Aug 2024 10:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723631979; cv=none; b=tELL/y0XwTdywQyyzrQkXCYlKyRoVGeQINu1fDEwQyGAnm75pdFiuyMQGgfcmLd1nPG3X7DczhbPfzGMx1S9Gg1JZgRgLxgPBAX0tYB0hm9S2EzOw0f5Kz00ovXKCZtCAKc6CiAQpAFO5IfzaUB+dTLPFEPnhO7RYKqsGekt6eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723631979; c=relaxed/simple;
	bh=WvDlRtQgOFQRfnnPhsslJTHPQwQfn5Z3AaE4XR/wG24=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BCdA3+mUmL9ismmZreqjn4OsLY39Xaedw7BRtarjJWS7rZp6Izz7Zx4sKpRd/adSU0zZTG/VtK5nkv7qd43w49WufsS9dJgBCMS/sbcGWKamZ9rL2gnHz+rgr5TgqFAffxBFTrji1x6fHGDSNa3D9Mto10hzCbJ1DPuKWe4hgEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WkPl66RxJz2CmfZ;
	Wed, 14 Aug 2024 18:34:42 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id DA3BA1A016C;
	Wed, 14 Aug 2024 18:39:34 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Wed, 14 Aug 2024 18:39:34 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <tsbogend@alpha.franken.de>, <cuigaosheng1@huawei.com>,
	<ricardo@marliere.net>, <arnd@arndb.de>, <akpm@linux-foundation.org>
CC: <linux-mips@vger.kernel.org>
Subject: [PATCH -next] MIPS: MT: Remove unused function mips_mt_regdump()
Date: Wed, 14 Aug 2024 18:39:33 +0800
Message-ID: <20240814103933.2053611-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200011.china.huawei.com (7.221.188.251)

The mips_mt_regdump() has not been used since
commit b633648c5ad3 ("MIPS: MT: Remove SMTC support"), so remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/mips/include/asm/mips_mt.h |  2 -
 arch/mips/kernel/mips-mt.c      | 77 ---------------------------------
 2 files changed, 79 deletions(-)

diff --git a/arch/mips/include/asm/mips_mt.h b/arch/mips/include/asm/mips_mt.h
index 28917f1582b3..6ea02af29876 100644
--- a/arch/mips/include/asm/mips_mt.h
+++ b/arch/mips/include/asm/mips_mt.h
@@ -17,8 +17,6 @@ extern int vpelimit;
 extern cpumask_t mt_fpu_cpumask;
 extern unsigned long mt_fpemul_threshold;
 
-extern void mips_mt_regdump(unsigned long previous_mvpcontrol_value);
-
 #ifdef CONFIG_MIPS_MT
 extern void mips_mt_set_cpuoptions(void);
 #else
diff --git a/arch/mips/kernel/mips-mt.c b/arch/mips/kernel/mips-mt.c
index c938ba208fc0..37676a44fefb 100644
--- a/arch/mips/kernel/mips-mt.c
+++ b/arch/mips/kernel/mips-mt.c
@@ -43,83 +43,6 @@ static int __init maxtcs(char *str)
 
 __setup("maxtcs=", maxtcs);
 
-/*
- * Dump new MIPS MT state for the core. Does not leave TCs halted.
- * Takes an argument which taken to be a pre-call MVPControl value.
- */
-
-void mips_mt_regdump(unsigned long mvpctl)
-{
-	unsigned long flags;
-	unsigned long vpflags;
-	unsigned long mvpconf0;
-	int nvpe;
-	int ntc;
-	int i;
-	int tc;
-	unsigned long haltval;
-	unsigned long tcstatval;
-
-	local_irq_save(flags);
-	vpflags = dvpe();
-	printk("=== MIPS MT State Dump ===\n");
-	printk("-- Global State --\n");
-	printk("   MVPControl Passed: %08lx\n", mvpctl);
-	printk("   MVPControl Read: %08lx\n", vpflags);
-	printk("   MVPConf0 : %08lx\n", (mvpconf0 = read_c0_mvpconf0()));
-	nvpe = ((mvpconf0 & MVPCONF0_PVPE) >> MVPCONF0_PVPE_SHIFT) + 1;
-	ntc = ((mvpconf0 & MVPCONF0_PTC) >> MVPCONF0_PTC_SHIFT) + 1;
-	printk("-- per-VPE State --\n");
-	for (i = 0; i < nvpe; i++) {
-		for (tc = 0; tc < ntc; tc++) {
-			settc(tc);
-			if ((read_tc_c0_tcbind() & TCBIND_CURVPE) == i) {
-				printk("  VPE %d\n", i);
-				printk("   VPEControl : %08lx\n",
-				       read_vpe_c0_vpecontrol());
-				printk("   VPEConf0 : %08lx\n",
-				       read_vpe_c0_vpeconf0());
-				printk("   VPE%d.Status : %08lx\n",
-				       i, read_vpe_c0_status());
-				printk("   VPE%d.EPC : %08lx %pS\n",
-				       i, read_vpe_c0_epc(),
-				       (void *) read_vpe_c0_epc());
-				printk("   VPE%d.Cause : %08lx\n",
-				       i, read_vpe_c0_cause());
-				printk("   VPE%d.Config7 : %08lx\n",
-				       i, read_vpe_c0_config7());
-				break; /* Next VPE */
-			}
-		}
-	}
-	printk("-- per-TC State --\n");
-	for (tc = 0; tc < ntc; tc++) {
-		settc(tc);
-		if (read_tc_c0_tcbind() == read_c0_tcbind()) {
-			/* Are we dumping ourself?  */
-			haltval = 0; /* Then we're not halted, and mustn't be */
-			tcstatval = flags; /* And pre-dump TCStatus is flags */
-			printk("  TC %d (current TC with VPE EPC above)\n", tc);
-		} else {
-			haltval = read_tc_c0_tchalt();
-			write_tc_c0_tchalt(1);
-			tcstatval = read_tc_c0_tcstatus();
-			printk("  TC %d\n", tc);
-		}
-		printk("   TCStatus : %08lx\n", tcstatval);
-		printk("   TCBind : %08lx\n", read_tc_c0_tcbind());
-		printk("   TCRestart : %08lx %pS\n",
-		       read_tc_c0_tcrestart(), (void *) read_tc_c0_tcrestart());
-		printk("   TCHalt : %08lx\n", haltval);
-		printk("   TCContext : %08lx\n", read_tc_c0_tccontext());
-		if (!haltval)
-			write_tc_c0_tchalt(0);
-	}
-	printk("===========================\n");
-	evpe(vpflags);
-	local_irq_restore(flags);
-}
-
 static int mt_opt_rpsctl = -1;
 static int mt_opt_nblsu = -1;
 static int mt_opt_forceconfig7;
-- 
2.25.1


