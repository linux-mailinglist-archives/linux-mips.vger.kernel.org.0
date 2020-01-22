Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9064B1454E2
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jan 2020 14:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729083AbgAVNNs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jan 2020 08:13:48 -0500
Received: from mx2.suse.de ([195.135.220.15]:34520 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726204AbgAVNNs (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 Jan 2020 08:13:48 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id CEC1AB066;
        Wed, 22 Jan 2020 13:13:46 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: SGI-IP30: Check for valid pointer before using it
Date:   Wed, 22 Jan 2020 14:13:34 +0100
Message-Id: <20200122131334.21970-1-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix issue detected by Smatch:

    ./arch/mips/sgi-ip30/ip30-irq.c:236 heart_domain_free()
     warn: variable dereferenced before check 'irqd' (see line 235)

Fixes: 7505576d1c1a ("MIPS: add support for SGI Octane (IP30)")
Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/sgi-ip30/ip30-irq.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/sgi-ip30/ip30-irq.c b/arch/mips/sgi-ip30/ip30-irq.c
index d45865c7644c..11cd2a888de5 100644
--- a/arch/mips/sgi-ip30/ip30-irq.c
+++ b/arch/mips/sgi-ip30/ip30-irq.c
@@ -245,9 +245,10 @@ static void heart_domain_free(struct irq_domain *domain,
 		return;
 
 	irqd = irq_domain_get_irq_data(domain, virq);
-	clear_bit(irqd->hwirq, heart_irq_map);
-	if (irqd && irqd->chip_data)
+	if (irqd) {
+		clear_bit(irqd->hwirq, heart_irq_map);
 		kfree(irqd->chip_data);
+	}
 }
 
 static const struct irq_domain_ops heart_domain_ops = {
-- 
2.24.1

