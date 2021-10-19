Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF3984340FE
	for <lists+linux-mips@lfdr.de>; Tue, 19 Oct 2021 23:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbhJSWBX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 18:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbhJSWBV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Oct 2021 18:01:21 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DD86C06161C;
        Tue, 19 Oct 2021 14:59:08 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id w17so2832509plg.9;
        Tue, 19 Oct 2021 14:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b+ZBi3anDomFQV4e/giygkqAUlU4kNEpUMbqtcbvyD0=;
        b=jn9QML4KK77DYsSugzmcoMS/1b2NGB1u/HjX5lJrHxBI1MzFsQ/UO85N3H7XNBP9Db
         6sSnbegctLVAjR3i2QPHtgFSOFWqCb+xBs4954wAMB6Aul32aB+Yun15zcZQ/tF5LCo9
         I/w8HoHhQnxa/7nRVfyy1uiod3qXVk4f3VyjQoQpP0NsdPxCJNEKgHe2P1FPNMdhOawG
         CyRpHvAHruURxaLkvscPrng8VifYeMnB2ZZszM9Wax4GYvysMfeNB5Lf9yAlZ6TsVhzP
         wHYdrcXtqldANQUZmAAVkFi1NfHqn7DgBRhZrK7nyjmXGWagNa3OHtOadRDTJkJ05hUQ
         e9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b+ZBi3anDomFQV4e/giygkqAUlU4kNEpUMbqtcbvyD0=;
        b=fBxUNhBV1KQ9tOVl6y3lWpyO+1G0ZFe8fbPEqNA74bt0xaIRXOEVydM39bMdpVXJH5
         o4JPmaK/Kdp1PtK25c0UMMyBbg5TAECwGeywyHMFQX0XPuldrPH6+ATwsZ7aAbjW+ARl
         oQzxp3ZEV17orc4/bAeiecZMP+Fkv5ESALm036IK/TNr2WxVdsooazEVOK0f3MMcaEdM
         zdVlw8HTuK+poZR4FTafhvQXvmbnjMusjmU+9z7nPzXX6AIcY/Aog5qFoQgBFMMowM8K
         ly+b6QYGuxHFWp9fLLZUKlHnxh/hNNyK9Kce/laQi7MqdKQFwzL5fxWpt0ERK+FXXLYo
         hcAw==
X-Gm-Message-State: AOAM5321xa4VJGT7kqZGBrhZC3I9pWSuk3A//e7oSP/rDxKFe4LsLZB1
        wYn4yQz6lMygPwz9qlf5T7DblL1REB4=
X-Google-Smtp-Source: ABdhPJw6vrFWYOXdAx+iTte/s/JqTgZ03LVQ6UZ7rk2h0Ha78jN26yD/7ThDWzeIPkjCe5yaxltnNg==
X-Received: by 2002:a17:90a:f68a:: with SMTP id cl10mr2664896pjb.39.1634680747281;
        Tue, 19 Oct 2021 14:59:07 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id bf7sm139325pjb.14.2021.10.19.14.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 14:59:06 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE...),
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM
        SUB-ARCHITECTURES), linux-mips@vger.kernel.org (open list:MIPS),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE)
Subject: [PATCH v5 04/14] irqchip/irq-bcm7038-l1: Use irq_get_irq_data()
Date:   Tue, 19 Oct 2021 14:58:45 -0700
Message-Id: <20211019215855.1920099-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019215855.1920099-1-f.fainelli@gmail.com>
References: <20211019215855.1920099-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Using irq_desc_get_irq_data(irq_to_desc()) to retrieve the irq_data
structure from a virtual interrupt number is going to be problematic to
make irq-bcm7038-l1 a module because irq_to_desc() is not exported, and
there is no intent to export it to modules, see 64a1b95bb9fe ("genirq:
Restrict export of irq_to_desc()").

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/irqchip/irq-bcm7038-l1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
index 750156217c82..14caf32dc23e 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -386,7 +386,7 @@ static int bcm7038_l1_map(struct irq_domain *d, unsigned int virq,
 
 	irq_set_chip_and_handler(virq, &bcm7038_l1_irq_chip, handle_level_irq);
 	irq_set_chip_data(virq, d->host_data);
-	irqd_set_single_target(irq_desc_get_irq_data(irq_to_desc(virq)));
+	irqd_set_single_target(irq_get_irq_data(virq));
 	return 0;
 }
 
-- 
2.25.1

