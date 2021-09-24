Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B60241794D
	for <lists+linux-mips@lfdr.de>; Fri, 24 Sep 2021 19:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344526AbhIXRI4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Sep 2021 13:08:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344766AbhIXRIl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Sep 2021 13:08:41 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44F54C061571;
        Fri, 24 Sep 2021 10:07:08 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id r2so10432383pgl.10;
        Fri, 24 Sep 2021 10:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HFON70fhXDszaD5v9yYPo/8gY6ecjeQthvGng5DXIkI=;
        b=p9/Xdxmso3Xm/qtL+MqVDXpgCgoFff6i5El9II2B9P95NvBEwq0iZfFqWsZz4C03Wx
         1gLLWHS5WgtPjt8k8/zsdhlQQh06P0GZHW84uYInNhzO+MktccGpsPwZIOvikSg6DGIW
         UxKXHGPJqUSgyajF1N96Ra7vEkFJbbb7xdwngjFAgX1Dmz1LnWdzrbh6fyPe5HvdYEnq
         3xhjL2L/B+HA9hd3iEJSyzho2Xm6QqX1Y/2zeud9Iu6V4sFVtmVZkmvmXMshq2wn36UU
         voYqt4LRugDBN080c1tX0z3KoyGDVgmbOfGVkviRzD8W7lKB3cFTWMN+bTe5Q+D3nUb4
         Foeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HFON70fhXDszaD5v9yYPo/8gY6ecjeQthvGng5DXIkI=;
        b=zN5IDbp6TyWwFTnSp0d3UkTmlskCUQcJOGB6rp2A/XMHWcvt/DujOxEMj+qbWB/PMU
         2gIqxCt3XtEuU8b8RQ+GfrnPCnkjjJXenrDiFqSzCPwqPxbxGTq1sEnFEaesuOGQGeFF
         ZGO0SPetMmtWdb5kP/mTg/WkpD1aaNiRW19HMAvDo79uYEKxAJio4nIC8GfqGWREF7kc
         1AZdxm5Xf/JnS1CFWXMfI15HqkxOpQxcFGSs5sQskrfTsrATBq3qJ0F/WSLE4EzGk8PB
         reOs8nOX0Mtck4lln7WYp7jbQcK5/Ye3bx9gw5fMavzkeskCB/8EfiG6s/UcTy/roQDY
         182g==
X-Gm-Message-State: AOAM531QgB9lkfkUzeu8NbPRbX88xoGJDurDvBG9RhPG9EXstzFu6D2K
        car3ykxRTTy4i2b2xgMVqU+3Wgd8o8w=
X-Google-Smtp-Source: ABdhPJxvu4S59caJY73Fi8OniOxfyNWURdEFUc9YYwCqTozmK6Cc87FKJnmIffCWzyZ8Rk5U09TUPQ==
X-Received: by 2002:a63:5fd8:: with SMTP id t207mr4641623pgb.123.1632503227515;
        Fri, 24 Sep 2021 10:07:07 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k22sm9659312pfi.149.2021.09.24.10.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 10:07:07 -0700 (PDT)
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
Subject: [PATCH 08/11] genirq: Export irq_gc_noop()
Date:   Fri, 24 Sep 2021 10:05:43 -0700
Message-Id: <20210924170546.805663-9-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924170546.805663-1-f.fainelli@gmail.com>
References: <20210924170546.805663-1-f.fainelli@gmail.com>
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

