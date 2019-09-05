Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC83A9C10
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2019 09:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732150AbfIEHjl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Sep 2019 03:39:41 -0400
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25479 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731162AbfIEHjl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Sep 2019 03:39:41 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1567669124; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=mXDWIQQF0GBmUYjIgzV6AOoV/41THvi5CQbX3LvhjXiKWOqouDQpEaSuTzW2h+tyXe550aPfJNJbjTNKQT9xSInKOEje78IBjElzTS3+1PsbgUMBzWE2SN2BCMDT1Lhwsxa+HbAMVSCTBif0a3+pMv977pBjj6oeD7MxaSpGuAA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1567669124; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=egFOrDQp87JufeuaATPLZS9Nk9CVn431TNKVdr5uG9c=; 
        b=mZ6KtAqlk9QrrhQ8RX4LrG2xZPUMF2CX9414cpcGJS7Q+t11nSmzmEoGvypyQxM+4i3V7OfHXnz6O90dO0KO5Sb2UKQExrLiAdP/oIRNkoL3n6frTchT06HmGVzThFuy+IgDQ12XRGlH97X6zCbCIlpFFdqDew86xCsPLVQ6CWY=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=alkAaLA/LsC7OTHjGHQlx5pvPuth9fOvuM4HaxQ8hmNQ74Am2u0mO4wgagW1a/vEkieJiIUIgnxb
    UFu6XR11bqRIJIH7iCN6bUTQNPRIqRK25wabrBickIp7lZn9l3YN  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1567669124;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=1598; bh=egFOrDQp87JufeuaATPLZS9Nk9CVn431TNKVdr5uG9c=;
        b=naYOwA+xzhDJnHqp0YPeAbCyWc82FkXn2Hv1PAZ2VqEtKv9ux9rYU7zvk153p9bD
        47e81ajkIYFfKCimcCcFf+Rb8sneCXk84KYtckvkvetHwxUv6GXQNKHu3yFxQ7B3jZ/
        Ewcggk5JpVAByXsXLqCpc7IgnTtd357cOb2HaJgQ=
Received: from zhouyanjie-virtual-machine.localdomain (125.71.5.36 [125.71.5.36]) by mx.zohomail.com
        with SMTPS id 1567669122100996.8820523312266; Thu, 5 Sep 2019 00:38:42 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, ulf.hansson@linaro.org,
        paul.burton@mips.com, linus.walleij@linaro.org,
        paul@crapouillou.net, malat@debian.org, yuehaibing@huawei.com,
        ezequiel@collabora.com, robh+dt@kernel.org, mark.rutland@arm.com,
        syq@debian.org, jiaxun.yang@flygoat.com
Subject: [PATCH 2/4] MMC: Ingenic: Add 8bit mode support.
Date:   Thu,  5 Sep 2019 15:38:07 +0800
Message-Id: <1567669089-88693-3-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567669089-88693-1-git-send-email-zhouyanjie@zoho.com>
References: <1567669089-88693-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for 8bit mode, now supports 1bit/4bit/8bit modes.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/mmc/host/jz4740_mmc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
index 1b1fcb7..d6811a7 100644
--- a/drivers/mmc/host/jz4740_mmc.c
+++ b/drivers/mmc/host/jz4740_mmc.c
@@ -79,6 +79,8 @@
 
 #define JZ_MMC_CMDAT_IO_ABORT BIT(11)
 #define JZ_MMC_CMDAT_BUS_WIDTH_4BIT BIT(10)
+#define JZ_MMC_CMDAT_BUS_WIDTH_8BIT (BIT(10) | BIT(9))
+#define	JZ_MMC_CMDAT_BUS_WIDTH_MASK (BIT(10) | BIT(9))
 #define JZ_MMC_CMDAT_DMA_EN BIT(8)
 #define JZ_MMC_CMDAT_INIT BIT(7)
 #define JZ_MMC_CMDAT_BUSY BIT(6)
@@ -899,11 +901,16 @@ static void jz4740_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 
 	switch (ios->bus_width) {
 	case MMC_BUS_WIDTH_1:
-		host->cmdat &= ~JZ_MMC_CMDAT_BUS_WIDTH_4BIT;
+		host->cmdat &= ~JZ_MMC_CMDAT_BUS_WIDTH_MASK;
 		break;
 	case MMC_BUS_WIDTH_4:
+		host->cmdat &= ~JZ_MMC_CMDAT_BUS_WIDTH_MASK;
 		host->cmdat |= JZ_MMC_CMDAT_BUS_WIDTH_4BIT;
 		break;
+	case MMC_BUS_WIDTH_8:
+		host->cmdat &= ~JZ_MMC_CMDAT_BUS_WIDTH_MASK;
+		host->cmdat |= JZ_MMC_CMDAT_BUS_WIDTH_8BIT;
+		break;
 	default:
 		break;
 	}
@@ -1034,7 +1041,8 @@ static int jz4740_mmc_probe(struct platform_device* pdev)
 
 	dev_info(&pdev->dev, "Using %s, %d-bit mode\n",
 		 host->use_dma ? "DMA" : "PIO",
-		 (mmc->caps & MMC_CAP_4_BIT_DATA) ? 4 : 1);
+		 (mmc->caps & MMC_CAP_8_BIT_DATA) ? 8 :
+		 ((mmc->caps & MMC_CAP_4_BIT_DATA) ? 4 : 1));
 
 	return 0;
 
-- 
2.7.4


