Return-Path: <linux-mips+bounces-12437-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 918CECB263B
	for <lists+linux-mips@lfdr.de>; Wed, 10 Dec 2025 09:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B068A3023F9E
	for <lists+linux-mips@lfdr.de>; Wed, 10 Dec 2025 08:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C0D302163;
	Wed, 10 Dec 2025 08:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sk5zn7bA"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1918D302151;
	Wed, 10 Dec 2025 08:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765355002; cv=none; b=Xadbgv/UQOMEXAZrdMjmvzYk03BOnrFZ0D2dsuXEejLL+DonB47EupIhmbL4QaZFe7JB8SOEtShCGdJGuojL/500NJ71NTjsUucBIypf2NhFgTJwWm6r61jSzfs9OZ+nA3asyqXsw04Lp4bKIeXVZqwCgUbUvbs+IwmfOMu1RJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765355002; c=relaxed/simple;
	bh=iAmeVHiDhC4MURU1AGaYBYxlzvmQQjxIZXYpi+ts3IM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yg5LmmvPaunHDHdAYHGcE4nqaBtD6Th8ee/Pp+/8U0tnJuJVjLL1qsqxoUKZLiHrvvtbk3C+g6hRYA7DM8HlepiqlIgw7h9+dxRcHBKRSBNppQoAkympx+wscKVPZyY6INR0Q7QHa97o6DWM91jfRpXIrUSSqc4t5crQowWVt6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sk5zn7bA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9C3C116B1;
	Wed, 10 Dec 2025 08:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765355002;
	bh=iAmeVHiDhC4MURU1AGaYBYxlzvmQQjxIZXYpi+ts3IM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sk5zn7bA1794GfG2o7UwFvX9iBHBmQKlIktBYhzcUoBApLv7aMZmWVLb1NPRoYleM
	 xzPKA7+EV/vHghZmD4N4iC+jxLZ6Y247JBip6T1n/hpUDfKEEJj1dThx0vpWq20Qwd
	 WwFcdeYcA/YF4yY3E3vxd+SMy0Su+nyOzuVjekDUqzWH4EAhksGi70bml+ECj4snZP
	 D0O45quyFDCeQ4r1BSto4YTxKe0rUEyoyI1XwVOd1D+1M9e+ULyu+JbPEa4+tUXtDr
	 CyFJjU5/O2Qr6yY0U9gpeGl+qiRfpGnLvN7LvuqxAAM2KzumEDLdKYA73meAepi8wH
	 ZaDu7G581zdBw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vTFTj-0000000BhIm-3s7F;
	Wed, 10 Dec 2025 08:23:19 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Joshua Kinard <kumba@gentoo.org>
Subject: [PATCH 6/6] genirq: Kill setup_percpu_irq()
Date: Wed, 10 Dec 2025 08:22:42 +0000
Message-ID: <20251210082242.360936-7-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251210082242.360936-1-maz@kernel.org>
References: <20251210082242.360936-1-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de, tsbogend@alpha.franken.de, kumba@gentoo.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

setup_percpu_irq() was always a bad kludge, and should have never
been there the first place. Now that the last users are gone,
remove it for good.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/irq.h |  3 ---
 kernel/irq/manage.c | 30 ------------------------------
 2 files changed, 33 deletions(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 4a9f1d7b08c39..67ea759749beb 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -595,9 +595,6 @@ enum {
 
 #define IRQ_DEFAULT_INIT_FLAGS	ARCH_IRQ_INIT_FLAGS
 
-struct irqaction;
-extern int setup_percpu_irq(unsigned int irq, struct irqaction *new);
-
 #ifdef CONFIG_DEPRECATED_IRQ_CPU_ONOFFLINE
 extern void irq_cpu_online(void);
 extern void irq_cpu_offline(void);
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 1c858be09ba13..089a16ba8de1c 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -2448,36 +2448,6 @@ void free_percpu_nmi(unsigned int irq, void __percpu *dev_id)
 	kfree(__free_percpu_irq(irq, dev_id));
 }
 
-/**
- * setup_percpu_irq - setup a per-cpu interrupt
- * @irq:	Interrupt line to setup
- * @act:	irqaction for the interrupt
- *
- * Used to statically setup per-cpu interrupts in the early boot process.
- */
-int setup_percpu_irq(unsigned int irq, struct irqaction *act)
-{
-	struct irq_desc *desc = irq_to_desc(irq);
-	int retval;
-
-	if (!desc || !irq_settings_is_per_cpu_devid(desc))
-		return -EINVAL;
-
-	retval = irq_chip_pm_get(&desc->irq_data);
-	if (retval < 0)
-		return retval;
-
-	if (!act->affinity)
-		act->affinity = cpu_online_mask;
-
-	retval = __setup_irq(irq, desc, act);
-
-	if (retval)
-		irq_chip_pm_put(&desc->irq_data);
-
-	return retval;
-}
-
 static
 struct irqaction *create_percpu_irqaction(irq_handler_t handler, unsigned long flags,
 					  const char *devname, const cpumask_t *affinity,
-- 
2.47.3


