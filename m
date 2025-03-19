Return-Path: <linux-mips+bounces-8221-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6A8A68835
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 10:37:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B86819C7E12
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 09:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFD7254AFF;
	Wed, 19 Mar 2025 09:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H9m3i3ep"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D142528E0;
	Wed, 19 Mar 2025 09:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742376726; cv=none; b=Z2R9HXhRd7jT+u2dnwaS2PHKB7cU2F6cKluhAM5wPfuPPZBCbfmOxYpE9VVuI+N4nURYkabwkpD3i2sJpcimmh02iHOvbqGnIrA6h0GtapI2ah0j2aAbdyDBKGClc7YT4wnr/GI4VLJlCK8yMCMyRRVojQhvbqWRYxNsK5HPxpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742376726; c=relaxed/simple;
	bh=7ZlX+S9p5Ba3lNfaTo9/MPtYEzDOa+8LY3UeZVGkFaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eSTceP8RgpEE2ynVjIIXbrNoWJ706J14kpAbbCIoghxL3wX9xO1eB4c3KiXrkqFFmkn629qzZoHcEK6a7rkKIKh/exZrk0CqLLlfCwBR4M2Fb9X9YNXd4oFU/O3n5UZBGAlYtzQH5D0I/glKSatwGBGdTWocjk6eSX0HO5MSH1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H9m3i3ep; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08CCBC4CEF0;
	Wed, 19 Mar 2025 09:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742376725;
	bh=7ZlX+S9p5Ba3lNfaTo9/MPtYEzDOa+8LY3UeZVGkFaQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H9m3i3ep0C5U55YhMHLwecBq+Q6TkF6oiMrv3Bu767tDJMRH90LkBbeiR0tKF1nzh
	 xwcQHAeBQCXDhAzTqdjg28qQRCbYAIA4QItVveUTHf94RMufckCVLXOgVu6f74AER/
	 DSATwRiKBRzjZ48xuC/xgl7iu+QJ0Md/YkSCIDDI37lfyJC6HE/Bj8zg6zYkCxdtNX
	 17JU0lCjyx3aYSt/IwLbYvNiIiRfu8eJ38MLas/yuJDCBWfCinmVcJ0Fz+TmWaF1fz
	 IvzykEOmZ/v/l7sFyUua5syksDrbcr5XgRso+Lpg/2RBcygMbJrsx3OkdcoEZxBOBk
	 LfrEG3+CSOEbQ==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	linux-mips@vger.kernel.org
Subject: [PATCH v2 25/57] irqdomain: mips: Switch to irq_domain_create_*()
Date: Wed, 19 Mar 2025 10:29:18 +0100
Message-ID: <20250319092951.37667-26-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

irq_domain_add_*() interfaces are going away as being obsolete now.
Switch to the preferred irq_domain_create_*() ones. Those differ in the
node parameter: They take more generic struct fwnode_handle instead of
struct device_node. Therefore, of_fwnode_handle() is added around the
original parameter.

Note some of the users can likely use dev->fwnode directly instead of
indirect of_fwnode_handle(dev->of_node). But dev->fwnode is not
guaranteed to be set for all, so this has to be investigated on case to
case basis (by people who can actually test with the HW).

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: John Crispin <john@phrozen.org>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-mips@vger.kernel.org
---
 arch/mips/ath25/ar2315.c             |  4 ++--
 arch/mips/ath25/ar5312.c             |  4 ++--
 arch/mips/cavium-octeon/octeon-irq.c | 25 +++++++++++++------------
 arch/mips/lantiq/irq.c               |  2 +-
 arch/mips/pci/pci-ar2315.c           |  4 ++--
 arch/mips/pci/pci-rt3883.c           |  7 ++++---
 arch/mips/ralink/irq.c               |  2 +-
 7 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/arch/mips/ath25/ar2315.c b/arch/mips/ath25/ar2315.c
index 8ccf167c167e..e8c38aaf46a2 100644
--- a/arch/mips/ath25/ar2315.c
+++ b/arch/mips/ath25/ar2315.c
@@ -149,8 +149,8 @@ void __init ar2315_arch_init_irq(void)
 
 	ath25_irq_dispatch = ar2315_irq_dispatch;
 
