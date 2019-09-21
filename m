Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62199B9E1F
	for <lists+linux-mips@lfdr.de>; Sat, 21 Sep 2019 15:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437931AbfIUNtt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 21 Sep 2019 09:49:49 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45986 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437919AbfIUNts (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 21 Sep 2019 09:49:48 -0400
Received: by mail-pl1-f195.google.com with SMTP id u12so4487178pls.12
        for <linux-mips@vger.kernel.org>; Sat, 21 Sep 2019 06:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2M8wonX+I/RkSuHWSt9hgNXjdwLVL1UDwyNQ3nExDNQ=;
        b=ZM131aZdfSy8EpZXxKLRyt3ahC+vmPT2mmjXiTpmDSxGxFs1aHzECgwOKaFAoC/L/0
         0k8vwCyabg9GNVQ5rEebkuvEj11HpYAgq/jUyj0fUN8b/r+w3gOiZE9lNUw6pt0Wvri2
         0SdSrQdRSZohfftLI2lp6Bi5n0pMvBvOP1wxxbyvUIpZZC/ww6nENDOLJvSn6R0eiK7z
         0wyATK8Wr54j/RBjjyO/lDH/dT5kLVmsw0lnC7/s03e7bKv4ozeCmf2XdaffJRDVnMNx
         lTaXFZ2B/iv8I/Rhtmna/QgoT2uF3iZHYlowXWLr8kaKMyDsMatHe9tdACvxJh3jPY8T
         TDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=2M8wonX+I/RkSuHWSt9hgNXjdwLVL1UDwyNQ3nExDNQ=;
        b=iHkayUC+B3vgDjyy/8i5YDGFrBaa2O7ByCGOhbi2wLikANRWvGj6Lr/yIDEe5TlDi5
         3ab974zEuCo1RFTUiKnthafkH4whpVNQxWiYN+ptWXtNFXvYSYyxwifsk+iMoNFBLCaJ
         fo7ejsfCbe5kCJ21bHIxQH5RwKLh/fcLR/NLw8AzSB063TlHFCL+IqAjtvTr1wEcxyXJ
         mak55gb4LPoaVVEIi7avtV6aiZjaH3ff8PHiA02vhWS0//q0kQN86bple1Ld+XUtjOMq
         Fqzg8+DJPJrUDVymEXz1N5sQ6pz8Qgo6Qq8FKVjUeGjntidN/5wxdvH//Di8zDDsi9sS
         2gVw==
X-Gm-Message-State: APjAAAX65extu2QgZWKO59W3lbCYehp75uJBLznLtzdhaSMbXI4wEDKZ
        BlGeLkEFlIKcFBUd3YvLL/8=
X-Google-Smtp-Source: APXvYqws3r8G6xXq2fVwA3mYVhJDC6eKGVxyP+OwBW8rGbkUBhgVc5tPM5o2/lqA21dDPWIIzVgnIQ==
X-Received: by 2002:a17:902:8bc4:: with SMTP id r4mr6642876plo.341.1569073787810;
        Sat, 21 Sep 2019 06:49:47 -0700 (PDT)
Received: from software.domain.org ([103.118.43.97])
        by smtp.gmail.com with ESMTPSA id p66sm13700496pfg.127.2019.09.21.06.49.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 21 Sep 2019 06:49:47 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>
Cc:     linux-mips@linux-mips.org, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V2 3/3] MIPS: Loongson-3: Add CSR IPI support
Date:   Sat, 21 Sep 2019 21:50:28 +0800
Message-Id: <1569073828-13019-3-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1569073828-13019-1-git-send-email-chenhc@lemote.com>
References: <1569073828-13019-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CSR IPI and legacy MMIO use the same infrastructure, but CSR IPI is
faster than legacy MMIO IPI. This patch enable CSR IPI if possible
(except for MailBox, because CSR IPI is too complicated for MailBox).

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/loongson64/loongson-3/smp.c | 70 +++++++++++++++++++++++++++++++----
 1 file changed, 62 insertions(+), 8 deletions(-)

diff --git a/arch/mips/loongson64/loongson-3/smp.c b/arch/mips/loongson64/loongson-3/smp.c
index e999bb1..de8e074 100644
--- a/arch/mips/loongson64/loongson-3/smp.c
+++ b/arch/mips/loongson64/loongson-3/smp.c
@@ -18,6 +18,7 @@
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
 #include <loongson.h>
+#include <loongson_regs.h>
 #include <workarounds.h>
 
 #include "smp.h"
@@ -48,6 +49,62 @@ static uint32_t core0_c0count[NR_CPUS];
 		__wbflush();			\
 	} while (0)
 
