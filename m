Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE11C276921
	for <lists+linux-mips@lfdr.de>; Thu, 24 Sep 2020 08:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbgIXGlj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Sep 2020 02:41:39 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:49514 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726896AbgIXGli (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 24 Sep 2020 02:41:38 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 78119B48A4080B00F43B;
        Thu, 24 Sep 2020 14:41:34 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Thu, 24 Sep 2020 14:41:28 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Qinglang Miao" <miaoqinglang@huawei.com>
Subject: [PATCH -next] MIPS: OCTEON: fix error - use 'ret' after remove it
Date:   Thu, 24 Sep 2020 14:41:42 +0800
Message-ID: <20200924064142.90491-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Variable ret was removed in commit 0ee69c589ec("MIPS: OCTEON:
use devm_platform_ioremap_resource") but still being used in
devm_release_mem_region which is unneeded. So remove this
line to fix error.

Fixes: 0ee69c589ec("MIPS: OCTEON: use devm_platform_ioremap_resource")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 arch/mips/cavium-octeon/octeon-usb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/cavium-octeon/octeon-usb.c b/arch/mips/cavium-octeon/octeon-usb.c
index 97f6dc31e1b4..987a94cbf3d0 100644
--- a/arch/mips/cavium-octeon/octeon-usb.c
+++ b/arch/mips/cavium-octeon/octeon-usb.c
@@ -534,8 +534,6 @@ static int __init dwc3_octeon_device_init(void)
 			dev_info(&pdev->dev, "clocks initialized.\n");
 			mutex_unlock(&dwc3_octeon_clocks_mutex);
 			devm_iounmap(&pdev->dev, base);
-			devm_release_mem_region(&pdev->dev, res->start,
-						resource_size(res));
 		}
 	} while (node != NULL);
 
-- 
2.23.0

