Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B793417949
	for <lists+linux-mips@lfdr.de>; Fri, 24 Sep 2021 19:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344548AbhIXRIy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Sep 2021 13:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344601AbhIXRIk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Sep 2021 13:08:40 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1472EC061768;
        Fri, 24 Sep 2021 10:07:04 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id y5so4461278pll.3;
        Fri, 24 Sep 2021 10:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cLaNe7Oyl1seZD/HRHq9xGsMnTdlxwayLK+zY+0ZWyA=;
        b=a6B1fa1EFrAyHMDyM2bRqowYA1m2gfbCYpCnZ/RTz6m1F/Z/dQlchqxnx+mBDb+dUb
         1zBxVAMktpHRLTNreaAWvXJy2PVijGItNZakSO6PhHijTWtNuhDBF0j9KRSoTNmVdxyH
         EUwywnfXZgaSzj0u27/le5yrpqvniLeRzg1xhhDTjpWFns6sCijGrDkpOnYz2rH36xeh
         LhnmONjIKUF25mIhxriUVeFCVwZYBTMbrJGBWjjOJ2Umy0b8E/scVDHFbhD86HN9fs2X
         CN3PDE6UG6lqMgjFeAizrORVDempoxTSHGp+91ePHvUOyRZ++vTwYT4QZWvfi5ZAXnnQ
         mlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cLaNe7Oyl1seZD/HRHq9xGsMnTdlxwayLK+zY+0ZWyA=;
        b=2UfZZXQ7Lssgw80p1mRkpAd19Bg5hVl7qteu4LrPKKphT0NHou3NWw47x0oo4zoYwq
         C+7Os7oqNAy0To0Plhavmc0PbhP+wqQSTBoJVyS+bR4MRq/x32iFqQkFN2Gp8pTP1MuM
         Lx4Nad+YcHuFG+tR0lylBLTDfDVSjTTeuyR7jN/bS0Q/9NdRboEsTMuWHj3PdD1iYHeO
         u1YgJaXN83ufp2F5Epi9yRhpg2Ip4mbDQ9BPo2cC1rDLpYco915U5BmrC3dU2/nhPks1
         I4VD0v491/nNvUwkdyoxWQc+wToFZkozZc85vDhRwrdAkRKeHnPLOidhChTRzE9jQBka
         vnzg==
X-Gm-Message-State: AOAM532gWi588YG+um2PV4g+UckD9vYGqaBknHwwbwtedIrBRured/03
        2HSkJVVaZr3iDiVjJht1jJCAfXgFTIA=
X-Google-Smtp-Source: ABdhPJz92OdAzfkcpV8HuUJAcB177uT4jGMbXurYka0CQhlrf4R+Y8WUWjfM0nLp+Yz1RCQQ228a5w==
X-Received: by 2002:a17:903:187:b0:13d:fd13:8862 with SMTP id z7-20020a170903018700b0013dfd138862mr662576plg.85.1632503223371;
        Fri, 24 Sep 2021 10:07:03 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k22sm9659312pfi.149.2021.09.24.10.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 10:07:03 -0700 (PDT)
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
Subject: [PATCH 06/11] genirq: Export irq_gc_{unmask_enable,mask_disable}_reg
Date:   Fri, 24 Sep 2021 10:05:41 -0700
Message-Id: <20210924170546.805663-7-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924170546.805663-1-f.fainelli@gmail.com>
References: <20210924170546.805663-1-f.fainelli@gmail.com>
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

