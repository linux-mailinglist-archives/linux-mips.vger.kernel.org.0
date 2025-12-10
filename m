Return-Path: <linux-mips+bounces-12435-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 544F6CB2647
	for <lists+linux-mips@lfdr.de>; Wed, 10 Dec 2025 09:23:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10E23309161C
	for <lists+linux-mips@lfdr.de>; Wed, 10 Dec 2025 08:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE8330170E;
	Wed, 10 Dec 2025 08:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gKDNQAen"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A003016E0;
	Wed, 10 Dec 2025 08:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765355001; cv=none; b=RGjhxf8HCr2HHtrA/Rm86E9G801mtYxFP3y5LxVwcSsX+ZjeJIW9j+ciFdMOPTUXUm7B1St10hUBFg8i7mKU7/UHhq0wsuNwOH3tP0PI2KdbQo5aYnlQNjlGGnoKPdifCZUoRTXpLn2DV2U6u8VUHb+eiFgcjUOi99F3ECxQoAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765355001; c=relaxed/simple;
	bh=p34uPiDat/+Do+y+VDu1EDx7vU3qivFgecNeyfl4jkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SMNXNZ2RXruBtmIC8FwM9V7KBDyjAG8/vMfAEi3PlwgAnxtzsmZjItOR6BwbyrQp4fVnxKDNX1DbXwsx65jkKjVrfe0uAba5RZbxWDng9yBwkVIn8vBc/BOG5ETbc24K0jfarTfn27ZY6uwKIEUehm4t/HOQTpJ0tTrLH9miJRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gKDNQAen; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FAD8C116B1;
	Wed, 10 Dec 2025 08:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765355001;
	bh=p34uPiDat/+Do+y+VDu1EDx7vU3qivFgecNeyfl4jkU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gKDNQAenr52zwhLUeEpo4qGeYablyqR+kuSD1SnJrkL2eJhPkeCvHK4at6th2oUn0
	 KL34j3CrbdXYrRYFfBX+BNi8l01lBlzKYZKZDCvWvtoDCY75dGhOils1NwOFMAv4aB
	 t1g4w0uDj2WjSnsaEtGWoroD4VHe5A4+1u7GMPpxXqbLqWF6T3lLHzO1DKvrC8SgxR
	 uWiBOpbSxORKzHbWUPBWaCcS5zJ8nE0QN+MfCCdloeaUBOZ2vbQqGmp2Wok8h47e3a
	 chHYEZXpfPMCD7Mab3lpVNJLNshPK9xrsk8C3SKZxftuOBhnRNlDX7vEF3DDgUHYZb
	 iQ/SW5Lf492UQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vTFTj-0000000BhIm-1RCu;
	Wed, 10 Dec 2025 08:23:19 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Joshua Kinard <kumba@gentoo.org>
Subject: [PATCH 3/6] mips: Move IP30 timer to request_percpu_irq()
Date: Wed, 10 Dec 2025 08:22:39 +0000
Message-ID: <20251210082242.360936-4-maz@kernel.org>
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

Teach the SGI IP30 timer about request_percpu_irq(), which ultimately
will allow for the removal of the antiquated setup_percpu_irq() API.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/mips/include/asm/cevt-r4k.h |  1 -
 arch/mips/kernel/cevt-r4k.c      | 11 -----------
 arch/mips/sgi-ip30/ip30-timer.c  |  5 ++---
 3 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/arch/mips/include/asm/cevt-r4k.h b/arch/mips/include/asm/cevt-r4k.h
index 2e13a038d2600..5229eb34f28a4 100644
--- a/arch/mips/include/asm/cevt-r4k.h
+++ b/arch/mips/include/asm/cevt-r4k.h
@@ -23,7 +23,6 @@ void mips_event_handler(struct clock_event_device *dev);
 int c0_compare_int_usable(void);
 irqreturn_t c0_compare_interrupt(int, void *);
 
-extern struct irqaction c0_compare_irqaction;
 extern int cp0_timer_irq_installed;
 
 #endif /* __ASM_CEVT_R4K_H */
diff --git a/arch/mips/kernel/cevt-r4k.c b/arch/mips/kernel/cevt-r4k.c
index 5f6e9e2ebbdbb..f58325f9bd2bc 100644
--- a/arch/mips/kernel/cevt-r4k.c
+++ b/arch/mips/kernel/cevt-r4k.c
@@ -159,17 +159,6 @@ irqreturn_t c0_compare_interrupt(int irq, void *dev_id)
 	return IRQ_NONE;
 }
 
-struct irqaction c0_compare_irqaction = {
-	.handler = c0_compare_interrupt,
-	/*
-	 * IRQF_SHARED: The timer interrupt may be shared with other interrupts
-	 * such as perf counter and FDC interrupts.
-	 */
-	.flags = IRQF_PERCPU | IRQF_TIMER | IRQF_SHARED,
-	.name = "timer",
-};
-
-
 void mips_event_handler(struct clock_event_device *dev)
 {
 }
diff --git a/arch/mips/sgi-ip30/ip30-timer.c b/arch/mips/sgi-ip30/ip30-timer.c
index 7652f72f0daf6..294e1f7e6d8a6 100644
--- a/arch/mips/sgi-ip30/ip30-timer.c
+++ b/arch/mips/sgi-ip30/ip30-timer.c
@@ -52,11 +52,10 @@ void __init plat_time_init(void)
 	int irq = get_c0_compare_int();
 
 	cp0_timer_irq_installed = 1;
-	c0_compare_irqaction.percpu_dev_id = &mips_clockevent_device;
-	c0_compare_irqaction.flags &= ~IRQF_SHARED;
 	irq_set_handler(irq, handle_percpu_devid_irq);
 	irq_set_percpu_devid(irq);
-	setup_percpu_irq(irq, &c0_compare_irqaction);
+	WARN_ON(request_percpu_irq(irq, c0_compare_interrupt,
+				   "timer", &mips_clockevent_device));
 	enable_percpu_irq(irq, IRQ_TYPE_NONE);
 
 	ip30_heart_clocksource_init();
-- 
2.47.3


