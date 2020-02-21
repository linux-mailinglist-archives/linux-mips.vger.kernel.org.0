Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD3DE166ECE
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2020 06:14:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbgBUFNd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Feb 2020 00:13:33 -0500
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17847 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725973AbgBUFNd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 21 Feb 2020 00:13:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1582261967;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=bdM/oVyHvlwhaJ5mV14mps3hkzcUh+yTBLugxOhi99k=;
        b=bErcOkfHUJnWWmCo2NBtyQLLXMx3HYhVN4/FOMnguKhn+yjub9eVpAdqm33Z7oyK
        3yBhjvYSu8+rb1/x4h3GT46adlqGdbe1Utiqa4t3Qx10VirAbZuuU9CwtijT+ATXNdD
        VHv/9oKg27NkTMxgcZ7OEQ3oEn4dnaHleLpUdIzg=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1582261966089104.86342790163371; Fri, 21 Feb 2020 13:12:46 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Message-ID: <20200221050942.507775-6-jiaxun.yang@flygoat.com>
Subject: [PATCH v4 05/10] irqchip: mips-cpu: Convert to simple domain
Date:   Fri, 21 Feb 2020 13:09:20 +0800
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200221050942.507775-1-jiaxun.yang@flygoat.com>
References: <20200221050942.507775-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The old code is using legacy domain to setup irq_domain for CPU interrupts
which requires irq_desc to be preallocated.

However, when MIPS_CPU_IRQ_BASE >=3D 16, irq_desc for CPU IRQs may end up
unallocated and lead to incorrect behavior.

Thus we convert the legacy domain to simple domain which can allocate irq_d=
esc
during initialization.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/irqchip/irq-mips-cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mips-cpu.c b/drivers/irqchip/irq-mips-cpu.=
c
index 95d4fd8f7a96..c3cf7fa76424 100644
--- a/drivers/irqchip/irq-mips-cpu.c
+++ b/drivers/irqchip/irq-mips-cpu.c
@@ -251,7 +251,7 @@ static void __init __mips_cpu_irq_init(struct device_no=
de *of_node)
 =09clear_c0_status(ST0_IM);
 =09clear_c0_cause(CAUSEF_IP);
=20
-=09irq_domain =3D irq_domain_add_legacy(of_node, 8, MIPS_CPU_IRQ_BASE, 0,
+=09irq_domain =3D irq_domain_add_simple(of_node, 8, MIPS_CPU_IRQ_BASE,
 =09=09=09=09=09   &mips_cpu_intc_irq_domain_ops,
 =09=09=09=09=09   NULL);
 =09if (!irq_domain)
--=20
2.25.0


