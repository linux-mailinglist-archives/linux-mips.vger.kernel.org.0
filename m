Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6A152D951
	for <lists+linux-mips@lfdr.de>; Thu, 19 May 2022 17:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231587AbiESPvp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 May 2022 11:51:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241342AbiESPsl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 May 2022 11:48:41 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19A63F6890;
        Thu, 19 May 2022 08:44:49 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J66mW5012194;
        Thu, 19 May 2022 10:43:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=lEOQzf6jwkcqt46v/7lQAovdPprogCzrzpBkFDA/ta8=;
 b=oBCgo64Ot9kwqpn8BjeWCwSMTHJ4/tUtlSQu6BXLO/4AI8N2KEoe3av7vP2tAZlH6kqz
 swNBkn+VTriZZN49ptokqEA5/0DVJSHKFybpJZLtVrOTeiYxC0jMBIfcDUKmyBeB2lsw
 yv9bs0xc1Nf8TKmq1/bfC6+FzXN+PnipDaNJSfJL9v+sPmfV8VIc5AqxbgnCVA6cEqpx
 t+U+n2f1oKd2IGqAsY18g+J0Y4rjFKAL3VDIoRtCdsnGrKjDKLpHx3sYrq+7VdcPLFzn
 yLVXwXpCH1xs0huB70buwByQyIf1AgiMsdaSvvw5DoSRhrhnGCRp/aq/TFe7BGV+m+Wg 3g== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dn-8
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 19 May 2022 10:43:32 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Thu, 19 May 2022 16:43:20 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3DDB111D1;
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
Subject: [PATCH 26/56] ASoC: ux500: Update to use set_fmt_new callback
Date:   Thu, 19 May 2022 16:42:48 +0100
Message-ID: <20220519154318.2153729-27-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ilAx8M0voF3WSsU_nn-pp0DNJuhb3sWj
X-Proofpoint-ORIG-GUID: ilAx8M0voF3WSsU_nn-pp0DNJuhb3sWj
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
 sound/soc/ux500/ux500_msp_dai.c | 38 ++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/sound/soc/ux500/ux500_msp_dai.c b/sound/soc/ux500/ux500_msp_dai.c
index 21052378a32eb..cd6c4bdf5041d 100644
--- a/sound/soc/ux500/ux500_msp_dai.c
+++ b/sound/soc/ux500/ux500_msp_dai.c
@@ -191,8 +191,8 @@ static int setup_clocking(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_FC:
 		dev_dbg(dai->dev, "%s: Codec is master.\n", __func__);
 
 		msp_config->iodelay = 0x20;
@@ -204,7 +204,7 @@ static int setup_clocking(struct snd_soc_dai *dai,
 
 		break;
 
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_BP_FP:
 		dev_dbg(dai->dev, "%s: Codec is slave.\n", __func__);
 
 		msp_config->tx_clk_sel = TX_CLK_SEL_SRG;
@@ -328,15 +328,15 @@ static int setup_msp_config(struct snd_pcm_substream *substream,
 	dev_dbg(dai->dev, "%s: rate: %u, channels: %d.\n", __func__,
 		runtime->rate, runtime->channels);
 	switch (fmt &
-		(SND_SOC_DAIFMT_FORMAT_MASK | SND_SOC_DAIFMT_MASTER_MASK)) {
-	case SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS:
+		(SND_SOC_DAIFMT_FORMAT_MASK | SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK)) {
+	case SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_BP_FP:
 		dev_dbg(dai->dev, "%s: SND_SOC_DAIFMT_I2S.\n", __func__);
 
 		msp_config->default_protdesc = 1;
 		msp_config->protocol = MSP_I2S_PROTOCOL;
 		break;
 
-	case SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_BC_FC:
 		dev_dbg(dai->dev, "%s: SND_SOC_DAIFMT_I2S.\n", __func__);
 
 		msp_config->data_size = MSP_DATA_BITS_16;
@@ -348,10 +348,10 @@ static int setup_msp_config(struct snd_pcm_substream *substream,
 
 		break;
 
-	case SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_CBS_CFS:
-	case SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_CBM_CFM:
-	case SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_CBS_CFS:
-	case SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_BP_FP:
+	case SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_BC_FC:
+	case SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_BP_FP:
+	case SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_BC_FC:
 		dev_dbg(dai->dev, "%s: PCM format.\n", __func__);
 
 		msp_config->data_size = MSP_DATA_BITS_16;
@@ -477,7 +477,7 @@ static int ux500_msp_dai_prepare(struct snd_pcm_substream *substream,
 	}
 
 	/* Set OPP-level */
-	if ((drvdata->fmt & SND_SOC_DAIFMT_MASTER_MASK) &&
+	if ((drvdata->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) &&
 		(drvdata->msp->f_bitclk > 19200000)) {
 		/* If the bit-clock is higher than 19.2MHz, Vape should be
 		 * run in 100% OPP. Only when bit-clock is used (MSP master)
@@ -544,13 +544,13 @@ static int ux500_msp_dai_set_dai_fmt(struct snd_soc_dai *dai,
 	dev_dbg(dai->dev, "%s: MSP %d: Enter.\n", __func__, dai->id);
 
 	switch (fmt & (SND_SOC_DAIFMT_FORMAT_MASK |
-		SND_SOC_DAIFMT_MASTER_MASK)) {
-	case SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS:
-	case SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBM_CFM:
-	case SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_CBS_CFS:
-	case SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_CBM_CFM:
-	case SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_CBS_CFS:
-	case SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_CBM_CFM:
+		SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK)) {
+	case SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_BP_FP:
+	case SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_BC_FC:
+	case SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_BP_FP:
+	case SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_BC_FC:
+	case SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_BP_FP:
+	case SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_BC_FC:
 		break;
 
 	default:
@@ -707,7 +707,7 @@ static int ux500_msp_dai_probe(struct snd_soc_dai *dai)
 static const struct snd_soc_dai_ops ux500_msp_dai_ops[] = {
 	{
 		.set_sysclk = ux500_msp_dai_set_dai_sysclk,
-		.set_fmt = ux500_msp_dai_set_dai_fmt,
+		.set_fmt_new = ux500_msp_dai_set_dai_fmt,
 		.set_tdm_slot = ux500_msp_dai_set_tdm_slot,
 		.startup = ux500_msp_dai_startup,
 		.shutdown = ux500_msp_dai_shutdown,
-- 
2.30.2

