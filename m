Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCBB721AA87
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2020 00:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgGIWba (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jul 2020 18:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbgGIWb3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jul 2020 18:31:29 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02A7FC08C5CE;
        Thu,  9 Jul 2020 15:31:29 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id o8so3709717wmh.4;
        Thu, 09 Jul 2020 15:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mpaSC1p/M8e0C5xyo/fI8EkMIZMfzNU5RHEEosFQwkY=;
        b=A3e6kEKTFE2n6CcwbKQq2Inhn3T+FIOIUwAWN8oGpVKSU1UgFg/klx6QWgDs7mAxBd
         sRXYgcg44gxTnAYfcD/Z/XUT+cxMFaCxHAMBCVSsGcVsP0r6yBHFDjfgFyLbWHO15ZmW
         GTMe3ZCjVXHdz7yIclj86BGfoaxyhZbkGP5JLUOGXkRP+3EvHHoLVVZWi3j+hygUO0Qv
         ZA4/k3gqD4SxoDScspPLhwZ+u0jiMqHKKOGN0b13bl4uHhPyOAOKYnYEN1Vjw8tm2HLx
         FmtL714hOle6wK/csi38lpXXycByepx+4ugUt1ep6cdB/TuMFC43bdKgzkGONNirz7Ux
         kpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mpaSC1p/M8e0C5xyo/fI8EkMIZMfzNU5RHEEosFQwkY=;
        b=E3/2Cz1ZxWcSThOLDO96OFFa9p02g4SoOu0Y9FwLr1qB/+uhf6AEfmwze6AJ7a+xPo
         ozySGWsKl1Fj+Q3nIxhiGsAL2N0c6LDwTmm98HJydQ/3fMtoiCwmWwAqfVDHFwe7lmFm
         W2B0hHxcoiu3OyFrkap/U8HNFRbO5hEnelPzwfB2HL9UGyXYTtv8IAwBrPE8skKmOrUd
         XGTfAey7DVvHWkWBwnMGvO7lLAFWSYoRVBCsZE3IusxiE6SI+iewAx/1UIetjm1mpwTX
         Fd3EsZdXRDY4tWl4Ii6zZrPF5AHHGR7jcfUABEDovaco5wxeDvtPhRa7SMiblJIqicbV
         LE4A==
X-Gm-Message-State: AOAM532uljSWjeeSfj4NRPSyvwH1mYpzki9E8knVSQB1h7RNfN4OqITT
        EFxO2tBWlY/Y/+pJ8MtltVOkKaYB
X-Google-Smtp-Source: ABdhPJzAvLP4sYtSL0vWpmJssD1e0dwtEbAj8qXuWKQxQOQUr3kylO+ittQsdj5HZfzOebIUCRPP3w==
X-Received: by 2002:a1c:96ce:: with SMTP id y197mr2034605wmd.86.1594333887420;
        Thu, 09 Jul 2020 15:31:27 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id m10sm7375267wru.4.2020.07.09.15.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 15:31:26 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Justin Chen <justinpopo6@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM BCM7XXX ARM
        ARCHITECTURE),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-mips@vger.kernel.org (open list:BROADCOM BMIPS MIPS ARCHITECTURE),
        linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX
        ARM ARCHITECTURE)
Subject: [PATCH 1/6] irqchip/bcm7120-l2: Set controller as wake-up source
Date:   Thu,  9 Jul 2020 15:30:11 -0700
Message-Id: <20200709223016.989-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200709223016.989-1-f.fainelli@gmail.com>
References: <20200709223016.989-1-f.fainelli@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Justin Chen <justinpopo6@gmail.com>

Utilize the Broadcom interrupt controller standard property
"brcm,irq-can-wake" to flag whether this particular interrupt controller
instance is wake-up capable.

Since we do not know what type of parent interrupt controller we are
interfaced with, ensure that enable_irq_wake() is called early on.

Signed-off-by: Justin Chen <justinpopo6@gmail.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/irqchip/irq-bcm7120-l2.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-bcm7120-l2.c b/drivers/irqchip/irq-bcm7120-l2.c
index 586df3587be0..c7c9e976acbb 100644
--- a/drivers/irqchip/irq-bcm7120-l2.c
+++ b/drivers/irqchip/irq-bcm7120-l2.c
@@ -143,6 +143,9 @@ static int bcm7120_l2_intc_init_one(struct device_node *dn,
 
 	irq_set_chained_handler_and_data(parent_irq,
 					 bcm7120_l2_intc_irq_handle, l1_data);
+	if (data->can_wake)
+		enable_irq_wake(parent_irq);
+
 	return 0;
 }
 
@@ -247,6 +250,8 @@ static int __init bcm7120_l2_intc_probe(struct device_node *dn,
 	if (ret < 0)
 		goto out_free_l1_data;
 
+	data->can_wake = of_property_read_bool(dn, "brcm,irq-can-wake");
+
 	for (irq = 0; irq < data->num_parent_irqs; irq++) {
 		ret = bcm7120_l2_intc_init_one(dn, data, irq, valid_mask);
 		if (ret)
@@ -274,9 +279,6 @@ static int __init bcm7120_l2_intc_probe(struct device_node *dn,
 		goto out_free_domain;
 	}
 
-	if (of_property_read_bool(dn, "brcm,irq-can-wake"))
-		data->can_wake = true;
-
 	for (idx = 0; idx < data->n_words; idx++) {
 		irq = idx * IRQS_PER_WORD;
 		gc = irq_get_domain_generic_chip(data->domain, irq);
-- 
2.17.1

