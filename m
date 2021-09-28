Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDFB141B5E7
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 20:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242241AbhI1SYX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 14:24:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242221AbhI1SYQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Sep 2021 14:24:16 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DC2AC061760;
        Tue, 28 Sep 2021 11:22:30 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id on12-20020a17090b1d0c00b001997c60aa29so2418016pjb.1;
        Tue, 28 Sep 2021 11:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eUj8nxm+KdP0d5VfXzrEXZEp4lkprKHXeVwPIifh+Cg=;
        b=qD8YIE+BkdzAFNGOB7KHL+DYnDRu1+7sEmigspq7FVo8oXRZHDeywVsv8gnhUacnYN
         LVXAUfmAQV07f3AfPa731x2WzupM6SNCWPEhxzT3e9qN/mWvkS7hxhfcFk6KNroQckS3
         buLAUKdJsdKP7HORWonhsRUn253xhugzeZKkaE1hKVeOnIhVoKAGkjhHqlC43whRYw+4
         NHethsn+Ux7i/6ik+0dItg11IzTWTO2tU+hrSGiu+tFTkSqpogA0TxmnIw51xzAiJQE5
         ScXEEf5W03m2dFpijKk8V2/QIAQdBDIAKDhX9Jhuoe9JLcqb4BMwYccOP9gYc2PSWF8A
         zONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eUj8nxm+KdP0d5VfXzrEXZEp4lkprKHXeVwPIifh+Cg=;
        b=dCHt1ctNCbDRVIGx0WwAFHR/3ECkFbVUgV/2xCVTjD7wEIOdmdPgfiRqjX3u6XpCiF
         FulUi80I80lWcWPojP66YF60T4+Ze6HC8NxNoTdO/6Q0UhvdPkUYLAb+X5EJOn92wlEh
         Z59A68jJoSwDDfsd5Gt7DU/aLzOKW+u9RQ4CGRhe1+bNlx4Nhzgzyc9SX/4kLGVDFnD0
         1YYvNvZDvrWSSOi8PXf8bk9LKCkE9/2ONGxOa33xatH1Yyuz8nuBHjdmPC1gej84xYU3
         frQ/dEiWX62NO2szBGXTIobF078r5V8XWbZxjW8xwP1+646uC4hVYgdMRr5n2IcTIidL
         ZkIQ==
X-Gm-Message-State: AOAM531942/9yU23rs3qMS7TUWGcD20JmxCXvZsJQk359ShwAshn6zr0
        5pslV2SSewvQQInui9C5AeHq+3J2i/k=
X-Google-Smtp-Source: ABdhPJy/pQQ7Mj+GhyymDTLMDxeMtULxslY4O2cr9dQbQ39uecMIk8qCz6TsUHCvi/ylRxXjZrH3Wg==
X-Received: by 2002:a17:903:22ce:b0:13b:9a00:f090 with SMTP id y14-20020a17090322ce00b0013b9a00f090mr6524626plg.11.1632853349182;
        Tue, 28 Sep 2021 11:22:29 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id x19sm20855288pfn.105.2021.09.28.11.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 11:22:28 -0700 (PDT)
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
Subject: [PATCH v3 05/14] irqchip/irq-bcm7038-l1: Restrict affinity setting to MIPS
Date:   Tue, 28 Sep 2021 11:21:30 -0700
Message-Id: <20210928182139.652896-6-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928182139.652896-1-f.fainelli@gmail.com>
References: <20210928182139.652896-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Only MIPS based platforms using this interrupt controller as first level
interrupt controller can actually change the affinity of interrupts by
re-programming the affinity mask of the interrupt controller and use
another word group to have another CPU process the interrupt.

When this interrupt is used as a second level interrupt controller on
ARM/ARM64 there is no way to change the interrupt affinity. This fixes a
NULL pointer de-reference while trying to change the affinity since
there is only a single word group in that case, and we would have been
overruning the intc->cpus[] array.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/irqchip/irq-bcm7038-l1.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
index 3c4e348c661e..357570dd8780 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -191,6 +191,7 @@ static void bcm7038_l1_mask(struct irq_data *d)
 	raw_spin_unlock_irqrestore(&intc->lock, flags);
 }
 
+#if defined(CONFIG_MIPS) && defined(CONFIG_SMP)
 static int bcm7038_l1_set_affinity(struct irq_data *d,
 				   const struct cpumask *dest,
 				   bool force)
@@ -217,6 +218,7 @@ static int bcm7038_l1_set_affinity(struct irq_data *d,
 
 	return 0;
 }
+#endif
 
 static int __init bcm7038_l1_init_one(struct device_node *dn,
 				      unsigned int idx,
@@ -365,7 +367,9 @@ static struct irq_chip bcm7038_l1_irq_chip = {
 	.name			= "bcm7038-l1",
 	.irq_mask		= bcm7038_l1_mask,
 	.irq_unmask		= bcm7038_l1_unmask,
+#if defined(CONFIG_SMP) && defined(CONFIG_MIPS)
 	.irq_set_affinity	= bcm7038_l1_set_affinity,
+#endif
 #ifdef CONFIG_PM_SLEEP
 	.irq_set_wake		= bcm7038_l1_set_wake,
 #endif
-- 
2.25.1

