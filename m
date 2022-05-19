Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5B952D884
	for <lists+linux-mips@lfdr.de>; Thu, 19 May 2022 17:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232884AbiESPql (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 May 2022 11:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240740AbiESPqL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 May 2022 11:46:11 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD37A7CB11;
        Thu, 19 May 2022 08:44:16 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JBHtad024228;
        Thu, 19 May 2022 10:43:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=JZwMeAXTmKyqZh6PnwjGmQ7Sg6P9A85VRbLP68aHx+U=;
 b=NuKu4vk+OZb2YcWlAAFVraEWupCLmAqo6g/teCFwiVObhAP2zaNgrGJkg7fqXXlvkf+W
 j8VllfGLHAb7SHTVf4t/KetLhJk2FG+dCpkE66CeRU3PKM5CR9jXYIxoEkHEuAuZOqKj
 Dcny0Oe3fGhBQOshT+Gf4mpVoV92gK2bXBpDdvfBF5pcDl2g2GXHbO/8w6ix4KkRKVoQ
 pUCAfZFnWfV+/4Lg0ReHkO1GpMbjzGru8BcJ/QGXithzrck4mcqarMpQheE9lGQLKk+R
 VRcxLEIwpFUQn2dB6BuEE5ghSeyVTwq6c4hubJzdTwnhDjhfvXcVowjNQBlv+uvz95gP yQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dm-5
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 19 May 2022 10:43:27 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:19 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Thu, 19 May 2022 16:43:19 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F195D11D3;
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
Subject: [PATCH 09/56] ASoC: hisilicon: Update to use set_fmt_new callback
Date:   Thu, 19 May 2022 16:42:31 +0100
Message-ID: <20220519154318.2153729-10-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: xseAf3viMvfsJbVMvc_EICfoCoFhnqVY
X-Proofpoint-ORIG-GUID: xseAf3viMvfsJbVMvc_EICfoCoFhnqVY
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
provider or consumer update this CPU side driver to use the new direct
callback.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/hisilicon/hi6210-i2s.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/hisilicon/hi6210-i2s.c b/sound/soc/hisilicon/hi6210-i2s.c
index a297d4af5099f..51f98ae651a6b 100644
--- a/sound/soc/hisilicon/hi6210-i2s.c
+++ b/sound/soc/hisilicon/hi6210-i2s.c
@@ -227,9 +227,9 @@ static int hi6210_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 	 * We don't actually set the hardware until the hw_params
 	 * call, but we need to validate the user input here.
 	 */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_FC:
+	case SND_SOC_DAIFMT_BP_FP:
 		break;
 	default:
 		return -EINVAL;
@@ -245,8 +245,8 @@ static int hi6210_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 	}
 
 	i2s->format = fmt;
-	i2s->master = (i2s->format & SND_SOC_DAIFMT_MASTER_MASK) ==
-		      SND_SOC_DAIFMT_CBS_CFS;
+	i2s->master = (i2s->format & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) ==
+		      SND_SOC_DAIFMT_BP_FP;
 
 	return 0;
 }
@@ -375,21 +375,21 @@ static int hi6210_i2s_hw_params(struct snd_pcm_substream *substream,
 	hi6210_write_reg(i2s, HII2S_MUX_TOP_MODULE_CFG, val);
 
 
-	switch (i2s->format & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (i2s->format & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_FC:
 		i2s->master = false;
 		val = hi6210_read_reg(i2s, HII2S_I2S_CFG);
 		val |= HII2S_I2S_CFG__S2_MST_SLV;
 		hi6210_write_reg(i2s, HII2S_I2S_CFG, val);
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_BP_FP:
 		i2s->master = true;
 		val = hi6210_read_reg(i2s, HII2S_I2S_CFG);
 		val &= ~HII2S_I2S_CFG__S2_MST_SLV;
 		hi6210_write_reg(i2s, HII2S_I2S_CFG, val);
 		break;
 	default:
-		WARN_ONCE(1, "Invalid i2s->fmt MASTER_MASK. This shouldn't happen\n");
+		WARN_ONCE(1, "Invalid i2s->fmt CLOCK_PROVIDER_MASK. This shouldn't happen\n");
 		return -EINVAL;
 	}
 
@@ -513,7 +513,7 @@ static int hi6210_i2s_dai_probe(struct snd_soc_dai *dai)
 static const struct snd_soc_dai_ops hi6210_i2s_dai_ops = {
 	.trigger	= hi6210_i2s_trigger,
 	.hw_params	= hi6210_i2s_hw_params,
-	.set_fmt	= hi6210_i2s_set_fmt,
+	.set_fmt_new	= hi6210_i2s_set_fmt,
 	.startup	= hi6210_i2s_startup,
 	.shutdown	= hi6210_i2s_shutdown,
 };
-- 
2.30.2

