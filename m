Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D830126BCC8
	for <lists+linux-mips@lfdr.de>; Wed, 16 Sep 2020 08:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbgIPGU7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Sep 2020 02:20:59 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:12723 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726140AbgIPGU4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 16 Sep 2020 02:20:56 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 9C63AED3374EF7840856;
        Wed, 16 Sep 2020 14:20:54 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Wed, 16 Sep 2020 14:20:45 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Qinglang Miao" <miaoqinglang@huawei.com>
Subject: [PATCH -next] MIPS: OCTEON: use devm_platform_ioremap_resource
Date:   Wed, 16 Sep 2020 14:21:27 +0800
Message-ID: <20200916062127.190774-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Note that error handling on the result of a call to platform_get_resource()
is unneeded when the value is passed to devm_ioremap_resource(), so remove
it. Then use the helper function that wraps the calls to platform_get_resource()
and devm_ioremap_resource() together.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 arch/mips/cavium-octeon/octeon-usb.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/mips/cavium-octeon/octeon-usb.c b/arch/mips/cavium-octeon/octeon-usb.c
index 950e6c6e8..97f6dc31e 100644
--- a/arch/mips/cavium-octeon/octeon-usb.c
+++ b/arch/mips/cavium-octeon/octeon-usb.c
@@ -498,7 +498,6 @@ static int __init dwc3_octeon_device_init(void)
 	const char compat_node_name[] = "cavium,octeon-7130-usb-uctl";
 	struct platform_device *pdev;
 	struct device_node *node;
-	struct resource *res;
 	void __iomem *base;
 
 	/*
@@ -516,20 +515,13 @@ static int __init dwc3_octeon_device_init(void)
 			if (!pdev)
 				return -ENODEV;
 
-			res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-			if (res == NULL) {
-				put_device(&pdev->dev);
-				dev_err(&pdev->dev, "No memory resources\n");
-				return -ENXIO;
-			}
-
 			/*
 			 * The code below maps in the registers necessary for
 			 * setting up the clocks and reseting PHYs. We must
 			 * release the resources so the dwc3 subsystem doesn't
 			 * know the difference.
 			 */
-			base = devm_ioremap_resource(&pdev->dev, res);
+			base = devm_platform_ioremap_resource(pdev, 0);
 			if (IS_ERR(base)) {
 				put_device(&pdev->dev);
 				return PTR_ERR(base);
-- 
2.23.0

