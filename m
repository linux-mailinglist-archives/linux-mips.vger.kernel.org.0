Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2204D193877
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2020 07:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgCZGSb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 26 Mar 2020 02:18:31 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17921 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726213AbgCZGSb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 26 Mar 2020 02:18:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585203482;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=BBAi/x5l0TjKfhcRwZy2KnKo2sELK7ufBAqCxGvsXXU=;
        b=Qs/HyLnLzVODDYIVg/gnXYS7SVonuG84qAKpf0UR/h6cTHXhmZvw/N+ZGdDZaHCG
        UrtWFBgY79YmJtWnfh4hrewUEhW7+afm4XjbMkHmVjTimVYe0nbMDuutPe4Kb/D1iK4
        iQEnBRUu93pZtytl3HV8ooEYuMielsof7EfFpWBs=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1585203480271207.56902501820855; Thu, 26 Mar 2020 14:18:00 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, maz@kernel.org, chenhc@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <20200326061704.387483-7-jiaxun.yang@flygoat.com>
Subject: [RFC PATCH 4/6] MIPS: kernel: Use mips_cpu_map_virq helper
Date:   Thu, 26 Mar 2020 14:17:02 +0800
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
 arch/mips/kernel/cevt-r4k.c          | 2 +-
 arch/mips/kernel/perf_event_mipsxx.c | 3 ++-
 arch/mips/kernel/rtlx-mt.c           | 7 +++++--
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kernel/cevt-r4k.c b/arch/mips/kernel/cevt-r4k.c
index 17a9cbb8b3df..d838b1cad0f7 100644
--- a/arch/mips/kernel/cevt-r4k.c
+++ b/arch/mips/kernel/cevt-r4k.c
@@ -247,7 +247,7 @@ int c0_compare_int_usable(void)
=20
 unsigned int __weak get_c0_compare_int(void)
 {
-=09return MIPS_CPU_IRQ_BASE + cp0_compare_irq;
+=09return mips_cpu_map_virq(p0_compare_irq);
 }
=20
 int r4k_clockevent_init(void)
diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_e=
vent_mipsxx.c
index 128fc9999c56..8fc484fe8afa 100644
--- a/arch/mips/kernel/perf_event_mipsxx.c
+++ b/arch/mips/kernel/perf_event_mipsxx.c
@@ -20,6 +20,7 @@
 #include <linux/uaccess.h>
=20
 #include <asm/irq.h>
+#include <asm/irq_cpu.h>
 #include <asm/irq_regs.h>
 #include <asm/stacktrace.h>
 #include <asm/time.h> /* For perf_irq */
@@ -1702,7 +1703,7 @@ init_hw_perf_events(void)
 =09if (get_c0_perfcount_int)
 =09=09irq =3D get_c0_perfcount_int();
 =09else if (cp0_perfcount_irq >=3D 0)
-=09=09irq =3D MIPS_CPU_IRQ_BASE + cp0_perfcount_irq;
+=09=09irq =3D mips_cpu_map_virq(cp0_perfcount_irq);
 =09else
 =09=09irq =3D -1;
=20
diff --git a/arch/mips/kernel/rtlx-mt.c b/arch/mips/kernel/rtlx-mt.c
index 38c6925a1bea..110ed768d2ef 100644
--- a/arch/mips/kernel/rtlx-mt.c
+++ b/arch/mips/kernel/rtlx-mt.c
@@ -16,14 +16,17 @@
=20
 #include <asm/mips_mt.h>
 #include <asm/vpe.h>
+#include <asm/irq_cpu.h>
 #include <asm/rtlx.h>
=20
 static int major;
=20
 static void rtlx_dispatch(void)
 {
-=09if (read_c0_cause() & read_c0_status() & C_SW0)
-=09=09do_IRQ(MIPS_CPU_IRQ_BASE + MIPS_CPU_RTLX_IRQ);
+=09if (read_c0_cause() & read_c0_status() & C_SW0) {
+=09=09do_IRQ(irq_linear_revmap(mips_cpu_irq_domain,
+=09=09=09=09=09=09MIPS_CPU_RTLX_IRQ);
+=09}
 }
=20
 /*
--=20
2.26.0.rc2


