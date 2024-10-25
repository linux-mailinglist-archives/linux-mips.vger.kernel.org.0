Return-Path: <linux-mips+bounces-6439-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5349B08CD
	for <lists+linux-mips@lfdr.de>; Fri, 25 Oct 2024 17:47:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEF801C2110C
	for <lists+linux-mips@lfdr.de>; Fri, 25 Oct 2024 15:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C6E13BC0E;
	Fri, 25 Oct 2024 15:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JP9hfGDo"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E1770834;
	Fri, 25 Oct 2024 15:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729871223; cv=none; b=LCJr266+gip52InGwyMFMu+tQ/Toqclb1qH56BRwNQ3Rx59NEB8ho5Ht6TRMnCDWzPv7NvoaWE/huL/adWCthELe46cNKdHe0Ck/Eq3g2VB2GE57fZziAhBvql92OfbYan8ytHlZIdDfKK/kpIvisc8q9g+JMuiZhrGmtdByuhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729871223; c=relaxed/simple;
	bh=lIU6xrcSDECx3uc+Iuswnvk/yePOcWENsq/F5Ws7mP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PS2RN6uINM6ZgZvp+3juRWsWZFiDPjpTyH2/EaBd0sGwJ8gNeFMyEo0Xj5Y0WGEFupOCJ41niX1ryTgIa06mzo2xNjGmYxOMVIoD+5IGz8g2ws2y083eoSjjzaBVbjqDc4opdfzuOhtpInGVhbpMp+4+RQ0pz6IAL3tl5cOBGvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JP9hfGDo; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39261C0006;
	Fri, 25 Oct 2024 15:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729871218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rH7XQKF++z7Orzd474p8C2SYbquGRZ9xQQfA+mvnLJw=;
	b=JP9hfGDofMX9XPuQPI5YHEq62WlU0PvU8TBY38s6tb5G8iSJsbSDtzCkmihKnaUuOwlfXP
	PmS5DOafhRKVRCGAcGze7Owo4TGl1GLVAva+gXueiz6SvbcpHtLNwRKzvygKz0MZguEbK3
	DzYwJFu+6wTwTncIjb5RPo1bjqepdzJNtp7ZK4BuysE+4/HJDsKLpUGEl9jUCQmcmbllgI
	hDrMQFVsBkie12t75Z0z1RipmKvhbQ+bfw/NClwSL4ewsycZz7dAZoDc+FJRan4BnLBu1x
	HxLGDsYOzIH1yDSMP5knRQ1yYg3NTcB/6uvHKxqQYpH7iwV6Op2gTMg+TS+qDg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 25 Oct 2024 17:46:49 +0200
Subject: [PATCH] irqchip: mips-gic: Handle case with cluster without CPU
 cores
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-no-cpu-cluster-support-v1-1-5e81fcf9f25c@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAGi9G2cC/x3MQQqEMAxA0atI1gZsqSheRVxom5kJSFsSK4J4d
 8ss3+L/G5SESWFqbhA6WTnFCtM24H9r/BJyqAbbWWc622NM6HNBvxc9SFBLzkkONIPraVy3MAQ
 DNc5CH77+43l5nhfZp5noaAAAAA==
To: Aleksandar Rikalo <arikalo@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-Sasl: gregory.clement@bootlin.com

It is possible to have no CPU cores in a cluster; in such cases, it is
not possible to access the GIC, and any indirect access leads to an
exception. This patch dynamically skips the indirect access in such
situations.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
This patch is a follow-up of the series "MIPS: Support I6500
multi-cluster configuration"
https://lore.kernel.org/lkml/20241019071037.145314-1-arikalo@gmail.com/#t
---
 drivers/irqchip/irq-mips-gic.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index f42f69bbd6fb1..bca8053864b2c 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -141,7 +141,8 @@ static bool gic_irq_lock_cluster(struct irq_data *d)
 	cl = cpu_cluster(&cpu_data[cpu]);
 	if (cl == cpu_cluster(&current_cpu_data))
 		return false;
-
+	if (mips_cps_numcores(cl) == 0)
+		return false;
 	mips_cm_lock_other(cl, 0, 0, CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
 	return true;
 }
@@ -507,6 +508,9 @@ static void gic_mask_local_irq_all_vpes(struct irq_data *d)
 	struct gic_all_vpes_chip_data *cd;
 	int intr, cpu;
 
+	if (!mips_cps_multicluster_cpus())
+		return;
+
 	intr = GIC_HWIRQ_TO_LOCAL(d->hwirq);
 	cd = irq_data_get_irq_chip_data(d);
 	cd->mask = false;
@@ -520,6 +524,9 @@ static void gic_unmask_local_irq_all_vpes(struct irq_data *d)
 	struct gic_all_vpes_chip_data *cd;
 	int intr, cpu;
 
+	if (!mips_cps_multicluster_cpus())
+		return;
+
 	intr = GIC_HWIRQ_TO_LOCAL(d->hwirq);
 	cd = irq_data_get_irq_chip_data(d);
 	cd->mask = true;
@@ -687,8 +694,10 @@ static int gic_irq_domain_map(struct irq_domain *d, unsigned int virq,
 	if (!gic_local_irq_is_routable(intr))
 		return -EPERM;
 
-	for_each_online_cpu_gic(cpu, &gic_lock)
-		write_gic_vo_map(mips_gic_vx_map_reg(intr), map);
+	if (mips_cps_multicluster_cpus()) {
+		for_each_online_cpu_gic(cpu, &gic_lock)
+			write_gic_vo_map(mips_gic_vx_map_reg(intr), map);
+	}
 
 	return 0;
 }
@@ -982,7 +991,7 @@ static int __init gic_of_init(struct device_node *node,
 				change_gic_trig(i, GIC_TRIG_LEVEL);
 				write_gic_rmask(i);
 			}
-		} else {
+		} else if (mips_cps_numcores(cl) != 0) {
 			mips_cm_lock_other(cl, 0, 0, CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
 			for (i = 0; i < gic_shared_intrs; i++) {
 				change_gic_redir_pol(i, GIC_POL_ACTIVE_HIGH);
@@ -990,6 +999,9 @@ static int __init gic_of_init(struct device_node *node,
 				write_gic_redir_rmask(i);
 			}
 			mips_cm_unlock_other();
+
+		} else {
+			pr_warn("No CPU cores on the cluster %d skip it\n", cl);
 		}
 	}
 

---
base-commit: 10e44701486e25d630d714ace2b0c6d9a178b331
change-id: 20241025-no-cpu-cluster-support-1745e8abd7d1

Best regards,
-- 
Gregory CLEMENT <gregory.clement@bootlin.com>


