Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F31EE52D8BC
	for <lists+linux-mips@lfdr.de>; Thu, 19 May 2022 17:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241246AbiESPrX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 May 2022 11:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241340AbiESPqQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 May 2022 11:46:16 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 373277CDE2;
        Thu, 19 May 2022 08:44:23 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k11n002261;
        Thu, 19 May 2022 10:43:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=EFnNgt7/7giPP2jV0IxJGdO+cwpC/UCvGH22Ixq6LJ0=;
 b=SIDAM7mSdTYMR3Lv9VJnIH0BPG7nxSAI7XG4kOMNORk1ADlDk/QUr7tTYHADTrnh0V0n
 u+zsbt+fA3KpuReMIIwibdPDwWzciuFqbVt1CnqMDjLLHtBHHtGlYfCeVQxK0pQRgnll
 GtbMRIv0GdoN/dQsYypkYhz/uO8mxdz9RuF+WPuDbcks9GOYuDCmL4f3R6D2Uy++zZbW
 31WJQGLqA4L2X4ObdL5+Nhe0YqUPPOWOIUNGGyEsAMhyVTdGM4XaY3wpBuD2zHhAxkDs
 /qTz8SHZs2V8MWBmBbYVzzWC4RI0OZyYRxWODUFEZaTX4CTsIUt4ATBCWiMKZnOWSPBg NQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 19 May 2022 10:43:31 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:18 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Thu, 19 May 2022 16:43:18 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 77174475;
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
Subject: [PATCH 02/56] ASoC: amd: vangogh: Update to use set_fmt_new callback
Date:   Thu, 19 May 2022 16:42:24 +0100
Message-ID: <20220519154318.2153729-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: hCl7MaxdtCsNpycjzTZUKonUahffHwoq
X-Proofpoint-ORIG-GUID: hCl7MaxdtCsNpycjzTZUKonUahffHwoq
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
 sound/soc/amd/vangogh/acp5x-i2s.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x-i2s.c b/sound/soc/amd/vangogh/acp5x-i2s.c
index 59a98f89a669a..40fbd0bc77fde 100644
--- a/sound/soc/amd/vangogh/acp5x-i2s.c
+++ b/sound/soc/amd/vangogh/acp5x-i2s.c
@@ -37,10 +37,10 @@ static int acp5x_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 	}
 	mode = fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
 	switch (mode) {
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BP_FP:
 		adata->master_mode = I2S_MASTER_MODE_ENABLE;
 		break;
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BC_FC:
 		adata->master_mode = I2S_MASTER_MODE_DISABLE;
 		break;
 	}
@@ -339,7 +339,7 @@ static int acp5x_i2s_trigger(struct snd_pcm_substream *substream,
 static const struct snd_soc_dai_ops acp5x_i2s_dai_ops = {
 	.hw_params = acp5x_i2s_hwparams,
 	.trigger = acp5x_i2s_trigger,
-	.set_fmt = acp5x_i2s_set_fmt,
+	.set_fmt_new = acp5x_i2s_set_fmt,
 	.set_tdm_slot = acp5x_i2s_set_tdm_slot,
 };
 
-- 
2.30.2

