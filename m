Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3654FFA09
	for <lists+linux-mips@lfdr.de>; Wed, 13 Apr 2022 17:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234858AbiDMP1z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Apr 2022 11:27:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231797AbiDMP1y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 Apr 2022 11:27:54 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CD205D670
        for <linux-mips@vger.kernel.org>; Wed, 13 Apr 2022 08:25:33 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id bv19so4688467ejb.6
        for <linux-mips@vger.kernel.org>; Wed, 13 Apr 2022 08:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=E/KosFpseT7IWJRZQCnSiS447R6ssnKcrthoESTGiCY=;
        b=Vh4Nsq/68C5HjeI3A+yT1TCrzlxkKT0sfz8S3WArS7wXqU2HMY1kjSoZ15QEZmFtM6
         OFYv1iWTnr+tlMIiILChInAOK+egjDR+MtIwNLJlFgSPS0IaHvcSB/B8FcrmDr+ZyIDg
         IiiQB3pNO94TEGvLWtXS/CjPEk0O7T7J0MsTPVtfkCt+WO4kRbnT4evsF7X3kPB8ayF4
         5J/XJAFVO/Wopdl0EmW8QilO0Iz/XWwoNMkPhoQJPNm2KavV8w9DXemGntKKxv+uKR1E
         Mxe3ylpT7zTGScy4KM865rbxBZMJ4K0dj47qLEXSEyh6zUTCCLXrC6xnjkDTbvcgjPHW
         96/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=E/KosFpseT7IWJRZQCnSiS447R6ssnKcrthoESTGiCY=;
        b=sAu+Q20RnzggIF9c55d6bnjSEuXNfmqqDSMZGZwAXnw+bFrxwOr5FrHVPQwsYFxmWo
         G7TKyvEoEErAWiQHx7rJnlQIsn087A3VJy6eUx1nymoLmyVwfMrT93x65innI2uprshx
         72M/XXTbsuW7qr+MSUSLDvg9oBuOVybU0Iw4pY1z7xFMWht95iXA+0zUuCJSyawEJLiR
         mwitn4Veq+K4Nyvh1guOdFF7+512/PWfIURqW5i4sj7VxzkjD8sKA/mNm8lJ4UJOQgU9
         9EfGKw8AZpG1TfxOsEdVjOp7X+vEEjMHmGufcKmmz0yVHES/d3cK7qMfysjlzKA5EL2d
         Jxyg==
X-Gm-Message-State: AOAM532GLteKcf/dt3vyh8AZpkwYBaY488PJrBMVDI4h+MyusE82z63i
        Jz5pmoa+8VR1c5jKU1lGXyp1Yw==
X-Google-Smtp-Source: ABdhPJy/Caleobpyz0qcwl3NnfHCSIKGS22hcXQsHSSVLfDURXci+05UMvKVZOUGgl9LtMNCuV3Fuw==
X-Received: by 2002:a17:907:2d27:b0:6e8:3ea6:7645 with SMTP id gs39-20020a1709072d2700b006e83ea67645mr28970048ejc.727.1649863531801;
        Wed, 13 Apr 2022 08:25:31 -0700 (PDT)
Received: from [192.168.0.205] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id h7-20020a1709060f4700b006e8d0746969sm83440ejj.222.2022.04.13.08.25.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 08:25:30 -0700 (PDT)
Message-ID: <ba7cd13f-d216-0ac6-97e1-6c13f1e15f38@linaro.org>
Date:   Wed, 13 Apr 2022 17:25:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 10/14] dt-bindings: pinctrl: rt2880: fix binding name, pin
 groups and functions
Content-Language: en-US
To:     =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Luiz Angelo Daros de Luca <luizluca@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     erkin.bozoglu@xeront.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
 <20220413060729.27639-11-arinc.unal@arinc9.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220413060729.27639-11-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 13/04/2022 08:07, Arınç ÜNAL wrote:
> Change binding name from ralink,rt2880-pinmux to ralink,rt2880-pinctrl.
> This is the binding for the Ralink RT2880 pinctrl subdriver.

What I don't see here is why you are doing this. pinmux/pinctrl have the
same meaning, I guess?

> 
> Current pin group and function bindings are for MT7621. Put bindings for
> RT2880 instead.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  ...pinmux.yaml => ralink,rt2880-pinctrl.yaml} | 24 +++++++++----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>  rename Documentation/devicetree/bindings/pinctrl/{ralink,rt2880-pinmux.yaml => ralink,rt2880-pinctrl.yaml} (56%)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
> similarity index 56%
> rename from Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml
> rename to Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
> index 9de8b0c075e2..c657bbf9fdda 100644
> --- a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
> @@ -1,21 +1,23 @@
>  # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/pinctrl/ralink,rt2880-pinmux.yaml#
> +$id: http://devicetree.org/schemas/pinctrl/ralink,rt2880-pinctrl.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Ralink rt2880 pinmux controller
> +title: Ralink RT2880 Pin Controller
>  
>  maintainers:
> +  - Arınç ÜNAL <arinc.unal@arinc9.com>

Mention this in commit msg.

>    - Sergio Paracuellos <sergio.paracuellos@gmail.com>
>  
>  description:
> -  The rt2880 pinmux can only set the muxing of pin groups. Muxing indiviual pins
> +  Ralink RT2880 pin controller for RT2880 SoC.
> +  The pin controller can only set the muxing of pin groups. Muxing indiviual pins
>    is not supported. There is no pinconf support.
>  
>  properties:
>    compatible:
> -    const: ralink,rt2880-pinmux
> +    const: ralink,rt2880-pinctrl

you need to deprecate old property and add a new one.


>  
>  patternProperties:
>    '-pins$':
> @@ -28,14 +30,12 @@ patternProperties:
>  
>          properties:
>            groups:
> -            description: Name of the pin group to use for the functions.
> -            enum: [i2c, jtag, mdio, pcie, rgmii1, rgmii2, sdhci, spi,
> -                   uart1, uart2, uart3, wdt]
> +            description: The pin group to select.
> +            enum: [i2c, spi, uartlite, jtag, mdio, sdram, pci]
> +
>            function:
> -            description: The mux function to select
> -            enum: [gpio, i2c, i2s, jtag, mdio, nand1, nand2, pcie refclk,
> -                   pcie rst, pcm, rgmii1, rgmii2, sdhci, spdif2, spdif3,
> -                   spi, uart1, uart2, uart3, wdt refclk, wdt rst]
> +            description: The mux function to select.
> +            enum: [gpio, i2c, spi, uartlite, jtag, mdio, sdram, pci]
>  

These were all incorrect for rt2880, I understand?


Best regards,
Krzysztof
