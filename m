Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA44B41B5DB
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 20:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241488AbhI1SYD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 14:24:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242150AbhI1SYD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Sep 2021 14:24:03 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1A24C06161C;
        Tue, 28 Sep 2021 11:22:23 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id s16so19697614pfk.0;
        Tue, 28 Sep 2021 11:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GyK23hCAo9rrYB5DytAMn+XEn6byxlXYhtxgWpFOWzk=;
        b=Hoy4HcV97uiRKlrKZ8mLkU5PvdCJfz+bpA0IIx93/v2A/84zOx3g9XBn0knqgZ36js
         Hq/B3hunA5byE1eIX67a122f9V6A3fRqAhPvMIecJt5jPG43buORW+JCAMBSS6Yagyu2
         Oc3/qsqo6qoRyA7J8Q4CYozEslv8uBpaMAfBYT+9rJP3S/Z5DG9vkjte85EEVq0Varov
         PlagZ25JzmaloPZugg6nlLdfOGX3Y8RdAQZMHTdBsCeBkzlkJAMQsjUNQHcC66nRj/aO
         XugN6AIxQUDtYH2EMQAJcu2k4HhcZz6TxPW4SgD4U8qTgIaDXGobqZZO5NX/scr391u0
         pjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GyK23hCAo9rrYB5DytAMn+XEn6byxlXYhtxgWpFOWzk=;
        b=GRK8wkjEvxQkt9MHrdWBbRgnUUbYSM7CE1jpF2z2JHTqbCecE2kjjGucJd8VeRp4Gc
         3evfqxoTqHTjsJAEeKIdLel3vo51tJ0gYbVhaF4G2UKOzQe5NQnQ+a9MIIb83npjf+O5
         daTW/9CwHMceQdSctrikyyPm07zPnlyD6eI6oy9fvpj6foch+zn4P0/B0cEDy9CkW5X0
         CDp+r/JF90EdsM4D9PflBFiYjMK+lh64loASEp6leXP+pF3aRQgJS1m6wqpIFFNifBPj
         lbEHgoSxWhK1uFNvw9Jur1dwegDZkCfyq+90/c4WCOEqX+LojOJP9nyyT2fK9/fev50z
         iUaQ==
X-Gm-Message-State: AOAM533kNUnx5Wn453Bpt3eLFaU/fRFoKr0DHri8QmsmyxDUcBbqVoiu
        pSWdcxFJHnh1p4N0cVw2Fvu2NC6L6Fo=
X-Google-Smtp-Source: ABdhPJxyxge4NVt6pGsy8e42QLleQv658qttZI6/lvxewzvQ6eD3yNOrWrjwbU0WyM3FBqN1mN1KJA==
X-Received: by 2002:a63:9d0d:: with SMTP id i13mr5800357pgd.117.1632853342879;
        Tue, 28 Sep 2021 11:22:22 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id x19sm20855288pfn.105.2021.09.28.11.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 11:22:22 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE...),
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM
        SUB-ARCHITECTURES), linux-mips@vger.kernel.org (open list:MIPS),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE)
Subject: [PATCH v3 01/14] MIPS: BMIPS: Remove use of irq_cpu_offline
Date:   Tue, 28 Sep 2021 11:21:26 -0700
Message-Id: <20210928182139.652896-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928182139.652896-1-f.fainelli@gmail.com>
References: <20210928182139.652896-1-f.fainelli@gmail.com>
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

