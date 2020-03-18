Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B142C1895AC
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2020 07:24:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbgCRGYp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 18 Mar 2020 02:24:45 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17877 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726478AbgCRGYo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 18 Mar 2020 02:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1584512582;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=yVxhTjIGSsBi1j8l4nZCtCI9CxiYbq8eizSoxYeSElA=;
        b=GPLloAQUx8+ytqfQDi7UT8XXcUS3cn1EglwJeg1+Xwk78ruFbXYtfogNyWaCeMG+
        efQEP+K11Kqx8TlF/Do9WB/Gp/BUiJuQvaH/aFoSDK3Y95C8KnUVG1o+HHlB+erlEbL
        cyP1zRnTMFGaE5AzzxIe9H0kPUySmR9x+TCFwWK0=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1584512581801223.36220452103066; Wed, 18 Mar 2020 14:23:01 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Message-ID: <20200318062102.8145-3-jiaxun.yang@flygoat.com>
Subject: [PATCH v5 02/11] irqchip: loongson-liointc: Workaround LPC IRQ Errata
Date:   Wed, 18 Mar 2020 14:20:30 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200318062102.8145-1-jiaxun.yang@flygoat.com>
References: <20200318062102.8145-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The 1.0 version of that controller has a bug that status bit
of LPC IRQ sometimes doesn't get set correctly.

So we can always blame LPC IRQ when spurious interrupt happens
at the parent interrupt line which LPC IRQ supposed to route
to.

Co-developed-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/irqchip/irq-loongson-liointc.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-l=
oongson-liointc.c
index 8b6d7b8ddaca..d5054e90eab8 100644
--- a/drivers/irqchip/irq-loongson-liointc.c
+++ b/drivers/irqchip/irq-loongson-liointc.c
@@ -32,6 +32,8 @@
=20
 #define LIOINTC_SHIFT_INTx=094
=20
+#define LIOINTC_ERRATA_IRQ=0910
+
 struct liointc_handler_data {
 =09struct liointc_priv=09*priv;
 =09u32=09=09=09parent_int_map;
@@ -41,6 +43,7 @@ struct liointc_priv {
 =09struct irq_chip_generic=09=09*gc;
 =09struct liointc_handler_data=09handler[LIOINTC_NUM_PARENT];
 =09u8=09=09=09=09map_cache[LIOINTC_CHIP_IRQ];
+=09bool=09=09=09=09have_lpc_irq_errata;
 };
=20
 static void liointc_chained_handle_irq(struct irq_desc *desc)
@@ -54,8 +57,14 @@ static void liointc_chained_handle_irq(struct irq_desc *=
desc)
=20
 =09pending =3D readl(gc->reg_base + LIOINTC_REG_INTC_STATUS);
=20
-=09if (!pending)
-=09=09spurious_interrupt();
+=09if (!pending) {
+=09=09/* Always blame LPC IRQ if we have that bug and LPC IRQ is enabled *=
/
+=09=09if (handler->priv->have_lpc_irq_errata &&
+=09=09=09(handler->parent_int_map & ~gc->mask_cache & BIT(LIOINTC_ERRATA_I=
RQ)))
+=09=09=09pending =3D BIT(LIOINTC_ERRATA_IRQ);
+=09=09else
+=09=09=09spurious_interrupt();
+=09}
=20
 =09while (pending) {
 =09=09int bit =3D __ffs(pending);
@@ -164,6 +173,9 @@ int __init liointc_of_init(struct device_node *node,
 =09=09goto out_iounmap;
 =09}
=20
+=09if (of_device_is_compatible(node, "loongson,liointc-1.0"))
+=09=09priv->have_lpc_irq_errata =3D true;
+
 =09sz =3D of_property_read_variable_u32_array(node, "loongson,parent_int_m=
ap",
 =09=09=09=09=09=09&of_parent_int_map[0], LIOINTC_NUM_PARENT,
 =09=09=09=09=09=09LIOINTC_NUM_PARENT);
--=20
2.26.0.rc2


