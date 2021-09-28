Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F99641A559
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 04:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238642AbhI1C3c (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 22:29:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238545AbhI1C3c (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Sep 2021 22:29:32 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96D15C061575;
        Mon, 27 Sep 2021 19:27:53 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id lb1-20020a17090b4a4100b001993f863df2so1591996pjb.5;
        Mon, 27 Sep 2021 19:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i0AUyB2sOpCKW6OjZ4jzAR2Vztgfecasij1zuMuy22o=;
        b=p9s7OQ8TW3B7mOkmDYXYe0Wq24C1wtyFzw3GockKWL2hlJ48ocOVdyr6i7w9TdbmcZ
         f66rdBbWzNHpgQWJbcsB3AxxspaY9RjokP44hFZ0PomE2u6UIDXxLKICiE4LSsHiluIL
         cW73LAiedV1l6bZCQCy8SgZES1GZST7i18vuaR2k6Gy+WlZwkCCWtGeDqSO6tyoeFBnF
         SKXXOb9gMJJIRBiZEA45MAHBi2LIQcWkV/tYx4Ui4EdwMDDAKfrblCuS1HZMQ4sS/XNz
         Au3Snoo1T2vEgLib5aV8buy0W/kU4qviA8AsvKs8a1HtToF/Dfy3U0idlMa8PNvyY8ua
         th5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i0AUyB2sOpCKW6OjZ4jzAR2Vztgfecasij1zuMuy22o=;
        b=15KfrwtFPI5uVBZdgmjAeLfFbiCskBRf/7AUUTH8t7ocMudFaUtlJdC1b4RhWQOSSt
         cEaSEEQjFMb0S2PuvhjBCx7o+WMS8UpeTMYMj3GiwdHIt97peT7rcSRVwW7m3DLPxH12
         0ZQnklqzglp6Kud3b9lDPl+SKQk6rrtiMKUgmwF++nS6uYEu2bW0aZLxdDcfqWHQ7/sq
         wFL0zVuIlYh3QnydIXk+4t+I/Yek3cK80KIQAfd8kFAHX08Zhx5s+znJxpJuQTqXeHPK
         5NdHq3ySmB7kLGJryLLkC8U2uLgxKt/neCfwKZYIqWQM+RnsW0Tsa2sEMZWG/+3BkxDN
         Ou+w==
X-Gm-Message-State: AOAM532c91o5saVWjDc8b7mXnNBLBqbOVEqJwdjNF/bnY0gzvWz4PUZm
        1AY+xvAdFaoi2LzCHJcVT+qNAgT5zX4=
X-Google-Smtp-Source: ABdhPJzGz+eVNEqSY0DfTXBtwCCb3Ikt+yFBapGOIMIO+bqczMCYnuiG3Rbvb/PFqOD5252NQXxkPg==
X-Received: by 2002:a17:90a:4618:: with SMTP id w24mr2661385pjg.142.1632796072796;
        Mon, 27 Sep 2021 19:27:52 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k14sm633261pji.45.2021.09.27.19.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 19:27:52 -0700 (PDT)
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
Subject: [PATCH v2 01/12] arch: Export cpu_logical_map to modules
Date:   Mon, 27 Sep 2021 19:27:04 -0700
Message-Id: <20210928022715.369160-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928022715.369160-1-f.fainelli@gmail.com>
References: <20210928022715.369160-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In order to allow drivers/irqchip/irq-bcm7038-l1.c to be built as a
module and usable in GKI, export cpu_logical_map or __cpu_logical_map
towards the modules. This follows what MIPS has been doing since
2dc2ae344e0e ("MIPS: Export __cpu_number_map and __cpu_logical_map.")

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

