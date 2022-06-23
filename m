Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9512557B28
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jun 2022 14:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbiFWMxs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jun 2022 08:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231905AbiFWMxp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Jun 2022 08:53:45 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5066F3F8AB;
        Thu, 23 Jun 2022 05:53:44 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NBvlrN011978;
        Thu, 23 Jun 2022 07:53:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=FjIUzY5vic3Zh5VYRT9K5OX6UftqESCVghQUpCGyoBo=;
 b=WyI5nr6xSSeofdxiGk3wRbIdpIS2hxail+wcQH3sS9T0QPhU6dKBbAvNEVgt0/UbnyTF
 6ak6ljinjoSoh45ENaEzboWkfUg9/CD9cZScIgOqCwDTY8kpRLK8VZgwBJjPjDoiwagZ
 C0cZmPxxW8elZNBEICEsGLTIml7MdCJNFk+TAClBAOohnAydvbGMl1Zedz1ghMrwOzD0
 cahnjauD6cjN8LFU+cNHkVYSuzLW1PPkHBlluEvI6Jdk91mt4hwDcChXb4cG7tt9Ob6O
 ieDaWcIPV0pIuicZ0kp6lpYpOVmPAGcH+CcC/4NyfH6eMPThyFM6urVOjfbNOeetBB31 Sw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gsb4p6wvp-18
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 23 Jun 2022 07:53:06 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:56 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 23 Jun 2022 13:52:56 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 19CCB11D1;
        Thu, 23 Jun 2022 12:52:56 +0000 (UTC)
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
Subject: [PATCH v2 60/96] ASoC: tas*: Remove now redundant non_legacy_dai_naming flag
Date:   Thu, 23 Jun 2022 13:52:14 +0100
Message-ID: <20220623125250.2355471-61-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: zDL9oxU2f8ix7p0zPKhTNfS1hb2cZL6F
X-Proofpoint-ORIG-GUID: zDL9oxU2f8ix7p0zPKhTNfS1hb2cZL6F
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The ASoC core has now been changed to default to the non-legacy DAI
naming, as such drivers using the new scheme no longer need to specify
the non_legacy_dai_naming flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/tas2552.c  | 1 -
 sound/soc/codecs/tas2562.c  | 2 --
 sound/soc/codecs/tas2764.c  | 1 -
 sound/soc/codecs/tas2770.c  | 1 -
 sound/soc/codecs/tas5086.c  | 1 -
 sound/soc/codecs/tas571x.c  | 1 -
 sound/soc/codecs/tas5720.c  | 2 --
 sound/soc/codecs/tas5805m.c | 1 -
 sound/soc/codecs/tas6424.c  | 1 -
 9 files changed, 11 deletions(-)

diff --git a/sound/soc/codecs/tas2552.c b/sound/soc/codecs/tas2552.c
index c98a9332dcc0e..bf3d8539a2688 100644
--- a/sound/soc/codecs/tas2552.c
+++ b/sound/soc/codecs/tas2552.c
@@ -668,7 +668,6 @@ static const struct snd_soc_component_driver soc_component_dev_tas2552 = {
 	.num_dapm_routes	= ARRAY_SIZE(tas2552_audio_map),
 	.idle_bias_on		= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config tas2552_regmap_config = {
diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index e62a3da16aed3..dc088a1c67213 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -589,7 +589,6 @@ static const struct snd_soc_component_driver soc_component_dev_tas2110 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct snd_soc_dapm_widget tas2562_dapm_widgets[] = {
@@ -629,7 +628,6 @@ static const struct snd_soc_component_driver soc_component_dev_tas2562 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct snd_soc_dai_ops tas2562_speaker_dai_ops = {
diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index d395feffb30b5..42f0c1e449ba4 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -548,7 +548,6 @@ static const struct snd_soc_component_driver soc_component_driver_tas2764 = {
 	.num_dapm_routes	= ARRAY_SIZE(tas2764_audio_map),
 	.idle_bias_on		= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct reg_default tas2764_reg_defaults[] = {
diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index f6037a148cb60..3cb634c282610 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -546,7 +546,6 @@ static const struct snd_soc_component_driver soc_component_driver_tas2770 = {
 	.num_dapm_routes	= ARRAY_SIZE(tas2770_audio_map),
 	.idle_bias_on		= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int tas2770_register_codec(struct tas2770_priv *tas2770)
diff --git a/sound/soc/codecs/tas5086.c b/sound/soc/codecs/tas5086.c
index 05b57bb1aea04..a864984225bc4 100644
--- a/sound/soc/codecs/tas5086.c
+++ b/sound/soc/codecs/tas5086.c
@@ -888,7 +888,6 @@ static const struct snd_soc_component_driver soc_component_dev_tas5086 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct i2c_device_id tas5086_i2c_id[] = {
diff --git a/sound/soc/codecs/tas571x.c b/sound/soc/codecs/tas571x.c
index 7b599664db205..4e7f20db57c4d 100644
--- a/sound/soc/codecs/tas571x.c
+++ b/sound/soc/codecs/tas571x.c
@@ -756,7 +756,6 @@ static const struct snd_soc_component_driver tas571x_component = {
 	.num_dapm_routes	= ARRAY_SIZE(tas571x_dapm_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static struct snd_soc_dai_driver tas571x_dai = {
diff --git a/sound/soc/codecs/tas5720.c b/sound/soc/codecs/tas5720.c
index 2ee06a95f3e4f..3885c0bf0b01c 100644
--- a/sound/soc/codecs/tas5720.c
+++ b/sound/soc/codecs/tas5720.c
@@ -572,7 +572,6 @@ static const struct snd_soc_component_driver soc_component_dev_tas5720 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct snd_soc_component_driver soc_component_dev_tas5722 = {
@@ -589,7 +588,6 @@ static const struct snd_soc_component_driver soc_component_dev_tas5722 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 /* PCM rates supported by the TAS5720 driver */
diff --git a/sound/soc/codecs/tas5805m.c b/sound/soc/codecs/tas5805m.c
index fa0e81ec875ad..b1bb614534f74 100644
--- a/sound/soc/codecs/tas5805m.c
+++ b/sound/soc/codecs/tas5805m.c
@@ -367,7 +367,6 @@ static const struct snd_soc_component_driver soc_codec_dev_tas5805m = {
 	.num_dapm_routes	= ARRAY_SIZE(tas5805m_audio_map),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int tas5805m_mute(struct snd_soc_dai *dai, int mute, int direction)
diff --git a/sound/soc/codecs/tas6424.c b/sound/soc/codecs/tas6424.c
index 9c9a6ec4d9779..63d2983c3fcf4 100644
--- a/sound/soc/codecs/tas6424.c
+++ b/sound/soc/codecs/tas6424.c
@@ -375,7 +375,6 @@ static struct snd_soc_component_driver soc_codec_dev_tas6424 = {
 	.num_dapm_routes	= ARRAY_SIZE(tas6424_audio_map),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct snd_soc_dai_ops tas6424_speaker_dai_ops = {
-- 
2.30.2

