Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA3926C96A
	for <lists+linux-mips@lfdr.de>; Wed, 16 Sep 2020 21:08:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727931AbgIPTIy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Sep 2020 15:08:54 -0400
Received: from mx2.suse.de ([195.135.220.15]:43308 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727393AbgIPRod (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 16 Sep 2020 13:44:33 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 9CB05ADCD;
        Wed, 16 Sep 2020 13:55:01 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: SNI: Fix spurious interrupts
Date:   Wed, 16 Sep 2020 15:54:37 +0200
Message-Id: <20200916135437.60572-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On A20R machines the interrupt pending bits in cause register need to be
updated by requesting the chipset to do it. This needs to be done to
find the interrupt cause and after interrupt service. In
commit 0b888c7f3a03 ("MIPS: SNI: Convert to new irq_chip functions") the
function to do after service update got lost, which caused spurious
interrupts.

Fixes: 0b888c7f3a03 ("MIPS: SNI: Convert to new irq_chip functions")
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/sni/a20r.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/mips/sni/a20r.c b/arch/mips/sni/a20r.c
index b09dc844985a..eeeec18c420a 100644
--- a/arch/mips/sni/a20r.c
+++ b/arch/mips/sni/a20r.c
@@ -143,7 +143,10 @@ static struct platform_device sc26xx_pdev = {
 	},
 };
 
-static u32 a20r_ack_hwint(void)
+/*
+ * Trigger chipset to update CPU's CAUSE IP field
+ */
+static u32 a20r_update_cause_ip(void)
 {
 	u32 status = read_c0_status();
 
@@ -205,12 +208,14 @@ static void a20r_hwint(void)
 	int irq;
 
 	clear_c0_status(IE_IRQ0);
-	status = a20r_ack_hwint();
+	status = a20r_update_cause_ip();
 	cause = read_c0_cause();
 
 	irq = ffs(((cause & status) >> 8) & 0xf8);
 	if (likely(irq > 0))
 		do_IRQ(SNI_A20R_IRQ_BASE + irq - 1);
+
+	a20r_update_cause_ip();
 	set_c0_status(IE_IRQ0);
 }
 
-- 
2.16.4

