Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A490F39D05C
	for <lists+linux-mips@lfdr.de>; Sun,  6 Jun 2021 20:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbhFFSKW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 6 Jun 2021 14:10:22 -0400
Received: from out28-196.mail.aliyun.com ([115.124.28.196]:38719 "EHLO
        out28-196.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbhFFSKS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 6 Jun 2021 14:10:18 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.0744134|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0327627-0.00131763-0.96592;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047187;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.KOTSOnf_1623002885;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KOTSOnf_1623002885)
          by smtp.aliyun-inc.com(10.147.40.2);
          Mon, 07 Jun 2021 02:08:25 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     ulf.hansson@linaro.org, robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
        paul@crapouillou.net
Subject: [PATCH 2/2] mmc: JZ4740: Add support for JZ4775 and rename unreasonable array name.
Date:   Mon,  7 Jun 2021 02:08:04 +0800
Message-Id: <1623002884-57244-3-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623002884-57244-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1623002884-57244-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Add support for probing mmc driver on the JZ4775 SoC from Ingenic.
2.When the support for JZ4775 SoC is added, there will be six compatible
  strings, so renaming "jz4740_mmc_of_match[]" to "jz4740_mmc_of_matches[]"
  is more reasonable.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 drivers/mmc/host/jz4740_mmc.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
index b3c636e..ea8434f 100644
--- a/drivers/mmc/host/jz4740_mmc.c
+++ b/drivers/mmc/host/jz4740_mmc.c
@@ -2,6 +2,7 @@
 /*
  *  Copyright (C) 2009-2010, Lars-Peter Clausen <lars@metafoo.de>
  *  Copyright (C) 2013, Imagination Technologies
+ *  Copyright (C) 2021, 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
  *
  *  JZ4740 SD/MMC controller driver
  */
@@ -114,6 +115,7 @@ enum jz4740_mmc_version {
 	JZ_MMC_JZ4740,
 	JZ_MMC_JZ4725B,
 	JZ_MMC_JZ4760,
+	JZ_MMC_JZ4775,
 	JZ_MMC_JZ4780,
 	JZ_MMC_X1000,
 };
