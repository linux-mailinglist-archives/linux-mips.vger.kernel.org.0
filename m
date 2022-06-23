Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE723557B85
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jun 2022 14:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232032AbiFWMyg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jun 2022 08:54:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231905AbiFWMyc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Jun 2022 08:54:32 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC40F42481;
        Thu, 23 Jun 2022 05:54:30 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NBNlqX015665;
        Thu, 23 Jun 2022 07:52:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=qFSgNYX1ptHx3ipGzxboQwtB9TZr5xpVdo+hP8vZjJM=;
 b=HfhzjAXCMyDKnCSTVEaiZi2yCshZSmIZ4cW4k5KaoUn+hTkmnUtwYl+IF2786FRHA97M
 V8oX/Hmfos3KV8FxDCstedHvWNPmO7iPh4uzF1Ox+kdcsrSW2qBGIY5GcspZYfiJx58h
 ylmk0kzxMDgXRy9b1ZqixT8NCA4SXemjtBcHCQ/MNNWATyZGsdGN9hTycYxjz00X3+El
 4F//2TbuTXe5qQfySRpLG+rgpYYV66xK7fd8BB/BJTx1C0SVkAg1MTpsrmf3wUM8YQn4
 l1zjSiE1GuFrWEMh8L9tMCXntgyp4GW6qWYPWQgz9nk9/qvmIe63PtFkXWbBrAWz+5Xa Mw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41fa4j-4
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 23 Jun 2022 07:52:55 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:51 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 23 Jun 2022 13:52:51 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6A5B1478;
        Thu, 23 Jun 2022 12:52:51 +0000 (UTC)
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
Subject: [PATCH v2 08/96] ASoC: stm32: Migrate to new style legacy DAI naming flag
Date:   Thu, 23 Jun 2022 13:51:22 +0100
Message-ID: <20220623125250.2355471-9-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Dvzy2Hk5MagPDS3RATX6-WRRTOSLJq0B
X-Proofpoint-ORIG-GUID: Dvzy2Hk5MagPDS3RATX6-WRRTOSLJq0B
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
 sound/soc/stm/stm32_adfsdm.c  | 1 +
 sound/soc/stm/stm32_i2s.c     | 1 +
 sound/soc/stm/stm32_sai_sub.c | 1 +
 sound/soc/stm/stm32_spdifrx.c | 1 +
 4 files changed, 4 insertions(+)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index 122805160e70b..04f2912e14181 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -149,6 +149,7 @@ static const struct snd_soc_dai_driver stm32_adfsdm_dai = {
 
 static const struct snd_soc_component_driver stm32_adfsdm_dai_component = {
 	.name = "stm32_dfsdm_audio",
+	.legacy_dai_naming = 1,
 };
 
 static void stm32_memcpy_32to16(void *dest, const void *src, size_t n)
diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 32d885f84a922..6aafe793eec44 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -978,6 +978,7 @@ static const struct snd_dmaengine_pcm_config stm32_i2s_pcm_config = {
 
 static const struct snd_soc_component_driver stm32_i2s_component = {
 	.name = "stm32-i2s",
+	.legacy_dai_naming = 1,
 };
 
 static void stm32_i2s_dai_init(struct snd_soc_pcm_stream *stream,
diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 03cc6d12d18bb..eb31b49e65978 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1336,6 +1336,7 @@ static const struct snd_dmaengine_pcm_config stm32_sai_pcm_config_spdif = {
 
 static const struct snd_soc_component_driver stm32_component = {
 	.name = "stm32-sai",
+	.legacy_dai_naming = 1,
 };
 
 static const struct of_device_id stm32_sai_sub_ids[] = {
diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 6f7882c4fe6ad..0f71467567176 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -888,6 +888,7 @@ static const struct snd_pcm_hardware stm32_spdifrx_pcm_hw = {
 
 static const struct snd_soc_component_driver stm32_spdifrx_component = {
 	.name = "stm32-spdifrx",
+	.legacy_dai_naming = 1,
 };
 
 static const struct snd_dmaengine_pcm_config stm32_spdifrx_pcm_config = {
-- 
2.30.2

