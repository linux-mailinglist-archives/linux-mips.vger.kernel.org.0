Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39A7141B5E1
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 20:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242193AbhI1SYH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 14:24:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242178AbhI1SYG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Sep 2021 14:24:06 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9EC5C06161C;
        Tue, 28 Sep 2021 11:22:26 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id g184so22098927pgc.6;
        Tue, 28 Sep 2021 11:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b+ZBi3anDomFQV4e/giygkqAUlU4kNEpUMbqtcbvyD0=;
        b=e2HJ3c6ZwWUFLdevBMc1GkHSS88vwShLGGfOz/pbGGDRcNXpXWeNIxdt+84S8LZuLi
         jtUY/y/e52uKXENcXcK55HHN+MaGQ2/vGbLiuWp21FdiogwKKk8aC7XoXAKlLeY//sid
         yLL6LEGsYXE21szIxif2OOIB/qhfKUQSUAWTskCrG+PZSxPj3oiGl2vXE6vA2ov98buj
         rHowgod9EL52ADB0YjUzw1/XK1G+z3ktB5/H5/u0qlwDkqcCDhaec5DZoLO+ATMCsRZH
         z+IXaCe+o+TbPvy6Hk0xhJzq4PUcRj7QNG9T+5WP8PQ3qyINftNO+t8cKQWpUPabbsg3
         5jIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b+ZBi3anDomFQV4e/giygkqAUlU4kNEpUMbqtcbvyD0=;
        b=rBOFwlV2BcTUXJcocT4p3lDQ/L0pg0+/0YvuENH55+OX4UG4mtysxCOJjEPRdSlvr/
         OWmlpNhho6xheAEIfPwZe1q3dWx360cX5hW4Nvzdqb5Bn1KxMmqXxIQ1E9mdApJu8/ia
         Wc34Lyzf+8SPQRN4BGhwhFUuyOK5pqgULQrb8L2z1jK84cNdBn8FWFpnJaXiDD4MsuYh
         0NUqwbpsKYuH7/OWV4NqTFWN2v1z+Xh55FTDVMaePwggf/vB2p7SzIFOviDcRd3PRnc1
         sYU0MveFnB8OY2zQWHrkv6BM+Tl8O8WoT2q9Bq8JQwTmb3AeLgiNkRLiVW0XRcZRS+oA
         KYxQ==
X-Gm-Message-State: AOAM533Py2QcOcDRl3HYTcKTRgtezp4oE7LBpmFrEeNZxJu2mupRbJeM
        8zS55NodcobfwRszGd/yqK4Yhi/EPhQ=
X-Google-Smtp-Source: ABdhPJzzSkYVoZXOkse0RijrGCPDHq4DWBO0lF4oSKo1mMeB4ZYLTmF2x0/q85KsvpG2ZNGSLmLZ0A==
X-Received: by 2002:aa7:989e:0:b0:44b:2d81:8510 with SMTP id r30-20020aa7989e000000b0044b2d818510mr6929389pfl.55.1632853345920;
        Tue, 28 Sep 2021 11:22:25 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id x19sm20855288pfn.105.2021.09.28.11.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 11:22:25 -0700 (PDT)
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
Subject: [PATCH v3 03/14] irqchip/irq-bcm7038-l1: Use irq_get_irq_data()
Date:   Tue, 28 Sep 2021 11:21:28 -0700
Message-Id: <20210928182139.652896-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928182139.652896-1-f.fainelli@gmail.com>
References: <20210928182139.652896-1-f.fainelli@gmail.com>
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

