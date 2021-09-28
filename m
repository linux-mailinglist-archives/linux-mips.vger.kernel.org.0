Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7006541B5EE
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 20:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242283AbhI1SY2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 14:24:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242235AbhI1SYX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Sep 2021 14:24:23 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 063C8C061771;
        Tue, 28 Sep 2021 11:22:35 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id j14so14795015plx.4;
        Tue, 28 Sep 2021 11:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9fJWAIDZMBnqyaJKloz+swm+vHzzjwQ8q/tXjCn73F0=;
        b=UXEXvsWOSOD9Rkz42uQQWztnY1ts7XJsOzEqnZCE2MckxsmUpkD60QeGaRYzm2USi/
         cC0UKcT1jFejXeUXZvLgkXhLHL3BqVF8tAin6V38JlmX+W77dyCK7vryxfdKtY5BMCn9
         vWQLajx33do8DgClL3taGH1kztupEaPHmrP3qusHga2Pwk5LFCnz2eDCBcQZJ+KY99+G
         hC6ECU4yzHZrcRcpSCZaV1U+kV+4dmnF+FzvZCgoKGsGC1fQvVGMizt2XjpzdzJstPEx
         ambD0C/fWfAcuSIf6o621SeMZMbZ3dhuVnXJ+vQqW5K4hiD9OLnyjGXzzk63R3/YcJdG
         7umw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9fJWAIDZMBnqyaJKloz+swm+vHzzjwQ8q/tXjCn73F0=;
        b=GiggU1ac+vIwfsnfHMD31ZXR39hCEREbrjH/3RMyPfsN/2m7yw3yExc4VeZd2idrpt
         Mtq2SLdT55ldLVzNPIpiBgYbOeW/YIM6Edao5wCilYgyDCR3LD+YyyzOld76qK4y+Qv4
         nlCZlSB3xw3xratiDSgA0Z0t0KkHPBT7uUetRUcw1uvjrtj0M3cT5oQe0+JOsQBnP2st
         W1HZdDj3WEiePkqzF+N5yVS+wv10D1ECmK6nWcHyOJVrM8b0C9GzTdxYEnaDol2JWw4Z
         ku3B46bczGWOMq4BR+xTqkxRUjWC/ibgbUkAgobPgf4TbsdyaY4oSKG/lgUhc9i8GmEN
         i3cA==
X-Gm-Message-State: AOAM5309v6HmHBll8Xkb/Xm3Z+VvP7BbU2gJWDV0bFuBFhfXpBPPJUym
        uKEWx1JJs6gfQ2Yc+56/k0V/5BoqviU=
X-Google-Smtp-Source: ABdhPJxwCFI4xny9h2gbQUvj4yk92qILQ/9rV46CpfqykWaxaqOZ5IE439UtP0Y+KLfNPFTKxEBl3A==
X-Received: by 2002:a17:90b:102:: with SMTP id p2mr1502507pjz.222.1632853354215;
        Tue, 28 Sep 2021 11:22:34 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id x19sm20855288pfn.105.2021.09.28.11.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 11:22:33 -0700 (PDT)
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
Subject: [PATCH v3 08/14] irqchip/irq-brcmstb-l2: Switch to IRQCHIP_PLATFORM_DRIVER
Date:   Tue, 28 Sep 2021 11:21:33 -0700
Message-Id: <20210928182139.652896-9-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928182139.652896-1-f.fainelli@gmail.com>
References: <20210928182139.652896-1-f.fainelli@gmail.com>
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
 drivers/irqchip/irq-brcmstb-l2.c | 16 +++++++++-------
 2 files changed, 12 insertions(+), 8 deletions(-)

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
index 8e0911561f2d..e4efc08ac594 100644
--- a/drivers/irqchip/irq-brcmstb-l2.c
+++ b/drivers/irqchip/irq-brcmstb-l2.c
@@ -275,16 +275,18 @@ static int __init brcmstb_l2_edge_intc_of_init(struct device_node *np,
 {
 	return brcmstb_l2_intc_of_init(np, parent, &l2_edge_intc_init);
 }
-IRQCHIP_DECLARE(brcmstb_l2_intc, "brcm,l2-intc", brcmstb_l2_edge_intc_of_init);
-IRQCHIP_DECLARE(brcmstb_hif_spi_l2_intc, "brcm,hif-spi-l2-intc",
-		brcmstb_l2_edge_intc_of_init);
-IRQCHIP_DECLARE(brcmstb_upg_aux_aon_l2_intc, "brcm,upg-aux-aon-l2-intc",
-		brcmstb_l2_edge_intc_of_init);
 
 static int __init brcmstb_l2_lvl_intc_of_init(struct device_node *np,
 	struct device_node *parent)
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

