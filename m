Return-Path: <linux-mips+bounces-9985-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F0AB19758
	for <lists+linux-mips@lfdr.de>; Mon,  4 Aug 2025 02:27:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24FEC18951B9
	for <lists+linux-mips@lfdr.de>; Mon,  4 Aug 2025 00:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2682119755B;
	Mon,  4 Aug 2025 00:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z03sz03V"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6521953BB;
	Mon,  4 Aug 2025 00:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754267217; cv=none; b=SU8XsZlnzTBj/asvHjQINyID/QYL0gU+hJa8uzXVxsDT8EMPltb3utEIU+uQOPGcWSL7Lv4rlXWrIp7ZJ36t/PYSd1jV56aP2TW6nIBYtzX4TpU+Z5Hsd9aSGeiWJdawU/Bk3iSFI2Coi9hGrVlwK9Hb2xOjIou03OjPjQAQ1aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754267217; c=relaxed/simple;
	bh=ILa5ZfgqrPlkncC8c94V2KPQ9zh6+csI8lmsrBllFis=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VHrnQN6w1VIGWmFQFTkVWOuKM8Nf69ITSkeRbqxxKwC4EFfMcocrbPWQp4LuiUL1MZfIdwEb67upafYHkUxX79vcTfgvdtS0vZIQylfoBuVGavW3XmWYuq/hsLPEPYs6OHItyjm92Maf9REnGwuxXW0oOKBwYaQZX4Hci8+0LOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z03sz03V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1CCC4CEEB;
	Mon,  4 Aug 2025 00:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754267216;
	bh=ILa5ZfgqrPlkncC8c94V2KPQ9zh6+csI8lmsrBllFis=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z03sz03V/EYVh60dSYp/XNYxy4AJq4s7kNeuGLR+p5yurZ56sHXvxkntTUBT6ZVcG
	 2yVEP0fhofc0xgZhpaL9Kl6A+KGwggOdLk5xmRkvqnKgtpR+tUtbZ8cT3hyR75k/zV
	 locBTe79gSS5mXlnVyIndqIlE6fH7j+TK+EYcyp3HSTaMULBc3kp0VKcr2oqv4tRC/
	 cv0JWWWuLalyTnKV/G+xGufMs6KY2atHldndsRmar7R6r66u//b2mlrD5o9EeC0P2R
	 D1/HgtjRhZJRvs0D2iaQpBXdrVB/bHbxw/ssFvDLkFr/yrwhKw3fgtI746F50Lrgg3
	 Qq3yURs1j+jrQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>,
	Sebastian Gottschall <s.gottschall@dd-wrt.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sasha Levin <sashal@kernel.org>,
	tsbogend@alpha.franken.de,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16 67/85] irqchip/mips-gic: Allow forced affinity
Date: Sun,  3 Aug 2025 20:23:16 -0400
Message-Id: <20250804002335.3613254-67-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250804002335.3613254-1-sashal@kernel.org>
References: <20250804002335.3613254-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Transfer-Encoding: 8bit

From: Markus Stockhausen <markus.stockhausen@gmx.de>

[ Upstream commit 2250db8628a0d8293ad2e0671138b848a185fba1 ]

Devices of the Realtek MIPS Otto platform use the official rtl-otto-timer
as clock event generator and CPU clocksource. It is registered for each CPU
startup via cpuhp_setup_state() and forces the affinity of the clockevent
interrupts to the appropriate CPU via irq_force_affinity().

On the "smaller" devices with a vendor specific interrupt controller
(supported by irq-realtek-rtl) the registration works fine. The "larger"
RTL931x series is based on a MIPS interAptiv dual core with a MIPS GIC
controller. Interrupt routing setup is cancelled because gic_set_affinity()
does not accept the current (not yet online) CPU as a target.

Relax the checks by evaluating the force parameter that is provided for
exactly this purpose like in other drivers. With this the affinity can be
set as follows:

 - force = false: allow to set affinity to any online cpu
 - force = true:  allow to set affinity to any cpu

Co-developed-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Signed-off-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Link: https://lore.kernel.org/all/20250621054952.380374-1-markus.stockhausen@gmx.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my analysis of the commit, here is my assessment:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

1. **Fixes a real bug affecting users**: The commit fixes a specific
   issue where clockevent interrupt affinity setup fails on Realtek
   RTL931x devices with MIPS GIC controllers. Without this fix, the
   timer registration during CPU hotplug fails because
   `gic_set_affinity()` rejects setting affinity to CPUs that are not
   yet online.

2. **Small and contained fix**: The change is minimal - it only adds 4
   lines of code to properly handle the `force` parameter that was
   already being passed but ignored. The logic change is
   straightforward:
   - When `force=false`: Use existing behavior (only allow online CPUs)
   - When `force=true`: Allow any CPU in the mask

3. **Follows established patterns**: The commit shows that multiple
   other timer drivers (`timer-rtl-otto.c`, `timer-tegra.c`,
   `exynos_mct.c`, etc.) use `irq_force_affinity()` during CPU hotplug,
   which eventually calls the chip's `set_affinity` handler with
   `force=true`. The MIPS GIC driver was incorrectly ignoring this
   parameter.

4. **No architectural changes**: This is purely a bug fix that makes the
   MIPS GIC driver honor the existing `force` parameter semantics. It
   doesn't introduce new features or change any architecture.

5. **Clear use case**: The commit message clearly explains that this
   affects real hardware (Realtek RTL931x series) and prevents proper
   timer initialization during CPU hotplug, which is a fundamental
   kernel operation.

6. **Low regression risk**: The change only affects behavior when
   `force=true` is explicitly passed, which is specifically for CPU
   hotplug scenarios. Normal interrupt affinity operations (with
   `force=false`) remain unchanged.

7. **Aligns with kernel conventions**: The kernel documentation for
   `irq_force_affinity()` explicitly states it's "Solely for low level
   cpu hotplug code, where we need to make per cpu interrupts affine
   before the cpu becomes online." This commit makes the MIPS GIC driver
   comply with this intended behavior.

The fix is essential for proper operation of affected hardware and
follows the stable kernel criteria of being a important bugfix with
minimal risk.

 drivers/irqchip/irq-mips-gic.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 34e8d09c12a0..19a57c5e2b2e 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -375,9 +375,13 @@ static int gic_set_affinity(struct irq_data *d, const struct cpumask *cpumask,
 	/*
 	 * The GIC specifies that we can only route an interrupt to one VP(E),
 	 * ie. CPU in Linux parlance, at a time. Therefore we always route to
-	 * the first online CPU in the mask.
+	 * the first forced or online CPU in the mask.
 	 */
-	cpu = cpumask_first_and(cpumask, cpu_online_mask);
+	if (force)
+		cpu = cpumask_first(cpumask);
+	else
+		cpu = cpumask_first_and(cpumask, cpu_online_mask);
+
 	if (cpu >= NR_CPUS)
 		return -EINVAL;
 
-- 
2.39.5


