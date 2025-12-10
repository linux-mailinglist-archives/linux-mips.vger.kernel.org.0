Return-Path: <linux-mips+bounces-12436-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBFDCB2635
	for <lists+linux-mips@lfdr.de>; Wed, 10 Dec 2025 09:23:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 249A23005AA7
	for <lists+linux-mips@lfdr.de>; Wed, 10 Dec 2025 08:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC3830215A;
	Wed, 10 Dec 2025 08:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q79jz05r"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5723019D8;
	Wed, 10 Dec 2025 08:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765355002; cv=none; b=KnGLdKqBRI+gkn6zqqx3Qpjf1BPkLh2RzkKtw/zt2kMk5O8l0cMfg9H7VUhjHjr8HZXcZuWSBn9/QRKQeIkRvWfwXPvrLpFAj4YpImuyIfsMjMJHKGHAM2A4FFNjxH4c/Z6vNcA2YgWf2wLsOsRbjYGZxMFwxOR8VNnK5GJCPQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765355002; c=relaxed/simple;
	bh=YESE8YE52HeNhEdxUO0TVhbuV56UPK5yXtqt4lb4UA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rF+4qDlQrH7rUfmHEW5AIu5HUDnZGE51lPMZhDYE6mIYb2bKPZRl0N3XaGR/C+756I140v77z21Ye9EGHsICeAkb+QVezsBwz/7q7JpW3IcPv8+UTbLQGxk61lewQKccdckJyEb3Xo2L25qmnKi4EucCwnADLv63IGqli4XypHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q79jz05r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BEF4C4CEF1;
	Wed, 10 Dec 2025 08:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765355001;
	bh=YESE8YE52HeNhEdxUO0TVhbuV56UPK5yXtqt4lb4UA0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q79jz05rugV3F1j7YdM9usUEiXShhfi8a+yTMFtdcFZMDFKfQJSM9lztuDgrSF8Cp
	 2lj5r1/VJVsz0/h+tYizPAYsrlvCyB3cShbjRMov5GOR2uCqNiWNTy18yKQ8xrzz/e
	 wmBbSdQA0FyuIJ9qVO2JXPZ6rPhcgjov/RyHbFQ6eHIZjqAaCKjybCoQlx8FZw2AG1
	 aHvaNjol5DiK0onJ86zjild1IIiOwI1kLYvDQZkn2UszpTxqnalcKpQNx4rIG/rWyq
	 Xn7gjgnwznDmZVz+etPQ0DvdL76KkiNCW1vqo0P0l6QdU0iGagULw5jbysnp93Id42
	 NdO5telmNp0dw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vTFTj-0000000BhIm-32IB;
	Wed, 10 Dec 2025 08:23:19 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Joshua Kinard <kumba@gentoo.org>
Subject: [PATCH 5/6] clocksource: mips-gic-timer: Move GIC timer to request_percpu_irq()
Date: Wed, 10 Dec 2025 08:22:41 +0000
Message-ID: <20251210082242.360936-6-maz@kernel.org>
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

Teach the MIPS GIC timer about request_percpu_irq(), which ultimately
will allow for the removal of the antiquated setup_percpu_irq() API.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/clocksource/mips-gic-timer.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index abb685a080a5b..1501c7db9a8e3 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -77,13 +77,6 @@ static irqreturn_t gic_compare_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct irqaction gic_compare_irqaction = {
-	.handler = gic_compare_interrupt,
-	.percpu_dev_id = &gic_clockevent_device,
-	.flags = IRQF_PERCPU | IRQF_TIMER,
-	.name = "timer",
-};
-
 static void gic_clockevent_cpu_init(unsigned int cpu,
 				    struct clock_event_device *cd)
 {
@@ -152,7 +145,8 @@ static int gic_clockevent_init(void)
 	if (!gic_frequency)
 		return -ENXIO;
 
-	ret = setup_percpu_irq(gic_timer_irq, &gic_compare_irqaction);
+	ret = request_percpu_irq(gic_timer_irq, gic_compare_interrupt,
+				 "timer", &gic_clockevent_device);
 	if (ret < 0) {
 		pr_err("IRQ %d setup failed (%d)\n", gic_timer_irq, ret);
 		return ret;
-- 
2.47.3


