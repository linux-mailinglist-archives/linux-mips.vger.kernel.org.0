Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC63452D900
	for <lists+linux-mips@lfdr.de>; Thu, 19 May 2022 17:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241666AbiESPtA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 May 2022 11:49:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241545AbiESPsn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 May 2022 11:48:43 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB16F68B3;
        Thu, 19 May 2022 08:44:52 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JBHtac024228;
        Thu, 19 May 2022 10:43:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=7rjEpVyIvqg6pO938gS/Nl/Dh/ev/bFQVZdRDckNPk0=;
 b=bMI53sScCGbPZPzn/hEwJ1DzAYvLspZio+fPw29owVy4tucPpmbITSLW3taZko1Eojx9
 4dqvdpD8R27Gj8cMNtzp3iL/9XB6tHQ35ep3SYgrxhIZZFxlsik2lFdnO7Mf4kfhH/Is
 5X3KbdPgpInsg0uwqh6+vJwHyJ6NE3vqGKFsj3Sz6CWHNPsxshkz3tVYlPO2Amynp3Uc
 aB6Q3xsBlbirAS6i5OCA+NJAgt4AyQzklVRg1beu+UswjacmkLlG5EJDbTUBLTQOvMKJ
 0N27jLVFTnj/2GAKvBwaQe1ALPAXnB9ZGDHfOcgLOU3/zFW/rjjpSIQdlhY+V8PC/Js1 PA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dm-4
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 19 May 2022 10:43:26 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:18 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Thu, 19 May 2022 16:43:18 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E4093475;
        Thu, 19 May 2022 15:43:18 +0000 (UTC)
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
Subject: [PATCH 08/56] ASoC: fsl: Update to use set_fmt_new callback
Date:   Thu, 19 May 2022 16:42:30 +0100
Message-ID: <20220519154318.2153729-9-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: yV0aCyuIJdGCANWBPcWuqfejhbXNNDu3
X-Proofpoint-ORIG-GUID: yV0aCyuIJdGCANWBPcWuqfejhbXNNDu3
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
 sound/soc/fsl/fsl_audmix.c |  6 +++---
 sound/soc/fsl/fsl_esai.c   | 10 +++++-----
 sound/soc/fsl/fsl_mqs.c    |  4 ++--
 sound/soc/fsl/fsl_sai.c    | 10 +++++-----
 sound/soc/fsl/fsl_ssi.c    | 24 ++++++++++++------------
 sound/soc/fsl/imx-audmix.c |  4 ++--
 sound/soc/fsl/imx-card.c   |  2 +-
 7 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index 6dbb8c99f6268..c580dcb9a4cfe 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -259,8 +259,8 @@ static int fsl_audmix_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 	/* For playback the AUDMIX is consumer, and for record is provider */
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBP_CFP:
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BC_FC:
+	case SND_SOC_DAIFMT_BP_FP:
 		break;
 	default:
 		return -EINVAL;
@@ -317,7 +317,7 @@ static int fsl_audmix_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 }
 
 static const struct snd_soc_dai_ops fsl_audmix_dai_ops = {
-	.set_fmt      = fsl_audmix_dai_set_fmt,
+	.set_fmt_new  = fsl_audmix_dai_set_fmt,
 	.trigger      = fsl_audmix_dai_trigger,
 };
 
diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 1a2bdf8e76f00..572bdaee73eb6 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -480,16 +480,16 @@ static int fsl_esai_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 	/* DAI clock provider masks */
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BC_FC:
 		esai_priv->consumer_mode = true;
 		break;
-	case SND_SOC_DAIFMT_CBC_CFP:
+	case SND_SOC_DAIFMT_BP_FC:
 		xccr |= ESAI_xCCR_xCKD;
 		break;
-	case SND_SOC_DAIFMT_CBP_CFC:
+	case SND_SOC_DAIFMT_BC_FP:
 		xccr |= ESAI_xCCR_xFSD;
 		break;
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BP_FP:
 		xccr |= ESAI_xCCR_xFSD | ESAI_xCCR_xCKD;
 		break;
 	default:
