Return-Path: <linux-mips+bounces-11657-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC8FBCA08D
	for <lists+linux-mips@lfdr.de>; Thu, 09 Oct 2025 18:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5692D4FDC9A
	for <lists+linux-mips@lfdr.de>; Thu,  9 Oct 2025 16:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095A922A7F1;
	Thu,  9 Oct 2025 15:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LgbkwATd"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA892FB0BB;
	Thu,  9 Oct 2025 15:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025591; cv=none; b=pUJUvBwT1RXTDvuAxhNH9Rq6aqr7mjtM4He1SwnUhnxqf+aI4z7tHFpUppnSvgMZNFMGoTElEdRUjmP6K+9DoziehJq9Wihq5f/xm4HFVl29nBVubPA9WJ1hq01qGwC4AP+QxTMh8htZMe5R6fe1ibHmlx1NRCt5E1fAoBeFcXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025591; c=relaxed/simple;
	bh=vYT7tI9E7sWWtZlSoDWPwRiSkT4HiL7H4uoZ9V70nkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I3fy5feAsQwx1YZV45OnSzr5JJ3D4S/Cl5u12QyV+RjS6SG1sS66mq62+zP8LXoqoKmRjc5CgwDs/YWlXqWJv1V51h7OxvHJsIfv4RbbN980PfdOKwEx9277BKSmRmXt1LkkWpXjKikPpA046/0w/6p0cVT97yOZK1C/w80ee94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LgbkwATd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE03C116B1;
	Thu,  9 Oct 2025 15:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760025591;
	bh=vYT7tI9E7sWWtZlSoDWPwRiSkT4HiL7H4uoZ9V70nkw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LgbkwATd7MW7y0V93XnwqcB5m9tfWAi5W1N5C0fAetND4EycRcG41IzwdN9Ww2b6H
	 WDBRj6A3PFIOe0/AAfbe6W8qEeGYT2lN8qEg2ZxFRwYVoskvhoiEGv7xrIehXBGHA1
	 22HTf5AI+y2dlHRFXJIwSAfSGguipXP7KS37ThxIVwboEbxl0yOKrszHUN5FM+p7PS
	 xfMV6qQCBJRqVRTjEZ0SCPqJuofV4lTvqAOKmbhRtZyp3R3um5nhgzUchfWPcSiDwH
	 njFdsrS6Ar2yvx5CgAZjm//WtckUvc/DZ/V8XDlRiFKzoW6MGS2I08gDw/gsyxuxJf
	 LFDv3NogUsejg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Ming Wang <wangming01@loongson.cn>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sasha Levin <sashal@kernel.org>,
	chenhuacai@kernel.org,
	jiaxun.yang@flygoat.com,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-6.1] irqchip/loongson-pch-lpc: Use legacy domain for PCH-LPC IRQ controller
Date: Thu,  9 Oct 2025 11:55:28 -0400
Message-ID: <20251009155752.773732-62-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009155752.773732-1-sashal@kernel.org>
References: <20251009155752.773732-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ming Wang <wangming01@loongson.cn>

[ Upstream commit c33c43f71bda362b292a6e57ac41b64342dc87b3 ]

On certain Loongson platforms, drivers attempting to request a legacy
ISA IRQ directly via request_irq() (e.g., IRQ 4) may fail. The
virtual IRQ descriptor is not fully initialized and lacks a valid irqchip.

This issue does not affect ACPI-enumerated devices described in DSDT,
as their interrupts are properly mapped via the GSI translation path.
This indicates the LPC irqdomain itself is functional but is not correctly
handling direct VIRQ-to-HWIRQ mappings.

The root cause is the use of irq_domain_create_linear(). This API sets
up a domain for dynamic, on-demand mapping, typically triggered by a GSI
request. It does not pre-populate the mappings for the legacy VIRQ range
(0-15). Consequently, if no ACPI device claims a specific GSI
(e.g., GSI 4), the corresponding VIRQ (e.g., VIRQ 4) is never mapped to
the LPC domain. A direct call to request_irq(4, ...) then fails because
the kernel cannot resolve this VIRQ to a hardware interrupt managed by
the LPC controller.

The PCH-LPC interrupt controller is an i8259-compatible legacy device
that requires a deterministic, static 1-to-1 mapping for IRQs 0-15 to
support legacy drivers.

Fix this by replacing irq_domain_create_linear() with
irq_domain_create_legacy(). This API is specifically designed for such
controllers. It establishes the required static 1-to-1 VIRQ-to-HWIRQ
mapping for the entire legacy range (0-15) immediately upon domain
creation. This ensures that any VIRQ in this range is always resolvable,
making direct calls to request_irq() for legacy IRQs function correctly.

Signed-off-by: Ming Wang <wangming01@loongson.cn>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES: Switching the Loongson PCH-LPC domain from
`irq_domain_create_linear()` to `irq_domain_create_legacy()` removes a
long-standing bug that prevents legacy ISA interrupts from working when
drivers call `request_irq()` directly.

- The current code at `drivers/irqchip/irq-loongson-pch-lpc.c:203`
  creates a linear domain, which only instantiates mappings on demand.
  That leaves IRQs 0‑15 unmapped unless an ACPI GSI translation happens
  first, so `request_irq(4, …)` sees an uninitialized descriptor and
  fails exactly as described in the commit message.
- The fix replaces that call with `irq_domain_create_legacy(…,
  LPC_COUNT, 0, 0, …)` (same location) and adds a clarifying comment.
  Legacy domains eagerly map the whole 0‑15 range, invoking
  `pch_lpc_map()` for each slot so the chip/handler is set up before any
  driver requests the IRQ. This mirrors how other i8259-compatible
  controllers (e.g. `irq-i8259.c`) are wired.
- The regression was introduced when the controller first landed (Fixes:
  ee73f14ee9eb7, v6.0), so every stable kernel carrying Loongson support
  can hit it. Impact is high: legacy ISA drivers or firmware that still
  rely on numeric IRQs can never bind on affected systems.
- The change is tiny, localized to one driver, and does not alter the
  hardware programming model—only the domain helper is swapped. No new
  features, no ABI changes, and it parallels existing upstream practice,
  so regression risk is minimal.

Given the clear user-visible failure mode and the contained, well-
understood fix, this is an excellent candidate for stable backporting.

 drivers/irqchip/irq-loongson-pch-lpc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-pch-lpc.c b/drivers/irqchip/irq-loongson-pch-lpc.c
index 2d4c3ec128b8f..912bf50a5c7ca 100644
--- a/drivers/irqchip/irq-loongson-pch-lpc.c
+++ b/drivers/irqchip/irq-loongson-pch-lpc.c
@@ -200,8 +200,13 @@ int __init pch_lpc_acpi_init(struct irq_domain *parent,
 		goto iounmap_base;
 	}
 
-	priv->lpc_domain = irq_domain_create_linear(irq_handle, LPC_COUNT,
-					&pch_lpc_domain_ops, priv);
+	/*
+	 * The LPC interrupt controller is a legacy i8259-compatible device,
+	 * which requires a static 1:1 mapping for IRQs 0-15.
+	 * Use irq_domain_create_legacy to establish this static mapping early.
+	 */
+	priv->lpc_domain = irq_domain_create_legacy(irq_handle, LPC_COUNT, 0, 0,
+						    &pch_lpc_domain_ops, priv);
 	if (!priv->lpc_domain) {
 		pr_err("Failed to create IRQ domain\n");
 		goto free_irq_handle;
-- 
2.51.0


