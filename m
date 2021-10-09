Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2051427684
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 04:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244473AbhJICWh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 22:22:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244336AbhJICWb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 22:22:31 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EF53C06176C;
        Fri,  8 Oct 2021 19:20:34 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id n11so6869184plf.4;
        Fri, 08 Oct 2021 19:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b+ZBi3anDomFQV4e/giygkqAUlU4kNEpUMbqtcbvyD0=;
        b=GKRgrW9QFKOioBZo1RI+VKpq5uf6LGwK5q2jelZH/Z4LPF+xgZGOXxs+VqGU75R2mw
         weK4TN90FEmgYCwy+FrjrPTzqXgn0hPizTkv/FatD5UAQTuxvB8FTZIJRlsiyaht1kbC
         Gh0cEbcYbCQVluL6JW7zuZzLSeenNyRaBlKJVA4T48RZIsGf0Vzza11FXZ3mDfttKj5a
         YukxssY7uYec/Z9/Nb7S+uPhzw8i9B3549I3bal2AuTmL3vbku/RhSHownMTh5ewCRkt
         EyKfDAW+vlNqwxK2k1hZaQRhAjcqE/j7o3DvFevoW1jTk7DVxFSB94ANqQy0bLz0aTkf
         GN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b+ZBi3anDomFQV4e/giygkqAUlU4kNEpUMbqtcbvyD0=;
        b=FOs3UmwaH2FLyaEe9/wlXUEDgd+lB/gVekzh4/S2Tt+g593To9qfXUheOqwBX1P0RV
         AvwlspowN1l/B7LHJIiSABqmSa2/jWoLRJSHf1+PGGXrgDzZPJCjusbV/wq4A77gVyrx
         70LDnZeNmjbrqjEIErGE3rcqDwhcCFH4ugJ8g4X0vlc0m+RpWR3zQ1NzdgSzFsNze6nf
         HLYT436vI40Ds+R+lS+f0ofbSNCG7CVh1M3PfmIl+U4ZeYKBGrfWiMKXyqnH5ZBIdS/f
         FfZ5X6jUlZ+oi/JntSAUswUGUmngOHKtj9tUPhKQ0hx4EK+O2BXI7Qg1Sh4YlQUYoOqq
         CTLQ==
X-Gm-Message-State: AOAM531rXsg3iGz3YbpLvo5sAvD8aDFDkKLvb8V+d6FRkwVUsLQlOMeC
        3yuVBcq/1vqYpMHfpDC3pX0i1pEmlM8=
X-Google-Smtp-Source: ABdhPJyEJoQPpWTVdtBiJLwZn89ZXiyoahAuHDNGpbSqabP7fCIHLAdNqD7QVHIdSxf9qwDLs0VGYQ==
X-Received: by 2002:a17:90a:a585:: with SMTP id b5mr16001989pjq.97.1633746033454;
        Fri, 08 Oct 2021 19:20:33 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id pi9sm444692pjb.31.2021.10.08.19.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 19:20:32 -0700 (PDT)
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
Subject: [PATCH v4 03/14] irqchip/irq-bcm7038-l1: Use irq_get_irq_data()
Date:   Fri,  8 Oct 2021 19:20:12 -0700
Message-Id: <20211009022023.3796472-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211009022023.3796472-1-f.fainelli@gmail.com>
References: <20211009022023.3796472-1-f.fainelli@gmail.com>
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