@@ -790,7 +790,7 @@ static const struct snd_soc_dai_ops fsl_esai_dai_ops = {
 	.trigger = fsl_esai_trigger,
 	.hw_params = fsl_esai_hw_params,
 	.set_sysclk = fsl_esai_set_dai_sysclk,
-	.set_fmt = fsl_esai_set_dai_fmt,
+	.set_fmt_new = fsl_esai_set_dai_fmt,
 	.set_tdm_slot = fsl_esai_set_dai_tdm_slot,
 };
 
diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index ceaecbe3a25e4..371d441b1dbef 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -103,7 +103,7 @@ static int fsl_mqs_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BP_FP:
 		break;
 	default:
 		return -EINVAL;
@@ -152,7 +152,7 @@ static const struct snd_soc_dai_ops fsl_mqs_dai_ops = {
 	.startup = fsl_mqs_startup,
 	.shutdown = fsl_mqs_shutdown,
 	.hw_params = fsl_mqs_hw_params,
-	.set_fmt = fsl_mqs_set_dai_fmt,
+	.set_fmt_new = fsl_mqs_set_dai_fmt,
 };
 
 static struct snd_soc_dai_driver fsl_mqs_dai = {
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index fa950dde53109..3edd302eb5c22 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -292,19 +292,19 @@ static int fsl_sai_set_dai_fmt_tr(struct snd_soc_dai *cpu_dai,
 
 	/* DAI clock provider masks */
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BP_FP:
 		val_cr2 |= FSL_SAI_CR2_BCD_MSTR;
 		val_cr4 |= FSL_SAI_CR4_FSD_MSTR;
 		sai->is_consumer_mode = false;
 		break;
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BC_FC:
 		sai->is_consumer_mode = true;
 		break;
-	case SND_SOC_DAIFMT_CBC_CFP:
+	case SND_SOC_DAIFMT_BP_FC:
 		val_cr2 |= FSL_SAI_CR2_BCD_MSTR;
 		sai->is_consumer_mode = false;
 		break;
-	case SND_SOC_DAIFMT_CBP_CFC:
+	case SND_SOC_DAIFMT_BC_FP:
 		val_cr4 |= FSL_SAI_CR4_FSD_MSTR;
 		sai->is_consumer_mode = true;
 		break;
@@ -704,7 +704,7 @@ static int fsl_sai_startup(struct snd_pcm_substream *substream,
 static const struct snd_soc_dai_ops fsl_sai_pcm_dai_ops = {
 	.set_bclk_ratio	= fsl_sai_set_dai_bclk_ratio,
 	.set_sysclk	= fsl_sai_set_dai_sysclk,
-	.set_fmt	= fsl_sai_set_dai_fmt,
+	.set_fmt_new	= fsl_sai_set_dai_fmt,
 	.set_tdm_slot	= fsl_sai_set_dai_tdm_slot,
 	.hw_params	= fsl_sai_hw_params,
 	.hw_free	= fsl_sai_hw_free,
diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index 84cb36d9dfea9..32e4cf37c2029 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -93,7 +93,7 @@
  */
 #define FSLSSI_AC97_DAIFMT \
 	(SND_SOC_DAIFMT_AC97 | \
-	 SND_SOC_DAIFMT_CBM_CFS | \
+	 SND_SOC_DAIFMT_BC_FP | \
 	 SND_SOC_DAIFMT_NB_NF)
 
 #define FSLSSI_SIER_DBG_RX_FLAGS \
@@ -358,13 +358,13 @@ static bool fsl_ssi_is_ac97(struct fsl_ssi *ssi)
 static bool fsl_ssi_is_i2s_clock_provider(struct fsl_ssi *ssi)
 {
 	return (ssi->dai_fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) ==
-		SND_SOC_DAIFMT_CBC_CFC;
+		SND_SOC_DAIFMT_BP_FP;
 }
 
-static bool fsl_ssi_is_i2s_cbp_cfc(struct fsl_ssi *ssi)
+static bool fsl_ssi_is_i2s_bc_fp(struct fsl_ssi *ssi)
 {
 	return (ssi->dai_fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) ==
-		SND_SOC_DAIFMT_CBP_CFC;
+		SND_SOC_DAIFMT_BC_FP;
 }
 
 /**
@@ -847,7 +847,7 @@ static int fsl_ssi_hw_params(struct snd_pcm_substream *substream,
 		u8 i2s_net = ssi->i2s_net;
 
 		/* Normal + Network mode to send 16-bit data in 32-bit frames */
-		if (fsl_ssi_is_i2s_cbp_cfc(ssi) && sample_size == 16)
+		if (fsl_ssi_is_i2s_bc_fp(ssi) && sample_size == 16)
 			i2s_net = SSI_SCR_I2S_MODE_NORMAL | SSI_SCR_NET;
 
 		/* Use Normal mode to send mono data at 1st slot of 2 slots */
@@ -920,17 +920,17 @@ static int _fsl_ssi_set_dai_fmt(struct fsl_ssi *ssi, unsigned int fmt)
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
 		switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-		case SND_SOC_DAIFMT_CBC_CFC:
+		case SND_SOC_DAIFMT_BP_FP:
 			if (IS_ERR(ssi->baudclk)) {
 				dev_err(ssi->dev,
 					"missing baudclk for master mode\n");
 				return -EINVAL;
 			}
 			fallthrough;
-		case SND_SOC_DAIFMT_CBP_CFC:
+		case SND_SOC_DAIFMT_BC_FP:
 			ssi->i2s_net |= SSI_SCR_I2S_MODE_MASTER;
 			break;
-		case SND_SOC_DAIFMT_CBP_CFP:
+		case SND_SOC_DAIFMT_BC_FC:
 			ssi->i2s_net |= SSI_SCR_I2S_MODE_SLAVE;
 			break;
 		default:
@@ -992,15 +992,15 @@ static int _fsl_ssi_set_dai_fmt(struct fsl_ssi *ssi, unsigned int fmt)
 
 	/* DAI clock provider masks */
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BP_FP:
 		/* Output bit and frame sync clocks */
 		strcr |= SSI_STCR_TFDIR | SSI_STCR_TXDIR;
 		scr |= SSI_SCR_SYS_CLK_EN;
 		break;
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BC_FC:
 		/* Input bit or frame sync clocks */
 		break;
-	case SND_SOC_DAIFMT_CBP_CFC:
+	case SND_SOC_DAIFMT_BC_FP:
 		/* Input bit clock but output frame sync clock */
 		strcr |= SSI_STCR_TFDIR;
 		break;
@@ -1156,7 +1156,7 @@ static const struct snd_soc_dai_ops fsl_ssi_dai_ops = {
 	.shutdown = fsl_ssi_shutdown,
 	.hw_params = fsl_ssi_hw_params,
 	.hw_free = fsl_ssi_hw_free,
-	.set_fmt = fsl_ssi_set_dai_fmt,
+	.set_fmt_new = fsl_ssi_set_dai_fmt,
 	.set_tdm_slot = fsl_ssi_set_dai_tdm_slot,
 	.trigger = fsl_ssi_trigger,
 };
diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 502fe1b522aba..1292a845c4244 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -81,7 +81,7 @@ static int imx_audmix_fe_hw_params(struct snd_pcm_substream *substream,
 	int ret, dir;
 
 	/* For playback the AUDMIX is consumer, and for record is provider */
-	fmt |= tx ? SND_SOC_DAIFMT_CBC_CFC : SND_SOC_DAIFMT_CBP_CFP;
+	fmt |= tx ? SND_SOC_DAIFMT_BP_FP : SND_SOC_DAIFMT_BC_FC;
 	dir  = tx ? SND_SOC_CLOCK_OUT : SND_SOC_CLOCK_IN;
 
 	/* set DAI configuration */
@@ -122,7 +122,7 @@ static int imx_audmix_be_hw_params(struct snd_pcm_substream *substream,
 		return 0;
 
 	/* For playback the AUDMIX is consumer */
-	fmt |= SND_SOC_DAIFMT_CBP_CFP;
+	fmt |= SND_SOC_DAIFMT_BC_FC;
 
 	/* set AUDMIX DAI configuration */
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0), fmt);
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 6f8efd838fcc8..1797d777b1b87 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -317,7 +317,7 @@ static int imx_aif_hw_params(struct snd_pcm_substream *substream,
 		}
 	}
 
-	ret = snd_soc_dai_set_fmt(cpu_dai, fmt);
+	ret = snd_soc_dai_set_fmt(cpu_dai, snd_soc_daifmt_clock_provider_flipped(fmt));
 	if (ret && ret != -ENOTSUPP) {
 		dev_err(dev, "failed to set cpu dai fmt: %d\n", ret);
 		return ret;
-- 
2.30.2

