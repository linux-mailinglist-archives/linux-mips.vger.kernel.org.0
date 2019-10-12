Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15148D4D38
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2019 07:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbfJLFTf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Oct 2019 01:19:35 -0400
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25464 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726821AbfJLFTf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 12 Oct 2019 01:19:35 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1570857550; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=SZoeCaq43vnqx636xq+d47jFuUOHkcg3B3mFBDdKoXePF+YYEipoFtgftohELNivwKQSwpZJeKHbXgTpahcZ5NEWYl5FFcB8qbksAgVy9UIC0naGAzhbVjsKw3WtVc5wdW6HzujreC5Ho3BlsPEyTmNlZ17KsM6b7wj5uUcIwmM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1570857550; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=kNG3xydqXngTUammBkGfvZpeHfz2ntKv8HXBufYT2PU=; 
        b=oHGZd7rKEg2V+9sz360ucoNevX8ReblPtCkUFRrMkFHKZVDeFi5A69oHBI0Xv6fGXVRSBKx+xUaxaUE5ilM6JwyzQfs7dSdy2B4ONCY0xZtB11mXjUwnquxcn4RsatbTNKnWi6RrCPOjlvuZRSTn3p/ZdbUlTr058XemhnvyIZI=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=W4EYP2ghWrGTzbWrXYfkSVRYDM2+j9JrS6EYzDpUKqReNndFaNr9vp1Lw9CdhpQWlpikPBb4ikUd
    G6gEwG1rmtGrFmqGgUiHUeokH0Sqpi7Jg3MdQTZxN+2NZ1b2hDuf  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1570857550;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=1745; bh=kNG3xydqXngTUammBkGfvZpeHfz2ntKv8HXBufYT2PU=;
        b=ZPkcFFI2knRCYCAk3/tUuE3fLp/aaG1cAQTX+jBhb9VoHdO2nZHvsda1DlmA0sqQ
        5rFp3iaZ3U230t8A1yJD04q+kPLpcqRuYYr/xMoghCeOVyuywO8ExyhP7f1g2SPimYH
        vuo8/F2r+XLTpYqyz50LG+iHCHLYigb/X89o2tC4=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 1570857550559909.507456529966; Fri, 11 Oct 2019 22:19:10 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, mark.rutland@arm.com, syq@debian.org,
        ulf.hansson@linaro.org, linus.walleij@linaro.org,
        armijn@tjaldur.nl, tglx@linutronix.de, yuehaibing@huawei.com,
        malat@debian.org, ezequiel@collabora.com, paul@crapouillou.net
Subject: [PATCH 6/6 v2] MMC: JZ4740: Add support for LPM.
Date:   Sat, 12 Oct 2019 13:13:20 +0800
Message-Id: <1570857203-49192-7-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570857203-49192-1-git-send-email-zhouyanjie@zoho.com>
References: <1567669089-88693-1-git-send-email-zhouyanjie@zoho.com>
 <1570857203-49192-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

add support for low power mode of Ingenic's MMC/SD Controller.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/mmc/host/jz4740_mmc.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
index 44a04fe..4cbe7fb 100644
--- a/drivers/mmc/host/jz4740_mmc.c
+++ b/drivers/mmc/host/jz4740_mmc.c
@@ -43,6 +43,7 @@
 #define JZ_REG_MMC_RESP_FIFO	0x34
 #define JZ_REG_MMC_RXFIFO	0x38
 #define JZ_REG_MMC_TXFIFO	0x3C
+#define JZ_REG_MMC_LPM		0x40
 #define JZ_REG_MMC_DMAC		0x44
 
 #define JZ_MMC_STRPCL_EXIT_MULTIPLE BIT(7)
@@ -102,6 +103,12 @@
 #define JZ_MMC_DMAC_DMA_SEL BIT(1)
 #define JZ_MMC_DMAC_DMA_EN BIT(0)
 
+#define	JZ_MMC_LPM_DRV_RISING BIT(31)
+#define	JZ_MMC_LPM_DRV_RISING_QTR_PHASE_DLY BIT(31)
+#define	JZ_MMC_LPM_DRV_RISING_1NS_DLY BIT(30)
+#define	JZ_MMC_LPM_SMP_RISING_QTR_OR_HALF_PHASE_DLY BIT(29)
+#define	JZ_MMC_LPM_LOW_POWER_MODE_EN BIT(0)
+
 #define JZ_MMC_CLK_RATE 24000000
 
 enum jz4740_mmc_version {
@@ -860,6 +867,22 @@ static int jz4740_mmc_set_clock_rate(struct jz4740_mmc_host *host, int rate)
 	}
 
 	writew(div, host->base + JZ_REG_MMC_CLKRT);
+
+	if (real_rate > 25000000) {
+		if (host->version >= JZ_MMC_X1000) {
+			writel(JZ_MMC_LPM_DRV_RISING_QTR_PHASE_DLY |
+				   JZ_MMC_LPM_SMP_RISING_QTR_OR_HALF_PHASE_DLY |
+				   JZ_MMC_LPM_LOW_POWER_MODE_EN,
+				   host->base + JZ_REG_MMC_LPM);
+		} else if (host->version >= JZ_MMC_JZ4760) {
+			writel(JZ_MMC_LPM_DRV_RISING |
+				   JZ_MMC_LPM_LOW_POWER_MODE_EN,
+				   host->base + JZ_REG_MMC_LPM);
+		} else if (host->version >= JZ_MMC_JZ4725B)
+			writel(JZ_MMC_LPM_LOW_POWER_MODE_EN,
+				   host->base + JZ_REG_MMC_LPM);
+	}
+
 	return real_rate;
 }
 
-- 
2.7.4


