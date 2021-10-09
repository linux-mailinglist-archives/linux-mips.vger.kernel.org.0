Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A885D427689
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 04:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244435AbhJICWk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 22:22:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244245AbhJICWf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 22:22:35 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2033C061570;
        Fri,  8 Oct 2021 19:20:35 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id v20so189574plo.7;
        Fri, 08 Oct 2021 19:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G1RiT4GRKPcXSkOjyrks/jOWZL3DTQpMJtRhCsgVjY8=;
        b=bJ9KuSL5TgeWyqKaNO+GyL79xvaPjqlHFkgNvb4kUgxAmLsjpp8VRQ+Gx7VrYcypLZ
         abv3tPhR4NhdT1ba5/pktaJs0V2aQ0bulDU+3q7PxtU0kLZbKHktoBROaTbyBPqU56Ob
         2KDuqvy30PtmXSomEAvNea3kdOxaoNSBnz3/JgNyxLRqBLvP45gpHGDPaL3+suQaP92s
         d1MlnJUTc5eAEd4YjTFmAu8icn5KR72wyfbVCe7FqXlqsz1h5uNZ1ltr06TL5JqShMqu
         AerdQraWSF2a+EwBXrgumcUlnzD9Mr4vtYumZkHIu79I4Ja4vwvjCyK27QonQzMqUe0N
         gyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G1RiT4GRKPcXSkOjyrks/jOWZL3DTQpMJtRhCsgVjY8=;
        b=Wr4ApFEAmvIokvAWdVRHoQ+HEF8068BP4FRlyAZbuf4u/Vut7nvbhKbcpi1zi1Nqkv
         X5PWVDCjT26LJ4bKzgtyfZ7uE9kSUygRZVaqNmrvWDTCapKgM0EPFyw+8Vzo4XyeM+KP
         /jg0ueF8MsinMFMxLQNzzv8a9bfNA5ggVgy17aFeWtMk+D1mO6K95uVuYAw6CC/mSh48
         jJVAxeiJHf5g+jLqOhrGbmGcZZsV/2JiTWWFnEuqSXo7UXgcfnvUtZR8+1GBK9sHjw+E
         TIAqH82FQNRoShP6s64mQDMNEIJ2mnLqc8pg+WC+AE7/BghIintsjbkAynoBtb+5MxDT
         pKsQ==
X-Gm-Message-State: AOAM5326gXOUFrqC9bXu8BLY0wjNxltZFVHCHmpbpNEfYMIHsMYWjeSP
        9TVX92So/hfbEDYbzppB23xGuHdtans=
X-Google-Smtp-Source: ABdhPJzt3cUT0qN+Y44kkLg1/73jsgwdfZQ+cXkdb/8YqpQ6audqUIfOzS1omAW67biNzXtaW92lFA==
X-Received: by 2002:a17:90b:390d:: with SMTP id ob13mr15368899pjb.49.1633746035050;
        Fri, 08 Oct 2021 19:20:35 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id pi9sm444692pjb.31.2021.10.08.19.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 19:20:34 -0700 (PDT)
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
Subject: [PATCH v4 04/14] irqchip/irq-bcm7038-l1: Gate use of CPU logical map to MIPS
Date:   Fri,  8 Oct 2021 19:20:13 -0700
Message-Id: <20211009022023.3796472-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211009022023.3796472-1-f.fainelli@gmail.com>
References: <20211009022023.3796472-1-f.fainelli@gmail.com>
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

