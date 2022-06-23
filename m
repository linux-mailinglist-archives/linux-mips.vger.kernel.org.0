Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B6B4557B0C
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jun 2022 14:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231919AbiFWMxx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jun 2022 08:53:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231915AbiFWMxr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Jun 2022 08:53:47 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7D164130E;
        Thu, 23 Jun 2022 05:53:46 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NBNlqg015665;
        Thu, 23 Jun 2022 07:53:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=NdWNqGk7KYNCnb6vF06SM0HZUNiwmzGy7/npWlCANTY=;
 b=pl9GZ0sm4izeOpQNlz1JULcTPTAF8z8IksyRkNGDBos6hUEv38UxIz3WaS2uwspoNo47
 ZfOxyKCYduHCyLqEYRfcWfOs6k/P7mOdn4vc/5P7Yaoc/R2vE0x7lV7Be/BIsdR9lrz9
 BX4eJOfc17ShLxE1DluYe4mSxomVwJgTJlaJZAzEPfAloyKWyMO/wk0+Mk1v111PzUIJ
 RyBhnCy3ndtaCR6TGiTO8FxBFW8r7H8/9Rm/cYdEKA+JU+60glrwZ+mb/AkJogZdMmoO
 voHl0eP1NeD5EBRSNjOMJkyHQDejWPxJ3QSicvN07rqRn4kP5BfV1m6uDdhRf6bWSS25 OQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41fa4j-13
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 23 Jun 2022 07:53:03 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:53 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 23 Jun 2022 13:52:53 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B8B4E11D3;
        Thu, 23 Jun 2022 12:52:53 +0000 (UTC)
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
        <linux-rpi-kernel@lists.infradead.org>,
        <frattaroli.nicolas@gmail.com>
Subject: [PATCH v2 33/96] ASoC: samsung: Migrate to new style legacy DAI naming flag
Date:   Thu, 23 Jun 2022 13:51:47 +0100
Message-ID: <20220623125250.2355471-34-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: v0oFCxrSCxmZrVeXEmSq3Ws8-owDeSPN
X-Proofpoint-ORIG-GUID: v0oFCxrSCxmZrVeXEmSq3Ws8-owDeSPN
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
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
 sound/soc/samsung/i2s.c         | 2 ++
 sound/soc/samsung/pcm.c         | 3 ++-
 sound/soc/samsung/s3c2412-i2s.c | 7 ++++---
 sound/soc/samsung/s3c24xx-i2s.c | 7 ++++---
 sound/soc/samsung/spdif.c       | 7 ++++---
 5 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index fdd9561c6a9f3..9505200f3d11b 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1143,6 +1143,8 @@ static const struct snd_soc_component_driver samsung_i2s_component = {
 
 	.suspend = i2s_suspend,
 	.resume = i2s_resume,
+
+	.legacy_dai_naming = 1,
 };
 
 #define SAMSUNG_I2S_FMTS (SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_S16_LE | \
diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index c2eb3534bfccb..e859252ae5e6e 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -480,7 +480,8 @@ static struct snd_soc_dai_driver s3c_pcm_dai[] = {
 };
 
 static const struct snd_soc_component_driver s3c_pcm_component = {
-	.name		= "s3c-pcm",
+	.name			= "s3c-pcm",
+	.legacy_dai_naming	= 1,
 };
 
 static int s3c_pcm_dev_probe(struct platform_device *pdev)
diff --git a/sound/soc/samsung/s3c2412-i2s.c b/sound/soc/samsung/s3c2412-i2s.c
index ec1c6f9d76ac7..0579a352961cc 100644
--- a/sound/soc/samsung/s3c2412-i2s.c
+++ b/sound/soc/samsung/s3c2412-i2s.c
@@ -192,9 +192,10 @@ static struct snd_soc_dai_driver s3c2412_i2s_dai = {
 };
 
 static const struct snd_soc_component_driver s3c2412_i2s_component = {
-	.name		= "s3c2412-i2s",
-	.suspend	= s3c2412_i2s_suspend,
-	.resume		= s3c2412_i2s_resume,
+	.name			= "s3c2412-i2s",
+	.suspend		= s3c2412_i2s_suspend,
+	.resume			= s3c2412_i2s_resume,
+	.legacy_dai_naming	= 1,
 };
 
 static int s3c2412_iis_dev_probe(struct platform_device *pdev)
diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index 4082ad7cbcc11..e760fc8b42636 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -415,9 +415,10 @@ static struct snd_soc_dai_driver s3c24xx_i2s_dai = {
 };
 
 static const struct snd_soc_component_driver s3c24xx_i2s_component = {
-	.name		= "s3c24xx-i2s",
-	.suspend	= s3c24xx_i2s_suspend,
-	.resume		= s3c24xx_i2s_resume,
+	.name			= "s3c24xx-i2s",
+	.suspend		= s3c24xx_i2s_suspend,
+	.resume			= s3c24xx_i2s_resume,
+	.legacy_dai_naming	= 1,
 };
 
 static int s3c24xx_iis_dev_probe(struct platform_device *pdev)
diff --git a/sound/soc/samsung/spdif.c b/sound/soc/samsung/spdif.c
index 47b6d19e43ffb..7d815e237e5c6 100644
--- a/sound/soc/samsung/spdif.c
+++ b/sound/soc/samsung/spdif.c
@@ -352,9 +352,10 @@ static struct snd_soc_dai_driver samsung_spdif_dai = {
 };
 
 static const struct snd_soc_component_driver samsung_spdif_component = {
-	.name		= "samsung-spdif",
-	.suspend	= spdif_suspend,
-	.resume		= spdif_resume,
+	.name			= "samsung-spdif",
+	.suspend		= spdif_suspend,
+	.resume			= spdif_resume,
+	.legacy_dai_naming	= 1,
 };
 
 static int spdif_probe(struct platform_device *pdev)
-- 
2.30.2

