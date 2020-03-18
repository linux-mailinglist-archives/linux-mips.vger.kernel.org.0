Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30B9F1895B8
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2020 07:25:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727350AbgCRGZU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 18 Mar 2020 02:25:20 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17807 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726553AbgCRGZU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 18 Mar 2020 02:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1584512654;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=/2lzGckd44y7J3i8bIgDra9A9mus3vdjKhhw5nanvI0=;
        b=ciYYdVSYv6tAjfIljGfljjbd7GQsFMx8YX3U8buZr1Btt+T1Z1AIPRg4AtW2eg5P
        2SW8meUntsvbxMOB5sKqnZEA4t7+5DaSGYt3TIV6INf3MsN0m/lv09YA98ZKBo+2cQk
        ws0vT+a+xOCVLanGYPGdarmRwkQWBxStUHPIr4Jk=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1584512653356165.17200962856293; Wed, 18 Mar 2020 14:24:13 +0800 (CST)
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Message-ID: <20200318062102.8145-7-jiaxun.yang@flygoat.com>
Subject: [PATCH v5 06/11] irqchip: mips-cpu: Convert to simple domain
Date:   Wed, 18 Mar 2020 14:20:34 +0800
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

The old code is using legacy domain to setup irq_domain for CPU interrupts
which requires irq_desc to be preallocated.

However, when MIPS_CPU_IRQ_BASE >=3D 16, irq_desc for CPU IRQs may end up
unallocated and lead to incorrect behavior.

Thus we convert the legacy domain to simple domain which can allocate irq_d=
esc
during initialization.

Co-developed-by: Huacai Chen <chenhc@lemote.com>
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
2.26.0.rc2


