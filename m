Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1A5837A3C0
	for <lists+linux-mips@lfdr.de>; Tue, 11 May 2021 11:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231223AbhEKJev (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 May 2021 05:34:51 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:2625 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbhEKJev (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 May 2021 05:34:51 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FfXjw3krfzlZTt;
        Tue, 11 May 2021 17:31:32 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Tue, 11 May 2021 17:33:35 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] mmc: jz4740: Remove redundant error printing in jz4740_mmc_probe()
Date:   Tue, 11 May 2021 17:33:29 +0800
Message-ID: <20210511093329.4670-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When devm_ioremap_resource() fails, a clear enough error message will be
printed by its subfunction __devm_ioremap_resource(). The error
information contains the device name, failure cause, and possibly resource
information.

Therefore, remove the error printing here to simplify code and reduce the
binary size.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/mmc/host/jz4740_mmc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
index b3c636edbb4610d..861ff6d9661a908 100644
--- a/drivers/mmc/host/jz4740_mmc.c
+++ b/drivers/mmc/host/jz4740_mmc.c
@@ -1013,7 +1013,6 @@ static int jz4740_mmc_probe(struct platform_device* pdev)
 	host->base = devm_ioremap_resource(&pdev->dev, host->mem_res);
 	if (IS_ERR(host->base)) {
 		ret = PTR_ERR(host->base);
-		dev_err(&pdev->dev, "Failed to ioremap base memory\n");
 		goto err_free_host;
 	}
 
-- 
2.26.0.106.g9fadedd


