Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5CED52D882
	for <lists+linux-mips@lfdr.de>; Thu, 19 May 2022 17:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232608AbiESPqk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 May 2022 11:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235728AbiESPp7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 May 2022 11:45:59 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD32C7CB0B;
        Thu, 19 May 2022 08:44:17 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k11r002261;
        Thu, 19 May 2022 10:43:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=kD1B773MBiF628MCZwnfrPTmWdTJLUu9t12F6hptUHY=;
 b=TSLKxYscgRc9jKl+hEETDkrYIvTiB4UPv/6nhCHjUH5XOstT131BPrwSJZHWBRyuNzS1
 +B7tFgf/jze5q1i3qFfF5TMcJ4EC4GEQ0GPzLt8QcDpqZO8HlricKMF3HfV9wNhlaOFU
 sBnwccf/wMFK3yIznxYd4Xb9RhjKiqHb8bafasf7yzsLCpN2IV20CVoPjaqqdy3MHtDB
 fT9yMFc3L9zuWiYs6IyKrnjGyu7kH8Lossnnv+qfEetF9UorrdjbQmNG7Rfv5bATjGcV
 tapwxGtWyqxZrw7UtFKafJKZFPYlZAhrOm4clX6u9AVy7poQeZkN4G0ZomtFZBnnvaKn Og== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcg-4
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 19 May 2022 10:43:33 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Thu, 19 May 2022 16:43:20 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2966811D3;
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
Subject: [PATCH 25/56] ASoC: ti: Update to use set_fmt_new callback
Date:   Thu, 19 May 2022 16:42:47 +0100
Message-ID: <20220519154318.2153729-26-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: OER1QOyeDbNm0qMCxJiWWWldW5oVeyzz
X-Proofpoint-ORIG-GUID: OER1QOyeDbNm0qMCxJiWWWldW5oVeyzz
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
 sound/soc/ti/davinci-i2s.c   | 34 +++++++++++++++++-----------------
 sound/soc/ti/davinci-mcasp.c | 12 ++++++------
 sound/soc/ti/omap-mcbsp.c    | 14 +++++++-------
 3 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index 0363a088d2e00..c7368d5296688 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -230,15 +230,15 @@ static int davinci_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 
 	dev->fmt = fmt;
 	/* set master/slave audio interface */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BP_FP:
 		/* cpu is master */
 		pcr = DAVINCI_MCBSP_PCR_FSXM |
 			DAVINCI_MCBSP_PCR_FSRM |
 			DAVINCI_MCBSP_PCR_CLKXM |
 			DAVINCI_MCBSP_PCR_CLKRM;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_BC_FP:
 		pcr = DAVINCI_MCBSP_PCR_FSRM | DAVINCI_MCBSP_PCR_FSXM;
 		/*
 		 * Selection of the clock input pin that is the
@@ -260,7 +260,7 @@ static int davinci_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 		}
 
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_BC_FC:
 		/* codec is master */
 		pcr = 0;
 		break;
@@ -395,12 +395,12 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
 		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG, spcr);
 	}
 
-	master = dev->fmt & SND_SOC_DAIFMT_MASTER_MASK;
+	master = dev->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
 	fmt = params_format(params);
 	mcbsp_word_length = asp_word_length[fmt];
 
 	switch (master) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_BP_FP:
 		freq = clk_get_rate(dev->clk);
 		srgr = DAVINCI_MCBSP_SRGR_FSGM |
 		       DAVINCI_MCBSP_SRGR_CLKSM;
@@ -426,7 +426,7 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
 		clk_div &= 0xFF;
 		srgr |= clk_div;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_BC_FP:
 		srgr = DAVINCI_MCBSP_SRGR_FSGM;
 		clk_div = dev->clk_div - 1;
 		srgr |= DAVINCI_MCBSP_SRGR_FWID(mcbsp_word_length * 8 - 1);
@@ -434,7 +434,7 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
 		clk_div &= 0xFF;
 		srgr |= clk_div;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_BC_FC:
 		/* Clock and frame sync given from external sources */
 		i = hw_param_interval(params, SNDRV_PCM_HW_PARAM_SAMPLE_BITS);
 		srgr = DAVINCI_MCBSP_SRGR_FSGM;
