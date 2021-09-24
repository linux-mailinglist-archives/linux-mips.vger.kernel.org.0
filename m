Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64C23417944
	for <lists+linux-mips@lfdr.de>; Fri, 24 Sep 2021 19:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344357AbhIXRIg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Sep 2021 13:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235048AbhIXRI3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Sep 2021 13:08:29 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01478C061571;
        Fri, 24 Sep 2021 10:06:56 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id k23so7437998pji.0;
        Fri, 24 Sep 2021 10:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hAt2r11zGETPJhbWDBDQJtoDxq6DGq80xQa/wYZCvjA=;
        b=lff3kYOYoDs+CCWEsvmA2HuIBTzYIpIEkFnWK3y6YbOXrnQPt5ILd19qTZJcBt/nL4
         3/mVv54pKrWeCTmw/u7qzfheVmu/4i2Xujwt0nmX449fE2Wz+lrxjZxNpfNc3gO3KGnh
         ywie+jUsQQmfK+dqLwz1nIclg89CvufeEo5qg5lA/FO2pIj+rM6G++frwAEp8sbvKQus
         ygKptAaGjZaCIAkFrZKHR2PVRAMrWoT3p+7cnydkN/yQkIDs8KXvL7mxQutAbBolTEhd
         6nBb5pDBJHwLQkNZL27kb8nWPEYVEfdnVr/OZ4pEMCrCVKZA+lIyeOEkvaV72mNF50yy
         zyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hAt2r11zGETPJhbWDBDQJtoDxq6DGq80xQa/wYZCvjA=;
        b=lQCi5ZetEpEZWthxJniSJHunl4+Lm/Qtr062IVGDW+umeEydLkYqMbxwPbPIlYye5o
         gCRM6+2kb/Xx/LlHV2nwRlhPfKNxc3eDnBwN3jlJOR+P7X+/AAf9sC/0jt1M+tK2vYzB
         55U/SW0RJtIQFvO04ainmx3AiviJH2AD5AULL3VjA0O6MJa9UlYK2J9Xna9FVNOv0WMH
         v4sIS9cE8F6RoY+owCnNOXG7ZaIK1T4iGudDw0cSrqQAYep8mWZCimY9F8R6kgPoSJo4
         LdPWoVqpm2B+tm+YkM7WY1X2EXUjBBgEB4YsNC91esnzkVphbtLUVltIifcxKqMKaG7H
         s1cA==
X-Gm-Message-State: AOAM532WUYCqAKbhHA9ZUVgtSKUzKXRb96QT9PP2fyXWVQ25e7FljXZf
        WfAslNuc2Y6HpLVWu1WgTktrx4GEn70=
X-Google-Smtp-Source: ABdhPJxLx4ndIFs8WwGMmBVw3tfDmXNvV2JZPukBeAlAI1kQMLB4cqYAWC7Ly9tK7SYz6iKQ2PHPPA==
X-Received: by 2002:a17:902:b18b:b0:13a:354a:3e9d with SMTP id s11-20020a170902b18b00b0013a354a3e9dmr9944422plr.36.1632503215315;
        Fri, 24 Sep 2021 10:06:55 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k22sm9659312pfi.149.2021.09.24.10.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 10:06:54 -0700 (PDT)
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
Subject: [PATCH 02/11] genirq: Export irq_to_desc() again to modules
Date:   Fri, 24 Sep 2021 10:05:37 -0700
Message-Id: <20210924170546.805663-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924170546.805663-1-f.fainelli@gmail.com>
References: <20210924170546.805663-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In order to build drivers/irqchip/irq-bcm7038-l1.c as a module (for use
in GKI), we need to export_to_desc() which is used in this snippet of
code:

	irqd_set_single_target(irq_desc_get_irq_data(irq_to_desc(virq)));

This effectively reverts 64a1b95bb9fe ("genirq: Restrict export of
irq_to_desc()").

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 kernel/irq/irqdesc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 4e3c29bb603c..5bc231036042 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -352,9 +352,7 @@ struct irq_desc *irq_to_desc(unsigned int irq)
 {
 	return radix_tree_lookup(&irq_desc_tree, irq);
 }
-#ifdef CONFIG_KVM_BOOK3S_64_HV_MODULE
 EXPORT_SYMBOL_GPL(irq_to_desc);
-#endif
 
 static void delete_irq_desc(unsigned int irq)
 {
-- 
2.25.1

