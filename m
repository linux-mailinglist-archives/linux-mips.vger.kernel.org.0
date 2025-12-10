Return-Path: <linux-mips+bounces-12432-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2168ECB262F
	for <lists+linux-mips@lfdr.de>; Wed, 10 Dec 2025 09:23:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C5F83005AB1
	for <lists+linux-mips@lfdr.de>; Wed, 10 Dec 2025 08:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966283002BB;
	Wed, 10 Dec 2025 08:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hhPaRhrg"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605F82FE593;
	Wed, 10 Dec 2025 08:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765355001; cv=none; b=ZWMqEKXFwWsPKvLRIX+ORIXKjL1Q+eBLuI7IgAku0RwbFUF4krvTE+7RQ2cvsFfpYTxJWKEHkQ53k5lmkT0bfhgKFL19/OwO0kqoAC1ybP2mI/R+RVBsvOgK5A2z/Tk1jGc6x/ois3KYeBJZlUWZGncr4oKsSemHhTmnP5isFiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765355001; c=relaxed/simple;
	bh=WI1RGflSqZT0wUnH19O2lHW2JJfkBMQcqBhs77Ks0qQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ixk/HXbyd60EWK4KUzIPr4dTnHe7XurHhPJlxFy/oon8CWw/ZpcFSd6J6P64Z4tKyOcsDjUwMVylC8aA5c70zyu3/RlOhgStnlSe3qaD4dEAF5coNF2V9AYdsAKcjbe1zLfJqDVAfK7yyNZvj+22sNinVfn25CISpQ4fvkTl8/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hhPaRhrg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D23AC16AAE;
	Wed, 10 Dec 2025 08:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765355001;
	bh=WI1RGflSqZT0wUnH19O2lHW2JJfkBMQcqBhs77Ks0qQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hhPaRhrgKZo8ZlK/gGxRKlD5k+N8knjlyrk66hBsHqcjSWjf7T2K0jl/ccjvFGiB+
	 7d12GVgBcI34QiNzw4mRF6c3oFsoQUp0oNyWOeDlMH5MtHp05P3YsIzKl7Vb0eTHvw
	 /iBwe0tqhleAMuROynKMtTTHpXJ/XBKKX8GYMKalpuy7nv4iwnqcXqIe13m3Op9osc
	 DgjHdF5SqPhihBhxWhVinSLnGKTYcQ2LzwX74as1sn71BmfB8ivVvjnDwSAaOt92O4
	 NRCIX6ZC2RN+lBlqybmlpanQLvql0OR0uByL6sl4z6+StRXgzgIMnvSw7ndkxKCNGZ
	 nLg8bBPaD2tOA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vTFTj-0000000BhIm-0k1y;
	Wed, 10 Dec 2025 08:23:19 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Joshua Kinard <kumba@gentoo.org>
Subject: [PATCH 2/6] genirq: Remove __request_percpu_irq() helper
Date: Wed, 10 Dec 2025 08:22:38 +0000
Message-ID: <20251210082242.360936-3-maz@kernel.org>
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

With the IRQ timing stuff being gone, there is no need to specify
a flag when requesting a percpu interrupt. Not only IRQF_TIMER was
the only flag (set of flags actually) allowed, but nobody ever
passed it.

Get rid of __request_percpu_irq(), which was only getting 0 as flags,
and promote request_percpu_irq_affinity() as its replacement.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/interrupt.h | 18 ++++--------------
 kernel/irq/manage.c       | 16 ++++++----------
 2 files changed, 10 insertions(+), 24 deletions(-)

diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index 44e335b17ed64..00c01b0a43be1 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -181,9 +181,8 @@ request_any_context_irq(unsigned int irq, irq_handler_t handler,
 			unsigned long flags, const char *name, void *dev_id);
 
 extern int __must_check
-__request_percpu_irq(unsigned int irq, irq_handler_t handler,
-		     unsigned long flags, const char *devname,
-		     const cpumask_t *affinity, void __percpu *percpu_dev_id);
+request_percpu_irq_affinity(unsigned int irq, irq_handler_t handler, const char *devname,
+			    const cpumask_t *affinity, void __percpu *percpu_dev_id);
 
 extern int __must_check
 request_nmi(unsigned int irq, irq_handler_t handler, unsigned long flags,
@@ -193,17 +192,8 @@ static inline int __must_check
 request_percpu_irq(unsigned int irq, irq_handler_t handler,
 		   const char *devname, void __percpu *percpu_dev_id)
 {
-	return __request_percpu_irq(irq, handler, 0,
-				    devname, NULL, percpu_dev_id);
-}
-
-static inline int __must_check
-request_percpu_irq_affinity(unsigned int irq, irq_handler_t handler,
-			    const char *devname, const cpumask_t *affinity,
-			    void __percpu *percpu_dev_id)
-{
-	return __request_percpu_irq(irq, handler, 0,
-				    devname, affinity, percpu_dev_id);
+	return request_percpu_irq_affinity(irq, handler, devname,
+					   NULL, percpu_dev_id);
 }
 
 extern int __must_check
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 7b25ffc5c43a4..1c858be09ba13 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -2510,10 +2510,9 @@ struct irqaction *create_percpu_irqaction(irq_handler_t handler, unsigned long f
 }
 
 /**
- * __request_percpu_irq - allocate a percpu interrupt line
+ * request_percpu_irq_affinity - allocate a percpu interrupt line
  * @irq:	Interrupt line to allocate
  * @handler:	Function to be called when the IRQ occurs.
- * @flags:	Interrupt type flags (IRQF_TIMER only)
  * @devname:	An ascii name for the claiming device
  * @affinity:	A cpumask describing the target CPUs for this interrupt
  * @dev_id:	A percpu cookie passed back to the handler function
@@ -2526,9 +2525,9 @@ struct irqaction *create_percpu_irqaction(irq_handler_t handler, unsigned long f
  * the handler gets called with the interrupted CPU's instance of
  * that variable.
  */
-int __request_percpu_irq(unsigned int irq, irq_handler_t handler,
-			 unsigned long flags, const char *devname,
-			 const cpumask_t *affinity, void __percpu *dev_id)
+int request_percpu_irq_affinity(unsigned int irq, irq_handler_t handler,
+				const char *devname, const cpumask_t *affinity,
+				void __percpu *dev_id)
 {
 	struct irqaction *action;
 	struct irq_desc *desc;
@@ -2542,10 +2541,7 @@ int __request_percpu_irq(unsigned int irq, irq_handler_t handler,
 	    !irq_settings_is_per_cpu_devid(desc))
 		return -EINVAL;
 
-	if (flags && flags != IRQF_TIMER)
-		return -EINVAL;
-
-	action = create_percpu_irqaction(handler, flags, devname, affinity, dev_id);
+	action = create_percpu_irqaction(handler, 0, devname, affinity, dev_id);
 	if (!action)
 		return -ENOMEM;
 
@@ -2564,7 +2560,7 @@ int __request_percpu_irq(unsigned int irq, irq_handler_t handler,
 
 	return retval;
 }
-EXPORT_SYMBOL_GPL(__request_percpu_irq);
+EXPORT_SYMBOL(request_percpu_irq_affinity);
 
 /**
  * request_percpu_nmi - allocate a percpu interrupt line for NMI delivery
-- 
2.47.3


