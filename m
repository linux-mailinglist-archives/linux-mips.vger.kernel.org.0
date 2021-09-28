Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A416241A562
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 04:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238700AbhI1CaA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 22:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238687AbhI1C35 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Sep 2021 22:29:57 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CCF6C061575;
        Mon, 27 Sep 2021 19:28:18 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id om12-20020a17090b3a8c00b0019eff43daf5so1586778pjb.4;
        Mon, 27 Sep 2021 19:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=knXL02VOmkFLU9YLWF/5g5SfaxjLRPWcMFGGkfQ2MJo=;
        b=IEpuAnVKkRGGpmkR3JRYp3hSXaykp/XcRH4sCNW7S2bxpcsm1bIiVlnvIKBSxg1ZI4
         k9gaPOetvKoi8TYXaHhlgmmLySvWPMMJKjka1HLG8Exb33IRonmQg1+nwy5deFVEDQ63
         9MpKnfkfr237ysWst9gq9euNuC8z0HlyCga5Y+WmoO2g39tAFcDEbAd+ZtFPYmSh/2cF
         7a2lnqpkh3JehXkX03WI15wvaMiBKEZdNpqmpMNXBojuUQAoVwRPKgnzKTXYUTwgvWGw
         3r5IkHHSMOuLHq0Iyvf9ufID+G/9hvRT+mTRd/FU3mP/E4UoOEm72LQ3VgjvmlPMiQWO
         kh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=knXL02VOmkFLU9YLWF/5g5SfaxjLRPWcMFGGkfQ2MJo=;
        b=dLwHwsOzGR+j+SZc8I5i4jwxmhkhJxyz9QbxbkUSoRZVfl+V08gHDB6gNGJWNd3Eu0
         X1A/50v1hdPElZI0NOIcBYaAUSoFDjkqW7RE4yisprc1NruYqCRBQNU7qPLXqkccu3Ik
         JxwYMbUgi5xilcx9oLpdgM+Es03cv6UPMlMxx0pDnkuZ6LDRDuM63462A7xzQ6PxlEM5
         Nhjs8jjUbgYJz94lgagDP8NVf3HCCa0jnBfAO6oMpMWLBjOaLBkSSZAszjPjLxjmxPhx
         VL0D3QJScSMwmE9oIkmkDbrBER3QuuKxCLF2aUA+arxE3R64Yh4HsUfuYQaQrrYEgijk
         Eplw==
X-Gm-Message-State: AOAM531/LZ/k76ffrF08l7HOEAEIVgE1y63MiRx0Jf7XFWVx63F+3/e5
        Q6Qd88mEORnkNNwN5WsBxGO9iOf61Jc=
X-Google-Smtp-Source: ABdhPJw5V1IpWkN3QRbTPt7CY9BysyOWfFNGRznfjsEbS4Ij4aNIezxGBaRFECdTUh7caWe5aUSBRw==
X-Received: by 2002:a17:902:c086:b0:13e:2b52:29e1 with SMTP id j6-20020a170902c08600b0013e2b5229e1mr3023429pld.8.1632796097360;
        Mon, 27 Sep 2021 19:28:17 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k14sm633261pji.45.2021.09.27.19.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 19:28:16 -0700 (PDT)
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
Subject: [PATCH v2 03/12] irqchip/irq-bcm7038-l1: Remove .irq_cpu_offline()
Date:   Mon, 27 Sep 2021 19:27:06 -0700
Message-Id: <20210928022715.369160-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928022715.369160-1-f.fainelli@gmail.com>
References: <20210928022715.369160-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

With arch/mips/kernel/smp-bmips.c having been migrated away from
irq_cpu_offline() and use irq_migrate_all_off_this_cpu() instead, we no
longer need to implement an .irq_cpu_offline() callback. This is a
necessary change to facilitate the building of this driver as a module.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/irqchip/irq-bcm7038-l1.c | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
index a035c385ca7a..750156217c82 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -221,33 +221,6 @@ static int bcm7038_l1_set_affinity(struct irq_data *d,
 	return 0;
 }
 
-#ifdef CONFIG_SMP
-static void bcm7038_l1_cpu_offline(struct irq_data *d)
-{
-	struct cpumask *mask = irq_data_get_affinity_mask(d);
-	int cpu = smp_processor_id();
-	cpumask_t new_affinity;
-
-	/* This CPU was not on the affinity mask */
-	if (!cpumask_test_cpu(cpu, mask))
-		return;
-
-	if (cpumask_weight(mask) > 1) {
-		/*
-		 * Multiple CPU affinity, remove this CPU from the affinity
-		 * mask
-		 */
-		cpumask_copy(&new_affinity, mask);
-		cpumask_clear_cpu(cpu, &new_affinity);
-	} else {
-		/* Only CPU, put on the lowest online CPU */
-		cpumask_clear(&new_affinity);
-		cpumask_set_cpu(cpumask_first(cpu_online_mask), &new_affinity);
-	}
-	irq_set_affinity_locked(d, &new_affinity, false);
-}
-#endif
-
 static int __init bcm7038_l1_init_one(struct device_node *dn,
 				      unsigned int idx,
 				      struct bcm7038_l1_chip *intc)
@@ -396,9 +369,6 @@ static struct irq_chip bcm7038_l1_irq_chip = {
 	.irq_mask		= bcm7038_l1_mask,
 	.irq_unmask		= bcm7038_l1_unmask,
 	.irq_set_affinity	= bcm7038_l1_set_affinity,
-#ifdef CONFIG_SMP
-	.irq_cpu_offline	= bcm7038_l1_cpu_offline,
-#endif
 #ifdef CONFIG_PM_SLEEP
 	.irq_set_wake		= bcm7038_l1_set_wake,
 #endif
-- 
2.25.1

