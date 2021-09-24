Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79DE3417960
	for <lists+linux-mips@lfdr.de>; Fri, 24 Sep 2021 19:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347539AbhIXRJK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Sep 2021 13:09:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235333AbhIXRIb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Sep 2021 13:08:31 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F423AC061613;
        Fri, 24 Sep 2021 10:06:57 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id h3so10440488pgb.7;
        Fri, 24 Sep 2021 10:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fSt/2Dj/eenIaIrKzQI+svTjzoFaPyRPoy7PzUBgu/Q=;
        b=PL8rk6aoND2MN3aHn1KJLrj+1n+Rs+ui8XwXbyU3+rvm2kBBqPT3fHzwBDg54gksSh
         8Ny7BkgQL9nte2Yje47c4M0PK9m2agAkZ40jHr5ukre+ZCUVkgEASA9nt0Qe6v1IQHCv
         ndBssQF4zOuPqaH1LcSjAgV285rFvFF5ms5mlqg+vcQD9ER2xaG+5Rj22plPNWmotS9G
         +TCsH0qz4R7l/SfuKW0SDhqPCvuRLiLnswNB/G3fni3/V0fPDfa7/4nGQ3iKW8YZoNyl
         sOR2nkcz5yAY65kthq/akRmE8QuNEbS372cPkj4ZFoUpJJoYx5tJaWaDojOE5X/Pm8r3
         Uxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fSt/2Dj/eenIaIrKzQI+svTjzoFaPyRPoy7PzUBgu/Q=;
        b=LMNvp14APXaiBIr6XHO1L8dmF7lJdrv6nD03JpzuVwB3T5VIt645R59zLCQ79D4N0Z
         3Uupg70YgdrObIoPLsrNFsBmI5KQLHHG1n1U4u6hK40oK+JCsgGMV8Yd5BmEaDnEaO/7
         QjnRDkjvqFmJWJXrfTuz8IZuDgefDy0I/AY1gyvQHeOy+Lf50Xn1FlBjX19EuybM09GS
         r/pWJP1lwSd8Hk9B0ic2jMIlzf5V9XHwuZZG/GwXIodf791KTbzsJnxZPESRj3egezHO
         hzGFik402PdM+A7LO0JQokwkJsIjQeeeTLdlUHdjZ3XT4Yyciu1CR/w8P84Q0ELeTYGr
         1hNA==
X-Gm-Message-State: AOAM532W0ZKhZ4M3m4Q/oYs+Te6IFCbSvWoHU4WR4IbAeVMi5roiFMAi
        iaSGbqmK8P9pTSU3y1zka1nrnfxI1cY=
X-Google-Smtp-Source: ABdhPJw9i/MXr3hPaw9fCxL4glXqdtYlk2E9G0McC+C7pit5nnMjKwn5fL2HUiGsbDopFLroVze4OA==
X-Received: by 2002:a62:2f45:0:b0:44b:3961:2a21 with SMTP id v66-20020a622f45000000b0044b39612a21mr10176283pfv.82.1632503217306;
        Fri, 24 Sep 2021 10:06:57 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k22sm9659312pfi.149.2021.09.24.10.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 10:06:56 -0700 (PDT)
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
Subject: [PATCH 03/11] genirq: Export irq_set_affinity_locked()
Date:   Fri, 24 Sep 2021 10:05:38 -0700
Message-Id: <20210924170546.805663-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924170546.805663-1-f.fainelli@gmail.com>
References: <20210924170546.805663-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

irq-bcm7038-l1 uses that symbol and we want to make it a loadable module
in subsequent changes.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 kernel/irq/manage.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 7405e384e5ed..e0c573e5d249 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -369,6 +369,7 @@ int irq_set_affinity_locked(struct irq_data *data, const struct cpumask *mask,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(irq_set_affinity_locked);
 
 /**
  * irq_update_affinity_desc - Update affinity management for an interrupt
-- 
2.25.1

