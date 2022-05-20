Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3537A52ED51
	for <lists+linux-mips@lfdr.de>; Fri, 20 May 2022 15:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349882AbiETNjJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 20 May 2022 09:39:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349096AbiETNjI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 20 May 2022 09:39:08 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7113F169E3B;
        Fri, 20 May 2022 06:39:07 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id eg11so10806951edb.11;
        Fri, 20 May 2022 06:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/vZ5EIynCj28UhpMo2WaUDTGXgrMDD6ssuzpbKQFTrE=;
        b=dbdCdy787bi5RG1nfo93JEf7fRSGqgvdGgWbhi5+jiM2gZq411FflPdY9L2o3Sz097
         XA9SzdoyvFOw4oNvCmxQtifumEL2ucGkRJdht2gKQbj9YVfuffNrO+QPvuuZxjrqoS0F
         NfU67GWBYzEpstGDy844RVUmfAl7HNRGvf/LwT4rnlN6DngXc2ZKIaPbBdhEQ53EpZ4s
         ITsYoJPxw+STd6rZ1MhtfXgofir7SDd7Ohuuh33FWGAKbBMX+xkiGJYwBkluf7rb/Tbk
         3LkMR2KGcBuBeRhqmlx3nsng24xG35IMWoTed7v6OpPZiYpWbvZKUFT3MZVg1KYI/Bnh
         bK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/vZ5EIynCj28UhpMo2WaUDTGXgrMDD6ssuzpbKQFTrE=;
        b=rj176+aMvhWNFkb2oyWSikqNSiPZiT21mY9HNuXFUFubMvPDldQrQQvQ7x0ItrvR0R
         XQK8jYs1YLpSysypjR6hUUZVRXG4rVvHcUp2cG2HYqJkPTM5HSCNEnQvOi/XcTRK2JAH
         7AVZaeYKMPOBDNPTKCYjnR4tjtbZcadsJ3XMj1DIVaMIHAP3uF1BKjNnJoFiXS7YuUJt
         ItG2t0559rG5MWAD/yGAbTMF6Dml9FPUMf3seHZ4TAMa9tJ/+BqJ0HNdt4xjmJqM2Tmo
         xVdIurlbF4hUFiWw8C9MKR+up1AyOWgTC2kel/dJPoanCaxErFH8uGYBRPfTae28BLce
         miuA==
X-Gm-Message-State: AOAM531+fTdSWUN6Fq9054rF/Yqcbi0mMce7I8I7EYtTzOKjoE5kqzlA
        iQkCBMR4QFWwiq3y4qPGnUk=
X-Google-Smtp-Source: ABdhPJzB4dDO6rQGcvP8GfFmFaDFqb3hZ0xhEwmOtYMgE32gUNPAUosh+C78GjzIs6waR9fAZFTMtw==
X-Received: by 2002:a05:6402:3488:b0:427:b4ec:991b with SMTP id v8-20020a056402348800b00427b4ec991bmr10869813edc.319.1653053945963;
        Fri, 20 May 2022 06:39:05 -0700 (PDT)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch. [84.72.105.84])
        by smtp.gmail.com with ESMTPSA id b2-20020aa7df82000000b0042abfe32ac8sm4225152edy.30.2022.05.20.06.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 06:39:05 -0700 (PDT)
From:   Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To:     broonie@kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>
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
Subject: Re: [PATCH 18/56] ASoC: rockchip: Update to use set_fmt_new callback
Date:   Fri, 20 May 2022 15:39:03 +0200
Message-ID: <4375965.enAZpblka2@archbook>
In-Reply-To: <20220519154318.2153729-19-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com> <20220519154318.2153729-19-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Donnerstag, 19. Mai 2022 17:42:40 CEST Charles Keepax wrote:
> As part of updating the core to directly tell drivers if they are clock
> provider or consumer update these CPU side drivers to use the new direct
> callback.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  sound/soc/rockchip/rockchip_i2s.c     | 8 ++++----
>  sound/soc/rockchip/rockchip_i2s_tdm.c | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
> index 4ce5d25793875..0a66c7df323dc 100644
> --- a/sound/soc/rockchip/rockchip_i2s.c
> +++ b/sound/soc/rockchip/rockchip_i2s.c
> @@ -199,13 +199,13 @@ static int rockchip_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
>  
>  	pm_runtime_get_sync(cpu_dai->dev);
>  	mask = I2S_CKR_MSS_MASK;
> -	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> -	case SND_SOC_DAIFMT_CBS_CFS:
> +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +	case SND_SOC_DAIFMT_BP_FP:
>  		/* Set source clock in Master mode */
>  		val = I2S_CKR_MSS_MASTER;
>  		i2s->is_master_mode = true;
>  		break;
> -	case SND_SOC_DAIFMT_CBM_CFM:
> +	case SND_SOC_DAIFMT_BC_FC:
>  		val = I2S_CKR_MSS_SLAVE;
>  		i2s->is_master_mode = false;
>  		break;
> @@ -486,7 +486,7 @@ static const struct snd_soc_dai_ops rockchip_i2s_dai_ops = {
>  	.hw_params = rockchip_i2s_hw_params,
>  	.set_bclk_ratio	= rockchip_i2s_set_bclk_ratio,
>  	.set_sysclk = rockchip_i2s_set_sysclk,
> -	.set_fmt = rockchip_i2s_set_fmt,
> +	.set_fmt_new = rockchip_i2s_set_fmt,
>  	.trigger = rockchip_i2s_trigger,
>  };
>  
> diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
> index 98700e75b82a1..c90afccdae362 100644
> --- a/sound/soc/rockchip/rockchip_i2s_tdm.c
> +++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
> @@ -411,12 +411,12 @@ static int rockchip_i2s_tdm_set_fmt(struct snd_soc_dai *cpu_dai,
>  	}
>  
>  	mask = I2S_CKR_MSS_MASK;
> -	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> -	case SND_SOC_DAIFMT_CBC_CFC:
> +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +	case SND_SOC_DAIFMT_BP_FP:
>  		val = I2S_CKR_MSS_MASTER;
>  		i2s_tdm->is_master_mode = true;
>  		break;
> -	case SND_SOC_DAIFMT_CBP_CFP:
> +	case SND_SOC_DAIFMT_BC_FC:
>  		val = I2S_CKR_MSS_SLAVE;
>  		i2s_tdm->is_master_mode = false;
>  		break;
> @@ -1113,7 +1113,7 @@ static const struct snd_soc_dai_ops rockchip_i2s_tdm_dai_ops = {
>  	.hw_params = rockchip_i2s_tdm_hw_params,
>  	.set_bclk_ratio	= rockchip_i2s_tdm_set_bclk_ratio,
>  	.set_sysclk = rockchip_i2s_tdm_set_sysclk,
> -	.set_fmt = rockchip_i2s_tdm_set_fmt,
> +	.set_fmt_new = rockchip_i2s_tdm_set_fmt,
>  	.set_tdm_slot = rockchip_dai_tdm_slot,
>  	.trigger = rockchip_i2s_tdm_trigger,
>  };
> 

Please run ./scripts/get_maintainer.pl against the individual patches so
that I'm included in the recipients of the e-mail as well.

Anyway, for the i2s-tdm parts:

Tested-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>

Tested on a RK3566 connected to an RK817 codec.

Regards,
Nicolas Frattaroli


