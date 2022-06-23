Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA7855576D8
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jun 2022 11:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbiFWJl1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jun 2022 05:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbiFWJlY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Jun 2022 05:41:24 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 808C449909;
        Thu, 23 Jun 2022 02:41:23 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25N7fLsF004327;
        Thu, 23 Jun 2022 04:39:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=i32Dkqu6yqHdJkz3oPGSblt6FxDAn2yx5mHso4uT6jY=;
 b=nIE3n9kDrMoH4e/LAawz+RzUC2VoQWASFOauN4tM5A1H8JMc8tTXY2cVBGOwMqIrQM6K
 STuS8s6JFijovnai1W2MNLfVUjobxH6CViDtDBBPJUDXBmHrZJCFNVYS9HIj6iGziz+r
 VnKUwYrgOKvFYjTYgJ7g8SHsa+TlwYy2/uQ+7BQ2M5FiknT1aLaBacYmzVf4gZibj1KF
 +x6MXDk3uwUf66jBJA5uO/c3MJHdGz1TvkpWGO+3eq+mJ5MeXOg5XvUPhCzW0RdI3EaW
 UeEhW8dhlBiL29hjgLxwPY+qxBlb9eORf5BQNruocf4tI6GNJ6GP/Mzs9siqoEV7xXtG sA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gsb4p6jm6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 23 Jun 2022 04:39:52 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 10:39:51 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 23 Jun 2022 10:39:51 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1797D11D1;
        Thu, 23 Jun 2022 09:39:51 +0000 (UTC)
Date:   Thu, 23 Jun 2022 09:39:51 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     kernel test robot <lkp@intel.com>
CC:     <broonie@kernel.org>, <kbuild-all@lists.01.org>,
        <lgirdwood@gmail.com>, <kuninori.morimoto.gx@renesas.com>,
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
        <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 27/96] ASoC: au1x: Migrate to new style legacy DAI naming
 flag
Message-ID: <20220623093951.GG38351@ediswmail.ad.cirrus.com>
References: <20220616143429.1324494-28-ckeepax@opensource.cirrus.com>
 <202206230910.wUXKFP3z-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202206230910.wUXKFP3z-lkp@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: ngGGSOCW3HD7Nqksfbnzki1Fx-Dv9wmS
X-Proofpoint-ORIG-GUID: ngGGSOCW3HD7Nqksfbnzki1Fx-Dv9wmS
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jun 23, 2022 at 09:59:06AM +0800, kernel test robot wrote:
> Hi Charles,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on broonie-sound/for-next]
> >> sound/soc/au1x/ac97c.c:227:10: error: 'const struct snd_soc_component_driver' has no member named 'legacy_dai_name'; did you mean 'legacy_dai_naming'?
>      227 |         .legacy_dai_name        = 1,
>          |          ^~~~~~~~~~~~~~~
>          |          legacy_dai_naming

Hmm... apologies for this not sure how that snuck through my
build testing, must have somehow missed this one.

Mark do you want me to send a v2 for the whole series? Or given
the size would it be better to just resend this patch?

Thanks,
Charles
