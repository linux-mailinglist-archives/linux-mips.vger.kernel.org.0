Return-Path: <linux-mips+bounces-7471-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC8FA13063
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 01:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E42FF3A58B6
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 00:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D2AC13B;
	Thu, 16 Jan 2025 00:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="RJsCC+H5"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D901225D6;
	Thu, 16 Jan 2025 00:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736989170; cv=none; b=Hich0HBBPVffGmaXcio5rRJFNYpKHsgcWLqr1QZ87QTsn5g6m0bUxDl9EVVGveRj+F7TkmnCyeXuUOwTCSBoXDzcvGIUJ0aE//EnOnp1ahsLTyuiqsyMBKPxhPcm1yoQ+3qRP/Qg2ceMCLKQcyEaE6omtnKDBmiX2wFHgKkIY60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736989170; c=relaxed/simple;
	bh=l2HgDA7kBX50g9pVYPNylwgOrBf5kFs5bC6jRmtcVAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qCMvyRR9K2bL44KSx62wgBHg2IkSfWtOXDe9wXFUxeV2I/8VK9SWbyqz37l7MqocjzSeDwjMJGtWPVcvJn05Qr8LXQ+JBIrShYnxibMe2C4cVMUO4Bkjsbd6PCwsRwsIvUHt4IY+/RN8dBIK3MmMTW+/yO66V1t9REfVDz2Vyi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=RJsCC+H5; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=NEACNtD9AMp/3i2ugMhnbog8OjzcHTOvl7Vh5dzlVDI=; b=RJsCC+H5frD2Hp4K
	TA87oddvahGe8umxGnJwA6ynYtUBNhlH2N95io5HfSDqv27GcwOvQFeUoDAopPUCV3QEbn8mpdru6
	Es7RzQ2mPYA2KEzO4XjhtwQOjBul1D4KfgEHGKher0vcGM/f3mM5zqoCR9DhOhXxZ5C1iEgkyjkk8
	z45q7CQ6E3VHCWpC57ilJAlqupB8dxYVkyY/zNu9lqF5qN+BqLyvFAjdiQT6gKpjktMSssb5IDX1L
	hRnYSdIwWqDYyvubBYpe/8XXFdFjMxeM+CygU/hsvDevZEa3phSmGXscYFTONTZG4ktHWIjnbmuLo
	2wqvaP6St3GXbUTi4w==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tYEEC-00AW4x-31;
	Thu, 16 Jan 2025 00:59:20 +0000
From: linux@treblig.org
To: florian.fainelli@broadcom.com,
	tglx@linutronix.de
Cc: bcm-kernel-feedback-list@broadcom.com,
	x86@kernel.org,
	oe-kbuild-all@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v2] irqchip/irq-brcmstb-l2: Replace brcmstb_l2_mask_and_ack() by generic function
Date: Thu, 16 Jan 2025 00:59:20 +0000
Message-ID: <20250116005920.626822-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Replace brcmstb_l2_mask_and_ack() by the generic
irq_gc_mask_disable_and_ack_set().

brcmstb_l2_mask_and_ack() was added in commit 49aa6ef0b439
("irqchip/brcmstb-l2: Remove some processing from the handler") in
September 2017 with a comment saying it was actually generic and someone
should add it to the generic code.

commit 20608924cc2e ("genirq: generic chip: Add
irq_gc_mask_disable_and_ack_set()") did that a few weeks later, however no
one went back and took the brcmstb variant out.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Link: https://lore.kernel.org/all/20241224001727.149337-1-linux@treblig.org
---
v2
  Add EXPORT_SYMBOL_GPL as spotted by kernel test robot and
  fix suggested by Florian

 drivers/irqchip/irq-brcmstb-l2.c | 28 +---------------------------
 kernel/irq/generic-chip.c        |  1 +
 2 files changed, 2 insertions(+), 27 deletions(-)

diff --git a/drivers/irqchip/irq-brcmstb-l2.c b/drivers/irqchip/irq-brcmstb-l2.c
index c988886917f7..db4c9721fcf2 100644
--- a/drivers/irqchip/irq-brcmstb-l2.c
+++ b/drivers/irqchip/irq-brcmstb-l2.c
@@ -61,32 +61,6 @@ struct brcmstb_l2_intc_data {
 	u32 saved_mask; /* for suspend/resume */
 };
 
-/**
- * brcmstb_l2_mask_and_ack - Mask and ack pending interrupt
- * @d: irq_data
- *
- * Chip has separate enable/disable registers instead of a single mask
- * register and pending interrupt is acknowledged by setting a bit.
- *
- * Note: This function is generic and could easily be added to the
- * generic irqchip implementation if there ever becomes a will to do so.
- * Perhaps with a name like irq_gc_mask_disable_and_ack_set().
- *
- * e.g.: https://patchwork.kernel.org/patch/9831047/
- */
-static void brcmstb_l2_mask_and_ack(struct irq_data *d)
-{
-	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
-	struct irq_chip_type *ct = irq_data_get_chip_type(d);
-	u32 mask = d->mask;
-
-	irq_gc_lock(gc);
-	irq_reg_writel(gc, mask, ct->regs.disable);
-	*ct->mask_cache &= ~mask;
-	irq_reg_writel(gc, mask, ct->regs.ack);
-	irq_gc_unlock(gc);
-}
-
 static void brcmstb_l2_intc_irq_handle(struct irq_desc *desc)
 {
 	struct brcmstb_l2_intc_data *b = irq_desc_get_handler_data(desc);
@@ -248,7 +222,7 @@ static int __init brcmstb_l2_intc_of_init(struct device_node *np,
 	if (init_params->cpu_clear >= 0) {
 		ct->regs.ack = init_params->cpu_clear;
 		ct->chip.irq_ack = irq_gc_ack_set_bit;
-		ct->chip.irq_mask_ack = brcmstb_l2_mask_and_ack;
+		ct->chip.irq_mask_ack = irq_gc_mask_disable_and_ack_set;
 	} else {
 		/* No Ack - but still slightly more efficient to define this */
 		ct->chip.irq_mask_ack = irq_gc_mask_disable_reg;
diff --git a/kernel/irq/generic-chip.c b/kernel/irq/generic-chip.c
index 32ffcbb87fa1..c4a8bca5f2b0 100644
--- a/kernel/irq/generic-chip.c
+++ b/kernel/irq/generic-chip.c
@@ -162,6 +162,7 @@ void irq_gc_mask_disable_and_ack_set(struct irq_data *d)
 	irq_reg_writel(gc, mask, ct->regs.ack);
 	irq_gc_unlock(gc);
 }
+EXPORT_SYMBOL_GPL(irq_gc_mask_disable_and_ack_set);
 
 /**
  * irq_gc_eoi - EOI interrupt
-- 
2.48.0


