Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3DC3267ACC
	for <lists+linux-mips@lfdr.de>; Sat, 12 Sep 2020 16:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725850AbgILOYg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Sep 2020 10:24:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbgILOYZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 12 Sep 2020 10:24:25 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CDEAC061573;
        Sat, 12 Sep 2020 07:24:25 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id e17so6849854wme.0;
        Sat, 12 Sep 2020 07:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zVBzGTqvqpdxYVoiSC/UOuwOFysG/MA9OYHtjU8pU0g=;
        b=XDESmSJmoOg7Gyym/5uN4EE2z9rRSl38wF0V4nJikMYGW/5cfpWN3Pxl4uGaXYh9GH
         F03vG+rkC876IAUgIOOl9hVDLUbd8TQqNcRpdIiK0bRL6OQWrXId/cVA3JEowFjDqj0K
         WallQgohRPGv+0piTjRPgssIiTN/sRF7lVSiKcU3KArPgIUYop0FLdxIsqDxpKFdg1pp
         c5AXFuIyKFjSDzX/EBb9e/8COO9lDM6pIijbMoF/h0fdtWzDGGArho7ZCZF1ASGdSPdp
         17QQAnBlHinqwCt1jdoJsWzipWM04OykTHZvcB6IAgkNz2JVj6j+NGCHTfj1UDUe3IOQ
         j4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zVBzGTqvqpdxYVoiSC/UOuwOFysG/MA9OYHtjU8pU0g=;
        b=XRJUfqAPsrNnLjJTjHMbgago7J61Fc6UR41mAqOuvHIVQvYLf/p4jMaiDYwKltGMlH
         sSkqyl82GeNKDNY9N3fVJCw/XX8QP1+7G3kvuL9/CHq6b3OxCrt7lddyknK4NHKBw8nf
         scw6++zXI4wxz1suP3rAZp5dSvFXiIny5WlijJrKZuxxjRQEOw8S+/8m2X9rnmoNVIGg
         DRVnYPWq7rBE3QPR84RQh6dJWNRFCj1597L3ZVkITd3RjiaqUTcBgcyDn5X7H0efCP0z
         H62zsVSHh30hDJXkhChmPibQev1qv3jD/jKfyYPco4Fvf9u2V/dqT8cA2XzMO4CoVSXI
         aWrg==
X-Gm-Message-State: AOAM5302nufsNfFcl0+Awyj38kmSikl8+FiG2RyOAUU7Z5zSKRN1gctn
        Q4E+5bMYkJvBT/F7HUpuK5ojcrF8Ak/ePw==
X-Google-Smtp-Source: ABdhPJyyH4xlQVGu0ZXMU3pSJ4Wh61amQJc/+drnW/9R4qP1/IzoxMY6AdUvDGcoOL4V5VctsSsTiw==
X-Received: by 2002:a7b:c2ef:: with SMTP id e15mr7004792wmk.10.1599920663594;
        Sat, 12 Sep 2020 07:24:23 -0700 (PDT)
Received: from necip-pc.vpn.ucf.edu ([85.153.229.216])
        by smtp.gmail.com with ESMTPSA id o4sm10221903wru.55.2020.09.12.07.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 07:24:22 -0700 (PDT)
From:   Necip Fazil Yildiran <fazilyildiran@gmail.com>
To:     tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        paul@pgazz.com, jeho@cs.utexas.edu,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>
Subject: [PATCH] MIPS: remove the obsolete RM7000 extended interrupts handler
Date:   Sat, 12 Sep 2020 17:23:07 +0300
Message-Id: <20200912142306.3604968-1-fazilyildiran@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

IRQ_CPU_RM7K has been a non-visible config selected nowhere since
PMC-Sierra Yosemite support has been removed with commit bdf20507da11
("MIPS: PMC-Sierra Yosemite: Remove support."). By the same token, the
handler for RM7000 extended interrupts has been obsolete.

Remove the obsolete code.

Signed-off-by: Necip Fazil Yildiran <fazilyildiran@gmail.com>
---
 arch/mips/Kconfig                        |  3 --
 arch/mips/include/asm/irq_cpu.h          |  2 --
 arch/mips/include/asm/mach-generic/irq.h |  6 ----
 arch/mips/kernel/Makefile                |  1 -
 arch/mips/kernel/irq-rm7000.c            | 45 ------------------------
 5 files changed, 57 deletions(-)
 delete mode 100644 arch/mips/kernel/irq-rm7000.c

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index c95fa3a2484c..93ad690e1dd0 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1242,9 +1242,6 @@ config SYS_SUPPORTS_HUGETLBFS
 config MIPS_HUGE_TLB_SUPPORT
 	def_bool HUGETLB_PAGE || TRANSPARENT_HUGEPAGE
 
