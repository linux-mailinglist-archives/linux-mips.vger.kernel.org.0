Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8BE19387F
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2020 07:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbgCZGVg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 26 Mar 2020 02:21:36 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17992 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725819AbgCZGVg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 26 Mar 2020 02:21:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585203646;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=mUcRUhccdsZ2spS4aBWhIPSp6m5WL3SIAhjs0dJ4W/E=;
        b=JFY9KkJBmfK0YBPRDd9FE1755Y7nbIuq6blqbBHQtrGhKxX9MY32wrVHBctyUMsn
        FF0D4PHbfQtb/wD96Jmom9IrjolMZl4l+TNd5yndsMLTpBSLVacFKtNrIl5nSV2b0Lx
        XTnMl2UNqUMY4gT9gt3u9W5CNh9WAg/hjvZoEvc8=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1585203645922458.7315729300243; Thu, 26 Mar 2020 14:20:45 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, maz@kernel.org, chenhc@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <20200326062039.387756-1-jiaxun.yang@flygoat.com>
Subject: [RFC PATCH 6/6] MIPS: ip22: Use mips_cpu_map_virq helper
Date:   Thu, 26 Mar 2020 14:20:39 +0800
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

I'm not brave enough to touch legacy IRQ layout so just
keep it as is.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/sgi/ip22.h | 30 +++++++++++++++---------------
 arch/mips/sgi-ip22/ip22-int.c    | 14 +++++++++-----
 2 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/arch/mips/include/asm/sgi/ip22.h b/arch/mips/include/asm/sgi/i=
p22.h
index 87ec9eaa04e3..42dadb1d08b8 100644
--- a/arch/mips/include/asm/sgi/ip22.h
+++ b/arch/mips/include/asm/sgi/ip22.h
@@ -24,27 +24,27 @@
 #include <irq.h>
 #include <asm/sgi/ioc.h>
=20
+/* 8 MIPS CPU IRQ Lines */
+#define SGI_SOFT_0_IRQ=090
+#define SGI_SOFT_1_IRQ=091
+#define SGI_LOCAL_0_IRQ 2
+#define SGI_LOCAL_1_IRQ 3
+#define SGI_8254_0_IRQ=094
+#define SGI_8254_1_IRQ=095
+#define SGI_BUSERR_IRQ=096
+#define SGI_TIMER_IRQ=097
+
 #define SGINT_EISA=090=09/* 16 EISA irq levels (Indigo2) */
-#define SGINT_CPU=09MIPS_CPU_IRQ_BASE=09/* MIPS CPU define 8 interrupt sou=
rces */
-#define SGINT_LOCAL0=09(SGINT_CPU+8)=09/* 8 local0 irq levels */
-#define SGINT_LOCAL1=09(SGINT_CPU+16)=09/* 8 local1 irq levels */
-#define SGINT_LOCAL2=09(SGINT_CPU+24)=09/* 8 local2 vectored irq levels */
-#define SGINT_LOCAL3=09(SGINT_CPU+32)=09/* 8 local3 vectored irq levels */
-#define SGINT_END=09(SGINT_CPU+40)=09/* End of 'spaces' */
+#define SGINT_LOCAL0=09(SGINT_EISA+24)=09/* 8 local0 irq levels */
+#define SGINT_LOCAL1=09(SGINT_LOCAL0+8)=09/* 8 local1 irq levels */
+#define SGINT_LOCAL2=09(SGINT_LOCAL1+8)=09/* 8 local2 vectored irq levels =
*/
+#define SGINT_LOCAL3=09(SGINT_LOCAL0+8)=09/* 8 local3 vectored irq levels =
*/
+#define SGINT_END=09(SGINT_LOCAL0+8)=09/* End of 'spaces' */
=20
 /*
  * Individual interrupt definitions for the Indy and Indigo2
  */
=20
-#define SGI_SOFT_0_IRQ=09SGINT_CPU + 0
-#define SGI_SOFT_1_IRQ=09SGINT_CPU + 1
-#define SGI_LOCAL_0_IRQ SGINT_CPU + 2
-#define SGI_LOCAL_1_IRQ SGINT_CPU + 3
-#define SGI_8254_0_IRQ=09SGINT_CPU + 4
-#define SGI_8254_1_IRQ=09SGINT_CPU + 5
-#define SGI_BUSERR_IRQ=09SGINT_CPU + 6
-#define SGI_TIMER_IRQ=09SGINT_CPU + 7
-
 #define SGI_FIFO_IRQ=09SGINT_LOCAL0 + 0=09/* FIFO full */
 #define SGI_GIO_0_IRQ=09SGI_FIFO_IRQ=09=09/* GIO-0 */
 #define SGI_WD93_0_IRQ=09SGINT_LOCAL0 + 1=09/* 1st onboard WD93 */
diff --git a/arch/mips/sgi-ip22/ip22-int.c b/arch/mips/sgi-ip22/ip22-int.c
index 96798a4ab2de..b1fbd7c5df9d 100644
--- a/arch/mips/sgi-ip22/ip22-int.c
+++ b/arch/mips/sgi-ip22/ip22-int.c
@@ -151,7 +151,7 @@ extern void ip22_be_interrupt(int irq);
=20
 static void __irq_entry indy_buserror_irq(void)
 {
-=09int irq =3D SGI_BUSERR_IRQ;
+=09int irq =3D mips_cpu_map_virq(SGI_BUSERR_IRQ);
=20
 =09irq_enter();
 =09kstat_incr_irq_this_cpu(irq);
@@ -203,7 +203,8 @@ asmlinkage void plat_irq_dispatch(void)
 =09 * First we check for r4k counter/timer IRQ.
 =09 */
 =09if (pending & CAUSEF_IP7)
-=09=09do_IRQ(SGI_TIMER_IRQ);
+=09=09do_IRQ(irq_linear_revmap(mips_cpu_irq_domain,
+=09=09=09=09=09SGI_TIMER_IRQ));
 =09else if (pending & CAUSEF_IP2)
 =09=09indy_local0_irqdispatch();
 =09else if (pending & CAUSEF_IP3)
@@ -293,13 +294,16 @@ void __init arch_init_irq(void)
 =09}
=20
 =09/* vector handler. this register the IRQ as non-sharable */
-=09if (request_irq(SGI_LOCAL_0_IRQ, no_action, IRQF_NO_THREAD,
+=09if (request_irq(mips_cpu_map_virq(SGI_LOCAL_0_IRQ),
+=09=09=09no_action, IRQF_NO_THREAD,
 =09=09=09"local0 cascade", NULL))
 =09=09pr_err("Failed to register local0 cascade interrupt\n");
-=09if (request_irq(SGI_LOCAL_1_IRQ, no_action, IRQF_NO_THREAD,
+=09if (request_irq(mips_cpu_map_virq(SGI_LOCAL_1_IRQ),
+=09=09=09no_action, IRQF_NO_THREAD,
 =09=09=09"local1 cascade", NULL))
 =09=09pr_err("Failed to register local1 cascade interrupt\n");
-=09if (request_irq(SGI_BUSERR_IRQ, no_action, IRQF_NO_THREAD,
+=09if (request_irq(mips_cpu_map_virq(SGI_BUSERR_IRQ),
+=09=09=09no_action, IRQF_NO_THREAD,
 =09=09=09"Bus Error", NULL))
 =09=09pr_err("Failed to register Bus Error interrupt\n");
=20
--=20
2.26.0.rc2


