Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A23612737F1
	for <lists+linux-mips@lfdr.de>; Tue, 22 Sep 2020 03:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729724AbgIVBZ3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Sep 2020 21:25:29 -0400
Received: from out28-49.mail.aliyun.com ([115.124.28.49]:40109 "EHLO
        out28-49.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729701AbgIVBZZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Sep 2020 21:25:25 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1956483|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00634263-0.00035871-0.993299;FP=6623214144479563714|3|2|12|0|-1|-1|-1;HT=e02c03302;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=17;RT=17;SR=0;TI=SMTPD_---.IaRRVwp_1600737910;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.IaRRVwp_1600737910)
          by smtp.aliyun-inc.com(10.147.41.138);
          Tue, 22 Sep 2020 09:25:21 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, robh+dt@kernel.org,
        paul@crapouillou.net, paulburton@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, jiaxun.yang@flygoat.com,
        Sergey.Semin@baikalelectronics.ru, akpm@linux-foundation.org,
        rppt@kernel.org, dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH v3 3/3] MIPS: Ingenic: Fix bugs when detecting L2 cache of JZ4775 and X1000E.
Date:   Tue, 22 Sep 2020 09:24:44 +0800
Message-Id: <20200922012444.44089-4-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200922012444.44089-1-zhouyanjie@wanyeetech.com>
References: <20200922012444.44089-1-zhouyanjie@wanyeetech.com>
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
    
    v2->v3:
    No change.

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

