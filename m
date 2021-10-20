Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E327435318
	for <lists+linux-mips@lfdr.de>; Wed, 20 Oct 2021 20:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbhJTSw4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Oct 2021 14:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231344AbhJTSww (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 Oct 2021 14:52:52 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA81EC06174E;
        Wed, 20 Oct 2021 11:50:37 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id i1so180213plr.13;
        Wed, 20 Oct 2021 11:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IqTvFkxEB42F4FY7x5fTTUp3BY0gcheCImqFREsoxYU=;
        b=bjEeCXoS/MV2lILX7sx3x57v6O7dAMDJp4lPpZAWJfBF4jTN4UqqTHl+QrRUOY/s+L
         bdnlLfQyQiss5MK7iviDHTvEWo77aq3XBNtiA939ZEAS0hDKWLgm3+Rgqsx1tnVVFHkJ
         4FIE8M83MSM/nzj4X/KodUG9TcOG24j9Kc2OHdAYUvbye/Sf4jn1HadHogHTuq2bHsfY
         JoVZiUFBKpc6Mt8Flx9+paujem6KfrjNksNkWBudVy3hYzjAx6vljCSSzVQZa+NOw8s5
         0w9E/xfYYJ7BbNQMZlu++oZJ5MzRO6qKcBL1eiaGrJXSOEi6Hb7QFpRkHgbickh/D3RE
         7UDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IqTvFkxEB42F4FY7x5fTTUp3BY0gcheCImqFREsoxYU=;
        b=gyTvaC/BjU6gtgM+j1tSz5zA2diFbme+L0EmFQcY6shJMepxMZTyXBlOCZg/6+Yi7d
         qSfY6gRU4kwD8KwxK6PQcHeAq0B/nEb5nyn92/VH/cnaIPD74LnsC2JrcICnPRT1F085
         7Z9DsLif3+9OoUJFZ2t+LT5gCeoddyx0q/UA4aLCxq0CQBNJG2lmK7sXb4LyERKe/KfR
         a/ANud26q3Bw1AJIN9Tl2Ysml3/JwD+PVCdOwfe92nw5W0dnFJoIgwtrjhA45GPOYxRx
         k1FKBeJB1a39pzwkZQsmzz1IPsJ8H5cks2/F7Xf1rxF/jpzhbS+LSEJhiuwVHgCsUviO
         cBtQ==
X-Gm-Message-State: AOAM530Y+9vsO06Y4eHSPKIRKEnx13JbK6iRopfHQpwYaVZfYRfXkqhx
        1qzXlrw9LGkBf5TpvFCGOv05fCIjSuM=
X-Google-Smtp-Source: ABdhPJx3jyDsZ+IgZjNzgGUFZlwRLmIJv5uJ49BROBDuNB8QqR9XLHCzzN1cs4yHcgRKNe2KypyH0g==
X-Received: by 2002:a17:90b:350f:: with SMTP id ls15mr716871pjb.220.1634755836924;
        Wed, 20 Oct 2021 11:50:36 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id o127sm3267863pfb.216.2021.10.20.11.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 11:50:36 -0700 (PDT)
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
Subject: [PATCH v6 06/13] irqchip/irq-bcm7038-l1: Switch to IRQCHIP_PLATFORM_DRIVER
Date:   Wed, 20 Oct 2021 11:48:52 -0700
Message-Id: <20211020184859.2705451-7-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020184859.2705451-1-f.fainelli@gmail.com>
References: <20211020184859.2705451-1-f.fainelli@gmail.com>
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
 drivers/irqchip/Kconfig          | 4 +++-
 drivers/irqchip/irq-bcm7038-l1.c | 6 +++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 4d5924e9f766..3022f6137096 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -115,7 +115,9 @@ config BCM6345_L1_IRQ
 	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
 
 config BCM7038_L1_IRQ
-	bool
+	tristate "Broadcom STB 7038-style L1/L2 interrupt controller driver"
+	depends on ARCH_BRCMSTB || BMIPS_GENERIC
+	default ARCH_BRCMSTB || BMIPS_GENERIC
 	select GENERIC_IRQ_CHIP
 	select IRQ_DOMAIN
 	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
index 357570dd8780..a62b96237b82 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -455,4 +455,8 @@ static int __init bcm7038_l1_of_init(struct device_node *dn,
 	return ret;
 }
 
-IRQCHIP_DECLARE(bcm7038_l1, "brcm,bcm7038-l1-intc", bcm7038_l1_of_init);
+IRQCHIP_PLATFORM_DRIVER_BEGIN(bcm7038_l1)
+IRQCHIP_MATCH("brcm,bcm7038-l1-intc", bcm7038_l1_of_init)
+IRQCHIP_PLATFORM_DRIVER_END(bcm7038_l1)
+MODULE_DESCRIPTION("Broadcom STB 7038-style L1/L2 interrupt controller");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

