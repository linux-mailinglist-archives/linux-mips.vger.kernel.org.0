Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3FD2427690
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 04:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244463AbhJICWy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 22:22:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244357AbhJICWi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 22:22:38 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D3B6C061768;
        Fri,  8 Oct 2021 19:20:41 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id pi19-20020a17090b1e5300b0019fdd3557d3so9090733pjb.5;
        Fri, 08 Oct 2021 19:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cLaNe7Oyl1seZD/HRHq9xGsMnTdlxwayLK+zY+0ZWyA=;
        b=gLZsVmimLpwdtSBi4C9L0jfoIeRjzgLq1tNByCwcf/Pgmt8XK6gt3GE25RbSb+aujd
         1RAq+b0Cw56Hdb1CUCjtznchKAhDAGNN03iTmuRHXbhl0D1+RdUSFuFSyGXYg7DE+yJi
         Y5fkROAfSMIrAQW5gNYVpmMUoSanPPLDit+e/S/uJb8Zzp6TfxlDVPokMfEdT0RhOZ7y
         VhjTy2oTMuYqM+CDyQJDhw7r6RoKw+CQ1wnOo5B97k/91L2kgIfMN0H6iNQSv2qCGLqj
         G5x5eVnUNOEe/g+WWD+mYhM++op2NIVQd57wlQxOIFafjFFZhLD1cO/ocjfibA2RvSat
         PWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cLaNe7Oyl1seZD/HRHq9xGsMnTdlxwayLK+zY+0ZWyA=;
        b=EwTwilFznAN0vc9vqT/nKx2Ey8/rItYwMBYtLRWfxLvq1BrJwZk75hLiFk/AjKRg9R
         NMy8eNTnYQT4g1wpK02U6p7IY9QieShyUhg32OO7e2GHv7Kby6dZezpLdWBKRZzx3mXi
         oivAyyFuyYV8vcUwCY7nhVTDfssy00sIv4Bi/8v0v6XeNyJKBTyasTY+tpFVA8l/5skz
         No+0aP06DLfPtESsp0HzYRWD17fwozMTRoyp+igfAGJfEtXllW99ylIqxvcXYwB8hqpD
         99jwJQtgxgzPCD86b6U3VhcShCfGTCTJ13bmPQl422zEk9ZmRD2PJ+W/fS0PATJLHIsJ
         iWBg==
X-Gm-Message-State: AOAM530RXfLh8eYI3y9H5fIBTy2Dh6Yw+z5b1c//Q0JUXrHTnVj2fk9G
        yfxKG3I947oQ1KchDIy9rkNFvtVVBY8=
X-Google-Smtp-Source: ABdhPJz9L3vfDpAsutWUnZSpQUlLafnW1o2LTEFqy0TfbDnkzKBU2FxszoAr1cMPr3hzm1B9TszXCQ==
X-Received: by 2002:a17:903:1ca:b0:13e:f367:9361 with SMTP id e10-20020a17090301ca00b0013ef3679361mr12635742plh.3.1633746040278;
        Fri, 08 Oct 2021 19:20:40 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id pi9sm444692pjb.31.2021.10.08.19.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 19:20:39 -0700 (PDT)
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
Subject: [PATCH v4 07/14] genirq: Export irq_gc_{unmask_enable,mask_disable}_reg
Date:   Fri,  8 Oct 2021 19:20:16 -0700
Message-Id: <20211009022023.3796472-8-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211009022023.3796472-1-f.fainelli@gmail.com>
References: <20211009022023.3796472-1-f.fainelli@gmail.com>
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