@@ -473,15 +473,15 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
 			fmt = double_fmt[fmt];
 		}
 		switch (master) {
-		case SND_SOC_DAIFMT_CBS_CFS:
-		case SND_SOC_DAIFMT_CBS_CFM:
+		case SND_SOC_DAIFMT_BP_FP:
+		case SND_SOC_DAIFMT_BP_FC:
 			rcr |= DAVINCI_MCBSP_RCR_RFRLEN2(0);
 			xcr |= DAVINCI_MCBSP_XCR_XFRLEN2(0);
 			rcr |= DAVINCI_MCBSP_RCR_RPHASE;
 			xcr |= DAVINCI_MCBSP_XCR_XPHASE;
 			break;
-		case SND_SOC_DAIFMT_CBM_CFM:
-		case SND_SOC_DAIFMT_CBM_CFS:
+		case SND_SOC_DAIFMT_BC_FC:
+		case SND_SOC_DAIFMT_BC_FP:
 			rcr |= DAVINCI_MCBSP_RCR_RFRLEN2(element_cnt - 1);
 			xcr |= DAVINCI_MCBSP_XCR_XFRLEN2(element_cnt - 1);
 			break;
@@ -492,13 +492,13 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
 	mcbsp_word_length = asp_word_length[fmt];
 
 	switch (master) {
-	case SND_SOC_DAIFMT_CBS_CFS:
-	case SND_SOC_DAIFMT_CBS_CFM:
+	case SND_SOC_DAIFMT_BP_FP:
+	case SND_SOC_DAIFMT_BP_FC:
 		rcr |= DAVINCI_MCBSP_RCR_RFRLEN1(0);
 		xcr |= DAVINCI_MCBSP_XCR_XFRLEN1(0);
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_BC_FC:
+	case SND_SOC_DAIFMT_BC_FP:
 		rcr |= DAVINCI_MCBSP_RCR_RFRLEN1(element_cnt - 1);
 		xcr |= DAVINCI_MCBSP_XCR_XFRLEN1(element_cnt - 1);
 		break;
@@ -606,7 +606,7 @@ static const struct snd_soc_dai_ops davinci_i2s_dai_ops = {
 	.prepare	= davinci_i2s_prepare,
 	.trigger	= davinci_i2s_trigger,
 	.hw_params	= davinci_i2s_hw_params,
-	.set_fmt	= davinci_i2s_set_dai_fmt,
+	.set_fmt_new	= davinci_i2s_set_dai_fmt,
 	.set_clkdiv	= davinci_i2s_dai_set_clkdiv,
 
 };
diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 377be2e2b6ee7..961bac6963652 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -492,8 +492,8 @@ static int davinci_mcasp_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 	mcasp_mod_bits(mcasp, DAVINCI_MCASP_RXFMT_REG, FSRDLY(data_delay),
 		       FSRDLY(3));
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BP_FP:
 		/* codec is clock and frame slave */
 		mcasp_set_bits(mcasp, DAVINCI_MCASP_ACLKXCTL_REG, ACLKXE);
 		mcasp_set_bits(mcasp, DAVINCI_MCASP_TXFMCTL_REG, AFSXE);
@@ -510,7 +510,7 @@ static int davinci_mcasp_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 
 		mcasp->bclk_master = 1;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFM:
+	case SND_SOC_DAIFMT_BP_FC:
 		/* codec is clock slave and frame master */
 		mcasp_set_bits(mcasp, DAVINCI_MCASP_ACLKXCTL_REG, ACLKXE);
 		mcasp_clr_bits(mcasp, DAVINCI_MCASP_TXFMCTL_REG, AFSXE);
@@ -527,7 +527,7 @@ static int davinci_mcasp_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 
 		mcasp->bclk_master = 1;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_BC_FP:
 		/* codec is clock master and frame slave */
 		mcasp_clr_bits(mcasp, DAVINCI_MCASP_ACLKXCTL_REG, ACLKXE);
 		mcasp_set_bits(mcasp, DAVINCI_MCASP_TXFMCTL_REG, AFSXE);
@@ -544,7 +544,7 @@ static int davinci_mcasp_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 
 		mcasp->bclk_master = 0;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_BC_FC:
 		/* codec is clock and frame master */
 		mcasp_clr_bits(mcasp, DAVINCI_MCASP_ACLKXCTL_REG, ACLKXE);
 		mcasp_clr_bits(mcasp, DAVINCI_MCASP_TXFMCTL_REG, AFSXE);
@@ -1620,7 +1620,7 @@ static const struct snd_soc_dai_ops davinci_mcasp_dai_ops = {
 	.trigger	= davinci_mcasp_trigger,
 	.delay		= davinci_mcasp_delay,
 	.hw_params	= davinci_mcasp_hw_params,
-	.set_fmt	= davinci_mcasp_set_dai_fmt,
+	.set_fmt_new	= davinci_mcasp_set_dai_fmt,
 	.set_clkdiv	= davinci_mcasp_set_clkdiv,
 	.set_sysclk	= davinci_mcasp_set_sysclk,
 	.set_tdm_slot	= davinci_mcasp_set_tdm_slot,
diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 4479d74f0a458..5bfb56d4ff844 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -1036,8 +1036,8 @@ static int omap_mcbsp_dai_hw_params(struct snd_pcm_substream *substream,
 
 	/* In McBSP master modes, FRAME (i.e. sample rate) is generated
 	 * by _counting_ BCLKs. Calculate frame size in BCLKs */
-	master = mcbsp->fmt & SND_SOC_DAIFMT_MASTER_MASK;
-	if (master ==	SND_SOC_DAIFMT_CBS_CFS) {
+	master = mcbsp->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
+	if (master == SND_SOC_DAIFMT_BP_FP) {
 		div = mcbsp->clk_div ? mcbsp->clk_div : 1;
 		framesize = (mcbsp->in_freq / div) / params_rate(params);
 
@@ -1136,20 +1136,20 @@ static int omap_mcbsp_dai_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 		return -EINVAL;
 	}
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BP_FP:
 		/* McBSP master. Set FS and bit clocks as outputs */
 		regs->pcr0	|= FSXM | FSRM |
 				   CLKXM | CLKRM;
 		/* Sample rate generator drives the FS */
 		regs->srgr2	|= FSGM;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_BC_FP:
 		/* McBSP slave. FS clock as output */
 		regs->srgr2	|= FSGM;
 		regs->pcr0	|= FSXM | FSRM;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_BC_FC:
 		/* McBSP slave */
 		break;
 	default:
@@ -1271,7 +1271,7 @@ static const struct snd_soc_dai_ops mcbsp_dai_ops = {
 	.trigger	= omap_mcbsp_dai_trigger,
 	.delay		= omap_mcbsp_dai_delay,
 	.hw_params	= omap_mcbsp_dai_hw_params,
-	.set_fmt	= omap_mcbsp_dai_set_dai_fmt,
+	.set_fmt_new	= omap_mcbsp_dai_set_dai_fmt,
 	.set_clkdiv	= omap_mcbsp_dai_set_clkdiv,
 	.set_sysclk	= omap_mcbsp_dai_set_dai_sysclk,
 };
-- 
2.30.2