+u32 (*ipi_read_clear)(int cpu);
+void (*ipi_write_action)(int cpu, u32 action);
+
+static u32 csr_ipi_read_clear(int cpu)
+{
+	u32 action;
+
+	/* Load the ipi register to figure out what we're supposed to do */
+	action = csr_readl(LOONGSON_CSR_IPI_STATUS);
+	/* Clear the ipi register to clear the interrupt */
+	csr_writel(action, LOONGSON_CSR_IPI_CLEAR);
+
+	return action;
+}
+
+static void csr_ipi_write_action(int cpu, u32 action)
+{
+	unsigned int irq = 0;
+
+	while ((irq = ffs(action))) {
+		uint32_t val = CSR_IPI_SEND_BLOCK;
+		val |= (irq - 1);
+		val |= (cpu << CSR_IPI_SEND_CPU_SHIFT);
+		csr_writel(val, LOONGSON_CSR_IPI_SEND);
+		action &= ~BIT(irq - 1);
+	}
+}
+
+static u32 legacy_ipi_read_clear(int cpu)
+{
+	u32 action;
+
+	/* Load the ipi register to figure out what we're supposed to do */
+	action = loongson3_ipi_read32(ipi_status0_regs[cpu_logical_map(cpu)]);
+	/* Clear the ipi register to clear the interrupt */
+	loongson3_ipi_write32(action, ipi_clear0_regs[cpu_logical_map(cpu)]);
+
+	return action;
+}
+
+static void legacy_ipi_write_action(int cpu, u32 action)
+{
+	loongson3_ipi_write32((u32)action, ipi_set0_regs[cpu]);
+}
+
+static void csr_ipi_probe(void)
+{
+	if (cpu_has_csr() && csr_readl(LOONGSON_CSR_FEATURES) & LOONGSON_CSRF_IPI) {
+		ipi_read_clear = csr_ipi_read_clear;
+		ipi_write_action = csr_ipi_write_action;
+	} else {
+		ipi_read_clear = legacy_ipi_read_clear;
+		ipi_write_action = legacy_ipi_write_action;
+	}
+}
+
 static void ipi_set0_regs_init(void)
 {
 	ipi_set0_regs[0] = (void *)
@@ -233,7 +290,7 @@ static void ipi_mailbox_buf_init(void)
  */
 static void loongson3_send_ipi_single(int cpu, unsigned int action)
 {
-	loongson3_ipi_write32((u32)action, ipi_set0_regs[cpu_logical_map(cpu)]);
+	ipi_write_action(cpu_logical_map(cpu), (u32)action);
 }
 
 static void
@@ -242,14 +299,14 @@ loongson3_send_ipi_mask(const struct cpumask *mask, unsigned int action)
 	unsigned int i;
 
 	for_each_cpu(i, mask)
-		loongson3_ipi_write32((u32)action, ipi_set0_regs[cpu_logical_map(i)]);
+		ipi_write_action(cpu_logical_map(i), (u32)action);
 }
 
 #define IPI_IRQ_OFFSET 6
 
 void loongson3_send_irq_by_ipi(int cpu, int irqs)
 {
-	loongson3_ipi_write32(irqs << IPI_IRQ_OFFSET, ipi_set0_regs[cpu_logical_map(cpu)]);
+	ipi_write_action(cpu_logical_map(cpu), irqs << IPI_IRQ_OFFSET);
 }
 
 void loongson3_ipi_interrupt(struct pt_regs *regs)
@@ -257,13 +314,9 @@ void loongson3_ipi_interrupt(struct pt_regs *regs)
 	int i, cpu = smp_processor_id();
 	unsigned int action, c0count, irqs;
 
-	/* Load the ipi register to figure out what we're supposed to do */
-	action = loongson3_ipi_read32(ipi_status0_regs[cpu_logical_map(cpu)]);
+	action = ipi_read_clear(cpu);
 	irqs = action >> IPI_IRQ_OFFSET;
 
-	/* Clear the ipi register to clear the interrupt */
-	loongson3_ipi_write32((u32)action, ipi_clear0_regs[cpu_logical_map(cpu)]);
-
 	if (action & SMP_RESCHEDULE_YOURSELF)
 		scheduler_ipi();
 
@@ -372,6 +425,7 @@ static void __init loongson3_smp_setup(void)
 		num++;
 	}
 
+	csr_ipi_probe();
 	ipi_set0_regs_init();
 	ipi_clear0_regs_init();
 	ipi_status0_regs_init();
-- 
2.7.0

