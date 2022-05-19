Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE4C252D88F
	for <lists+linux-mips@lfdr.de>; Thu, 19 May 2022 17:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240490AbiESPqp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 May 2022 11:46:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238438AbiESPp7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 May 2022 11:45:59 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDD737CB1E;
        Thu, 19 May 2022 08:44:17 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J66mW7012194;
        Thu, 19 May 2022 10:43:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=0izqi8NBRaF340qivz0d9/CZYqNOou8aIl/HCv5U0cs=;
 b=lEJw5cwMhbPWVQSN0JyY0ObRrpwQQelzODv3n9IvH7QK+jomjAvNWpPIWN5QysSBKMa1
 Mq4t0jmWw1BzJPaQyaGDHHabAZnlQQlTWgqg1KbaHggnpRwOL2aDwcmDXt/Tk561dlS/
 V/1/NWfq9sHuRmSJ5bnxFSUbqO2Derq9i4AMBki+7HWSNLDa8VcznW7tAg7ZKoYu+Cid
 OIb8T5bsf1RPuAm7VVcG8ntlC1ZdioBnSnTybSx5/KnZehZcXsxJuin194oRcVQYlH+J
 PCDbO9fXClZsBH/1VpQR6gWSY2dgNP2HLD6J4gDyIS4eFARSsIuhJ/cQKJzAOiUHVi3t yw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dn-10
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 19 May 2022 10:43:34 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Thu, 19 May 2022 16:43:20 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A66D711D3;
        Thu, 19 May 2022 15:43:20 +0000 (UTC)
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
Subject: [PATCH 32/56] ASoC: bcm: Rename set_fmt_new back to set_fmt
Date:   Thu, 19 May 2022 16:42:54 +0100
Message-ID: <20220519154318.2153729-33-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: c9plG5cow3MRz3odEjKvsVrUDqurwwph
X-Proofpoint-ORIG-GUID: c9plG5cow3MRz3odEjKvsVrUDqurwwph
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
 sound/soc/bcm/bcm2835-i2s.c | 2 +-
 sound/soc/bcm/cygnus-ssp.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/bcm/bcm2835-i2s.c b/sound/soc/bcm/bcm2835-i2s.c
index aa7d8e081f89a..e39c8d9f40995 100644
--- a/sound/soc/bcm/bcm2835-i2s.c
+++ b/sound/soc/bcm/bcm2835-i2s.c
@@ -743,7 +743,7 @@ static const struct snd_soc_dai_ops bcm2835_i2s_dai_ops = {
 	.prepare	= bcm2835_i2s_prepare,
 	.trigger	= bcm2835_i2s_trigger,
 	.hw_params	= bcm2835_i2s_hw_params,
-	.set_fmt_new	= bcm2835_i2s_set_dai_fmt,
+	.set_fmt	= bcm2835_i2s_set_dai_fmt,
 	.set_bclk_ratio	= bcm2835_i2s_set_dai_bclk_ratio,
 	.set_tdm_slot	= bcm2835_i2s_set_dai_tdm_slot,
 };
diff --git a/sound/soc/bcm/cygnus-ssp.c b/sound/soc/bcm/cygnus-ssp.c
index 257f3657bcd6e..4bfa2d715ff4d 100644
--- a/sound/soc/bcm/cygnus-ssp.c
+++ b/sound/soc/bcm/cygnus-ssp.c
@@ -1148,7 +1148,7 @@ static const struct snd_soc_dai_ops cygnus_ssp_dai_ops = {
 	.shutdown	= cygnus_ssp_shutdown,
 	.trigger	= cygnus_ssp_trigger,
 	.hw_params	= cygnus_ssp_hw_params,
-	.set_fmt_new	= cygnus_ssp_set_fmt,
+	.set_fmt	= cygnus_ssp_set_fmt,
 	.set_sysclk	= cygnus_ssp_set_sysclk,
 	.set_tdm_slot	= cygnus_set_dai_tdm_slot,
 };
-- 
2.30.2

