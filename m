Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75C0477AE9
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2019 19:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388074AbfG0Rxe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Jul 2019 13:53:34 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45458 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388029AbfG0Rxe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 Jul 2019 13:53:34 -0400
Received: by mail-wr1-f68.google.com with SMTP id f9so57517447wre.12;
        Sat, 27 Jul 2019 10:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CRlop1wU8KMMk0r/xtmfvg16U47t30s28w83OzXPNSw=;
        b=ZNEnudvfnRjmhOQDMc1PMX0Qn4WgpsI27At7hdn8HAVndclPhQEE2OvLznJaAA39mU
         C8gmqF5aSbvML1zGYFOxKahNe/mmIjEoHaZda79tPJUXVKaAkYSD/lkHZvoOvyXl92Ms
         wPnrG7DqHlJ6E4Hi64lYOWO61z8bkcT02QGmkGnyFSue4UNWgxJRxEAcS9qFplBOl3U3
         o5Yn/6E+ZKlfFU3ztXbu66/8i9obGF+HQ+agWeVtGhVX7TNkA83oKGE49+zvCsApgbGt
         m4vWw5UEewQ0snZIaRF/atDtLTX5zue4ELasJFIzfF7bT7v3uxCGfUzmS3FKc9NptnPK
         hLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CRlop1wU8KMMk0r/xtmfvg16U47t30s28w83OzXPNSw=;
        b=KeEZZw1fy+u4raAcy+fUcZTJOIJyCeJ/RlTTzne0wfkjbDq92Dea32856ACnRKDato
         vZyXUj5FXqBpauSuv9qGQJFQ6EmK0g9Nq6QCxeP5fTptKoWElh/KrlC4femi9ogGPn1y
         gTA2pwanzEqaNqCx+4byqKyZuTf7BMdX2uyYvuoLLPvHubKuwoyDAmJ4aZ8k300CvPsg
         KQMaBVq2zvFFF0W5lCEuAToOAdJ7nVgFXGNHJaAE10Bq3Ak0gO7i3uSwSVMXK3Yt2QWu
         MFm+bnwfFcgAEXC6JITdLyUAtzwMXg4TJsDmUvGVO35z8wVJBEvtJseO3fsmKcHY/pTL
         BdxQ==
X-Gm-Message-State: APjAAAWrLVTxOAIRWZwnk+xEkKzp2CSId630ClC0X71rnzf1V+TSkQ7G
        KYxwMJxzxzQagoJEN+OZZT8=
X-Google-Smtp-Source: APXvYqwSc5zVrWwNVZLpbzirResSdWnsvv6+hAQEgq1zNODDClNRd7URKOZP+mvr6vdI+1uomjqXbw==
X-Received: by 2002:a05:6000:112:: with SMTP id o18mr28607631wrx.153.1564250011432;
        Sat, 27 Jul 2019 10:53:31 -0700 (PDT)
Received: from blackbox.darklights.net (p200300F133C65C00B418D0F4A25A19EC.dip0.t-ipconnect.de. [2003:f1:33c6:5c00:b418:d0f4:a25a:19ec])
        by smtp.googlemail.com with ESMTPSA id t1sm67705423wra.74.2019.07.27.10.53.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 27 Jul 2019 10:53:30 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org,
        robh+dt@kernel.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        john@phrozen.org, hauke@hauke-m.de,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 3/5] MIPS: lantiq: add an irq_domain and irq_chip for EBU
Date:   Sat, 27 Jul 2019 19:53:13 +0200
Message-Id: <20190727175315.28834-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190727175315.28834-1-martin.blumenstingl@googlemail.com>
References: <20190727175315.28834-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The PCI_INTA on Lantiq SoCs is a chained interrupt:
EBU configures the interrupt type, has a registers to enable/disable
and ACK the interrupt. This is chained with the ICU interrupt where the
parent interrupt of the EBU IRQ has to be ACK'ed.

