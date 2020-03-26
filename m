Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6F0D193876
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2020 07:18:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbgCZGS2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 26 Mar 2020 02:18:28 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17962 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726336AbgCZGS2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 26 Mar 2020 02:18:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585203482;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=3HoRO69ABamr8s3SVaadV7OaerDtmKA/mgNQJOch0fw=;
        b=Q4jFx7gtf85Al/150uPHx+PQyLAFARiINiNTGe1XyKQJpm2j0nPzl7kiu4Sorshx
        ZxtSW3NLqkUK5/G0eZBH7pUJ7HG3bL0ypKGtAaI55retX5DFcqy5+V76Wnoz/PG1nJ3
        uySY6syCTL5rGeBeswtxPRbSrhZnP+IumAkPMDtY=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1585203480863597.70898141223; Thu, 26 Mar 2020 14:18:00 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, maz@kernel.org, chenhc@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <20200326061704.387483-8-jiaxun.yang@flygoat.com>
Subject: [RFC PATCH 5/6] MIPS: loongson64: Use mips_cpu_map_virq helper
Date:   Thu, 26 Mar 2020 14:17:03 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200326061704.387483-1-jiaxun.yang@flygoat.com>
References: <20200326061704.387483-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove the use of MIPS_CPU_IRQ_BASE and step forward
to purely irq domain based platform.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/loongson64/smp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index e1fe8bbb377d..04ee27baea19 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -18,6 +18,7 @@
 #include <asm/clock.h>
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
+#include <asm/irq_cpu.h>
 #include <loongson.h>
 #include <loongson_regs.h>
 #include <workarounds.h>
@@ -26,7 +27,7 @@
=20
 DEFINE_PER_CPU(int, cpu_state);
=20
-#define LS_IPI_IRQ (MIPS_CPU_IRQ_BASE + 6)
+#define LS_IPI_IRQ 6
=20
 static void *ipi_set0_regs[16];
 static void *ipi_clear0_regs[16];
@@ -428,7 +429,8 @@ static void __init loongson3_smp_setup(void)
=20
 static void __init loongson3_prepare_cpus(unsigned int max_cpus)
 {
-=09if (request_irq(LS_IPI_IRQ, loongson3_ipi_interrupt,
+=09if (request_irq(mips_cpu_map_virq(LS_IPI_IRQ),
+=09=09=09loongson3_ipi_interrupt,
 =09=09=09IRQF_PERCPU | IRQF_NO_SUSPEND, "SMP_IPI", NULL))
 =09=09pr_err("Failed to request IPI IRQ\n");
 =09init_cpu_present(cpu_possible_mask);
--=20
2.26.0.rc2


