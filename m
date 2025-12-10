Return-Path: <linux-mips+bounces-12433-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A75CB2644
	for <lists+linux-mips@lfdr.de>; Wed, 10 Dec 2025 09:23:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA1AB3069C86
	for <lists+linux-mips@lfdr.de>; Wed, 10 Dec 2025 08:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C715A2E613A;
	Wed, 10 Dec 2025 08:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j5chR3Gk"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E83D3009D2;
	Wed, 10 Dec 2025 08:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765355001; cv=none; b=KFX2Gg53e9qXJ+I4T9tKUZjCX5iqEWU9AqjCR6BKUYPvK4Lirv4JaFlr4ooLy0eMVe2m+tbPWMY9VhFHD5FqGNmEoJVB6qgLdbPwj6l/Uxwz+21lJg5n2CW2Fa+dMNZwTB/NqHWrjyWbr76CLLSQt3xZ/C4kSf5KQ6BPccFC7OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765355001; c=relaxed/simple;
	bh=JC0MTIIxOIlsAhSPZsJ6JRndTj9cPsuEhVeJCzoNwfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SQynNbGbLAhoWZ6XwJ6Xs4Qp88JPX0KSH8Y95EhpNyGzbWblaOw8s5RQ6XcoYVJi/otZjRFQlkg9cgrGFnLnvDCtI/Ea/YHkHrGsGJ7DHUohvEClkC2s3/45Z9w+6fso9N6Kp8bLSs3Dc7ua7Igj0PzSnEb7TvgiYZpFxDSD8Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j5chR3Gk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB4DC19423;
	Wed, 10 Dec 2025 08:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765355001;
	bh=JC0MTIIxOIlsAhSPZsJ6JRndTj9cPsuEhVeJCzoNwfs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j5chR3GkGCBJ/0AEJeJ4iVwTr2qaqH+lToC2hy2BTcgOJYYClfj+UAnrmpvUpSDa9
	 gCzcqPxZwMYTFRQJOE9ZsuhYRbJodxpkFOPQsg0cAux8kFyxBw3Cq4DY7JTH8kfMjC
	 0roKwpJh1pl4niNYV5sBr388GD+s2dzPiakKrs585KATo+eC+ICkmBgJYqMXbv6vyJ
	 gjwTHKc5/cgzhvO5kPBwQX0MdANyAqXBgnbg/bB/xFIXq8q81UPCDQZmln8FOGQm+M
	 H4pRxSirOuyZw+v31xyl55DQ1ytBR9VP0APyNUGJPq1kxyhDb4NSA98YfPUF+tnUVb
	 wdesaBbPgug1g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vTFTj-0000000BhIm-2CUY;
	Wed, 10 Dec 2025 08:23:19 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Joshua Kinard <kumba@gentoo.org>
Subject: [PATCH 4/6] mips: Move IP27 timer to request_percpu_irq()
Date: Wed, 10 Dec 2025 08:22:40 +0000
Message-ID: <20251210082242.360936-5-maz@kernel.org>
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

Teach the SGI IP27 timer about request_percpu_irq(), which ultimately
will allow for the removal of the antiquated setup_percpu_irq() API.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/mips/sgi-ip27/ip27-timer.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/mips/sgi-ip27/ip27-timer.c b/arch/mips/sgi-ip27/ip27-timer.c
index 444b5e0e935f7..5f4da05cb2c9d 100644
--- a/arch/mips/sgi-ip27/ip27-timer.c
+++ b/arch/mips/sgi-ip27/ip27-timer.c
@@ -58,13 +58,6 @@ static irqreturn_t hub_rt_counter_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-struct irqaction hub_rt_irqaction = {
-	.handler	= hub_rt_counter_handler,
-	.percpu_dev_id	= &hub_rt_clockevent,
-	.flags		= IRQF_PERCPU | IRQF_TIMER,
-	.name		= "hub-rt",
-};
-
 /*
  * This is a hack; we really need to figure these values out dynamically
  *
@@ -103,7 +96,8 @@ static void __init hub_rt_clock_event_global_init(void)
 {
 	irq_set_handler(IP27_RT_TIMER_IRQ, handle_percpu_devid_irq);
 	irq_set_percpu_devid(IP27_RT_TIMER_IRQ);
-	setup_percpu_irq(IP27_RT_TIMER_IRQ, &hub_rt_irqaction);
+	WARN_ON(request_percpu_irq(IP27_RT_TIMER_IRQ, hub_rt_counter_handler,
+				   "hub-rt", &hub_rt_clockevent));
 }
 
 static u64 hub_rt_read(struct clocksource *cs)
-- 
2.47.3


