Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE6E4340F4
	for <lists+linux-mips@lfdr.de>; Tue, 19 Oct 2021 23:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbhJSWBU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 18:01:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbhJSWBQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Oct 2021 18:01:16 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 373B1C06174E;
        Tue, 19 Oct 2021 14:59:03 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d5so1180412pfu.1;
        Tue, 19 Oct 2021 14:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dv8ie/kzP99OSKx2zPfoLqRlI0izEadzKVnoX+2n0Ow=;
        b=AY2Ha5MT0GGSiAQJtui4C9ngVrORBxADCZ2UfDcWMFG49K8fbexaNgX+wtRbjAPmOs
         h1EEcZ3Vs5nGsU3lxyyBJQMwREZVYsbTP/YzlXMZWlzD5GbioJ60HLdgBxq2ORiyZHQE
         4xyeZJ9jjQsOYUQ61XMmMS62pVe4SGhnSo6SPFOPxwphnh0bXAM/2XCi5hPWH7W7fV/a
         FodWYf/Ikfz1FcNJecK5z/opptgGMCyXJvoGJlCnRQuG9Y9QYUO0RNppBhkS/g4Jf9TO
         Zq4H8Ih541/TPH4MSdRSiP1RLwvGXN/GMeWW4RX/0QiH1IfwYTZumd/Vuclo5j+8ay3s
         6QYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dv8ie/kzP99OSKx2zPfoLqRlI0izEadzKVnoX+2n0Ow=;
        b=V9ZiQnr/MUBobDdiZCH5HLxyOKzwqlk2y8TItDZnU7klB4/SOD0/m/blDEe3UsaTBx
         7PUkTO48eDeyNMo9phOgzVe5RjaHklL/iwaSTxNmI5eemHYfGEZqSnyxmqRxGaWfdYHr
         brkIv113LHD9EtXuNB0G7M4C8+BbOm4TGUDJO16gLnHcXHRW914gqPfk1Nq914DfEuoo
         g5I1fLvY7Lr3O9lgMVsxbMv5augFKfcJStRyFwmUyGYhtUgVctRgUI6c1CBd5J7TnCR4
         qS+JQcDN+92TBDUqKakQIIOQHg7UPmcfY989XtlKvqQrnXBlvB2Fbu35qWOk/iGH57+n
         3IZA==
X-Gm-Message-State: AOAM532/wXNuaml+4etJ8bzx9ZEl1bl3dBBsNfHGxsgFzZ6SbSTUIMWn
        zycgFGSKwh0khUL3egoGNkZEc3oJ/P8=
X-Google-Smtp-Source: ABdhPJxg80f3aU9s30YTITBpGuu/MH1V8WZnV8yB6ev7fGNeckIaO0jlPiUPY6LwoY00LNnGswTQWA==
X-Received: by 2002:a05:6a00:1a8e:b0:44c:5f27:e971 with SMTP id e14-20020a056a001a8e00b0044c5f27e971mr2464454pfv.72.1634680742412;
        Tue, 19 Oct 2021 14:59:02 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id bf7sm139325pjb.14.2021.10.19.14.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 14:59:01 -0700 (PDT)
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
Subject: [PATCH v5 01/14] irqchip: Provide platform_device to of_irq_init_cb_t
Date:   Tue, 19 Oct 2021 14:58:42 -0700
Message-Id: <20211019215855.1920099-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019215855.1920099-1-f.fainelli@gmail.com>
References: <20211019215855.1920099-1-f.fainelli@gmail.com>
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

