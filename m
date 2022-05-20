Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2826252E97E
	for <lists+linux-mips@lfdr.de>; Fri, 20 May 2022 11:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236129AbiETJ5u (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 20 May 2022 05:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234276AbiETJ5t (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 20 May 2022 05:57:49 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50A715EDE2;
        Fri, 20 May 2022 02:57:48 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K5UCw9026795;
        Fri, 20 May 2022 04:56:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=OE6raZbucX9LQfP+TUClB+u691iV9kBCVX1IaiFUTRE=;
 b=OZjWqUg2GB9AJ9JqFusRILLr+RJoWNaMdCe9RA8DZ3zC+BqhasJKotr9r087ufLn2CfT
 ImDGP7AQdM1dEhMs05cuGKULUV2UMVhWKhwv1lv9aIYxP58hsADDle5oYJD73+1i/5E/
 DJ4PIeWt9ouGrMRIwpVZYIv2N+Hl3NLhwUKoEL7upZzJBlhj+H8WMUIA+0c0utHrFXib
 6St0njUEwySoagUHdfOhKQMIhve6czUMiuHZthPtAEsJdIL2UVkqXmo+S/ET4vQeKKCR
 eK2EWlTLp4WJJ/WhIR7yVYO0bDmrZEz1nQCC+kwy9kogs86oLbScSXA9l5o3Xs/ta2/U LQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upg5ms-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Fri, 20 May 2022 04:56:55 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 20 May
 2022 10:56:54 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Fri, 20 May 2022 10:56:54 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 42FB3476;
        Fri, 20 May 2022 09:56:54 +0000 (UTC)
Date:   Fri, 20 May 2022 09:56:54 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Samuel Holland <samuel@sholland.org>
CC:     <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <kuninori.morimoto.gx@renesas.com>, <nicolas.ferre@microchip.com>,
        <nsaenz@kernel.org>, <shawnguo@kernel.org>, <linux-imx@nxp.com>,
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
Subject: Re: [PATCH 22/56] ASoC: sunxi: Update to use set_fmt_new callback
Message-ID: <20220520095654.GK38351@ediswmail.ad.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <20220519154318.2153729-23-ckeepax@opensource.cirrus.com>
 <948d5418-44ca-2e60-0c1c-0b16f315feba@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <948d5418-44ca-2e60-0c1c-0b16f315feba@sholland.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 0o2bd6ilE3N_-d0xNvYBerQp3pGSYvGE
X-Proofpoint-ORIG-GUID: 0o2bd6ilE3N_-d0xNvYBerQp3pGSYvGE
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 19, 2022 at 06:40:11PM -0500, Samuel Holland wrote:
> On 5/19/22 10:42 AM, Charles Keepax wrote:
> > As part of updating the core to directly tell drivers if they are clock
> > provider or consumer update these CPU side drivers to use the new direct
> > callback.
> > 
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> >  sound/soc/sunxi/sun4i-i2s.c   | 20 ++++++++++----------
> >  sound/soc/sunxi/sun8i-codec.c |  8 ++++----
> >  2 files changed, 14 insertions(+), 14 deletions(-)
> > diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
> > index 0bea2162f68d9..6e9ef948d6621 100644
> > --- a/sound/soc/sunxi/sun8i-codec.c
> > +++ b/sound/soc/sunxi/sun8i-codec.c
> > @@ -286,11 +286,11 @@ static int sun8i_codec_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
> >  	u32 dsp_format, format, invert, value;
> >  
> >  	/* clock masters */
> > -	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> > -	case SND_SOC_DAIFMT_CBS_CFS: /* Codec slave, DAI master */
> > +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> > +	case SND_SOC_DAIFMT_BP_FP: /* Codec slave, DAI master */
> 
> This is a codec driver, and it is only ever used on the codec end of a link, so
> I would not expect it to be changed.
> 

Thanks for spotting that, silly mistake on my part. Will fix for
a rev 2.

Thanks,
Charles
