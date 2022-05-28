Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0ACB536BDA
	for <lists+linux-mips@lfdr.de>; Sat, 28 May 2022 11:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232409AbiE1JSM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 28 May 2022 05:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232397AbiE1JSK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 28 May 2022 05:18:10 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66CA41C116;
        Sat, 28 May 2022 02:18:09 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id u7so7091783ljd.11;
        Sat, 28 May 2022 02:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HVRfiub+OH+3yERsymAq7YJAzta8XBR77uv0v0VV0CI=;
        b=emBIciAFdQnHcKQSohgcuqMQM4xd/Tz5hPJWkxKaoqpZiunJ9s/OTs4WGMG95NSW4L
         IgZczc+9GJXxJcHaJPXn5wGWSwvNNr7NK0iPiKDna7ZgvHSU3H+3cqKDq++bLMIID/pg
         WGi2IGkojhYGQUTThKK+rMJIPdLBixIvgKrHxkmswTwOqRnEJD7L5yQqGEaEOrvK5lk+
         qkpbzv53N91WJdtTRf68St7YDzO4K7K4CZ379sj7xnW+IFrVVRAmkaJKxBPwkYKBzJkg
         l3Y5YpoNbKupcj3Ag1FqEF0wqmBD5ctEDUT8y+jgldf7YfuRmpnjc1XtWB+r4HJU6Val
         yWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HVRfiub+OH+3yERsymAq7YJAzta8XBR77uv0v0VV0CI=;
        b=gq/P7L/M2/eq8XmL8bVn07Yty8pWJv17dwwSlwcEIsYQS3AlnF2X57BWwMHt/ExPUN
         ypDpzkwn++frvGSnAvg4ehPcVY5s5jGK0mqfthoGfCzi2hWllFwi6LOm5rzekML15IFh
         VhAx/rHf4ITMx7nmfQzOwNMcrIDBZFYdOSJsv0f2lIJVwdjaE+0S/xfPrkRt6ZAIlOBK
         vOhutONlH4Axi5vH1S2F+BnRs1HAwAsYErHD5zLNbxDCNIWV6iAgpk/jQuff3eNspLnD
         sC/SNxPUX70Y1WB/3s1FfBMWa9tb8Tlob9sL/Zqh2C5EJHc65ybz51JiCBDU1c/dgaPZ
         3v6g==
X-Gm-Message-State: AOAM531HFL0iViMtYtka1hF8ULYzbgt1F/Hn9RUNc8VhdcIuLzS+5QoM
        9XifyOak39NE8NUdWHHR1CA=
X-Google-Smtp-Source: ABdhPJxNkzG4eousUKAj15zHH6g3YqSnU9H8B29bmyYBmgxkfeUg1JCXHoHxE95njq7TczFOLpZl7Q==
X-Received: by 2002:a2e:a5ca:0:b0:253:c604:647c with SMTP id n10-20020a2ea5ca000000b00253c604647cmr27577549ljp.403.1653729487689;
        Sat, 28 May 2022 02:18:07 -0700 (PDT)
Received: from [10.0.0.127] (91-159-150-230.elisa-laajakaista.fi. [91.159.150.230])
        by smtp.gmail.com with ESMTPSA id v9-20020a2ea449000000b0024f3d1daee2sm1402828ljn.106.2022.05.28.02.18.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 May 2022 02:18:07 -0700 (PDT)
Message-ID: <454f31e4-12ce-2bee-8e95-d75854b34380@gmail.com>
Date:   Sat, 28 May 2022 12:19:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 52/56] ASoC: ti: Rename set_fmt_new back to set_fmt
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
 <20220519154318.2153729-53-ckeepax@opensource.cirrus.com>
From:   =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20220519154318.2153729-53-ckeepax@opensource.cirrus.com>
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



On 19/05/2022 18:43, Charles Keepax wrote:
> Now the core has been migrated across to the new direct clock
> specification we can move the drivers back to the normal set_fmt
> callback.

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  sound/soc/ti/davinci-i2s.c   | 2 +-
>  sound/soc/ti/davinci-mcasp.c | 2 +-
>  sound/soc/ti/omap-mcbsp.c    | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
> index c7368d5296688..fe572b720b094 100644
> --- a/sound/soc/ti/davinci-i2s.c
> +++ b/sound/soc/ti/davinci-i2s.c
> @@ -606,7 +606,7 @@ static const struct snd_soc_dai_ops davinci_i2s_dai_ops = {
>  	.prepare	= davinci_i2s_prepare,
>  	.trigger	= davinci_i2s_trigger,
>  	.hw_params	= davinci_i2s_hw_params,
> -	.set_fmt_new	= davinci_i2s_set_dai_fmt,
> +	.set_fmt	= davinci_i2s_set_dai_fmt,
>  	.set_clkdiv	= davinci_i2s_dai_set_clkdiv,
>  
>  };
> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
> index 961bac6963652..e2aab4729f3ab 100644
> --- a/sound/soc/ti/davinci-mcasp.c
> +++ b/sound/soc/ti/davinci-mcasp.c
> @@ -1620,7 +1620,7 @@ static const struct snd_soc_dai_ops davinci_mcasp_dai_ops = {
>  	.trigger	= davinci_mcasp_trigger,
>  	.delay		= davinci_mcasp_delay,
>  	.hw_params	= davinci_mcasp_hw_params,
> -	.set_fmt_new	= davinci_mcasp_set_dai_fmt,
> +	.set_fmt	= davinci_mcasp_set_dai_fmt,
>  	.set_clkdiv	= davinci_mcasp_set_clkdiv,
>  	.set_sysclk	= davinci_mcasp_set_sysclk,
>  	.set_tdm_slot	= davinci_mcasp_set_tdm_slot,
> diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
> index 5bfb56d4ff844..58d8e200a7b97 100644
> --- a/sound/soc/ti/omap-mcbsp.c
> +++ b/sound/soc/ti/omap-mcbsp.c
> @@ -1271,7 +1271,7 @@ static const struct snd_soc_dai_ops mcbsp_dai_ops = {
>  	.trigger	= omap_mcbsp_dai_trigger,
>  	.delay		= omap_mcbsp_dai_delay,
>  	.hw_params	= omap_mcbsp_dai_hw_params,
> -	.set_fmt_new	= omap_mcbsp_dai_set_dai_fmt,
> +	.set_fmt	= omap_mcbsp_dai_set_dai_fmt,
>  	.set_clkdiv	= omap_mcbsp_dai_set_clkdiv,
>  	.set_sysclk	= omap_mcbsp_dai_set_dai_sysclk,
>  };

-- 
Péter
