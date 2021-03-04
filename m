Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17FE032CBAC
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 05:59:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233853AbhCDEvf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 23:51:35 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:13051 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234047AbhCDEvD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Mar 2021 23:51:03 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DrdfL2XlKzMfbV;
        Thu,  4 Mar 2021 12:48:10 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Thu, 4 Mar 2021 12:50:11 +0800
From:   'Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, Paul Cercueil <paul@crapouillou.net>,
        "Wim Van Sebroeck" <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
CC:     <linux-mips@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] watchdog: jz4740: Fix return value check in jz4740_wdt_probe()
Date:   Thu, 4 Mar 2021 04:59:09 +0000
Message-ID: <20210304045909.945799-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

In case of error, the function device_node_to_regmap() returns
ERR_PTR() and never returns NULL. The NULL test in the return
value check should be replaced with IS_ERR().

Fixes: 6d532143c915 ("watchdog: jz4740: Use regmap provided by TCU driver")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/watchdog/jz4740_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/jz4740_wdt.c b/drivers/watchdog/jz4740_wdt.c
index bdf9564efa29..395bde79e292 100644
--- a/drivers/watchdog/jz4740_wdt.c
+++ b/drivers/watchdog/jz4740_wdt.c
@@ -176,9 +176,9 @@ static int jz4740_wdt_probe(struct platform_device *pdev)
 	watchdog_set_drvdata(jz4740_wdt, drvdata);
 
 	drvdata->map = device_node_to_regmap(dev->parent->of_node);
-	if (!drvdata->map) {
+	if (IS_ERR(drvdata->map)) {
 		dev_err(dev, "regmap not found\n");
-		return -EINVAL;
+		return PTR_ERR(drvdata->map);
 	}
 
 	return devm_watchdog_register_device(dev, &drvdata->wdt);

