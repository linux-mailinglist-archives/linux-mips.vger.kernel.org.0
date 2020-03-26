Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0B7B193873
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2020 07:18:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbgCZGSV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 26 Mar 2020 02:18:21 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17960 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726289AbgCZGSU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 26 Mar 2020 02:18:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585203480;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=1f4twxQbdxcAmtznhXGkZuoqQWsBVfLfxh+Eg0Vg9Ag=;
        b=BdCKGkq/UUI8s54kjblPqL67rdAojjmyrucXqaNSLXkRjvBsmIKyGajDRCczLD6s
        VNMTtRKR5qANcn1qH6nth4U0jF3LiawIpEpZvgJmDCtG/pwrXKBjh6IoX+/S8nFZV+V
        Hpj8pb2j4s6DHo4DltoLk7cGEwwrEM3A/LH7kZZc=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1585203478647188.92951404347127; Thu, 26 Mar 2020 14:17:58 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, maz@kernel.org, chenhc@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <20200326061704.387483-4-jiaxun.yang@flygoat.com>
Subject: [RFC PATCH 2/6] irqchip: mips-cpu: Allocate fwnode for non-DT platforms
Date:   Thu, 26 Mar 2020 14:16:59 +0800
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

fwnode is required by fwspec based domain opreations to match domains.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/irqchip/irq-mips-cpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/irqchip/irq-mips-cpu.c b/drivers/irqchip/irq-mips-cpu.=
c
index 19734b11b36d..e029e0fe2ee2 100644
--- a/drivers/irqchip/irq-mips-cpu.c
+++ b/drivers/irqchip/irq-mips-cpu.c
@@ -247,6 +247,8 @@ static inline void mips_cpu_register_ipi_domain(struct =
device_node *of_node) {}
=20
 static void __init __mips_cpu_irq_init(struct device_node *of_node)
 {
+=09struct fwnode_handle *fwnode;
+
 =09/* Mask interrupts. */
 =09clear_c0_status(ST0_IM);
 =09clear_c0_cause(CAUSEF_IP);
@@ -257,6 +259,14 @@ static void __init __mips_cpu_irq_init(struct device_n=
ode *of_node)
 =09if (!mips_cpu_irq_domain)
 =09=09panic("Failed to add irqdomain for MIPS CPU");
=20
+=09if (!of_node) {
+=09=09fwnode =3D irq_domain_alloc_named_fwnode("MIPS-CPU-IRQ");
+=09=09if (!fwnode)
+=09=09=09panic("Failed to allocate fwnode for MIPS CPU IRQ");
+=09=09mips_cpu_irq_domain->fwnode =3D fwnode;
+=09=09mips_cpu_irq_domain->name =3D kstrdup("MIPS-CPU-IRQ", GFP_KERNEL);
+=09}
+
 =09/*
 =09 * Only proceed to register the software interrupt IPI implementation
 =09 * for CPUs which implement the MIPS MT (multi-threading) ASE.
--=20
2.26.0.rc2


