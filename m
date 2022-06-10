Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2C6A5459D5
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jun 2022 04:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345888AbiFJCET (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jun 2022 22:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242433AbiFJCDx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jun 2022 22:03:53 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3793EE8E0;
        Thu,  9 Jun 2022 19:03:21 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 283EC5C012B;
        Thu,  9 Jun 2022 22:03:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 09 Jun 2022 22:03:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1654826599; x=
        1654912999; bh=auv2y1q/XHGLdEIrA+k3tJpicIXejmP+D7ve/EoZ7GM=; b=T
        lueWR2anscPTLp0GLpyNG2+xRDvlxqL4hHB649GKDVxE+83H0KogHLzK7+y7p1tl
        DhCwJiGfhsexGpVmouxwk198ga4JMmAxvc0MPItUHh02vk4LRvUraBFLAjEYzL7H
        gZcuiRXlvoicEFjgLzVXW800HjEb+HDIcWMTDaizkpQmKHhL77Q8uKOOZz707O40
        TIz9C4thfrQn3s2q2+xaIwggUvQqHrFUz2TqGq1d4nIqw7xfdbXSW30edDJyuQuH
        yq3ZTH9aWoSA/finyesptEcxaUPQUKI96Nsq8jdr1mMFqphTsaDNhASvslpIpCZs
        KuHK82wLrkBr7ibytLhow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654826599; x=
        1654912999; bh=auv2y1q/XHGLdEIrA+k3tJpicIXejmP+D7ve/EoZ7GM=; b=H
        jaQGVAUFJ+o43qxljJhhhS7u5lZVx5+WEwMvXkqqfGfjYrY4QoCjutwZAnmZEjoi
        UJkCS7XhYJDA1P48qBCrVwgj71pEU+N52OHb1JTH/DSvb0m3ai5Jy+f+uP4ewgto
        jCgSFGjRPxUxrZo4gX98NmnppaNPRvC2tURk1H/pTCigjKDBHM6600/pBBy/aDtQ
        9gG2FmWceVGLRo4xsWSTNiAqaow9F80mCByr562WBl+Sm9MDBq92NOgaHEbLJ8nM
        mDr5zac63XZVJmWiVE5oiukoidXAgr8j4l85vEPJ0c54Qu3kFJMG2Pyy78sK4Rqo
        pcjUqTi4+Fa8a0sfFqWAg==
X-ME-Sender: <xms:ZaaiYna9xxSUqWwOqN2o4LbFxDQu91IYyvn7Ey86UqV2RrC2yZzEfw>
    <xme:ZaaiYmbLAZJMC-YelQXR7lHVv9B0EGQgCOn61JOLlB4fAvLGnPCLxIQuJS_Jqc5nd
    -t5T7a4wtpCMDnIsA>
X-ME-Received: <xmr:ZaaiYp-W6bS5nyInJAR8JRslpyj4PadpQGE-IaOz_bAAWC1bMSMRGVDiT8TLXsxwNr-Y84i1EqQRN_fQ5uv3dGFQwBe77L4PBugRC1gmugy_d1ux0NXfRXQrdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddutddgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefuvfevfhfhkffffgggjggtgfesth
    ejredttdefjeenucfhrhhomhepufgrmhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghl
    sehshhholhhlrghnugdrohhrgheqnecuggftrfgrthhtvghrnhepleetjeffvdegheektd
    ekveeuueetffetffehudefueejvddufeduteeiieejveelnecuffhomhgrihhnpehkvghr
    nhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:ZaaiYtpnP-ZI6-J9uVGSSPK2oule0PiJy9MQZ77TQHt5ROhcNr4NMg>
    <xmx:ZaaiYirYiAV5Vy1rURPPL3TX0xJdFr7XYP3Sz-8v6317Kmg3HYStWg>
    <xmx:ZaaiYjRiGIEvtRQGbryJCwl4Mz2lfRVOT8dq1v23yOQq8Q4SKY931A>
    <xmx:Z6aiYvq427nOQFMRmcwWTUq6YZyNTbWxjVLldeY5Zj6xsbSPPt914Q>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Jun 2022 22:03:15 -0400 (EDT)
Subject: Re: [PATCH 00/56] Specify clock provider directly to CPU DAIs
To:     Mark Brown <broonie@kernel.org>, ckeepax@opensource.cirrus.com
Cc:     linux-sunxi@lists.linux.dev, peter.ujfalusi@gmail.com,
        pierre-louis.bossart@linux.intel.com, linux-imx@nxp.com,
        krzk@kernel.org, jarkko.nikula@bitmer.com,
        linux-xtensa@linux-xtensa.org, cezary.rojewski@intel.com,
        shawnguo@kernel.org, linux-mediatek@lists.infradead.org,
        nicolas.ferre@microchip.com, patches@opensource.cirrus.com,
        linux-amlogic@lists.infradead.org, srinivas.kandagatla@linaro.org,
        daniel@zonque.org, linux-mips@vger.kernel.org,
        linux-tegra@vger.kernel.org, nsaenz@kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de,
        alsa-devel@alsa-project.org, kernel@pengutronix.de,
        jbrunet@baylibre.com,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org,
        lgirdwood@gmail.com
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <165478153064.1052094.1721875477574787769.b4-ty@kernel.org>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <2a498819-dbbf-31c1-4145-bbd2d7179bd8@sholland.org>
Date:   Thu, 9 Jun 2022 21:03:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <165478153064.1052094.1721875477574787769.b4-ty@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Mark,

On 6/9/22 8:32 AM, Mark Brown wrote:
> On Thu, 19 May 2022 16:42:22 +0100, Charles Keepax wrote:
>> Currently the set_fmt callback always passes clock provider/consumer
>> with respect to the CODEC. This made sense when the framework was
>> directly broken down into platforms and CODECs. However, as things
>> are now broken down into components which can be connected as either
>> the CPU or CODEC side of a DAI link it simplifies things if each
>> side of the link is just told if it is provider or consumer of the
>> clocks. Making this change allows us to remove one of the last parts
>> of the ASoC core that needs to know if a driver is a CODEC driver,
>> where it flips the clock format specifier if a CODEC driver is used on
>> the CPU side of a DAI link, as well as just being conceptually more
>> consistent with componentisation.
>>
>> [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [01/56] ASoC: core: Add set_fmt_new callback that directly specifies provider
>         commit: 905f3a04e184854555fc248ca4e692fdbf2f2547
> [02/56] ASoC: amd: vangogh: Update to use set_fmt_new callback
>         commit: ab890e0f83a65624d20b0ca4a7cb6306b8511558
> [03/56] ASoC: atmel: Update to use set_fmt_new callback
>         commit: 0fd054a577180cd807992e32c7cd394e54c85903
> [04/56] ASoC: au1x: Update to use set_fmt_new callback
>         commit: fee11f70849b21a244e6e27d281f3858b671bfea
> [05/56] ASoC: bcm: Update to use set_fmt_new callback
>         commit: 04ea2404468b7885c560c3673f6f2fd368f305a2
> [06/56] ASoC: ep93xx: Update to use set_fmt_new callback
>         commit: 5d6124e58d56818249a6266f56d9c3739e72e1bd
> [07/56] ASoC: dwc: Update to use set_fmt_new callback
>         commit: ca0444f1f7b228ae3b8d1a5c0f0d1b4463171f98
> [08/56] ASoC: fsl: Update to use set_fmt_new callback
>         commit: 3b14c15a333b8225ea38479e13c0366539d3374a
> [09/56] ASoC: hisilicon: Update to use set_fmt_new callback
>         commit: 0f362524dd3face4865077a4f7e7e640a95702aa
> [10/56] ASoC: img: Update to use set_fmt_new callback
>         commit: ed2b384082a678a0c4c8c56deff9e5f46d5e3fca
> [11/56] ASoC: Intel: Update to use set_fmt_new callback
>         commit: add9ee8c64c617f561a309cdda50104e9e2c12f6
> [12/56] ASoC: js4740-i2s: Update to use set_fmt_new callback
>         commit: cbb3a19f090d5a41b822caf9ff2058e1c6bc7ea3
> [13/56] ASoC: mediatek: Update to use set_fmt_new callback
>         commit: 3af99430f8d948a41556156155b0295dec274d41
> [14/56] ASoC: meson: Update to use set_fmt_new callback
>         commit: f60442bf6eab47aa4ab127aab88afdcc29a09a73
> [15/56] ASoC: mxs-saif: Update to use set_fmt_new callback
>         commit: f3c0064f1f8e358799c70c7905a09d15c5ec5e5a
> [16/56] ASoC: pxa: Update to use set_fmt_new callback
>         commit: 84c5b47c8ce4d5059d5e7539d3b44922cc0390e9
> [17/56] ASoC: qcom: Update to use set_fmt_new callback
>         commit: 1148e16b335f341f36475b646c692b4a71a1855e
> [18/56] ASoC: rockchip: Update to use set_fmt_new callback
>         commit: 27646d265da1745b2d1d10fec18465631cb1135f
> [19/56] ASoC: samsung: Update to use set_fmt_new callback
>         commit: 0b491c7c1b2555ef08285fd49a8567f2f9f34ff8
> [20/56] ASoC: sh: Update to use set_fmt_new callback
>         commit: 2d4dd776e902546389f2d7808ece7fd815aa829c
> [21/56] ASoC: stm: Update to use set_fmt_new callback
>         commit: 0092dac91ec1c404787841bdd9ecbf3404d1a41c
> [22/56] ASoC: sunxi: Update to use set_fmt_new callback
>         commit: 7cc3965fde74c9c725ed01de4ac35bc7d562d16a

This patch is wrong, which I pointed out earlier[1]. It will break audio on the
Allwinner A33 and A64 SoCs. Charles said he would send a v2[2]. Excluding the
changes to sound/soc/sunxi/sun8i-codec.c from the patch would fix it.

Regards,
Samuel

[1]:
https://lore.kernel.org/alsa-devel/948d5418-44ca-2e60-0c1c-0b16f315feba@sholland.org/
[2]:
https://lore.kernel.org/linux-sunxi/20220520095654.GK38351@ediswmail.ad.cirrus.com/
