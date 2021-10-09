Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9477942768C
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 04:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244418AbhJICWl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 22:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244455AbhJICWg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 22:22:36 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5754EC061774;
        Fri,  8 Oct 2021 19:20:39 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id pi19-20020a17090b1e5300b0019fdd3557d3so9090698pjb.5;
        Fri, 08 Oct 2021 19:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IqTvFkxEB42F4FY7x5fTTUp3BY0gcheCImqFREsoxYU=;
        b=k0+o3REhJGZc03nzXzkRd9Oio+6a3BR7RuZnftlFNI6R3hc4lz/gKSB3aByCVzQ80n
         TKD8iHe7A8CRJHpTYEQtbXKKHFfSY/Jj7d6EhKesZAoiFgGQE+oMekunYBq0PaSRfKmZ
         NBt7Q1k+5ZbrIaJPhCARgjiLPcy+i2jIAH49h6z/zml6Afq7fQtEoFT+xzcxD4YrqdjG
         9+pROqJT03lnLivwp6BfFiS3fnZI11xAwVJ8Z2LkUGnC3Q/OPSUYIoY5E68EXLgPlVl0
         NpDvmj/XBJKUBTXAKusu+ZbXMP71NeHvf5Z3sZ8YpHcwuLxpvn1KKSVwT7TanuScHgWq
         gxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IqTvFkxEB42F4FY7x5fTTUp3BY0gcheCImqFREsoxYU=;
        b=S2CqGJti+pWuO4vBQe61KP1+bXJ0NIMYLL5lFFlwCl8A66e1Uo15U7lTotPVRle8pO
         TDdi2S6Wv+aKASUgTb+7ZEqLEOzLOiB382WuTx719v48Ko8zraDZGpk97TCjkyC+lDAY
         E3GW7cufYzYck//D8JHbJRhNULLOaSx/AxyGm/wyPP8hD3nHujBM66/l2I3WaUT8OpRk
         I8AetgcV+dE2r31EQn4Lm5MpseRtASj2+MwZkcG8vI8BEaOFFSfI1ZqEAGZ9A3sLwaHM
         KrQdoM2iU/3vcBAIUW9PaDOi/Uf+leyDcd6oqH/ZJVIVqmFRdnlQR5O0tB3LrR+4FULH
         5vUQ==
X-Gm-Message-State: AOAM5300+sh97YQtxL6q0HHcedRwtX6JKEYvAQYRfwi4kQcCzsdw/pKm
        ZEH/1V8Q+KWRECUYqDpyNsceUAJ8iHo=
X-Google-Smtp-Source: ABdhPJzf9Q1oZfg5pPn97RR5PTRl6yYlUHYfjjRwh0BfIT2/Gwm/ScNxwnrnOSDAYZ337GekmMQA4w==
X-Received: by 2002:a17:902:6b0b:b0:13a:18bf:1ece with SMTP id o11-20020a1709026b0b00b0013a18bf1ecemr12351269plk.49.1633746038565;
        Fri, 08 Oct 2021 19:20:38 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id pi9sm444692pjb.31.2021.10.08.19.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 19:20:38 -0700 (PDT)
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
Subject: [PATCH v4 06/14] irqchip/irq-bcm7038-l1: Switch to IRQCHIP_PLATFORM_DRIVER
Date:   Fri,  8 Oct 2021 19:20:15 -0700
Message-Id: <20211009022023.3796472-7-f.fainelli@gmail.com>
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

