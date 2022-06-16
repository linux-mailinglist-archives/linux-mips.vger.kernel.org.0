Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8022C54E424
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jun 2022 16:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377884AbiFPOgA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jun 2022 10:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377776AbiFPOfr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Jun 2022 10:35:47 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA5D33BA6C;
        Thu, 16 Jun 2022 07:35:41 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC07C6027888;
        Thu, 16 Jun 2022 09:34:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=7CFQF1uFAN//bgNV90FI/dawvD8nMJvY6YyL1sfuCCA=;
 b=ePnypGaimYdu2/E8otHOHksaSwEI5tFkGl6y5Fq3xzm+ht5yAmsKe9zYayduWqH2l84m
 +uSblyGRlCsz1UswsGo1JJRZIA/9cg6MImFz80nZWQQ/Rmi/houUjEOK9YPO16Twbwi7
 cgBX7LywrKgY+drQ32+vFhYGlROm0xP2UyMNV/CKGDBzpWE3bYcV0I+qg+vsUATkgh6N
 7M27SS2klufV+yIfqrkp1Y6TOwlri2kJEX6XJS4bNKvEbVVFK5T7MsftYcvWdsmBsb+5
 rTd6ciptBkUWMy5ll2o0Th4aohIInfJTIAvFb3GNfGKQRIrrxt8A3RWBU1/H8Vk8sa5R Hw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gmrf35vuu-3
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 16 Jun 2022 09:34:34 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 16 Jun 2022 15:34:30 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7E197478;
        Thu, 16 Jun 2022 14:34:30 +0000 (UTC)
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
Subject: [PATCH 07/96] ASoC: ep93xx: Migrate to new style legacy DAI naming flag
Date:   Thu, 16 Jun 2022 15:33:00 +0100
Message-ID: <20220616143429.1324494-8-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: m1riLdFR0JRu_RIVN-zzoYOQGXWc_1Al
X-Proofpoint-ORIG-GUID: m1riLdFR0JRu_RIVN-zzoYOQGXWc_1Al
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
 sound/soc/cirrus/ep93xx-ac97.c | 3 ++-
 sound/soc/cirrus/ep93xx-i2s.c  | 7 ++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/cirrus/ep93xx-ac97.c b/sound/soc/cirrus/ep93xx-ac97.c
index 16f9bb283b5cb..37593abe60532 100644
--- a/sound/soc/cirrus/ep93xx-ac97.c
+++ b/sound/soc/cirrus/ep93xx-ac97.c
@@ -355,7 +355,8 @@ static struct snd_soc_dai_driver ep93xx_ac97_dai = {
 };
 
 static const struct snd_soc_component_driver ep93xx_ac97_component = {
-	.name		= "ep93xx-ac97",
+	.name			= "ep93xx-ac97",
+	.legacy_dai_naming	= 1,
 };
 
 static int ep93xx_ac97_probe(struct platform_device *pdev)
diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index 47959794353a7..982151330c896 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -422,9 +422,10 @@ static struct snd_soc_dai_driver ep93xx_i2s_dai = {
 };
 
 static const struct snd_soc_component_driver ep93xx_i2s_component = {
-	.name		= "ep93xx-i2s",
-	.suspend	= ep93xx_i2s_suspend,
-	.resume		= ep93xx_i2s_resume,
+	.name			= "ep93xx-i2s",
+	.suspend		= ep93xx_i2s_suspend,
+	.resume			= ep93xx_i2s_resume,
+	.legacy_dai_naming	= 1,
 };
 
 static int ep93xx_i2s_probe(struct platform_device *pdev)
-- 
2.30.2

