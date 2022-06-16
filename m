Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67C9254E4E0
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jun 2022 16:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378020AbiFPOgt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jun 2022 10:36:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377987AbiFPOgd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Jun 2022 10:36:33 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE3A741F89;
        Thu, 16 Jun 2022 07:36:31 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GBnCaJ029573;
        Thu, 16 Jun 2022 09:34:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=pegSxtOZ7hZAj9be6+/V4N+XKOuT0blcj+lgGm/cmy0=;
 b=QBjiVDCsAHsv4TciR8boZqoLxZc23QtRETg0UGR6efucWOxSsSKBIdMVdd/qcSsL/b4x
 dN6AC4y3lh2A/82DfvPw2ckASNgx51YByQZREnv2wFwHxtpy9AwJBxyylLuurssr1h0i
 IKWZOgeK5ksbWIJhyL267RF6qRsjK75vuEadBBC0IJVFsAt+dyrHGHjBB097/Tfg+mP2
 98EWFioIDeWhn9iTbFmK9FI5vzpiRNVcbChVXkra1VPxrVo8ofjJqVpppy+cYReZJ2lL
 uUlG348goPCAl1K258BsN0bI7ZVb69TUozWpUKKylSdAL5nFH4+zPBtG9W4DsK4QYBRr iA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq5w3m-3
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
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 45C2611D3;
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
Subject: [PATCH 29/96] ASoC: sof: Migrate to new style legacy DAI naming flag
Date:   Thu, 16 Jun 2022 15:33:22 +0100
Message-ID: <20220616143429.1324494-30-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: k7p1o1S_eandFXBuaHEdqGJQEltQ16nR
X-Proofpoint-GUID: k7p1o1S_eandFXBuaHEdqGJQEltQ16nR
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
 sound/soc/sof/pcm.c               | 2 ++
 sound/soc/sof/sof-client-probes.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index a76d0b5b2ad95..165aceef13f8e 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -671,4 +671,6 @@ void snd_sof_new_platform_drv(struct snd_sof_dev *sdev)
 
 	 /* increment module refcount when a pcm is opened */
 	pd->module_get_upon_open = 1;
+
+	pd->legacy_dai_naming = 1;
 }
diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index 34e6bd356e717..1f1ea93a7fbf3 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -667,6 +667,7 @@ static const struct snd_soc_component_driver sof_probes_component = {
 	.name = "sof-probes-component",
 	.compress_ops = &sof_probes_compressed_ops,
 	.module_get_upon_open = 1,
+	.legacy_dai_naming = 1,
 };
 
 SND_SOC_DAILINK_DEF(dummy, DAILINK_COMP_ARRAY(COMP_DUMMY()));
-- 
2.30.2

