Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C964191FF6
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 05:00:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbgCYEAI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Mar 2020 00:00:08 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17801 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725263AbgCYEAI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 25 Mar 2020 00:00:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585108748;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=NuRfXCZxBaCO32O9oMXV7Tlb2T/c2IgMGdJC0/GooPQ=;
        b=DkKv4VCGoL4pAFmexdTZsRrs6KNp4v4YGFMQwVXCqeZBYCof5AFzh8/oVI3Ndqc0
        pW4ppzmC2Bidrpjjk/jrcaWhc+hk9KkIOwPAEBl9PQGZM1y5JISSXFB7qCWylxbqcaE
        I+loniFh41CPURIxv6G8T/joi7m6ZTRSG3j/GnNE=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1585108746857884.0267978010179; Wed, 25 Mar 2020 11:59:06 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>, Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Allison Randal <allison@lohutok.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Message-ID: <20200325035537.156911-7-jiaxun.yang@flygoat.com>
Subject: [PATCH v8 06/11] irqchip: mips-cpu: Convert to simple domain
Date:   Wed, 25 Mar 2020 11:54:59 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200325035537.156911-1-jiaxun.yang@flygoat.com>
References: <20200325035537.156911-1-jiaxun.yang@flygoat.com>
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

Thus we convert the legacy domain to simple domain which can allocate
irq_desc during initialization.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Co-developed-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
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


