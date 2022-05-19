Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF35E52D94E
	for <lists+linux-mips@lfdr.de>; Thu, 19 May 2022 17:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240853AbiESPvw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 May 2022 11:51:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239359AbiESPqp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 May 2022 11:46:45 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51A3EB41D1;
        Thu, 19 May 2022 08:44:31 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JBHtae024228;
        Thu, 19 May 2022 10:43:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=cCymwW53t+NW6259pwZrG7SwU3NLqJXmM42AxN2W2lE=;
 b=Qp4SPrvsh5dq7ZyNRoVHl9R0NDIJLAUeS6desl2BaQQtXlZJSnh2wblad3oCJID0CRAy
 eDDCYELlPswc6BxwzSBPxzI5Av0EmOnBOSPcI+d125FYq183IlP0fLwKIObC1Q1M9KvK
 r9wW6dICkmQ0Gv50mQ4z+BWPeAW0Pa82ItKX3Spz+MP9KEG5dB4ZlEGVu9QtSo/z+E47
 BryufTrKCW2EKLZ0fVRwAAwpW+ZIMc8Q/KVJ3bRVXHVopRuoWVnQJHUJup4jHHJtAMTZ
 DQ8achtsZbSMWiYsqwnASm3+pJJk6ayIkjtKKj9Aee5jZSEZSN9Pw014gAcTeGrXQ81q tA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dm-6
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 19 May 2022 10:43:30 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:19 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Thu, 19 May 2022 16:43:19 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 248AF475;
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
Subject: [PATCH 11/56] ASoC: Intel: Update to use set_fmt_new callback
Date:   Thu, 19 May 2022 16:42:33 +0100
Message-ID: <20220519154318.2153729-12-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 6GNWuMCQR7SgJCvX7XhpNyDiWZ5-qqVz
X-Proofpoint-ORIG-GUID: 6GNWuMCQR7SgJCvX7XhpNyDiWZ5-qqVz
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
 sound/soc/intel/atom/sst-atom-controls.c     | 4 ++--
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 2 +-
 sound/soc/intel/boards/bytcht_cx2072x.c      | 2 +-
 sound/soc/intel/boards/bytcht_da7213.c       | 2 +-
 sound/soc/intel/boards/bytcht_es8316.c       | 2 +-
 sound/soc/intel/boards/bytcht_nocodec.c      | 2 +-
 sound/soc/intel/boards/bytcr_rt5640.c        | 2 +-
 sound/soc/intel/boards/bytcr_rt5651.c        | 2 +-
 sound/soc/intel/boards/bytcr_wm5102.c        | 2 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c | 3 +--
 sound/soc/intel/boards/cht_bsw_rt5645.c      | 6 +++---
 sound/soc/intel/boards/cht_bsw_rt5672.c      | 2 +-
 sound/soc/intel/keembay/kmb_platform.c       | 6 +++---
 13 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/sound/soc/intel/atom/sst-atom-controls.c b/sound/soc/intel/atom/sst-atom-controls.c
index 335c327329945..406455ddcb96e 100644
--- a/sound/soc/intel/atom/sst-atom-controls.c
+++ b/sound/soc/intel/atom/sst-atom-controls.c
@@ -831,9 +831,9 @@ static int sst_get_ssp_mode(struct snd_soc_dai *dai, unsigned int fmt)
 	dev_dbg(dai->dev, "Enter:%s, format=%x\n", __func__, format);
 
 	switch (format) {
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BP_FP:
 		return SSP_MODE_PROVIDER;
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BC_FC:
 		return SSP_MODE_CONSUMER;
 	default:
 		dev_err(dai->dev, "Invalid ssp protocol: %d\n", format);
diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index a56dd48c045f3..339d9440c1501 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -473,7 +473,7 @@ static const struct snd_soc_dai_ops sst_compr_dai_ops = {
 static const struct snd_soc_dai_ops sst_be_dai_ops = {
 	.startup = sst_enable_ssp,
 	.hw_params = sst_be_hw_params,
-	.set_fmt = sst_set_format,
+	.set_fmt_new = sst_set_format,
 	.set_tdm_slot = sst_platform_set_ssp_slot,
 	.shutdown = sst_disable_ssp,
 };
diff --git a/sound/soc/intel/boards/bytcht_cx2072x.c b/sound/soc/intel/boards/bytcht_cx2072x.c
index 0eed68a11f7e1..ae899866863e5 100644
--- a/sound/soc/intel/boards/bytcht_cx2072x.c
+++ b/sound/soc/intel/boards/bytcht_cx2072x.c
@@ -126,7 +126,7 @@ static int byt_cht_cx2072x_fixup(struct snd_soc_pcm_runtime *rtd,
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				SND_SOC_DAIFMT_I2S     |
 				SND_SOC_DAIFMT_NB_NF   |
-				SND_SOC_DAIFMT_CBC_CFC);
+				SND_SOC_DAIFMT_BP_FP);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/bytcht_da7213.c b/sound/soc/intel/boards/bytcht_da7213.c
index eb19bf16afad4..a0c8f1d3f8cec 100644
--- a/sound/soc/intel/boards/bytcht_da7213.c
+++ b/sound/soc/intel/boards/bytcht_da7213.c
@@ -81,7 +81,7 @@ static int codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
 				  SND_SOC_DAIFMT_NB_NF   |
-				  SND_SOC_DAIFMT_CBC_CFC);
+				  SND_SOC_DAIFMT_BP_FP);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index a08507783e44a..6432b83f616f3 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -265,7 +265,7 @@ static int byt_cht_es8316_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				SND_SOC_DAIFMT_I2S     |
 				SND_SOC_DAIFMT_NB_NF   |
