Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A25EA52D8C4
	for <lists+linux-mips@lfdr.de>; Thu, 19 May 2022 17:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241252AbiESPr2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 May 2022 11:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241286AbiESPqP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 May 2022 11:46:15 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 551007CB19;
        Thu, 19 May 2022 08:44:21 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JBHtai024228;
        Thu, 19 May 2022 10:43:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=G4zupERH5Zc88BD4UCqDoelauUTmm8cZJDN3JGzAYN0=;
 b=ZFct4dO4+QlcDMWLpgdbammZyn87Ncvb/Vge6R7Ja7CzEHUvRza63Grxbrc2qgmQwk7f
 aeXxP7WnEa8/vDOC+9gMLROQHxUi2ZZv+VOt7j8KcaehCpHpX+jclqlUmOY3bNRrBzEO
 a1p2Aa4FcYWoIbVJgDc+8GSaVcEl5AP/+PLoyuKdUwQjQadBp0PG8fu+zjiAKJw6pbTv
 MOcsJQNrPH8wP8r0RT7fw6CwZs1An8U4eLtJ43r9AuGssnzYAd4UquMGmN3PTMIvbGka
 No4X4qgkRxp0DPTuqazVwi5hWKAAwIf4cEVFNmPTlf/y1GHrKxysgO86yqpI/fdgNQma sg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dm-10
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 19 May 2022 10:43:34 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Thu, 19 May 2022 16:43:20 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0C7B0475;
        Thu, 19 May 2022 15:43:20 +0000 (UTC)
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
Subject: [PATCH 23/56] ASoC: tegra: Update to use set_fmt_new callback
Date:   Thu, 19 May 2022 16:42:45 +0100
Message-ID: <20220519154318.2153729-24-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: EY-pvjFJiKFAevaceF1oiZRIpak7ye6H
X-Proofpoint-ORIG-GUID: EY-pvjFJiKFAevaceF1oiZRIpak7ye6H
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
 sound/soc/tegra/tegra20_i2s.c  | 8 ++++----
 sound/soc/tegra/tegra210_i2s.c | 8 ++++----
 sound/soc/tegra/tegra30_i2s.c  | 8 ++++----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index 27365a877e471..9abb0e3536d82 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -95,11 +95,11 @@ static int tegra20_i2s_set_fmt(struct snd_soc_dai *dai,
 	}
 
 	mask |= TEGRA20_I2S_CTRL_MASTER_ENABLE;
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BP_FP:
 		val |= TEGRA20_I2S_CTRL_MASTER_ENABLE;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_BC_FC:
 		break;
 	default:
 		return -EINVAL;
@@ -311,7 +311,7 @@ static int tegra20_i2s_startup(struct snd_pcm_substream *substream,
 }
 
 static const struct snd_soc_dai_ops tegra20_i2s_dai_ops = {
-	.set_fmt	= tegra20_i2s_set_fmt,
+	.set_fmt_new	= tegra20_i2s_set_fmt,
 	.hw_params	= tegra20_i2s_hw_params,
 	.trigger	= tegra20_i2s_trigger,
 	.startup	= tegra20_i2s_startup,
diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index 9552bbb939dd1..a304948ee3935 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -214,11 +214,11 @@ static int tegra210_i2s_set_fmt(struct snd_soc_dai *dai,
 	unsigned int mask, val;
 
 	mask = I2S_CTRL_MASTER_EN_MASK;
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BP_FP:
 		val = 0;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_BC_FC:
 		val = I2S_CTRL_MASTER_EN;
 		break;
 	default:
@@ -678,7 +678,7 @@ static int tegra210_i2s_hw_params(struct snd_pcm_substream *substream,
 }
 
 static const struct snd_soc_dai_ops tegra210_i2s_dai_ops = {
-	.set_fmt	= tegra210_i2s_set_fmt,
+	.set_fmt_new	= tegra210_i2s_set_fmt,
 	.hw_params	= tegra210_i2s_hw_params,
 	.set_bclk_ratio	= tegra210_i2s_set_dai_bclk_ratio,
 	.set_tdm_slot	= tegra210_i2s_set_tdm_slot,
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 084a533bf4f2c..a4ea5221de6b4 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -87,11 +87,11 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
 	}
 
 	mask |= TEGRA30_I2S_CTRL_MASTER_ENABLE;
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BP_FP:
 		val |= TEGRA30_I2S_CTRL_MASTER_ENABLE;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_BC_FC:
 		break;
 	default:
 		return -EINVAL;
@@ -304,7 +304,7 @@ static int tegra30_i2s_probe(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_dai_ops tegra30_i2s_dai_ops = {
-	.set_fmt	= tegra30_i2s_set_fmt,
+	.set_fmt_new	= tegra30_i2s_set_fmt,
 	.hw_params	= tegra30_i2s_hw_params,
 	.trigger	= tegra30_i2s_trigger,
 	.set_tdm_slot	= tegra30_i2s_set_tdm,
-- 
2.30.2

