Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A91512751EB
	for <lists+linux-mips@lfdr.de>; Wed, 23 Sep 2020 08:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbgIWGyU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Sep 2020 02:54:20 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14216 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726179AbgIWGyT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 23 Sep 2020 02:54:19 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 5833B4B87C3C82016577;
        Wed, 23 Sep 2020 14:54:16 +0800 (CST)
Received: from euler.huawei.com (10.175.124.27) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Wed, 23 Sep 2020 14:54:06 +0800
From:   Wei Li <liwei391@huawei.com>
To:     Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "Ralf Baechle" <ralf@linux-mips.org>,
        Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>,
        "Steven J. Hill" <Steven.Hill@imgtec.com>
CC:     <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <guohanjun@huawei.com>
Subject: [PATCH] MIPS: BCM47XX: Remove the needless check with the 1074K
Date:   Wed, 23 Sep 2020 14:53:26 +0800
Message-ID: <20200923065326.44898-1-liwei391@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

As there is no known soc powered by mips 1074K in bcm47xx series,
the check with 1074K is needless. So just remove it.

Link: https://wireless.wiki.kernel.org/en/users/Drivers/b43/soc
Fixes: 442e14a2c55e ("MIPS: Add 1074K CPU support explicitly.")
Signed-off-by: Wei Li <liwei391@huawei.com>
---
 arch/mips/bcm47xx/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/bcm47xx/setup.c b/arch/mips/bcm47xx/setup.c
index 82627c264964..01427bde2397 100644
--- a/arch/mips/bcm47xx/setup.c
+++ b/arch/mips/bcm47xx/setup.c
@@ -148,7 +148,7 @@ void __init plat_mem_setup(void)
 {
 	struct cpuinfo_mips *c = &current_cpu_data;
 
-	if ((c->cputype == CPU_74K) || (c->cputype == CPU_1074K)) {
+	if (c->cputype == CPU_74K) {
 		pr_info("Using bcma bus\n");
 #ifdef CONFIG_BCM47XX_BCMA
 		bcm47xx_bus_type = BCM47XX_BUS_TYPE_BCMA;
-- 
2.17.1

