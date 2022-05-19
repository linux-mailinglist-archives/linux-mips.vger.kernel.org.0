Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC8B52D8FE
	for <lists+linux-mips@lfdr.de>; Thu, 19 May 2022 17:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241647AbiESPs6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 May 2022 11:48:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241369AbiESPsm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 May 2022 11:48:42 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA7F5F689B;
        Thu, 19 May 2022 08:44:49 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k11s002261;
        Thu, 19 May 2022 10:43:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=acSxSHHdEGhP/Pg2fdRdjf1RhdGB8CAjjCO1XuRlCRo=;
 b=bXcHVLNq1bHnvyVywh+fMEeYkV6xXfOg1Er4VRZwQVddlvaExppL1miEWgEOO5tL665K
 802ILUbsA9i4z4o1Wl4e6MJLxpaK2OV53Rp1N7WABAoBLycAId+jp8+5BvBCFJ0+Y9pF
 Zle0mEs19zAgeT5NiP2cESaXLF64o4g4H+8dVZMv8NZog7JyMAFN4asFBoAilGWtD53F
 q7uiBWrfb2OlPF+pjM3c1DfDu6VVPTLHn/uJIW2vJ9BO4GMoqtKFNl2oXj/ryfJo3nCc
 26Rg3JCBNXl/ZV3FlXvmuo1sUjKrgvgaJiWGcxO0MhYr2pL/oGp/dWyHOYhEnEJCF6wO GQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-4
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
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7D737476;
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
Subject: [PATCH 16/56] ASoC: pxa: Update to use set_fmt_new callback
Date:   Thu, 19 May 2022 16:42:38 +0100
Message-ID: <20220519154318.2153729-17-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: tKunTf8kTDNvKWQiO1tF1HTK68q_UWdw
X-Proofpoint-ORIG-GUID: tKunTf8kTDNvKWQiO1tF1HTK68q_UWdw
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
 sound/soc/pxa/magician.c   |  8 ++++----
 sound/soc/pxa/mmp-sspa.c   |  8 ++++----
 sound/soc/pxa/pxa-ssp.c    | 24 ++++++++++++------------
 sound/soc/pxa/pxa2xx-i2s.c |  8 ++++----
 4 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/sound/soc/pxa/magician.c b/sound/soc/pxa/magician.c
index a5f326c97af23..b0df3237d0746 100644
--- a/sound/soc/pxa/magician.c
+++ b/sound/soc/pxa/magician.c
@@ -90,13 +90,13 @@ static int magician_playback_hw_params(struct snd_pcm_substream *substream,
 
 	/* set codec DAI configuration */
 	ret = snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_MSB |
-			SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS);
+			SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_BC_FC);
 	if (ret < 0)
 		return ret;
 
 	/* set cpu DAI configuration */
 	ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_DSP_A |
-			SND_SOC_DAIFMT_NB_IF | SND_SOC_DAIFMT_CBS_CFS);
+			SND_SOC_DAIFMT_NB_IF | SND_SOC_DAIFMT_BP_FP);
 	if (ret < 0)
 		return ret;
 
@@ -128,14 +128,14 @@ static int magician_capture_hw_params(struct snd_pcm_substream *substream,
 	/* set codec DAI configuration */
 	ret = snd_soc_dai_set_fmt(codec_dai,
 			SND_SOC_DAIFMT_MSB | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS);
+			SND_SOC_DAIFMT_BC_FC);
 	if (ret < 0)
 		return ret;
 
 	/* set cpu DAI configuration */
 	ret = snd_soc_dai_set_fmt(cpu_dai,
 			SND_SOC_DAIFMT_MSB | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS);
+			SND_SOC_DAIFMT_BP_FP);
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index 7e39210a0b384..b746e52aaf85f 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -171,11 +171,11 @@ static int mmp_sspa_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 	sspa->sp   = SSPA_SP_WEN | SSPA_SP_S_RST | SSPA_SP_FFLUSH;
 	sspa->ctrl = 0;
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BP_FP:
 		sspa->sp |= SSPA_SP_MSL;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_BC_FC:
 		break;
 	default:
 		return -EINVAL;
