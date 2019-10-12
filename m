Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE6C4D4D37
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2019 07:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728679AbfJLFRR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Oct 2019 01:17:17 -0400
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25452 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbfJLFRR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 12 Oct 2019 01:17:17 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1570857320; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=YeawjWwiXbR8M8QWqY/iJ0oChdbqdndjqrNdtRDhygcR5BkVMnhpzOhsOBkmOOM7lK4g7wplp7JLI/uit6XpVx+Y0qBe7tma9xlig24RwO2oNAPhrt/xneW0CDQwIAE+eFCrRLpzpiXRbI02kFWgaduGI+G1vPS1v45Id/BCblQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1570857320; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=mQkuPqcgYxHQ2t9MHwAuqBVCAWtQ59OGQM0El1IqWCU=; 
        b=EPEoM9lFTuf05lhCuM6JbLa0GYo0E2MhORBv3UcPSJ8UUMEa+YlX2Rq/z3bpyyoAPaa6IoOc6uGj+uV2h1OSsE7nFiQquhZ0JMNF5fCTOq2E58LOd1Qokme6BuydoI3v0pxsG7lLpOYGpX9d/VM56mwQjT8dSLIzfFLDLhONyX4=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=ZxdZ9ztKjruIaoGralUlkoZyLh42MPhI1+ATQVedi2wjxM0Kw0xES/PFCAKOQ89kd6mZqgIj/lL5
    sQk5k9WQvwi6Wq4AsP6SdJg5vpJp70Sw6TIk4YrhEwTZjOosqIZP  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1570857320;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=1377; bh=mQkuPqcgYxHQ2t9MHwAuqBVCAWtQ59OGQM0El1IqWCU=;
        b=LkyJdh/InAnzJOHtpt+aWW5AyEMDmMkzwCyHcUOqpIry+BBFHbk6hfyKa6QhINQR
        +k/fNk+g8Dhn90boFQZop7m9nY4FgkbaTPwbuf6xHRVKTXZzja9PNQIYsTZIvO1x+FS
        GuavbyAMWKmutYfnMjJ8ZZC6j1qehBBLCtQ6UwJ0=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 1570857318470431.8767101475063; Fri, 11 Oct 2019 22:15:18 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, mark.rutland@arm.com, syq@debian.org,
        ulf.hansson@linaro.org, linus.walleij@linaro.org,
        armijn@tjaldur.nl, tglx@linutronix.de, yuehaibing@huawei.com,
        malat@debian.org, ezequiel@collabora.com, paul@crapouillou.net
Subject: [PATCH 5/6 v2] MMC: JZ4740: Add support for the X1000.
Date:   Sat, 12 Oct 2019 13:13:19 +0800
Message-Id: <1570857203-49192-6-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570857203-49192-1-git-send-email-zhouyanjie@zoho.com>
References: <1567669089-88693-1-git-send-email-zhouyanjie@zoho.com>
 <1570857203-49192-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for probing mmc driver on the X1000 Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/mmc/host/jz4740_mmc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
index f4c4890..44a04fe 100644
--- a/drivers/mmc/host/jz4740_mmc.c
+++ b/drivers/mmc/host/jz4740_mmc.c
@@ -109,6 +109,7 @@ enum jz4740_mmc_version {
 	JZ_MMC_JZ4725B,
 	JZ_MMC_JZ4760,
 	JZ_MMC_JZ4780,
+	JZ_MMC_X1000,
 };
 
 enum jz4740_mmc_state {
@@ -938,6 +939,7 @@ static const struct of_device_id jz4740_mmc_of_match[] = {
 	{ .compatible = "ingenic,jz4725b-mmc", .data = (void *)JZ_MMC_JZ4725B },
 	{ .compatible = "ingenic,jz4760-mmc", .data = (void *) JZ_MMC_JZ4760 },
 	{ .compatible = "ingenic,jz4780-mmc", .data = (void *) JZ_MMC_JZ4780 },
+	{ .compatible = "ingenic,x1000-mmc", .data = (void *) JZ_MMC_X1000 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, jz4740_mmc_of_match);
@@ -1039,7 +1041,7 @@ static int jz4740_mmc_probe(struct platform_device* pdev)
 		dev_err(&pdev->dev, "Failed to add mmc host: %d\n", ret);
 		goto err_release_dma;
 	}
-	dev_info(&pdev->dev, "JZ SD/MMC card driver registered\n");
+	dev_info(&pdev->dev, "Ingenic SD/MMC card driver registered\n");
 
 	dev_info(&pdev->dev, "Using %s, %d-bit mode\n",
 		 host->use_dma ? "DMA" : "PIO",
-- 
2.7.4


