Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 502AA557C16
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jun 2022 14:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232126AbiFWM4R (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jun 2022 08:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232130AbiFWM4Q (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Jun 2022 08:56:16 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EBF84AE1E;
        Thu, 23 Jun 2022 05:56:13 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NBvlrK011978;
        Thu, 23 Jun 2022 07:53:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=rKzBw62X0FKPJT/o0h8GzZ/Zi9TWVvhHqxnovZBRfSk=;
 b=XsQ/SXNkTP7sGJPxI2rGT2nFOeKw2hTStVOBXneunTPQPqassv/BcNPtcqocYDtGhpSi
 aiEuzRPCiFctDEq+7/kExBG7HrVz5n9X5B2L8OO+U5fGhd0emv873EnYKekmFvJcKxG+
 G1CHdTf7Xb/I/biWeluoGxcXwp2z/XXhuuURHOecREMLYngSgQ1B5KWOIb+GuJGntDTU
 9+dks+rgyunzEsV4OJ7XDTR+2afhUgsdA0hpr/uOZX6U6IwihPO4my4I9J7KzIOwAvJu
 5KgBmnSR1rxJso5g9TOOOKoLx56bJA0+rctcninmMzA/798O8QQllpK4iEBNdU7hh4wn BA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gsb4p6wvp-15
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 23 Jun 2022 07:53:03 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:54 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 23 Jun 2022 13:52:54 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 724A511D3;
        Thu, 23 Jun 2022 12:52:54 +0000 (UTC)
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
Subject: [PATCH v2 42/96] ASoC: tegra: Remove now redundant non_legacy_dai_naming flag
Date:   Thu, 23 Jun 2022 13:51:56 +0100
Message-ID: <20220623125250.2355471-43-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: -WBaHKD_lPVP8zd7_EAL9HtjbqAfq0_N
X-Proofpoint-ORIG-GUID: -WBaHKD_lPVP8zd7_EAL9HtjbqAfq0_N
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
 sound/soc/tegra/tegra210_i2s.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index 01c76ba36e1ac..39ffa4d76b593 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -803,7 +803,6 @@ static const struct snd_soc_component_driver tegra210_i2s_cmpnt = {
 	.num_dapm_routes	= ARRAY_SIZE(tegra210_i2s_routes),
 	.controls		= tegra210_i2s_controls,
 	.num_controls		= ARRAY_SIZE(tegra210_i2s_controls),
-	.non_legacy_dai_naming	= 1,
 };
 
 static bool tegra210_i2s_wr_reg(struct device *dev, unsigned int reg)
-- 
2.30.2

