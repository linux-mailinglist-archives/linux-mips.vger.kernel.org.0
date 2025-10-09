Return-Path: <linux-mips+bounces-11658-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF66BCA0EC
	for <lists+linux-mips@lfdr.de>; Thu, 09 Oct 2025 18:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 876781883412
	for <lists+linux-mips@lfdr.de>; Thu,  9 Oct 2025 16:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3828242D84;
	Thu,  9 Oct 2025 16:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zeb5WqLy"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F471A267;
	Thu,  9 Oct 2025 16:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025630; cv=none; b=M872+IVOpRRlFbKvA/85Fp1zdxzwWVJ4ueQFvREMFgTy2zf9ISUYoOQF15ETpB33kuHwt7PmkNrtublY8D8Ra0xDHQpbrk6TgrXoN0Ckj8mTLjHoHsmZAmqO5izy0Rkmu1JX8968gpdHlf8wfNZeDUy6KpHstz6iOEVC5vkNWak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025630; c=relaxed/simple;
	bh=11Wfki1lzai+tC0pkS7NvwICxtb0xRF4vios80pZDgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GV8noO9p2PKynKRzTR+F0vJxUDfV08XA+NdPIGzMIBWMPYXXKKUjYebbMN089SG2zkZB2s6hxk4TcwIfWm9IbEd3scy3dg/t6u2rBu69hn8bOlFB7wOG7q461XN49JxtJfxjfs58v3+l9ewZL0HOQ1t8hrxkprsFReWl5aQcFUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zeb5WqLy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E56C4CEF8;
	Thu,  9 Oct 2025 16:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760025630;
	bh=11Wfki1lzai+tC0pkS7NvwICxtb0xRF4vios80pZDgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zeb5WqLycnF1ZpvNQUCHMXAHptJSzMznX/86gnqjCQucNDEAiLlGV+3xodQi1KJXe
	 rzOI5kViNQhpEZxx+yHeeiyjosbPnqnQ0ArPMX0CKRj/62hHG6YW3W1z6fCLDeqdsf
	 Jy/Fox8QfApHbiTzoiYFZq7jBorIjoBYrhO56GN2eFc3lWr+whko/8Ho8jdNGsgPDP
	 ClegWciqPZDQUlUh0+jjlo+FXRZRAb5Dj/nNV/ZtaN1M3OtQ737FVUdALNHqpWAKZu
	 wm6ME8TUmkf/9P9gfN4oF/DO+1LXzdE8YPOAKzkd09BdaTYWEVNsr5rwGvndJixzPi
	 RUCe+2PMZuI4Q==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Bibo Mao <maobibo@loongson.cn>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sasha Levin <sashal@kernel.org>,
	chenhuacai@kernel.org,
	jiaxun.yang@flygoat.com,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-6.16] irqchip/loongson-eiointc: Route interrupt parsed from bios table
Date: Thu,  9 Oct 2025 11:55:50 -0400
Message-ID: <20251009155752.773732-84-sashal@kernel.org>
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

From: Bibo Mao <maobibo@loongson.cn>

[ Upstream commit 7fb83eb664e9b3a0438dd28859e9f0fd49d4c165 ]

Interrupt controller eiointc routes interrupts to CPU interface IP0 - IP7.

It is currently hard-coded that eiointc routes interrupts to the CPU
starting from IP1, but it should base that decision on the parent
interrupt, which is provided by ACPI or DTS.

Retrieve the parent's hardware interrupt number and store it in the
descriptor of the eointc instance, so that the routing function can utilize
it for the correct route settings.

[ tglx: Massaged change log ]

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Link: https://lore.kernel.org/all/20250804081946.1456573-2-maobibo@loongson.cn
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now let me compile my comprehensive analysis.

## COMPREHENSIVE ANALYSIS

Based on my extensive investigation of this commit, here is my
determination:

**Backport Status: YES**

## Detailed Analysis

### What This Commit Fixes

The Loongson eiointc (Extended I/O Interrupt Controller) driver was
**hardcoding interrupt routing** to CPU interface pins using the formula
`BIT(1 + index)`, which routes interrupts starting from IP1. However,
the **correct routing information is provided by ACPI/DTS** in the
`cascade` field (for ACPI) or parent interrupt hwirq (for device tree).

**Code Evidence:**
- Line 214 in drivers/irqchip/irq-loongson-eiointc.c (before fix): `bit
  = BIT(1 + index); /* Route to IP[1 + index] */`
- After fix: `bit = BIT(eiointc_priv[index]->parent_hwirq - INT_HWI0);`
- The ACPI structure at include/acpi/actbl2.h:1479-1485 defines
  `cascade` field (u8) which specifies the correct interrupt pin
- INT_HWI0 through INT_HWI7 are defined at
  arch/loongarch/include/asm/loongarch.h:1462-1469

### Real-World Impact

1. **Incorrect Interrupt Routing:** On systems where ACPI/DTS specifies
   a different CPU interrupt pin than the hardcoded value, interrupts
   would be routed to the wrong pin. This could cause:
   - Interrupts not being received at all
   - System hangs or device malfunctions
   - Hardware that doesn't work correctly

