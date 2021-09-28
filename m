Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27C0A41B5F3
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 20:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242295AbhI1SYa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 14:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242269AbhI1SYZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Sep 2021 14:24:25 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C929C061777;
        Tue, 28 Sep 2021 11:22:38 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id x4so7289226pln.5;
        Tue, 28 Sep 2021 11:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HFON70fhXDszaD5v9yYPo/8gY6ecjeQthvGng5DXIkI=;
        b=TRNqeeyOc2dTMBpj/t/evLTt1xlZ+tgAwIGyAYXn5BI1VSehnIbS4fa+iwKmrLgHc/
         Ym7MUpvJDUaRkx0b9C2gGSZc9Q5i2X1H+N7YIXftvnEF/vgXsPng6kbTzZR8cNGCBnPn
         kJ8DJgq8j9XEFG5UOhLsmtjhxrvNiLQ+ZThHDxhiBZxu6wXZH72azpxT4fcqNuoiUWDc
         ID0SBskB9VlY60tfxMggrQmEX+jnoAqy67Owsto3K+AJ9WwrOXlSdpWc5UI7VWCxRATf
         DfWcxGdYfxW6fcZlsqodmdCifLTpV75GHRr4vet2aurGJgPB+2tI9Pcw5w1KbppGNcWF
         GV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HFON70fhXDszaD5v9yYPo/8gY6ecjeQthvGng5DXIkI=;
        b=QB2ulJhcN3+JUEsv7ARanHfGksRiZVywHace7wxBI5YwE9/2tWaCq/ppB13HU8VeCe
         PQzH2/AB37bZQ8vWtZMEqR+lYLpBY7ilg7XYkA/gOaTnc5HGs7yvamUEn2+F+eMH0B8L
         nZqQ3RAPhij1mJ45bnxOefB73n5P+ahlCUCrscuRyuxXT5uGEPYce+184tujFRSBuqW6
         wqNExsbc8p1MVbvbmdrVtq6qfrngNSrV4t1Ba8fYEu7bsvGrynUedR83q6cRUfwItxup
         hjJmbJ/ivGVao5PzXxE+qo7PGFaFbtcYuIZbhsi+3TfG5pI8z3uKzp7FWjr7x5dLYWae
         6OeA==
X-Gm-Message-State: AOAM533negzSdsyehOhuvBfteWneGg0izShrJPM86ffW76A15K+As9HC
        vCl00mDLHIasig9RoRRiaMTcV6IqDjU=
X-Google-Smtp-Source: ABdhPJxz0Dn+bupuDiWFHNrQF1YsxjDKqfDJ4ZXnS+pWTunA85l0/rfi+UZAKeK70Fr9OcQvsodYsw==
X-Received: by 2002:a17:90a:f3d5:: with SMTP id ha21mr1467834pjb.93.1632853357239;
        Tue, 28 Sep 2021 11:22:37 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id x19sm20855288pfn.105.2021.09.28.11.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 11:22:36 -0700 (PDT)
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
Subject: [PATCH v3 10/14] genirq: Export irq_gc_noop()
Date:   Tue, 28 Sep 2021 11:21:35 -0700
Message-Id: <20210928182139.652896-11-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928182139.652896-1-f.fainelli@gmail.com>
References: <20210928182139.652896-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In order to build drivers/irqchip/irq-bcm7120-l2.c as a module which
references irq_gc_noop(), we need to export it towards modules.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 kernel/irq/generic-chip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/irq/generic-chip.c b/kernel/irq/generic-chip.c
index 4c011c21bb1a..6f29bf4c8515 100644
--- a/kernel/irq/generic-chip.c
+++ b/kernel/irq/generic-chip.c
@@ -25,6 +25,7 @@ static DEFINE_RAW_SPINLOCK(gc_lock);
 void irq_gc_noop(struct irq_data *d)
 {
 }
+EXPORT_SYMBOL_GPL(irq_gc_noop);
 
 /**
  * irq_gc_mask_disable_reg - Mask chip via disable register
-- 
2.25.1

