Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0665557C41
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jun 2022 14:56:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232159AbiFWM4h (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jun 2022 08:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232020AbiFWM4c (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Jun 2022 08:56:32 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9675A4AE1C;
        Thu, 23 Jun 2022 05:56:26 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25N5mxlC032604;
        Thu, 23 Jun 2022 07:53:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=vz4pTGb6RSnyR0fnPsokrNw+ENVF1PSgVY/ErFIGaJk=;
 b=mXgXq+kY6s2Of/DBfrZnKXVmLz8kIR4/QJdo32swaKsfMeoOKPd8KpFuASkKTAjvksSn
 wJ4bmQfo2Q33w7xSXywJSita6+vj+36cSw2YOd7ItGWNZ9fAbSWWTUw/XQTiKN5DE1ew
 psx11E8HN1NF+0JoMJAid6Anw6d9vldCqiWWQu9CE/R3hXNnzlO/pveN/iL6irT9N4GI
 jEUyzgcqpub8J5G9q+Yu+0a0v/vXqCAABUPzxI9xzj5Y5USV/81yQ/HsDr3gK+wt367w
 LeR9XCwzBGarmSTH1FsiywfxQr88rbydAAqaPcgwEPmuwJNKJ7yikRVgMMhLCuN7KC+j mw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gsb4p6wvu-11
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 23 Jun 2022 07:53:05 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:55 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 23 Jun 2022 13:52:55 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8FFF111D1;
        Thu, 23 Jun 2022 12:52:55 +0000 (UTC)
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
Subject: [PATCH v2 54/96] ASoC: nau*: Remove now redundant non_legacy_dai_naming flag
Date:   Thu, 23 Jun 2022 13:52:08 +0100
Message-ID: <20220623125250.2355471-55-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Yi3-Y6Ge2LR5rGupQl3212cvuTOEOXeY
X-Proofpoint-ORIG-GUID: Yi3-Y6Ge2LR5rGupQl3212cvuTOEOXeY
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
 sound/soc/codecs/nau8315.c | 1 -
 sound/soc/codecs/nau8540.c | 1 -
 sound/soc/codecs/nau8810.c | 1 -
 sound/soc/codecs/nau8821.c | 1 -
 sound/soc/codecs/nau8822.c | 1 -
 sound/soc/codecs/nau8824.c | 1 -
 sound/soc/codecs/nau8825.c | 1 -
 7 files changed, 7 deletions(-)

diff --git a/sound/soc/codecs/nau8315.c b/sound/soc/codecs/nau8315.c
index 2b66e3f7a8b7f..ad4dce9e50807 100644
--- a/sound/soc/codecs/nau8315.c
+++ b/sound/soc/codecs/nau8315.c
@@ -93,7 +93,6 @@ static const struct snd_soc_component_driver nau8315_component_driver = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct snd_soc_dai_ops nau8315_dai_ops = {
diff --git a/sound/soc/codecs/nau8540.c b/sound/soc/codecs/nau8540.c
index 347c715e22a4b..58f70a02f18aa 100644
--- a/sound/soc/codecs/nau8540.c
+++ b/sound/soc/codecs/nau8540.c
@@ -806,7 +806,6 @@ static const struct snd_soc_component_driver nau8540_component_driver = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config nau8540_regmap_config = {
diff --git a/sound/soc/codecs/nau8810.c b/sound/soc/codecs/nau8810.c
index 7b3b1e4ac2465..ccb512c21d748 100644
--- a/sound/soc/codecs/nau8810.c
+++ b/sound/soc/codecs/nau8810.c
@@ -866,7 +866,6 @@ static const struct snd_soc_component_driver nau8810_component_driver = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int nau8810_i2c_probe(struct i2c_client *i2c)
diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index ce4e7f46bb067..6453e93678d22 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -1430,7 +1430,6 @@ static const struct snd_soc_component_driver nau8821_component_driver = {
 	.dapm_routes		= nau8821_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(nau8821_dapm_routes),
 	.suspend_bias_off	= 1,
-	.non_legacy_dai_naming	= 1,
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
index 3907d1dd8ceef..1aef281a99727 100644
--- a/sound/soc/codecs/nau8822.c
+++ b/sound/soc/codecs/nau8822.c
@@ -1083,7 +1083,6 @@ static const struct snd_soc_component_driver soc_component_dev_nau8822 = {
 	.idle_bias_on			= 1,
 	.use_pmdown_time		= 1,
 	.endianness			= 1,
-	.non_legacy_dai_naming		= 1,
 };
 
 static const struct regmap_config nau8822_regmap_config = {
diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index 2a7c935085353..ad54d70f7d8e7 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -1544,7 +1544,6 @@ static const struct snd_soc_component_driver nau8824_component_driver = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct snd_soc_dai_ops nau8824_dai_ops = {
diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index 20e45a337b8f2..907ec88c759a8 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -2478,7 +2478,6 @@ static const struct snd_soc_component_driver nau8825_component_driver = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static void nau8825_reset_chip(struct regmap *regmap)
-- 
2.30.2

