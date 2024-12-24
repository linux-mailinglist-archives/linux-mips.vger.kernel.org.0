Return-Path: <linux-mips+bounces-7181-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8089FB7FE
	for <lists+linux-mips@lfdr.de>; Tue, 24 Dec 2024 01:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36D0F1884B44
	for <lists+linux-mips@lfdr.de>; Tue, 24 Dec 2024 00:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02CA717E4;
	Tue, 24 Dec 2024 00:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="SeoanKNl"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D03615D1;
	Tue, 24 Dec 2024 00:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734999466; cv=none; b=uPmpA9XcuQAPxZVxiSDnO5PbjmiwAyQa3u6K8IwryIDzrBvUsckVJrNgS+uR+vTd/Ng9sACG9tkV0maXtxBEM9+c+qA6QfJpXFHLHaqrwjEDc+SoxyW4jNb0W7rL+zwLumWFP0/p/+Rpmf2RY6u16mvUp/m5Qxngg1WIalnkf0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734999466; c=relaxed/simple;
	bh=EzGiklqihK3WpPwiT+RE7XNoXEKO40pJsVrbdAguk5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=adpOswA0JlMzkpIegb9WzXSbIrNmtURbc6HaByWKVVo+TT3ONpOR6E/pZyU9+1G7RjzCZYkdNxcxVmx6II4fJVOsJd19mb+oka80a+WtzTdliqqZ0bxudHnAO6rs6Yblk/liFt3lYnFATbLAybms5rrqQYq8RJm168QEhmpR3xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=SeoanKNl; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=SkuAahAf8W+lppm/Zglud67b2SqLzah4TgosvvOEGfc=; b=SeoanKNlTVXq29FJ
	Se633hZabWsrg+MaHfYYZ9NpwVqWvZ4Sud1lcMt7DH306m6HIBcRk2OIgGjCiEYLg7AsiPsHK6jKU
	CK90YgXlpIxMsWK5sbzcXTrG5Q4bdi1NnGjcX1WSgpBijK2Z8GMpFHCBbuFiKORDvGtY8kSur8kh6
	UV2bBhdQhsK/OfAUqVsA7UgvnhhMCJdwf5SR7KIZszhm9CqS6jb9pOY3+UaTY86Vx3W5izzSiaast
	KlRlSWTyQAtHiKFqg6ud0DmNtGDHADveHGWlb1cOWzTRxHSbzKldfPToRmCqnxJr2Ey9ekcSkZXns
	8d/+hakImSfq3X/5Kw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tPsc3-006vtl-2U;
	Tue, 24 Dec 2024 00:17:27 +0000
From: linux@treblig.org
To: florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	tglx@linutronix.de
Cc: linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] irqchip/irq-brcmstb-l2: Replace brcmstb_l2_mask_and_ack by generic
Date: Tue, 24 Dec 2024 00:17:27 +0000
Message-ID: <20241224001727.149337-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
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

brcmstb_l2_mask_and_ack() was added by
commit 49aa6ef0b439 ("irqchip/brcmstb-l2: Remove some processing from the
handler") in September 2017 with a comment saying it was actually
generic and someone should add it to the generic code.

commit 20608924cc2e ("genirq: generic chip: Add
irq_gc_mask_disable_and_ack_set()") did that a few weeks later,
however no one went back and took the original out.

Build tested only.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/irqchip/irq-brcmstb-l2.c | 28 +---------------------------
 1 file changed, 1 insertion(+), 27 deletions(-)

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
-- 
2.47.1


