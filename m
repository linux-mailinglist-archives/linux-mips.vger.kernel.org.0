Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E87577C075
	for <lists+linux-mips@lfdr.de>; Mon, 14 Aug 2023 21:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231974AbjHNTM0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Aug 2023 15:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231985AbjHNTL4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 14 Aug 2023 15:11:56 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D03FE1703
        for <linux-mips@vger.kernel.org>; Mon, 14 Aug 2023 12:11:51 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99d6d5054bcso873459466b.1
        for <linux-mips@vger.kernel.org>; Mon, 14 Aug 2023 12:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692040310; x=1692645110;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mo9zfMF4rzhISKZ3uWZNmfx0/F+q0VWq5mhKXrJtzwg=;
        b=G5LuqB47KqASYkQCxngknTDuDLpMahbLF9i4GmcHbdeToC9cx/igeI7mCHVSSwX8UT
         pWG+tKcn+L8FnXY2Xu5D0jKhRkjL8cqEq8D7iZlRONg6d6kNri+A391waYWwsa1h4Ydh
         E7EU8RH/S3N/YibvbVEeoKa+aTHRodd7nL635F+bWm0a0hiaSiz0irCxfaUQP6Lj2V9W
         Q+QUiRlxhJfWZEGZK0VVhqzelgNSa9RmXfIw67gPMNovAyx9xp/M5TF+UhCreJA8DAtu
         PqQbFxI8jXMgXo/dqfSb9L8s64JdVTogaLBajvRM+kP/soAF7TOvGUpM65c5A/QwXr1I
         +foA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692040310; x=1692645110;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mo9zfMF4rzhISKZ3uWZNmfx0/F+q0VWq5mhKXrJtzwg=;
        b=fKA8EwTnj9YtBefGGswum15iVxsULeSgONlQRHhRmRDKwRIrvFeDe1XyjcyR36yYgz
         bcmeIb1yfFHLoGV9s/SyUfAGnaEsR3THJS1w4jhd3A3kQa5j7QsJc68pD8or4gPLgCH4
         PLlKal9qx37UqjPRllMsNvRLiHJbaX4DcohcyxzESBg0YPTIU5Yd1vBevXMRfCJp4rxR
         ouBlwoAfjTNxG7r30r/cSKzR7hnm3YI0JxIUFqydaJ23aA7WUq630B29Fhte1Ul7iKHD
         SzCl4sUGiU0ANnuZQl66XoDWNU6wvpYg3LYl1Fmsr+tcP9jldyT/pfa7H3vSx+xxi6RD
         iBsg==
X-Gm-Message-State: AOJu0Ywd8U8aUoT5l9tHSlji6tFiBc2OsZprkBMrnjvxgSimNPrULcKU
        3eiY95Cl4xLu4ZlnDP+8h6gr4Q==
X-Google-Smtp-Source: AGHT+IGLcWiHa+m0i2IU1V4krPCSZTNR6TfQG1pTLgEyD0EoKeloaegoQm8ZqHLBojqoawO2eKacvw==
X-Received: by 2002:a17:907:7789:b0:99b:cdfd:fb44 with SMTP id ky9-20020a170907778900b0099bcdfdfb44mr12190607ejc.9.1692040310238;
        Mon, 14 Aug 2023 12:11:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id s6-20020a170906454600b0099cd1c0cb21sm5892574ejq.129.2023.08.14.12.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 12:11:49 -0700 (PDT)
Message-ID: <2d672791-2194-8d66-9de2-a8bf0e4db088@linaro.org>
Date:   Mon, 14 Aug 2023 21:11:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 3/5] dt-bindings: net: Add Loongson-1 DWMAC glue layer
Content-Language: en-US
To:     Keguang Zhang <keguang.zhang@gmail.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>
References: <20230812151135.1028780-1-keguang.zhang@gmail.com>
 <20230812151135.1028780-4-keguang.zhang@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230812151135.1028780-4-keguang.zhang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/08/2023 17:11, Keguang Zhang wrote:
> Add devicetree binding document for Loongson-1 DWMAC glue layer.
> 
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
>  .../bindings/net/loongson,ls1x-dwmac.yaml     | 98 +++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml   |  2 +
>  2 files changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/loongson,ls1x-dwmac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/loongson,ls1x-dwmac.yaml b/Documentation/devicetree/bindings/net/loongson,ls1x-dwmac.yaml
> new file mode 100644
> index 000000000000..150799460599
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/loongson,ls1x-dwmac.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/loongson,ls1x-dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson-1 DWMAC glue layer
> +
> +maintainers:
> +  - Keguang Zhang <keguang.zhang@gmail.com>
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - loongson,ls1b-dwmac
> +          - loongson,ls1c-dwmac
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - loongson,ls1b-dwmac
> +          - loongson,ls1c-dwmac
> +      - const: snps,dwmac-3.50a
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: stmmaceth

This should be list (items) with one const item.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    const: macirq

Ditto

> +
> +  syscon:

Let me quote:

"Phandle to syscon device requires a vendor, descriptive name and a
description"

You only got description right.

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the syscon containing some extra configurations
> +      including PHY interface mode.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - phy-handle
> +  - phy-mode

Drop, it is not defined here and already required by snps,dwmac.

> +  - syscon
> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/loongson,ls1x-clk.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    gmac0: ethernet@1fe10000 {
> +        compatible = "loongson,ls1b-dwmac", "snps,dwmac-3.50a";
> +        reg = <0x1fe10000 0x10000>;
> +
> +        clocks = <&clkc LS1X_CLKID_AHB>;
> +        clock-names = "stmmaceth";
> +
> +        interrupt-parent = <&intc1>;
> +        interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "macirq";
> +
> +        phy-handle = <&phy0>;
> +        phy-mode = "mii";
> +
> +        snps,pbl = <1>;
> +        syscon = <&syscon>;
> +
> +        mdio {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            compatible = "snps,dwmac-mdio";
> +
> +            phy0: ethernet-phy@0 {
> +                reg = <0x0>;
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index ddf9522a5dc2..e1a956cf171e 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -66,6 +66,8 @@ properties:
>          - ingenic,x2000-mac
>          - loongson,ls2k-dwmac
>          - loongson,ls7a-dwmac
> +        - loongson,ls1b-dwmac
> +        - loongson,ls1c-dwmac

You should not need it. Isn't snps,dwmac-3.50a already there? Anyway,
not alphabetically ordered...

>          - qcom,qcs404-ethqos
>          - qcom,sa8775p-ethqos
>          - qcom,sc8280xp-ethqos

Best regards,
Krzysztof

