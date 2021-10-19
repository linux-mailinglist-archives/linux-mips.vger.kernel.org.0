Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E83E434107
	for <lists+linux-mips@lfdr.de>; Tue, 19 Oct 2021 23:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbhJSWB3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 18:01:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbhJSWB0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Oct 2021 18:01:26 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 488C7C06161C;
        Tue, 19 Oct 2021 14:59:13 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id m26so1172565pff.3;
        Tue, 19 Oct 2021 14:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aWPYyECBOs5OYjE8k6irOqRBKiYPlvj6VE98fHuBoEM=;
        b=gZJWRC+2dFqFJj4c/rZEMg7264OkMv1n7MpdwjL+0E5AyiCh7SwkFyhVWQrKQxvFln
         BoJWZLAvC0rh06ocnMSl8dSZzgjd/fWRf9dWTk4b+oQlmmojeV9XJx7mZ0qUaQs8skcS
         DGv9/lu7KmhHmXvVjGo4u76T0nPOwcvWxCWJJ/50ZZvCZQCG+FK1EDpdJ5drIGB9jf5P
         sMFZJOooOtzmlEI9zWLMbZKYXVKlxSVf8XgwjWB0dUKUrCxHvskWF37pd/oKcPWhPZbJ
         V0pxx9lLTvUFgKtkKjhkJQnZIEPK/dFfbdiEh9IJIKCl6BIkBXz2aZAz0J0VWwnU4Iv2
         uPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aWPYyECBOs5OYjE8k6irOqRBKiYPlvj6VE98fHuBoEM=;
        b=uuCf4ZSeJ4gGZi3GCxGbZ228jiEsci2fL+IfSp1YhIiiV0z5Q2pjaMKJZs4NwaYGfD
         y+KqMPD5JzVyAlEaNth2387olYt2gX230F4GTkaEfReOxYP489Xudal9/UTrePP3HCoF
         Kuy8abzHrDpJiz5MGj/zw9fGI0Q1kXpfWHaLSQjfM9eBzSv7MEFHyHBQKQdEyMTbgmID
         0d6wI4yz+VLZJ/Y6MhUSe5Xhzrx9Ba5AdcCcub1xlUI6e7dRrjK0W2BHW2OpH/sGigV8
         xh3Abg5ys2uF0BcItN6Bgtq3ApVuvylOcZlGF1tJmadlSrKeT9w2FZ9Fh6Lx07QvWp+O
         UeIA==
X-Gm-Message-State: AOAM531Plzxx1PurTdrAEMCD3TXFUd0PWjsBHqaKrds/jJQ562nL7nvC
        1EqUcRyNCZCSALSrp43WVgZVs3SYHog=
X-Google-Smtp-Source: ABdhPJy8A7uayRH/1ly9xr+VoiYI9yqmLB8Gb5p6PceSN1VUrSXpmwLJnuuudGx3zOEDJiGe6n11qQ==
X-Received: by 2002:a62:7752:0:b0:44c:eb65:8561 with SMTP id s79-20020a627752000000b0044ceb658561mr2386280pfc.43.1634680752487;
        Tue, 19 Oct 2021 14:59:12 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id bf7sm139325pjb.14.2021.10.19.14.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 14:59:11 -0700 (PDT)
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
Subject: [PATCH v5 07/14] irqchip/irq-bcm7038-l1: Switch to IRQCHIP_PLATFORM_DRIVER
Date:   Tue, 19 Oct 2021 14:58:48 -0700
Message-Id: <20211019215855.1920099-8-f.fainelli@gmail.com>
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
 drivers/irqchip/Kconfig          | 4 +++-
 drivers/irqchip/irq-bcm7038-l1.c | 9 +++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

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
index 357570dd8780..f1e6e14145d2 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -397,7 +397,8 @@ static const struct irq_domain_ops bcm7038_l1_domain_ops = {
 };
 
 static int __init bcm7038_l1_of_init(struct device_node *dn,
-			      struct device_node *parent)
+				     struct device_node *parent,
+				     struct platform_device *pdev)
 {
 	struct bcm7038_l1_chip *intc;
 	int idx, ret;
@@ -455,4 +456,8 @@ static int __init bcm7038_l1_of_init(struct device_node *dn,
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

