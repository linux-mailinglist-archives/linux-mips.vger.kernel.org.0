Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA94A17BD1D
	for <lists+linux-mips@lfdr.de>; Fri,  6 Mar 2020 13:48:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbgCFMsk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Mar 2020 07:48:40 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:35500 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbgCFMsk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 6 Mar 2020 07:48:40 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id E861A803087C;
        Fri,  6 Mar 2020 12:48:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 9aJ0kHhNm6oi; Fri,  6 Mar 2020 15:48:37 +0300 (MSK)
From:   <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 06/22] mips: cm: Add L2 ECC/parity errors reporting
Date:   Fri, 6 Mar 2020 15:46:49 +0300
In-Reply-To: <20200306124705.6595-1-Sergey.Semin@baikalelectronics.ru>
References: <20200306124705.6595-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Message-Id: <20200306124837.E861A803087C@mail.baikalelectronics.ru>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Serge Semin <Sergey.Semin@baikalelectronics.ru>

According to the MIPS32 InterAptiv software manual error codes 24 - 26
of CM2 indicate L2 ECC/parity error with switching to a corresponding
errors info fields. This patch provides these errors parsing code,
which handles the read/write uncorrectable and correctable ECC/parity
errors, and prints instruction causing the fault, RAM array type, cache
way/dword and syndrome associated with the faulty data.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
---
 arch/mips/kernel/mips-cm.c | 62 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
index 361bfc91a0e6..f60af512c877 100644
--- a/arch/mips/kernel/mips-cm.c
+++ b/arch/mips/kernel/mips-cm.c
@@ -114,6 +114,48 @@ static char *cm2_core[8] = {
 	"Exclusive/OK", "Exclusive/Data"
 };
 
+static char *cm2_l2_type[4] = {
+	[0x0] = "None",
+	[0x1] = "Tag RAM single/double ECC error",
+	[0x2] = "Data RAM single/double ECC error",
+	[0x3] = "WS RAM uncorrectable dirty parity"
+};
+
+static char *cm2_l2_instr[32] = {
+	[0x00] = "L2_NOP",
+	[0x01] = "L2_ERR_CORR",
+	[0x02] = "L2_TAG_INV",
+	[0x03] = "L2_WS_CLEAN",
+	[0x04] = "L2_RD_MDYFY_WR",
+	[0x05] = "L2_WS_MRU",
+	[0x06] = "L2_EVICT_LN2",
+	[0x07] = "0x07",
+	[0x08] = "L2_EVICT",
+	[0x09] = "L2_REFL",
+	[0x0a] = "L2_RD",
+	[0x0b] = "L2_WR",
+	[0x0c] = "L2_EVICT_MRU",
+	[0x0d] = "L2_SYNC",
+	[0x0e] = "L2_REFL_ERR",
+	[0x0f] = "0x0f",
+	[0x10] = "L2_INDX_WB_INV",
+	[0x11] = "L2_INDX_LD_TAG",
+	[0x12] = "L2_INDX_ST_TAG",
+	[0x13] = "L2_INDX_ST_DATA",
+	[0x14] = "L2_INDX_ST_ECC",
+	[0x15] = "0x15",
+	[0x16] = "0x16",
+	[0x17] = "0x17",
+	[0x18] = "L2_FTCH_AND_LCK",
+	[0x19] = "L2_HIT_INV",
+	[0x1a] = "L2_HIT_WB_INV",
+	[0x1b] = "L2_HIT_WB",
+	[0x1c] = "0x1c",
+	[0x1d] = "0x1d",
+	[0x1e] = "0x1e",
+	[0x1f] = "0x1f"
+};
+
 static char *cm2_causes[32] = {
 	"None", "GC_WR_ERR", "GC_RD_ERR", "COH_WR_ERR",
 	"COH_RD_ERR", "MMIO_WR_ERR", "MMIO_RD_ERR", "0x07",
@@ -121,7 +163,7 @@ static char *cm2_causes[32] = {
 	"0x0c", "0x0d", "0x0e", "0x0f",
 	"0x10", "INTVN_WR_ERR", "INTVN_RD_ERR", "0x13",
 	"0x14", "0x15", "0x16", "0x17",
-	"0x18", "0x19", "0x1a", "0x1b",
+	"L2_RD_UNCORR", "L2_WR_UNCORR", "L2_CORR", "0x1b",
 	"0x1c", "0x1d", "0x1e", "0x1f"
 };
 
@@ -360,7 +402,7 @@ void mips_cm_error_report(void)
 				 "CCA=%lu TR=%s MCmd=%s STag=%lu "
 				 "SPort=%lu\n", cca_bits, cm2_tr[tr_bits],
 				 cm2_cmd[cmd_bits], stag_bits, sport_bits);
-		} else {
+		} else if (cause < 24) {
 			/* glob state & sresp together */
 			unsigned long c3_bits = (cm_error >> 18) & 7;
 			unsigned long c2_bits = (cm_error >> 15) & 7;
@@ -377,6 +419,22 @@ void mips_cm_error_report(void)
 				 cm2_core[c1_bits], cm2_core[c0_bits],
 				 sc_bit ? "True" : "False",
 				 cm2_cmd[cmd_bits], sport_bits);
+		} else {
+			unsigned long muc_bit = (cm_error >> 23) & 1;
+			unsigned long ins_bits = (cm_error >> 18) & 0x1f;
+			unsigned long arr_bits = (cm_error >> 16) & 3;
+			unsigned long dw_bits = (cm_error >> 12) & 15;
+			unsigned long way_bits = (cm_error >> 9) & 7;
+			unsigned long mway_bit = (cm_error >> 8) & 1;
+			unsigned long syn_bits = (cm_error >> 0) & 0xFF;
+
+			snprintf(buf, sizeof(buf),
+				 "Type=%s%s Instr=%s DW=%lu Way=%lu "
+				 "MWay=%s Syndrome=0x%02lx",
+				 muc_bit ? "Multi-UC " : "",
+				 cm2_l2_type[arr_bits],
+				 cm2_l2_instr[ins_bits], dw_bits, way_bits,
+				 mway_bit ? "True" : "False", syn_bits);
 		}
 		pr_err("CM_ERROR=%08llx %s <%s>\n", cm_error,
 		       cm2_causes[cause], buf);
-- 
2.25.1

