Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 242DA29DFDD
	for <lists+linux-mips@lfdr.de>; Thu, 29 Oct 2020 02:05:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731294AbgJ2BFY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 28 Oct 2020 21:05:24 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:6980 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730020AbgJ1WFo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 28 Oct 2020 18:05:44 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CLjT50MgJzhcZy;
        Wed, 28 Oct 2020 17:10:01 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Wed, 28 Oct 2020 17:09:50 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Qinglang Miao" <miaoqinglang@huawei.com>
Subject: [PATCH] mips: cm: add missing iounmap() on error in mips_cm_probe()
Date:   Wed, 28 Oct 2020 17:15:46 +0800
Message-ID: <20201028091546.136258-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the missing iounmap() of iounmap(mips_gcr_base) before
return from mips_cm_probe() in the error handling case.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 arch/mips/kernel/mips-cm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
index f60af512c..90f1c3df1 100644
--- a/arch/mips/kernel/mips-cm.c
+++ b/arch/mips/kernel/mips-cm.c
@@ -266,6 +266,7 @@ int mips_cm_probe(void)
 	if ((base_reg & CM_GCR_BASE_GCRBASE) != addr) {
 		pr_err("GCRs appear to have been moved (expected them at 0x%08lx)!\n",
 		       (unsigned long)addr);
+		iounmap(mips_gcr_base);
 		mips_gcr_base = NULL;
 		return -ENODEV;
 	}
-- 
2.23.0

