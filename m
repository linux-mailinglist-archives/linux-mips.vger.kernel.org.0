Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4DC5557BB2
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jun 2022 14:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232075AbiFWMyl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jun 2022 08:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232035AbiFWMyg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Jun 2022 08:54:36 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34AAF42A15;
        Thu, 23 Jun 2022 05:54:36 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NAKUt5006859;
        Thu, 23 Jun 2022 07:53:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=IRJFhcj+htr8j8A51xKsCTuIkZGBefkGMm7EkX0r/Yg=;
 b=X6AHZDHUi32P1Pya6Lf1nAVxQ+D0bLSdsb2TUYAKQaV2WlfJM0mL/72+xON73WjMbgfW
 VNbKkYlfPdxT9a7PIfsWU8FYvxDTaSJLz+7lWEhHQLs8htjseGZowWoTovb27zsu1mFO
 4rxJ8dOEGlgsiEcFrPvMHYCYiSRPBCTTWuudj7uqSZWFMgZL9P8SXUTgWVZrD1+F9NQy
 YIVoTalhQivUOZuBeJhgqsauiC0m45hrZ5bMOulhlmJTnwHjNWSl3/xZGsRLDkndWKDN
 rPicPIUIzt7n3QmYJPRDYwj2MgVigHTssYgadopFNECm9keAMxVB7AvBGFsfdiyPonMV ug== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41fa4u-4
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
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9CB7711D1;
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
Subject: [PATCH v2 44/96] ASoC: topology: KUnit: Remove now redundant non_legacy_dai_naming flag
Date:   Thu, 23 Jun 2022 13:51:58 +0100
Message-ID: <20220623125250.2355471-45-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: GtvL_AZVvXuE77-O9X0l-x3NYt0RlWyb
X-Proofpoint-ORIG-GUID: GtvL_AZVvXuE77-O9X0l-x3NYt0RlWyb
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
 sound/soc/soc-topology-test.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index 225d743559741..3acd42a288d6c 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -104,7 +104,6 @@ static const struct snd_soc_component_driver test_component = {
 	.name = "sound-soc-topology-test",
 	.probe = d_probe,
 	.remove = d_remove,
-	.non_legacy_dai_naming = 1,
 };
 
 /* ===== TOPOLOGY TEMPLATES ================================================= */
@@ -238,7 +237,6 @@ static int d_probe_null_comp(struct snd_soc_component *component)
 static const struct snd_soc_component_driver test_component_null_comp = {
 	.name = "sound-soc-topology-test",
 	.probe = d_probe_null_comp,
-	.non_legacy_dai_naming = 1,
 };
 
 static void snd_soc_tplg_test_load_with_null_comp(struct kunit *test)
@@ -344,7 +342,6 @@ static int d_probe_null_fw(struct snd_soc_component *component)
 static const struct snd_soc_component_driver test_component_null_fw = {
 	.name = "sound-soc-topology-test",
 	.probe = d_probe_null_fw,
-	.non_legacy_dai_naming = 1,
 };
 
 static void snd_soc_tplg_test_load_with_null_fw(struct kunit *test)
-- 
2.30.2

