Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3CD141A579
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 04:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238640AbhI1CbA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 22:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238650AbhI1Ca6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Sep 2021 22:30:58 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53D2AC061575;
        Mon, 27 Sep 2021 19:29:19 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 17so19626931pgp.4;
        Mon, 27 Sep 2021 19:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3QThqxTZ5uzX8g3SWHj4WUPibxza6P9n5f90ZfsEf6I=;
        b=Sc/fOiG5FBGWfD5Mpa7eQeAjpUOeeIAanPYOEnXV7MsFIytNZUAPeGAK2MGtkwMczA
         nMW8dZ3yeNayGVC7uSbak+6ixei0Je+rr23F+J7R3qI4qhpTNcWcTp0LuhkF37OG979M
         iabGp88RfBqq84xEfWA+p+SyCIyFGN+uAPz7WunxzeU6EVhSrsYOD+hDYpy6G4HnZTia
         M3HEf30SrxwY+5+1AyAvgjgySCzfTY2CjiWSMcBXYFUE0GfDEV326E91R7hLr8DzbTOi
         lZJbocsTYhEbCk+uLRG/nHGoupBmdDdxZ0ncVISl2DwZ7xA2G2aIKkX5fVgKM0eyq+4E
         xOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3QThqxTZ5uzX8g3SWHj4WUPibxza6P9n5f90ZfsEf6I=;
        b=DHAfNDW5VOJ+l6xAzYYe7dj9PbTV5tgvAtKuG8HTaAmvaRV7Wjvg+MpFbxD7aA4+iX
         WIRqIgQ/eDVc7IQ4/BmIUv7Zk48f3DHcS+6N4EGXdUtlHmFiUMi58nvHNz5+KegXrIlx
         gGjOgD90tH/nd3bLrajePROqXnwTDx3qXHUlDIc1jJ9PqvNqpkZl6X3CTLEbpvX+moVI
         4ZNXbd2d071+i2RDcvR+0Bp0WmKWUlubfDhQXivnPBPMb6u4kGmV8g2LFwx/NiQRh6Nn
         uqIezBDm4OfZ1mVN6Vq9dwURln2u41cv+tNpJcXXyIHtRlEKydnnxqtEnpQRQY93cc+i
         3o2A==
X-Gm-Message-State: AOAM532iuB0WHBmqIm1g8Y4JJ/+n8C8HY+shEL4rmKrCoMIBnpo2xct6
        xYJGDkS2IVXPJOR4bar64Pm1h95bz4M=
X-Google-Smtp-Source: ABdhPJyP2VEu5OlJ0sDp5X5h65NyS9eQ9y1/4IxbmDdxSNduktAW9wMXSswYWVD1gjzruN8Ug7oIOw==
X-Received: by 2002:a63:b341:: with SMTP id x1mr2420629pgt.69.1632796158534;
        Mon, 27 Sep 2021 19:29:18 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k14sm633261pji.45.2021.09.27.19.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 19:29:18 -0700 (PDT)
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
Subject: [PATCH v2 08/12] irqchip: Provide platform_device to of_irq_init_cb_t
Date:   Mon, 27 Sep 2021 19:27:11 -0700
Message-Id: <20210928022715.369160-9-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928022715.369160-1-f.fainelli@gmail.com>
References: <20210928022715.369160-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Provide the platform device mapping to the interrupt controller node to
the of_irq_init_cb_t callback such that drivers can make use of it.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/irqchip/irqchip.c | 2 +-
 drivers/of/irq.c          | 2 +-
 include/linux/of_irq.h    | 5 ++++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irqchip.c b/drivers/irqchip/irqchip.c
index 3570f0a588c4..289784eefd00 100644
--- a/drivers/irqchip/irqchip.c
+++ b/drivers/irqchip/irqchip.c
@@ -55,6 +55,6 @@ int platform_irqchip_probe(struct platform_device *pdev)
 	if (par_np && !irq_find_matching_host(par_np, DOMAIN_BUS_ANY))
 		return -EPROBE_DEFER;
 
-	return irq_init_cb(np, par_np);
+	return irq_init_cb(np, par_np, pdev);
 }
 EXPORT_SYMBOL_GPL(platform_irqchip_probe);
diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 352e14b007e7..18f3f5c00c87 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -538,7 +538,7 @@ void __init of_irq_init(const struct of_device_id *matches)
 				 desc->dev,
 				 desc->dev, desc->interrupt_parent);
 			ret = desc->irq_init_cb(desc->dev,
-						desc->interrupt_parent);
+						desc->interrupt_parent, NULL);
 			if (ret) {
 				of_node_clear_flag(desc->dev, OF_POPULATED);
 				kfree(desc);
diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index aaf219bd0354..89acc8b089f0 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -9,7 +9,10 @@
 #include <linux/ioport.h>
 #include <linux/of.h>
 
-typedef int (*of_irq_init_cb_t)(struct device_node *, struct device_node *);
+struct platform_device;
+
+typedef int (*of_irq_init_cb_t)(struct device_node *, struct device_node *,
+				struct platform_device *);
 
 /*
  * Workarounds only applied to 32bit powermac machines
-- 
2.25.1

