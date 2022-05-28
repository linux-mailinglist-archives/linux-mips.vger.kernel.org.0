Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2F63536BD5
	for <lists+linux-mips@lfdr.de>; Sat, 28 May 2022 11:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232223AbiE1JRn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 28 May 2022 05:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbiE1JRn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 28 May 2022 05:17:43 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E0B8D57;
        Sat, 28 May 2022 02:17:41 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id t13so4705552ljd.6;
        Sat, 28 May 2022 02:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4AsMBYjaCbPUjugaq7DmP2Bn6t4OXtAIJ6K1lbWCPpo=;
        b=LD81542I5JgGIWWa8sMguiyhmKk5EcA48B7PIF/17V2lhqHZU316ogdL+m9CGYc9k8
         9wXlu/EdGeZ2gDZgnU9di9ql27TZYy1KPMQttJP+vS2avnqrvjOvRPBcLlZxJ/1EjwMn
         qsxOXkPtuJCFIdLhiLp1fjw8EzGmuRoj+uzFS3CLMslo1QXhgIop57xV1k8knI6Jq+0F
         1a4e5A0uHAaP1IV93ziGs6i9UlEzWNwnSmfwuN3eBBoA2mUnq0dpyvW7UENs/ChdWz9v
         v+cMJeCZMtXFWlKLKqEiP2bFKyCus6ibZNHlG4wkRXT1HHZKv70toSR/25s15eR6GT5f
         Ec2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4AsMBYjaCbPUjugaq7DmP2Bn6t4OXtAIJ6K1lbWCPpo=;
        b=nq4nh17LIKPGLdPWb30vMFvxgcaSyhQ3hQt/x0uUXjUqq18ti7VDKq4J/rrRMTfgEK
         YSe4irWdwNaIrsikdud+39+UMK0OiZwd6C6VfJVUJnAaAFnr7g4stmTagpGUV3VETQYU
         I7lWLyho46HMHzRVPysq92EWheE4LF+WROPBm30WRcv6vAPPjZ5Ze5XyjWub8djvogeK
         1QPVtlxlpIUQjujeJR+irPKQQp/iIZCURkMluHS37B6IoPDF2iHIJ19bJe6LJkOkrmrx
         v5U5YsOZxNOrquqMlkZxti9bzKEhFVuPS0S/3A1cMJxlaIRzxclEqTZLRFcxpX+2Kd2s
         YYSg==
X-Gm-Message-State: AOAM5319BQm8T5B1Ik37Wx/BY4zFF5nPwn5OycUx6YSpz5Z/8vb98OAa
        90puDNNabwa0Y9HDF0IrQlo=
X-Google-Smtp-Source: ABdhPJwBbL3mkzKywpc+IfrnbZ4hmf9StcqSwcwm8m0YGTWqNE/eSCSKyfUOG/h/I7gMut48Zoqa6A==
X-Received: by 2002:a2e:7819:0:b0:255:4957:c350 with SMTP id t25-20020a2e7819000000b002554957c350mr633181ljc.426.1653729458980;
        Sat, 28 May 2022 02:17:38 -0700 (PDT)
Received: from [10.0.0.127] (91-159-150-230.elisa-laajakaista.fi. [91.159.150.230])
        by smtp.gmail.com with ESMTPSA id l2-20020ac24a82000000b004785b66a9a4sm1243469lfp.126.2022.05.28.02.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 May 2022 02:17:38 -0700 (PDT)
Message-ID: <a92ef8a0-e065-60fe-1f5f-a5ecf0ca74c9@gmail.com>
Date:   Sat, 28 May 2022 12:18:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 25/56] ASoC: ti: Update to use set_fmt_new callback
Content-Language: en-US
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
        jarkko.nikula@bitmer.com, heiko@sntech.de, jbrunet@baylibre.com,
        kernel@pengutronix.de, alsa-devel@alsa-project.org,
        patches@opensource.cirrus.com
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <20220519154318.2153729-26-ckeepax@opensource.cirrus.com>
From:   =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20220519154318.2153729-26-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 19/05/2022 18:42, Charles Keepax wrote:
> As part of updating the core to directly tell drivers if they are clock
> provider or consumer update these CPU side drivers to use the new direct
> callback.

