Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A04FC417956
	for <lists+linux-mips@lfdr.de>; Fri, 24 Sep 2021 19:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347491AbhIXRJH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Sep 2021 13:09:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344944AbhIXRIx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Sep 2021 13:08:53 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34D1AC061766;
        Fri, 24 Sep 2021 10:07:14 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id t4so6972191plo.0;
        Fri, 24 Sep 2021 10:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cvv2iZxij6FWrFEEKivGkcFAPGtCwuGKeJ0S/lB+6EU=;
        b=eY7PxDSo+innYXsmEeVZ1M879ZBBKPDcxIA7HrdKVgBTq/ryR5ec6Eb5ByJ6CMVWWk
         axLyq1G9Odppw6jMwFnpuEoFasQvoiqyRE+e+9Z1/+BfQmtxBE0QZexGN8Bd3BaH8Td5
         xZbkMArEFUMAnSSvGKvX3hflhkeZehH4uGzMuvezVzYfKfS6BM2FztS+lIkqEDDvp4ZR
         5ewIfXGDIePcS3AWOz8qlh4nQ974X+tOtX61dCl0HfMtpCIVLDWBYVxUU+v2zPTaw+K8
         WfC+TXBzDriWg0+ZuKmzTSoPEkimqphNoGsUjAJzkl9wWQVXJ8xN1GwVNCMcehMSWb2j
         ah/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cvv2iZxij6FWrFEEKivGkcFAPGtCwuGKeJ0S/lB+6EU=;
        b=bGQOKK890ZSQygRnBQrQeH3brIaD53FSrg3WcEUyLXhvMnHipLGfi5XnTUKs31dlk6
         gGK/f8m+A29+p4dp7k+kRDYq6OUUO0wR3vvYokOa/2LyCLXQx5pfngJ6pm+9DUqRLxkK
         yAJ0FmGCjXmHHXtMllvC+6Hbj24EvHCV/OuIEGbUJv5NCs5HpgXGxQqDUdj3vLf6whuF
         x57UhivkKiTiPtKb6itMPPm85iRCfRZ6UZ1bmMrX557gTgQf5PiFm5dlxcsJB4Y2AddU
         3OdGeHH63HZ966DMZq0Iwy1o0TTfU6XZNQ68jHt/enupFo/ddKCkhJ+OnzNbD17sdGw9
         DG2A==
X-Gm-Message-State: AOAM5328fwCkRPsYrtp9ZF7jEbC84pY7XZF0cTd+wdFboq/g4/ZuT3qn
        J1QAfzWY2CDi7I19pz6TYUGXUz2/1BE=
X-Google-Smtp-Source: ABdhPJzL+MvDPKqHl5Hx+/hujrgjmq9BtR78Dg+QhCGNwAs4BmCA7Wq9ztKm/O2zR7jvrKDo/0lfAw==
X-Received: by 2002:a17:90b:1c0f:: with SMTP id oc15mr3519053pjb.1.1632503233477;
        Fri, 24 Sep 2021 10:07:13 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k22sm9659312pfi.149.2021.09.24.10.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 10:07:13 -0700 (PDT)
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
Subject: [PATCH 11/11] ARM: bcm: Removed forced select of interrupt controllers
Date:   Fri, 24 Sep 2021 10:05:46 -0700
Message-Id: <20210924170546.805663-12-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924170546.805663-1-f.fainelli@gmail.com>
References: <20210924170546.805663-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Now that the various second level interrupt controllers have been moved
to IRQCHIP_PLATFORM_DRIVER and they do default to ARCH_BRCMSTB and
ARCH_BCM2835 where relevant, remove their forced selection from the
machine entry to allow an user to build them as modules.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/arm/mach-bcm/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
index 2890e61b2b46..bd3f82788ebc 100644
--- a/arch/arm/mach-bcm/Kconfig
+++ b/arch/arm/mach-bcm/Kconfig
@@ -161,7 +161,6 @@ config ARCH_BCM2835
 	select ARM_TIMER_SP804
 	select HAVE_ARM_ARCH_TIMER if ARCH_MULTI_V7
 	select BCM2835_TIMER
-	select BRCMSTB_L2_IRQ
 	select PINCTRL
 	select PINCTRL_BCM2835
 	select MFD_CORE
@@ -209,9 +208,6 @@ config ARCH_BRCMSTB
 	select ARM_GIC
 	select ARM_ERRATA_798181 if SMP
 	select HAVE_ARM_ARCH_TIMER
-	select BCM7038_L1_IRQ
-	select BRCMSTB_L2_IRQ
-	select BCM7120_L2_IRQ
 	select ZONE_DMA if ARM_LPAE
 	select SOC_BRCMSTB
 	select SOC_BUS
-- 
2.25.1

