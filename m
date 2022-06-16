Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B4D954E491
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jun 2022 16:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377934AbiFPOgU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jun 2022 10:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377739AbiFPOfu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Jun 2022 10:35:50 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 911C52019A;
        Thu, 16 Jun 2022 07:35:49 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GBnCaH029573;
        Thu, 16 Jun 2022 09:34:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=AuKuyKNZw717+uoDrwMCyNmlv5xTJLfHOsVukkcHHpE=;
 b=hy/RJmchhYf2McZR9VDMpFtZU2+aDxfiSpKlaNsCC9Z51j2YSCcH3OxxTWffCR/T5yEW
 ncMr97kW7/CaxIKuiRbX9dg30sYriPFwTlSRDWpOIBdqVwUW/seUro+kA+xb8lpzvIF9
 34ITMaAyG6G4AnlHnz+Hsx16O0QgNDyWM51BfbQaCHgga5DthktVBRJ+1bPWQnsAyXm2
 8CMGUyo35UmKG6W59zyXRBYt1/J2xF7t0Hcbjotfbg0w/FOySETaHqbwtYuNbILIHUQ8
 sud1Q2MLV9jP9Cnz3qIAP2+bXYygdiguPQVi/UztQEhRqETntT7ZRmWHz4P63thlHvQr 0w== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq5w3m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 16 Jun 2022 09:34:39 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:31 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 16 Jun 2022 15:34:31 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6438211DA;
        Thu, 16 Jun 2022 14:34:31 +0000 (UTC)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <broonie@kernel.org>
CC:     <lgirdwood@gmail.com>, <kuninori.morimoto.gx@renesas.com>,
        <mripard@kernel.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
        <vkoul@kernel.org>, <nicolas.ferre@microchip.com>,
        <nsaenz@kernel.org>, <shawnguo@kernel.org>, <linux-imx@nxp.com>,
        <cezary.rojewski@intel.com>,
        <pierre-louis.bossart@linux.intel.com>,
        <linux-mips@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
        <daniel@zonque.org>, <srinivas.kandagatla@linaro.org>,
        <linux-rockchip@lists.infradead.org>, <krzk@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-sunxi@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-xtensa@linux-xtensa.org>,
        <peter.ujfalusi@gmail.com>, <jarkko.nikula@bitmer.com>,
        <heiko@sntech.de>, <jbrunet@baylibre.com>, <kernel@pengutronix.de>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <dri-devel@lists.freedesktop.org>,
        <linux-rpi-kernel@lists.infradead.org>
Subject: [PATCH 19/96] ASoC: atmel: Migrate to new style legacy DAI naming flag
Date:   Thu, 16 Jun 2022 15:33:12 +0100
Message-ID: <20220616143429.1324494-20-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: XK1mXDM8VK7gqhnn2rZ5vFGAYw1H0flu
X-Proofpoint-GUID: XK1mXDM8VK7gqhnn2rZ5vFGAYw1H0flu
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Change the legacy DAI naming flag from opting in to the new scheme
(non_legacy_dai_naming), to opting out of it (legacy_dai_naming).
These drivers appear to be on the CPU side of the DAI link and
currently uses the legacy naming, so add the new flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/atmel/atmel-classd.c  | 1 +
 sound/soc/atmel/atmel-i2s.c     | 3 ++-
 sound/soc/atmel/atmel-pdmic.c   | 1 +
 sound/soc/atmel/atmel_ssc_dai.c | 7 ++++---
 sound/soc/atmel/mchp-i2s-mcc.c  | 3 ++-
 sound/soc/atmel/mchp-pdmc.c     | 1 +
 sound/soc/atmel/mchp-spdifrx.c  | 3 ++-
 sound/soc/atmel/mchp-spdiftx.c  | 3 ++-
 8 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
index 74b7b2611aa70..87d6d6ed026b3 100644
--- a/sound/soc/atmel/atmel-classd.c
+++ b/sound/soc/atmel/atmel-classd.c
@@ -458,6 +458,7 @@ static const struct snd_soc_component_driver atmel_classd_cpu_dai_component = {
 	.num_controls		= ARRAY_SIZE(atmel_classd_snd_controls),
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
+	.legacy_dai_naming	= 1,
 };
 
 /* ASoC sound card */
diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index ba56d6ac7e571..425d66edbf867 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -564,7 +564,8 @@ static struct snd_soc_dai_driver atmel_i2s_dai = {
 };
 
 static const struct snd_soc_component_driver atmel_i2s_component = {
-	.name	= "atmel-i2s",
+	.name			= "atmel-i2s",
+	.legacy_dai_naming	= 1,
 };
 
 static int atmel_i2s_sama5d2_mck_init(struct atmel_i2s_dev *dev,
diff --git a/sound/soc/atmel/atmel-pdmic.c b/sound/soc/atmel/atmel-pdmic.c
index ea34efac2fff5..77ff12baead5b 100644
--- a/sound/soc/atmel/atmel-pdmic.c
+++ b/sound/soc/atmel/atmel-pdmic.c
@@ -481,6 +481,7 @@ static const struct snd_soc_component_driver atmel_pdmic_cpu_dai_component = {
 	.num_controls		= ARRAY_SIZE(atmel_pdmic_snd_controls),
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
+	.legacy_dai_naming	= 1,
 };
 
 /* ASoC sound card */
diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
index c92905e343e7e..8aae0beadcfe4 100644
--- a/sound/soc/atmel/atmel_ssc_dai.c
+++ b/sound/soc/atmel/atmel_ssc_dai.c
@@ -858,9 +858,10 @@ static struct snd_soc_dai_driver atmel_ssc_dai = {
 };
 
 static const struct snd_soc_component_driver atmel_ssc_component = {
-	.name		= "atmel-ssc",
-	.suspend	= atmel_ssc_suspend,
-	.resume		= atmel_ssc_resume,
+	.name			= "atmel-ssc",
+	.suspend		= atmel_ssc_suspend,
+	.resume			= atmel_ssc_resume,
+	.legacy_dai_naming	= 1,
 };
 
 static int asoc_ssc_init(struct device *dev)
diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index 269eab56b6dd9..6dfb96c576ff3 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -928,7 +928,8 @@ static struct snd_soc_dai_driver mchp_i2s_mcc_dai = {
 };
 
 static const struct snd_soc_component_driver mchp_i2s_mcc_component = {
-	.name	= "mchp-i2s-mcc",
+	.name			= "mchp-i2s-mcc",
+	.legacy_dai_naming	= 1,
 };
 
 #ifdef CONFIG_OF
diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index b9f6370594482..aba7c5cde62c6 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -423,6 +423,7 @@ static const struct snd_soc_component_driver mchp_pdmc_dai_component = {
 	.num_controls = ARRAY_SIZE(mchp_pdmc_snd_controls),
 	.open = &mchp_pdmc_open,
 	.close = &mchp_pdmc_close,
+	.legacy_dai_naming = 1,
 };
 
 static const unsigned int mchp_pdmc_1mic[] = {1};
diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 5fc968483f2c8..0d37b78b94a09 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -846,7 +846,8 @@ static struct snd_soc_dai_driver mchp_spdifrx_dai = {
 };
 
 static const struct snd_soc_component_driver mchp_spdifrx_component = {
-	.name		= "mchp-spdifrx",
+	.name			= "mchp-spdifrx",
+	.legacy_dai_naming	= 1,
 };
 
 static const struct of_device_id mchp_spdifrx_dt_ids[] = {
diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index d243800464352..78d5bcf0819a3 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -753,7 +753,8 @@ static struct snd_soc_dai_driver mchp_spdiftx_dai = {
 };
 
 static const struct snd_soc_component_driver mchp_spdiftx_component = {
-	.name		= "mchp-spdiftx",
+	.name			= "mchp-spdiftx",
+	.legacy_dai_naming	= 1,
 };
 
 static const struct of_device_id mchp_spdiftx_dt_ids[] = {
-- 
2.30.2