-config IRQ_CPU_RM7K
-	bool
-
 config IRQ_MSP_SLP
 	bool
 
diff --git a/arch/mips/include/asm/irq_cpu.h b/arch/mips/include/asm/irq_cpu.h
index 8d321180b5c2..83d7331ab215 100644
--- a/arch/mips/include/asm/irq_cpu.h
+++ b/arch/mips/include/asm/irq_cpu.h
@@ -10,8 +10,6 @@
 #define _ASM_IRQ_CPU_H
 
 extern void mips_cpu_irq_init(void);
-extern void rm7k_cpu_irq_init(void);
-extern void rm9k_cpu_irq_init(void);
 
 #ifdef CONFIG_IRQ_DOMAIN
 struct device_node;
diff --git a/arch/mips/include/asm/mach-generic/irq.h b/arch/mips/include/asm/mach-generic/irq.h
index 72ac2c202c55..ac711b0d6225 100644
--- a/arch/mips/include/asm/mach-generic/irq.h
+++ b/arch/mips/include/asm/mach-generic/irq.h
@@ -28,12 +28,6 @@
 #endif /* CONFIG_I8259 */
 #endif
 
-#ifdef CONFIG_IRQ_CPU_RM7K
-#ifndef RM7K_CPU_IRQ_BASE
-#define RM7K_CPU_IRQ_BASE (MIPS_CPU_IRQ_BASE+8)
-#endif
-#endif
-
 #endif /* CONFIG_IRQ_MIPS_CPU */
 
 #endif /* __ASM_MACH_GENERIC_IRQ_H */
diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
index 13a26d254829..31b827273ed3 100644
--- a/arch/mips/kernel/Makefile
+++ b/arch/mips/kernel/Makefile
@@ -64,7 +64,6 @@ obj-$(CONFIG_MIPS_VPE_APSP_API) += rtlx.o
 obj-$(CONFIG_MIPS_VPE_APSP_API_CMP) += rtlx-cmp.o
 obj-$(CONFIG_MIPS_VPE_APSP_API_MT) += rtlx-mt.o
 
-obj-$(CONFIG_IRQ_CPU_RM7K)	+= irq-rm7000.o
 obj-$(CONFIG_MIPS_MSC)		+= irq-msc01.o
 obj-$(CONFIG_IRQ_TXX9)		+= irq_txx9.o
 obj-$(CONFIG_IRQ_GT641XX)	+= irq-gt641xx.o
diff --git a/arch/mips/kernel/irq-rm7000.c b/arch/mips/kernel/irq-rm7000.c
deleted file mode 100644
index e1a497f639d7..000000000000
--- a/arch/mips/kernel/irq-rm7000.c
+++ /dev/null
@@ -1,45 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) 2003 Ralf Baechle
- *
- * Handler for RM7000 extended interrupts.  These are a non-standard
- * feature so we handle them separately from standard interrupts.
- */
-#include <linux/init.h>
-#include <linux/interrupt.h>
-#include <linux/irq.h>
-#include <linux/kernel.h>
-
-#include <asm/irq_cpu.h>
-#include <asm/mipsregs.h>
-
-static inline void unmask_rm7k_irq(struct irq_data *d)
-{
-	set_c0_intcontrol(0x100 << (d->irq - RM7K_CPU_IRQ_BASE));
-}
-
-static inline void mask_rm7k_irq(struct irq_data *d)
-{
-	clear_c0_intcontrol(0x100 << (d->irq - RM7K_CPU_IRQ_BASE));
-}
-
-static struct irq_chip rm7k_irq_controller = {
-	.name = "RM7000",
-	.irq_ack = mask_rm7k_irq,
-	.irq_mask = mask_rm7k_irq,
-	.irq_mask_ack = mask_rm7k_irq,
-	.irq_unmask = unmask_rm7k_irq,
-	.irq_eoi = unmask_rm7k_irq
-};
-
-void __init rm7k_cpu_irq_init(void)
-{
-	int base = RM7K_CPU_IRQ_BASE;
-	int i;
-
-	clear_c0_intcontrol(0x00000f00);		/* Mask all */
-
-	for (i = base; i < base + 4; i++)
-		irq_set_chip_and_handler(i, &rm7k_irq_controller,
-					 handle_percpu_irq);
-}
-- 
2.25.1

