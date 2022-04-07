Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB2B14F7F1A
	for <lists+linux-mips@lfdr.de>; Thu,  7 Apr 2022 14:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243025AbiDGMfC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Apr 2022 08:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245249AbiDGMen (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 Apr 2022 08:34:43 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA2C127BF4
        for <linux-mips@vger.kernel.org>; Thu,  7 Apr 2022 05:32:42 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id r13so7618380wrr.9
        for <linux-mips@vger.kernel.org>; Thu, 07 Apr 2022 05:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=mbTY3i1nofmXcsRX/gWf8gHaHdMCsSLf8JrecOEU+cw=;
        b=2ONBB+sJjjO/yEH3LwBOk834Exd0XtoibKkng2qA6BQ7lQ5wM+bJCkSWcreG93DtqD
         7VY4riYcTScTZSI4ldR9U7hBsMHA+cVPVUVVigKHU9Vjd0pFzsBOhIvdbS9dMBusG8jT
         suE0KbgnAZL7POk29sM4LWxXBSO34C6CfhDdpF6OZUWlfLc4h616O8pIfMv+IRzXXK40
         0LsNAxKmW2NgB3r7c0j7wcXi/d30ktU+3oiRoyOUFVbtrc4m1idz+VyMLgf/IAeITcsD
         Ei7O4SwWlLOin231bi1PzwWAnWvAhsHcPBv30ocA13WN7F8Lv6gNZy29dcTEO2ECx8Ef
         G0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=mbTY3i1nofmXcsRX/gWf8gHaHdMCsSLf8JrecOEU+cw=;
        b=mg5Z/nojIol79gQjnf7akdsQKCkfLYZi3E/DXqRfzkHVk8585jcLQEEeiafoqMAzvt
         arIt2YH0FTyA76hCn+itq84aJwuy2k7qntxXVzKmObNG9hLUzYpRa+EsZzUiDLltxS/u
         RoQ+NFrXWeC7ewmXI1MT7I8duNB2RQMS1FoWAIlmAuTmbIy3IH3o7nb4Z/ebEzzcwbbI
         pbARJJfYqVkVYqX035ILXzoNZ+YC62BZ+rS5YKoAy9OnsVllbeKqPeUyXaiiGad+TLJS
         osmvbGfdR9jB0fP/fGG5okydrhkg4ex9In+61ImMFzK5MnuTvuCCecfn6aqG/Qgc3NQY
         O7ow==
X-Gm-Message-State: AOAM531ee9jkbR9BdealIDyx9/7lF2XWdl1Gercj7aBcglAocSFq9CkP
        fK428HRNPfwjHT3fJ/rt5Uti1A==
X-Google-Smtp-Source: ABdhPJz4y5wp1HQZyoUslQOF0q12YchRb09PY0LcNzFEGXXYko9LlR/yXAwMxL4UXjQ/qYkKfGQXgg==
X-Received: by 2002:a05:6000:1202:b0:206:1868:721f with SMTP id e2-20020a056000120200b002061868721fmr10847209wrx.292.1649334759373;
        Thu, 07 Apr 2022 05:32:39 -0700 (PDT)
Received: from [10.1.3.188] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id p1-20020a5d59a1000000b002078c8b6dabsm1257752wrr.9.2022.04.07.05.32.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 05:32:38 -0700 (PDT)
Message-ID: <fb445c84-9d86-7ee8-c963-ae8d6fc31cf5@baylibre.com>
Date:   Thu, 7 Apr 2022 14:32:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v18 1/3] drm/bridge: display-connector: add ddc-en gpio
 support
Content-Language: en-US
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <robert.foss@linaro.org>,
        Paul Boddie <paul@boddie.org.uk>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Paul Cercueil <paul@crapouillou.net>,
        Maxime Ripard <maxime@cerno.tech>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jonas Karlman <jonas@kwiboo.se>, linux-mips@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        letux-kernel@openphoenux.org
References: <cover.1649330170.git.hns@goldelico.com>
 <3607e924b7c0cf0be956c0d49894be1442dbda41.1649330171.git.hns@goldelico.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <3607e924b7c0cf0be956c0d49894be1442dbda41.1649330171.git.hns@goldelico.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 07/04/2022 13:16, H. Nikolaus Schaller wrote:
> "hdmi-connector.yaml" bindings defines an optional property
> "ddc-en-gpios" for a single gpio to enable DDC operation.
> 
> Usually this controls +5V power on the HDMI connector.
> This +5V may also be needed for HPD.
> 
> This was not reflected in code but is needed to make the CI20
> board work.
> 
> Now, the driver activates the ddc gpio after probe and
> deactivates after remove so it is "almost on".
> 
> But only if this driver is loaded (and not e.g. blacklisted
> as module).
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/gpu/drm/bridge/display-connector.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
> index d24f5b90feabf..e4d52a7e31b71 100644
> --- a/drivers/gpu/drm/bridge/display-connector.c
> +++ b/drivers/gpu/drm/bridge/display-connector.c
> @@ -24,6 +24,7 @@ struct display_connector {
>   	int			hpd_irq;
>   
>   	struct regulator	*dp_pwr;
> +	struct gpio_desc	*ddc_en;
>   };
>   
>   static inline struct display_connector *
> @@ -345,6 +346,17 @@ static int display_connector_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> +	/* enable DDC */
> +	if (type == DRM_MODE_CONNECTOR_HDMIA) {
> +		conn->ddc_en = devm_gpiod_get_optional(&pdev->dev, "ddc-en",
> +						       GPIOD_OUT_HIGH);
> +
> +		if (IS_ERR(conn->ddc_en)) {
> +			dev_err(&pdev->dev, "Couldn't get ddc-en gpio\n");
> +			return PTR_ERR(conn->ddc_en);
> +		}
> +	}
> +
>   	conn->bridge.funcs = &display_connector_bridge_funcs;
>   	conn->bridge.of_node = pdev->dev.of_node;
>   
> @@ -373,6 +385,9 @@ static int display_connector_remove(struct platform_device *pdev)
>   {
>   	struct display_connector *conn = platform_get_drvdata(pdev);
>   
> +	if (conn->ddc_en)
> +		gpiod_set_value(conn->ddc_en, 0);
> +
>   	if (conn->dp_pwr)
>   		regulator_disable(conn->dp_pwr);
>   

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
