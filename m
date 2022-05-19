Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 259BF52D8A9
	for <lists+linux-mips@lfdr.de>; Thu, 19 May 2022 17:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241206AbiESPrH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 May 2022 11:47:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241343AbiESPqQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 May 2022 11:46:16 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 539757CDC8;
        Thu, 19 May 2022 08:44:22 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J66mWD012194;
        Thu, 19 May 2022 10:43:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=/Z3NisKONRDDwqsbgNrvbzNcgTdEM5sI3xBhMGMGjc8=;
 b=DCbl4a8NYS32iFOfURAGbmg1mgJ5vW3GgEgD7SJ20cso0BKNajDZt/iiQ49vySgD40lS
 BTcMduqUoaiD/uu4v1u122MnmLX+qgu3rjJtV4DVyNeySDkY14dWw2tQwpWjXW9EXEuD
 URB1mFLwfF+j+zmlYl+RL8XPyJW4jHCG22C9xwYrzb/n/0nmS2XkYxthKmZXTPcqty6f
 PP6XojfJ+z7yzAI/NOPDZn4XWu3exFsMS64YNyBSGrv3F4KoW8J3eDUi1Y0gsTAhqnPM
 J4175Z3xJCuUCkUruFwLi/9m1/IfZ2+gKZh1/m/55WDLRhaqwlYdf3YmBiXgQ2TWnX00 Ig== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dn-16
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 19 May 2022 10:43:39 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Thu, 19 May 2022 16:43:22 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 021C311D1;
        Thu, 19 May 2022 15:43:22 +0000 (UTC)
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
Subject: [PATCH 51/56] ASoC: test-component: Rename set_fmt_new back to set_fmt
Date:   Thu, 19 May 2022 16:43:13 +0100
Message-ID: <20220519154318.2153729-52-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: mF-rk-cpVUBWDbr5fNugLebouucnJEVa
X-Proofpoint-ORIG-GUID: mF-rk-cpVUBWDbr5fNugLebouucnJEVa
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
 sound/soc/generic/test-component.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index 3a992a6eba9bb..d28712fabe3f6 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -210,7 +210,7 @@ static u64 test_dai_formats =
 	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
 
 static const struct snd_soc_dai_ops test_ops = {
-	.set_fmt_new		= test_dai_set_fmt,
+	.set_fmt		= test_dai_set_fmt,
 	.startup		= test_dai_startup,
 	.shutdown		= test_dai_shutdown,
 	.auto_selectable_formats	= &test_dai_formats,
@@ -221,7 +221,7 @@ static const struct snd_soc_dai_ops test_verbose_ops = {
 	.set_sysclk		= test_dai_set_sysclk,
 	.set_pll		= test_dai_set_pll,
 	.set_clkdiv		= test_dai_set_clkdiv,
-	.set_fmt_new		= test_dai_set_fmt,
+	.set_fmt		= test_dai_set_fmt,
 	.mute_stream		= test_dai_mute_stream,
 	.startup		= test_dai_startup,
 	.shutdown		= test_dai_shutdown,
-- 
2.30.2

