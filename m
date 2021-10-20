Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7B6435311
	for <lists+linux-mips@lfdr.de>; Wed, 20 Oct 2021 20:50:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbhJTSww (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Oct 2021 14:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231431AbhJTSwv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 Oct 2021 14:52:51 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CBDBC06174E;
        Wed, 20 Oct 2021 11:50:36 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id e65so20917093pgc.5;
        Wed, 20 Oct 2021 11:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eUj8nxm+KdP0d5VfXzrEXZEp4lkprKHXeVwPIifh+Cg=;
        b=LDu3pf8rvY5urOjKEIFGzX9GJy3XBcqPCuBUIcUK+kfAjpJbhcEcJj915qtAuWZBSD
         A7GSfxuDgoHIVdM1pvrV1l2KhlQ3Zrt+/9ECpx+n/Zq46Q91yh1VGYtOXKBeqG5JTwlv
         wWutEFTsFCMMOO6NsUlBE4yKLDaf2ZAKcUUEhOWR1wPqU2e1rkQOFJpxHaJTzeW2pMCk
         JuMHA+i1Oa4yJG40Ez/uBn+gGGeR6jniPaAKN88KSLTvPeHbCNjas5siblOCa2LfjxP4
         FbKLtp6gTqTSqm6sWmqHEDa4tmSq+ZX2yv819oIz1KQMoljlK9hc8XQbujLFRoBcMkWk
         PfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eUj8nxm+KdP0d5VfXzrEXZEp4lkprKHXeVwPIifh+Cg=;
        b=WLKivDKawmjGo59WnJaPRgEDKIsOc24xF62v8PyVoai1RHhWLhr5ul+fMJ4F6SygmT
         CJOq11TF3JUJ4o7i+RdMaRC1UKmf8Y8ug7/2+bnZfnU4hhG516PurFR/Gm8zYPoQB7/V
         kCV1uDYSaXkxLGnr6It5vOXtAm8ewCQKV/0uLpW1YpCDFr3AjRt+C08h/eQvt9uz53Qf
         QU2NWeRsC6nWJ2MUOiNQwzUPX/2wTJUGBWMwVy2AUt/d64BmA/LaREClcnw4Jk8X6RcN
         y065NiFRNyPDSHX/DvzSUb3jHP/O0Urzh+8nXq+RjxgXhmXcnB9ZWVXw70BtSSR8KH6V
         mSSg==
X-Gm-Message-State: AOAM533rFPLCUVKMwvYIaXJzgDuMez3LsvJLHq8NcI4sBv4zjG8F1QGd
        j+a/hcjS4rupgjJobdUs8QRXn9Ta5hk=
X-Google-Smtp-Source: ABdhPJygbkliS50fhDf1AumcMaX/Moy+n/vSPzRYKRsZzAhaf9DLj3uAwgGzpmhQXsetjhV5r85KcA==
X-Received: by 2002:a63:bf07:: with SMTP id v7mr733289pgf.475.1634755835563;
        Wed, 20 Oct 2021 11:50:35 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id o127sm3267863pfb.216.2021.10.20.11.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 11:50:35 -0700 (PDT)
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
Subject: [PATCH v6 05/13] irqchip/irq-bcm7038-l1: Restrict affinity setting to MIPS
Date:   Wed, 20 Oct 2021 11:48:51 -0700
Message-Id: <20211020184859.2705451-6-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020184859.2705451-1-f.fainelli@gmail.com>
References: <20211020184859.2705451-1-f.fainelli@gmail.com>
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