@@ -138,7 +140,7 @@ enum jz4740_mmc_state {
  * COOKIE_MAPPED: the request was mapped in the irq handler,
  * and should be unmapped before mmc_request_done is called..
  */
-enum jz4780_cookie {
+enum jz4775_cookie {
 	COOKIE_UNMAPPED = 0,
 	COOKIE_PREMAPPED,
 	COOKIE_MAPPED,
@@ -194,7 +196,7 @@ static void jz4740_mmc_write_irq_mask(struct jz4740_mmc_host *host,
 static void jz4740_mmc_write_irq_reg(struct jz4740_mmc_host *host,
 				     uint32_t val)
 {
-	if (host->version >= JZ_MMC_JZ4780)
+	if (host->version >= JZ_MMC_JZ4775)
 		writel(val, host->base + JZ_REG_MMC_IREG);
 	else
 		writew(val, host->base + JZ_REG_MMC_IREG);
@@ -202,7 +204,7 @@ static void jz4740_mmc_write_irq_reg(struct jz4740_mmc_host *host,
 
 static uint32_t jz4740_mmc_read_irq_reg(struct jz4740_mmc_host *host)
 {
-	if (host->version >= JZ_MMC_JZ4780)
+	if (host->version >= JZ_MMC_JZ4775)
 		return readl(host->base + JZ_REG_MMC_IREG);
 	else
 		return readw(host->base + JZ_REG_MMC_IREG);
@@ -674,7 +676,7 @@ static void jz4740_mmc_send_command(struct jz4740_mmc_host *host,
 			cmdat |= JZ_MMC_CMDAT_WRITE;
 		if (host->use_dma) {
 			/*
-			 * The 4780's MMC controller has integrated DMA ability
+			 * The JZ4775's MMC controller has integrated DMA ability
 			 * in addition to being able to use the external DMA
 			 * controller. It moves DMA control bits to a separate
 			 * register. The DMA_SEL bit chooses the external
@@ -682,13 +684,13 @@ static void jz4740_mmc_send_command(struct jz4740_mmc_host *host,
 			 * can only use the external controller, and have a
 			 * single DMA enable bit in CMDAT.
 			 */
-			if (host->version >= JZ_MMC_JZ4780) {
+			if (host->version >= JZ_MMC_JZ4775) {
 				writel(JZ_MMC_DMAC_DMA_EN | JZ_MMC_DMAC_DMA_SEL,
 				       host->base + JZ_REG_MMC_DMAC);
 			} else {
 				cmdat |= JZ_MMC_CMDAT_DMA_EN;
 			}
-		} else if (host->version >= JZ_MMC_JZ4780) {
+		} else if (host->version >= JZ_MMC_JZ4775) {
 			writel(0, host->base + JZ_REG_MMC_DMAC);
 		}
 
@@ -866,7 +868,7 @@ static int jz4740_mmc_set_clock_rate(struct jz4740_mmc_host *host, int rate)
 	writew(div, host->base + JZ_REG_MMC_CLKRT);
 
 	if (real_rate > 25000000) {
-		if (host->version >= JZ_MMC_X1000) {
+		if (host->version >= JZ_MMC_JZ4775) {
 			writel(JZ_MMC_LPM_DRV_RISING_QTR_PHASE_DLY |
 				   JZ_MMC_LPM_SMP_RISING_QTR_OR_HALF_PHASE_DLY |
 				   JZ_MMC_LPM_LOW_POWER_MODE_EN,
@@ -955,15 +957,16 @@ static const struct mmc_host_ops jz4740_mmc_ops = {
 	.enable_sdio_irq = jz4740_mmc_enable_sdio_irq,
 };
 
-static const struct of_device_id jz4740_mmc_of_match[] = {
+static const struct of_device_id jz4740_mmc_of_matches[] = {
 	{ .compatible = "ingenic,jz4740-mmc", .data = (void *) JZ_MMC_JZ4740 },
 	{ .compatible = "ingenic,jz4725b-mmc", .data = (void *)JZ_MMC_JZ4725B },
 	{ .compatible = "ingenic,jz4760-mmc", .data = (void *) JZ_MMC_JZ4760 },
+	{ .compatible = "ingenic,jz4775-mmc", .data = (void *) JZ_MMC_JZ4775 },
 	{ .compatible = "ingenic,jz4780-mmc", .data = (void *) JZ_MMC_JZ4780 },
 	{ .compatible = "ingenic,x1000-mmc", .data = (void *) JZ_MMC_X1000 },
 	{},
 };
-MODULE_DEVICE_TABLE(of, jz4740_mmc_of_match);
+MODULE_DEVICE_TABLE(of, jz4740_mmc_of_matches);
 
 static int jz4740_mmc_probe(struct platform_device* pdev)
 {
@@ -980,7 +983,7 @@ static int jz4740_mmc_probe(struct platform_device* pdev)
 
 	host = mmc_priv(mmc);
 
-	match = of_match_device(jz4740_mmc_of_match, &pdev->dev);
+	match = of_match_device(jz4740_mmc_of_matches, &pdev->dev);
 	if (match) {
 		host->version = (enum jz4740_mmc_version)match->data;
 	} else {
@@ -1124,7 +1127,7 @@ static struct platform_driver jz4740_mmc_driver = {
 	.driver = {
 		.name = "jz4740-mmc",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-		.of_match_table = of_match_ptr(jz4740_mmc_of_match),
+		.of_match_table = of_match_ptr(jz4740_mmc_of_matches),
 		.pm = pm_ptr(&jz4740_mmc_pm_ops),
 	},
 };
-- 
2.7.4

