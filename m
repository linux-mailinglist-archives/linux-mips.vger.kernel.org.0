Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20D1C2DC0CC
	for <lists+linux-mips@lfdr.de>; Wed, 16 Dec 2020 14:10:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbgLPNKf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Dec 2020 08:10:35 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9620 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbgLPNKf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Dec 2020 08:10:35 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CwwSJ1081z15cJm;
        Wed, 16 Dec 2020 21:09:04 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Wed, 16 Dec 2020 21:09:32 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <tsbogend@alpha.franken.de>, <linux-mips@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] mips: pci: convert comma to semicolon
Date:   Wed, 16 Dec 2020 21:10:04 +0800
Message-ID: <20201216131004.14284-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Replace a comma between expression statements by a semicolon.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 arch/mips/kernel/vpe-cmp.c | 4 ++--
 arch/mips/pci/pci-ar2315.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/kernel/vpe-cmp.c b/arch/mips/kernel/vpe-cmp.c
index 9268ebc0f61e..e673603e11e5 100644
--- a/arch/mips/kernel/vpe-cmp.c
+++ b/arch/mips/kernel/vpe-cmp.c
@@ -117,8 +117,8 @@ int __init vpe_module_init(void)
 	}
 
 	device_initialize(&vpe_device);
-	vpe_device.class	= &vpe_class,
-	vpe_device.parent	= NULL,
+	vpe_device.class	= &vpe_class;
+	vpe_device.parent	= NULL;
 	dev_set_name(&vpe_device, "vpe_sp");
 	vpe_device.devt = MKDEV(major, VPE_MODULE_MINOR);
 	err = device_add(&vpe_device);
diff --git a/arch/mips/pci/pci-ar2315.c b/arch/mips/pci/pci-ar2315.c
index 0b15730cef88..f741b8c528e4 100644
--- a/arch/mips/pci/pci-ar2315.c
+++ b/arch/mips/pci/pci-ar2315.c
@@ -483,11 +483,11 @@ static int ar2315_pci_probe(struct platform_device *pdev)
 	apc->io_res.name = "AR2315 IO space";
 	apc->io_res.start = 0;
 	apc->io_res.end = 0;
-	apc->io_res.flags = IORESOURCE_IO,
+	apc->io_res.flags = IORESOURCE_IO;
 
 	apc->pci_ctrl.pci_ops = &ar2315_pci_ops;
-	apc->pci_ctrl.mem_resource = &apc->mem_res,
-	apc->pci_ctrl.io_resource = &apc->io_res,
+	apc->pci_ctrl.mem_resource = &apc->mem_res;
+	apc->pci_ctrl.io_resource = &apc->io_res;
 
 	register_pci_controller(&apc->pci_ctrl);
 
-- 
2.22.0

