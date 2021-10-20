Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B72843530F
	for <lists+linux-mips@lfdr.de>; Wed, 20 Oct 2021 20:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231450AbhJTSwv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Oct 2021 14:52:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbhJTSwt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 Oct 2021 14:52:49 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2238FC06161C;
        Wed, 20 Oct 2021 11:50:35 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id c4so16278356pgv.11;
        Wed, 20 Oct 2021 11:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G1RiT4GRKPcXSkOjyrks/jOWZL3DTQpMJtRhCsgVjY8=;
        b=hEsPXiTNsHEKrv7LrTxImma40UBastHpzRHkCpg1UyvZaIZUem+ieQzNA9xZ4dh7Yl
         bTBNV8ixGN9/BjYTtrdhRxfCu/4LZAczT1Kixt1lWMUtF//kUIZ+lYJIu9x73XGL6Ma+
         wN92PvdzevimIS28e6BanTaolgM4RuwDPLbENV/WcYm8zhdj0OD95KUSlKarCrVxVXPE
         9FrGXJTua/ydZn9xrhej+AsMzNnn1B6+bAnHKUKVpdxYIyT778CWElDRkj+8S+6gT6ef
         cvomTzR5OjtuqDbTHYem5Mm0IB7+TNjBwu5LW2QZ4R6DyrsERCSiHhb08EdwueYOcFeY
         U49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G1RiT4GRKPcXSkOjyrks/jOWZL3DTQpMJtRhCsgVjY8=;
        b=mCLqPkaP0U2hYIKlqlcKXX4/2sDTXI8xOr3VEUfgFn6RK53f0m/12MrzwImpG/InT1
         sPsxA6lKwhlVWOWrWoZv4I/RdB+2rtUArpR6Wld6ezNEMTMmwxmQhscaDTv6rByTwgIh
         eoRPk02squgCE4iMmmuhQuC4ItmCwyKr3SLa1gogMecxC9ft611YR4m5ShYdpaBZ60VI
         oytgfCyBovOnBJbbf2daLs7lBPL9+DlQeFUkWFsSTrfE3S0lfHEhVxxB8UoHnQFVlU4z
         qn5jF/kNvEM2oXbOnT+Oc59PCmJzcovbA9WESEcfc4T/Nhuv0O5qiYvsrdVcsZbM4NOV
         vozQ==
X-Gm-Message-State: AOAM532BfjghHXeG7VbHsmG+EO5nwlEAPsVMIAHe/HM0n+vFUF+GD27B
        PGPPY/4styh+TymjRc16o2oF0rsr6xo=
X-Google-Smtp-Source: ABdhPJwbzWHKin126tbJWWzQImBYaNKIeFtG9nT98+ylY4/8HfKntmcN0jXAbn859i8BkSEAZ414gA==
X-Received: by 2002:a63:b909:: with SMTP id z9mr809070pge.140.1634755834115;
        Wed, 20 Oct 2021 11:50:34 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id o127sm3267863pfb.216.2021.10.20.11.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 11:50:33 -0700 (PDT)
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
Subject: [PATCH v6 04/13] irqchip/irq-bcm7038-l1: Gate use of CPU logical map to MIPS
Date:   Wed, 20 Oct 2021 11:48:50 -0700
Message-Id: <20211020184859.2705451-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020184859.2705451-1-f.fainelli@gmail.com>
References: <20211020184859.2705451-1-f.fainelli@gmail.com>
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

