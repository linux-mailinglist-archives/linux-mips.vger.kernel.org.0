Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0DE043530E
	for <lists+linux-mips@lfdr.de>; Wed, 20 Oct 2021 20:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbhJTSwu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Oct 2021 14:52:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231354AbhJTSws (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 Oct 2021 14:52:48 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84BD6C061749;
        Wed, 20 Oct 2021 11:50:33 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id i5so10543336pla.5;
        Wed, 20 Oct 2021 11:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b+ZBi3anDomFQV4e/giygkqAUlU4kNEpUMbqtcbvyD0=;
        b=SyrWs6lXbrFg4nHi9gkhr7imDQDPwnVw+lm9K8FuVphjz6EIEZ0z6LRPP/OaGuisqW
         cjP7NfsFeBxJFbCYn8vRRYJ6Jkx5qMdtXLbj5iMuXsdtgVjprDYIjNDoa4qUlFrPSDhv
         7576n2QSrXx0bn9ExpMoT8ldj4EfQmjxitxl+GzPE1tKCL70QCXUnH8h/x4dVHXZFOvs
         dFAznep6vLEwf+HUzNN3VQWXOejV2dTfmUxSPSAhUTJrioagbdIWGUHWAXDqkPWAJKH7
         6ccfBk0a1tq4KQGbNKfaLbAjbJvdd1FMd3PxOqT4FkDwSI5lLoNaXpv7mM04vLiwyx9P
         hRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b+ZBi3anDomFQV4e/giygkqAUlU4kNEpUMbqtcbvyD0=;
        b=dMnN2WX/QU4J15v1CSZx8Bky8ImSp9x5LowYfIL58qQizhhxEukhoHEdvAs79kGZOe
         oJJwPt9q8AE3z228wo+AobGGj/tUrySEvlpBhuoQuCDjY/zbwGeJ7U2l0B0ghMLhh/cw
         P6HBXBU/bxcx+kWmWnYvjbZ29tr7YPB9eWwIla4+TGxC/jxaZx1S2Z0F7VXgiSNhEeth
         tkaworD7GvoObQDU8Pl3E3VuFM/yA0Zs5R6ZkwyqCc6C590VlEHTI/NGORr5vJiy6yUK
         mq35QldgRPoKQb655yuAHilLB3NJDDIneQgwXAImZJa/UqIy3fPLXz/K84dXilmweZto
         0S6w==
X-Gm-Message-State: AOAM532Ctb6CsT38QND5yjzophLI9oo6MDe1VPgS2VboVhwPc/BKoHQc
        lCGNRIHLWrv4y45lDqhY0b8lKVf2siQ=
X-Google-Smtp-Source: ABdhPJwFIhnmeqqGhE+xO1GCa3Z4NjE7orcRZ2tZixwP4cH85iMKEWIXUdQa3ZmRj7ET1xyr3lZRQg==
X-Received: by 2002:a17:90b:4d84:: with SMTP id oj4mr745231pjb.58.1634755832707;
        Wed, 20 Oct 2021 11:50:32 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id o127sm3267863pfb.216.2021.10.20.11.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 11:50:32 -0700 (PDT)
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
Subject: [PATCH v6 03/13] irqchip/irq-bcm7038-l1: Use irq_get_irq_data()
Date:   Wed, 20 Oct 2021 11:48:49 -0700
Message-Id: <20211020184859.2705451-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020184859.2705451-1-f.fainelli@gmail.com>
References: <20211020184859.2705451-1-f.fainelli@gmail.com>
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

