Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A70952D8EF
	for <lists+linux-mips@lfdr.de>; Thu, 19 May 2022 17:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241444AbiESPsg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 May 2022 11:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241557AbiESPqT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 May 2022 11:46:19 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E35C4AFB1B;
        Thu, 19 May 2022 08:44:27 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k12F002261;
        Thu, 19 May 2022 10:43:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=rAmdzdVBPsEtNYul1g2dUSOHayNdAUAKJpBqG3aOzJY=;
 b=ie5ibsCRNwZZmuJ7F4ifhgUDhbNFdVJXurj2KqdorbsRNTljtVbeF65ukdcB6nMZxS1g
 d/+JCVd0dfnhu8SFO5FcqFh03IdcFk6O3lsqMmEw1lESZSVQHVZ768Y11iK86gX5wded
 HncPrtvS2Pl8abpQqBrsNWAkSKm2te7Ec6s073jO0yUjL3doZ1eCxMJMUFeuIRv573M7
 cF+XfwzCbtl4LQmuL75idWHAKV+YfIjGUNGlufoB7XcZz6PoZ0EJmFPIM6OMvgi5aiwF
 GPkauF4RCdfiZLjEaeIYEGePTVTkMuTQ+kstkKdPr8UnRxIFlDMj6R/YD9CBCRFNzP3q 3w== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-15
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 19 May 2022 10:43:43 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Thu, 19 May 2022 16:43:22 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4CA0D11D3;
        Thu, 19 May 2022 15:43:22 +0000 (UTC)
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
Subject: [PATCH 55/56] ASoC: soc-dai: Remove set_fmt_new callback
Date:   Thu, 19 May 2022 16:43:17 +0100
Message-ID: <20220519154318.2153729-56-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: kWHk-gfbxXTo-HjPUeZ0SF66_rmIJn2u
X-Proofpoint-ORIG-GUID: kWHk-gfbxXTo-HjPUeZ0SF66_rmIJn2u
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Now the behaviour of the core and all drivers is updated to the new
direct clock specification the temporary set_fmt_new callback can be
completely removed.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc-dai.h | 1 -
 sound/soc/soc-dai.c     | 6 +-----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 9c1d92d5a3738..ea75096720864 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -288,7 +288,6 @@ struct snd_soc_dai_ops {
 	 * Called by soc_card drivers, normally in their hw_params.
 	 */
 	int (*set_fmt)(struct snd_soc_dai *dai, unsigned int fmt);
-	int (*set_fmt_new)(struct snd_soc_dai *dai, unsigned int fmt);
 	int (*xlate_tdm_slot_mask)(unsigned int slots,
 		unsigned int *tx_mask, unsigned int *rx_mask);
 	int (*set_tdm_slot)(struct snd_soc_dai *dai,
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 996712f4d9bfd..d530e8c2b77b1 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -208,11 +208,7 @@ int snd_soc_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	int ret = -ENOTSUPP;
 
-	if (dai->driver->ops &&
-	    dai->driver->ops->set_fmt_new)
-		ret = dai->driver->ops->set_fmt_new(dai, fmt);
-	else if (dai->driver->ops &&
-		 dai->driver->ops->set_fmt)
+	if (dai->driver->ops && dai->driver->ops->set_fmt)
 		ret = dai->driver->ops->set_fmt(dai, fmt);
 
 	return soc_dai_ret(dai, ret);
-- 
2.30.2