looks good, thanks Charles,

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  sound/soc/ti/davinci-i2s.c   | 34 +++++++++++++++++-----------------
>  sound/soc/ti/davinci-mcasp.c | 12 ++++++------
>  sound/soc/ti/omap-mcbsp.c    | 14 +++++++-------
>  3 files changed, 30 insertions(+), 30 deletions(-)
> 
> diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
> index 0363a088d2e00..c7368d5296688 100644
> --- a/sound/soc/ti/davinci-i2s.c
> +++ b/sound/soc/ti/davinci-i2s.c
> @@ -230,15 +230,15 @@ static int davinci_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai,
>  
>  	dev->fmt = fmt;
>  	/* set master/slave audio interface */
> -	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> -	case SND_SOC_DAIFMT_CBS_CFS:
> +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +	case SND_SOC_DAIFMT_BP_FP:
>  		/* cpu is master */
>  		pcr = DAVINCI_MCBSP_PCR_FSXM |
>  			DAVINCI_MCBSP_PCR_FSRM |
>  			DAVINCI_MCBSP_PCR_CLKXM |
>  			DAVINCI_MCBSP_PCR_CLKRM;
>  		break;
> -	case SND_SOC_DAIFMT_CBM_CFS:
> +	case SND_SOC_DAIFMT_BC_FP:
>  		pcr = DAVINCI_MCBSP_PCR_FSRM | DAVINCI_MCBSP_PCR_FSXM;
>  		/*
>  		 * Selection of the clock input pin that is the
> @@ -260,7 +260,7 @@ static int davinci_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai,
>  		}
>  
>  		break;
> -	case SND_SOC_DAIFMT_CBM_CFM:
> +	case SND_SOC_DAIFMT_BC_FC:
>  		/* codec is master */
>  		pcr = 0;
>  		break;
> @@ -395,12 +395,12 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
>  		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG, spcr);
>  	}
>  
> -	master = dev->fmt & SND_SOC_DAIFMT_MASTER_MASK;
> +	master = dev->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
>  	fmt = params_format(params);
>  	mcbsp_word_length = asp_word_length[fmt];
>  
>  	switch (master) {
> -	case SND_SOC_DAIFMT_CBS_CFS:
> +	case SND_SOC_DAIFMT_BP_FP:
>  		freq = clk_get_rate(dev->clk);
>  		srgr = DAVINCI_MCBSP_SRGR_FSGM |
>  		       DAVINCI_MCBSP_SRGR_CLKSM;
> @@ -426,7 +426,7 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
>  		clk_div &= 0xFF;
>  		srgr |= clk_div;
>  		break;
> -	case SND_SOC_DAIFMT_CBM_CFS:
> +	case SND_SOC_DAIFMT_BC_FP:
>  		srgr = DAVINCI_MCBSP_SRGR_FSGM;
>  		clk_div = dev->clk_div - 1;
>  		srgr |= DAVINCI_MCBSP_SRGR_FWID(mcbsp_word_length * 8 - 1);
> @@ -434,7 +434,7 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
>  		clk_div &= 0xFF;
>  		srgr |= clk_div;
>  		break;
> -	case SND_SOC_DAIFMT_CBM_CFM:
> +	case SND_SOC_DAIFMT_BC_FC:
>  		/* Clock and frame sync given from external sources */
>  		i = hw_param_interval(params, SNDRV_PCM_HW_PARAM_SAMPLE_BITS);
>  		srgr = DAVINCI_MCBSP_SRGR_FSGM;
> @@ -473,15 +473,15 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
>  			fmt = double_fmt[fmt];
>  		}
>  		switch (master) {
> -		case SND_SOC_DAIFMT_CBS_CFS:
> -		case SND_SOC_DAIFMT_CBS_CFM:
> +		case SND_SOC_DAIFMT_BP_FP:
> +		case SND_SOC_DAIFMT_BP_FC:
>  			rcr |= DAVINCI_MCBSP_RCR_RFRLEN2(0);
>  			xcr |= DAVINCI_MCBSP_XCR_XFRLEN2(0);
>  			rcr |= DAVINCI_MCBSP_RCR_RPHASE;
>  			xcr |= DAVINCI_MCBSP_XCR_XPHASE;
>  			break;
> -		case SND_SOC_DAIFMT_CBM_CFM:
> -		case SND_SOC_DAIFMT_CBM_CFS:
> +		case SND_SOC_DAIFMT_BC_FC:
> +		case SND_SOC_DAIFMT_BC_FP:
>  			rcr |= DAVINCI_MCBSP_RCR_RFRLEN2(element_cnt - 1);
>  			xcr |= DAVINCI_MCBSP_XCR_XFRLEN2(element_cnt - 1);
>  			break;
> @@ -492,13 +492,13 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
>  	mcbsp_word_length = asp_word_length[fmt];
>  
>  	switch (master) {
> -	case SND_SOC_DAIFMT_CBS_CFS:
> -	case SND_SOC_DAIFMT_CBS_CFM:
> +	case SND_SOC_DAIFMT_BP_FP:
> +	case SND_SOC_DAIFMT_BP_FC:
>  		rcr |= DAVINCI_MCBSP_RCR_RFRLEN1(0);
>  		xcr |= DAVINCI_MCBSP_XCR_XFRLEN1(0);
>  		break;
> -	case SND_SOC_DAIFMT_CBM_CFM:
> -	case SND_SOC_DAIFMT_CBM_CFS:
> +	case SND_SOC_DAIFMT_BC_FC:
> +	case SND_SOC_DAIFMT_BC_FP:
>  		rcr |= DAVINCI_MCBSP_RCR_RFRLEN1(element_cnt - 1);
>  		xcr |= DAVINCI_MCBSP_XCR_XFRLEN1(element_cnt - 1);
>  		break;
> @@ -606,7 +606,7 @@ static const struct snd_soc_dai_ops davinci_i2s_dai_ops = {
>  	.prepare	= davinci_i2s_prepare,
>  	.trigger	= davinci_i2s_trigger,
>  	.hw_params	= davinci_i2s_hw_params,
> -	.set_fmt	= davinci_i2s_set_dai_fmt,
> +	.set_fmt_new	= davinci_i2s_set_dai_fmt,
>  	.set_clkdiv	= davinci_i2s_dai_set_clkdiv,
>  
>  };
> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
> index 377be2e2b6ee7..961bac6963652 100644
> --- a/sound/soc/ti/davinci-mcasp.c
> +++ b/sound/soc/ti/davinci-mcasp.c
> @@ -492,8 +492,8 @@ static int davinci_mcasp_set_dai_fmt(struct snd_soc_dai *cpu_dai,
>  	mcasp_mod_bits(mcasp, DAVINCI_MCASP_RXFMT_REG, FSRDLY(data_delay),
>  		       FSRDLY(3));
>  
> -	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> -	case SND_SOC_DAIFMT_CBS_CFS:
> +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +	case SND_SOC_DAIFMT_BP_FP:
>  		/* codec is clock and frame slave */
>  		mcasp_set_bits(mcasp, DAVINCI_MCASP_ACLKXCTL_REG, ACLKXE);
>  		mcasp_set_bits(mcasp, DAVINCI_MCASP_TXFMCTL_REG, AFSXE);
> @@ -510,7 +510,7 @@ static int davinci_mcasp_set_dai_fmt(struct snd_soc_dai *cpu_dai,
>  
>  		mcasp->bclk_master = 1;
>  		break;
> -	case SND_SOC_DAIFMT_CBS_CFM:
> +	case SND_SOC_DAIFMT_BP_FC:
>  		/* codec is clock slave and frame master */
>  		mcasp_set_bits(mcasp, DAVINCI_MCASP_ACLKXCTL_REG, ACLKXE);
>  		mcasp_clr_bits(mcasp, DAVINCI_MCASP_TXFMCTL_REG, AFSXE);
> @@ -527,7 +527,7 @@ static int davinci_mcasp_set_dai_fmt(struct snd_soc_dai *cpu_dai,
>  
>  		mcasp->bclk_master = 1;
>  		break;
> -	case SND_SOC_DAIFMT_CBM_CFS:
> +	case SND_SOC_DAIFMT_BC_FP:
>  		/* codec is clock master and frame slave */
>  		mcasp_clr_bits(mcasp, DAVINCI_MCASP_ACLKXCTL_REG, ACLKXE);
>  		mcasp_set_bits(mcasp, DAVINCI_MCASP_TXFMCTL_REG, AFSXE);
> @@ -544,7 +544,7 @@ static int davinci_mcasp_set_dai_fmt(struct snd_soc_dai *cpu_dai,
>  
>  		mcasp->bclk_master = 0;
>  		break;
> -	case SND_SOC_DAIFMT_CBM_CFM:
> +	case SND_SOC_DAIFMT_BC_FC:
>  		/* codec is clock and frame master */
>  		mcasp_clr_bits(mcasp, DAVINCI_MCASP_ACLKXCTL_REG, ACLKXE);
>  		mcasp_clr_bits(mcasp, DAVINCI_MCASP_TXFMCTL_REG, AFSXE);
> @@ -1620,7 +1620,7 @@ static const struct snd_soc_dai_ops davinci_mcasp_dai_ops = {
>  	.trigger	= davinci_mcasp_trigger,
>  	.delay		= davinci_mcasp_delay,
>  	.hw_params	= davinci_mcasp_hw_params,
> -	.set_fmt	= davinci_mcasp_set_dai_fmt,
> +	.set_fmt_new	= davinci_mcasp_set_dai_fmt,
>  	.set_clkdiv	= davinci_mcasp_set_clkdiv,
>  	.set_sysclk	= davinci_mcasp_set_sysclk,
>  	.set_tdm_slot	= davinci_mcasp_set_tdm_slot,
> diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
> index 4479d74f0a458..5bfb56d4ff844 100644
> --- a/sound/soc/ti/omap-mcbsp.c
> +++ b/sound/soc/ti/omap-mcbsp.c
> @@ -1036,8 +1036,8 @@ static int omap_mcbsp_dai_hw_params(struct snd_pcm_substream *substream,
>  
>  	/* In McBSP master modes, FRAME (i.e. sample rate) is generated
>  	 * by _counting_ BCLKs. Calculate frame size in BCLKs */
> -	master = mcbsp->fmt & SND_SOC_DAIFMT_MASTER_MASK;
> -	if (master ==	SND_SOC_DAIFMT_CBS_CFS) {
> +	master = mcbsp->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
> +	if (master == SND_SOC_DAIFMT_BP_FP) {
>  		div = mcbsp->clk_div ? mcbsp->clk_div : 1;
>  		framesize = (mcbsp->in_freq / div) / params_rate(params);
>  
> @@ -1136,20 +1136,20 @@ static int omap_mcbsp_dai_set_dai_fmt(struct snd_soc_dai *cpu_dai,
>  		return -EINVAL;
>  	}
>  
> -	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> -	case SND_SOC_DAIFMT_CBS_CFS:
> +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +	case SND_SOC_DAIFMT_BP_FP:
>  		/* McBSP master. Set FS and bit clocks as outputs */
>  		regs->pcr0	|= FSXM | FSRM |
>  				   CLKXM | CLKRM;
>  		/* Sample rate generator drives the FS */
>  		regs->srgr2	|= FSGM;
>  		break;
> -	case SND_SOC_DAIFMT_CBM_CFS:
> +	case SND_SOC_DAIFMT_BC_FP:
>  		/* McBSP slave. FS clock as output */
>  		regs->srgr2	|= FSGM;
>  		regs->pcr0	|= FSXM | FSRM;
>  		break;
> -	case SND_SOC_DAIFMT_CBM_CFM:
> +	case SND_SOC_DAIFMT_BC_FC:
>  		/* McBSP slave */
>  		break;
>  	default:
> @@ -1271,7 +1271,7 @@ static const struct snd_soc_dai_ops mcbsp_dai_ops = {
>  	.trigger	= omap_mcbsp_dai_trigger,
>  	.delay		= omap_mcbsp_dai_delay,
>  	.hw_params	= omap_mcbsp_dai_hw_params,
> -	.set_fmt	= omap_mcbsp_dai_set_dai_fmt,
> +	.set_fmt_new	= omap_mcbsp_dai_set_dai_fmt,
>  	.set_clkdiv	= omap_mcbsp_dai_set_clkdiv,
>  	.set_sysclk	= omap_mcbsp_dai_set_dai_sysclk,
>  };

-- 
Péter
