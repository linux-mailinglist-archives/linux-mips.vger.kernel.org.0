Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB6BF25B5E1
	for <lists+linux-mips@lfdr.de>; Wed,  2 Sep 2020 23:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbgIBVcc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Sep 2020 17:32:32 -0400
Received: from mx2.suse.de ([195.135.220.15]:39796 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726226AbgIBVcc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 2 Sep 2020 17:32:32 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 50E61B153;
        Wed,  2 Sep 2020 21:32:31 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     afzal mohammed <afzal.mohd.ma@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: SNI: Fix SCSI interrupt
Date:   Wed,  2 Sep 2020 23:32:14 +0200
Message-Id: <20200902213214.108514-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On RM400(a20r) machines ISA and SCSI interrupts share the same interrupt
line. Commit 49e6e07e3c80 ("MIPS: pass non-NULL dev_id on shared
request_irq()") accidently dropped the IRQF_SHARED bit, which breaks
registering SCSI interrupt. Put back IRQF_SHARED and add dev_id for
ISA interrupt.

Fixes: 49e6e07e3c80 ("MIPS: pass non-NULL dev_id on shared request_irq()")
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/sni/a20r.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/sni/a20r.c b/arch/mips/sni/a20r.c
index 0ecffb65fd6d..b09dc844985a 100644
--- a/arch/mips/sni/a20r.c
+++ b/arch/mips/sni/a20r.c
@@ -222,8 +222,8 @@ void __init sni_a20r_irq_init(void)
 		irq_set_chip_and_handler(i, &a20r_irq_type, handle_level_irq);
 	sni_hwint = a20r_hwint;
 	change_c0_status(ST0_IM, IE_IRQ0);
-	if (request_irq(SNI_A20R_IRQ_BASE + 3, sni_isa_irq_handler, 0, "ISA",
-			NULL))
+	if (request_irq(SNI_A20R_IRQ_BASE + 3, sni_isa_irq_handler,
+			IRQF_SHARED, "ISA", sni_isa_irq_handler))
 		pr_err("Failed to register ISA interrupt\n");
 }
 
-- 
2.16.4

