Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 236AC273109
	for <lists+linux-mips@lfdr.de>; Mon, 21 Sep 2020 19:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbgIURqM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Sep 2020 13:46:12 -0400
Received: from out28-3.mail.aliyun.com ([115.124.28.3]:47124 "EHLO
        out28-3.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727743AbgIURqK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Sep 2020 13:46:10 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1919082|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00642929-0.00036673-0.993204;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03300;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.IaKe7sd_1600710348;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.IaKe7sd_1600710348)
          by smtp.aliyun-inc.com(10.147.44.145);
          Tue, 22 Sep 2020 01:46:06 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, paul@crapouillou.net,
        paulburton@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        jiaxun.yang@flygoat.com, Sergey.Semin@baikalelectronics.ru,
        akpm@linux-foundation.org, rppt@kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH v2 2/2] MIPS: Ingenic: Fix bugs when detecting L2 cache of JZ4775 and X1000E.
Date:   Tue, 22 Sep 2020 01:45:22 +0800
Message-Id: <20200921174522.33866-3-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200921174522.33866-1-zhouyanjie@wanyeetech.com>
References: <20200921174522.33866-1-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Fix bugs when detecting ways value of JZ4775's L2 cache.
2.Fix bugs when detecting sets value and ways value of X1000E's L2 cache.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v1->v2:
    1.Add corrections to JZ4775's L2 cache ways parameter.
    2.Add Paul Cercueil's Reviewed-by.

 arch/mips/mm/sc-mips.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/mm/sc-mips.c b/arch/mips/mm/sc-mips.c
index 97dc0511e63f..dd0a5becaabd 100644
--- a/arch/mips/mm/sc-mips.c
+++ b/arch/mips/mm/sc-mips.c
@@ -228,6 +228,7 @@ static inline int __init mips_sc_probe(void)
 		 * contradicted by all documentation.
 		 */
 		case MACH_INGENIC_JZ4770:
+		case MACH_INGENIC_JZ4775:
 			c->scache.ways = 4;
 			break;
 
@@ -236,6 +237,7 @@ static inline int __init mips_sc_probe(void)
 		 * but that is contradicted by all documentation.
 		 */
 		case MACH_INGENIC_X1000:
+		case MACH_INGENIC_X1000E:
 			c->scache.sets = 256;
 			c->scache.ways = 4;
 			break;
-- 
2.11.0

