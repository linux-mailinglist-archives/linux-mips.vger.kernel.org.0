Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6432111F319
	for <lists+linux-mips@lfdr.de>; Sat, 14 Dec 2019 18:55:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbfLNRzW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 14 Dec 2019 12:55:22 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35811 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727132AbfLNRzW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 14 Dec 2019 12:55:22 -0500
Received: by mail-pl1-f196.google.com with SMTP id g6so942plt.2;
        Sat, 14 Dec 2019 09:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0jvWF9XYSISO584h2vYKYUoEcRiyVQ8hH7Hs2IoWF50=;
        b=g2VIPeNv78fikjdmQp4F6HcLSJJlLRztzWIRg4z5MKw5ARx+QWeColI55a3kl7qx9i
         cAFoFIbdKa4WMEDblx60nLEzaAGgygsrCa1OzawGh83RhPR4M+Pgz4cTiUuwtJ3+zLTR
         rKSvgNvCdwzPqUvKrTPhWjfhJpfOInRRaTsdN4a2TkIHWk4Z3bZ0nLnwQonYk5wzWncg
         vwCJdky9D1Os9HirkeURSPIS0re0yh8o0nUnCCSeya6qhWZv+FZ4VkTqLzURQWZQmAtq
         IeuzYN5SfasSV/p6E2PnjMm3gp9rYSRVHGTAGwQgQAZsRDt5dp5Bj7folhkKi/e7xXRr
         jVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0jvWF9XYSISO584h2vYKYUoEcRiyVQ8hH7Hs2IoWF50=;
        b=MK4LfHsf0HISkL6Ay39hYcdzrty1NQhyF+GijcA1ItgXO9RVNIJCsFKgVUGZxECZIu
         eNnDLBTcnezGfkApxTc6A95I+Ou1QwwEJwi+C9NG3rMRvCxtNrDJlepvTqVyapLIVrL8
         A45yLbWxVePt00+gkxSyN5fVTabhzJf7o0AvnyfsH2qoE7lVNc9fm/Ib7vaSPEssbqEy
         GA/m8j0E76L/cXZ7cm8bFmIsCiaRI9AcNPrx+xaOmge6RiIK2MUDGpMUXfAP3KPWk9j/
         3BPq/uQ9bu7+1IMAtt/L0VJ+atxf8BXg9WKM1ZXDd1SbAcqAyCR7fPXez5hq2CKYq/6V
         EV9A==
X-Gm-Message-State: APjAAAUi5zAXKmOwQpXf6AVm20rU2I499kaGtlOZx5Sn3866/+6ZV8o8
        z8mBR8Ji4itnoLzKxay9QAY=
X-Google-Smtp-Source: APXvYqyqtm2BCTkQ1WB9nU9hiA5GJsGTHwnwitKhC/pdbIodt1usGKIoQH8Uv4CdMMinxB6/xHe66A==
X-Received: by 2002:a17:90a:8685:: with SMTP id p5mr7039962pjn.92.1576346121104;
        Sat, 14 Dec 2019 09:55:21 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id l22sm14347112pjc.0.2019.12.14.09.55.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Dec 2019 09:55:20 -0800 (PST)
From:   Yangtao Li <tiny.windzz@gmail.com>
To:     khilman@baylibre.com, leoyang.li@nxp.com, khalasa@piap.pl,
        john@phrozen.org, matthias.bgg@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, kgene@kernel.org, krzk@kernel.org,
        mripard@kernel.org, wens@csie.org, ssantosh@kernel.org,
        jun.nie@linaro.org, shawnguo@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 10/10] soc: qcom: convert to devm_platform_ioremap_resource
