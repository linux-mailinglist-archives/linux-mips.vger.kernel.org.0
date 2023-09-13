Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C186879EB9F
	for <lists+linux-mips@lfdr.de>; Wed, 13 Sep 2023 16:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238551AbjIMOvq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Sep 2023 10:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232416AbjIMOvp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 Sep 2023 10:51:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 347BEDC
        for <linux-mips@vger.kernel.org>; Wed, 13 Sep 2023 07:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694616653;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=48dU2hQLagIX9Pt08ex4VtPwEkzu69KnmACTk65vyqM=;
        b=SmPunnbk63JOIeDlEFY4SyMEudQEApGoa9etxptuCXALxxDchcouYiMHLipQe5mXz7rBoh
        oTtbGbz45x0WFDh/4iHsHppG5UiXj3VBS3jfsCltq4lbm5P8vmCIrvPTntsTAtlwM3I8v+
        5mySHhLeq5+E+7eipkYfOxM7DvQQ/yU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-myr5FgbGNfSCLUXHhwevig-1; Wed, 13 Sep 2023 10:50:52 -0400
X-MC-Unique: myr5FgbGNfSCLUXHhwevig-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9ad8ab8bc9fso131854966b.0
        for <linux-mips@vger.kernel.org>; Wed, 13 Sep 2023 07:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694616651; x=1695221451;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=48dU2hQLagIX9Pt08ex4VtPwEkzu69KnmACTk65vyqM=;
        b=K0uAzfQKiu4XQwaWgutn5DHjIiLWuVmXJnqN+utvEArLwijxDx9X0gKoxecZde6q8E
         2bHi+6FHsx8RgQsGTH6ZFAVpbTcyw1w4QhJdETt5jP6boQCxWI4cilcDlrpUtiy/R6rE
         3T8Nlr9ZR+sV79FNf2imdKfJllQLPRtfOmSX2Xu+ZiiM9vghYHl0emzbiP3U53/FyIFD
         Urp7KQ0sEdu0Aa0XlZIG2yVM4e2H34qu3VNbIl7CT0xK5TvmmvPVGd9958c4e8R6EeEX
         9V09A/H/pdGAjQi/7a0wxo+EMvcTMYZOptoJOa8yyljESksFsLGzXjRft4vgiGYw7n9+
         mjig==
X-Gm-Message-State: AOJu0YygcEaUfqvl9D1Ao8sU6Cm0HjGXwTYIFhDN0k3rxoBVWgelNlqx
        1kpj9/Yq/Ir4V2KvJYkRUFCLjyKclOwMSLuk8WHkg2+3uG5Q6F43qvwe540xEdq2geWTSqQlgyq
        ZHHdprIHzC8wOYreBKkM+dA==
X-Received: by 2002:a17:906:74c7:b0:9aa:1020:8c39 with SMTP id z7-20020a17090674c700b009aa10208c39mr2278137ejl.18.1694616650916;
        Wed, 13 Sep 2023 07:50:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhdz7s3zxkxrAka/iFct75EEOhxMraFKGaGoggnTBpq6sAIlALbnFygNuVs1AGvDyAjsOScA==
X-Received: by 2002:a17:906:74c7:b0:9aa:1020:8c39 with SMTP id z7-20020a17090674c700b009aa10208c39mr2278116ejl.18.1694616650569;
        Wed, 13 Sep 2023 07:50:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n3-20020a17090695c300b0099bc8bd9066sm8613848ejy.150.2023.09.13.07.50.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 07:50:50 -0700 (PDT)
Message-ID: <5cff2031-e25f-4222-4d1f-b0b7d87b355b@redhat.com>
Date:   Wed, 13 Sep 2023 16:50:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/5] platform/x86: int3472/discrete: use
 gpiod_set_active_low()
Content-Language: en-US, nl
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mtd@lists.infradead.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230913115001.23183-1-brgl@bgdev.pl>
 <20230913115001.23183-5-brgl@bgdev.pl>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230913115001.23183-5-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On 9/13/23 13:50, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Use the new polarity setter instead of the more cumbersome toggle
> function.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/platform/x86/intel/int3472/clk_and_regulator.c | 2 +-
>  drivers/platform/x86/intel/int3472/led.c               | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> index ef4b3141efcd..31e520838b95 100644
> --- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> +++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> @@ -183,7 +183,7 @@ int skl_int3472_register_gpio_clock(struct int3472_discrete_device *int3472,
>  	}
>  
>  	if (polarity == GPIO_ACTIVE_LOW)
> -		gpiod_toggle_active_low(int3472->clock.ena_gpio);
> +		gpiod_set_active_low(int3472->clock.ena_gpio);
>  
>  	/* Ensure the pin is in output mode and non-active state */
>  	gpiod_direction_output(int3472->clock.ena_gpio, 0);
> diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
> index bca1ce7d0d0c..46c9c569df5e 100644
> --- a/drivers/platform/x86/intel/int3472/led.c
> +++ b/drivers/platform/x86/intel/int3472/led.c
> @@ -32,7 +32,7 @@ int skl_int3472_register_pled(struct int3472_discrete_device *int3472,
>  				     "getting privacy LED GPIO\n");
>  
>  	if (polarity == GPIO_ACTIVE_LOW)
> -		gpiod_toggle_active_low(int3472->pled.gpio);
> +		gpiod_set_active_low(int3472->pled.gpio);
>  
>  	/* Ensure the pin is in output mode and non-active state */
>  	gpiod_direction_output(int3472->pled.gpio, 0);


Thanks. I agree that the new API is much better:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Feel free to merge this through the GPIO tree.

Regards,

Hans



