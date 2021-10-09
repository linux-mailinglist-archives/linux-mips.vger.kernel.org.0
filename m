Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDDD4427693
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 04:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244690AbhJICWz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 22:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244509AbhJICWi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 22:22:38 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9016C061755;
        Fri,  8 Oct 2021 19:20:42 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id v11so4797996pgb.8;
        Fri, 08 Oct 2021 19:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9fJWAIDZMBnqyaJKloz+swm+vHzzjwQ8q/tXjCn73F0=;
        b=SzJB32ERexKcnc4C4x9hDpIfy0O4VItzue50HM4cKKD5Gadnyhf8uXegzSTrezL3Z7
         XowA8CHweVmv5m4Lpu733cs506OqQyJSJzoKvxwelE2U4MrGUPeeOdOohNLpBqxWvUNj
         90DHq8ceh0Uf2xf75KOWmPj4v7vt99MSjLsaKeaZncTaVLBrjAEfCYGCjegNC1IgcFto
         HyFUYoN/UJ8oJ61ToBbsmg48ayMjbmkcbS7RcREaRMKZM5lb6us/cTw8AxtcqAfVE2kl
         oWGa8fNcIrx4+Q0TBt055dUHyTX+CaRPufbLStJBcNF/jesBGKJBeY/Wl0ac/23bTkwU
         XwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9fJWAIDZMBnqyaJKloz+swm+vHzzjwQ8q/tXjCn73F0=;
        b=TNNlxT/Rf2stpDTzhPMHWcxSJ9zji/Ef9J6RzrcQ94UHWR8GlTXlKwgdUfzM/P6NIb
         MiDjcV8uFVM4OdvbSvsnRwoNeRaprv5q/eSzTv36maOXHZB2tj5/DdkBSZvvF1L9FdvC
         qzwYf50YzTqusPFVSjtvQNqV6XPsPvvuxPg0+77em62pnWP/fuKl2lo4JAvEMvzxq88o
         msuur4ZEc6ON9Wxi1xPcSkxqzzHbPlRXLjO0+Apb2TaWK55KvgRX8yJNcQj0C3hR8nsZ
         xXMVGAhfffyNCyxZT3dKD8xO2C506sLERQuj9AxSVxPGzDj981d5P1gB506ufEJz3HVU
         cDZg==
X-Gm-Message-State: AOAM5317SompDC6ax2BY1PdknrAJUKgJE53bIU/9I6t6aFVQ9aIqmAbZ
        +xiGv3pE3f7rayti0mRzLOdnP1W0+ac=
X-Google-Smtp-Source: ABdhPJzXy+7f0es9EghURGg8TvHh1mVwIe6bucOdCVqh1OIUwlGNbp2R3VsYxzh1zfze0kMlkdhPIA==
X-Received: by 2002:a63:ed4f:: with SMTP id m15mr7567625pgk.471.1633746041911;
        Fri, 08 Oct 2021 19:20:41 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id pi9sm444692pjb.31.2021.10.08.19.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 19:20:41 -0700 (PDT)
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
Subject: [PATCH v4 08/14] irqchip/irq-brcmstb-l2: Switch to IRQCHIP_PLATFORM_DRIVER
Date:   Fri,  8 Oct 2021 19:20:17 -0700
Message-Id: <20211009022023.3796472-9-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211009022023.3796472-1-f.fainelli@gmail.com>
References: <20211009022023.3796472-1-f.fainelli@gmail.com>
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

