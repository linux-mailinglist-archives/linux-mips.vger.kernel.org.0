Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 815A552D88B
	for <lists+linux-mips@lfdr.de>; Thu, 19 May 2022 17:46:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233045AbiESPqo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 May 2022 11:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238238AbiESPp7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 May 2022 11:45:59 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D99CD7A443;
        Thu, 19 May 2022 08:44:16 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JBHtaZ024228;
        Thu, 19 May 2022 10:43:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=9hTCMyfEH93APH26QOcIiezb1QO1saOb5PENw49CR74=;
 b=IVAUWGpXnToI2Qlse/ywXO4ytzB0dHKmVz9XzjkPYqoulPBXo2+fOaQueAcpIvqc88AE
 kCARWlA4yQHXD7mIIEz+VWk8UtKX84BadtX82YCajvrxmG+YeCWvDVklauFb+/0wzsWF
 SvGLHJ1SbThZuICa10jHu1OKm/tERlSi3lDDW2rm2Fn52IsaHdLoYwg8PCfIJ3cvrMzp
 MFFewo2rGYJ38Y1OpGu1d+aXWxp2COohvS9xRHaAGbxVFd4NEHg9Li0vYOLOeoJ3s8KP
 Z2bFtgH7wnqf77sqqND0UfofhYWGFGN2xkP2/aNB+rq3KpHqazFykb4dMtmW2E1VQYgn pw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 19 May 2022 10:43:23 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:18 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Thu, 19 May 2022 16:43:18 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5D89D11D1;
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
Subject: [PATCH 01/56] ASoC: core: Add set_fmt_new callback that directly specifies provider
Date:   Thu, 19 May 2022 16:42:23 +0100
Message-ID: <20220519154318.2153729-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: b5isdzNm3eaa-uDVVX3v3im0W1VfdPaS
X-Proofpoint-ORIG-GUID: b5isdzNm3eaa-uDVVX3v3im0W1VfdPaS
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The original set_fmt callback always passes clock provider/consumer
with respect to the CODEC. This made sense when the framework was
directly broken down into platforms and CODECs. Now everything is
componentised it simplifies things if each side of the link is
just told if it is provider or consumer of the clocks. To start
this migration add a new callback that can be used to receive a
direct specification of clocking. As there are more CODEC drivers
than platform drivers, we make the new flags identical to the old
CODEC flags meaning CODEC drivers will not require an update.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc-dai.h | 7 +++++++
 sound/soc/soc-core.c    | 3 ++-
 sound/soc/soc-dai.c     | 5 ++++-
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index bbd821d2df9ca..9c1d92d5a3738 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -124,6 +124,12 @@ struct snd_compr_stream;
 #define SND_SOC_DAIFMT_CBM_CFS		SND_SOC_DAIFMT_CBP_CFC
 #define SND_SOC_DAIFMT_CBS_CFS		SND_SOC_DAIFMT_CBC_CFC
 
+/* when passed to set_fmt directly indicate if the device is provider or consumer */
+#define SND_SOC_DAIFMT_BP_FP		SND_SOC_DAIFMT_CBP_CFP
+#define SND_SOC_DAIFMT_BC_FP		SND_SOC_DAIFMT_CBC_CFP
+#define SND_SOC_DAIFMT_BP_FC		SND_SOC_DAIFMT_CBP_CFC
+#define SND_SOC_DAIFMT_BC_FC		SND_SOC_DAIFMT_CBC_CFC
+
 /* Describes the possible PCM format */
 #define SND_SOC_POSSIBLE_DAIFMT_CLOCK_PROVIDER_SHIFT	48
 #define SND_SOC_POSSIBLE_DAIFMT_CLOCK_PROVIDER_MASK	(0xFFFFULL << SND_SOC_POSSIBLE_DAIFMT_CLOCK_PROVIDER_SHIFT)
@@ -282,6 +288,7 @@ struct snd_soc_dai_ops {
 	 * Called by soc_card drivers, normally in their hw_params.
 	 */
 	int (*set_fmt)(struct snd_soc_dai *dai, unsigned int fmt);
+	int (*set_fmt_new)(struct snd_soc_dai *dai, unsigned int fmt);
 	int (*xlate_tdm_slot_mask)(unsigned int slots,
 		unsigned int *tx_mask, unsigned int *rx_mask);
 	int (*set_tdm_slot)(struct snd_soc_dai *dai,
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 9574f86dd4de2..90f4265bea501 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1235,7 +1235,8 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		unsigned int fmt = dai_fmt;
 
-		if (snd_soc_component_is_codec(cpu_dai->component))
+		if (cpu_dai->driver->ops->set_fmt_new ||
+		    snd_soc_component_is_codec(cpu_dai->component))
 			fmt = inv_dai_fmt;
 
 		ret = snd_soc_dai_set_fmt(cpu_dai, fmt);
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 6078afe335f88..996712f4d9bfd 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -209,7 +209,10 @@ int snd_soc_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	int ret = -ENOTSUPP;
 
 	if (dai->driver->ops &&
-	    dai->driver->ops->set_fmt)
+	    dai->driver->ops->set_fmt_new)
+		ret = dai->driver->ops->set_fmt_new(dai, fmt);
+	else if (dai->driver->ops &&
+		 dai->driver->ops->set_fmt)
 		ret = dai->driver->ops->set_fmt(dai, fmt);
 
 	return soc_dai_ret(dai, ret);
-- 
2.30.2

