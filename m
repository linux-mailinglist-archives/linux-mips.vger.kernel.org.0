Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9CE2135940
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2020 13:34:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730950AbgAIMeM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jan 2020 07:34:12 -0500
Received: from mx2.suse.de ([195.135.220.15]:38028 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730970AbgAIMeL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 Jan 2020 07:34:11 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 11D76B220F;
        Thu,  9 Jan 2020 12:34:06 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 09/14] MIPS: SGI-IP27: Use structs for decoding error status registers
Date:   Thu,  9 Jan 2020 13:33:46 +0100
Message-Id: <20200109123353.5656-10-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200109123353.5656-1-tbogendoerfer@suse.de>
References: <20200109123353.5656-1-tbogendoerfer@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Convert printing of error status registers to use structs, which
are defines for IP27 and IP35.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/sgi-ip27/ip27-berr.c | 38 ++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/arch/mips/sgi-ip27/ip27-berr.c b/arch/mips/sgi-ip27/ip27-berr.c
index 65635f765645..5a38ae6bdfa9 100644
--- a/arch/mips/sgi-ip27/ip27-berr.c
+++ b/arch/mips/sgi-ip27/ip27-berr.c
@@ -30,29 +30,31 @@ static void dump_hub_information(unsigned long errst0, unsigned long errst1)
 		{ "WERR", "Uncached Partial Write", "PWERR", "Write Timeout",
 		  NULL, NULL, NULL, NULL }
 	};
-	int wrb = errst1 & PI_ERR_ST1_WRBRRB_MASK;
+	union pi_err_stat0 st0;
+	union pi_err_stat1 st1;
 
-	if (!(errst0 & PI_ERR_ST0_VALID_MASK)) {
-		printk("Hub does not contain valid error information\n");
+	st0.pi_stat0_word = errst0;
+	st1.pi_stat1_word = errst1;
+
+	if (!st0.pi_stat0_fmt.s0_valid) {
+		pr_info("Hub does not contain valid error information\n");
 		return;
 	}
 
-
-	printk("Hub has valid error information:\n");
-	if (errst0 & PI_ERR_ST0_OVERRUN_MASK)
-		printk("Overrun is set.	 Error stack may contain additional "
+	pr_info("Hub has valid error information:\n");
+	if (st0.pi_stat0_fmt.s0_ovr_run)
+		pr_info("Overrun is set. Error stack may contain additional "
 		       "information.\n");
-	printk("Hub error address is %08lx\n",
-	       (errst0 & PI_ERR_ST0_ADDR_MASK) >> (PI_ERR_ST0_ADDR_SHFT - 3));
-	printk("Incoming message command 0x%lx\n",
-	       (errst0 & PI_ERR_ST0_CMD_MASK) >> PI_ERR_ST0_CMD_SHFT);
-	printk("Supplemental field of incoming message is 0x%lx\n",
-	       (errst0 & PI_ERR_ST0_SUPPL_MASK) >> PI_ERR_ST0_SUPPL_SHFT);
-	printk("T5 Rn (for RRB only) is 0x%lx\n",
-	       (errst0 & PI_ERR_ST0_REQNUM_MASK) >> PI_ERR_ST0_REQNUM_SHFT);
-	printk("Error type is %s\n", err_type[wrb]
-	       [(errst0 & PI_ERR_ST0_TYPE_MASK) >> PI_ERR_ST0_TYPE_SHFT]
-		? : "invalid");
+	pr_info("Hub error address is %08lx\n",
+		(unsigned long)st0.pi_stat0_fmt.s0_addr);
+	pr_info("Incoming message command 0x%lx\n",
+		(unsigned long)st0.pi_stat0_fmt.s0_cmd);
+	pr_info("Supplemental field of incoming message is 0x%lx\n",
+		(unsigned long)st0.pi_stat0_fmt.s0_supl);
+	pr_info("T5 Rn (for RRB only) is 0x%lx\n",
+		(unsigned long)st0.pi_stat0_fmt.s0_t5_req);
+	pr_info("Error type is %s\n", err_type[st1.pi_stat1_fmt.s1_rw_rb]
+	       [st0.pi_stat0_fmt.s0_err_type] ? : "invalid");
 }
 
 int ip27_be_handler(struct pt_regs *regs, int is_fixup)
-- 
2.24.1

