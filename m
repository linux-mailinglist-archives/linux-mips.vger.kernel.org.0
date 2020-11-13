Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CAB52B1BB6
	for <lists+linux-mips@lfdr.de>; Fri, 13 Nov 2020 14:15:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbgKMNPU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Nov 2020 08:15:20 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7231 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726160AbgKMNPU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Nov 2020 08:15:20 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CXf8R28fGzkhS2
        for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2020 21:15:03 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Fri, 13 Nov 2020
 21:15:11 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <tsbogend@alpha.franken.de>
CC:     <linux-mips@vger.kernel.org>
Subject: [PATCH] MIPS: Alchemy: Fix memleak in alchemy_clk_setup_cpu
Date:   Fri, 13 Nov 2020 21:18:56 +0800
Message-ID: <20201113131856.2100236-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

If the clk_register fails, we should free h before
function returns to prevent memleak.

Fixes: 474402291a0ad ("MIPS: Alchemy: clock framework integration of onchip clocks")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 arch/mips/alchemy/common/clock.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/mips/alchemy/common/clock.c b/arch/mips/alchemy/common/clock.c
index a95a894aceaf..f0c830337104 100644
--- a/arch/mips/alchemy/common/clock.c
+++ b/arch/mips/alchemy/common/clock.c
@@ -152,6 +152,7 @@ static struct clk __init *alchemy_clk_setup_cpu(const char *parent_name,
 {
 	struct clk_init_data id;
 	struct clk_hw *h;
+	struct clk *clk;
 
 	h = kzalloc(sizeof(*h), GFP_KERNEL);
 	if (!h)
@@ -164,7 +165,13 @@ static struct clk __init *alchemy_clk_setup_cpu(const char *parent_name,
 	id.ops = &alchemy_clkops_cpu;
 	h->init = &id;
 
-	return clk_register(NULL, h);
+	clk = clk_register(NULL, h);
+	if (IS_ERR(clk)) {
+		pr_err("failed to register clock\n");
+		kfree(h);
+	}
+
+	return clk;
 }
 
 /* AUXPLLs ************************************************************/
-- 
2.25.4

