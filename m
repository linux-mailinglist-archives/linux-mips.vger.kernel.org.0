Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7014643410E
	for <lists+linux-mips@lfdr.de>; Tue, 19 Oct 2021 23:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbhJSWBg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 18:01:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbhJSWBa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Oct 2021 18:01:30 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8572C061768;
        Tue, 19 Oct 2021 14:59:16 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id m21so20602581pgu.13;
        Tue, 19 Oct 2021 14:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c8Bh3Ui9YNGBrxgDKS29OGaqvTCLClNr/nEGx5BqRmI=;
        b=dgqh2Eqhu+SfYYXYGbhsVilHapzEJ4OIDr1BtT0zoO05zpsy/wA5LbMzHctCKYnuQx
         Q0bIqbzAzKQwxjJn26zO+bYhhJlyY+53hoVZ5q/J3KsWY58jm0PILctaAQ7Nr24PFhLb
         HTQY2Av9jkP/SmrmdIShdLYdbLf4d/GCs1HihLWv8thq0MFbiapI1qzzSbGbA9uW9tqZ
         pfxFRyeAb40kvS1knlN/uOK81VJZNbYsu+cYH6xcsk6jRvma0KE16RmMH7VxhGY5NPQ3
         kk1Z7As/8cfqHlKefmp1xpcoDjElcmxox4m+7WFBpizRLpwQc1K407bngwoZK7CCQ7ca
         LZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c8Bh3Ui9YNGBrxgDKS29OGaqvTCLClNr/nEGx5BqRmI=;
        b=34J8QDm0q64cPC1c0LO3n4KLj6SMv4xUVaH7gRejB0DrySZfpzTboz1VDiIctdmLWy
         7Jlug4NnTfOm7CyC19MHF/GscOTflqwNradfej7RB0yTtUaQHnqYWvdJzFevnZaI+4fU
         CmPC5Ui/gIBNgNWV1YRJEPLMDDC+6dsznjhm+4p39ui2wKVmvVWd5QgzA3rZqkcKjrhR
         QatCBtsGSfWMWuzRijXMqN5fAzH1QARwDfyT6j01gnXy67OECYpvIxC673psexMIBrYU
         saf/TesFukbNbPd+7VyQ7xzrIzwhKirTuNwynjipvqeo0ApE6UqSH1DV9TiYvTjYFbyT
         QknA==
X-Gm-Message-State: AOAM5309bk0frNv6fagwiwGGQC07mwafCRKiDaR9hW/lki+XxbrlQ9aI
        VpsBCnmF3Icbt3O8NYPATVrG6U3Xzro=
X-Google-Smtp-Source: ABdhPJyau3kDcMWS70+R/w5sw3Fb11r/gal7Glmb2cGuuWx6ZK/a1vJ8yzGBjBB5Xp/mGuHAYq52hA==
X-Received: by 2002:a63:724b:: with SMTP id c11mr9662708pgn.59.1634680755869;
        Tue, 19 Oct 2021 14:59:15 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id bf7sm139325pjb.14.2021.10.19.14.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 14:59:15 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE...),
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM
        SUB-ARCHITECTURES), linux-mips@vger.kernel.org (open list:MIPS),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE)
Subject: [PATCH v5 09/14] irqchip/irq-brcmstb-l2: Switch to IRQCHIP_PLATFORM_DRIVER
Date:   Tue, 19 Oct 2021 14:58:50 -0700
Message-Id: <20211019215855.1920099-10-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019215855.1920099-1-f.fainelli@gmail.com>
References: <20211019215855.1920099-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Allow the user selection and building of this interrupt controller
driver as a module since it is used on ARM/ARM64 based systems as a
second level interrupt controller hanging off the ARM GIC and is
therefore loadable during boot.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/irqchip/Kconfig          |  4 +++-
 drivers/irqchip/irq-brcmstb-l2.c | 22 +++++++++++++---------
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 3022f6137096..dfe54bf9b35f 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -128,7 +128,9 @@ config BCM7120_L2_IRQ
 	select IRQ_DOMAIN
 
 config BRCMSTB_L2_IRQ
-	bool
+	tristate "Broadcom STB generic L2 interrupt controller driver"
+	depends on ARCH_BCM2835 || ARCH_BRCMSTB || BMIPS_GENERIC
+	default ARCH_BCM2835 || ARCH_BRCMSTB || BMIPS_GENERIC
 	select GENERIC_IRQ_CHIP
 	select IRQ_DOMAIN
 
diff --git a/drivers/irqchip/irq-brcmstb-l2.c b/drivers/irqchip/irq-brcmstb-l2.c
index 8e0911561f2d..06364ba67d1d 100644
--- a/drivers/irqchip/irq-brcmstb-l2.c
+++ b/drivers/irqchip/irq-brcmstb-l2.c
@@ -271,20 +271,24 @@ static int __init brcmstb_l2_intc_of_init(struct device_node *np,
 }
 
 static int __init brcmstb_l2_edge_intc_of_init(struct device_node *np,
-	struct device_node *parent)
+					       struct device_node *parent,
+					       struct platform_device *pdev)
 {
 	return brcmstb_l2_intc_of_init(np, parent, &l2_edge_intc_init);
 }
-IRQCHIP_DECLARE(brcmstb_l2_intc, "brcm,l2-intc", brcmstb_l2_edge_intc_of_init);
-IRQCHIP_DECLARE(brcmstb_hif_spi_l2_intc, "brcm,hif-spi-l2-intc",
-		brcmstb_l2_edge_intc_of_init);
-IRQCHIP_DECLARE(brcmstb_upg_aux_aon_l2_intc, "brcm,upg-aux-aon-l2-intc",
-		brcmstb_l2_edge_intc_of_init);
 
 static int __init brcmstb_l2_lvl_intc_of_init(struct device_node *np,
-	struct device_node *parent)
+					      struct device_node *parent,
+					      struct platform_device *pdev)
 {
 	return brcmstb_l2_intc_of_init(np, parent, &l2_lvl_intc_init);
 }
-IRQCHIP_DECLARE(bcm7271_l2_intc, "brcm,bcm7271-l2-intc",
-	brcmstb_l2_lvl_intc_of_init);
+
+IRQCHIP_PLATFORM_DRIVER_BEGIN(brcmstb_l2)
+IRQCHIP_MATCH("brcm,l2-intc", brcmstb_l2_edge_intc_of_init)
+IRQCHIP_MATCH("brcm,hif-spi-l2-intc", brcmstb_l2_edge_intc_of_init)
+IRQCHIP_MATCH("brcm,upg-aux-aon-l2-intc", brcmstb_l2_edge_intc_of_init)
+IRQCHIP_MATCH("brcm,bcm7271-l2-intc", brcmstb_l2_lvl_intc_of_init)
+IRQCHIP_PLATFORM_DRIVER_END(brcmstb_l2)
+MODULE_DESCRIPTION("Broadcom STB generic L2 interrupt controller");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

