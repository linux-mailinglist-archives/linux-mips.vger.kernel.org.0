Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB2E52D8C6
	for <lists+linux-mips@lfdr.de>; Thu, 19 May 2022 17:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241277AbiESPra (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 May 2022 11:47:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241373AbiESPqR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 May 2022 11:46:17 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0E887CDF1;
        Thu, 19 May 2022 08:44:23 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J66mWF012194;
        Thu, 19 May 2022 10:43:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=oil1ZKHs2gIMho1AoeBK9FgMU7gcVZ4wK4kjgOzdSgU=;
 b=VQjZoP93a0c8d+W/ugsjRxH9Fh1c1s3oEgc2mW54Kkr56QBRJ88v6LW8A8/rSjGStAsO
 Nf1wuE4VqmHUd+/RjkSpFuiZ0cMmWa3CdoAK0RCYsILdmBymnKNchfv1FYGaApL7R4fj
 kPxLk4H6KmvxU/TsS1AKvB1RzEZDzrpsOhNLC+OtRHWFmJnim4Yl0ypQBX2NYM2tFmwh
 SlabDEdIZwWaFx6REBIak6ICHrHTatIr57nUQyEjgxgcyiy0INoclm90w5blGBoZOg/a
 io4sDZ82+vQyPAxpgqierRNnmO+F8kkxvNZAAIKN0iQyMoEssAq1im2hGfWe9JzGdOXB PQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dn-18
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 19 May 2022 10:43:41 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Thu, 19 May 2022 16:43:22 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6025911DA;
        Thu, 19 May 2022 15:43:22 +0000 (UTC)
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
Subject: [PATCH 56/56] ASoC: simple-card-utils: Move snd_soc_component_is_codec to be local
Date:   Thu, 19 May 2022 16:43:18 +0100
Message-ID: <20220519154318.2153729-57-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: g2VJ5uiOojlv2ZUJ1ZRM-SzjnwXJaEpV
X-Proofpoint-ORIG-GUID: g2VJ5uiOojlv2ZUJ1ZRM-SzjnwXJaEpV
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The helper function snd_soc_component_is_codec is based off the
presence of the non_legacy_dai_naming flag. This isn't super robust
as CPU side components may also specify this flag, and indeed the
kernel already contains a couple that do. After componentisation there
isn't really a totally robust solution to identifying what is a CODEC
driver, without introducing a flag specifically for that purpose, and
really the desirable direction to move in is that the distinction
doesn't matter.

This patch does two things to try to mitigate these problems. Firstly,
now that all the other users of the helper function have been removed,
it makes the helper function local to the driver rather, than being
part of the core. This should help to discourage any new code from
being created that depends on the CODEC driver distinction. Secondly,
it updates the helper function itself to use the endianness flag
rather than the non_legacy_dai_naming flag. The endianness flag is
definitely invalid on a CPU side component, so it a more reliable
indicator that the device is definitely a CODEC. The vast majority of
buses require the CODEC to set the endianness flag, so the number of
corner cases should be fairly minimal. It is worth noting that CODECs
sending audio over SPI, or built into the CPU CODECs are potential
corner cases, however the hope is that in most cases those types of
devices do not consitute a simple audio card.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc-component.h         | 5 -----
 sound/soc/generic/simple-card-utils.c | 7 ++++++-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 5a764c3099d3e..5c4cfa70b018c 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -348,11 +348,6 @@ static inline int snd_soc_component_cache_sync(
 	return regcache_sync(component->regmap);
 }
 
-static inline int snd_soc_component_is_codec(struct snd_soc_component *component)
-{
-	return component->driver->non_legacy_dai_naming;
-}
-
 void snd_soc_component_set_aux(struct snd_soc_component *component,
 			       struct snd_soc_aux_dev *aux);
 int snd_soc_component_init(struct snd_soc_component *component);
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 539d7f081bd79..50a9827089335 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -513,6 +513,11 @@ static int asoc_simple_init_dai(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static inline int asoc_simple_component_is_codec(struct snd_soc_component *component)
+{
+	return component->driver->endianness;
+}
+
 static int asoc_simple_init_dai_link_params(struct snd_soc_pcm_runtime *rtd,
 					    struct simple_dai_props *dai_props)
 {
@@ -524,7 +529,7 @@ static int asoc_simple_init_dai_link_params(struct snd_soc_pcm_runtime *rtd,
 
 	/* Only Codecs */
 	for_each_rtd_components(rtd, i, component) {
-		if (!snd_soc_component_is_codec(component))
+		if (!asoc_simple_component_is_codec(component))
 			return 0;
 	}
 
-- 
2.30.2

