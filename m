Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08C8B3E8981
	for <lists+linux-mips@lfdr.de>; Wed, 11 Aug 2021 06:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233781AbhHKEhv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Aug 2021 00:37:51 -0400
Received: from smtpbg127.qq.com ([109.244.180.96]:46502 "EHLO smtpbg.qq.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233950AbhHKEhv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 11 Aug 2021 00:37:51 -0400
X-QQ-mid: bizesmtp40t1628656605tm28pav8
Received: from localhost.localdomain (unknown [182.148.13.10])
        by esmtp6.qq.com (ESMTP) with 
        id ; Wed, 11 Aug 2021 12:36:41 +0800 (CST)
X-QQ-SSF: 0100000000200070B000B00A0000000
X-QQ-FEAT: Pf9cZKF04xN/t6P2gefFGtt8s1d5lZa1Lc/LAlu/l1RoM2pEI+Zw4EuF+bA5n
        ix7oGDAtNw7LLeebaRpfL429KbmjjNpGujlq91ddSFut6hyuO3QiUGmK1CgJQVGTLPxnFgO
        ieDyFvQe5AF9KhY/GT/YWq/H3lNBb9cjMkmH+iOq3sZ1/Tu0bMMbY+e04oVOSzzJSm5s0IC
        TdZrjUUwIivmjmAkFtI0mCx4w3t2SzoQsnBXXpDxR3uL8MtV3ZisQ3eEDfwFBd1t7r9Gom8
        MjeXfCy+tjT1w5ypI4t4t+mWqGXF1F3CVdpTRIotyR2eqiHeF0tEdJAGE=
X-QQ-GoodBg: 0
From:   Huilong Deng <denghuilong@cdjrlc.com>
To:     alexandre.belloni@bootlin.com, UNGLinuxDriver@microchip.com,
        paulburton@kernel.org, tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Huilong Deng <denghuilong@cdjrlc.com>
Subject: [PATCH] MIPS: generic: Return true/false (not 1/0) from bool functions
Date:   Wed, 11 Aug 2021 12:36:15 +0800
Message-Id: <20210811043615.57969-1-denghuilong@cdjrlc.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

./arch/mips/generic/board-ocelot.c:29:9-10: WARNING: return of 0/1 in
function 'ocelot_detect' with return type bool

Signed-off-by: Huilong Deng <denghuilong@cdjrlc.com>
---
 arch/mips/generic/board-ocelot.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/generic/board-ocelot.c b/arch/mips/generic/board-ocelot.c
index c238e95190ac..7115410acb4f 100644
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
2.32.0

