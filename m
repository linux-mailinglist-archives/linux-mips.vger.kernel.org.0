Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30C2641B5ED
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 20:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242264AbhI1SY1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 14:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241880AbhI1SYX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Sep 2021 14:24:23 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13C3DC06176C;
        Tue, 28 Sep 2021 11:22:33 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id y1so14761179plk.10;
        Tue, 28 Sep 2021 11:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cLaNe7Oyl1seZD/HRHq9xGsMnTdlxwayLK+zY+0ZWyA=;
        b=GVf8JqVfE5tUe1+G4ZayP8tJOzI0A2eBH4uWjOE0sUIjzn97IhcmTXOeulmn9s3fPx
         LdHpslP3yN5v7bAojKruljU8KXtDuqP5otQXvmLNOlOGF36E+2QU2c75E/VCGLEFdloc
         sF40SIG6C+I6lP6NWjWotFUyThbdvdCNXZzNWmoWY/00nL0jWuQzbukSQuP3UkunrKr0
         DZKl1bcay+2UYauuJ4wW28THfKtJEkGhiFgqHjLRUh8zQ9JuPC4hoepAMQsZuJ+jMGMn
         1uVQQgCiwgHdPrPvzKhJLZsPnCwKcFBFbzbATAmR0U+EbA6aHdV5gi2F2q5vu5HzerYd
         u65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cLaNe7Oyl1seZD/HRHq9xGsMnTdlxwayLK+zY+0ZWyA=;
        b=HZE8dEhtmwbO+3llg2ghZuSla3H0pXfC4ngzBxEYeN+wCXkWuig8AaC6emnwDEEKdZ
         fTlaBM9i+jjaojiDIxCey5VtVK+r2WyRaE7u7D2Rt1iwxUpn99OOBHequ2Y6VGz8Bs49
         RBjuUDpDvaJ0HCfUqBz0Y3LSg275rY9ZlR+tfscAlFRVTvWsvgaOnUVg7NRFZkujJl/j
         3YtBpJtdH2Klnr7+LqrR7xEdKIUMKK9hip4mfKT8EfPhLqowTirXA1CFxWTZRhLmsY8+
         qWLGFaxqHWpQ1nzt0rkwQVZuoYj/Hso878wTw6g1H3GS7fSTWd8X2qr64QZ2yIgJ2+nw
         MhGA==
X-Gm-Message-State: AOAM531Gk0JMcLfvX5pfsOMECNDtbOfXTcukX4x0G1BYw6YfBT6JI547
        9Eol8wTpcXAMpymvIrVNYFI5luRXefA=
X-Google-Smtp-Source: ABdhPJwawjQqhVLsl67lDh7giXS6Mayn2/vDXZUilYLKdi8lu5Gz15t03jvkk//eAdF1/CsPbRGWRA==
X-Received: by 2002:a17:902:dad2:b0:13c:a6ce:faea with SMTP id q18-20020a170902dad200b0013ca6cefaeamr5977706plx.45.1632853352243;
        Tue, 28 Sep 2021 11:22:32 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id x19sm20855288pfn.105.2021.09.28.11.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 11:22:31 -0700 (PDT)
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
Subject: [PATCH v3 07/14] genirq: Export irq_gc_{unmask_enable,mask_disable}_reg
Date:   Tue, 28 Sep 2021 11:21:32 -0700
Message-Id: <20210928182139.652896-8-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928182139.652896-1-f.fainelli@gmail.com>
References: <20210928182139.652896-1-f.fainelli@gmail.com>
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

