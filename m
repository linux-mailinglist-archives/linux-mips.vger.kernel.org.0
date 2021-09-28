Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0801D41A576
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 04:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238626AbhI1Caq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 22:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238740AbhI1Cap (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Sep 2021 22:30:45 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27E3FC061575;
        Mon, 27 Sep 2021 19:29:07 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id c1so17576047pfp.10;
        Mon, 27 Sep 2021 19:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9fJWAIDZMBnqyaJKloz+swm+vHzzjwQ8q/tXjCn73F0=;
        b=avArYIgqveoiqNyD88bnUiDBLca1zT5jiBXVayToI+PO+qwNqTUXrQ6m9rJaQhc0sM
         eTw51QB31qIppvgLVeFAvLh+bf84SZTPDUx5ujF3OBNKCjzUHJ5nvrl5YYOF3VUowFpk
         yqVRPTjIN1GmDS0DjaAtqaGGzd9tbyzChbkxUKNCRfD40Bgo3okAVdsGU7wWkCPnhiOD
         3q/CecxnXb+P47LIbnJlZzhRXqizCVWUBsSRXkXriqWt+UBLFbyR0IiAC9VzSCapo7rJ
         5fZcNJQxSkC6p+L8rHdkIVJpCMZIrRVL70OFy6tvO2hvy7y6rQjnoXHDVTS+w3WQD7Dl
         MURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9fJWAIDZMBnqyaJKloz+swm+vHzzjwQ8q/tXjCn73F0=;
        b=rHF+BfWvqXsvFC/bb5fLoumkYB/frgy/251PcQdaNsrPYva9VE6gtqRAJrsCePj6pd
         zrOHrRMTc59vcKjJ0+VKkRJ/s4hzozPKct98YzwU0rM+l19zqBcBUYAlRihMptJKdC33
         bo0FB933E7dtKlXYE4kYS1B2MUZDOuQ7UglY96mY6c4ornMX/FNdsMHIlnNgCr/s9rfw
         NMVfX8yVIZ9q9I9/jNNNRxAoQTsSPC7/dkGONxw7n27GNrcEe3J7FY9FGgZVjrXm+pDj
         KzBP4hmxv+yqgp1tFwjIlNyiuNtxYKLjnuAM1dx4taYbRDcc2+5ZMOyUJ+u9TSgnd7If
         Fo3Q==
X-Gm-Message-State: AOAM532MQ2snJ7ICtz/yuQ3ffZ/nFHcKM/c3V2J1eWFcUUb4JLypPUgm
        PpLCwEIyLPtCoB7UOY0ZUcej8DLNipg=
X-Google-Smtp-Source: ABdhPJxrXOObRhpa/JQHSjoFBdJMwRgQiZH5DJq2XWAOm/lf0/ZIAcPd78EiklkJG/+okaWOReZnew==
X-Received: by 2002:a62:5a41:0:b0:448:152d:78bf with SMTP id o62-20020a625a41000000b00448152d78bfmr2825501pfb.77.1632796146397;
        Mon, 27 Sep 2021 19:29:06 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k14sm633261pji.45.2021.09.27.19.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 19:29:05 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE...),
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM PORT),
        linux-sh@vger.kernel.org (open list:SUPERH),
        linux-mips@vger.kernel.org (open list:BROADCOM BMIPS MIPS ARCHITECTURE),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE)
Subject: [PATCH v2 07/12] irqchip/irq-brcmstb-l2: Switch to IRQCHIP_PLATFORM_DRIVER
Date:   Mon, 27 Sep 2021 19:27:10 -0700
Message-Id: <20210928022715.369160-8-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928022715.369160-1-f.fainelli@gmail.com>
References: <20210928022715.369160-1-f.fainelli@gmail.com>
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

