Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99E97557AEF
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jun 2022 14:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231895AbiFWMxo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jun 2022 08:53:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231893AbiFWMxn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Jun 2022 08:53:43 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E2343F8BA;
        Thu, 23 Jun 2022 05:53:43 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NBNlqe015665;
        Thu, 23 Jun 2022 07:53:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=xiTDbgqeuZhdt8R7oq9x3sZqM+2pp+NbDTNVr+GbnW8=;
 b=BMkvWccDTR/acUBKuVYHkVgfYC9fzgUMo4pjGp0IRf5EPRTxIdKbozbhz1FXGDTKG2KJ
 gHRNF+XA2KYtgjkBLnCVb8nGTjEltssED+bOSZFk8b7DxGAyMdjdORz6ood8UtdWltyd
 uNe4BkgaBvn2lPbZXwpcfOqW8UixIF5oKd2awPCqyX//GemqNbWPBcVAieSo/aiW5H7q
 hA1hec7ZWsReMW5PWNqJCk7iL9tRVOnw7gDB/UgeZVfqjWmrYY+gLzIzwXYhye+AUC4h
 /LHUdBeSe2AVd5hCZrPC0U9MJbsREvWqkEV/FxRvz+lA6Xum0ZgyZ+JMWNp5jYDX5/fL ug== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41fa4j-11
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 23 Jun 2022 07:53:01 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:53 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 23 Jun 2022 13:52:53 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1CAF911D4;
        Thu, 23 Jun 2022 12:52:53 +0000 (UTC)
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
Subject: [PATCH v2 26/96] ASoC: rockchip: Migrate to new style legacy DAI naming flag
Date:   Thu, 23 Jun 2022 13:51:40 +0100
Message-ID: <20220623125250.2355471-27-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: mrCEpUkbvrlRu_dSm7I3U5CjQAZQL9h3
X-Proofpoint-ORIG-GUID: mrCEpUkbvrlRu_dSm7I3U5CjQAZQL9h3
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
 sound/soc/rockchip/rockchip_i2s.c     | 1 +
 sound/soc/rockchip/rockchip_i2s_tdm.c | 1 +
 sound/soc/rockchip/rockchip_pdm.c     | 1 +
 sound/soc/rockchip/rockchip_spdif.c   | 1 +
 4 files changed, 4 insertions(+)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index d300eee9ddaae..f8c3fba725b4e 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -561,6 +561,7 @@ static struct snd_soc_dai_driver rockchip_i2s_dai = {
 
 static const struct snd_soc_component_driver rockchip_i2s_component = {
 	.name = DRV_NAME,
+	.legacy_dai_naming = 1,
 };
 
 static bool rockchip_i2s_wr_reg(struct device *dev, unsigned int reg)
diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 48b3ecfa58b46..2aad0f309cb63 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -1120,6 +1120,7 @@ static const struct snd_soc_dai_ops rockchip_i2s_tdm_dai_ops = {
 
 static const struct snd_soc_component_driver rockchip_i2s_tdm_component = {
 	.name = DRV_NAME,
+	.legacy_dai_naming = 1,
 };
 
 static bool rockchip_i2s_tdm_wr_reg(struct device *dev, unsigned int reg)
diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index 64d9891b6434f..6d93155411b03 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -405,6 +405,7 @@ static struct snd_soc_dai_driver rockchip_pdm_dai = {
 
 static const struct snd_soc_component_driver rockchip_pdm_component = {
 	.name = "rockchip-pdm",
+	.legacy_dai_naming = 1,
 };
 
 static int rockchip_pdm_runtime_suspend(struct device *dev)
diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index d027ca4b17964..8bef572d3cbc1 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -225,6 +225,7 @@ static struct snd_soc_dai_driver rk_spdif_dai = {
 
 static const struct snd_soc_component_driver rk_spdif_component = {
 	.name = "rockchip-spdif",
+	.legacy_dai_naming = 1,
 };
 
 static bool rk_spdif_wr_reg(struct device *dev, unsigned int reg)
-- 
2.30.2

