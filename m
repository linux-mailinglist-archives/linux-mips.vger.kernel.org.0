Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B72A52D8EB
	for <lists+linux-mips@lfdr.de>; Thu, 19 May 2022 17:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233259AbiESPsf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 May 2022 11:48:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241575AbiESPqT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 May 2022 11:46:19 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60022C3D18;
        Thu, 19 May 2022 08:44:29 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JBHtah024228;
        Thu, 19 May 2022 10:43:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=MwXos4gS7oWRSJcalauxt79MQccyt3p5gNtwv3UIWLo=;
 b=DXzlzPflbyNTWDaw5M6J0bNBv77UKyztcW/qxv06bMkKIBMSPzsOmTBudRDXCidsaLC3
 jzAlrPCp/Hg9E1WrlYfXzYoOxeNzXcxodoH7YBs+vR3/jzNcvncWMQvDuwTRG3fxAbBz
 jXfVf9LN5V6zr8U0+vxAEXq+zkQGdgd0/D7GIO4kmEvuPxRi07n49yTLO6pkcLqHxKSx
 9KXmBNUIAlsjksng53cCIYkiqJszOZJPqSnqRtEobr10eTIKU1Tn1JaIzAoFJFWP0Qtw
 pAMjyER8YdfnvjQZaQZJmsPKvvcFHDXyMIegiMsU6CoTEVTYFA8U+gDcZnZhQW4Ok7xv 8g== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dm-9
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 19 May 2022 10:43:33 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:19 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Thu, 19 May 2022 16:43:19 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 91C3611D1;
        Thu, 19 May 2022 15:43:19 +0000 (UTC)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <broonie@kernel.org>
CC:     <lgirdwood@gmail.com>, <kuninori.morimoto.gx@renesas.com>,
        <nicolas.ferre@microchip.com>, <nsaenz@kernel.org>,
        <shawnguo@kernel.org>, <linux-imx@nxp.com>,
        <cezary.rojewski@intel.com>,
        <pierre-louis.bossart@linux.intel.com>,
        <linux-mips@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>, <daniel@zonque.org>,
        <srinivas.kandagatla@linaro.org>,
        <linux-rockchip@lists.infradead.org>, <krzk@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-sunxi@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-xtensa@linux-xtensa.org>,
        <peter.ujfalusi@gmail.com>, <jarkko.nikula@bitmer.com>,
        <heiko@sntech.de>, <jbrunet@baylibre.com>, <kernel@pengutronix.de>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>
Subject: [PATCH 17/56] ASoC: qcom: Update to use set_fmt_new callback
Date:   Thu, 19 May 2022 16:42:39 +0100
Message-ID: <20220519154318.2153729-18-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: -3_Zo-dySkerEjZ5-P2VyFgEGvCRm6BS
X-Proofpoint-ORIG-GUID: -3_Zo-dySkerEjZ5-P2VyFgEGvCRm6BS
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

As part of updating the core to directly tell drivers if they are clock
provider or consumer update these CPU side drivers to use the new direct
callback.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/qcom/apq8016_sbc.c            | 2 +-
 sound/soc/qcom/qdsp6/audioreach.c       | 4 ++--
 sound/soc/qcom/qdsp6/q6afe-dai.c        | 2 +-
 sound/soc/qcom/qdsp6/q6afe.c            | 6 +++---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
 sound/soc/qcom/sc7180.c                 | 2 +-
 sound/soc/qcom/sdm845.c                 | 6 +++---
 sound/soc/qcom/sm8250.c                 | 4 ++--
 8 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index b0a4f7ca27515..e54b8961112f3 100644
--- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -172,7 +172,7 @@ static int msm8916_qdsp6_dai_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 
-	snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_CBS_CFS);
+	snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
 	return apq8016_dai_init(rtd, qdsp6_dai_get_lpass_id(cpu_dai));
 }
 
diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 98c0efa1d0fec..01dac32c50fda 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -732,10 +732,10 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
 	intf_cfg->cfg.sd_line_idx = module->sd_line_idx;
 
 	switch (cfg->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BP_FP:
 		intf_cfg->cfg.ws_src = CONFIG_I2S_WS_SRC_INTERNAL;
 		break;
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BC_FC:
 		/* CPU is slave */
 		intf_cfg->cfg.ws_src = CONFIG_I2S_WS_SRC_EXTERNAL;
 		break;
diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index 8bb7452b8f18c..8f8794cffc1c5 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -648,7 +648,7 @@ static const struct snd_soc_dai_ops q6hdmi_ops = {
 static const struct snd_soc_dai_ops q6i2s_ops = {
 	.prepare	= q6afe_dai_prepare,
 	.hw_params	= q6i2s_hw_params,
-	.set_fmt	= q6i2s_set_fmt,
+	.set_fmt_new	= q6i2s_set_fmt,
 	.shutdown	= q6afe_dai_shutdown,
 	.set_sysclk	= q6afe_mi2s_set_sysclk,
 };
diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 625724852a7fb..919e326b9462b 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -1328,11 +1328,11 @@ int q6afe_i2s_port_prepare(struct q6afe_port *port, struct q6afe_i2s_cfg *cfg)
 	pcfg->i2s_cfg.bit_width = cfg->bit_width;
 	pcfg->i2s_cfg.data_format = AFE_LINEAR_PCM_DATA;
 
-	switch (cfg->fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (cfg->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BP_FP:
 		pcfg->i2s_cfg.ws_src = AFE_PORT_CONFIG_I2S_WS_SRC_INTERNAL;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_BC_FC:
 		/* CPU is slave */
 		pcfg->i2s_cfg.ws_src = AFE_PORT_CONFIG_I2S_WS_SRC_EXTERNAL;
 		break;
diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index ce9e5646d8f3a..82ee52051f831 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -207,7 +207,7 @@ static const struct snd_soc_dai_ops q6i2s_ops = {
 	.shutdown	= q6apm_lpass_dai_shutdown,
 	.set_channel_map  = q6dma_set_channel_map,
 	.hw_params        = q6dma_hw_params,
-	.set_fmt	= q6i2s_set_fmt,
+	.set_fmt_new	= q6i2s_set_fmt,
 };
 
 static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index efccb5c0b3e00..f5f7c64b23a27 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -155,7 +155,7 @@ static int sc7180_snd_startup(struct snd_pcm_substream *substream)
 		}
 
 		snd_soc_dai_set_fmt(codec_dai,
-				    SND_SOC_DAIFMT_CBS_CFS |
+				    SND_SOC_DAIFMT_BC_FC |
 				    SND_SOC_DAIFMT_NB_NF |
 				    SND_SOC_DAIFMT_I2S);
 
diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 61fda790f3756..d8d35563af00f 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -316,8 +316,8 @@ static int sdm845_dai_init(struct snd_soc_pcm_runtime *rtd)
 
 static int sdm845_snd_startup(struct snd_pcm_substream *substream)
 {
-	unsigned int fmt = SND_SOC_DAIFMT_CBS_CFS;
-	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_CBS_CFS;
+	unsigned int fmt = SND_SOC_DAIFMT_BP_FP;
+	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_BC_FC;
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct sdm845_snd_data *data = snd_soc_card_get_drvdata(card);
@@ -356,7 +356,7 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
 		snd_soc_dai_set_sysclk(cpu_dai,
 			Q6AFE_LPASS_CLK_ID_QUAD_MI2S_IBIT,
 			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
-		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_CBS_CFS);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
 
 
 		break;
diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 6e1184c8b672a..ce4a5713386a3 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -96,8 +96,8 @@ static int sm8250_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 
 static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 {
-	unsigned int fmt = SND_SOC_DAIFMT_CBS_CFS;
-	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_CBS_CFS;
+	unsigned int fmt = SND_SOC_DAIFMT_BP_FP;
+	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_BC_FC;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-- 
2.30.2

