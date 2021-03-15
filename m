Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2E8033AC14
	for <lists+linux-mips@lfdr.de>; Mon, 15 Mar 2021 08:16:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbhCOHQI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Mar 2021 03:16:08 -0400
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:49938 "EHLO
        out30-133.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229924AbhCOHPr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 15 Mar 2021 03:15:47 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R631e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0URvO1yI_1615792544;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0URvO1yI_1615792544)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 15 Mar 2021 15:15:45 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     alexandre.belloni@bootlin.com
Cc:     UNGLinuxDriver@microchip.com, paulburton@kernel.org,
        tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] MIPS: generic: use true and false for bool variable
Date:   Mon, 15 Mar 2021 15:15:43 +0800
Message-Id: <1615792543-73864-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

fixed the following coccicheck:
./arch/mips/generic/board-ocelot.c:29:9-10: WARNING: return of 0/1 in
function 'ocelot_detect' with return type bool

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 arch/mips/generic/board-ocelot.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/generic/board-ocelot.c b/arch/mips/generic/board-ocelot.c
index c238e95..7115410 100644
--- a/arch/mips/generic/board-ocelot.c
+++ b/arch/mips/generic/board-ocelot.c
@@ -26,13 +26,13 @@ static __init bool ocelot_detect(void)
 	tlb_probe_hazard();
 	idx = read_c0_index();
 	if (idx < 0)
-		return 0;
+		return false;
 
 	/* A TLB entry exists, lets assume its usable and check the CHIP ID */
 	rev = __raw_readl((void __iomem *)DEVCPU_GCB_CHIP_REGS_CHIP_ID);
 
 	if ((rev & CHIP_ID_PART_ID) != OCELOT_PART_ID)
-		return 0;
+		return false;
 
 	/* Copy command line from bootloader early for Initrd detection */
 	if (fw_arg0 < 10 && (fw_arg1 & 0xFFF00000) == 0x80000000) {
@@ -44,7 +44,7 @@ static __init bool ocelot_detect(void)
 			strcpy(arcs_cmdline, prom_argv[1]);
 	}
 
-	return 1;
+	return true;
 }
 
 static void __init ocelot_earlyprintk_init(void)
-- 
1.8.3.1

