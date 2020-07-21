Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6A9228144
	for <lists+linux-mips@lfdr.de>; Tue, 21 Jul 2020 15:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbgGUNrA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Jul 2020 09:47:00 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:35128 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726120AbgGUNq7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 21 Jul 2020 09:46:59 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 43DBA27079410748EBCA;
        Tue, 21 Jul 2020 21:46:57 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Tue, 21 Jul 2020
 21:46:50 +0800
From:   Yu Kuai <yukuai3@huawei.com>
To:     <tsbogend@alpha.franken.de>, <huanglllzu@gmail.com>,
        <chenhc@lemote.com>, <Steven.Hill@cavium.com>,
        <david.daney@cavium.com>, <jhogan@kernel.org>
CC:     <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <yi.zhang@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH] MIPS: OCTEON: add missing put_device() call in dwc3_octeon_device_init()
Date:   Tue, 21 Jul 2020 21:47:18 +0800
Message-ID: <20200721134718.1277347-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

if of_find_device_by_node() succeed, dwc3_octeon_device_init() doesn't have
a corresponding put_device(). Thus add put_device() to fix the exception
handling for this function implementation.

Fixes: 93e502b3c2d4 ("MIPS: OCTEON: Platform support for OCTEON III USB controller")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 arch/mips/cavium-octeon/octeon-usb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/mips/cavium-octeon/octeon-usb.c b/arch/mips/cavium-octeon/octeon-usb.c
index 1fd85c559700..950e6c6e8629 100644
--- a/arch/mips/cavium-octeon/octeon-usb.c
+++ b/arch/mips/cavium-octeon/octeon-usb.c
@@ -518,6 +518,7 @@ static int __init dwc3_octeon_device_init(void)
 
 			res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 			if (res == NULL) {
+				put_device(&pdev->dev);
 				dev_err(&pdev->dev, "No memory resources\n");
 				return -ENXIO;
 			}
@@ -529,8 +530,10 @@ static int __init dwc3_octeon_device_init(void)
 			 * know the difference.
 			 */
 			base = devm_ioremap_resource(&pdev->dev, res);
-			if (IS_ERR(base))
+			if (IS_ERR(base)) {
+				put_device(&pdev->dev);
 				return PTR_ERR(base);
+			}
 
 			mutex_lock(&dwc3_octeon_clocks_mutex);
 			dwc3_octeon_clocks_start(&pdev->dev, (u64)base);
-- 
2.25.4

