Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ECB2361C58
	for <lists+linux-mips@lfdr.de>; Fri, 16 Apr 2021 11:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237181AbhDPItq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Apr 2021 04:49:46 -0400
Received: from out28-97.mail.aliyun.com ([115.124.28.97]:38051 "EHLO
        out28-97.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241340AbhDPIsq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Apr 2021 04:48:46 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07564378|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0219487-0.000672429-0.977379;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047201;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=16;RT=16;SR=0;TI=SMTPD_---.K-shfge_1618562890;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.K-shfge_1618562890)
          by smtp.aliyun-inc.com(10.147.40.233);
          Fri, 16 Apr 2021 16:48:20 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        akpm@linux-foundation.org, paul.burton@mips.com,
        paul@crapouillou.net, siyanteng@loongson.cn, huangpei@loongson.cn,
        ira.weiny@intel.com, yangtiezhu@loongson.cn,
        zhouyanjie@wanyeetech.com, jun.jiang@ingenic.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH] Revert "MIPS: make userspace mapping young by default".
Date:   Fri, 16 Apr 2021 16:47:48 +0800
Message-Id: <1618562868-91115-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This reverts commit f685a533a7fab35c5d069dcd663f59c8e4171a75.

It cause kernel panic on Ingenic X1830, so let's revert it.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 arch/mips/mm/cache.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
index 7719d63..9cfd432 100644
--- a/arch/mips/mm/cache.c
+++ b/arch/mips/mm/cache.c
@@ -21,7 +21,6 @@
 #include <asm/cpu.h>
 #include <asm/cpu-features.h>
 #include <asm/setup.h>
-#include <asm/pgtable.h>
 
 /* Cache operations. */
 void (*flush_cache_all)(void);
@@ -157,31 +156,29 @@ unsigned long _page_cachable_default;
 EXPORT_SYMBOL(_page_cachable_default);
 
 #define PM(p)	__pgprot(_page_cachable_default | (p))
-#define PVA(p)	PM(_PAGE_VALID | _PAGE_ACCESSED | (p))
 
 static inline void setup_protection_map(void)
 {
 	protection_map[0]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
-	protection_map[1]  = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC);
-	protection_map[2]  = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
-	protection_map[3]  = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC);
-	protection_map[4]  = PVA(_PAGE_PRESENT);
-	protection_map[5]  = PVA(_PAGE_PRESENT);
-	protection_map[6]  = PVA(_PAGE_PRESENT);
-	protection_map[7]  = PVA(_PAGE_PRESENT);
+	protection_map[1]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
+	protection_map[2]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
+	protection_map[3]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
+	protection_map[4]  = PM(_PAGE_PRESENT);
+	protection_map[5]  = PM(_PAGE_PRESENT);
+	protection_map[6]  = PM(_PAGE_PRESENT);
+	protection_map[7]  = PM(_PAGE_PRESENT);
 
 	protection_map[8]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
-	protection_map[9]  = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC);
-	protection_map[10] = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE |
+	protection_map[9]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
+	protection_map[10] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE |
 				_PAGE_NO_READ);
-	protection_map[11] = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE);
-	protection_map[12] = PVA(_PAGE_PRESENT);
-	protection_map[13] = PVA(_PAGE_PRESENT);
-	protection_map[14] = PVA(_PAGE_PRESENT);
-	protection_map[15] = PVA(_PAGE_PRESENT);
+	protection_map[11] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE);
+	protection_map[12] = PM(_PAGE_PRESENT);
+	protection_map[13] = PM(_PAGE_PRESENT);
+	protection_map[14] = PM(_PAGE_PRESENT | _PAGE_WRITE);
+	protection_map[15] = PM(_PAGE_PRESENT | _PAGE_WRITE);
 }
 
-#undef _PVA
 #undef PM
 
 void cpu_cache_init(void)
-- 
2.7.4

