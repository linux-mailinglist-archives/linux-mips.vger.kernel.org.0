Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46CED54E4AF
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jun 2022 16:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377962AbiFPOga (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jun 2022 10:36:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377765AbiFPOfu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Jun 2022 10:35:50 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E26572FE71;
        Thu, 16 Jun 2022 07:35:48 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC0DJa015765;
        Thu, 16 Jun 2022 09:34:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=96o+562JkkL9bhGImvZTp19A+OVl2G5bsK/3jHm4+To=;
 b=jIRtSajv3ftzFtO1om4cUfZ6Q4PSyeBY0BTB6dXjE4mY0Ln06HvpTftnvhN+e2Me98Hq
 QPevX7bk9W0eA8oH9ZqNwoVTxWSphO1KJIX6ZvHb7+F7o1MsqC+OQ5rWsmOmNFZ1Fq5Q
 Svpnp0Mus7Yi28L9cn9gfFVcuUc/EhuGQ/rmLn/kU4NDOvxDK6AD0zySwK3v5WETn/Vj
 vNVqzZB/uUX/954+wVUQr8bRp5S0JOSp53Uryp7USj3bLsunb6Ro+e1CTvO31WSjl/yL
 duJS+X/1KdYrptz3973W+wGcK659zZ6tO7SKVe+4vUE0y/yt+ecWUy2lauulz4IcqxpV lQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq5w3h-8
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 16 Jun 2022 09:34:36 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:31 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 16 Jun 2022 15:34:31 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0CD8F468;
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
Subject: [PATCH 14/96] ASoC: sunxi: Migrate to new style legacy DAI naming flag
Date:   Thu, 16 Jun 2022 15:33:07 +0100
Message-ID: <20220616143429.1324494-15-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: cjWLu3nTIWbWMGXDYD-s4w34i12Rz64t
X-Proofpoint-GUID: cjWLu3nTIWbWMGXDYD-s4w34i12Rz64t
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
 sound/soc/sunxi/sun4i-codec.c | 3 ++-
 sound/soc/sunxi/sun4i-i2s.c   | 3 ++-
 sound/soc/sunxi/sun4i-spdif.c | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 53e3f43816cc2..bc634962a57ee 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1234,7 +1234,8 @@ static const struct snd_soc_component_driver sun8i_a23_codec_codec = {
 };
 
 static const struct snd_soc_component_driver sun4i_codec_component = {
-	.name = "sun4i-codec",
+	.name			= "sun4i-codec",
+	.legacy_dai_naming	= 1,
 };
 
 #define SUN4I_CODEC_RATES	SNDRV_PCM_RATE_CONTINUOUS
diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index f58aa6406a874..806f331890b02 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1123,7 +1123,8 @@ static struct snd_soc_dai_driver sun4i_i2s_dai = {
 };
 
 static const struct snd_soc_component_driver sun4i_i2s_component = {
-	.name	= "sun4i-dai",
+	.name			= "sun4i-dai",
+	.legacy_dai_naming	= 1,
 };
 
 static bool sun4i_i2s_rd_reg(struct device *dev, unsigned int reg)
diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index 17090f43150e0..bcceebca915ac 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -583,7 +583,8 @@ static const struct of_device_id sun4i_spdif_of_match[] = {
 MODULE_DEVICE_TABLE(of, sun4i_spdif_of_match);
 
 static const struct snd_soc_component_driver sun4i_spdif_component = {
-	.name		= "sun4i-spdif",
+	.name			= "sun4i-spdif",
+	.legacy_dai_naming	= 1,
 };
 
 static int sun4i_spdif_runtime_suspend(struct device *dev)
-- 
2.30.2

