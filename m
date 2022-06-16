Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B62854E47B
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jun 2022 16:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377821AbiFPOgO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jun 2022 10:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377830AbiFPOfw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Jun 2022 10:35:52 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 185B020180;
        Thu, 16 Jun 2022 07:35:51 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC07CB027888;
        Thu, 16 Jun 2022 09:34:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Jgy4HYvWutWIwNsNORzLVRecig1c5kbslPS86+xHyEg=;
 b=mgSUGDdDdpekTdlEAUpg7wE+LP369Rc3nUTdx/i78NvLL0khdeqZUXymwvnMr/ndg+Y2
 7dM5ha1U1u7v6YOuu7TE17NbtXDOPMIWYYoZFYvW+FAG5dmq5ubNNVGNnMY+oslWNoZO
 ZXdJIind7Vu0pQbk+niy0Nx3sWc+t2yG+6UxyZbdw+fJxiClb9PrVs4YN5HiqA5vayRE
 ugGeyCj2wiCFoQ+qcLJj7dURgtkp7Pgtc3K9WiGxRPbeyRWAeIXAT+0ezNobqDQbvHMA
 S55H5hYo32oL2nZoGifMM0BrTe/JgTks27bX1MtYOhVCKBpuYgD8kmmQx6C13BgS3xa8 2g== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gmrf35vuu-8
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 16 Jun 2022 09:34:38 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:31 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 16 Jun 2022 15:34:31 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2D276468;
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
Subject: [PATCH 16/96] ASoC: meson: Migrate to new style legacy DAI naming flag
Date:   Thu, 16 Jun 2022 15:33:09 +0100
Message-ID: <20220616143429.1324494-17-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: UFBxm3IHq5fcn3nVljfzcgJ60t0r2xj7
X-Proofpoint-ORIG-GUID: UFBxm3IHq5fcn3nVljfzcgJ60t0r2xj7
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
 sound/soc/meson/axg-frddr.c    | 3 +++
 sound/soc/meson/axg-pdm.c      | 4 +++-
 sound/soc/meson/axg-spdifin.c  | 1 +
 sound/soc/meson/axg-spdifout.c | 1 +
 sound/soc/meson/axg-toddr.c    | 3 +++
 5 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
index 37f4bb3469b5c..61f9d417fd608 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -161,6 +161,7 @@ static const struct snd_soc_component_driver axg_frddr_component_drv = {
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
 	.trigger		= axg_fifo_pcm_trigger,
+	.legacy_dai_naming	= 1,
 };
 
 static const struct axg_fifo_match_data axg_frddr_match_data = {
@@ -286,6 +287,7 @@ static const struct snd_soc_component_driver g12a_frddr_component_drv = {
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
 	.trigger		= axg_fifo_pcm_trigger,
+	.legacy_dai_naming	= 1,
 };
 
 static const struct axg_fifo_match_data g12a_frddr_match_data = {
@@ -356,6 +358,7 @@ static const struct snd_soc_component_driver sm1_frddr_component_drv = {
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
 	.trigger		= axg_fifo_pcm_trigger,
+	.legacy_dai_naming	= 1,
 };
 
 static const struct axg_fifo_match_data sm1_frddr_match_data = {
diff --git a/sound/soc/meson/axg-pdm.c b/sound/soc/meson/axg-pdm.c
index 672e43a9729dc..88ac58272f95b 100644
--- a/sound/soc/meson/axg-pdm.c
+++ b/sound/soc/meson/axg-pdm.c
@@ -457,7 +457,9 @@ static struct snd_soc_dai_driver axg_pdm_dai_drv = {
 	.remove		= axg_pdm_dai_remove,
 };
 
-static const struct snd_soc_component_driver axg_pdm_component_drv = {};
+static const struct snd_soc_component_driver axg_pdm_component_drv = {
+	.legacy_dai_naming = 1,
+};
 
 static const struct regmap_config axg_pdm_regmap_cfg = {
 	.reg_bits	= 32,
diff --git a/sound/soc/meson/axg-spdifin.c b/sound/soc/meson/axg-spdifin.c
index 4ba44e0d65d9f..e2cc4c4be7586 100644
--- a/sound/soc/meson/axg-spdifin.c
+++ b/sound/soc/meson/axg-spdifin.c
@@ -390,6 +390,7 @@ static const struct snd_kcontrol_new axg_spdifin_controls[] = {
 static const struct snd_soc_component_driver axg_spdifin_component_drv = {
 	.controls		= axg_spdifin_controls,
 	.num_controls		= ARRAY_SIZE(axg_spdifin_controls),
+	.legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config axg_spdifin_regmap_cfg = {
diff --git a/sound/soc/meson/axg-spdifout.c b/sound/soc/meson/axg-spdifout.c
index 3960d082e1436..e8a12f15f3b4a 100644
--- a/sound/soc/meson/axg-spdifout.c
+++ b/sound/soc/meson/axg-spdifout.c
@@ -383,6 +383,7 @@ static const struct snd_soc_component_driver axg_spdifout_component_drv = {
 	.dapm_routes		= axg_spdifout_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(axg_spdifout_dapm_routes),
 	.set_bias_level		= axg_spdifout_set_bias_level,
+	.legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config axg_spdifout_regmap_cfg = {
diff --git a/sound/soc/meson/axg-toddr.c b/sound/soc/meson/axg-toddr.c
index d6adf7edea41f..e9208e74e9659 100644
--- a/sound/soc/meson/axg-toddr.c
+++ b/sound/soc/meson/axg-toddr.c
@@ -182,6 +182,7 @@ static const struct snd_soc_component_driver axg_toddr_component_drv = {
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
 	.trigger		= axg_fifo_pcm_trigger,
+	.legacy_dai_naming	= 1,
 };
 
 static const struct axg_fifo_match_data axg_toddr_match_data = {
@@ -242,6 +243,7 @@ static const struct snd_soc_component_driver g12a_toddr_component_drv = {
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
 	.trigger		= axg_fifo_pcm_trigger,
+	.legacy_dai_naming	= 1,
 };
 
 static const struct axg_fifo_match_data g12a_toddr_match_data = {
@@ -312,6 +314,7 @@ static const struct snd_soc_component_driver sm1_toddr_component_drv = {
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
 	.trigger		= axg_fifo_pcm_trigger,
+	.legacy_dai_naming	= 1,
 };
 
 static const struct axg_fifo_match_data sm1_toddr_match_data = {
-- 
2.30.2

