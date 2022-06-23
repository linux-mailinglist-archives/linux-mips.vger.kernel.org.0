Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8C8557AC9
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jun 2022 14:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbiFWMxh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jun 2022 08:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231784AbiFWMxf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Jun 2022 08:53:35 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27AD7369E6;
        Thu, 23 Jun 2022 05:53:34 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NBvlr6011978;
        Thu, 23 Jun 2022 07:52:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=uY14+QEFQEizEt6ccSxDQhzZtgLZGOD04zjlJ9Wfhgk=;
 b=gvYWDHKojyJC+jwElDfX/RM0zcyxR63/JoshYxPn3OTP45Qit1Ao1ayz/IlzfXg+MH5P
 ZEviTUq4KkeFk5/xLQavIV90bUPHJCMfruAmknaM/aifMV+wMHD03MWIFWziUUMjCUNc
 kUtzAe/c2wvYvk6cIf1lsm7F5Zu8eb9Pzv1qHK8yLWukbt/54tL/7pTizA9TQRkVlTRT
 8CVheIYqqyttUpJvLbBO/NSqr+IcpEm4+NB1JQqh3dmhGa+E9jPJ1psuFce1wctI7ahL
 HToNedQAHQutVQ/Gcsx2D5Ompi8TfA0c61si29fyQGcLWPkhQCOf7h1nvipZWEeOnhjR Yw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gsb4p6wvp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 23 Jun 2022 07:52:52 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:50 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 23 Jun 2022 13:52:50 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D4FDE478;
        Thu, 23 Jun 2022 12:52:50 +0000 (UTC)
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
Subject: [PATCH v2 01/96] ASoC: soc-component: Add legacy_dai_naming flag
Date:   Thu, 23 Jun 2022 13:51:15 +0100
Message-ID: <20220623125250.2355471-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: S0xzFDpQJeHPmvQlsg6MT6z-qdCQjCvX
X-Proofpoint-ORIG-GUID: S0xzFDpQJeHPmvQlsg6MT6z-qdCQjCvX
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Historically, the legacy DAI naming scheme was applied to platform
drivers and the newer scheme to CODEC drivers. During componentisation
the core lost the knowledge of if a driver was a CODEC or platform, they
were all now components. To continue to support the legacy naming on
older platform drivers a flag was added to the snd_soc_component_driver
structure, non_legacy_dai_naming, to indicate to use the new scheme and
this was applied to all CODECs as part of the migration.

However, a slight issue appears to be developing with respect to this
flag being opt in for the non-legacy scheme, which presumably we want to
be the primary scheme used. Many codec drivers appear to forget to
include this flag:

  grep -l -r "snd_soc_component_driver" sound/soc/codecs/*.c |
  xargs grep -L "non_legacy_dai_naming" | wc
     48      48    556

It would seem more sensible to change the flag to legacy_dai_naming
making the new scheme opt out. As a first step this patch adds a new
flag for this so that the users can be updated.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc-component.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 5c4cfa70b018c..96c2f5fffc51e 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -179,6 +179,7 @@ struct snd_soc_component_driver {
 	 * analogue).
 	 */
 	unsigned int endianness:1;
+	unsigned int legacy_dai_naming:1;
 	unsigned int non_legacy_dai_naming:1;
 
 	/* this component uses topology and ignore machine driver FEs */
-- 
2.30.2

