Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66AD143410B
	for <lists+linux-mips@lfdr.de>; Tue, 19 Oct 2021 23:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbhJSWBd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 18:01:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbhJSWB2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Oct 2021 18:01:28 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED2A5C06161C;
        Tue, 19 Oct 2021 14:59:14 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id y7so1155381pfg.8;
        Tue, 19 Oct 2021 14:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cLaNe7Oyl1seZD/HRHq9xGsMnTdlxwayLK+zY+0ZWyA=;
        b=UxZffa8of+qRMmxkBmX59yI9CaualuW1iIkSGhTsGXsRQJebcPI4ojMvSTNCwceycn
         0SVvPz9TvMUHg/QV/9VtKdJmPBQCnEzG14KTxi21rLqaHzxpY8gm8gdAyIm1B5ohlN6d
         mdspW0614fbIBKuR36i9VX0IMYbvgZi+L+hq+Vrs6ePQVfXr5BJxTEF/RnIeHABCmal8
         sS+GInlNEgp5Ll5HM60DVKUsvbt31bIxEb2uozduRvitvOqsMQ1WC/hlN52+swE552P9
         FMWtcI8ADB7m/L5U603PwB96dXOjZeqne3LitVXpeqaJQuWewPYLnmVNJgaypAP1Xa7y
         4QyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cLaNe7Oyl1seZD/HRHq9xGsMnTdlxwayLK+zY+0ZWyA=;
        b=x9M9Su6JU/ZhjEEblyKsr+DBOpsx4W0n1Tyw9pPbJmMX9NbxXouGp7WM05cUmVHbjC
         YQD+uXD0w5n7rWOmlxghnEIYqK6rdh/px5BsMDpGKWBcWlO0HX6ST4mFlIIlBtzYa1ZY
         3m6W4RZuvBUllUcyGwV8oTojTS0EE3IDCzguJufeEW9CzcOIy16mg9Tb3IJwyKwetWAZ
         aePxaMCsaC972Fqd9pTRp9YxNVaHau2O8iAOoGVrdR5hU+WcPeoJ3uq843hrFYW/GOmz
         DovgSKNYOa6w1fSw9GHCR/l2cP5qP8eseB3Lj8Fo4oG8wsMoPs5ZzOwcUTNtt/zUDDDl
         +B4g==
X-Gm-Message-State: AOAM530bu/lx0Vn046JPpBIdvrwxAag6D9AzyXM69adk9yJMvMD516wd
        HNyLndnD0Q4MSlTUikAoW2iNzW49kXo=
X-Google-Smtp-Source: ABdhPJzH/1H0jAf6Bo9RBA1rC8dh6J6XEcNujKK5YsWIhsGlQikRSaFksEuOuAqG8A9QksCSzuNq3w==
X-Received: by 2002:a63:e516:: with SMTP id r22mr31282243pgh.197.1634680754125;
        Tue, 19 Oct 2021 14:59:14 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id bf7sm139325pjb.14.2021.10.19.14.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 14:59:13 -0700 (PDT)
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
Subject: [PATCH v5 08/14] genirq: Export irq_gc_{unmask_enable,mask_disable}_reg
Date:   Tue, 19 Oct 2021 14:58:49 -0700
Message-Id: <20211019215855.1920099-9-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019215855.1920099-1-f.fainelli@gmail.com>
References: <20211019215855.1920099-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In order to allow drivers/irqchip/irq-brcmstb-l2.c to be built as a
module we need to export: irq_gc_unmask_enable_reg() and
irq_gc_mask_disable_reg().

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 kernel/irq/generic-chip.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/irq/generic-chip.c b/kernel/irq/generic-chip.c
index cc7cdd26e23e..4c011c21bb1a 100644
--- a/kernel/irq/generic-chip.c
+++ b/kernel/irq/generic-chip.c
@@ -44,6 +44,7 @@ void irq_gc_mask_disable_reg(struct irq_data *d)
 	*ct->mask_cache &= ~mask;
 	irq_gc_unlock(gc);
 }
+EXPORT_SYMBOL_GPL(irq_gc_mask_disable_reg);
 
 /**
  * irq_gc_mask_set_bit - Mask chip via setting bit in mask register
@@ -103,6 +104,7 @@ void irq_gc_unmask_enable_reg(struct irq_data *d)
 	*ct->mask_cache |= mask;
 	irq_gc_unlock(gc);
 }
+EXPORT_SYMBOL_GPL(irq_gc_unmask_enable_reg);
 
 /**
  * irq_gc_ack_set_bit - Ack pending interrupt via setting bit
-- 
2.25.1

