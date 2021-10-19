Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB199434103
	for <lists+linux-mips@lfdr.de>; Tue, 19 Oct 2021 23:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbhJSWB2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 18:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbhJSWBX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Oct 2021 18:01:23 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAB8DC06161C;
        Tue, 19 Oct 2021 14:59:09 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id m14so1149898pfc.9;
        Tue, 19 Oct 2021 14:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G1RiT4GRKPcXSkOjyrks/jOWZL3DTQpMJtRhCsgVjY8=;
        b=cyzCM8cEq98+2JVInYARdzvnPFDlb+RpcmSxGjOnuPsTHUOiMok/KttJldug/14e8M
         rQvVnOyJ0CELKk8zzWnj0ffDJDHKcoQ4KTlUYzf8nLXmXm0aQq+BK1FeklFZvir79kyv
         lWfVmE/A64KuJHq+tZWeo+1PgoyOuo9FNfsSNPpyS+8V0dAF265+uleCgPN8vWjn67W5
         h8rj5Jb3ITfWWh4W0gfJECjAMnOdhIviVMm+OMMTDszHr1W5jCJd2kq4XsWkW4dfguPj
         L+BsJeVzfw2kFltIQEdVeWByilZqd4OhMBVOTgAH6SB4uABOe3o0mXXY8MqCZ3JJs295
         RChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G1RiT4GRKPcXSkOjyrks/jOWZL3DTQpMJtRhCsgVjY8=;
        b=ChGdIs78xbSN4aB40VcMHzXSTBAzCWsgaMIYx1vPasOFyPsRlX8i26TvsfT4W8Kvlg
         oBLmnUsKDY1XUNbB4Ea3RfHlXlqpA3VhdPeos0yLfy5vPX+YNwpNSimaGekA5m/kSeyv
         PO7Iwbfql9KXH81MhIyaNywUI833gLmxebcp2HgDEsjm1ezkJeS5LoRwmAZXJ8Z2rdEH
         KHQz5cQKJJ4oRgUljoLTzDMJgMru0RlC8WjkPRZtaGahEQMU5PEc8nq6LHGRosxrVpaw
         bUSmdUuiDCcbiiHVgDm1/ff9Vuur4Nz2p3fEVaovbgO0kiLNUqW/GUi3ZPZZZSDFxJ4s
         ihew==
X-Gm-Message-State: AOAM532R5FtfXW7eiCor9mPYXwceUkot40FLSerHFXKn3/7kQRDAkwqE
        oQxc93/XjXVVs/NAUYnELfLKSiXekok=
X-Google-Smtp-Source: ABdhPJyvXt8tiZQtburDOapFUkwxCPRPZJWC0e1+JlkT1IrqiUQ8MYGqccDWPCmqXGW0OBwRnOhxrw==
X-Received: by 2002:a62:804a:0:b0:44c:5bfd:7765 with SMTP id j71-20020a62804a000000b0044c5bfd7765mr2360576pfd.83.1634680748991;
        Tue, 19 Oct 2021 14:59:08 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id bf7sm139325pjb.14.2021.10.19.14.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 14:59:08 -0700 (PDT)
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
Subject: [PATCH v5 05/14] irqchip/irq-bcm7038-l1: Gate use of CPU logical map to MIPS
Date:   Tue, 19 Oct 2021 14:58:46 -0700
Message-Id: <20211019215855.1920099-6-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019215855.1920099-1-f.fainelli@gmail.com>
References: <20211019215855.1920099-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The use of the cpu_logical_map[] array is only relevant for MIPS based
platform where this driver is used as a first level interrupt controller
and contains multiple register groups to map with an associated CPU.

On ARM/ARM64 based systems this interrupt controller is present and used
as a second level interrupt controller hanging off the ARM GIC. That
copy of the interrupt controller contains a single group, resulting in
the intc->cpus[] array to be of size 1.

Things happened to work in that case because we install that interrupt
controller as a chained handler which does not allow it to be affine to
any CPU but the boot CPU which happens to be 0, therefore we never
de-reference past intc->cpus[] but with the current code in place, we do
leave a chance of de-referencing the array past its bounds.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/irqchip/irq-bcm7038-l1.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
index 14caf32dc23e..3c4e348c661e 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -28,9 +28,6 @@
 #include <linux/irqchip.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/syscore_ops.h>
-#ifdef CONFIG_ARM
-#include <asm/smp_plat.h>
-#endif
 
 #define IRQS_PER_WORD		32
 #define REG_BYTES_PER_IRQ_WORD	(sizeof(u32) * 4)
@@ -127,7 +124,7 @@ static void bcm7038_l1_irq_handle(struct irq_desc *desc)
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int idx;
 
-#ifdef CONFIG_SMP
+#if defined(CONFIG_SMP) && defined(CONFIG_MIPS)
 	cpu = intc->cpus[cpu_logical_map(smp_processor_id())];
 #else
 	cpu = intc->cpus[0];
@@ -301,7 +298,7 @@ static int bcm7038_l1_suspend(void)
 	u32 val;
 
 	/* Wakeup interrupt should only come from the boot cpu */
-#ifdef CONFIG_SMP
+#if defined(CONFIG_SMP) && defined(CONFIG_MIPS)
 	boot_cpu = cpu_logical_map(0);
 #else
 	boot_cpu = 0;
@@ -325,7 +322,7 @@ static void bcm7038_l1_resume(void)
 	struct bcm7038_l1_chip *intc;
 	int boot_cpu, word;
 
-#ifdef CONFIG_SMP
+#if defined(CONFIG_SMP) && defined(CONFIG_MIPS)
 	boot_cpu = cpu_logical_map(0);
 #else
 	boot_cpu = 0;
-- 
2.25.1

