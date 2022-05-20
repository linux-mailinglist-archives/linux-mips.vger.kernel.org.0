Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3C1752E9D8
	for <lists+linux-mips@lfdr.de>; Fri, 20 May 2022 12:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348121AbiETKZb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 20 May 2022 06:25:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348104AbiETKZ3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 20 May 2022 06:25:29 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C05CDED78F;
        Fri, 20 May 2022 03:25:28 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K5UCxB026795;
        Fri, 20 May 2022 05:24:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=WSOvhMBIg+CnexC+Y8X+ZG7BYMkoKeetiZYSiJmE0cw=;
 b=E3MDFwXsbJRiBaE4OT2ai+JBwbYdqbCNDnTM5WTrjlOXZlrikeuJ1tiL+m5bGqsZo03j
 hZNgysmRG2QNG9jfqt9CJyU1HKdQikMi9FpVUiaR7mHeBwbTedb07Mex56RR9EocUbFP
 vjQtPAGfK1wk5RM/9IUs9D/tVUYW0yOqIgk1qYoeQRhBJEla3nFqJiatKvzERFcXHqSI
 Q+/Hno0xMo5/BjF4Kn3iHQ0QMOXFJX9/9GuLbAmIRVv9J84ewdgkmDjMuNAiVSG2dbUO
 otHvJplf8L8ZVHcLm7hZgWu0kIHYmP+5RyytltwUsoK/TaAybqvdQMM8AE7gkhiA4klo dQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upg6de-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Fri, 20 May 2022 05:24:48 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 20 May
 2022 11:24:47 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Fri, 20 May 2022 11:24:47 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 20F84458;
        Fri, 20 May 2022 10:24:47 +0000 (UTC)
Date:   Fri, 20 May 2022 10:24:47 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC:     <broonie@kernel.org>, <lgirdwood@gmail.com>,
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
Subject: Re: [PATCH 56/56] ASoC: simple-card-utils: Move
 snd_soc_component_is_codec to be local
Message-ID: <20220520102447.GL38351@ediswmail.ad.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <20220519154318.2153729-57-ckeepax@opensource.cirrus.com>
 <87czg98193.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87czg98193.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: EewLKkNvojqM2gQAbwrh9EQ5fKjwiv7u
X-Proofpoint-ORIG-GUID: EewLKkNvojqM2gQAbwrh9EQ5fKjwiv7u
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 20, 2022 at 01:02:33AM +0000, Kuninori Morimoto wrote:
> 
> Hi
> 
> This is not related to this patch, but...
> 
> > -static inline int snd_soc_component_is_codec(struct snd_soc_component *component)
> > -{
> > -	return component->driver->non_legacy_dai_naming;
> > -}
> (snip)
> > +static inline int asoc_simple_component_is_codec(struct snd_soc_component *component)
> > +{
> > +	return component->driver->endianness;
> > +}
> 
> I have added "endianness" "non_legacy_dai_naming" to component
> when convert old "Codec style" into current "Component style".
> All codec needs to have these 2.
> 
> 	69941bab7c7aeaa7bf7e84397e294c17f0b7c6df
> 	("ASoC: snd_soc_component_driver has non_legacy_dai_naming")
> 
> 	273d778ef38a8861f880e9df5799029dc82bd55d
> 	("ASoC: snd_soc_component_driver has endianness")
> 
> The reason why I didn't use "codec" was that try to keep
> original style as much as possible.
> But it seems this is good time to use "codec" for it ?
> I think the code will be more understandable.
> 
> -	.endianness
> -	.non_legacy_dai_naming
> +	.is_codec

Yeah I considered this but it didn't really feel like the right
way to go to me. Firstly, at this stage we almost certainly need
to keep the endianness and non_legacy_dai_naming flags, there are
corner cases when endianness probably shouldn't be applied to CODECs
(as noted in my endianness series), and there are platform drivers
that use non_legacy_dai_naming.

We could add an is_codec flag along side the other two. But it
means a whole extra flag and means the the core is still requiring
a concept of what is a CODEC driver, which really we want to get
rid of as part of componentisation.

My thinking was that, whilst making this function local to the
driver isn't perfect, simple card will be used with simple CODECs
that are likely to exist on a standard audio bus, and thus have
endianness and the newer graph cards don't require specific
identification of what is a CODEC driver. So it probably works as
a solution for now.

> 
> Thank you for your help !!

Absolutely no problem, thank you for all the work you have done
on this over the years.

Thanks,
Charles