@@ -346,7 +346,7 @@ static const struct snd_soc_dai_ops mmp_sspa_dai_ops = {
 	.hw_params	= mmp_sspa_hw_params,
 	.set_sysclk	= mmp_sspa_set_dai_sysclk,
 	.set_pll	= mmp_sspa_set_dai_pll,
-	.set_fmt	= mmp_sspa_set_dai_fmt,
+	.set_fmt_new	= mmp_sspa_set_dai_fmt,
 };
 
 static struct snd_soc_dai_driver mmp_sspa_dai = {
diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index 7f13a35e9cc14..52124be1778eb 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -372,10 +372,10 @@ static int pxa_ssp_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 {
 	struct ssp_priv *priv = snd_soc_dai_get_drvdata(cpu_dai);
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
-	case SND_SOC_DAIFMT_CBM_CFS:
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_FC:
+	case SND_SOC_DAIFMT_BC_FP:
+	case SND_SOC_DAIFMT_BP_FP:
 		break;
 	default:
 		return -EINVAL;
@@ -432,14 +432,14 @@ static int pxa_ssp_configure_dai_fmt(struct ssp_priv *priv)
 
 	sscr1 |= SSCR1_RxTresh(8) | SSCR1_TxTresh(7);
 
-	switch (priv->dai_fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (priv->dai_fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_FC:
 		sscr1 |= SSCR1_SCLKDIR | SSCR1_SFRMDIR | SSCR1_SCFR;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_BC_FP:
 		sscr1 |= SSCR1_SCLKDIR | SSCR1_SCFR;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_BP_FP:
 		break;
 	default:
 		return -EINVAL;
@@ -484,9 +484,9 @@ static int pxa_ssp_configure_dai_fmt(struct ssp_priv *priv)
 	pxa_ssp_write_reg(ssp, SSCR1, sscr1);
 	pxa_ssp_write_reg(ssp, SSPSP, sspsp);
 
-	switch (priv->dai_fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
-	case SND_SOC_DAIFMT_CBM_CFS:
+	switch (priv->dai_fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_FC:
+	case SND_SOC_DAIFMT_BC_FP:
 		scfr = pxa_ssp_read_reg(ssp, SSCR1) | SSCR1_SCFR;
 		pxa_ssp_write_reg(ssp, SSCR1, scfr);
 
@@ -824,7 +824,7 @@ static const struct snd_soc_dai_ops pxa_ssp_dai_ops = {
 	.trigger	= pxa_ssp_trigger,
 	.hw_params	= pxa_ssp_hw_params,
 	.set_sysclk	= pxa_ssp_set_dai_sysclk,
-	.set_fmt	= pxa_ssp_set_dai_fmt,
+	.set_fmt_new	= pxa_ssp_set_dai_fmt,
 	.set_tdm_slot	= pxa_ssp_set_dai_tdm_slot,
 	.set_tristate	= pxa_ssp_set_dai_tristate,
 };
diff --git a/sound/soc/pxa/pxa2xx-i2s.c b/sound/soc/pxa/pxa2xx-i2s.c
index 5bfc1a9665320..09a0d033df6a2 100644
--- a/sound/soc/pxa/pxa2xx-i2s.c
+++ b/sound/soc/pxa/pxa2xx-i2s.c
@@ -131,11 +131,11 @@ static int pxa2xx_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 		break;
 	}
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BP_FP:
 		pxa_i2s.master = 1;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_BC_FP:
 		pxa_i2s.master = 0;
 		break;
 	default:
@@ -335,7 +335,7 @@ static const struct snd_soc_dai_ops pxa_i2s_dai_ops = {
 	.shutdown	= pxa2xx_i2s_shutdown,
 	.trigger	= pxa2xx_i2s_trigger,
 	.hw_params	= pxa2xx_i2s_hw_params,
-	.set_fmt	= pxa2xx_i2s_set_dai_fmt,
+	.set_fmt_new	= pxa2xx_i2s_set_dai_fmt,
 	.set_sysclk	= pxa2xx_i2s_set_dai_sysclk,
 };
 
-- 
2.30.2

