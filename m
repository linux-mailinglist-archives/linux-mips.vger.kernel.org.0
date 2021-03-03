Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB9D32BD9A
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 23:24:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345994AbhCCQRa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 11:17:30 -0500
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:36092 "EHLO
        out30-133.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240974AbhCCKSx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Mar 2021 05:18:53 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R721e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0UQDd3dc_1614765742;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UQDd3dc_1614765742)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 03 Mar 2021 18:02:28 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] Uprobe: Assign boolean values to a bool variable
Date:   Wed,  3 Mar 2021 18:02:21 +0800
Message-Id: <1614765741-35207-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix the following coccicheck warnings:

./arch/mips/kernel/uprobes.c:78:10-11: WARNING: return of 0/1 in
function 'is_trap_insn' with return type bool.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 arch/mips/kernel/uprobes.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/uprobes.c b/arch/mips/kernel/uprobes.c
index 6dbe4ea..e66c032 100644
--- a/arch/mips/kernel/uprobes.c
+++ b/arch/mips/kernel/uprobes.c
@@ -75,7 +75,7 @@ bool is_trap_insn(uprobe_opcode_t *insn)
 		case tlt_op:
 		case tltu_op:
 		case tne_op:
-			return 1;
+			return true;
 		}
 		break;
 
@@ -87,12 +87,12 @@ bool is_trap_insn(uprobe_opcode_t *insn)
 		case tlti_op:
 		case tltiu_op:
 		case tnei_op:
-			return 1;
+			return true;
 		}
 		break;
 	}
 
-	return 0;
+	return false;
 }
 
 #define UPROBE_TRAP_NR	ULONG_MAX
-- 
1.8.3.1