-				SND_SOC_DAIFMT_CBC_CFC
+				SND_SOC_DAIFMT_BP_FP
 		);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
diff --git a/sound/soc/intel/boards/bytcht_nocodec.c b/sound/soc/intel/boards/bytcht_nocodec.c
index 115c2bcaabd4f..7fc03f2efd356 100644
--- a/sound/soc/intel/boards/bytcht_nocodec.c
+++ b/sound/soc/intel/boards/bytcht_nocodec.c
@@ -61,7 +61,7 @@ static int codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
 				  SND_SOC_DAIFMT_NB_NF   |
-				  SND_SOC_DAIFMT_CBC_CFC);
+				  SND_SOC_DAIFMT_BP_FP);
 
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 7b948a219177d..0a78315e1f4aa 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1411,7 +1411,7 @@ static int byt_rt5640_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
 				  SND_SOC_DAIFMT_NB_NF   |
-				  SND_SOC_DAIFMT_CBC_CFC);
+				  SND_SOC_DAIFMT_BP_FP);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index d467fcaa48eaa..f72a597114bf5 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -706,7 +706,7 @@ static int byt_rt5651_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
 				  SND_SOC_DAIFMT_NB_NF   |
-				  SND_SOC_DAIFMT_CBC_CFC
+				  SND_SOC_DAIFMT_BP_FP
 				  );
 
 	if (ret < 0) {
diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index 00384c6fbcaa5..fe79f6e5f2bb8 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -265,7 +265,7 @@ static int byt_wm5102_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
 				  SND_SOC_DAIFMT_NB_NF   |
-				  SND_SOC_DAIFMT_CBC_CFC);
+				  SND_SOC_DAIFMT_BP_FP);
 	if (ret) {
 		dev_err(rtd->dev, "Error setting format to I2S: %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/cht_bsw_max98090_ti.c b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
index a5160f27adea9..64eb73525ee37 100644
--- a/sound/soc/intel/boards/cht_bsw_max98090_ti.c
+++ b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
@@ -264,8 +264,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		return ret;
 	}
 
-	fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBC_CFC;
+	fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_BP_FP;
 
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0), fmt);
 	if (ret < 0) {
diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
index 45c301ea5e003..56ee53e7ed3f5 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5645.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
@@ -362,7 +362,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 					SND_SOC_DAIFMT_I2S     |
 					SND_SOC_DAIFMT_NB_NF   |
-					SND_SOC_DAIFMT_CBC_CFC
+					SND_SOC_DAIFMT_BP_FP
 			);
 		if (ret < 0) {
 			dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
@@ -372,7 +372,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		ret = snd_soc_dai_set_fmt(asoc_rtd_to_codec(rtd, 0),
 					SND_SOC_DAIFMT_I2S     |
 					SND_SOC_DAIFMT_NB_NF   |
-					SND_SOC_DAIFMT_CBC_CFC
+					SND_SOC_DAIFMT_BC_FC
 			);
 		if (ret < 0) {
 			dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
@@ -396,7 +396,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		ret = snd_soc_dai_set_fmt(asoc_rtd_to_codec(rtd, 0),
 					SND_SOC_DAIFMT_DSP_B |
 					SND_SOC_DAIFMT_IB_NF |
-					SND_SOC_DAIFMT_CBC_CFC);
+					SND_SOC_DAIFMT_BC_FC);
 		if (ret < 0) {
 			dev_err(rtd->dev, "can't set format to TDM %d\n", ret);
 			return ret;
diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index c80324f34b1b2..ca47f6476b077 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -300,7 +300,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
 				  SND_SOC_DAIFMT_NB_NF   |
-				  SND_SOC_DAIFMT_CBC_CFC);
+				  SND_SOC_DAIFMT_BP_FP);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/keembay/kmb_platform.c b/sound/soc/intel/keembay/kmb_platform.c
index a6fb74ba1c424..a65f03884d9a5 100644
--- a/sound/soc/intel/keembay/kmb_platform.c
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -497,11 +497,11 @@ static int kmb_set_dai_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 	int ret;
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BC_FC:
 		kmb_i2s->clock_provider = false;
 		ret = 0;
 		break;
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BP_FP:
 		writel(CLOCK_PROVIDER_MODE, kmb_i2s->pss_base + I2S_GEN_CFG_0);
 
 		ret = clk_prepare_enable(kmb_i2s->clk_i2s);
@@ -736,7 +736,7 @@ static const struct snd_soc_dai_ops kmb_dai_ops = {
 	.hw_params	= kmb_dai_hw_params,
 	.hw_free	= kmb_dai_hw_free,
 	.prepare	= kmb_dai_prepare,
-	.set_fmt	= kmb_set_dai_fmt,
+	.set_fmt_new	= kmb_set_dai_fmt,
 };
 
 static struct snd_soc_dai_driver intel_kmb_hdmi_dai[] = {
-- 
2.30.2

