Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE4341795B
	for <lists+linux-mips@lfdr.de>; Fri, 24 Sep 2021 19:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347518AbhIXRJJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Sep 2021 13:09:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344328AbhIXRId (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Sep 2021 13:08:33 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17CA2C06161E;
        Fri, 24 Sep 2021 10:07:00 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id k23so7438109pji.0;
        Fri, 24 Sep 2021 10:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NSYiGK57G6dx4SCVfIKz/VqfWjkODoJWY0CRhuUYqa0=;
        b=VKf+KiXEVgf8y5ZxFuT4bIUicXOGoJMOD1tqP7Nc1TZB9ij6Vf3ruzCWNW02Hzhk/N
         N9hwdbhuVXyxLnwo88cKBf4wGPMN7kec1codqL2+01H08g6a9cGNGQAJsW+WU0YDAGHX
         PJRXz23RPN14hhMETRtsqPHUJNOgLCFv5kbGsXRHW8P8TJHxEzgcEpoOTxzeaZjdkxxr
         ovziSoE7z7aenFOVUGdK2VT/SbMis2yPfHCCZzmbwV+26yUMeYOmwdbu4f1fuqas5rH6
         gNzPNLjy5TgLMpnKQA8NXXaNyqpiRHxSekjgofPPjWSlHb8PpFL8PMEJrdnevC2TAAI6
         nV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NSYiGK57G6dx4SCVfIKz/VqfWjkODoJWY0CRhuUYqa0=;
        b=obuQVNcFSzIYxdbHU/ydk+FtMsrHpIkhNUjuK69ElMCK+C4cyWYlYQV5Sa5jXwDKwR
         bML/RhCONhfe9+p8Pkkv3qRJ048WjpnwPT13FIkbB0Use5W7/0P1bf5B3+H7oR+wMh/U
         M142lU+Pi76KfwLu78cX0UPHdVYTem7t5+n57nYovgIh29nHcvWMcc7bh/NxJEKbPmIw
         jniczeW7gLvNDBtWigZsRWLVAej6EXgp7VANTi8SvX31gs34oIm5CEjOBTRsJpXllB67
         oe/g9W1xqt53rFu5FNvbj71OOK40No4h6O9KA46lKcCVyn+H+o6QKgodtUyDgFxslXam
         0Dig==
X-Gm-Message-State: AOAM532ndsL25OVnwutfuqgcQ0vhD0jhowIYcMN7WHoeZHFAQeRstpOU
        umQwACXb9jr5Rn1U6p0YGr31lETuC8Q=
X-Google-Smtp-Source: ABdhPJxkKpI23LL6xymzcWOXEzd12oGL/wfBBT0Vy18Wbxbu4pOv4iGqWb2tl0gfdW0Hjh5sX8A5bw==
X-Received: by 2002:a17:902:b717:b029:11a:fae3:ba7c with SMTP id d23-20020a170902b717b029011afae3ba7cmr10013612pls.28.1632503219371;
        Fri, 24 Sep 2021 10:06:59 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k22sm9659312pfi.149.2021.09.24.10.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 10:06:59 -0700 (PDT)
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
Subject: [PATCH 04/11] irqchip/irq-bcm7038-l1: Switch to IRQCHIP_PLATFORM_DRIVER
Date:   Fri, 24 Sep 2021 10:05:39 -0700
Message-Id: <20210924170546.805663-5-f.fainelli@gmail.com>
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
index a035c385ca7a..80e74cf3e165 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -484,4 +484,8 @@ static int __init bcm7038_l1_of_init(struct device_node *dn,
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

