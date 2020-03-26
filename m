Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E78E4193874
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2020 07:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgCZGS1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 26 Mar 2020 02:18:27 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17961 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726289AbgCZGS1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 26 Mar 2020 02:18:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585203481;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=8E4gVpfhiK++Bwro6N6pp2ENftv0RbqrzEl1vLKJziU=;
        b=RvEDKpzkzpGqzozn8ByWspl5c1uNRD8uRTBue49wmtozIut/sY0+t/R/FQCTM2qH
        w2bdRXIBVaHWYpyb1Jq88AfOEqUSgwvToHHky6lMXZOqLCWLWZuqpnN1k88fHfeVq77
        zc6C0ey6OGY9UD3dvjcnlRHNIo3rEBr/SttAEnx4=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1585203479728618.7433359735304; Thu, 26 Mar 2020 14:17:59 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, maz@kernel.org, chenhc@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <20200326061704.387483-6-jiaxun.yang@flygoat.com>
Subject: [RFC PATCH 3/6] irqchip: mips-cpu: Convert to simple domain
Date:   Thu, 26 Mar 2020 14:17:01 +0800
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

This would be the first step of remove MIPS_CPU_IRQ_BASE
tree wide.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/irqchip/irq-mips-cpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-mips-cpu.c b/drivers/irqchip/irq-mips-cpu.=
c
index e029e0fe2ee2..ab57003ace5b 100644
--- a/drivers/irqchip/irq-mips-cpu.c
+++ b/drivers/irqchip/irq-mips-cpu.c
@@ -253,9 +253,9 @@ static void __init __mips_cpu_irq_init(struct device_no=
de *of_node)
 =09clear_c0_status(ST0_IM);
 =09clear_c0_cause(CAUSEF_IP);
=20
-=09mips_cpu_irq_domain =3D irq_domain_add_legacy(of_node, 8, MIPS_CPU_IRQ_=
BASE, 0,
-=09=09=09=09=09   &mips_cpu_intc_irq_domain_ops,
-=09=09=09=09=09   NULL);
+=09mips_cpu_irq_domain =3D irq_domain_add_simple(of_node, 8, 0,
+=09=09=09=09&mips_cpu_intc_irq_domain_ops, NULL);
+
 =09if (!mips_cpu_irq_domain)
 =09=09panic("Failed to add irqdomain for MIPS CPU");
=20
--=20
2.26.0.rc2


