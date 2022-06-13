Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36C6354841D
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jun 2022 12:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241183AbiFMJzg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jun 2022 05:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235122AbiFMJze (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Jun 2022 05:55:34 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F9A418E02;
        Mon, 13 Jun 2022 02:55:34 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25D7jncr030852;
        Mon, 13 Jun 2022 04:54:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=SAL9QBrR9Hifnxdadv6LtK1riDzGLGAzq1j5dDkQ/eE=;
 b=YSEazX0uO5GV3d6eprUPFqBpY2HPFw6tjVtpSwFjm3pPOCyD6SFrbQuT8qP8aTpkafDG
 wEMwsYZTSezO57v7oNilz7MY86TJm4g9OiORe+E7d5kLh74zbgbf6wXjUpBlmEMbG8H6
 9xgtekY2JVsWrI1WFghS9KWch1o2j/pFUmPWiGjLFQqZgwvmN/ZSCq4a8Nzev/hxGIaI
 067Wj8AJx34nIpY4KIQbEKUU5w5DkIZnl8ZWtlBRglqaIwVerccqsUrkRpF0VTgpw5/W
 8eqrcUGfEwdkdNFAaj8W5vDvtbi+DB3ikcOmlpx6B/W4dW4VZCSzcPsBWfNJkdOGtTqz hA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gmrf31py0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 13 Jun 2022 04:54:55 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 13 Jun
 2022 10:54:53 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Mon, 13 Jun 2022 10:54:53 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2C2AD11D1;
        Mon, 13 Jun 2022 09:54:53 +0000 (UTC)
Date:   Mon, 13 Jun 2022 09:54:53 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Mark Brown <broonie@kernel.org>
CC:     Samuel Holland <samuel@sholland.org>,
        <linux-sunxi@lists.linux.dev>, <peter.ujfalusi@gmail.com>,
        <pierre-louis.bossart@linux.intel.com>, <linux-imx@nxp.com>,
        <krzk@kernel.org>, <jarkko.nikula@bitmer.com>,
        <linux-xtensa@linux-xtensa.org>, <cezary.rojewski@intel.com>,
        <shawnguo@kernel.org>, <linux-mediatek@lists.infradead.org>,
        <nicolas.ferre@microchip.com>, <patches@opensource.cirrus.com>,
        <linux-amlogic@lists.infradead.org>,
        <srinivas.kandagatla@linaro.org>, <daniel@zonque.org>,
        <linux-mips@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <nsaenz@kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <heiko@sntech.de>, <alsa-devel@alsa-project.org>,
        <kernel@pengutronix.de>, <jbrunet@baylibre.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <linux-rockchip@lists.infradead.org>, <linux-omap@vger.kernel.org>,
        <lgirdwood@gmail.com>
Subject: Re: [PATCH 00/56] Specify clock provider directly to CPU DAIs
Message-ID: <20220613095453.GB38351@ediswmail.ad.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <165478153064.1052094.1721875477574787769.b4-ty@kernel.org>
 <2a498819-dbbf-31c1-4145-bbd2d7179bd8@sholland.org>
 <YqMy/FkxDPKmzdrB@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YqMy/FkxDPKmzdrB@sirena.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: UiaFdV3e1tP7Nx8vGVE1XxJr6gdm5Oey
X-Proofpoint-ORIG-GUID: UiaFdV3e1tP7Nx8vGVE1XxJr6gdm5Oey
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jun 10, 2022 at 01:03:08PM +0100, Mark Brown wrote:
> On Thu, Jun 09, 2022 at 09:03:15PM -0500, Samuel Holland wrote:
> > On 6/9/22 8:32 AM, Mark Brown wrote:
> > > On Thu, 19 May 2022 16:42:22 +0100, Charles Keepax wrote:
> 
> Please delete unneeded context from mails when replying.  Doing this
> makes it much easier to find your reply in the message, helping ensure
> it won't be missed by people scrolling through the irrelevant quoted
> material.
> 
> > > [22/56] ASoC: sunxi: Update to use set_fmt_new callback
> > >         commit: 7cc3965fde74c9c725ed01de4ac35bc7d562d16a
> 
> > This patch is wrong, which I pointed out earlier[1]. It will break audio on the
> > Allwinner A33 and A64 SoCs. Charles said he would send a v2[2]. Excluding the
> > changes to sound/soc/sunxi/sun8i-codec.c from the patch would fix it.
> 
> Your mail doesn't say that this will break, it says the change is
> unexpected.  In any case, please send an incremental fix - there's no
> need to revert the entire series for this.

Apologies guys was on PTO last week, I will send an incremental
fix today to patch up the issues.

Thanks,
Charles
