Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B332F3A2C3E
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jun 2021 14:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230370AbhFJNBJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Jun 2021 09:01:09 -0400
Received: from out28-121.mail.aliyun.com ([115.124.28.121]:35411 "EHLO
        out28-121.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230392AbhFJNBD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Jun 2021 09:01:03 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1723083|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0591475-0.0029278-0.937925;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047207;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.KQVfrD4_1623329936;
Received: from zhouyanjie-virtual-machine.lan(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KQVfrD4_1623329936)
          by smtp.aliyun-inc.com(10.147.41.137);
          Thu, 10 Jun 2021 20:59:04 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     ulf.hansson@linaro.org, robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, paul@crapouillou.net
Subject: [PATCH v2 2/2] mmc: JZ4740: Add support for JZ4775.
Date:   Thu, 10 Jun 2021 20:58:50 +0800
Message-Id: <1623329930-14387-3-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623329930-14387-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1623329930-14387-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Add support for probing mmc driver on the JZ4775 SoC from Ingenic.
2.The drive clock selection and sample clock selection have been
  supported since JZ4775, not X1000. So support for these two
  functions has been added for JZ4775 and JZ4780.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v1->v2:
    1.Remove unnecessary renaming as Paul Cercueil's suggestion.
    2.Reuse the ID of JZ4775 and JZ4780 to simplify the code.
    3.Add support of drive clock selection and sample clock
      selection for JZ4775 and JZ4780.

 drivers/mmc/host/jz4740_mmc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
index b3c636e..f3172e5 100644
--- a/drivers/mmc/host/jz4740_mmc.c
+++ b/drivers/mmc/host/jz4740_mmc.c
@@ -674,7 +674,7 @@ static void jz4740_mmc_send_command(struct jz4740_mmc_host *host,
 			cmdat |= JZ_MMC_CMDAT_WRITE;
 		if (host->use_dma) {
 			/*
-			 * The 4780's MMC controller has integrated DMA ability
+			 * The JZ4780's MMC controller has integrated DMA ability
 			 * in addition to being able to use the external DMA
 			 * controller. It moves DMA control bits to a separate
 			 * register. The DMA_SEL bit chooses the external
@@ -866,7 +866,7 @@ static int jz4740_mmc_set_clock_rate(struct jz4740_mmc_host *host, int rate)
 	writew(div, host->base + JZ_REG_MMC_CLKRT);
 
 	if (real_rate > 25000000) {
-		if (host->version >= JZ_MMC_X1000) {
+		if (host->version >= JZ_MMC_JZ4780) {
 			writel(JZ_MMC_LPM_DRV_RISING_QTR_PHASE_DLY |
 				   JZ_MMC_LPM_SMP_RISING_QTR_OR_HALF_PHASE_DLY |
 				   JZ_MMC_LPM_LOW_POWER_MODE_EN,
@@ -959,6 +959,7 @@ static const struct of_device_id jz4740_mmc_of_match[] = {
 	{ .compatible = "ingenic,jz4740-mmc", .data = (void *) JZ_MMC_JZ4740 },
 	{ .compatible = "ingenic,jz4725b-mmc", .data = (void *)JZ_MMC_JZ4725B },
 	{ .compatible = "ingenic,jz4760-mmc", .data = (void *) JZ_MMC_JZ4760 },
+	{ .compatible = "ingenic,jz4775-mmc", .data = (void *) JZ_MMC_JZ4780 },
 	{ .compatible = "ingenic,jz4780-mmc", .data = (void *) JZ_MMC_JZ4780 },
 	{ .compatible = "ingenic,x1000-mmc", .data = (void *) JZ_MMC_X1000 },
 	{},
-- 
2.7.4

