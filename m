Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3CDC1E8EE7
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2020 09:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728841AbgE3Hdf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 30 May 2020 03:33:35 -0400
Received: from [115.28.160.31] ([115.28.160.31]:33970 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1728838AbgE3Hdf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sat, 30 May 2020 03:33:35 -0400
Received: from localhost.localdomain (unknown [116.236.177.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 359B46018C;
        Sat, 30 May 2020 15:33:26 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1590824006; bh=g25WwYqpKt2/jiCoOVS8HthalXCjmHQUuUhUc8JyTxE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HfbFF7EBQH147qfaajsDCO5UNmFGpRXqLnZrc10tpC6TApk6MCNbYo6G194zatKWU
         pjkNzJFy/8XbZksYkohCHFM9YbFbiKaPV/PIfvaYR5Lk6OSLhgUefJzQPowIehJBSb
         dwo7dADeaBamLDZCb2IVCPQAOwhE3P9++1Hwfj8A=
From:   WANG Xuerui <git@xen0n.name>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH v2 3/3] MIPS: Loongson64: Reorder CPUCFG model match arms
Date:   Sat, 30 May 2020 15:32:43 +0800
Message-Id: <20200530073243.16411-4-git@xen0n.name>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200530073243.16411-1-git@xen0n.name>
References: <20200530073243.16411-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Originally the match arms are ordered by model release date, however
the LOONGSON_64R cores are even more reduced capability-wise. So put
them at top of the switch block.

Suggested-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/mips/loongson64/cpucfg-emul.c | 32 +++++++++++++++---------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/mips/loongson64/cpucfg-emul.c b/arch/mips/loongson64/cpucfg-emul.c
index ca75f07252df..cd619b47ba1f 100644
--- a/arch/mips/loongson64/cpucfg-emul.c
+++ b/arch/mips/loongson64/cpucfg-emul.c
@@ -137,6 +137,22 @@ void loongson3_cpucfg_synthesize_data(struct cpuinfo_mips *c)
 
 	/* Add CPUCFG features non-discoverable otherwise. */
 	switch (c->processor_id & (PRID_IMP_MASK | PRID_REV_MASK)) {
+	case PRID_IMP_LOONGSON_64R | PRID_REV_LOONGSON2K_R1_0:
+	case PRID_IMP_LOONGSON_64R | PRID_REV_LOONGSON2K_R1_1:
+	case PRID_IMP_LOONGSON_64R | PRID_REV_LOONGSON2K_R1_2:
+	case PRID_IMP_LOONGSON_64R | PRID_REV_LOONGSON2K_R1_3:
+		decode_loongson_config6(c);
+		probe_uca(c);
+
+		c->loongson3_cpucfg_data[0] |= (LOONGSON_CFG1_LSLDR0 |
+			LOONGSON_CFG1_LSSYNCI | LOONGSON_CFG1_LLSYNC |
+			LOONGSON_CFG1_TGTSYNC);
+		c->loongson3_cpucfg_data[1] |= (LOONGSON_CFG2_LBT1 |
+			LOONGSON_CFG2_LBT2 | LOONGSON_CFG2_LPMP |
+			LOONGSON_CFG2_LPM_REV2);
+		c->loongson3_cpucfg_data[2] = 0;
+		break;
+
 	case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R1:
 		c->loongson3_cpucfg_data[0] |= (LOONGSON_CFG1_LSLDR0 |
 			LOONGSON_CFG1_LSSYNCI | LOONGSON_CFG1_LSUCA |
@@ -164,22 +180,6 @@ void loongson3_cpucfg_synthesize_data(struct cpuinfo_mips *c)
 			LOONGSON_CFG3_LCAMVW_REV1);
 		break;
 
-	case PRID_IMP_LOONGSON_64R | PRID_REV_LOONGSON2K_R1_0:
-	case PRID_IMP_LOONGSON_64R | PRID_REV_LOONGSON2K_R1_1:
-	case PRID_IMP_LOONGSON_64R | PRID_REV_LOONGSON2K_R1_2:
-	case PRID_IMP_LOONGSON_64R | PRID_REV_LOONGSON2K_R1_3:
-		decode_loongson_config6(c);
-		probe_uca(c);
-
-		c->loongson3_cpucfg_data[0] |= (LOONGSON_CFG1_LSLDR0 |
-			LOONGSON_CFG1_LSSYNCI | LOONGSON_CFG1_LLSYNC |
-			LOONGSON_CFG1_TGTSYNC);
-		c->loongson3_cpucfg_data[1] |= (LOONGSON_CFG2_LBT1 |
-			LOONGSON_CFG2_LBT2 | LOONGSON_CFG2_LPMP |
-			LOONGSON_CFG2_LPM_REV2);
-		c->loongson3_cpucfg_data[2] = 0;
-		break;
-
 	case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0:
 	case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_1:
 	case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R3_0:
-- 
2.26.2

