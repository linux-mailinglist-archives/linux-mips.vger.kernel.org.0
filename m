Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7AD30B57E
	for <lists+linux-mips@lfdr.de>; Tue,  2 Feb 2021 03:53:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbhBBCxQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Feb 2021 21:53:16 -0500
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:33366 "EHLO
        out30-54.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229537AbhBBCxP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Feb 2021 21:53:15 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0UNdRYl8_1612234350;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UNdRYl8_1612234350)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 02 Feb 2021 10:52:31 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] MIPS: malta-time: remove unneeded semicolon
Date:   Tue,  2 Feb 2021 10:52:29 +0800
Message-Id: <1612234349-63858-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Eliminate the following coccicheck warning:
./arch/mips/mti-malta/malta-time.c:141:2-3: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 arch/mips/mti-malta/malta-time.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/mti-malta/malta-time.c b/arch/mips/mti-malta/malta-time.c
index 7efcfe0..5677203 100644
--- a/arch/mips/mti-malta/malta-time.c
+++ b/arch/mips/mti-malta/malta-time.c
@@ -138,7 +138,7 @@ int get_c0_fdc_int(void)
 	case CPU_INTERAPTIV:
 	case CPU_PROAPTIV:
 		return -1;
-	};
+	}
 
 	if (cpu_has_veic)
 		return -1;
-- 
1.8.3.1

