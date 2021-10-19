Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90A884340F5
	for <lists+linux-mips@lfdr.de>; Tue, 19 Oct 2021 23:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbhJSWBV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 18:01:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbhJSWBS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Oct 2021 18:01:18 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB539C061765;
        Tue, 19 Oct 2021 14:59:04 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id v20so14670141plo.7;
        Tue, 19 Oct 2021 14:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=znmARRiQVkqC85lKLifIrCv0U2JcIdQKNsLQ6jRH+xY=;
        b=iOwxBK/TBiRJqvUSowWx2AA+29dqSDb4BJLm/ACFVY9kpVKPukdLQjJMjtIRG35jxz
         li9haYYODUCYEVlrXFPfWq5ITUkWgQHXdOF4IinFTkAgyLiN1CSU7YjqdR7g7CMSkyUY
         Z2KYctppGisktlOigbfAe6ufEkKiCWoHNj+v+UZOaRj4wrX0lKwRSG5+C36OAHSEAA20
         ZCwTKxmNp9EZGUE/qpnKPULv7qAaCZr0ULSaJG5e4QgRgV7xpwUTF24lj65tawxl7gwt
         /ibDDCQH75MwkpxuHLxILX4XTnoX79ea9fMsyoIAaftpYjDe1+aHy1P/hJj8yAih9yX/
         NWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=znmARRiQVkqC85lKLifIrCv0U2JcIdQKNsLQ6jRH+xY=;
        b=y5LOkbjIN7fOsmtXLxpgN+s9ksk7O4Fsl4EkZcGNI4ZV5phnHdf/S2L92M6TCfpUqS
         dzvpEd23OgYVCb02Xy90GJ1DpwVGZlL+uBlMfrpHTbe2u+LgCrwtfn++Epdpx6T+oU25
         zkjHWhH7xvsgdYurm/KD9RGyluXV7tH5gmrjH3sAfiMLizkKJtL53NHA1YROngXlwcxV
         3aCzFuWWT7DsDoMcE6exQdQ/0U8j+rhmC2R7q4hpy+JzVn2Th1xJTBegRyRjzyves4sA
         VmNcASENC6glqoD66lbyOd+Q1Xg2miLloKB4ERfOM/pA/Wvyp75pcNqu3mzhoMAJY12U
         u5rQ==
X-Gm-Message-State: AOAM533Lyo0r3OyTf2pDEQRHrsKYveetEH5i+YbYkzrFBPD0ZGBp1PpR
        AeZIgsP+lo4MfEEUHhl2Uwfy58ISVRc=
X-Google-Smtp-Source: ABdhPJwmPwkzadG3IzGXM+TH9X3zzcrVGu+ztbuKjc6ySuF3D88YvREs89DstisX7TitObSh959W+g==
X-Received: by 2002:a17:90b:4a47:: with SMTP id lb7mr2655148pjb.192.1634680744128;
        Tue, 19 Oct 2021 14:59:04 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id bf7sm139325pjb.14.2021.10.19.14.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 14:59:03 -0700 (PDT)
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
Subject: [PATCH v5 02/14] MIPS: BMIPS: Remove use of irq_cpu_offline
Date:   Tue, 19 Oct 2021 14:58:43 -0700
Message-Id: <20211019215855.1920099-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019215855.1920099-1-f.fainelli@gmail.com>
References: <20211019215855.1920099-1-f.fainelli@gmail.com>
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

