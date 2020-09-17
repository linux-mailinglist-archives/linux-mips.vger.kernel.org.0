Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C31926D55C
	for <lists+linux-mips@lfdr.de>; Thu, 17 Sep 2020 09:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbgIQH4H (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Sep 2020 03:56:07 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:45786 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726142AbgIQHzS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 17 Sep 2020 03:55:18 -0400
X-Greylist: delayed 929 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 03:55:16 EDT
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id B33DB4BED30A64A36B82
        for <linux-mips@vger.kernel.org>; Thu, 17 Sep 2020 15:39:32 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Thu, 17 Sep 2020
 15:39:31 +0800
From:   Qilong Zhang <zhangqilong3@huawei.com>
To:     <tsbogend@alpha.franken.de>
CC:     <linux-mips@vger.kernel.org>
Subject: [PATCH -next] MIPS: pci: use devm_platform_ioremap_resource_byname
Date:   Thu, 17 Sep 2020 15:46:22 +0800
Message-ID: <20200917074622.42298-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Zhang Qilong <zhangqilong3@huawei.com>

Use the devm_platform_ioremap_resource_byname() helper instead of
calling platform_get_resource_byname() and devm_ioremap_resource()
separately.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 arch/mips/pci/pci-ar2315.c | 5 ++---
 arch/mips/pci/pci-ar71xx.c | 4 ++--
 arch/mips/pci/pci-ar724x.c | 9 +++------
 3 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/arch/mips/pci/pci-ar2315.c b/arch/mips/pci/pci-ar2315.c
index cef4a47ab063..0b15730cef88 100644
--- a/arch/mips/pci/pci-ar2315.c
+++ b/arch/mips/pci/pci-ar2315.c
@@ -423,9 +423,8 @@ static int ar2315_pci_probe(struct platform_device *pdev)
 		return -EINVAL;
 	apc->irq = irq;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-					   "ar2315-pci-ctrl");
-	apc->mmr_mem = devm_ioremap_resource(dev, res);
+	apc->mmr_mem = devm_platform_ioremap_resource_byname(pdev,
+							     "ar2315-pci-ctrl");
 	if (IS_ERR(apc->mmr_mem))
 		return PTR_ERR(apc->mmr_mem);
 
diff --git a/arch/mips/pci/pci-ar71xx.c b/arch/mips/pci/pci-ar71xx.c
index a9f8e7c881bd..118760b3fa82 100644
--- a/arch/mips/pci/pci-ar71xx.c
+++ b/arch/mips/pci/pci-ar71xx.c
@@ -336,8 +336,8 @@ static int ar71xx_pci_probe(struct platform_device *pdev)
 	if (!apc)
 		return -ENOMEM;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg_base");
-	apc->cfg_base = devm_ioremap_resource(&pdev->dev, res);
+	apc->cfg_base = devm_platform_ioremap_resource_byname(pdev,
+							      "cfg_base");
 	if (IS_ERR(apc->cfg_base))
 		return PTR_ERR(apc->cfg_base);
 
diff --git a/arch/mips/pci/pci-ar724x.c b/arch/mips/pci/pci-ar724x.c
index 869d5c9a2f8d..807558b251ef 100644
--- a/arch/mips/pci/pci-ar724x.c
+++ b/arch/mips/pci/pci-ar724x.c
@@ -372,18 +372,15 @@ static int ar724x_pci_probe(struct platform_device *pdev)
 	if (!apc)
 		return -ENOMEM;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ctrl_base");
-	apc->ctrl_base = devm_ioremap_resource(&pdev->dev, res);
+	apc->ctrl_base = devm_platform_ioremap_resource_byname(pdev, "ctrl_base");
 	if (IS_ERR(apc->ctrl_base))
 		return PTR_ERR(apc->ctrl_base);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg_base");
-	apc->devcfg_base = devm_ioremap_resource(&pdev->dev, res);
+	apc->devcfg_base = devm_platform_ioremap_resource_byname(pdev, "cfg_base");
 	if (IS_ERR(apc->devcfg_base))
 		return PTR_ERR(apc->devcfg_base);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "crp_base");
-	apc->crp_base = devm_ioremap_resource(&pdev->dev, res);
+	apc->crp_base = devm_platform_ioremap_resource_byname(pdev, "crp_base");
 	if (IS_ERR(apc->crp_base))
 		return PTR_ERR(apc->crp_base);
 
-- 
2.17.1

