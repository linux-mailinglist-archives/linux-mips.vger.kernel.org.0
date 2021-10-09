Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4417342767F
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 04:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244337AbhJICWb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 22:22:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244234AbhJICW1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 22:22:27 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEFBFC061755;
        Fri,  8 Oct 2021 19:20:30 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id k8so1850156pls.3;
        Fri, 08 Oct 2021 19:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=znmARRiQVkqC85lKLifIrCv0U2JcIdQKNsLQ6jRH+xY=;
        b=HuYOJMsuZ5Li1XRjQJpwwVLmkPRJfGKnjBoRjBAS5zeqnc8lCWIKTWTvwbCvJ+o4ZI
         +RQdB5JwpQaPDtiOy5+m8gnQRWXS85ZK+5nMSrR/lx8mp5xPEkfpH/GS4kopN/na2yjJ
         29DMDXouNvov8TA+Am+SPb8wzBAtsN84V6iiF+9CdzLwUIqB18URDBIncmoB3MQyieX8
         4lMSZQVgu0HOEPdvSDpEjcyXSNy/k6gSaJXSrtTRyYmuWRbCVzpJu5JmMxpExAhcfQPz
         5FGqZYZEi3gi6Fo4cuwjI7pOBfDN8qmpnIwkiYGNk8nFC5C9P6mz8rreMrCGpx4DUzoQ
         /yuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=znmARRiQVkqC85lKLifIrCv0U2JcIdQKNsLQ6jRH+xY=;
        b=qg5m4QNiU3IuoGiZpiukB47ENk4ITGyJAjil2spsbAwllJbRcDzrjk5fvgkrPkAQPa
         4iazWY188DP8hcNfv/4wL4wyVYJdLhrz5Ud7BOI4TVfK7mizLWiTvdGyd5Fu3j/Okh1Y
         FzPUlh3PE7vWJQcgMMZAn7PGADcI8L7yJx8zAHuvgul1mZd5GMVehF7toTS06okoXb6J
         snSm333mvrWway9N9fbakO+2IYgaVho8TP+akXLITJi9HAh7WdPIKKV2CylqDoKDfIzQ
         nUD3vOYAoNT4YKnSfQlmfuqoE9s98AQ4oD4Ke9FMvL7H4eZ4DJZe5uaR7dvLEryF4uNC
         ruhA==
X-Gm-Message-State: AOAM532m0JyNWUeX2hezcvN2UY+Cy4VD1R89g00WAZn6FYori9a5FXO5
        Nif1sEtga5h7IZMHYLzO2WYtqDl+CA4=
X-Google-Smtp-Source: ABdhPJynV9gKczr8GslI4IAihm3p6jxKMIoLFMgQtYbWS/Y0NWCgFTjd2R0DmPdtmlaURv8r5n4D9w==
X-Received: by 2002:a17:902:e793:b0:13b:9cae:5dcd with SMTP id cp19-20020a170902e79300b0013b9cae5dcdmr12772844plb.53.1633746030043;
        Fri, 08 Oct 2021 19:20:30 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id pi9sm444692pjb.31.2021.10.08.19.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 19:20:29 -0700 (PDT)
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
Subject: [PATCH v4 01/14] MIPS: BMIPS: Remove use of irq_cpu_offline
Date:   Fri,  8 Oct 2021 19:20:10 -0700
Message-Id: <20211009022023.3796472-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211009022023.3796472-1-f.fainelli@gmail.com>
References: <20211009022023.3796472-1-f.fainelli@gmail.com>
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

