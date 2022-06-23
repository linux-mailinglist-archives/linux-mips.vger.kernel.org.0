Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4F9F557C35
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jun 2022 14:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232135AbiFWM4d (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jun 2022 08:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231846AbiFWM4Z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Jun 2022 08:56:25 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38FFC4B87B;
        Thu, 23 Jun 2022 05:56:24 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NBvlrF011978;
        Thu, 23 Jun 2022 07:52:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Tu/WQm2FL2SPUViv8WWXoQaXIl+eGAzL/AaxkzkbEBw=;
 b=DD+38VDD0o80wNycNX/vhRKVKJA6TzKywq+dC3EJJwBenl1JxktiKxEEwhTKguR9nIWh
 HdcraE9lA1qlJ40izR1a49m4D03vynq4lVjLODVU4CnUD/MJPZMB356lj3GlBtro46vp
 hvZZ0rCahrviixOwAdCfB4iryPy63ikwN02T7/ovXhYVhtiCdKKs9dde7afMQXPSEzz6
 hZLEGdnAcLvoqZtomT5R+b8EZEoO7AZslnBatBlQ8k7Khg0bpfuAjcB7y/VI4CXaqviL
 TF1PgSULAaqGiXVZX8xntwdv1wL/M86ERDdJS/bBV43oCYCU4wH1aXAGXAdaARSq3nXM uw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gsb4p6wvp-10
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 23 Jun 2022 07:52:59 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:53 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 23 Jun 2022 13:52:53 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E658411D3;
        Thu, 23 Jun 2022 12:52:52 +0000 (UTC)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <broonie@kernel.org>
CC:     <lgirdwood@gmail.com>, <kuninori.morimoto.gx@renesas.com>,
        <mripard@kernel.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
        <vkoul@kernel.org>, <nicolas.ferre@microchip.com>,
        <nsaenz@kernel.org>, <shawnguo@kernel.org>, <linux-imx@nxp.com>,
        <cezary.rojewski@intel.com>,
        <pierre-louis.bossart@linux.intel.com>,
        <linux-mips@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
        <daniel@zonque.org>, <srinivas.kandagatla@linaro.org>,
        <linux-rockchip@lists.infradead.org>, <krzk@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-sunxi@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-xtensa@linux-xtensa.org>,
        <peter.ujfalusi@gmail.com>, <jarkko.nikula@bitmer.com>,
        <heiko@sntech.de>, <jbrunet@baylibre.com>, <kernel@pengutronix.de>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <dri-devel@lists.freedesktop.org>,
        <linux-rpi-kernel@lists.infradead.org>,
        <frattaroli.nicolas@gmail.com>
Subject: [PATCH v2 24/96] ASoC: qcom: Migrate to new style legacy DAI naming flag
Date:   Thu, 23 Jun 2022 13:51:38 +0100
Message-ID: <20220623125250.2355471-25-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: wVbUk9EDGXJ-wibpUtyKNMaQLq8KcH0w
X-Proofpoint-ORIG-GUID: wVbUk9EDGXJ-wibpUtyKNMaQLq8KcH0w
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Change the legacy DAI naming flag from opting in to the new scheme
(non_legacy_dai_naming), to opting out of it (legacy_dai_naming).
These drivers appear to be on the CPU side of the DAI link and
currently uses the legacy naming, so add the new flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/qcom/lpass-cpu.c       |  1 +
 sound/soc/qcom/qdsp6/q6asm-dai.c | 23 ++++++++++++-----------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index e6846ad2b5fa4..6f1cd38000016 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -472,6 +472,7 @@ static int asoc_qcom_of_xlate_dai_name(struct snd_soc_component *component,
 static const struct snd_soc_component_driver lpass_cpu_comp_driver = {
 	.name = "lpass-cpu",
 	.of_xlate_dai_name = asoc_qcom_of_xlate_dai_name,
+	.legacy_dai_naming = 1,
 };
 
 static bool lpass_cpu_regmap_writeable(struct device *dev, unsigned int reg)
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index b74b67720ef43..5fc8088e63c81 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -1205,17 +1205,18 @@ static const struct snd_soc_dapm_widget q6asm_dapm_widgets[] = {
 };
 
 static const struct snd_soc_component_driver q6asm_fe_dai_component = {
-	.name		= DRV_NAME,
-	.open		= q6asm_dai_open,
-	.hw_params	= q6asm_dai_hw_params,
-	.close		= q6asm_dai_close,
-	.prepare	= q6asm_dai_prepare,
-	.trigger	= q6asm_dai_trigger,
-	.pointer	= q6asm_dai_pointer,
-	.pcm_construct	= q6asm_dai_pcm_new,
-	.compress_ops	= &q6asm_dai_compress_ops,
-	.dapm_widgets	= q6asm_dapm_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(q6asm_dapm_widgets),
+	.name			= DRV_NAME,
+	.open			= q6asm_dai_open,
+	.hw_params		= q6asm_dai_hw_params,
+	.close			= q6asm_dai_close,
+	.prepare		= q6asm_dai_prepare,
+	.trigger		= q6asm_dai_trigger,
+	.pointer		= q6asm_dai_pointer,
+	.pcm_construct		= q6asm_dai_pcm_new,
+	.compress_ops		= &q6asm_dai_compress_ops,
+	.dapm_widgets		= q6asm_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(q6asm_dapm_widgets),
+	.legacy_dai_naming	= 1,
 };
 
 static struct snd_soc_dai_driver q6asm_fe_dais_template[] = {
-- 
2.30.2

