Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 313D3557C13
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jun 2022 14:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232003AbiFWM4Q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jun 2022 08:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232082AbiFWM4O (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Jun 2022 08:56:14 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7C834B84D;
        Thu, 23 Jun 2022 05:56:12 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NBvlrD011978;
        Thu, 23 Jun 2022 07:52:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=TTe/CecmY+9QKzBX8S0Rj3j8y6EEdzCLr8WaNNo1SnQ=;
 b=bh9RDLptrDmcxbWFrZly6hCxC1g8IcmDj5vmmDNsXZ+E3MPs9GYM5d/V2hr2a5bvFh+K
 bBI5WWwgsypbigEtd0rcYjeitEJRhW5onaLWsRcbvchjYDG+MK6dTUHSFJLwyCzYXMts
 IfQAplk8CJ3+dFWd4ThF/hDRErK1Me/4Cj3k2xYzsfRKF+0qhQploS2GGLLmDXzyLYwH
 09SHG9+fwisSBmRhL3SFXfBmTF9FOt7/bvT0HgTuOHeX/sq0PIpmcu4imK+qUUHqhTFW
 G56mddyuMfcb7GjzF+sDFaPM4tUTKP7AIFZnyo3avKitnFlkC7T7wTNKWSUnTjVHptF8 EA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gsb4p6wvp-8
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 23 Jun 2022 07:52:57 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:52 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 23 Jun 2022 13:52:52 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9DBC611D3;
        Thu, 23 Jun 2022 12:52:52 +0000 (UTC)
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
Subject: [PATCH v2 21/96] ASoC: xtensa: Migrate to new style legacy DAI naming flag
Date:   Thu, 23 Jun 2022 13:51:35 +0100
Message-ID: <20220623125250.2355471-22-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: UT8f1XYJ0y16Uxm3jG1UZFGszERJpkcF
X-Proofpoint-ORIG-GUID: UT8f1XYJ0y16Uxm3jG1UZFGszERJpkcF
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
This driver appears to be on the CPU side of the DAI link and
currently uses the legacy naming, so add the new flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/xtensa/xtfpga-i2s.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/sound/soc/xtensa/xtfpga-i2s.c b/sound/soc/xtensa/xtfpga-i2s.c
index 8bd1215460327..a8f156540b500 100644
--- a/sound/soc/xtensa/xtfpga-i2s.c
+++ b/sound/soc/xtensa/xtfpga-i2s.c
@@ -475,13 +475,14 @@ static int xtfpga_pcm_new(struct snd_soc_component *component,
 }
 
 static const struct snd_soc_component_driver xtfpga_i2s_component = {
-	.name		= DRV_NAME,
-	.open		= xtfpga_pcm_open,
-	.close		= xtfpga_pcm_close,
-	.hw_params	= xtfpga_pcm_hw_params,
-	.trigger	= xtfpga_pcm_trigger,
-	.pointer	= xtfpga_pcm_pointer,
-	.pcm_construct	= xtfpga_pcm_new,
+	.name			= DRV_NAME,
+	.open			= xtfpga_pcm_open,
+	.close			= xtfpga_pcm_close,
+	.hw_params		= xtfpga_pcm_hw_params,
+	.trigger		= xtfpga_pcm_trigger,
+	.pointer		= xtfpga_pcm_pointer,
+	.pcm_construct		= xtfpga_pcm_new,
+	.legacy_dai_naming	= 1,
 };
 
 static const struct snd_soc_dai_ops xtfpga_i2s_dai_ops = {
-- 
2.30.2

