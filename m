Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AEF9135955
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2020 13:35:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731067AbgAIMeo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jan 2020 07:34:44 -0500
Received: from mx2.suse.de ([195.135.220.15]:38034 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730972AbgAIMeK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 Jan 2020 07:34:10 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 03312B2213;
        Thu,  9 Jan 2020 12:34:07 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 12/14] MIPS: SGI-IP27: Only reserve interrupts used in Linux
Date:   Thu,  9 Jan 2020 13:33:49 +0100
Message-Id: <20200109123353.5656-13-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200109123353.5656-1-tbogendoerfer@suse.de>
References: <20200109123353.5656-1-tbogendoerfer@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reduce number of reserved interrupts by removing bits copied from IRIX
and not used by Linux.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/include/asm/sn/intr.h | 17 -----------------
 arch/mips/sgi-ip27/ip27-irq.c   |  4 +---
 2 files changed, 1 insertion(+), 20 deletions(-)

diff --git a/arch/mips/include/asm/sn/intr.h b/arch/mips/include/asm/sn/intr.h
index fc1348193957..3d6954d370dc 100644
--- a/arch/mips/include/asm/sn/intr.h
+++ b/arch/mips/include/asm/sn/intr.h
@@ -8,15 +8,6 @@
 #ifndef __ASM_SN_INTR_H
 #define __ASM_SN_INTR_H
 
-/* Number of interrupt levels associated with each interrupt register. */
-#define N_INTPEND_BITS		64
-
-#define INT_PEND0_BASELVL	0
-#define INT_PEND1_BASELVL	64
-
-#define N_INTPENDJUNK_BITS	8
-#define INTPENDJUNK_CLRBIT	0x80
-
 /*
  * Macros to manipulate the interrupt register on the calling hub chip.
  */
@@ -84,14 +75,6 @@ do {								\
 #define CPU_RESCHED_B_IRQ	 8
 #define CPU_CALL_A_IRQ		 9
 #define CPU_CALL_B_IRQ		10
-#define MSC_MESG_INTR		11
-#define BASE_PCI_IRQ		12
-
-/*
- * INT_PEND0 again, bits determined by hardware / hardcoded:
- */
-#define SDISK_INTR		63	/* SABLE name */
-#define IP_PEND0_6_63		63	/* What is this bit? */
 
 /*
  * INT_PEND1 hard-coded bits:
diff --git a/arch/mips/sgi-ip27/ip27-irq.c b/arch/mips/sgi-ip27/ip27-irq.c
index 5a4a782ceae5..42df9fafa943 100644
--- a/arch/mips/sgi-ip27/ip27-irq.c
+++ b/arch/mips/sgi-ip27/ip27-irq.c
@@ -287,11 +287,9 @@ void __init arch_init_irq(void)
 	 * Mark these as reserved right away so they won't be used accidentally
 	 * later.
 	 */
-	for (i = 0; i <= BASE_PCI_IRQ; i++)
+	for (i = 0; i <= CPU_CALL_B_IRQ; i++)
 		set_bit(i, hub_irq_map);
 
-	set_bit(IP_PEND0_6_63, hub_irq_map);
-
 	for (i = NI_BRDCAST_ERR_A; i <= MSC_PANIC_INTR; i++)
 		set_bit(i, hub_irq_map);
 
-- 
2.24.1

