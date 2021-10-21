Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99D094368A4
	for <lists+linux-mips@lfdr.de>; Thu, 21 Oct 2021 19:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231980AbhJURGr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Oct 2021 13:06:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:36406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230288AbhJURGm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 21 Oct 2021 13:06:42 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2A077613AC;
        Thu, 21 Oct 2021 17:04:26 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1mdbUO-000lAU-9T; Thu, 21 Oct 2021 18:04:24 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>, f.fainelli@gmail.com,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 1/3] MIPS: loongson64: Drop call to irq_cpu_offline()
Date:   Thu, 21 Oct 2021 18:04:12 +0100
Message-Id: <20211021170414.3341522-2-maz@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211021170414.3341522-1-maz@kernel.org>
References: <20211021170414.3341522-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, tsbogend@alpha.franken.de, fancer.lancer@gmail.com, chenhuacai@kernel.org, jiaxun.yang@flygoat.com, f.fainelli@gmail.com, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Also loongson64 calls irq_cpu_offline(), none of its interrupt
controllers implement the .irq_cpu_offline callback.

It is thus obvious that this call only serves the dubious purpose
of wasting precious CPU cycles by iterating over all interrupts.

Get rid of the call altogether.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/mips/loongson64/smp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index 09ebe84a17fe..660e1de4412a 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -550,7 +550,6 @@ static int loongson3_cpu_disable(void)
 	set_cpu_online(cpu, false);
 	calculate_cpu_foreign_map();
 	local_irq_save(flags);
-	irq_cpu_offline();
 	clear_c0_status(ST0_IM);
 	local_irq_restore(flags);
 	local_flush_tlb_all();
-- 
2.30.2

