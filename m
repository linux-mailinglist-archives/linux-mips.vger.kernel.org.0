Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8611B54E488
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jun 2022 16:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377832AbiFPOgS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jun 2022 10:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377839AbiFPOfw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Jun 2022 10:35:52 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62FD72E9D3;
        Thu, 16 Jun 2022 07:35:51 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25G8o9fU009500;
        Thu, 16 Jun 2022 09:34:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=7Bq72ssSzXzMAew0ncbg3wMXNO2cUCX44WTWYkeLRvQ=;
 b=BiT1cvmesTpfC/F+GuVyaI8Bw/Ia8nCVvunWSXpGHNGaBYtlmG3X1G7kX9e8tJupeUad
 9AiwR9qwTF6ax01HsKkNPn8oktzNubgGRC/Guspoca1IEw01kPotqZL4EOd0WJBfEHB8
 OduyKDMTScRCOv56wmz/7eTs/vNisgqYVgFwjioQCH157l20rcXSlb8jZno5Si68CBx3
 T0djO159kb/75EVc7aDdk14RRkkDrfzyNzaxd02Mw+u1QFJ5I533/pbRWoqgAVdAs1tB
 6zWbNA8cJJEPA8lGp3nPHPua+XP4vBvpghMsgRb2N4LI6zi4daxoIN3Yrp/O3atqPA7P CQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq5w3u-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 16 Jun 2022 09:34:48 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:35 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 16 Jun 2022 15:34:35 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F120511D3;
        Thu, 16 Jun 2022 14:34:34 +0000 (UTC)
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
Subject: [PATCH 64/96] ASoC: uda*: Remove now redundant non_legacy_dai_naming flag
Date:   Thu, 16 Jun 2022 15:33:57 +0100
Message-ID: <20220616143429.1324494-65-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Q2UALWv1XkgCyNtTjiBPLr8xrjOLWyAa
X-Proofpoint-GUID: Q2UALWv1XkgCyNtTjiBPLr8xrjOLWyAa
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
 sound/soc/codecs/uda1334.c | 1 -
 sound/soc/codecs/uda134x.c | 1 -
 sound/soc/codecs/uda1380.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/sound/soc/codecs/uda1334.c b/sound/soc/codecs/uda1334.c
index 9d5ed34e54204..eace965336003 100644
--- a/sound/soc/codecs/uda1334.c
+++ b/sound/soc/codecs/uda1334.c
@@ -236,7 +236,6 @@ static const struct snd_soc_component_driver soc_component_dev_uda1334 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct of_device_id uda1334_of_match[] = {
diff --git a/sound/soc/codecs/uda134x.c b/sound/soc/codecs/uda134x.c
index 037833c509f70..2db3d8a60c7a0 100644
--- a/sound/soc/codecs/uda134x.c
+++ b/sound/soc/codecs/uda134x.c
@@ -527,7 +527,6 @@ static const struct snd_soc_component_driver soc_component_dev_uda134x = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config uda134x_regmap_config = {
diff --git a/sound/soc/codecs/uda1380.c b/sound/soc/codecs/uda1380.c
index b5004842520bf..fdaaee845176e 100644
--- a/sound/soc/codecs/uda1380.c
+++ b/sound/soc/codecs/uda1380.c
@@ -736,7 +736,6 @@ static const struct snd_soc_component_driver soc_component_dev_uda1380 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int uda1380_i2c_probe(struct i2c_client *i2c)
-- 
2.30.2

