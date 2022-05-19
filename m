Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C229652D8FA
	for <lists+linux-mips@lfdr.de>; Thu, 19 May 2022 17:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241622AbiESPs5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 May 2022 11:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241295AbiESPsk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 May 2022 11:48:40 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EEC3F1378;
        Thu, 19 May 2022 08:44:48 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k11x002261;
        Thu, 19 May 2022 10:43:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=z+713LcgVSa89NuxEpCav+AZkbDKOY5pz+s0AhMHqec=;
 b=b0ehiL6vR1LrW/ejMV3eLOcCAxjAXTr8a7RwOTx60zFqILUIV2y2Iy6foPbxn05q3zxW
 VNdlQgEa0coUjZBpb6H5VVo7emmDVSXRlWasr+Cm61YrRHDsiwjm2o2ZuqTn2D3TFu/u
 ShnJPksQWFfr0q76F5paDGE6JJLd2E2nu3hkenZekXTrnkOYIOCLccs+K19NQcxqBaNE
 3A9gyvCuld4v5sAwfsJ0nL3Er/MH7ydPeSNyuHld8icS51tDZ6n1wiEeA4mkpyx2Mkvv
 oDw94Z0NzBoGjab1kYABvf4+Pqni1nhU4OFep7UuOEezmuylOLZ7ujMaUQXbezGEkf2x BA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcg-7
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 19 May 2022 10:43:36 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Thu, 19 May 2022 16:43:21 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 237F111D1;
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
Subject: [PATCH 38/56] ASoC: Intel: Rename set_fmt_new back to set_fmt
Date:   Thu, 19 May 2022 16:43:00 +0100
Message-ID: <20220519154318.2153729-39-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: qq8Z3MgLOnXKYhENBujYim2aeDSyiQci
X-Proofpoint-ORIG-GUID: qq8Z3MgLOnXKYhENBujYim2aeDSyiQci
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
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 2 +-
 sound/soc/intel/keembay/kmb_platform.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index 339d9440c1501..a56dd48c045f3 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -473,7 +473,7 @@ static const struct snd_soc_dai_ops sst_compr_dai_ops = {
 static const struct snd_soc_dai_ops sst_be_dai_ops = {
 	.startup = sst_enable_ssp,
 	.hw_params = sst_be_hw_params,
-	.set_fmt_new = sst_set_format,
+	.set_fmt = sst_set_format,
 	.set_tdm_slot = sst_platform_set_ssp_slot,
 	.shutdown = sst_disable_ssp,
 };
diff --git a/sound/soc/intel/keembay/kmb_platform.c b/sound/soc/intel/keembay/kmb_platform.c
index a65f03884d9a5..d10881fedc8bb 100644
--- a/sound/soc/intel/keembay/kmb_platform.c
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -736,7 +736,7 @@ static const struct snd_soc_dai_ops kmb_dai_ops = {
 	.hw_params	= kmb_dai_hw_params,
 	.hw_free	= kmb_dai_hw_free,
 	.prepare	= kmb_dai_prepare,
-	.set_fmt_new	= kmb_set_dai_fmt,
+	.set_fmt	= kmb_set_dai_fmt,
 };
 
 static struct snd_soc_dai_driver intel_kmb_hdmi_dai[] = {
-- 
2.30.2

