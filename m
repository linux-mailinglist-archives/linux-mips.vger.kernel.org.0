Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B73B6434106
	for <lists+linux-mips@lfdr.de>; Tue, 19 Oct 2021 23:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbhJSWB3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 18:01:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbhJSWBZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Oct 2021 18:01:25 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7CEFC06176C;
        Tue, 19 Oct 2021 14:59:11 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id h193so5241032pgc.1;
        Tue, 19 Oct 2021 14:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eUj8nxm+KdP0d5VfXzrEXZEp4lkprKHXeVwPIifh+Cg=;
        b=cbYN7Cxv2G8RvGsn2smJXy6cbTiy+3imwrLXUgvBV/rkM8Cf2RL0aDdiDTn02Y4N0Q
         Q8qtXGA6cCKuilQCMq49WArq3yFCq1LG0QOOqBkRkPUgq9NOL00dZagNnq/bX0vaBTHL
         VyZw2Bc9id6udegI/MIKajPvPyHrLJK+1+zVXmpwFAv2XhYrMGl+fdtEfQfq8w3OszQf
         SpfIoAFfkuChdTbto7TcECACxWFtenRMwH1Cb7Yl1jkp+/5vjmdAA+D/UjOZ37JLepIi
         5Fc/3TrL12aqEZ5Q3VZzHQLcUoxOxwfPuDmDpeHWAEgn02MZyOyVXjTwuV7jz40GkZfR
         pc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eUj8nxm+KdP0d5VfXzrEXZEp4lkprKHXeVwPIifh+Cg=;
        b=sHC+e/KTolfzlU99busWMqewCR8Oe1ujk31UZtIPW7e073WCpafZpyY3LZ9QWUzTGO
         A0VE+8xfpDQ/h7vsfgGQOVyRgve7+zaMawmv5JSVgSVzhnrizCToradjHQ7Ar4DA8ajJ
         /s2otYQc22p9hrKkBRAuqRHEQUsTMN7GmyAxmrwIj4PdKqtFCVbIFrNdyUCSaft1N7my
         PtmriCEgOYlW+p8KNbuk0G83zmFu5MHWsY+DgYQLyIf0c50Pwu91fjuNsApUL31HF/cx
         elY4BrMTq8bs4rs4rItTE89LUpTfvciWG+Rqwdl52qwRMUY4lxrAfbVSrBq26PTVnxKy
         ID0g==
X-Gm-Message-State: AOAM530l5UPZp1gjmHtOAEx8y9rKzjRuTAAhljNA85GhcZRfg6cG8fUk
        Y3VV8Vd8VOd6nSn7L//G3tIdGo3EYj8=
X-Google-Smtp-Source: ABdhPJxO03IacjIGjGc2dtfuUG7h/DIWCyZfIiZmC+P4q0hindtJohdpIN11hs7wH/XGXefV+oGdDA==
X-Received: by 2002:aa7:8f28:0:b0:44c:f281:c261 with SMTP id y8-20020aa78f28000000b0044cf281c261mr2390018pfr.76.1634680750770;
        Tue, 19 Oct 2021 14:59:10 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id bf7sm139325pjb.14.2021.10.19.14.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 14:59:10 -0700 (PDT)
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
Subject: [PATCH v5 06/14] irqchip/irq-bcm7038-l1: Restrict affinity setting to MIPS
Date:   Tue, 19 Oct 2021 14:58:47 -0700
Message-Id: <20211019215855.1920099-7-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019215855.1920099-1-f.fainelli@gmail.com>
References: <20211019215855.1920099-1-f.fainelli@gmail.com>
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