Move all EBU interrupt logic into ebu.c and expose it using an
irq_domain and irq_chip.
Drop the hardcoded EBU interrupt configuration from pci-lantiq.c as this
can now be expressed in device tree by passing the EBU interrupt line to
PCI_INTA (using for example "... &ebu0 0 IRQ_TYPE_LEVEL_LOW").
Also drop the EBU interrupt masking from irq.c because that's now
managed by EBU's own irq_ack callback.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../include/asm/mach-lantiq/xway/lantiq_soc.h |   3 -
 arch/mips/lantiq/ebu.c                        | 149 ++++++++++++++++++
 arch/mips/lantiq/irq.c                        |  11 --
 arch/mips/pci/pci-lantiq.c                    |   4 -
 4 files changed, 149 insertions(+), 18 deletions(-)

diff --git a/arch/mips/include/asm/mach-lantiq/xway/lantiq_soc.h b/arch/mips/include/asm/mach-lantiq/xway/lantiq_soc.h
index 02a64ad6c0cc..5555deb02397 100644
--- a/arch/mips/include/asm/mach-lantiq/xway/lantiq_soc.h
+++ b/arch/mips/include/asm/mach-lantiq/xway/lantiq_soc.h
@@ -79,9 +79,6 @@ extern __iomem void *ltq_cgu_membase;
 #define LTQ_EARLY_ASC		KSEG1ADDR(LTQ_ASC1_BASE_ADDR)
 
 /* EBU - external bus unit */
-#define LTQ_EBU_PCC_CON		0x0090
-#define LTQ_EBU_PCC_IEN		0x00A4
-#define LTQ_EBU_PCC_ISTAT	0x00A0
 #define LTQ_EBU_BUSCON1		0x0064
 #define LTQ_EBU_ADDRSEL1	0x0024
 
diff --git a/arch/mips/lantiq/ebu.c b/arch/mips/lantiq/ebu.c
index b2e84cf83f91..12951eb3c88f 100644
--- a/arch/mips/lantiq/ebu.c
+++ b/arch/mips/lantiq/ebu.c
@@ -7,7 +7,11 @@
 #include <linux/bits.h>
 #include <linux/export.h>
 #include <linux/ioport.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/of_address.h>
 
@@ -15,6 +19,19 @@
 
 #define LTQ_EBU_BUSCON0				0x0060
 #define LTQ_EBU_BUSCON_WRDIS			BIT(31)
+#define LTQ_EBU_PCC_CON				0x0090
+#define LTQ_EBU_PCC_CON_PCCARD_ON		BIT(0)
+#define LTQ_EBU_PCC_CON_IREQ_RISING_EDGE        0x2
+#define LTQ_EBU_PCC_CON_IREQ_FALLING_EDGE       0x4
+#define LTQ_EBU_PCC_CON_IREQ_BOTH_EDGE          0x6
+#define LTQ_EBU_PCC_CON_IREQ_DIS                0x8
+#define LTQ_EBU_PCC_CON_IREQ_HIGH_LEVEL_DETECT  0xa
+#define LTQ_EBU_PCC_CON_IREQ_LOW_LEVEL_DETECT	0xc
+#define LTQ_EBU_PCC_CON_IREQ_MASK		0xe
+#define LTQ_EBU_PCC_ISTAT			0x00a0
+#define LTQ_EBU_PCC_ISTAT_PCI			BIT(4)
+#define LTQ_EBU_PCC_IEN				0x00a4
+#define LTQ_EBU_PCC_IEN_PCI_EN			BIT(4)
 
 void __iomem *ltq_ebu_membase;
 
@@ -52,6 +69,131 @@ static const struct of_device_id of_ebu_ids[] __initconst = {
 	{ /* sentinel */ },
 };
 
