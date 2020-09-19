Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B25A9270DED
	for <lists+linux-mips@lfdr.de>; Sat, 19 Sep 2020 14:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbgISMp0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 19 Sep 2020 08:45:26 -0400
Received: from out28-97.mail.aliyun.com ([115.124.28.97]:56959 "EHLO
        out28-97.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726218AbgISMpX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 19 Sep 2020 08:45:23 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1753833|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0258038-0.00147429-0.972722;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03303;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=16;RT=16;SR=0;TI=SMTPD_---.IZJIYjg_1600519505;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.IZJIYjg_1600519505)
          by smtp.aliyun-inc.com(10.147.42.198);
          Sat, 19 Sep 2020 20:45:18 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     paulburton@kernel.org, tsbogend@alpha.franken.de,
        paul@crapouillou.net
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        jiaxun.yang@flygoat.com, rppt@kernel.org,
        Sergey.Semin@baikalelectronics.ru,
        Alexey.Malahov@baikalelectronics.ru, akpm@linux-foundation.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH 2/2] MIPS: Ingenic: Fix bugs when detecting X1000E's L2 cache.
Date:   Sat, 19 Sep 2020 20:44:37 +0800
Message-Id: <20200919124437.89576-3-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200919124437.89576-1-zhouyanjie@wanyeetech.com>
References: <20200919124437.89576-1-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix bugs when detecting L2 cache sets value and ways value.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 arch/mips/mm/sc-mips.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/mm/sc-mips.c b/arch/mips/mm/sc-mips.c
index 97dc0511e63f..145b39ecb246 100644
--- a/arch/mips/mm/sc-mips.c
+++ b/arch/mips/mm/sc-mips.c
@@ -235,6 +235,7 @@ static inline int __init mips_sc_probe(void)
 		 * According to config2 it would be 5-ways and 512-sets,
 		 * but that is contradicted by all documentation.
 		 */
+		case MACH_INGENIC_X1000E:
 		case MACH_INGENIC_X1000:
 			c->scache.sets = 256;
 			c->scache.ways = 4;
-- 
2.11.0

