Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A97B43531E
	for <lists+linux-mips@lfdr.de>; Wed, 20 Oct 2021 20:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231442AbhJTSxB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Oct 2021 14:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231492AbhJTSw4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 Oct 2021 14:52:56 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBEB4C06161C;
        Wed, 20 Oct 2021 11:50:41 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id n8-20020a17090a2bc800b00196286963b9so1214554pje.3;
        Wed, 20 Oct 2021 11:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HFON70fhXDszaD5v9yYPo/8gY6ecjeQthvGng5DXIkI=;
        b=Mzy2wUwwrgxYO+uSY+T18zl9jfPNUswIO7lN+3pI57CBhPftgCLNP5tkNgvmJvHC2H
         loG+OgcUxPnt1yKviyPjNI9h0blKM4SJBbG2W6DYtOeCZysqyxquMjXs08Ek/ecHiN12
         BswJNp2LEB9M5DHv0fuLDVojuAhikPMP/xCMpJeju0Exk543NkENcKx1j4KQhsviUain
         8koba5NGjc3QWJSiG7DUk2EUcSGopAK9M9kBBUtfceygCCuP31yTgd3Raj6cTQ1COG5X
         hw82ONYetbfeO2grhi6JrRNc9hju08wWF+FZvlXhMK+avMG0sZgO+Okgdljy4JB00y/p
         uigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HFON70fhXDszaD5v9yYPo/8gY6ecjeQthvGng5DXIkI=;
        b=XMriHJV/C1E7+eYutLEBuOdE+Sd/92ihuqXYkW6nkcmFHl61RE7X2xdWBlh9LrkeqZ
         BCe/krWiPsRuyK2oocM/HxDh6GN3X523oDI5Pgi6ExlUxxuvMs6mv6igd2Z2deYUm5YG
         AS2MzNQvHQzncIO8fz1QY4vM3a14JGIjPYKBFsXO1HdcdE7cw+4Senp0Zdu5H/vBgUN1
         gv2rPB/quDVU1+gSD0tBiDWr8ZdfOvDlSY/BGejoMKjK3YekRnmO3Axff37azD8n+9Gr
         srrfGMEYHle4a5ctB0EIMkQcdo9qn3hBkCdIJEonlsD0JcQmRE+c1BhIcNjBcJkyUweS
         Ccjg==
X-Gm-Message-State: AOAM530JtI5nu6+v3Jt+MUpazy/jLYv67nMVzJ4//GHiX+gqB0Qypiwz
        QVMAbWopI3TlFS/nLXicr1xQuey6mRs=
X-Google-Smtp-Source: ABdhPJz1Wx2cqB71TsgBZ8Dq9KY/cISYBxSq7kN/YB/55yMFADInG8jworo5xA/iQnanXu4glCiUKA==
X-Received: by 2002:a17:90b:350c:: with SMTP id ls12mr783890pjb.36.1634755841108;
        Wed, 20 Oct 2021 11:50:41 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id o127sm3267863pfb.216.2021.10.20.11.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 11:50:40 -0700 (PDT)
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
Subject: [PATCH v6 09/13] genirq: Export irq_gc_noop()
Date:   Wed, 20 Oct 2021 11:48:55 -0700
Message-Id: <20211020184859.2705451-10-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020184859.2705451-1-f.fainelli@gmail.com>
References: <20211020184859.2705451-1-f.fainelli@gmail.com>
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

