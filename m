Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F70143531C
	for <lists+linux-mips@lfdr.de>; Wed, 20 Oct 2021 20:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231490AbhJTSw7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Oct 2021 14:52:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231365AbhJTSwx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 Oct 2021 14:52:53 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BE56C061760;
        Wed, 20 Oct 2021 11:50:39 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id h193so7930726pgc.1;
        Wed, 20 Oct 2021 11:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cLaNe7Oyl1seZD/HRHq9xGsMnTdlxwayLK+zY+0ZWyA=;
        b=eWNs5Mnvme97WQSMJokR02PWbB2Lbzy5vzIqzjIjmzrxvXbCddeL0g1HcZOptmr9vt
         c+FAWUzmQWJjMRHPgSRszzdm54w0lujwkDFs6c0hfReJUM8diXofq3zEB2iBK0W7hIKa
         I4uh9s6tMyhUdQUmEefAO8aPpZjD95xd6NdaGMbBj1hTbZO3nnJyO1YJ4dwIAzx7+Go6
         MEsFOX/iC9gWGngcgM4XDSWlwFSTKuoDsQPua1Dd8KExboRqJyCg14aZTnl/VopsSOvC
         LuibhxzAX/OY8QdNFwPGx2+FoiUJuURG0zCw/u6Z0uKuyVoIU+0csM51cAkjLzNB1Kdh
         38wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cLaNe7Oyl1seZD/HRHq9xGsMnTdlxwayLK+zY+0ZWyA=;
        b=mUDjZFAR/c3fqSJurDxxJLuh5W/1h6O0+9mDcJcoQUNNqnGLzhv1eNigFo+4d6hU3H
         pas7FDE+AEypx3KRkk30wHbnqvDBOU46SyOz1/ReoHdNHibwvrloS96VVEVji9G2TGel
         iwiz2fob3L9YA+yNqI9U0tprWHkcwvmRB2R4OvakKQ0kNK5LjABvAv/0Vnu24wqz575m
         FAsCM88Vw6hpgpkYsG0ppinQZUGcoW+PbIC006F90Ovzt2EPaepDDJ8/YeFWm6PfkAlU
         TpTmoPhCZnM3cITZ3cR7QeKCsXOF1nPZhfLW8IUxI6N7qPAfJREzYbX+aNzQUsczC0Ey
         0Kuw==
X-Gm-Message-State: AOAM530vjW+6z5LzvCSf/5DjE7ThUfjLWLGwnpmxs4/wcBCQypY+4WgJ
        jj6C4tOGsay+h50YVh8/INCbirfsp3Y=
X-Google-Smtp-Source: ABdhPJzySpSnG3P8ExOadZUwVRbxgdNtASFVaCKX6wZfO7HyjtvQIApkthnPzFi4Pp/i7ELfom0RYA==
X-Received: by 2002:a62:1408:0:b0:44d:1f0b:49be with SMTP id 8-20020a621408000000b0044d1f0b49bemr1073536pfu.28.1634755838331;
        Wed, 20 Oct 2021 11:50:38 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id o127sm3267863pfb.216.2021.10.20.11.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 11:50:37 -0700 (PDT)
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
Subject: [PATCH v6 07/13] genirq: Export irq_gc_{unmask_enable,mask_disable}_reg
Date:   Wed, 20 Oct 2021 11:48:53 -0700
Message-Id: <20211020184859.2705451-8-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020184859.2705451-1-f.fainelli@gmail.com>
References: <20211020184859.2705451-1-f.fainelli@gmail.com>
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

