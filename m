Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6D7841A588
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 04:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238645AbhI1Cbr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 22:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238669AbhI1Cbq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Sep 2021 22:31:46 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B647C061604;
        Mon, 27 Sep 2021 19:30:08 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id k17so17629370pff.8;
        Mon, 27 Sep 2021 19:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T26BgQWn/9mqdmIjsWawB6f+e1Yr/GOlus2xPhKaou0=;
        b=FVGOT4lE+moC9jlZYrn6KRcqzy/Eto8JdwUFBIKWXAo46jVj2EpGP3LWjwjnutgBzi
         JPp9D6ANtRqLdiBHuxCsY1P7or8P84/SKIyBEh7FuBgpX7n695VLqRbkLf6kfmJoa6Cp
         2Dzq0Bsgw0X14RSuU+APBzMJi4rZoDOER6lRUGaBMMJ8wZd2yLlxbuQTW42UMTF7m47x
         MRzdNjRL8VCdzD4MeIFrWoFWviwwuRfZBEe+BcWHYLmhYv86IpzGVWJWzmcqA9aZQOG+
         dNoAX1McnOqDwvi99kIL7irsWTeUpQrrTuC0JYkfutT5nqU5sqFitibZUT4dHS19giXZ
         l/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T26BgQWn/9mqdmIjsWawB6f+e1Yr/GOlus2xPhKaou0=;
        b=dLbR5G9Ne2jz5t1KqPfzXLxECYX3kSY6cbzHd+K2DVyJG9ys174bvHZCKJgKp4Y2ET
         309b+PYnyqdUnFG/qpQbW4toaYQF4gR3VTqGmDffxARmEs2m26SJucmlcPhgRkuAA7mV
         UXIWiv3O+qZvfGz5hXkadokD/lekDfxD26LiX41tnKuZHN/+IYwcBTRZA9otj45ilJcJ
         IFD1wQfJljHBGZS6+BT9qppDxqYUmKwj9MTDwoGAahQZ67UCvXE6QMrie4qCROif/4YG
         wXfLMWyODeEoROYOOWkTXcEofEObRFMc0+I/sdZLVqv6Am/4O1uqNjfJpYxhHEmgUiSN
         csLw==
X-Gm-Message-State: AOAM532UXIVKyU6hbP2AOQLbcLpZk/kNp3LzPCKInjdtQIbkP48qJ6sG
        IY+4nzSHU11IEVwQP0Vuod0eAmhmOIc=
X-Google-Smtp-Source: ABdhPJzpkCNeUXkhItXyGD3iX47W58VqCnRHG9hP2LXUHicm81FDwZXF4yzSj/cyNaWatglN3EgHmQ==
X-Received: by 2002:a62:14ca:0:b0:440:5279:84e4 with SMTP id 193-20020a6214ca000000b00440527984e4mr3116757pfu.84.1632796207360;
        Mon, 27 Sep 2021 19:30:07 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k14sm633261pji.45.2021.09.27.19.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 19:30:06 -0700 (PDT)
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
Subject: [PATCH v2 12/12] irqchip: Fix kernel-doc parameter typo for IRQCHIP_DECLARE
Date:   Mon, 27 Sep 2021 19:27:15 -0700
Message-Id: <20210928022715.369160-13-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928022715.369160-1-f.fainelli@gmail.com>
References: <20210928022715.369160-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The documentation refers to "compstr" when we have the argument named
"compat", fix the typo.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 include/linux/irqchip.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/irqchip.h b/include/linux/irqchip.h
index 67351aac65ef..ccf32758ea85 100644
--- a/include/linux/irqchip.h
+++ b/include/linux/irqchip.h
@@ -23,7 +23,7 @@
  *
  * @name: name that must be unique across all IRQCHIP_DECLARE of the
  * same file.
- * @compstr: compatible string of the irqchip driver
+ * @compat: compatible string of the irqchip driver
  * @fn: initialization function
  */
 #define IRQCHIP_DECLARE(name, compat, fn) OF_DECLARE_2(irqchip, name, compat, fn)
-- 
2.25.1

