Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA3C52D94F
	for <lists+linux-mips@lfdr.de>; Thu, 19 May 2022 17:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233730AbiESPvs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 May 2022 11:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240308AbiESPqp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 May 2022 11:46:45 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F58DC9EF9;
        Thu, 19 May 2022 08:44:30 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J66mW4012194;
        Thu, 19 May 2022 10:43:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=ZaKUpotIvoQjdFwP7QMhM/HkrShRS0CkfsVa54u1syg=;
 b=YN6ej9i/DaUwKi4WVG4klAJ0DdYoE0b40D8lRgZJMZc2zTEq2FwNM0+SSGGSeY78MXrs
 xZYuob90IvQK5lULl8v8UGVckZ7Wbqw0h/+8XoTFp5Nw2LMZ6orPZXXDMovQvzU0qeVQ
 EPOaxx/Os2qccEm1P/DFcRrQpWQTI7mVIjOR5/hrFSXQFhbFwHjv3JGf4gelj5QMkDC6
 6jFze3jVZv4dalMqOsyYTg7D1tlE5N84WGkPCXftFgdArtLslD6hJYckZdcOsz9e6nx4
 Z5uIXpLgZj7w4haQRz3pJxb+gZ7m7ekVdW8LArtMcau4vowehKMH1Z3xBgyLq/aXxcsJ /w== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dn-7
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 19 May 2022 10:43:31 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Thu, 19 May 2022 16:43:20 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1636F11D1;
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
Subject: [PATCH 24/56] ASoC: test-component: Update to use set_fmt_new callback
Date:   Thu, 19 May 2022 16:42:46 +0100
Message-ID: <20220519154318.2153729-25-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: q0UNWcUb84d3WFxs6NgPjsPFwNx8_Vjq
X-Proofpoint-ORIG-GUID: q0UNWcUb84d3WFxs6NgPjsPFwNx8_Vjq
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
 sound/soc/generic/test-component.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index 5da4725d9e16c..3a992a6eba9bb 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -66,7 +66,7 @@ static int test_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned int format = fmt & SND_SOC_DAIFMT_FORMAT_MASK;
 	unsigned int clock  = fmt & SND_SOC_DAIFMT_CLOCK_MASK;
 	unsigned int inv    = fmt & SND_SOC_DAIFMT_INV_MASK;
-	unsigned int master = fmt & SND_SOC_DAIFMT_MASTER_MASK;
+	unsigned int master = fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
 	char *str;
 
 	dev_info(dai->dev, "name   : %s", dai->name);
@@ -105,16 +105,16 @@ static int test_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 	str = "unknown";
 	switch (master) {
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BP_FP:
 		str = "clk provider, frame provider";
 		break;
-	case SND_SOC_DAIFMT_CBC_CFP:
+	case SND_SOC_DAIFMT_BC_FP:
 		str = "clk consumer, frame provider";
 		break;
-	case SND_SOC_DAIFMT_CBP_CFC:
+	case SND_SOC_DAIFMT_BP_FC:
 		str = "clk provider, frame consumer";
 		break;
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BC_FC:
 		str = "clk consumer, frame consumer";
 		break;
 	}
@@ -192,10 +192,10 @@ static int test_dai_bespoke_trigger(struct snd_pcm_substream *substream,
 static u64 test_dai_formats =
 	/*
 	 * Select below from Sound Card, not auto
-	 *	SND_SOC_POSSIBLE_DAIFMT_CBP_CFP
-	 *	SND_SOC_POSSIBLE_DAIFMT_CBC_CFP
-	 *	SND_SOC_POSSIBLE_DAIFMT_CBP_CFC
-	 *	SND_SOC_POSSIBLE_DAIFMT_CBC_CFC
+	 *	SND_SOC_POSSIBLE_DAIFMT_BP_FP
+	 *	SND_SOC_POSSIBLE_DAIFMT_BC_FP
+	 *	SND_SOC_POSSIBLE_DAIFMT_BP_FC
+	 *	SND_SOC_POSSIBLE_DAIFMT_BC_FC
 	 */
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
@@ -210,7 +210,7 @@ static u64 test_dai_formats =
 	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
 
 static const struct snd_soc_dai_ops test_ops = {
-	.set_fmt		= test_dai_set_fmt,
+	.set_fmt_new		= test_dai_set_fmt,
 	.startup		= test_dai_startup,
 	.shutdown		= test_dai_shutdown,
 	.auto_selectable_formats	= &test_dai_formats,
@@ -221,7 +221,7 @@ static const struct snd_soc_dai_ops test_verbose_ops = {
 	.set_sysclk		= test_dai_set_sysclk,
 	.set_pll		= test_dai_set_pll,
 	.set_clkdiv		= test_dai_set_clkdiv,
-	.set_fmt		= test_dai_set_fmt,
+	.set_fmt_new		= test_dai_set_fmt,
 	.mute_stream		= test_dai_mute_stream,
 	.startup		= test_dai_startup,
 	.shutdown		= test_dai_shutdown,
-- 
2.30.2

