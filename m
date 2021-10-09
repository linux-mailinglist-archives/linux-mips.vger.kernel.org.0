Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE2E2427696
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 04:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244419AbhJICW6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 22:22:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244562AbhJICWk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 22:22:40 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D98C061771;
        Fri,  8 Oct 2021 19:20:44 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id v20so189676plo.7;
        Fri, 08 Oct 2021 19:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dv8ie/kzP99OSKx2zPfoLqRlI0izEadzKVnoX+2n0Ow=;
        b=XmVZQ8ecVe8ssNoW3ri/l0xaim8HSgzUF8wAV4y3HLNJpdveIMz6JlwIUVyEiWgj4R
         vr5X0u6sk9Ca5Pdw8C2ckmHkm7tibgMWWAyshNNen99epCOx6IOsEbbTa8+mOPrxucl3
         F4YxOKSlw0G1DTsjnFtxO3exNW2jwZcpe8otVI6WAtvF75bryFrdxpZSI6lhiuL/aYzT
         ZnQbqJOogyH8DTx4Yg2JW0vqrn+jkoV+YPOnUcLEteYbAJAaIyahNwX/ZTGs14GLPE2p
         I0t73KD1eIZAGOLNopwuBzjzneID8YRilac4sz4oe9MNBQ8AA/ljepB4ytxjTREo432T
         JoiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dv8ie/kzP99OSKx2zPfoLqRlI0izEadzKVnoX+2n0Ow=;
        b=L+AB0CVZ4upXjPARARI7TrAow2PfsVolwagDGAyoS4SbhCAeEM/szWWHwrHvvXpsA4
         p5SMmd2/QjVdEo0h73aUYc0LoiWwltnbbObWhD+4NlW1tLmve0dDy1j5RdDerI2HJS9m
         4ZBnG7w64sgk0EItMerfc4IDdhSM3mJQvK1OoIaheu/u1WzfLyfpEF8FjUM5UEWj06Dv
         FhF8vKJ0J3pHDgIgG94F8Fd+edRwbgirrqUIi8ev917NUqYRY05BeRqS96517PqnucOF
         rBUKtFaEqYPj2Fi0rg/OzX2msusaJCdjdpFZ5a0UK4foofQ/RL0qB10FlLoHYgla6baI
         uU1Q==
X-Gm-Message-State: AOAM5309pTwfXq/5wkGL+LAaTEjkpguA2Gmclfj42TPmJ79xYq3zaYeU
        7uBiA/h9gpUlWwuzpRYwnSpcKYXZ26E=
X-Google-Smtp-Source: ABdhPJzF3gI7qfa3LWqIKHoJ03LLsWPTSCV4u1fVS3qzFGwkcYas6/EtejS42d9w4UMRoGhUfYAlzw==
X-Received: by 2002:a17:90b:1d0d:: with SMTP id on13mr15716331pjb.118.1633746043559;
        Fri, 08 Oct 2021 19:20:43 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id pi9sm444692pjb.31.2021.10.08.19.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 19:20:43 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh@kernel.org>, Ray Jui <rjui@broadcom.com>,
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
Subject: [PATCH v4 09/14] irqchip: Provide platform_device to of_irq_init_cb_t
Date:   Fri,  8 Oct 2021 19:20:18 -0700
Message-Id: <20211009022023.3796472-10-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211009022023.3796472-1-f.fainelli@gmail.com>
References: <20211009022023.3796472-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Provide the platform device mapping to the interrupt controller node to
the of_irq_init_cb_t callback such that drivers can make use of it.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/irqchip/irqchip.c  | 2 +-
 drivers/irqchip/qcom-pdc.c | 3 ++-
 drivers/of/irq.c           | 2 +-
 include/linux/of_irq.h     | 5 ++++-
 4 files changed, 8 insertions(+), 4 deletions(-)

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
diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 173e6520e06e..819a93360b96 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -359,7 +359,8 @@ static int pdc_setup_pin_mapping(struct device_node *np)
 	return 0;
 }
 
-static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
+static int qcom_pdc_init(struct device_node *node, struct device_node *parent,
+			 struct platform_device *pdev)
 {
 	struct irq_domain *parent_domain, *pdc_domain, *pdc_gpio_domain;
 	int ret;
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