+static void ltq_ebu_ack_irq(struct irq_data *d)
+{
+	ltq_ebu_w32(ltq_ebu_r32(LTQ_EBU_PCC_ISTAT) | LTQ_EBU_PCC_ISTAT_PCI,
+		    LTQ_EBU_PCC_ISTAT);
+}
+
+static void ltq_ebu_mask_irq(struct irq_data *d)
+{
+	ltq_ebu_w32(ltq_ebu_r32(LTQ_EBU_PCC_IEN) & ~LTQ_EBU_PCC_IEN_PCI_EN,
+		    LTQ_EBU_PCC_IEN);
+}
+
+static void ltq_ebu_unmask_irq(struct irq_data *d)
+{
+	ltq_ebu_w32(ltq_ebu_r32(LTQ_EBU_PCC_IEN) | LTQ_EBU_PCC_IEN_PCI_EN,
+		    LTQ_EBU_PCC_IEN);
+}
+
+static int ltq_ebu_set_irq_type(struct irq_data *d, unsigned int flow_type)
+{
+	u32 val = ltq_ebu_r32(LTQ_EBU_PCC_CON);
+
+	val &= ~LTQ_EBU_PCC_CON_IREQ_MASK;
+
+	switch (flow_type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_NONE:
+		val |= LTQ_EBU_PCC_CON_IREQ_DIS;
+		break;
+
+	case IRQ_TYPE_EDGE_RISING:
+		val |= LTQ_EBU_PCC_CON_IREQ_RISING_EDGE;
+		break;
+
+	case IRQ_TYPE_EDGE_FALLING:
+		val |= LTQ_EBU_PCC_CON_IREQ_FALLING_EDGE;
+		break;
+
+	case IRQ_TYPE_EDGE_BOTH:
+		val |= LTQ_EBU_PCC_CON_IREQ_BOTH_EDGE;
+		break;
+
+	case IRQ_TYPE_LEVEL_HIGH:
+		val |= LTQ_EBU_PCC_CON_IREQ_HIGH_LEVEL_DETECT;
+		break;
+
+	case IRQ_TYPE_LEVEL_LOW:
+		val |= LTQ_EBU_PCC_CON_IREQ_LOW_LEVEL_DETECT;
+		break;
+
+	default:
+		pr_err("Invalid trigger mode %x for IRQ %d\n", flow_type,
+		       d->irq);
+		return -EINVAL;
+	}
+
+	ltq_ebu_w32(val, LTQ_EBU_PCC_CON);
+
+	return 0;
+}
+
+static void ltq_ebu_irq_handler(struct irq_desc *desc)
+{
+	struct irq_domain *domain = irq_desc_get_handler_data(desc);
+	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+
+	chained_irq_enter(irqchip, desc);
+
+	generic_handle_irq(irq_find_mapping(domain, 0));
+
+	chained_irq_exit(irqchip, desc);
+}
+
+static struct irq_chip ltq_ebu_irq_chip = {
+	.name = "EBU",
+	.irq_ack = ltq_ebu_ack_irq,
+	.irq_mask = ltq_ebu_mask_irq,
+	.irq_unmask = ltq_ebu_unmask_irq,
+	.irq_set_type = ltq_ebu_set_irq_type,
+};
+
+static int ltq_ebu_irq_map(struct irq_domain *domain, unsigned int irq,
+			   irq_hw_number_t hwirq)
+{
+	irq_set_chip_and_handler(irq, &ltq_ebu_irq_chip, handle_edge_irq);
+	irq_set_chip_data(irq, domain->host_data);
+
+	return 0;
+}
+
+static const struct irq_domain_ops ltq_ebu_irqdomain_ops = {
+	.map = ltq_ebu_irq_map,
+	.xlate = irq_domain_xlate_twocell,
+};
+
+static int ltq_ebu_add_irqchip(struct device_node *np)
+{
+	struct irq_domain *parent_domain, *domain;
+	int irq;
+
+	parent_domain = irq_find_host(of_irq_find_parent(np));
+	if (!parent_domain) {
+		pr_err("%pOF: No interrupt-parent found\n", np);
+		return -EINVAL;
+	}
+
+	domain = irq_domain_add_linear(np, 1, &ltq_ebu_irqdomain_ops, NULL);
+	if (!domain) {
+		pr_err("%pOF: Could not register EBU IRQ domain\n", np);
+		return -ENOMEM;
+	}
+
+	irq = irq_of_parse_and_map(np, 0);
+	if (!irq) {
+		pr_err("%pOF: Failed to map interrupt\n", np);
+		irq_domain_remove(domain);
+		return -EINVAL;
+	}
+
+	irq_create_mapping(domain, 0);
+
+	irq_set_chained_handler_and_data(irq, ltq_ebu_irq_handler, domain);
+
+	return 0;
+}
+
 static int __init ltq_ebu_setup(void)
 {
 	const struct ltq_ebu_data *ebu_data;
@@ -59,6 +201,7 @@ static int __init ltq_ebu_setup(void)
 	struct resource res_ebu;
 	struct device_node *np;
 	u32 val;
+	int ret;
 
 	np = of_find_matching_node_and_match(NULL, of_ebu_ids, &match);
 	if (!np)
@@ -83,6 +226,12 @@ static int __init ltq_ebu_setup(void)
 		ltq_ebu_w32(val, LTQ_EBU_BUSCON0);
 	}
 
