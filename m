Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2346552D8F2
	for <lists+linux-mips@lfdr.de>; Thu, 19 May 2022 17:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241458AbiESPsh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 May 2022 11:48:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238504AbiESPqp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 May 2022 11:46:45 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FBFAC3D13;
        Thu, 19 May 2022 08:44:29 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k123002261;
        Thu, 19 May 2022 10:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=rKhvo9vVRPXr5v+65fMVjwI+21+zpA2rbws3nkqy2h0=;
 b=FIPmVU1UtkYwnK9TYlQJGNQFDoL+AZfUKxtGversk32aEoPfyE8NMqt6BqdPIc+eOY7t
 it8QU3i7rBrMVxDVrRmSrpgjvCcZION/Utz9vxrjPdffpRg1WYY/yKLuRejVYE2oJzRT
 cAYLyb1taACrUwYfOaLo0MLehJarjU3nRMDgNqwPtsKw007S6YVWPDRjeAjBW6MMYYvH
 Nl2imN/VXW21uu80awh60ki37cROx8DO9JQLW4js9UkVZwC7D8dKopOSu4doGD1253Ul
 UhXe4mgHVYxAv1mlD46Ge4kqQyNKoty+HxHjK8U36lLFgHR8OnUAefRGJoBYe7XR2mi0 mA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcg-9
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 19 May 2022 10:43:38 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Thu, 19 May 2022 16:43:21 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B34CA11DA;
        Thu, 19 May 2022 15:43:21 +0000 (UTC)
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
Subject: [PATCH 47/56] ASoC: sh: Rename set_fmt_new back to set_fmt
Date:   Thu, 19 May 2022 16:43:09 +0100
Message-ID: <20220519154318.2153729-48-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: JlK0U7KZGaPbGrThUxDZRZ398gBXTG39
X-Proofpoint-ORIG-GUID: JlK0U7KZGaPbGrThUxDZRZ398gBXTG39
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Now the core has been migrated across to the new direct clock
specification we can move the drivers back to the normal set_fmt
callback.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sh/fsi.c       | 2 +-
 sound/soc/sh/rcar/core.c | 2 +-
 sound/soc/sh/rz-ssi.c    | 2 +-
 sound/soc/sh/ssi.c       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sh/fsi.c b/sound/soc/sh/fsi.c
index 4058d60b7e931..f3edc2e3d9d7c 100644
--- a/sound/soc/sh/fsi.c
+++ b/sound/soc/sh/fsi.c
@@ -1724,7 +1724,7 @@ static const struct snd_soc_dai_ops fsi_dai_ops = {
 	.startup	= fsi_dai_startup,
 	.shutdown	= fsi_dai_shutdown,
 	.trigger	= fsi_dai_trigger,
-	.set_fmt_new	= fsi_dai_set_fmt,
+	.set_fmt	= fsi_dai_set_fmt,
 	.hw_params	= fsi_dai_hw_params,
 	.auto_selectable_formats	= &fsi_dai_formats,
 	.num_auto_selectable_formats	= 1,
diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 0ac15b74c58a8..a4180dc5a59ba 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1068,7 +1068,7 @@ static const struct snd_soc_dai_ops rsnd_soc_dai_ops = {
 	.startup	= rsnd_soc_dai_startup,
 	.shutdown	= rsnd_soc_dai_shutdown,
 	.trigger	= rsnd_soc_dai_trigger,
-	.set_fmt_new	= rsnd_soc_dai_set_fmt,
+	.set_fmt	= rsnd_soc_dai_set_fmt,
 	.set_tdm_slot	= rsnd_soc_set_dai_tdm_slot,
 	.prepare	= rsnd_soc_dai_prepare,
 	.auto_selectable_formats	= rsnd_soc_dai_formats,
diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index 0557d22a089f3..beaf1a8d6da10 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -840,7 +840,7 @@ static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
 
 static const struct snd_soc_dai_ops rz_ssi_dai_ops = {
 	.trigger	= rz_ssi_dai_trigger,
-	.set_fmt_new	= rz_ssi_dai_set_fmt,
+	.set_fmt	= rz_ssi_dai_set_fmt,
 	.hw_params	= rz_ssi_dai_hw_params,
 };
 
diff --git a/sound/soc/sh/ssi.c b/sound/soc/sh/ssi.c
index 95571cbeae296..bf7a3c69920a6 100644
--- a/sound/soc/sh/ssi.c
+++ b/sound/soc/sh/ssi.c
@@ -336,7 +336,7 @@ static const struct snd_soc_dai_ops ssi_dai_ops = {
 	.hw_params	= ssi_hw_params,
 	.set_sysclk	= ssi_set_sysclk,
 	.set_clkdiv	= ssi_set_clkdiv,
-	.set_fmt_new	= ssi_set_fmt,
+	.set_fmt	= ssi_set_fmt,
 };
 
 static struct snd_soc_dai_driver sh4_ssi_dai[] = {
-- 
2.30.2

