Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A593552D953
	for <lists+linux-mips@lfdr.de>; Thu, 19 May 2022 17:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238049AbiESPvs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 May 2022 11:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241294AbiESPsl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 May 2022 11:48:41 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F4101F688C;
        Thu, 19 May 2022 08:44:48 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k125002261;
        Thu, 19 May 2022 10:43:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=/Vh2SSKq+ZiPwDHO9oXSfym8TofsOkknVTrQqYugMjQ=;
 b=QHcKzU05AkZsvP6zzEZRGcPdecHY2a0AE3Q8zoMtgQS4CyN1oxFZitXe7gkJrsagLPzW
 bm5WnDCFM2KOGvrzERJ8gFZF3fUFMJ/6huMjTizEI/ZZXr6/rH8cBMBLiGPxUQTLTaHp
 kJM566Lk4ndnleP7fSf/sSCWThtZ8NUc679otuZ6YUorjuDrdfRR2AT6qJxPfZjBq8/E
 pFuGvHkohAfq8xYehZsNJPxIqxUke1fO/At/DKI7gX5oveoW5iZQGpgmnIkuIwLWOhKe
 GTV5S9lofiNMNkWp8w1RKa6O9Ui7g+J+Ya3GfBvl5WGNRhQkCwQfquqaCvjn4jfEE8vn iw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcg-10
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 19 May 2022 10:43:38 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Thu, 19 May 2022 16:43:21 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C6D3911D1;
        Thu, 19 May 2022 15:43:21 +0000 (UTC)
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
Subject: [PATCH 48/56] ASoC: stm: Rename set_fmt_new back to set_fmt
Date:   Thu, 19 May 2022 16:43:10 +0100
Message-ID: <20220519154318.2153729-49-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: uX5BcH2_PS0VOR5b6FUXvepUeguu_WOq
X-Proofpoint-ORIG-GUID: uX5BcH2_PS0VOR5b6FUXvepUeguu_WOq
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Now the core has been migrated across to the new direct clock
specification we can move the drivers back to the normal set_fmt
callback.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/stm/stm32_i2s.c     | 2 +-
 sound/soc/stm/stm32_sai_sub.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 30c04f96ef1d6..32d885f84a922 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -954,7 +954,7 @@ static const struct regmap_config stm32_h7_i2s_regmap_conf = {
 
 static const struct snd_soc_dai_ops stm32_i2s_pcm_dai_ops = {
 	.set_sysclk	= stm32_i2s_set_sysclk,
-	.set_fmt_new	= stm32_i2s_set_dai_fmt,
+	.set_fmt	= stm32_i2s_set_dai_fmt,
 	.startup	= stm32_i2s_startup,
 	.hw_params	= stm32_i2s_hw_params,
 	.trigger	= stm32_i2s_trigger,
diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 9f169b93fa740..e09221b5f1f3a 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1225,7 +1225,7 @@ static int stm32_sai_dai_probe(struct snd_soc_dai *cpu_dai)
 
 static const struct snd_soc_dai_ops stm32_sai_pcm_dai_ops = {
 	.set_sysclk	= stm32_sai_set_sysclk,
-	.set_fmt_new	= stm32_sai_set_dai_fmt,
+	.set_fmt	= stm32_sai_set_dai_fmt,
 	.set_tdm_slot	= stm32_sai_set_dai_tdm_slot,
 	.startup	= stm32_sai_startup,
 	.hw_params	= stm32_sai_hw_params,
-- 
2.30.2

