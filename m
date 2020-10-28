Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 625DE29DFD7
	for <lists+linux-mips@lfdr.de>; Thu, 29 Oct 2020 02:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730989AbgJ2BFM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 28 Oct 2020 21:05:12 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:6981 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730034AbgJ1WFo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 28 Oct 2020 18:05:44 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CLjTC2m4QzhbQF;
        Wed, 28 Oct 2020 17:10:07 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Wed, 28 Oct 2020 17:09:52 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Qinglang Miao" <miaoqinglang@huawei.com>
Subject: [PATCH] mips: Vr41xx: add missing iounmap() on error in vr41xx_pciu_init()
Date:   Wed, 28 Oct 2020 17:15:48 +0800
Message-ID: <20201028091548.136303-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

add missing iounmap() of pciu_base on error when failed to init
io_map_base.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 arch/mips/pci/pci-vr41xx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/pci/pci-vr41xx.c b/arch/mips/pci/pci-vr41xx.c
index 1fa4e1014..4f250c55b 100644
--- a/arch/mips/pci/pci-vr41xx.c
+++ b/arch/mips/pci/pci-vr41xx.c
@@ -293,8 +293,10 @@ static int __init vr41xx_pciu_init(void)
 		master = setup->master_io;
 		io_map_base = ioremap(master->bus_base_address,
 				      resource_size(res));
-		if (!io_map_base)
+		if (!io_map_base) {
+			iounmap(pciu_base);
 			return -EBUSY;
+		}
 
 		vr41xx_pci_controller.io_map_base = (unsigned long)io_map_base;
 	}
-- 
2.23.0

