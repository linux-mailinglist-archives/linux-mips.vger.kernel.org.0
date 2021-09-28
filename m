Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE3B741B5E4
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 20:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242232AbhI1SYJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 14:24:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242206AbhI1SYI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Sep 2021 14:24:08 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42404C06161C;
        Tue, 28 Sep 2021 11:22:28 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id y8so19619784pfa.7;
        Tue, 28 Sep 2021 11:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G1RiT4GRKPcXSkOjyrks/jOWZL3DTQpMJtRhCsgVjY8=;
        b=DJQskZZ4po/z5W282K8NSiY/GLTaICYDm+aMHSuEiDYSmbTB3BATU5QOsexPRVblZh
         ZCJgXBVB4g65DDxrBtUJwnwXNuxhJ6KB6QI4d0p6h0FAxBWsp1su4g9ZQhZIf1fpOVVU
         kv+I7qlVpFsFnm1ITCr/04viuJxmu7RlnLOepmkaAIO4oTlIumxl3mwm0io75Rb8Ttcn
         7W6BvZgg8QvPj2haenV1fq3yfNoYDmA5IR1ttIuqBx5YOtWkC4KJv5fGzR6ClxKoIIFS
         3DdZPprqHsbT57s9YcLlZiqUIH1qDgz2soxZGTjlcQ4870QDuuBg6E0CibmOHty19GM7
         qNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G1RiT4GRKPcXSkOjyrks/jOWZL3DTQpMJtRhCsgVjY8=;
        b=D6WZqhkQ0KYybhFAMcxXQkBQOCOMZ3Ut+VrMghA+xbkhwKC/CmGrK4FFlunPqCUU2B
         xhmVSGcYjPsmRFB0WxBq8TYMtW93v5rmuWuCKsakUUEwmAfuZnhI/y/rPjzc6+CSonM2
         D+vYvSmFfgOcFGz39t8wvAl2VUnVNgQeQJ5UXWXnTPfS2396QU41sgccoFV8zMz4UfFs
         Ygr5GjWqxa6MV5EeBAl3MAEXzzb7mgPKoyogc7CKLLVOrbnN7vFZW426di3pnPlofrvs
         KiGOhcLkYOgtdHLrVKWpSby11iieeEAyhicRhL0wE2+PfzGv+i8KNMUBooeD80dagPRZ
         ptHA==
X-Gm-Message-State: AOAM530EZLAgPR0APKaYgyieb1bo6ndNka1bh4wCaC56rdpc/YwFHVBm
        8FzRBfiKInAFh64W1VqmXqnCEzHCDow=
X-Google-Smtp-Source: ABdhPJwU+pmz/u0j54qGZGw+pklmbp0pUmxUzsiRS9pYuoRENNmRa1Na8U3PgjRc2FmlvaFYXVHf7g==
X-Received: by 2002:a63:f80a:: with SMTP id n10mr5773602pgh.303.1632853347435;
        Tue, 28 Sep 2021 11:22:27 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id x19sm20855288pfn.105.2021.09.28.11.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 11:22:27 -0700 (PDT)
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
Subject: [PATCH v3 04/14] irqchip/irq-bcm7038-l1: Gate use of CPU logical map to MIPS
Date:   Tue, 28 Sep 2021 11:21:29 -0700
Message-Id: <20210928182139.652896-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928182139.652896-1-f.fainelli@gmail.com>
References: <20210928182139.652896-1-f.fainelli@gmail.com>
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