-	domain = irq_domain_add_linear(NULL, AR2315_MISC_IRQ_COUNT,
-				       &ar2315_misc_irq_domain_ops, NULL);
+	domain = irq_domain_create_linear(NULL, AR2315_MISC_IRQ_COUNT,
+					  &ar2315_misc_irq_domain_ops, NULL);
 	if (!domain)
 		panic("Failed to add IRQ domain");
 
diff --git a/arch/mips/ath25/ar5312.c b/arch/mips/ath25/ar5312.c
index cfa103518113..4a1d874be766 100644
--- a/arch/mips/ath25/ar5312.c
+++ b/arch/mips/ath25/ar5312.c
@@ -143,8 +143,8 @@ void __init ar5312_arch_init_irq(void)
 
 	ath25_irq_dispatch = ar5312_irq_dispatch;
 
-	domain = irq_domain_add_linear(NULL, AR5312_MISC_IRQ_COUNT,
-				       &ar5312_misc_irq_domain_ops, NULL);
+	domain = irq_domain_create_linear(NULL, AR5312_MISC_IRQ_COUNT,
+					  &ar5312_misc_irq_domain_ops, NULL);
 	if (!domain)
 		panic("Failed to add IRQ domain");
 
diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octeon/octeon-irq.c
index e6b4d9c0c169..5c3de175ef5b 100644
--- a/arch/mips/cavium-octeon/octeon-irq.c
+++ b/arch/mips/cavium-octeon/octeon-irq.c
@@ -1503,8 +1503,8 @@ static int __init octeon_irq_init_ciu(
 	/* Mips internal */
 	octeon_irq_init_core();
 
-	ciu_domain = irq_domain_add_tree(
-		ciu_node, &octeon_irq_domain_ciu_ops, dd);
+	ciu_domain = irq_domain_create_tree(of_fwnode_handle(ciu_node), &octeon_irq_domain_ciu_ops,
+					    dd);
 	irq_set_default_domain(ciu_domain);
 
 	/* CIU_0 */
@@ -1637,8 +1637,8 @@ static int __init octeon_irq_init_gpio(
 	if (gpiod) {
 		/* gpio domain host_data is the base hwirq number. */
 		gpiod->base_hwirq = base_hwirq;
-		irq_domain_add_linear(
-			gpio_node, 16, &octeon_irq_domain_gpio_ops, gpiod);
+		irq_domain_create_linear(of_fwnode_handle(gpio_node), 16,
+					 &octeon_irq_domain_gpio_ops, gpiod);
 	} else {
 		pr_warn("Cannot allocate memory for GPIO irq_domain.\n");
 		return -ENOMEM;
@@ -2074,8 +2074,8 @@ static int __init octeon_irq_init_ciu2(
 	/* Mips internal */
 	octeon_irq_init_core();
 
-	ciu_domain = irq_domain_add_tree(
-		ciu_node, &octeon_irq_domain_ciu2_ops, NULL);
+	ciu_domain = irq_domain_create_tree(of_fwnode_handle(ciu_node), &octeon_irq_domain_ciu2_ops,
+					    NULL);
 	irq_set_default_domain(ciu_domain);
 
 	/* CUI2 */
@@ -2331,11 +2331,12 @@ static int __init octeon_irq_init_cib(struct device_node *ciu_node,
 	}
 	host_data->max_bits = val;
 
-	cib_domain = irq_domain_add_linear(ciu_node, host_data->max_bits,
-					   &octeon_irq_domain_cib_ops,
-					   host_data);
+	cib_domain = irq_domain_create_linear(of_fwnode_handle(ciu_node),
+					      host_data->max_bits,
+					      &octeon_irq_domain_cib_ops,
+					      host_data);
 	if (!cib_domain) {
-		pr_err("ERROR: Couldn't irq_domain_add_linear()\n");
+		pr_err("ERROR: Couldn't irq_domain_create_linear()\n");
 		return -ENOMEM;
 	}
 
@@ -2918,8 +2919,8 @@ static int __init octeon_irq_init_ciu3(struct device_node *ciu_node,
 	 * Initialize all domains to use the default domain. Specific major
 	 * blocks will overwrite the default domain as needed.
 	 */
-	domain = irq_domain_add_tree(ciu_node, &octeon_dflt_domain_ciu3_ops,
-				     ciu3_info);
+	domain = irq_domain_create_tree(of_fwnode_handle(ciu_node), &octeon_dflt_domain_ciu3_ops,
+					ciu3_info);
 	for (i = 0; i < MAX_CIU3_DOMAINS; i++)
 		ciu3_info->domain[i] = domain;
 
diff --git a/arch/mips/lantiq/irq.c b/arch/mips/lantiq/irq.c
index 8f208007b8e8..a112573b6e37 100644
--- a/arch/mips/lantiq/irq.c
+++ b/arch/mips/lantiq/irq.c
@@ -377,7 +377,7 @@ int __init icu_of_init(struct device_node *node, struct device_node *parent)
 	for (i = 0; i < MAX_IM; i++)
 		irq_set_chained_handler(i + 2, ltq_hw_irq_handler);
 
-	ltq_domain = irq_domain_add_linear(node,
+	ltq_domain = irq_domain_create_linear(of_fwnode_handle(node),
 		(MAX_IM * INT_NUM_IM_OFFSET) + MIPS_CPU_IRQ_CASCADE,
 		&irq_domain_ops, 0);
 
diff --git a/arch/mips/pci/pci-ar2315.c b/arch/mips/pci/pci-ar2315.c
index a925842ee125..17fa97ec6ffb 100644
--- a/arch/mips/pci/pci-ar2315.c
+++ b/arch/mips/pci/pci-ar2315.c
@@ -469,8 +469,8 @@ static int ar2315_pci_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	apc->domain = irq_domain_add_linear(NULL, AR2315_PCI_IRQ_COUNT,
-					    &ar2315_pci_irq_domain_ops, apc);
+	apc->domain = irq_domain_create_linear(NULL, AR2315_PCI_IRQ_COUNT,
+					       &ar2315_pci_irq_domain_ops, apc);
 	if (!apc->domain) {
 		dev_err(dev, "failed to add IRQ domain\n");
 		return -ENOMEM;
diff --git a/arch/mips/pci/pci-rt3883.c b/arch/mips/pci/pci-rt3883.c
index 4ac68a534e4f..14454ece485d 100644
--- a/arch/mips/pci/pci-rt3883.c
+++ b/arch/mips/pci/pci-rt3883.c
@@ -208,9 +208,10 @@ static int rt3883_pci_irq_init(struct device *dev,
 	rt3883_pci_w32(rpc, 0, RT3883_PCI_REG_PCIENA);
 
 	rpc->irq_domain =
-		irq_domain_add_linear(rpc->intc_of_node, RT3883_PCI_IRQ_COUNT,
-				      &rt3883_pci_irq_domain_ops,
-				      rpc);
+		irq_domain_create_linear(of_fwnode_handle(rpc->intc_of_node),
+					 RT3883_PCI_IRQ_COUNT,
+					 &rt3883_pci_irq_domain_ops,
+					 rpc);
 	if (!rpc->irq_domain) {
 		dev_err(dev, "unable to add IRQ domain\n");
 		return -ENODEV;
diff --git a/arch/mips/ralink/irq.c b/arch/mips/ralink/irq.c
index 46aef0a1b22a..af5bbbea949b 100644
--- a/arch/mips/ralink/irq.c
+++ b/arch/mips/ralink/irq.c
@@ -176,7 +176,7 @@ static int __init intc_of_init(struct device_node *node,
 	/* route all INTC interrupts to MIPS HW0 interrupt */
 	rt_intc_w32(0, INTC_REG_TYPE);
 
-	domain = irq_domain_add_legacy(node, RALINK_INTC_IRQ_COUNT,
+	domain = irq_domain_create_legacy(of_fwnode_handle(node), RALINK_INTC_IRQ_COUNT,
 			RALINK_INTC_IRQ_BASE, 0, &irq_domain_ops, NULL);
 	if (!domain)
 		panic("Failed to add irqdomain");
-- 
2.49.0


