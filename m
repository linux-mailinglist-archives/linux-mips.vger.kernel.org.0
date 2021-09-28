Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7321441A55C
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 04:28:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238545AbhI1C3o (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 22:29:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238655AbhI1C3o (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Sep 2021 22:29:44 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7926C061575;
        Mon, 27 Sep 2021 19:28:05 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id k24so19632522pgh.8;
        Mon, 27 Sep 2021 19:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GyK23hCAo9rrYB5DytAMn+XEn6byxlXYhtxgWpFOWzk=;
        b=e6hUsgp9s+6hi7FCBSwpdIC1kHArvrqQ4n8QTdtgAoAMxX/qpQeVbi70ewlXcwVHrF
         tduiSMubvBsYxyU/ZCRx5j7UmiWLCXERE/GncKmEQa+79sau74qMWguGqbfnQ+NGjxRr
         2OY+vZEjnX/foqslYn0A9GKA+7a9F/ECEY6GLtfDQiVPE+e9v4KN+Xhv2cnI3kmufPbb
         sHVn82nNvgEYY/Z45AQAO0fjHyy0gW70h/FRijjnkEwk8EMgaAlW7kS0MofxiFLIDbC6
         /u5Oeoaf6AU8yWuwifuhAn9uFP9I0iNcFRZSTFJnJg2+Hh0W5RFaqyXaGWVW1XKW7UOh
         wJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GyK23hCAo9rrYB5DytAMn+XEn6byxlXYhtxgWpFOWzk=;
        b=pfS3G7+upp9bfXJDL2ciflSX9ajG6k5LjyccguAHa9wK8yKBk+swLEDB3OCRs45QwJ
         sbv0/k23xWHXyMlolkyvFDHw8L6os1U0okYuNFnMcWk5WP0Uy12pHH0k+KlCFEbEkR8b
         xZLj7VCoLjt8lDL3yZHtSzhPM9LdfwWNfTO0bDLheoQj5pHXxD02hqULLcmjMdTJ+ZPX
         S5k60OVYyeMowngMi78YvN7xOEp1EjvF6YeKj3wsPHi6csHHix9u5+5FcqJa+5c7SAOj
         tazZenJ2YSgoM2sOJDst8GjfBl8pfNjT9XB6ZlKXXGqpFgJ+Yz4PXLYoamPQWTAhTX2w
         bHBQ==
X-Gm-Message-State: AOAM532qeughZ/DGVwe6oOsu0NmFwgi6iSBf+3STGxewxTqxv6mORXmf
        WtSZltHVkoOj7OL+E/IZ/hriUW7es0c=
X-Google-Smtp-Source: ABdhPJyobfyudPj6n9/ZS0q1ZaVWwjhrSnMWDSUeZb/5aL5YPeLO6y66yGwrVd9gtKKVeT99JygWWw==
X-Received: by 2002:a63:1d2:: with SMTP id 201mr2448429pgb.2.1632796085141;
        Mon, 27 Sep 2021 19:28:05 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k14sm633261pji.45.2021.09.27.19.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 19:28:04 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Russell King <linux@armlinux.org.uk>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE...),
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, Marc Zyngier <maz@kernel.org>,
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
Subject: [PATCH v2 02/12] MIPS: BMIPS: Remove use of irq_cpu_offline
Date:   Mon, 27 Sep 2021 19:27:05 -0700
Message-Id: <20210928022715.369160-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928022715.369160-1-f.fainelli@gmail.com>
References: <20210928022715.369160-1-f.fainelli@gmail.com>
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

