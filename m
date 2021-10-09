Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1634D427687
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 04:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244414AbhJICWj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 22:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244418AbhJICWg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 22:22:36 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8331C061762;
        Fri,  8 Oct 2021 19:20:37 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id x4so7304939pln.5;
        Fri, 08 Oct 2021 19:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eUj8nxm+KdP0d5VfXzrEXZEp4lkprKHXeVwPIifh+Cg=;
        b=c3kSTNU5BJ5QJ8JFiLbKzy/A99Z9toAXdm8flW49HTdq+mK8b6A7ui+km1TYuw8W+N
         5+vQc53uz6VTLSSGmQd3YezfNXwoErRNKVSe0OKKkNje2y9rvVwCQHfRFqiejMI91MWY
         1ntrMG6PNrlUvm6tyTuQIPpftoTaATluQibOUCeOfx9gLuSQ7+lzSWvEaJFxHcpgYO5h
         We7BGG2kamEbC2Cg+uMSjwJoSd/CgEqTvCjM0FB5Gj/lBa4MEP/WKQd/L5ZmjLJt4/0t
         bh2DjPtu8X0s+rEjCTZcKOagnohQmQ6OSCa1fqKmZ0+QwBJE369PCCeoHqNlkl+comGp
         FEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eUj8nxm+KdP0d5VfXzrEXZEp4lkprKHXeVwPIifh+Cg=;
        b=EWiO+y9v1eb1YWErlDP0ib2/IWwrSTBW3s6OqWOf/2p1VRgm0xFkiwhYK8XtAntEoA
         pZD/6syS+uSPfrBMayhfP6vze4bwioNfJBFV2t/aVkphm8QjbiQFHze3wn2xp9CIj9BL
         izXZQGz8B2xvC6V+WBX8HIoxjSZq6YrnavkYJjUl1XFWetU2WRPRNBZpW3l7AZh2Kb2U
         Lw07BdfNxw0rI7DSdHZng5PB+PA2OXbQkHopIbWr/0LVsbiALRFMHvB/5G+tSV75eQ6P
         l7pmnfC+ZAtBhV9GoGPIcB4jfWiYL25d9pH4IsTfDxTXcJ3BAhf4W7b2lup9SmjsIExa
         aHxw==
X-Gm-Message-State: AOAM533vjqbe2S+jhXkJttPy2iJVaIQrctvYocWO2xAVSIEHEeceo4rw
        RtJz5lZwhl51vthY8Mo5SlX1HZkxdoY=
X-Google-Smtp-Source: ABdhPJylbltqq722kc9cPzBDT4GPP7LV4CG7AB61SJI6JZWdbUgJzjWWOuuGBYhxg/9m938uUnCb/Q==
X-Received: by 2002:a17:902:f691:b0:13f:2034:7613 with SMTP id l17-20020a170902f69100b0013f20347613mr2540590plg.81.1633746036946;
        Fri, 08 Oct 2021 19:20:36 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id pi9sm444692pjb.31.2021.10.08.19.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 19:20:36 -0700 (PDT)
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
Subject: [PATCH v4 05/14] irqchip/irq-bcm7038-l1: Restrict affinity setting to MIPS
Date:   Fri,  8 Oct 2021 19:20:14 -0700
Message-Id: <20211009022023.3796472-6-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211009022023.3796472-1-f.fainelli@gmail.com>
References: <20211009022023.3796472-1-f.fainelli@gmail.com>
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

