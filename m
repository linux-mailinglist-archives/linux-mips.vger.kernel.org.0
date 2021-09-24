Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30EA4417946
	for <lists+linux-mips@lfdr.de>; Fri, 24 Sep 2021 19:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344768AbhIXRIw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Sep 2021 13:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343779AbhIXRIk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Sep 2021 13:08:40 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAC75C061571;
        Fri, 24 Sep 2021 10:07:05 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id 203so9386492pfy.13;
        Fri, 24 Sep 2021 10:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IR7iGEsWM4mxjXZfoqo7m6j++9do1uNMuo9CMR/SQ9I=;
        b=dpaXvMxmrnZDzjRDG9vbsfni6n6vmDUCD89VGU81gKtDOqTLjKtg8uV/3eiVRrid8f
         rXt6qppCsAjL34efPgePlTfKz0b5R2UOyuTAx9P1KiI8U+SuVsdd39zGjb/Zj5MArhSS
         yKD9fMsBnd6l/4zqxKsvshmtg7ZNzRb9AtYkuSfwkkvmBZTyCfTqv1UKag5ABLK+lDR9
         AY4WJOIVxI9NOMeuAklIkPyFQ39i8iklJEVCLlFe63iRt73kOzxuRYhgbkOksNJldLdn
         mtlAjy6P4B4KyEHPOONAviOSvhuF8RM6u6WI3aU+o3pdQp1DI/hDKBsGC+rmQ8CWJSK/
         3S4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IR7iGEsWM4mxjXZfoqo7m6j++9do1uNMuo9CMR/SQ9I=;
        b=cGLCB/8y+iyGiP1ZrAGulcMp/3nz8auwB6AnDEs5c1YRwnyi8GdPY1lOp70Yn0Iv0q
         GQOY8GF7D4YOLIgIPEQnUqppKVpKAYWeESHEyiZJ3CjHrtGnmAVKClLPk5urNz6nf2EG
         TX5PMSEdonEA1IvpKa28P959bcBo6qtGcTmIdoSZG2Wh8ug06eAG72N9Q31JLB1dKAeO
         +cwwlv5hubwtqWC+EmyvAwNhmcdHOpHtHGYLGfxsJkH+MlGk4v3XKiJwbqOZWi4wFTDP
         LUQjSrCLW2/TiC63R2HBR5jRzpsAfarO+fu79fhaht0Psl8HwbRJom8H4BxgrA/3NM10
         SDNw==
X-Gm-Message-State: AOAM530M3Mn8rL3Hlu3OaBcYAi0ye5Rwg0GKe8ijvli+o2OGa+Xwi2vp
        kj0NoghAeFjlnTP5rve7KCzmNmAw9GI=
X-Google-Smtp-Source: ABdhPJzUN9zJeKx+S71xh2ThXQH6aSN/EG/ft/rg0Z82gwjCLfZSlTo2cDLYBDJZo1sgwxvrgJlqBg==
X-Received: by 2002:a62:750e:0:b0:446:d467:3620 with SMTP id q14-20020a62750e000000b00446d4673620mr10711357pfc.80.1632503225363;
        Fri, 24 Sep 2021 10:07:05 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k22sm9659312pfi.149.2021.09.24.10.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 10:07:05 -0700 (PDT)
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
Subject: [PATCH 07/11] of/irq: Export of_irq_count to drivers
Date:   Fri, 24 Sep 2021 10:05:42 -0700
Message-Id: <20210924170546.805663-8-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924170546.805663-1-f.fainelli@gmail.com>
References: <20210924170546.805663-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In order to build drivers/irqchip/irq-bcm7120-l2.c as a module, we will
need to have of_irq_count() exported to modules.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/of/irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 352e14b007e7..949b9d1f8729 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -440,6 +440,7 @@ int of_irq_count(struct device_node *dev)
 
 	return nr;
 }
+EXPORT_SYMBOL_GPL(of_irq_count);
 
 /**
  * of_irq_to_resource_table - Fill in resource table with node's IRQ info
-- 
2.25.1

