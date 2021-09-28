Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 228E341A565
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 04:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238703AbhI1CaJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 22:30:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238702AbhI1CaI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Sep 2021 22:30:08 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B51C061575;
        Mon, 27 Sep 2021 19:28:30 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id q23so17592612pfs.9;
        Mon, 27 Sep 2021 19:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b+ZBi3anDomFQV4e/giygkqAUlU4kNEpUMbqtcbvyD0=;
        b=MplEqzzK4xTC9UAcbtroCY+QmIaqPsRBpGlDBsCEIKYFMuYDE/MVKodgGAiLpy8P8m
         bLx/lzjNcqqxkZs3MK+MV7UuEUV1v2RrG3EpzzeWvSAfj8Z31avBXP00FBt+GkH2uyS1
         8vZL5CmeuDajceZT/wThQaphxaspS4hEVVcIXKxlJP+OjT3f3cGSUyplt+QqBXr/vB5x
         LwMwbLEpxLAllvRntp6uDXVcATBelyFbahZPWDn3JkmBj/3hbZuYg8iDFvbpHn+BsyKg
         CkBR+ZFTH0Hn6WSL6/kjlCzjPhN5ivQfxqyIrVAOlQurr3lis0ufU1g5XaR/uN/3wOUJ
         oMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b+ZBi3anDomFQV4e/giygkqAUlU4kNEpUMbqtcbvyD0=;
        b=YgXTsuOe4Dg8m2ry6/Jb9kTCOnCtW/631+dWv4So+xEKwfQmXODpvj9CousYRrwYKi
         cF03qKRe+CMxXXnVc2ZEjrRuZRr1uP7nkFerGU4GaCmZFkBvOzmWM18vLLtCj4z6pUT4
         00jFFljxzmZzuJMLZM4J4NvSK3cHXtAOhZmqOcNgdmbEG47Vi2t7BgXn4Cs+6/J0JA0h
         unJK809cNPlWRvv3lb+um2RJxndEkBL2UI7FRTBYN/sUBwJzVOOLRabbB+mtQDxkpjQm
         T5ksIknCrwBRG8lMfj47KijyV0/OuOvVnPPORL4urrsBu0Uvx0JGWMnO7CeQvMQdAW5k
         k0Dw==
X-Gm-Message-State: AOAM532lqZOdNJi7dWHHPUsIX302pBqLToGxl67T7ErONWHs2CZwAi07
        holMFvS1yZoTSHGDFE/0730D+S6XhV0=
X-Google-Smtp-Source: ABdhPJwsXY5F3fh8v41zCYbr8P4388C+/C1KS0egA3vuIqQk3LKWhTCOUeUZOGdx2akQ5y0x5HXy4w==
X-Received: by 2002:aa7:96e1:0:b0:44b:7b1e:1cbf with SMTP id i1-20020aa796e1000000b0044b7b1e1cbfmr2900209pfq.29.1632796109539;
        Mon, 27 Sep 2021 19:28:29 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k14sm633261pji.45.2021.09.27.19.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 19:28:29 -0700 (PDT)
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
Subject: [PATCH v2 04/12] irqchip/irq-bcm7038-l1: Use irq_get_irq_data()
Date:   Mon, 27 Sep 2021 19:27:07 -0700
Message-Id: <20210928022715.369160-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928022715.369160-1-f.fainelli@gmail.com>
References: <20210928022715.369160-1-f.fainelli@gmail.com>
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