Date:   Sat, 14 Dec 2019 17:54:47 +0000
Message-Id: <20191214175447.25482-10-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191214175447.25482-1-tiny.windzz@gmail.com>
References: <20191214175447.25482-1-tiny.windzz@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/soc/qcom/llcc-qcom.c    | 7 +------
 drivers/soc/qcom/qcom-geni-se.c | 4 +---
 drivers/soc/qcom/qcom_aoss.c    | 4 +---
 drivers/soc/qcom/qcom_gsbi.c    | 5 +----
 drivers/soc/qcom/spm.c          | 4 +---
 5 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 429b5a60a1ba..99e19df76889 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -387,7 +387,6 @@ static int qcom_llcc_remove(struct platform_device *pdev)
 static struct regmap *qcom_llcc_init_mmio(struct platform_device *pdev,
 		const char *name)
 {
-	struct resource *res;
 	void __iomem *base;
 	struct regmap_config llcc_regmap_config = {
 		.reg_bits = 32,
@@ -396,11 +395,7 @@ static struct regmap *qcom_llcc_init_mmio(struct platform_device *pdev,
 		.fast_io = true,
 	};
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
-	if (!res)
-		return ERR_PTR(-ENODEV);
-
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return ERR_CAST(base);
 
diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 7d622ea1274e..9c2c429b4b3f 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -723,7 +723,6 @@ EXPORT_SYMBOL(geni_se_rx_dma_unprep);
 static int geni_se_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct geni_wrapper *wrapper;
 	int ret;
 
@@ -732,8 +731,7 @@ static int geni_se_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	wrapper->dev = dev;
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	wrapper->base = devm_ioremap_resource(dev, res);
+	wrapper->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(wrapper->base))
 		return PTR_ERR(wrapper->base);
 
diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index 006ac40c526a..fcfba9f1aaa1 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -513,7 +513,6 @@ static void qmp_cooling_devices_remove(struct qmp *qmp)
 
 static int qmp_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct qmp *qmp;
 	int irq;
 	int ret;
@@ -526,8 +525,7 @@ static int qmp_probe(struct platform_device *pdev)
 	init_waitqueue_head(&qmp->event);
 	mutex_init(&qmp->tx_lock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	qmp->msgram = devm_ioremap_resource(&pdev->dev, res);
+	qmp->msgram = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(qmp->msgram))
 		return PTR_ERR(qmp->msgram);
 
diff --git a/drivers/soc/qcom/qcom_gsbi.c b/drivers/soc/qcom/qcom_gsbi.c
index 304afc223a58..202ff31cf54f 100644
--- a/drivers/soc/qcom/qcom_gsbi.c
+++ b/drivers/soc/qcom/qcom_gsbi.c
@@ -127,7 +127,6 @@ static int gsbi_probe(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 	struct device_node *tcsr_node;
 	const struct of_device_id *match;
-	struct resource *res;
 	void __iomem *base;
 	struct gsbi_info *gsbi;
 	int i, ret;
@@ -135,12 +134,10 @@ static int gsbi_probe(struct platform_device *pdev)
 	const struct crci_config *config = NULL;
 
 	gsbi = devm_kzalloc(&pdev->dev, sizeof(*gsbi), GFP_KERNEL);
-
 	if (!gsbi)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
diff --git a/drivers/soc/qcom/spm.c b/drivers/soc/qcom/spm.c
index 8e10e02c6aa5..b6131ab07879 100644
--- a/drivers/soc/qcom/spm.c
+++ b/drivers/soc/qcom/spm.c
@@ -320,7 +320,6 @@ static const struct of_device_id spm_match_table[] = {
 static int spm_dev_probe(struct platform_device *pdev)
 {
 	struct spm_driver_data *drv;
-	struct resource *res;
 	const struct of_device_id *match_id;
 	void __iomem *addr;
 	int cpu;
@@ -329,8 +328,7 @@ static int spm_dev_probe(struct platform_device *pdev)
 	if (!drv)
 		return -EINVAL;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	drv->reg_base = devm_ioremap_resource(&pdev->dev, res);
+	drv->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(drv->reg_base))
 		return PTR_ERR(drv->reg_base);
 
-- 
2.17.1

