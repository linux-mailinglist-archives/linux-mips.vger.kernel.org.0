Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB5552D887
	for <lists+linux-mips@lfdr.de>; Thu, 19 May 2022 17:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232930AbiESPqm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 May 2022 11:46:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233763AbiESPpU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 May 2022 11:45:20 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBA1B7A458;
        Thu, 19 May 2022 08:44:17 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k11u002261;
        Thu, 19 May 2022 10:43:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=AjjqMicnhPoZqT6UYhPvoYkn3XWnwuGY9ExR1ybyO/8=;
 b=NK96uTLoDF75ZrvxXTw7p6hi4vOr0sdLWBCFb7xG2WQmM7XY+OSWKOGylt80CwFHEW0E
 vFhM7kYvrRxtFCW7nLM2xduTcKUBmqHh4lQr8sV/uUkgXbFgGEfe+1xcxQfVQOFwvqf5
 A3pODWEL7GZnc8tJxO1yIoPrWM2qx0A+NkP7QDSgAyQ44vklOyxds0962e9L+amBschB
 JVN5JmUiThHA6OHIZ85kQQCP4n9hf8oh1h9ejwTkDE6OFAmENLWwJLW+EJStVYBoKQjB
 DA7lPaF2/RSeC7+BYerdro+mM77ha8x4GHdwnkNK4ugcjsHnlIdFQhBfyMpWDB8diSJ/ wA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-5
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 19 May 2022 10:43:34 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:19 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Thu, 19 May 2022 16:43:19 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BA87A476;
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
Subject: [PATCH 19/56] ASoC: samsung: Update to use set_fmt_new callback
Date:   Thu, 19 May 2022 16:42:41 +0100
Message-ID: <20220519154318.2153729-20-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 579zJA1j8qpgk8t0NR1Uq8E4v_eh2bkG
X-Proofpoint-ORIG-GUID: 579zJA1j8qpgk8t0NR1Uq8E4v_eh2bkG
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
 sound/soc/samsung/i2s.c         | 8 ++++----
 sound/soc/samsung/pcm.c         | 6 +++---
 sound/soc/samsung/s3c-i2s-v2.c  | 8 ++++----
 sound/soc/samsung/s3c24xx-i2s.c | 8 ++++----
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 70c827162be4d..9ed275ebd744e 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -671,11 +671,11 @@ static int i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_FC:
 		tmp |= mod_slave;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_BP_FP:
 		/*
 		 * Set default source clock in Master mode, only when the
 		 * CLK_I2S_RCLK_SRC clock is not exposed so we ensure any
@@ -1107,7 +1107,7 @@ static int samsung_i2s_dai_remove(struct snd_soc_dai *dai)
 static const struct snd_soc_dai_ops samsung_i2s_dai_ops = {
 	.trigger = i2s_trigger,
 	.hw_params = i2s_hw_params,
-	.set_fmt = i2s_set_fmt,
+	.set_fmt_new = i2s_set_fmt,
 	.set_clkdiv = i2s_set_clkdiv,
 	.set_sysclk = i2s_set_sysclk,
 	.startup = i2s_startup,
diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index 4c4dfde0568fe..818172d8832d2 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -340,8 +340,8 @@ static int s3c_pcm_set_fmt(struct snd_soc_dai *cpu_dai,
 		goto exit;
 	}
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BP_FP:
 		/* Nothing to do, Master by default */
 		break;
 	default:
@@ -437,7 +437,7 @@ static const struct snd_soc_dai_ops s3c_pcm_dai_ops = {
 	.set_clkdiv	= s3c_pcm_set_clkdiv,
 	.trigger	= s3c_pcm_trigger,
 	.hw_params	= s3c_pcm_hw_params,
-	.set_fmt	= s3c_pcm_set_fmt,
+	.set_fmt_new	= s3c_pcm_set_fmt,
 };
 
 static int s3c_pcm_dai_probe(struct snd_soc_dai *dai)
diff --git a/sound/soc/samsung/s3c-i2s-v2.c b/sound/soc/samsung/s3c-i2s-v2.c
index de66cc422e6ea..9c8a0697849d7 100644
--- a/sound/soc/samsung/s3c-i2s-v2.c
+++ b/sound/soc/samsung/s3c-i2s-v2.c
@@ -252,12 +252,12 @@ static int s3c2412_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 	iismod = readl(i2s->regs + S3C2412_IISMOD);
 	pr_debug("hw_params r: IISMOD: %x \n", iismod);
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_FC:
 		i2s->master = 0;
 		iismod |= S3C2412_IISMOD_SLAVE;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_BP_FP:
 		i2s->master = 1;
 		iismod &= ~S3C2412_IISMOD_SLAVE;
 		break;
@@ -666,7 +666,7 @@ int s3c_i2sv2_register_component(struct device *dev, int id,
 	ops->trigger = s3c2412_i2s_trigger;
 	if (!ops->hw_params)
 		ops->hw_params = s3c_i2sv2_hw_params;
-	ops->set_fmt = s3c2412_i2s_set_fmt;
+	ops->set_fmt_new = s3c2412_i2s_set_fmt;
 	ops->set_clkdiv = s3c2412_i2s_set_clkdiv;
 	ops->set_sysclk = s3c_i2sv2_set_sysclk;
 
diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index 0f46304eaa4f3..6226b3b585e54 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -169,11 +169,11 @@ static int s3c24xx_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 	iismod = readl(s3c24xx_i2s.regs + S3C2410_IISMOD);
 	pr_debug("hw_params r: IISMOD: %x \n", iismod);
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_CFC:
 		iismod |= S3C2410_IISMOD_SLAVE;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_BP_FP:
 		iismod &= ~S3C2410_IISMOD_SLAVE;
 		break;
 	default:
@@ -394,7 +394,7 @@ static int s3c24xx_i2s_resume(struct snd_soc_component *component)
 static const struct snd_soc_dai_ops s3c24xx_i2s_dai_ops = {
 	.trigger	= s3c24xx_i2s_trigger,
 	.hw_params	= s3c24xx_i2s_hw_params,
-	.set_fmt	= s3c24xx_i2s_set_fmt,
+	.set_fmt_new	= s3c24xx_i2s_set_fmt,
 	.set_clkdiv	= s3c24xx_i2s_set_clkdiv,
 	.set_sysclk	= s3c24xx_i2s_set_sysclk,
 };
-- 
2.30.2

