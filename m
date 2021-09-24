Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A00541794B
	for <lists+linux-mips@lfdr.de>; Fri, 24 Sep 2021 19:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344261AbhIXRIz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Sep 2021 13:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344492AbhIXRIk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Sep 2021 13:08:40 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B499C061767;
        Fri, 24 Sep 2021 10:07:02 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id me1so7395653pjb.4;
        Fri, 24 Sep 2021 10:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9fJWAIDZMBnqyaJKloz+swm+vHzzjwQ8q/tXjCn73F0=;
        b=SyHll5tjtjFteeY+yNZa2zfZ4UGyoZgXgoVIOtQU98UGY9Bu9FIqQgcrh5jw34ofDU
         HS8R2uGWjKol9427ShrRJHXSXRzR89+5e/5JLsWj5jD55VFQXhN536zdIudI0f2vE8lO
         hwU0ccCw1denAoHHWK5ZSsTDn/OqqugDI7e8W5Wc8wfoM1IekqcDvKKYz/sJw/+Qol7j
         kl1nI3EaGsUL+XP8ITwpn8sUiUkz2WKFUSGfGOuv/49sT018ldV47ElU2PBbKyK3N+T2
         ltppUVH2RstPd8xsISig5C4LHlAYLva7SKlZ9wcjGJvL4SVGzDgWFsqjUvbAzylGBrED
         NbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9fJWAIDZMBnqyaJKloz+swm+vHzzjwQ8q/tXjCn73F0=;
        b=t3isVXw/Ixup0pxyhEVpL6UNNetlPYnKL8EqTYQUtzuLRxMri2Ec2B6Q+Ky7jBevE1
         1nVmECvDk2mntnzzDCgkeb/jKjCetnvIO/MNEz1iVC/OxYpfBkA5Hl0p/5Pb3OzJxC3T
         7mbkt8YncoHH2KI2Qg5eaC0WKvmDzWvtJoPUxyVVeL/lpVkKt5FW189wr6S7x/81ziip
         PBcFMKJH+yVDZX0GtLsYcrIWuH58ytD+lvGdodbQpckT4JRlkN4Aym0i3+Pq+Ju50vzm
         0JI2zyDC+6b3yx4E4944hQMr+Grzi1g5BlGyzogzXeYnS1Ff3tved73VDdI9DHYSlLcD
         Ulbw==
X-Gm-Message-State: AOAM532Y5WM2iBnBweTSJk/YBNZpQk+PgMEhn8e757uBt3odra+gnmvS
        fziX2mwfPXCMGzuSrFA4gdbi63I7ZnQ=
X-Google-Smtp-Source: ABdhPJymRrvQcwMm3TdMU5msjtmRB+vmxzsXl2PoMBpul3iAkZ1lkT+OXFuRZtScg3u9auXwb2UdEQ==
X-Received: by 2002:a17:902:684c:b0:13a:709b:dfaa with SMTP id f12-20020a170902684c00b0013a709bdfaamr9882250pln.61.1632503221414;
        Fri, 24 Sep 2021 10:07:01 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k22sm9659312pfi.149.2021.09.24.10.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 10:07:01 -0700 (PDT)
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
Subject: [PATCH 05/11] irqchip/irq-brcmstb-l2: Switch to IRQCHIP_PLATFORM_DRIVER
Date:   Fri, 24 Sep 2021 10:05:40 -0700
Message-Id: <20210924170546.805663-6-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924170546.805663-1-f.fainelli@gmail.com>
References: <20210924170546.805663-1-f.fainelli@gmail.com>
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

