Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7A5C52E0A2
	for <lists+linux-mips@lfdr.de>; Fri, 20 May 2022 01:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343648AbiESXkW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 May 2022 19:40:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343649AbiESXkT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 May 2022 19:40:19 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DCAA11905C;
        Thu, 19 May 2022 16:40:17 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 568E05C023E;
        Thu, 19 May 2022 19:40:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 19 May 2022 19:40:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1653003615; x=
        1653090015; bh=iqHByxP/PP0RV5Kp27EEtrVjbBff5eU8E6iDfYSzvlo=; b=v
        WvrghW/tnB2wQQZ7H1BtAjOy1RhwPLZpgzo98sCQvJhYWwor/HzjJNsV/LVOFbsE
        YSiG6I57bor0I2nDEC6ZNocpWKkv71xzTjDYt6ZfZ8NcTOw4uLTbONYN6bKYH0PY
        ZXLXErKuqY/OVSt1aiUR4bNuR2iEWFiDRXePo8UJrjuv+NMyWc7SgXvTTXZClSjS
        xX/9GfMLAZ8ZS2t+SmXFzd5bG9/XZqH4LhunRvn1mAKETHqh9PDqXC25nNdQWczb
        Ozc+ESgOxLy8gZ1sJC+Wq7Am0HXvT/m2QJQsf+liwgR8ULL+hRLTOVRO4mvNvxjd
        KHsL6W3LPExCEUM/TygiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1653003615; x=
        1653090015; bh=iqHByxP/PP0RV5Kp27EEtrVjbBff5eU8E6iDfYSzvlo=; b=k
        pRbno/Gt6gUXFzSSorr0j6sxajaPEN+rwHFd8+jcnA6Sce0eyMe1DAfgUIuR5rln
        yyI3d7qfzMsS8JltiVQrFJi7K/ZoDyKheaneInXoIGCdVSulwqOTjJorhLCu2Gw7
        IoRXmbGJ3trZhAv+ZBVHrxN0gMC5BalsJ/SKUO/9f+9Ut6HKvwFdvvQ8z8xsuHUk
        fxcCGXOOf/BbfqT8Y8VSjsuEJ6GBj8XDHJJ8IRfvpiEixjiRTsOTlez4NEgoU/2g
        W4aJu6F/kQHejyjCH6arZw/g+aNM+9HBFIdRKkeEFQw/69yhZyT9EcMBkfbZV9md
        9NuahsBfHX2ficK+iYbDQ==
X-ME-Sender: <xms:XdWGYgUGUf75UPVgls83XPWiF6A-tBj4e3s97Kb34YKu5oXO3A13_Q>
    <xme:XdWGYkkqej7Sw873SF-tPbdbpAwSLvqaubcCTMpPfIOnD1JzRCeaEf8RmHncNciRB
    jroNjyXsoqZ4PKpkg>
X-ME-Received: <xmr:XdWGYkbvrZwpUnOM1O4-_2tYjgJTQpjZPqXkpDEw0EpgcjUMjLmwhmRAdevmUe4wB8Y-f3nIrmriP-19jvjm7O0yy8ouh7KCEVebaavF9pBHI4yR_-4r_4bKXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedriedvgddviecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfevfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepffdtveekvdegkeeuueetgfetffeileevudekuefhheelvdfhiedt
    heduhfduhefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:XdWGYvUwc4jVKeqPla_0-WQCIkx0RnvqDhfHPs1ZzAd8QctkVgY8fQ>
    <xmx:XdWGYqm6J2stCQX-STAMuroIUM4y_rHHyhG_yTajyWgKhMRCq9JK7Q>
    <xmx:XdWGYkfsUHQ4XlJCEJ_vR0OyzJAV_JKQMFS6xef23lbxi7aCuM1zAg>
    <xmx:X9WGYo3IuYUdLigJsZOLgqfeufUYTAN7skI0dQ2vQGpXXTD2m7p_Gw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 May 2022 19:40:12 -0400 (EDT)
