Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 163DC2CCFE8
	for <lists+linux-mips@lfdr.de>; Thu,  3 Dec 2020 07:57:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728798AbgLCG5G (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Dec 2020 01:57:06 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:8185 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgLCG5F (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Dec 2020 01:57:05 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cmmnm0b9qz15WDn;
        Thu,  3 Dec 2020 14:55:56 +0800 (CST)
Received: from euler.huawei.com (10.175.124.27) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Thu, 3 Dec 2020 14:56:15 +0800
From:   Wei Li <liwei391@huawei.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>
CC:     <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <yangyingliang@huawei.com>, <guohanjun@huawei.com>
Subject: [PATCH] MIPS: SMP-CPS: Add support for irq migration when CPU offline
Date:   Thu, 3 Dec 2020 14:54:43 +0800
Message-ID: <20201203065443.11263-1-liwei391@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Currently we won't migrate irqs when offline CPUs, which has been
implemented on most architectures. That will lead to some devices work
incorrectly if the bound cores are offline.

While that can be easily supported by enabling GENERIC_IRQ_MIGRATION.
But i don't pretty known the reason it was not supported on all MIPS
platforms.

This patch add the support for irq migration on MIPS CPS platform, and
it's tested on the interAptiv processor.

Signed-off-by: Wei Li <liwei391@huawei.com>
---
 arch/mips/Kconfig          | 1 +
 arch/mips/kernel/smp-cps.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index a48cb9a71471..8ece19ffe255 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2510,6 +2510,7 @@ config MIPS_CPS
 	select SYS_SUPPORTS_SCHED_SMT if CPU_MIPSR6
 	select SYS_SUPPORTS_SMP
 	select WEAK_ORDERING
+	select GENERIC_IRQ_MIGRATION if HOTPLUG_CPU
 	help
 	  Select this if you wish to run an SMP kernel across multiple cores
 	  within a MIPS Coherent Processing System. When this option is
diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index 3ab433a8e871..26f74f7d7604 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -12,6 +12,7 @@
 #include <linux/slab.h>
 #include <linux/smp.h>
 #include <linux/types.h>
+#include <linux/irq.h>
 
 #include <asm/bcache.h>
 #include <asm/mips-cps.h>
@@ -465,6 +466,7 @@ static int cps_cpu_disable(void)
 	smp_mb__after_atomic();
 	set_cpu_online(cpu, false);
 	calculate_cpu_foreign_map();
+	irq_migrate_all_off_this_cpu();
 
 	return 0;
 }
-- 
2.17.1

