Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2008041793E
	for <lists+linux-mips@lfdr.de>; Fri, 24 Sep 2021 19:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343753AbhIXRI2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Sep 2021 13:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343677AbhIXRI1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Sep 2021 13:08:27 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C51FFC061571;
        Fri, 24 Sep 2021 10:06:53 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id t20so7388673pju.5;
        Fri, 24 Sep 2021 10:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KexeGIrvAziDcYoUK48mJY3zTzuUlfhpYMgePd+knLE=;
        b=d8ZXYTgT9nfLRctbFMlW9oJzgeQzv0JrVDIRcAwL3P0PEc9aidW19XBGd4C4X1wyKD
         nYtz7N9xS7MLTtJQSEBccaAYqpEwdKaBuG0bM7Eig2hxYCGOXqDUyP9XA4BSvLq6bNSA
         tYK5pYiZQqKXU3xi5MFTdy5ohgxXJARDYuxUU4Z3m9RV5+cTnR4o9aG5BBRtGC8JaMiv
         Cr1UldrJEiOu1/N4uqi0EPcqBOjseFv1G03qwa+Ror/iZdEu+7OSPl8ei99fOgvKlk4G
         1at+HRJVsvylppI2Y1HSyAH+T9gDwRNI1upwE3i6ETYjzQf/DWvm9khDutQzeCib/U1K
         ZqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KexeGIrvAziDcYoUK48mJY3zTzuUlfhpYMgePd+knLE=;
        b=iAq9lItuI2hlmNmwkfKJ7ak3JzLaQFUwNl6iVeVu01zfvtJeLDOrKm4Ju2zB4xBTwh
         1VbVS7zzRs40b8zjQuYPMNsDlSE2h2pn6F+RX7sq51LwxxQ1z6mflQlSODjCGVashq1S
         XJyDrq3hETpiMSK7TYfYM8DFLH+os0yYT7zJs7D6wDxCIEXWehZGiYeR6hrtJBYlFXzP
         wFy6pEa/izT51ooBwlzg8XKei1EdZ3AYCIzFyMxNf4aekhoUXz0MRlKWszfduWkBOsT/
         tZ0+RM3WN9+enGLxTsnwhzfd7YPUQtY/b3ViX0DbUHMUiU6owU6+8vCBAp9CPrN+oUdR
         kFGQ==
X-Gm-Message-State: AOAM532bXMyFOsGYwrflymnNA7t7Awm1tjEFJTiZrgknaBWShuKmbtlD
        75SsPe8Zobr+UK7NNjGNC/0+34VXjhM=
X-Google-Smtp-Source: ABdhPJzJXERWobi3uw9D7vhpYswwOefbO0WzvR9hp2OR4tX1I7NfOw3pna4NkY/xgW9i8qQLlqhwuQ==
X-Received: by 2002:a17:902:6bc6:b0:13b:8622:93ed with SMTP id m6-20020a1709026bc600b0013b862293edmr10039364plt.87.1632503213145;
        Fri, 24 Sep 2021 10:06:53 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k22sm9659312pfi.149.2021.09.24.10.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 10:06:52 -0700 (PDT)
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
Subject: [PATCH 01/11] arch: Export cpu_logical_map to modules
Date:   Fri, 24 Sep 2021 10:05:36 -0700
Message-Id: <20210924170546.805663-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924170546.805663-1-f.fainelli@gmail.com>
References: <20210924170546.805663-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In order to allow drivers/irqchip/irq-bcm7038-l1.c to be built as a
module and usable in GKI, export cpu_logical_map or __cpu_logical_map
towards the modules.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/arm/kernel/setup.c   | 1 +
 arch/arm64/kernel/setup.c | 1 +
 arch/sh/kernel/smp.c      | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index 284a80c0b6e1..abd5c999bdb2 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -585,6 +585,7 @@ void notrace cpu_init(void)
 }
 
 u32 __cpu_logical_map[NR_CPUS] = { [0 ... NR_CPUS-1] = MPIDR_INVALID };
+EXPORT_SYMBOL(__cpu_logical_map);
 
 void __init smp_setup_processor_id(void)
 {
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index be5f85b0a24d..d8f796ae13c4 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -290,6 +290,7 @@ u64 cpu_logical_map(unsigned int cpu)
 {
 	return __cpu_logical_map[cpu];
 }
+EXPORT_SYMBOL(cpu_logical_map);
 
 void __init __no_sanitize_address setup_arch(char **cmdline_p)
 {
diff --git a/arch/sh/kernel/smp.c b/arch/sh/kernel/smp.c
index 65924d9ec245..8f16cfaad238 100644
--- a/arch/sh/kernel/smp.c
+++ b/arch/sh/kernel/smp.c
@@ -30,6 +30,7 @@
 
 int __cpu_number_map[NR_CPUS];		/* Map physical to logical */
 int __cpu_logical_map[NR_CPUS];		/* Map logical to physical */
+EXPORT_SYMBOL(__cpu_logical_map);
 
 struct plat_smp_ops *mp_ops = NULL;
 
-- 
2.25.1

