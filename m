Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F48541A56F
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 04:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238743AbhI1Cae (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 22:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238745AbhI1Cad (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Sep 2021 22:30:33 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9EE6C061604;
        Mon, 27 Sep 2021 19:28:54 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id h12so3504790pjj.1;
        Mon, 27 Sep 2021 19:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cLaNe7Oyl1seZD/HRHq9xGsMnTdlxwayLK+zY+0ZWyA=;
        b=N1gTh9rFur/1mj+KHXoIm9Lnqb4rWbe1Vv1z93jHoFkzZzU71z1oo8hYDzzOZtctwe
         pgDGQuxiAz9qE9D1nw9XiPDYJJxY3sW8PrVbNEY1BpEc/ZrUtu0YNKgn1MZ6s8sldn1K
         o3VXz9Q/wK2rR9xMGWLLUCjFlTvfYFw+7LIOzKy7JojsKx/MrZ5kaVCnNxW/+Lev7qPS
         q2x7nJxZB9PM3disdALDh5NYHyAdCUGIpHifABj7bCiwvWIEow69e9pNHzY8hLMirP98
         uaRj/Duv8fBXsl/slvGpAv7978G2Bk5YI4EqrAA6tqb+n7UVnquoV2Rf+OvFIlhMgEWq
         CqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cLaNe7Oyl1seZD/HRHq9xGsMnTdlxwayLK+zY+0ZWyA=;
        b=hz3EnnY4UHOv9kVD5M7HLz/dQtY92vOXgcBtIfi4fp63y7D+qFgJ/gLZ8lUeeIb1Cz
         9ifUgBcmSsceDGClzxwIejw/Bn7Z5PqTMlvAfbGSRdAP1Soat2e1nypy1BsZ++20Tjzv
         QCCm4mJomIMV6RnYTmlfL04p/e85Z1MSVrIT2VCDYAYjV0LRrTdTOO6VUEUpfKXud8+/
         AV9aPS+2lGYb8Ddj3mCWdk0U4yO2qjDF0i/p2GB5Sapp/LbzFWqlKeVaHwpEztGIeJEz
         EPQ8i29jmisroZa43FRz8/Mhe4TmyfXb3rILwBzg0whhQ1B4K6vPO3SsPXYBNV8AgoQX
         Yq5w==
X-Gm-Message-State: AOAM533gFRFxbuIIWEvhuF4+GY6Vbh2iIA3atxguZ44DXy7fmQqXHV9V
        9+zk9wtjhcXUBo+JiUpnI3hqyNvuyJ0=
X-Google-Smtp-Source: ABdhPJyGokI5IRD5fZh1+wouMAgSK2g5E4Q+/8ilRAPfu7Qfc6axwdlu7fLnabubqDadddNY09DUHA==
X-Received: by 2002:a17:90a:af86:: with SMTP id w6mr2711826pjq.8.1632796134087;
        Mon, 27 Sep 2021 19:28:54 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k14sm633261pji.45.2021.09.27.19.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 19:28:53 -0700 (PDT)
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
Subject: [PATCH v2 06/12] genirq: Export irq_gc_{unmask_enable,mask_disable}_reg
Date:   Mon, 27 Sep 2021 19:27:09 -0700
Message-Id: <20210928022715.369160-7-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928022715.369160-1-f.fainelli@gmail.com>
References: <20210928022715.369160-1-f.fainelli@gmail.com>
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

