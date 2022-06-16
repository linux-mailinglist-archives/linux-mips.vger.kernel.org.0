Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FAD154E46F
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jun 2022 16:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377907AbiFPOgM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jun 2022 10:36:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377819AbiFPOft (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Jun 2022 10:35:49 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACD3024961;
        Thu, 16 Jun 2022 07:35:48 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC0DJf015765;
        Thu, 16 Jun 2022 09:34:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=/OMdhXcsYqZcTE4Jgb/VhFYJ4Ynjb6jiPAj/sWZDfIM=;
 b=dxLEgYUivTIu7nkU3bcr+h40MtfUSuiMMJRkE1dgGKHi8+KAFIQegHWVKQ09BV97NarO
 XBaQso6YiS8V2zmY0Smv941b0v9Zmij7Ecjq+b/9F3sQtbC5/lLlgrSuF+UK/1O7Wc1B
 x9grXSoV8XwFpA3H0+Ph6PLnmC4FtntikRfgJlY5FUgzEVrFTiSnJYzMXVAiZff+4/1+
 b895Dx/1do6U+rr5xDPWciHrkUVltUMUhJGyj4jVRZUsOLonqheZsJzoeYgxspK38Z4k
 AVPFuY9N6fx8ao3R/soH2OZ2wnOBcIM5skUFvLM8srghhq429+1JpXwS4ZFmHgEBmZG4 tQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq5w3h-13
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 16 Jun 2022 09:34:40 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 16 Jun 2022 15:34:32 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AF63211DA;
        Thu, 16 Jun 2022 14:34:32 +0000 (UTC)
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
Subject: [PATCH 34/96] ASoC: core: Switch core to new DAI naming flag
Date:   Thu, 16 Jun 2022 15:33:27 +0100
Message-ID: <20220616143429.1324494-35-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Q4LsWqzZadA8Y31Ql8B7HUtp73F-6jml
X-Proofpoint-GUID: Q4LsWqzZadA8Y31Ql8B7HUtp73F-6jml
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Now all the drivers are updated to have the new legacy_dai_naming
flag, update the core code so it also uses the new flag. Paving
the way for the old non_legacy_dai_naming flag to be removed.

It should be noted this patch will affect the CODEC drivers that don't
specify the non_legacy_dai_naming flag. These drivers will update from
using legacy DAI naming to the new scheme after this patch, this is
being considered a fix as the intention was for all CODEC drivers to use
the new scheme and all existing CODEC drivers were updated to do so
before componentisation. This just corrects those devices that have
snuck in since componentisation. The corrected devices are as
follows:

adau1372, cros_ec_codec, cs35l41, cs35l45, cx2072x, hdac_hda,
jz4725/60/70, lpass-rx/tx/va/wsa-macro, max98504, max9877,
mt6351/58/59, mt6660, pcm3060, rk3328, rt1308/16, rt5514,
rt5677, rt700/11/15, rt9120, sdw-mockup, tlv320adc3xxx, tscs454,
wcd9335/4x/8x, wsa881x

Some of these devices are used in some in kernel machine drivers,
however it appears all the usages use the actual DAI driver name
(since snd_soc_find_dai checks both the DAI name and the DAI driver
name). So it is not believed this change will break any in tree
machine drivers.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/soc-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 57f7105c12b76..469c7cfe6240c 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2490,7 +2490,7 @@ static int snd_soc_register_dais(struct snd_soc_component *component,
 
 	for (i = 0; i < count; i++) {
 		dai = snd_soc_register_dai(component, dai_drv + i, count == 1 &&
-					   !component->driver->non_legacy_dai_naming);
+					   component->driver->legacy_dai_naming);
 		if (dai == NULL) {
 			ret = -ENOMEM;
 			goto err;
-- 
2.30.2

