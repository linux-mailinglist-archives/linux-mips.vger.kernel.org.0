Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6BC254E42A
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jun 2022 16:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377774AbiFPOfr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jun 2022 10:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377090AbiFPOfi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Jun 2022 10:35:38 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 832171FA51;
        Thu, 16 Jun 2022 07:35:37 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25G8o9fe009500;
        Thu, 16 Jun 2022 09:34:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=/YrLbsib8Yh5fzo7Etvf2etgY4zhhSJ7yMT4UFg+Ibo=;
 b=n3k3+m2PJ9fAL9kEOjLWPuhqQKViJJfb+kpz/EfKT0zZiPO8n8HR26zECQDRrJKIM/ey
 9rzREOM9lMsPwSQIAAjp6eAZ09ah+yPmfjKnQ/+66tYLPHVM4XnBgKKDBkrUPYu1qFvO
 N73szRmgtgRxEDxLn2LxnmOz/5SR7ea4oApiLuUhMlD188EPPwEZUSFYjlsRc8I8llO4
 T45xaDc0RufM347qqq2HsIJW/azyDVHONaxxgVfCRZC1sv3pd4++omD5Lj1NzMcsdBj9
 NbRZSLhYJvn7abnoApRFE/kV0so55xo/OUEqKqDey2EUf4KLX8PXr3L4PEvsWTameq0a CA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq5w3u-12
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 16 Jun 2022 09:34:56 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:37 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 16 Jun 2022 15:34:37 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A465B11D3;
        Thu, 16 Jun 2022 14:34:37 +0000 (UTC)
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
Subject: [PATCH 95/96] ASoC: zl38060: Remove now redundant non_legacy_dai_naming flag
Date:   Thu, 16 Jun 2022 15:34:28 +0100
Message-ID: <20220616143429.1324494-96-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: keGAmTpbUA_hYqmbSnSV-Swb7JEYFLpr
X-Proofpoint-GUID: keGAmTpbUA_hYqmbSnSV-Swb7JEYFLpr
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
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
 sound/soc/codecs/zl38060.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/zl38060.c b/sound/soc/codecs/zl38060.c
index 6cae0fb08093b..c3d0a2a7c36f2 100644
--- a/sound/soc/codecs/zl38060.c
+++ b/sound/soc/codecs/zl38060.c
@@ -385,7 +385,6 @@ static const struct snd_soc_component_driver zl38_component_dev = {
 	.dapm_routes		= zl38_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(zl38_dapm_routes),
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static void chip_gpio_set(struct gpio_chip *c, unsigned int offset, int val)
-- 
2.30.2

