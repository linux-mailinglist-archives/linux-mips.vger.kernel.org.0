Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EAC3193878
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2020 07:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbgCZGSi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 26 Mar 2020 02:18:38 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17922 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726336AbgCZGSh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 26 Mar 2020 02:18:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585203478;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=jb4NhSls4sPTUmWkcz9ETsBikQsJwZxN7Jmf4baOZ/k=;
        b=MHRQ9fmYb3vUwC05zaJQ9KTSUxjF+kqbyS/HCfFbEgNsTLMae2at56+I6KCbOfne
        wVmAjG/IdlJZlbxlz0TRgLqzv8pK2vOoTrCAnQgpP1nmm46Oqc1O9Eh98bLlotRpkjN
        vaei1xZfScIGSWBuNWbwSZPUJBJ5OBTw4WMvaAvY=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 158520347753210.850805907365725; Thu, 26 Mar 2020 14:17:57 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, maz@kernel.org, chenhc@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <20200326061704.387483-2-jiaxun.yang@flygoat.com>
Subject: [RFC PATCH 1/6] MIPS: irq_cpu: Add a helper to map virq for CPU IRQ
Date:   Thu, 26 Mar 2020 14:16:57 +0800
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

To care legacy platform without dt, we need this helper
to map virq for cpu_irq in order to deal with legacy drivers
rely on irq number.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/irq_cpu.h | 19 ++++++++++++++++++-
 drivers/irqchip/irq-mips-cpu.c  |  8 ++++----
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/irq_cpu.h b/arch/mips/include/asm/irq_cp=
u.h
index 83d7331ab215..231c5dc64c19 100644
--- a/arch/mips/include/asm/irq_cpu.h
+++ b/arch/mips/include/asm/irq_cpu.h
@@ -9,12 +9,29 @@
 #ifndef _ASM_IRQ_CPU_H
 #define _ASM_IRQ_CPU_H
=20
+#include <linux/irqdomain.h>
+
 extern void mips_cpu_irq_init(void);
+extern struct irq_domain *mips_cpu_irq_domain;
=20
 #ifdef CONFIG_IRQ_DOMAIN
-struct device_node;
 extern int mips_cpu_irq_of_init(struct device_node *of_node,
 =09=09=09=09struct device_node *parent);
+
+static inline int mips_cpu_map_virq(int hwirq)
+{
+=09struct irq_fwspec fwspec;
+
+=09fwspec.fwnode =3D mips_cpu_irq_domain->fwnode;
+=09fwspec.param_count =3D 1;
+=09fwspec.param[0] =3D hwirq;
+=09return irq_create_fwspec_mapping(&fwspec);
+}
+#else
+static inline int mips_cpu_map_virq(int hwirq)
+{
+=09return MIPS_CPU_IRQ_BASE + hwirq;
+}
 #endif
=20
 #endif /* _ASM_IRQ_CPU_H */
diff --git a/drivers/irqchip/irq-mips-cpu.c b/drivers/irqchip/irq-mips-cpu.=
c
index 95d4fd8f7a96..19734b11b36d 100644
--- a/drivers/irqchip/irq-mips-cpu.c
+++ b/drivers/irqchip/irq-mips-cpu.c
@@ -34,7 +34,7 @@
 #include <asm/mipsmtregs.h>
 #include <asm/setup.h>
=20
-static struct irq_domain *irq_domain;
+struct irq_domain *mips_cpu_irq_domain;
 static struct irq_domain *ipi_domain;
=20
 static inline void unmask_mips_irq(struct irq_data *d)
@@ -141,7 +141,7 @@ asmlinkage void __weak plat_irq_dispatch(void)
 =09=09if (IS_ENABLED(CONFIG_GENERIC_IRQ_IPI) && irq < 2)
 =09=09=09virq =3D irq_linear_revmap(ipi_domain, irq);
 =09=09else
-=09=09=09virq =3D irq_linear_revmap(irq_domain, irq);
+=09=09=09virq =3D irq_linear_revmap(mips_cpu_irq_domain, irq);
 =09=09do_IRQ(virq);
 =09=09pending &=3D ~BIT(irq);
 =09}
@@ -251,10 +251,10 @@ static void __init __mips_cpu_irq_init(struct device_=
node *of_node)
 =09clear_c0_status(ST0_IM);
 =09clear_c0_cause(CAUSEF_IP);
=20
-=09irq_domain =3D irq_domain_add_legacy(of_node, 8, MIPS_CPU_IRQ_BASE, 0,
+=09mips_cpu_irq_domain =3D irq_domain_add_legacy(of_node, 8, MIPS_CPU_IRQ_=
BASE, 0,
 =09=09=09=09=09   &mips_cpu_intc_irq_domain_ops,
 =09=09=09=09=09   NULL);
-=09if (!irq_domain)
+=09if (!mips_cpu_irq_domain)
 =09=09panic("Failed to add irqdomain for MIPS CPU");
=20
 =09/*
--=20
2.26.0.rc2


