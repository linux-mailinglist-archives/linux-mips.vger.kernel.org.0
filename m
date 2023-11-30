Return-Path: <linux-mips+bounces-401-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF8C7FE827
	for <lists+linux-mips@lfdr.de>; Thu, 30 Nov 2023 05:07:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08D3AB20B96
	for <lists+linux-mips@lfdr.de>; Thu, 30 Nov 2023 04:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D35981548F;
	Thu, 30 Nov 2023 04:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KPak5qle"
X-Original-To: linux-mips@vger.kernel.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 18C9A98;
	Wed, 29 Nov 2023 20:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=Osv7Sj7KBzk0d0IQpU
	d2ITh5un8u4/k8C4CnlTjBGhQ=; b=KPak5qleSNGV4u4TydU3I2oZNb5+zRY66+
	ffkJ6EGmhd6cOHxe6O2OkFqI8Cx2NrmkrhPjr3K68imZcUiEe9jVDwMmBjHNbJQ2
	yVy0AuSot26bt5VDxQho400l0x9pgQ8NoBiQWPpQEtUccJ/id+ZinRRvXANh9/ta
	1/mOLvkKs=
Received: from localhost.localdomain (unknown [39.144.190.126])
	by zwqz-smtp-mta-g0-3 (Coremail) with SMTP id _____wD3vh1UCmhl87xBEQ--.48084S2;
	Thu, 30 Nov 2023 12:06:45 +0800 (CST)
From: Haoran Liu <liuhaoran14@163.com>
To: tsbogend@alpha.franken.de
Cc: fancer.lancer@gmail.com,
	tglx@linutronix.de,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoran Liu <liuhaoran14@163.com>
Subject: [PATCH] [irqchip] mips-cpu: Add error handling in mips_cpu_register_ipi_domain
Date: Wed, 29 Nov 2023 20:06:42 -0800
Message-Id: <20231130040642.36133-1-liuhaoran14@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wD3vh1UCmhl87xBEQ--.48084S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr45uF13KrW5KF13ZF1fJFb_yoWkJFgE9a
	4FyF93GF18Kr1DtF4xCrsIqr9aqrykWrnYgr92q3WYyrWavw1kG34avr4Sqr1xWFWIyF1x
	Ja15Cw1SyF17ZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_GQ6DUUUUU==
X-CM-SenderInfo: xolxxtxrud0iqu6rljoofrz/1tbiwhw4glc662x+5gABsX
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

This patch enhances the mips_cpu_register_ipi_domain function in
drivers/irqchip/irq-mips-cpu.c by adding error handling for the kzalloc
call. Previously, the function lacked proper handling for kzalloc
failures, which could lead to potential null pointer dereference issues
under low memory conditions.

Signed-off-by: Haoran Liu <liuhaoran14@163.com>
---
 drivers/irqchip/irq-mips-cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-mips-cpu.c b/drivers/irqchip/irq-mips-cpu.c
index 0c7ae71a0af0..a8030c2b135c 100644
--- a/drivers/irqchip/irq-mips-cpu.c
+++ b/drivers/irqchip/irq-mips-cpu.c
@@ -238,6 +238,9 @@ static void mips_cpu_register_ipi_domain(struct device_node *of_node)
 	struct cpu_ipi_domain_state *ipi_domain_state;
 
 	ipi_domain_state = kzalloc(sizeof(*ipi_domain_state), GFP_KERNEL);
+	if (!ipi_domain_state)
+		panic("Failed to allocate MIPS CPU IPI domain state");
+
 	ipi_domain = irq_domain_add_hierarchy(irq_domain,
 					      IRQ_DOMAIN_FLAG_IPI_SINGLE,
 					      2, of_node,
-- 
2.17.1