Subject: Re: [PATCH 22/56] ASoC: sunxi: Update to use set_fmt_new callback
To:     Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc:     lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com,
        nicolas.ferre@microchip.com, nsaenz@kernel.org,
        shawnguo@kernel.org, linux-imx@nxp.com, cezary.rojewski@intel.com,
        pierre-louis.bossart@linux.intel.com, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, daniel@zonque.org,
        srinivas.kandagatla@linaro.org, linux-rockchip@lists.infradead.org,
        krzk@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        peter.ujfalusi@gmail.com, jarkko.nikula@bitmer.com,
        heiko@sntech.de, jbrunet@baylibre.com, kernel@pengutronix.de,
        alsa-devel@alsa-project.org, patches@opensource.cirrus.com
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <20220519154318.2153729-23-ckeepax@opensource.cirrus.com>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <948d5418-44ca-2e60-0c1c-0b16f315feba@sholland.org>
Date:   Thu, 19 May 2022 18:40:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20220519154318.2153729-23-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/19/22 10:42 AM, Charles Keepax wrote:
> As part of updating the core to directly tell drivers if they are clock
> provider or consumer update these CPU side drivers to use the new direct
> callback.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  sound/soc/sunxi/sun4i-i2s.c   | 20 ++++++++++----------
>  sound/soc/sunxi/sun8i-codec.c |  8 ++++----
>  2 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index 7047f71629ab3..872838d3e0a94 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -702,13 +702,13 @@ static int sun4i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
>  			   SUN4I_I2S_FMT0_FMT_MASK, val);
>  
>  	/* DAI clock master masks */
> -	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> -	case SND_SOC_DAIFMT_CBS_CFS:
> +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +	case SND_SOC_DAIFMT_BP_FP:
>  		/* BCLK and LRCLK master */
>  		val = SUN4I_I2S_CTRL_MODE_MASTER;
>  		break;
>  
> -	case SND_SOC_DAIFMT_CBM_CFM:
> +	case SND_SOC_DAIFMT_BC_FC:
>  		/* BCLK and LRCLK slave */
>  		val = SUN4I_I2S_CTRL_MODE_SLAVE;
>  		break;
> @@ -802,13 +802,13 @@ static int sun8i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
>  			   SUN8I_I2S_TX_CHAN_OFFSET(offset));
>  
>  	/* DAI clock master masks */
> -	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> -	case SND_SOC_DAIFMT_CBS_CFS:
> +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +	case SND_SOC_DAIFMT_BP_FP:
>  		/* BCLK and LRCLK master */
>  		val = SUN8I_I2S_CTRL_BCLK_OUT |	SUN8I_I2S_CTRL_LRCK_OUT;
>  		break;
>  
> -	case SND_SOC_DAIFMT_CBM_CFM:
> +	case SND_SOC_DAIFMT_BC_FC:
>  		/* BCLK and LRCLK slave */
>  		val = 0;
>  		break;
> @@ -909,13 +909,13 @@ static int sun50i_h6_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
>  			   SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET(offset));
>  
>  	/* DAI clock master masks */
> -	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> -	case SND_SOC_DAIFMT_CBS_CFS:
> +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +	case SND_SOC_DAIFMT_BP_FP:
>  		/* BCLK and LRCLK master */
>  		val = SUN8I_I2S_CTRL_BCLK_OUT |	SUN8I_I2S_CTRL_LRCK_OUT;
>  		break;
>  
> -	case SND_SOC_DAIFMT_CBM_CFM:
> +	case SND_SOC_DAIFMT_BC_FC:
>  		/* BCLK and LRCLK slave */
>  		val = 0;
>  		break;
> @@ -1081,7 +1081,7 @@ static int sun4i_i2s_set_tdm_slot(struct snd_soc_dai *dai,
>  
>  static const struct snd_soc_dai_ops sun4i_i2s_dai_ops = {
>  	.hw_params	= sun4i_i2s_hw_params,
> -	.set_fmt	= sun4i_i2s_set_fmt,
> +	.set_fmt_new	= sun4i_i2s_set_fmt,
>  	.set_sysclk	= sun4i_i2s_set_sysclk,
>  	.set_tdm_slot	= sun4i_i2s_set_tdm_slot,
>  	.trigger	= sun4i_i2s_trigger,
> diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
> index 0bea2162f68d9..6e9ef948d6621 100644
> --- a/sound/soc/sunxi/sun8i-codec.c
> +++ b/sound/soc/sunxi/sun8i-codec.c
> @@ -286,11 +286,11 @@ static int sun8i_codec_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>  	u32 dsp_format, format, invert, value;
>  
>  	/* clock masters */
> -	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> -	case SND_SOC_DAIFMT_CBS_CFS: /* Codec slave, DAI master */
> +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +	case SND_SOC_DAIFMT_BP_FP: /* Codec slave, DAI master */

This is a codec driver, and it is only ever used on the codec end of a link, so
I would not expect it to be changed.

Regards,
Samuel

>  		value = 0x1;
>  		break;
> -	case SND_SOC_DAIFMT_CBM_CFM: /* Codec Master, DAI slave */
> +	case SND_SOC_DAIFMT_BC_FC: /* Codec Master, DAI slave */
>  		value = 0x0;
>  		break;
>  	default:
> @@ -630,7 +630,7 @@ static int sun8i_codec_hw_free(struct snd_pcm_substream *substream,
>  }
>  
>  static const struct snd_soc_dai_ops sun8i_codec_dai_ops = {
> -	.set_fmt	= sun8i_codec_set_fmt,
> +	.set_fmt_new	= sun8i_codec_set_fmt,
>  	.set_tdm_slot	= sun8i_codec_set_tdm_slot,
>  	.startup	= sun8i_codec_startup,
>  	.hw_params	= sun8i_codec_hw_params,
> 

