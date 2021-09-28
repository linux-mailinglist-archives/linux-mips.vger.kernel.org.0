Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5AD41B5F5
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 20:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242290AbhI1SY3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 14:24:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242256AbhI1SYY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Sep 2021 14:24:24 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A3CBC06161C;
        Tue, 28 Sep 2021 11:22:36 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id b22so4000870pls.1;
        Tue, 28 Sep 2021 11:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3QThqxTZ5uzX8g3SWHj4WUPibxza6P9n5f90ZfsEf6I=;
        b=MmGuTkaJ0F6u+7C//ugUwBLAcl24MNApoeX+TSLBrVHYBHQZk9M+cHCz5KQNfeFz7O
         zH3Fv+HZpAFyed+/YYn047pkbWXCVyxxti5zUZeiv5zZPG8EphAvixN/GPgQK5xV1bJf
         o4hSWKG9vF0nnikfqJB1WE24B/ChltSpqrRjLWo4kU9ojUmJ1gfM0n+GEFGQch89CRRJ
         F46MWu7Wr/tkUytzjt+3fZZkqdih/gYK/nm+xdC0Znqnln5vTEQacwFId4Q879djTOcM
         vI2aBZEjCoCyRuT5DO4MZHoWg0v1O4JHP14zaDCl9dwdcTJWROqFShzMBaXpFjpiK7Lm
         5QlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3QThqxTZ5uzX8g3SWHj4WUPibxza6P9n5f90ZfsEf6I=;
        b=vpxJblG15+OjrKjsCF9RlFG1sJLnZArqf0RkTEeJtXgjhMPAlB6jZU5zT8RJ+DhiDA
         B0LFf3A4HSFF0YfFjETDPwtmoKO/RP4YJnmLYeSxu7dLLs6mK4/2mhaW1Id5TVHHGn+v
         bHbOW6+BRclm7CRSFwI1rhj3JywvzYw/pumaJ+1/GLtut0Nami1QwHvl15+bEjcoE6qR
         zjt+9sx4mlVOcEa7Q5l9qrvPNxLP9hEoZaD8bKtDsrdWGCr14hLGI1Ogo5NqLubuf+bQ
         Pc+XdfeFI+HHRl9hF7vVn99h9a2xQwCKMbpdNNvnp/k5JXMdd9DHcs0FjQd0EENcj9Ne
         wqXQ==
X-Gm-Message-State: AOAM5337hAo1lfjvls6hGiVfH/v+wjK3ZjiWkNgHgMenYraUnLMknbBC
        h4gk/09pjL+Szjq33dyE/gCTe+ReQi8=
X-Google-Smtp-Source: ABdhPJx8tmBo/AWrmQZYNo1TqTWhR59dq84XAd8DRwqLZN6020NHT9iGw4RwDY26Wsrx+lOWDWHmRg==
X-Received: by 2002:a17:902:9689:b0:138:d2ac:44f with SMTP id n9-20020a170902968900b00138d2ac044fmr6285282plp.85.1632853355713;
        Tue, 28 Sep 2021 11:22:35 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id x19sm20855288pfn.105.2021.09.28.11.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 11:22:35 -0700 (PDT)
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
Subject: [PATCH v3 09/14] irqchip: Provide platform_device to of_irq_init_cb_t
Date:   Tue, 28 Sep 2021 11:21:34 -0700
Message-Id: <20210928182139.652896-10-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928182139.652896-1-f.fainelli@gmail.com>
References: <20210928182139.652896-1-f.fainelli@gmail.com>
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

