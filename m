Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ACFD557C2B
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jun 2022 14:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbiFWM4h (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jun 2022 08:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231889AbiFWM4c (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Jun 2022 08:56:32 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B35F4BBBA;
        Thu, 23 Jun 2022 05:56:25 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NBNlqh015665;
        Thu, 23 Jun 2022 07:53:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=lUR098xjWteEbH1+FUtUPo6I+j1bPK4ArKFxC7siG8M=;
 b=V92mHpBxj1U/wYnPVgsO3LRKurl9Jm2I/m9HXLnmI0H7uz61m3DoLPesHfznSBDfLtHK
 P9QdIfasUx/i2RuT76alsan39yDuSzG+d4BT/Wkg405l9EF7F4j/Kcwhnx9X3kDl3TTT
 n8yPxJASPpeVjUrrzqxXuXXg/7HDXsCE6Z146b+1urkTu0Yuzk34pyf1oyg5vaIUs4xQ
 Ok0/MUqsbjBRDRUSUE/83V/Ov9i2gONqxlKg/TtXgpstisB5bev+fUXzklHCDn9ZHHXP
 bu0e0CZ1H0219eTYXNH9F37UII5gBY2Ozy6da4p9hEtHcDPUl+9CBsiqQe6WSTdywGNW KA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41fa4j-14
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 23 Jun 2022 07:53:03 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:54 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 23 Jun 2022 13:52:54 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 133F311D1;
        Thu, 23 Jun 2022 12:52:54 +0000 (UTC)
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
Subject: [PATCH v2 37/96] ASoC: meson: Remove now redundant non_legacy_dai_naming flag
Date:   Thu, 23 Jun 2022 13:51:51 +0100
Message-ID: <20220623125250.2355471-38-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: SzNCzuptw7eEZGl2I-h7iUv05DZ7N-SU
X-Proofpoint-ORIG-GUID: SzNCzuptw7eEZGl2I-h7iUv05DZ7N-SU
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
 sound/soc/meson/aiu-acodec-ctrl.c | 1 -
 sound/soc/meson/aiu-codec-ctrl.c  | 1 -
 sound/soc/meson/g12a-toacodec.c   | 2 --
 sound/soc/meson/g12a-tohdmitx.c   | 1 -
 sound/soc/meson/t9015.c           | 1 -
 5 files changed, 6 deletions(-)

diff --git a/sound/soc/meson/aiu-acodec-ctrl.c b/sound/soc/meson/aiu-acodec-ctrl.c
index 3776b073a3dbb..d0f0ada5f4bce 100644
--- a/sound/soc/meson/aiu-acodec-ctrl.c
+++ b/sound/soc/meson/aiu-acodec-ctrl.c
@@ -192,7 +192,6 @@ static const struct snd_soc_component_driver aiu_acodec_ctrl_component = {
 	.num_dapm_routes	= ARRAY_SIZE(aiu_acodec_ctrl_routes),
 	.of_xlate_dai_name	= aiu_acodec_of_xlate_dai_name,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_prefix		= "acodec",
 #endif
diff --git a/sound/soc/meson/aiu-codec-ctrl.c b/sound/soc/meson/aiu-codec-ctrl.c
index 286ac4983d40c..84c10956c2414 100644
--- a/sound/soc/meson/aiu-codec-ctrl.c
+++ b/sound/soc/meson/aiu-codec-ctrl.c
@@ -139,7 +139,6 @@ static const struct snd_soc_component_driver aiu_hdmi_ctrl_component = {
 	.num_dapm_routes	= ARRAY_SIZE(aiu_hdmi_ctrl_routes),
 	.of_xlate_dai_name	= aiu_hdmi_of_xlate_dai_name,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_prefix		= "hdmi",
 #endif
diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
index 1dfee1396843c..ddc667956cf5e 100644
--- a/sound/soc/meson/g12a-toacodec.c
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -242,7 +242,6 @@ static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
 	.dapm_routes		= g12a_toacodec_routes,
 	.num_dapm_routes	= ARRAY_SIZE(g12a_toacodec_routes),
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
@@ -254,7 +253,6 @@ static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
 	.dapm_routes		= g12a_toacodec_routes,
 	.num_dapm_routes	= ARRAY_SIZE(g12a_toacodec_routes),
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config g12a_toacodec_regmap_cfg = {
diff --git a/sound/soc/meson/g12a-tohdmitx.c b/sound/soc/meson/g12a-tohdmitx.c
index 6c99052feafd8..579a04ad4d197 100644
--- a/sound/soc/meson/g12a-tohdmitx.c
+++ b/sound/soc/meson/g12a-tohdmitx.c
@@ -226,7 +226,6 @@ static const struct snd_soc_component_driver g12a_tohdmitx_component_drv = {
 	.dapm_routes		= g12a_tohdmitx_routes,
 	.num_dapm_routes	= ARRAY_SIZE(g12a_tohdmitx_routes),
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config g12a_tohdmitx_regmap_cfg = {
diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
index a9b8c4e77d405..9c6b4dac68932 100644
--- a/sound/soc/meson/t9015.c
+++ b/sound/soc/meson/t9015.c
@@ -234,7 +234,6 @@ static const struct snd_soc_component_driver t9015_codec_driver = {
 	.num_dapm_routes	= ARRAY_SIZE(t9015_dapm_routes),
 	.suspend_bias_off	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config t9015_regmap_config = {
-- 
2.30.2

