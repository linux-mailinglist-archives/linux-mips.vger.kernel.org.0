Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00E6954E51E
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jun 2022 16:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377678AbiFPOlf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jun 2022 10:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbiFPOle (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Jun 2022 10:41:34 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D5CF45AFD;
        Thu, 16 Jun 2022 07:41:33 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC07CF027888;
        Thu, 16 Jun 2022 09:34:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=QOfuAT4opaQnGN4l3F7a/ekhy562k9SkJ4H9CFLqgJc=;
 b=gsyVEE5vjk/SPn6uZApJO4ZAWx4GqHhPRrIYYWurRE8cpj5RngDXNmg8NLRXRUnG+o5h
 R4D7/Yajp1eyz2ms3z/+jdkbjH679P+q23PSjkufoy4+yaI2Jp7doLdI2fzFGTXhR3p+
 zHUS4IG7rAG76ugZ7N6x77xhrSj3cH8V6tCp2PZLdqnXbrZoWQD3dLwRSfd/5jX/x55/
 aw60EqUcj2g80/BMMTb3nMDcgGXQtAMHfHNHF4OeY3LQOZJbPIWXxpXIcL8NDZC+8TO2
 pTsuW4p8oCQMUrOvWQKiDBsqtTZd49HEDhI5vqHzMCUNx82+UXmlrIKF+hjPsacqDXdy Xw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gmrf35vuu-12
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 16 Jun 2022 09:34:41 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 16 Jun 2022 15:34:32 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2FC5811DA;
        Thu, 16 Jun 2022 14:34:32 +0000 (UTC)
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
Subject: [PATCH 28/96] ASoC: pxa: Migrate to new style legacy DAI naming flag
Date:   Thu, 16 Jun 2022 15:33:21 +0100
Message-ID: <20220616143429.1324494-29-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 4w4lVN3eXif12lQ6eqdKAmtSagwuJlo3
X-Proofpoint-ORIG-GUID: 4w4lVN3eXif12lQ6eqdKAmtSagwuJlo3
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
 sound/soc/pxa/mmp-sspa.c   |  9 +++++----
 sound/soc/pxa/pxa-ssp.c    | 21 +++++++++++----------
 sound/soc/pxa/pxa2xx-i2s.c | 21 +++++++++++----------
 3 files changed, 27 insertions(+), 24 deletions(-)

diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index 382e9d8608a3f..fb5a4390443fe 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -456,10 +456,11 @@ static int mmp_sspa_close(struct snd_soc_component *component,
 }
 
 static const struct snd_soc_component_driver mmp_sspa_component = {
-	.name		= "mmp-sspa",
-	.mmap		= mmp_pcm_mmap,
-	.open		= mmp_sspa_open,
-	.close		= mmp_sspa_close,
+	.name			= "mmp-sspa",
+	.mmap			= mmp_pcm_mmap,
+	.open			= mmp_sspa_open,
+	.close			= mmp_sspa_close,
+	.legacy_dai_naming	= 1,
 };
 
 static int asoc_mmp_sspa_probe(struct platform_device *pdev)
diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index 0f504a9f4983d..430dd446321e5 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -848,16 +848,17 @@ static struct snd_soc_dai_driver pxa_ssp_dai = {
 };
 
 static const struct snd_soc_component_driver pxa_ssp_component = {
-	.name		= "pxa-ssp",
-	.pcm_construct	= pxa2xx_soc_pcm_new,
-	.open		= pxa2xx_soc_pcm_open,
-	.close		= pxa2xx_soc_pcm_close,
-	.hw_params	= pxa2xx_soc_pcm_hw_params,
-	.prepare	= pxa2xx_soc_pcm_prepare,
-	.trigger	= pxa2xx_soc_pcm_trigger,
-	.pointer	= pxa2xx_soc_pcm_pointer,
-	.suspend	= pxa_ssp_suspend,
-	.resume		= pxa_ssp_resume,
+	.name			= "pxa-ssp",
+	.pcm_construct		= pxa2xx_soc_pcm_new,
+	.open			= pxa2xx_soc_pcm_open,
+	.close			= pxa2xx_soc_pcm_close,
+	.hw_params		= pxa2xx_soc_pcm_hw_params,
+	.prepare		= pxa2xx_soc_pcm_prepare,
+	.trigger		= pxa2xx_soc_pcm_trigger,
+	.pointer		= pxa2xx_soc_pcm_pointer,
+	.suspend		= pxa_ssp_suspend,
+	.resume			= pxa_ssp_resume,
+	.legacy_dai_naming	= 1,
 };
 
 #ifdef CONFIG_OF
diff --git a/sound/soc/pxa/pxa2xx-i2s.c b/sound/soc/pxa/pxa2xx-i2s.c
index ffcf44e4dc8c0..3e4c704036722 100644
--- a/sound/soc/pxa/pxa2xx-i2s.c
+++ b/sound/soc/pxa/pxa2xx-i2s.c
@@ -355,16 +355,17 @@ static struct snd_soc_dai_driver pxa_i2s_dai = {
 };
 
 static const struct snd_soc_component_driver pxa_i2s_component = {
-	.name		= "pxa-i2s",
-	.pcm_construct	= pxa2xx_soc_pcm_new,
-	.open		= pxa2xx_soc_pcm_open,
-	.close		= pxa2xx_soc_pcm_close,
-	.hw_params	= pxa2xx_soc_pcm_hw_params,
-	.prepare	= pxa2xx_soc_pcm_prepare,
-	.trigger	= pxa2xx_soc_pcm_trigger,
-	.pointer	= pxa2xx_soc_pcm_pointer,
-	.suspend	= pxa2xx_soc_pcm_suspend,
-	.resume		= pxa2xx_soc_pcm_resume,
+	.name			= "pxa-i2s",
+	.pcm_construct		= pxa2xx_soc_pcm_new,
+	.open			= pxa2xx_soc_pcm_open,
+	.close			= pxa2xx_soc_pcm_close,
+	.hw_params		= pxa2xx_soc_pcm_hw_params,
+	.prepare		= pxa2xx_soc_pcm_prepare,
+	.trigger		= pxa2xx_soc_pcm_trigger,
+	.pointer		= pxa2xx_soc_pcm_pointer,
+	.suspend		= pxa2xx_soc_pcm_suspend,
+	.resume			= pxa2xx_soc_pcm_resume,
+	.legacy_dai_naming	= 1,
 };
 
 static int pxa2xx_i2s_drv_probe(struct platform_device *pdev)
-- 
2.30.2

