Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B02B52D8A0
	for <lists+linux-mips@lfdr.de>; Thu, 19 May 2022 17:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239613AbiESPq7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 May 2022 11:46:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241150AbiESPqM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 May 2022 11:46:12 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B90C5D669;
        Thu, 19 May 2022 08:44:19 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k11l002261;
        Thu, 19 May 2022 10:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=iD7IdaADaZKm5Uf70oqcAnHMJaLJ4BQnPHz9AoPIIeY=;
 b=QMABav7q1bi3lupFCvjwMSAaDfpEMv4GDmGS+mHiyMEs/xXTJcHgM0m6ngX/ojwNKk78
 DQ/+etWHIvCAd43+fYb7dl2NlQYTi1W+fKdRSAmADlyGQov8GAex8HP3QV4a3P6ktihr
 wcuijAnnT5B+Ni4tXGS03XR6IriOzla7ddNvXh4+Gc1KN5eueo0rLxQdKCk1B0pzce7Q
 0iX0mWXVfoEYAfkOxqcCwq/nA8xPtftgUXg6MiON8zmS0ZIWPQTYXS9YwXRjQ1T+BUCY
 HkvupMShxNaWO3Z2m4/1JAciwKjvCfAJ09RPJ4CUsfk08SGOdC+7HxqyDE9yB707mcxP wQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 19 May 2022 10:43:22 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:18 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Thu, 19 May 2022 16:43:18 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A0CAB11D3;
        Thu, 19 May 2022 15:43:18 +0000 (UTC)
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
Subject: [PATCH 04/56] ASoC: au1x: Update to use set_fmt_new callback
Date:   Thu, 19 May 2022 16:42:26 +0100
Message-ID: <20220519154318.2153729-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 0oVtGFU5FK9rPm57juQgQwWdRbWT9Ugo
X-Proofpoint-ORIG-GUID: 0oVtGFU5FK9rPm57juQgQwWdRbWT9Ugo
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

As part of updating the core to directly tell drivers if they are clock
provider or consumer update these CPU side drivers to use the new direct
callback.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/au1x/i2sc.c    | 4 ++--
 sound/soc/au1x/psc-i2s.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/au1x/i2sc.c b/sound/soc/au1x/i2sc.c
index 740d4e052e4df..72f16b7fda3e9 100644
--- a/sound/soc/au1x/i2sc.c
+++ b/sound/soc/au1x/i2sc.c
@@ -121,7 +121,7 @@ static int au1xi2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 
 	/* I2S controller only supports provider */
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBC_CFC:	/* CODEC consumer */
+	case SND_SOC_DAIFMT_BP_FP:	/* CODEC consumer */
 		break;
 	default:
 		goto out;
@@ -206,7 +206,7 @@ static const struct snd_soc_dai_ops au1xi2s_dai_ops = {
 	.startup	= au1xi2s_startup,
 	.trigger	= au1xi2s_trigger,
 	.hw_params	= au1xi2s_hw_params,
-	.set_fmt	= au1xi2s_set_fmt,
+	.set_fmt_new	= au1xi2s_set_fmt,
 };
 
 static struct snd_soc_dai_driver au1xi2s_dai_driver = {
diff --git a/sound/soc/au1x/psc-i2s.c b/sound/soc/au1x/psc-i2s.c
index b2b8896bb593c..d82c1353f2f09 100644
--- a/sound/soc/au1x/psc-i2s.c
+++ b/sound/soc/au1x/psc-i2s.c
@@ -91,10 +91,10 @@ static int au1xpsc_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBP_CFP:	/* CODEC provider */
+	case SND_SOC_DAIFMT_BC_FC:	/* CODEC provider */
 		ct |= PSC_I2SCFG_MS;	/* PSC I2S consumer mode */
 		break;
-	case SND_SOC_DAIFMT_CBC_CFC:	/* CODEC consumer */
+	case SND_SOC_DAIFMT_BP_FP:	/* CODEC consumer */
 		ct &= ~PSC_I2SCFG_MS;	/* PSC I2S provider mode */
 		break;
 	default:
@@ -266,7 +266,7 @@ static const struct snd_soc_dai_ops au1xpsc_i2s_dai_ops = {
 	.startup	= au1xpsc_i2s_startup,
 	.trigger	= au1xpsc_i2s_trigger,
 	.hw_params	= au1xpsc_i2s_hw_params,
-	.set_fmt	= au1xpsc_i2s_set_fmt,
+	.set_fmt_new	= au1xpsc_i2s_set_fmt,
 };
 
 static const struct snd_soc_dai_driver au1xpsc_i2s_dai_template = {
-- 
2.30.2

