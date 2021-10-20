Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC24435306
	for <lists+linux-mips@lfdr.de>; Wed, 20 Oct 2021 20:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbhJTSwr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Oct 2021 14:52:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbhJTSwp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 Oct 2021 14:52:45 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A38E5C06161C;
        Wed, 20 Oct 2021 11:50:30 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id u6-20020a17090a3fc600b001a00250584aso1202788pjm.4;
        Wed, 20 Oct 2021 11:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=znmARRiQVkqC85lKLifIrCv0U2JcIdQKNsLQ6jRH+xY=;
        b=AFQnxzJBoUJOr2jrRbs0eEL5JnHsokQL0/MSRypi9D3z2Cnb8e6xsjRopqx6kJsXzb
         3/vfQ6JU1JWPLsYjesBk7L/viivaf+fmLAuv0k57UJd9S1S1isaQ5VdSnW7UInl4ZY8P
         rBgeG6ObrlPtOxQDgf/DY8ycdY2jKZIdzE6uPE71NVJg/xSZZ3g6XbATqHaYp18feDtZ
         oDZFWqiIkqhN1HgD+r20lHH0I87xBle9pCQD6g8yQwQN159mi92ouY7m9/RzbkaR1xmB
         NCCFB38R+ZCnmoFDrkL01g4gf5dou78VIXg61tr86Xq6zpZRXiXCduGeA9dsoxplsBCC
         spvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=znmARRiQVkqC85lKLifIrCv0U2JcIdQKNsLQ6jRH+xY=;
        b=eycjACs3dRxZDbezOA8t4YQjo6N0V2H5nVcR+x1ZwI1h7GvyPd1oqnmBYwc81XeNF2
         QwauCBVU5FH3Lvw0lmvEsRpRE3VrtQLjyPcytjGVhtrIzSYnyHZvc1UbHKtEP+Syxdbj
         B4WWtd7e1L3cMxAaeYEXqZxtHCwGV0I5k8/sXqV17gP1x0bEBlQzv8ht+ixm9xzqeSx0
         Efih1bjFCQ/2EogNOpKaUVB/QS60kBs5oe8YBrLW57l7sxeeS4g4xX7vsqA2CCY9jKhU
         jGUdDohW7G3VldBY4Gix5pidKjFw5S4+/bpX0ByvfoNF24qwdZQxNOcQLCtSBd4sCM9p
         rgWA==
X-Gm-Message-State: AOAM532NCY/SZKJPJ2XLf32jvzPsK9LcAwVcBOkJQYGSjhG8IVBTMU5j
        pQvB0fK6xw4p66i+m6L8IOKoU3XQhKs=
X-Google-Smtp-Source: ABdhPJz2zVU2zmA1USXKi8K+wWLy6wjyOoeBBh9yjG0hpBbXJb53QVX7O+TpCZLJPzXBxUCjv3wZSg==
X-Received: by 2002:a17:90b:3ecb:: with SMTP id rm11mr886865pjb.110.1634755829860;
        Wed, 20 Oct 2021 11:50:29 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id o127sm3267863pfb.216.2021.10.20.11.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 11:50:29 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE...),
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM
        SUB-ARCHITECTURES), linux-mips@vger.kernel.org (open list:MIPS),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE)
Subject: [PATCH v6 01/13] MIPS: BMIPS: Remove use of irq_cpu_offline
Date:   Wed, 20 Oct 2021 11:48:47 -0700
Message-Id: <20211020184859.2705451-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020184859.2705451-1-f.fainelli@gmail.com>
References: <20211020184859.2705451-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

irq_cpu_offline() is only used by MIPS and we should instead use
irq_migrate_all_off_this_cpu(). This will be helpful in order to remove
drivers/irqchip/irq-bcm7038-l1.c irq_cpu_offline callback which would
have got in the way of making this driver modular.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/Kconfig            | 1 +
 arch/mips/kernel/smp-bmips.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 771ca53af06d..2c03b27cec02 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1782,6 +1782,7 @@ config CPU_BMIPS
 	select CPU_HAS_PREFETCH
 	select CPU_SUPPORTS_CPUFREQ
 	select MIPS_EXTERNAL_TIMER
+	select GENERIC_IRQ_MIGRATION if HOTPLUG_CPU
 	help
 	  Support for BMIPS32/3300/4350/4380 and BMIPS5000 processors.
 
diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
index b6ef5f7312cf..f5d7bfa3472a 100644
--- a/arch/mips/kernel/smp-bmips.c
+++ b/arch/mips/kernel/smp-bmips.c
@@ -26,6 +26,7 @@
 #include <linux/bug.h>
 #include <linux/kernel.h>
 #include <linux/kexec.h>
+#include <linux/irq.h>
 
 #include <asm/time.h>
 #include <asm/processor.h>
@@ -373,7 +374,7 @@ static int bmips_cpu_disable(void)
 
 	set_cpu_online(cpu, false);
 	calculate_cpu_foreign_map();
-	irq_cpu_offline();
+	irq_migrate_all_off_this_cpu();
 	clear_c0_status(IE_IRQ5);
 
 	local_flush_tlb_all();
-- 
2.25.1