2. **Prerequisite for Optimization:** The follow-up commit
   (8ff1c16c753e2) explains that correct routing enables an important VM
   optimization: routing different interrupt vectors to different CPU
   pins reduces VM exits by allowing the handler to read only one
   EIOINTC_REG_ISR register instead of all four.

3. **Affected Systems:** All Loongson systems using eiointc:
   - LS2K0500, LS2K2000 (device tree)
   - Loongson-3A5000, Loongson-3C5000 (ACPI)

### Why This Bug Existed

The hardcoded routing was present **from the initial driver commit**
(dd281e1a1a937 from July 2022). It likely went undetected because:
- Reference/common platforms happened to use IP1, matching the hardcoded
  value
- Limited deployment of Loongson architecture
- New hardware configurations or firmware changes exposed the issue

### Backporting Assessment

**✓ Fixes a bug affecting users:** Yes - incorrect hardware programming
that can cause device malfunctions

**✓ Small and contained:** Yes - adds one struct field, modifies routing
logic in one place, updates two init functions

**✓ No architectural changes:** Correct - just fixes the routing to
match hardware specification

**✓ Minimal risk:** Low risk because:
- Makes behavior match what ACPI/DTS specifies (hardware specification)
- Part of a tested two-commit series (both commits already merged and
  backported)
- No subsequent fixes found (checked commits after 2025-08-04)
- Already successfully backported to 6.17 (ec1317ec5082f)

**✓ No explicit stable tag:** Commit lacks `Cc: stable` tag, but fits
stable tree criteria

**✗ Critical subsystem:** Yes, but the change is localized to Loongson-
specific driver

### Verification of Backport Quality

- Commit was authored: Mon Aug 4 16:19:45 2025
- Merged to mainline: Sun Aug 24 12:51:04 2025
- Already backported to 6.17 by Sasha Levin
- No fixes found targeting this commit (searched with git log
  --grep="Fixes.*7fb83eb664e9b")
- Follow-up commit (8ff1c16c753e2) builds on this fix and should be
  backported together

## Conclusion

**YES - This commit should be backported to stable kernel trees.**

This is a clear bugfix that corrects incorrect hardware programming. The
driver was routing interrupts to hardcoded CPU interrupt pins instead of
using the routing information from firmware (ACPI/DTS). This could cause
device malfunctions on systems where firmware specifies different
interrupt pins. The fix is small, contained, has no known regressions,
and is a prerequisite for important virtualization optimizations. It
meets all stable tree criteria for backporting.

 drivers/irqchip/irq-loongson-eiointc.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
index b2860eb2d32c5..baa406904de55 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -68,6 +68,7 @@ struct eiointc_priv {
 	struct fwnode_handle	*domain_handle;
 	struct irq_domain	*eiointc_domain;
 	int			flags;
+	irq_hw_number_t		parent_hwirq;
 };
 
 static struct eiointc_priv *eiointc_priv[MAX_IO_PICS];
@@ -211,7 +212,12 @@ static int eiointc_router_init(unsigned int cpu)
 		}
 
 		for (i = 0; i < eiointc_priv[0]->vec_count / 32 / 4; i++) {
-			bit = BIT(1 + index); /* Route to IP[1 + index] */
+			/*
+			 * Route to interrupt pin, relative offset used here
+			 * Offset 0 means routing to IP0 and so on
+			 * Every 32 vector routing to one interrupt pin
+			 */
+			bit = BIT(eiointc_priv[index]->parent_hwirq - INT_HWI0);
 			data = bit | (bit << 8) | (bit << 16) | (bit << 24);
 			iocsr_write32(data, EIOINTC_REG_IPMAP + i * 4);
 		}
@@ -495,7 +501,7 @@ int __init eiointc_acpi_init(struct irq_domain *parent,
 
 	priv->vec_count = VEC_COUNT;
 	priv->node = acpi_eiointc->node;
-
+	priv->parent_hwirq = acpi_eiointc->cascade;
 	parent_irq = irq_create_mapping(parent, acpi_eiointc->cascade);
 
 	ret = eiointc_init(priv, parent_irq, acpi_eiointc->node_map);
@@ -527,8 +533,9 @@ int __init eiointc_acpi_init(struct irq_domain *parent,
 static int __init eiointc_of_init(struct device_node *of_node,
 				  struct device_node *parent)
 {
-	int parent_irq, ret;
 	struct eiointc_priv *priv;
+	struct irq_data *irq_data;
+	int parent_irq, ret;
 
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -544,6 +551,12 @@ static int __init eiointc_of_init(struct device_node *of_node,
 	if (ret < 0)
 		goto out_free_priv;
 
+	irq_data = irq_get_irq_data(parent_irq);
+	if (!irq_data) {
+		ret = -ENODEV;
+		goto out_free_priv;
+	}
+
 	/*
 	 * In particular, the number of devices supported by the LS2K0500
 	 * extended I/O interrupt vector is 128.
@@ -552,7 +565,7 @@ static int __init eiointc_of_init(struct device_node *of_node,
 		priv->vec_count = 128;
 	else
 		priv->vec_count = VEC_COUNT;
-
+	priv->parent_hwirq = irqd_to_hwirq(irq_data);
 	priv->node = 0;
 	priv->domain_handle = of_fwnode_handle(of_node);
 
-- 
2.51.0


