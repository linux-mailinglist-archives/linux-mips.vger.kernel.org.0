Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B009557B6F
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jun 2022 14:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231995AbiFWMyb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jun 2022 08:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231887AbiFWMy2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Jun 2022 08:54:28 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8746142481;
        Thu, 23 Jun 2022 05:54:27 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25N6FQeb013924;
        Thu, 23 Jun 2022 07:53:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=0akrc3t0gvqgAg9mHNYY5I7ETdh3VIkukD6HTMu03Q8=;
 b=RGBC0OgKsImgqtmzWxueuIWm/iPxb8fbLeQXo5Av1ekmhIFSzokkaVCMFH+7JjoxMjPH
 lEoYLGTJ9+TGbIGBtSLf7XElAQu1lbuysblI8dLUVy1KAxYu5qi/CQ9jfo2H4blpBakc
 QF9hvfE5fS5DgvOJGIH4NKgelpRDEaImVAbgofUpwHK6ix2g/Gd9adFCI0ooLCLbu2OP
 P24op62QObIYqEQeQgQyzZ8XhqYjzSgvjjmIemqtd3QA7XuUQpmcK9rwelzSan3Enepc
 ODufOzkG75k/EWwV1a62kde6kCvtQ4cM3PdAh8lvD0nTjV1BhHcvI501aWSx3LYKctcm RA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41fa4x-13
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 23 Jun 2022 07:53:14 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:58 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 23 Jun 2022 13:52:58 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8DBA511D4;
        Thu, 23 Jun 2022 12:52:58 +0000 (UTC)
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
Subject: [PATCH v2 88/96] ASoC: rk817: Remove now redundant non_legacy_dai_naming flag
Date:   Thu, 23 Jun 2022 13:52:42 +0100
Message-ID: <20220623125250.2355471-89-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 55AiC7Bk2_FY81iBWH4DMPNj2jdeZGYX
X-Proofpoint-ORIG-GUID: 55AiC7Bk2_FY81iBWH4DMPNj2jdeZGYX
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
 sound/soc/codecs/rk817_codec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rk817_codec.c b/sound/soc/codecs/rk817_codec.c
index cce6f4e7992f5..2a5b274bfc0f5 100644
--- a/sound/soc/codecs/rk817_codec.c
+++ b/sound/soc/codecs/rk817_codec.c
@@ -444,7 +444,6 @@ static const struct snd_soc_component_driver soc_codec_dev_rk817 = {
 	.idle_bias_on = 1,
 	.use_pmdown_time = 1,
 	.endianness = 1,
-	.non_legacy_dai_naming = 1,
 	.controls = rk817_volume_controls,
 	.num_controls = ARRAY_SIZE(rk817_volume_controls),
 	.dapm_routes = rk817_dapm_routes,
-- 
2.30.2

