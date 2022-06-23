Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64278557ADC
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jun 2022 14:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbiFWMxl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jun 2022 08:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231346AbiFWMxk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Jun 2022 08:53:40 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69F803F32C;
        Thu, 23 Jun 2022 05:53:39 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NBNlqa015665;
        Thu, 23 Jun 2022 07:52:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=8CQSKjmzsDlZ0wmGn5pCtMbuJN3c/eN6aYD6PAfwFwE=;
 b=JtFi91kATmVFFGml8/LhmeJzG9azkzoJA0iAIfLiQ6G7pghrm+Ovq3F0ICg3nWLPH271
 iP/372rvNjpEbSyFaCfc+73+HLYFohlqQnGzLqK6JxF7UmBWSQS4Au0hbikgZJ/s5e5x
 N1WfTuWr1C19wSY1ArNlsRF1Gpb4qup7kDVuE2aK/qJlN3x+xpmc99Pquikolhz2BBgy
 LcOedzUTBrUqtWxNH26fslnxil5dxTMlgA6pdt3HdZcXoiCZx3zPzSAZWZiuxYwgvoW/
 sLu+98OOGkmIJEptpS1i0iSh2hVYg2wvR6DbJq0UM7jy/Olb9aSiZA4JwZKFnQKHVgRJ Xw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41fa4j-7
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 23 Jun 2022 07:52:58 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:51 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 23 Jun 2022 13:52:51 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CBC35475;
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
Subject: [PATCH v2 13/96] ASoC: xilinx: Migrate to new style legacy DAI naming flag
Date:   Thu, 23 Jun 2022 13:51:27 +0100
Message-ID: <20220623125250.2355471-14-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: RB_-CC6Ip80RPjievzV-rQ9YjtxMKWN4
X-Proofpoint-ORIG-GUID: RB_-CC6Ip80RPjievzV-rQ9YjtxMKWN4
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
 sound/soc/xilinx/xlnx_formatter_pcm.c | 16 ++++++++--------
 sound/soc/xilinx/xlnx_i2s.c           |  1 +
 sound/soc/xilinx/xlnx_spdif.c         |  1 +
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 5c4158069a5a8..f5ac0aa312d6e 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -575,14 +575,14 @@ static int xlnx_formatter_pcm_new(struct snd_soc_component *component,
 }
 
 static const struct snd_soc_component_driver xlnx_asoc_component = {
-	.name		= DRV_NAME,
-	.set_sysclk	= xlnx_formatter_set_sysclk,
-	.open		= xlnx_formatter_pcm_open,
-	.close		= xlnx_formatter_pcm_close,
-	.hw_params	= xlnx_formatter_pcm_hw_params,
-	.trigger	= xlnx_formatter_pcm_trigger,
-	.pointer	= xlnx_formatter_pcm_pointer,
-	.pcm_construct	= xlnx_formatter_pcm_new,
+	.name			= DRV_NAME,
+	.set_sysclk		= xlnx_formatter_set_sysclk,
+	.open			= xlnx_formatter_pcm_open,
+	.close			= xlnx_formatter_pcm_close,
+	.hw_params		= xlnx_formatter_pcm_hw_params,
+	.trigger		= xlnx_formatter_pcm_trigger,
+	.pointer		= xlnx_formatter_pcm_pointer,
+	.pcm_construct		= xlnx_formatter_pcm_new,
 };
 
 static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
diff --git a/sound/soc/xilinx/xlnx_i2s.c b/sound/soc/xilinx/xlnx_i2s.c
index 4cc6ee7c81a32..9de92d35e30ee 100644
--- a/sound/soc/xilinx/xlnx_i2s.c
+++ b/sound/soc/xilinx/xlnx_i2s.c
@@ -158,6 +158,7 @@ static const struct snd_soc_dai_ops xlnx_i2s_dai_ops = {
 
 static const struct snd_soc_component_driver xlnx_i2s_component = {
 	.name = DRV_NAME,
+	.legacy_dai_naming = 1,
 };
 
 static const struct of_device_id xlnx_i2s_of_match[] = {
diff --git a/sound/soc/xilinx/xlnx_spdif.c b/sound/soc/xilinx/xlnx_spdif.c
index cba0e868a7d77..7342048e98751 100644
--- a/sound/soc/xilinx/xlnx_spdif.c
+++ b/sound/soc/xilinx/xlnx_spdif.c
@@ -226,6 +226,7 @@ static struct snd_soc_dai_driver xlnx_spdif_rx_dai = {
 
 static const struct snd_soc_component_driver xlnx_spdif_component = {
 	.name = "xlnx-spdif",
+	.legacy_dai_naming = 1,
 };
 
 static const struct of_device_id xlnx_spdif_of_match[] = {
-- 
2.30.2

