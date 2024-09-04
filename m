Return-Path: <linux-mips+bounces-5354-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E7F96CD3F
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2024 05:27:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81DAE2860C7
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2024 03:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F847145B10;
	Thu,  5 Sep 2024 03:27:45 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cmccmta2.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FFFE2E62B;
	Thu,  5 Sep 2024 03:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725506865; cv=none; b=Xo4JP5KKATSpNUclo/VlaBfD3Ys4IWa2If95gcaMj88qlzDrAaPmXqzDyRozGPBYViBkU6982JcxxfT/3VYAS2JPl1l1rlPFgEWfpmek7DB5rRs07s7rtNGllC19vFSiQ7bdRH0anLCJFeeTBkXUAUN6mUihpzFNe069IoBYC6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725506865; c=relaxed/simple;
	bh=Go52Z9dIELjV9IdiZSLFpL1N9Qsjj6m+urAUCqZirgI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Pv4ZB8vq1k2n4I9ikhKglZwWesuoTkO3rCdTsxK8TUetuw4hgrkMRxOuFr7pXtgar0JPQ2dMLK0po1LwTe0p6s5I/2T8uH5c098hnsYHC+vLzo/sr6dzbu+DVbClzovBQ6b+2XZlSIZtDeFNGAIXLL7eSZ/PFC1lIcb/cimwmtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee566d92527874-ea877;
	Thu, 05 Sep 2024 11:27:36 +0800 (CST)
X-RM-TRANSID:2ee566d92527874-ea877
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[223.108.79.99])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee766d92527541-52c53;
	Thu, 05 Sep 2024 11:27:36 +0800 (CST)
X-RM-TRANSID:2ee766d92527541-52c53
From: Liu Jing <liujing@cmss.chinamobile.com>
To: andersson@kernel.org
Cc: mathieu.poirier@linaro.org,
	paul@crapouillou.net,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	patrice.chotard@foss.st.com,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Liu Jing <liujing@cmss.chinamobile.com>
Subject: [PATCH] remoteproc:remove redundant dev_err message
Date: Thu,  5 Sep 2024 02:54:17 +0800
Message-Id: <20240904185417.14357-1-liujing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_ioremap_resource already contains error message, so remove
the redundant dev_err message

Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index 9041a0e07fb2..289d5ce9f7af 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -214,8 +214,6 @@ static int da8xx_rproc_get_internal_memories(struct platform_device *pdev,
 						   mem_names[i]);
 		drproc->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
 		if (IS_ERR(drproc->mem[i].cpu_addr)) {
-			dev_err(dev, "failed to parse and map %s memory\n",
-				mem_names[i]);
 			return PTR_ERR(drproc->mem[i].cpu_addr);
 		}
 		drproc->mem[i].bus_addr = res->start;
diff --git a/drivers/remoteproc/ingenic_rproc.c b/drivers/remoteproc/ingenic_rproc.c
index 9902cce28692..b3ee5c47001d 100644
--- a/drivers/remoteproc/ingenic_rproc.c
+++ b/drivers/remoteproc/ingenic_rproc.c
@@ -186,7 +186,6 @@ static int ingenic_rproc_probe(struct platform_device *pdev)
 	mem = platform_get_resource_byname(pdev, IORESOURCE_MEM, "aux");
 	vpu->aux_base = devm_ioremap_resource(dev, mem);
 	if (IS_ERR(vpu->aux_base)) {
-		dev_err(dev, "Failed to ioremap\n");
 		return PTR_ERR(vpu->aux_base);
 	}
 
@@ -197,7 +196,6 @@ static int ingenic_rproc_probe(struct platform_device *pdev)
 		vpu->mem_info[i].base = devm_ioremap_resource(dev, mem);
 		if (IS_ERR(vpu->mem_info[i].base)) {
 			ret = PTR_ERR(vpu->mem_info[i].base);
-			dev_err(dev, "Failed to ioremap\n");
 			return ret;
 		}
 
diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 7e57b90bcaf8..a31f94a290c9 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -312,8 +312,6 @@ static int keystone_rproc_of_get_memories(struct platform_device *pdev,
 						   mem_names[i]);
 		ksproc->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
 		if (IS_ERR(ksproc->mem[i].cpu_addr)) {
-			dev_err(dev, "failed to parse and map %s memory\n",
-				mem_names[i]);
 			return PTR_ERR(ksproc->mem[i].cpu_addr);
 		}
 		ksproc->mem[i].bus_addr = res->start;
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index e744c07507ee..cb8ad16583c7 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1126,7 +1126,6 @@ static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
 	scp->sram_base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(scp->sram_base)) {
-		dev_err(dev, "Failed to parse and map sram memory\n");
 		return ERR_CAST(scp->sram_base);
 	}
 
diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 9ae2e831456d..07e707776cf9 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -1201,8 +1201,6 @@ static int omap_rproc_of_get_internal_memories(struct platform_device *pdev,
 		}
 		oproc->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
 		if (IS_ERR(oproc->mem[i].cpu_addr)) {
-			dev_err(dev, "failed to parse and map %s memory\n",
-				data->mems[i].name);
 			return PTR_ERR(oproc->mem[i].cpu_addr);
 		}
 		oproc->mem[i].bus_addr = res->start;
diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index 327f0c7ee3d6..85b95e025c17 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -1047,8 +1047,6 @@ static int pru_rproc_probe(struct platform_device *pdev)
 						   mem_names[i]);
 		pru->mem_regions[i].va = devm_ioremap_resource(dev, res);
 		if (IS_ERR(pru->mem_regions[i].va)) {
-			dev_err(dev, "failed to parse and map memory resource %d %s\n",
-				i, mem_names[i]);
 			ret = PTR_ERR(pru->mem_regions[i].va);
 			return ret;
 		}
diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 572dcb0f055b..fe65ffa9a93f 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -602,7 +602,6 @@ static int adsp_init_mmio(struct qcom_adsp *adsp,
 	} else {
 		adsp->lpass_efuse = devm_ioremap_resource(&pdev->dev, efuse_region);
 		if (IS_ERR(adsp->lpass_efuse)) {
-			dev_err(adsp->dev, "failed to map efuse registers\n");
 			return PTR_ERR(adsp->lpass_efuse);
 		}
 	}
diff --git a/drivers/remoteproc/st_slim_rproc.c b/drivers/remoteproc/st_slim_rproc.c
index d17719384c16..a6e50f51c794 100644
--- a/drivers/remoteproc/st_slim_rproc.c
+++ b/drivers/remoteproc/st_slim_rproc.c
@@ -251,7 +251,6 @@ struct st_slim_rproc *st_slim_rproc_alloc(struct platform_device *pdev,
 
 		slim_rproc->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
 		if (IS_ERR(slim_rproc->mem[i].cpu_addr)) {
-			dev_err(&pdev->dev, "devm_ioremap_resource failed\n");
 			err = PTR_ERR(slim_rproc->mem[i].cpu_addr);
 			goto err;
 		}
@@ -262,7 +261,6 @@ struct st_slim_rproc *st_slim_rproc_alloc(struct platform_device *pdev,
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "slimcore");
 	slim_rproc->slimcore = devm_ioremap_resource(dev, res);
 	if (IS_ERR(slim_rproc->slimcore)) {
-		dev_err(&pdev->dev, "failed to ioremap slimcore IO\n");
 		err = PTR_ERR(slim_rproc->slimcore);
 		goto err;
 	}
@@ -270,7 +268,6 @@ struct st_slim_rproc *st_slim_rproc_alloc(struct platform_device *pdev,
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "peripherals");
 	slim_rproc->peri = devm_ioremap_resource(dev, res);
 	if (IS_ERR(slim_rproc->peri)) {
-		dev_err(&pdev->dev, "failed to ioremap peripherals IO\n");
 		err = PTR_ERR(slim_rproc->peri);
 		goto err;
 	}
diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
index 36a55f7ffa64..5648f450c018 100644
--- a/drivers/remoteproc/wkup_m3_rproc.c
+++ b/drivers/remoteproc/wkup_m3_rproc.c
@@ -186,8 +186,6 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
 						   mem_names[i]);
 		wkupm3->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
 		if (IS_ERR(wkupm3->mem[i].cpu_addr)) {
-			dev_err(&pdev->dev, "devm_ioremap_resource failed for resource %d\n",
-				i);
 			ret = PTR_ERR(wkupm3->mem[i].cpu_addr);
 			goto err_put_rproc;
 		}
-- 
2.33.0