+	if (of_property_read_bool(np, "interrupt-controller")) {
+		ret = ltq_ebu_add_irqchip(np);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
diff --git a/arch/mips/lantiq/irq.c b/arch/mips/lantiq/irq.c
index 115b417dfb8e..cb9ab51fa748 100644
--- a/arch/mips/lantiq/irq.c
+++ b/arch/mips/lantiq/irq.c
@@ -40,12 +40,6 @@
 /* the performance counter */
 #define LTQ_PERF_IRQ		(INT_NUM_IM4_IRL0 + 31)
 
-/*
- * irqs generated by devices attached to the EBU need to be acked in
- * a special manner
- */
-#define LTQ_ICU_EBU_IRQ		22
-
 #define ltq_icu_w32(vpe, m, x, y)	\
 	ltq_w32((x), ltq_icu_membase[vpe] + m*LTQ_ICU_IM_SIZE + (y))
 
@@ -300,11 +294,6 @@ static void ltq_hw_irq_handler(struct irq_desc *desc)
 	irq = __fls(irq);
 	hwirq = irq + MIPS_CPU_IRQ_CASCADE + (INT_NUM_IM_OFFSET * module);
 	generic_handle_irq(irq_linear_revmap(ltq_domain, hwirq));
-
-	/* if this is a EBU irq, we need to ack it or get a deadlock */
-	if ((irq == LTQ_ICU_EBU_IRQ) && (module == 0) && LTQ_EBU_PCC_ISTAT)
-		ltq_ebu_w32(ltq_ebu_r32(LTQ_EBU_PCC_ISTAT) | 0x10,
-			LTQ_EBU_PCC_ISTAT);
 }
 
 static int icu_map(struct irq_domain *d, unsigned int irq, irq_hw_number_t hw)
diff --git a/arch/mips/pci/pci-lantiq.c b/arch/mips/pci/pci-lantiq.c
index 1ca42f482130..a3f6ab94ee2c 100644
--- a/arch/mips/pci/pci-lantiq.c
+++ b/arch/mips/pci/pci-lantiq.c
@@ -190,10 +190,6 @@ static int ltq_pci_startup(struct platform_device *pdev)
 	ltq_pci_w32(ltq_pci_r32(PCI_CR_PCI_MOD) | (1 << 24), PCI_CR_PCI_MOD);
 	wmb();
 
-	/* setup irq line */
-	ltq_ebu_w32(ltq_ebu_r32(LTQ_EBU_PCC_CON) | 0xc, LTQ_EBU_PCC_CON);
-	ltq_ebu_w32(ltq_ebu_r32(LTQ_EBU_PCC_IEN) | 0x10, LTQ_EBU_PCC_IEN);
-
 	/* toggle reset pin */
 	if (gpio_is_valid(reset_gpio)) {
 		__gpio_set_value(reset_gpio, 0);
-- 
2.22.0

