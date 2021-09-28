Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC56141A56B
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 04:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238721AbhI1CaV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 22:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238698AbhI1CaV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Sep 2021 22:30:21 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3943C061575;
        Mon, 27 Sep 2021 19:28:42 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id rm6-20020a17090b3ec600b0019ece2bdd20so1606796pjb.1;
        Mon, 27 Sep 2021 19:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jyog/3toJk4CePtjAlHdqTMKSqb5xrYzdsOy22XZ4IQ=;
        b=g8EXPYUipqSUrO7pNlz0kkvFZ1U2AqQJugKKvuytvdMesKuLN6MBcrxlSQRNurHQkL
         zj91YK8ArdXtrz9YkMEKi5z1w0oerBNP1RYQ4C34YbrxkjIdIQC5qvNCIrdH0k9ItA6R
         17DzO5n/mDgIe+7M0YrpCnmBUx2nWdoaGd52nVrh0XotFacKROt/sfvpAlYADIUeVOlH
         zrFvJ9KkAQzWlf36m5lchwFdZTE6gefxsQtiQTSJSCpQIu/2gMQ4Dbw4UdfvdBM0MoTY
         2whkBoOWD+MJvmv0PRFZ2akd3JmS9u5ACeCgqjDXRm/JUX+lPyQ4k8wUn3StGLvl9Sj9
         EwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jyog/3toJk4CePtjAlHdqTMKSqb5xrYzdsOy22XZ4IQ=;
        b=ytRuDKN1EiLDaLT0NxG0PpmDdEBAy1MZaHG0T76LPYm1O1z+07iRkMCGsYHxz/+KHg
         fpm3IhafyA21lc2zSQY2InSYVhGKSXyoR96brZAEsdehKgAlkAg4p9b9ETqX38MRAPj4
         S/F/kGIHtY6HYP/sDIJfdpOw+pRqL25h2WjrTa3u1ZPKsJ4Jg71tJGT0eeEbGLmsA3zH
         Qs6pIYvWmmDPl58xj9g+6b69K8U8z2ZIdyNWoJ/Jy70eTUZTqw0eI+NK2V4Wyy0R8ayQ
         A0n2GFSh3mCwMkwsc0Fx6AvsmovMF+vwT8o+r57cxEBpOsosiMp/IRJmI9yYcsfXjunO
         xoBw==
X-Gm-Message-State: AOAM532YxzgE/dQAYDEPaP0R9Pq9ePhzafkOUJBpFeTTDtNKKB7bwlKZ
        uaeBBW7XZNINtPlurOQqYhuqaEEr2Io=
X-Google-Smtp-Source: ABdhPJxuGf3jmYWizduu7tfXB0TM2K00czhL7r+Brk9EanH/GJJXyA+2eq5YnaTZJzNy/OleXJCbRA==
X-Received: by 2002:a17:902:b696:b0:13a:7871:55f5 with SMTP id c22-20020a170902b69600b0013a787155f5mr2993207pls.60.1632796121950;
        Mon, 27 Sep 2021 19:28:41 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k14sm633261pji.45.2021.09.27.19.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 19:28:41 -0700 (PDT)
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
Subject: [PATCH v2 05/12] irqchip/irq-bcm7038-l1: Switch to IRQCHIP_PLATFORM_DRIVER
Date:   Mon, 27 Sep 2021 19:27:08 -0700
Message-Id: <20210928022715.369160-6-f.fainelli@gmail.com>
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
index 14caf32dc23e..78f029bac129 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -454,4 +454,8 @@ static int __init bcm7038_l1_of_init(struct device_node *dn,
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

