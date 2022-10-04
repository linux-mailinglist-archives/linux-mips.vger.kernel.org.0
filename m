Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D18C75F3C66
	for <lists+linux-mips@lfdr.de>; Tue,  4 Oct 2022 07:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbiJDFO3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Oct 2022 01:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiJDFO2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Oct 2022 01:14:28 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 588D9140BE;
        Mon,  3 Oct 2022 22:14:27 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id 13so26428992ejn.3;
        Mon, 03 Oct 2022 22:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
        bh=Yv5OGZFdWoPsWjg8zostaiKLIJnR6RXkR0HV3HfvtRs=;
        b=Lt89GQ+jWPo1QDov9W11zd44kwPa6h0ZYvuxFNgkDnBIPrGh31xIXBVOhoxlU3Nuuc
         v19fWDFkj5lx7S7xUY4Crr0bNWJ4lTPGsJzcdkDkq4YBvAtMJDN6TRvciMW0zVmSnnTD
         YH28NoRJp7zBwzjfEWCaEOTfpDCSudLeZrXg4VVlktXLIc67roO5DjcZrTojJNw4nezR
         Vad+MuwbC05cpl05A3IDk58BMOV0Yjl16olvNzlwY/52RgR1DeKh+U5MXrSjzwuSsqxI
         V9ZZn3G8ao20TkcGO10iQyHKcKdY4Ou+MUUExZq6yEpW4pTMVL50UIN1TJrzVoub0591
         Icrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date;
        bh=Yv5OGZFdWoPsWjg8zostaiKLIJnR6RXkR0HV3HfvtRs=;
        b=Xo8WybDu0GgTNQaeJHvleS/EwDT8LtZ0zK6Zg8HSbZD5RsltdHY/g6iAgIVYIySqzT
         qwWZEVSMy6w0bCC1nteM7vc3XXQlFRBmOH9kXRR2dw8EXvXVwQ6cBfP2vw7JCOfNM7RB
         DVZ+i7lQPyLgRdMcbYn+Np48ATIwRsPZThunlpW955HL5G0P8yeeLilc0y/z1Sd1q5G0
         rOfwkI6GSfQqxD8k282JSVXGTLa+IaHSjWAZ4W+Cyj/vD+UoeD5ixfMS9lVlftVw/cJC
         cRbWOwiBQJeCVQ5T2L/gVmCUvUay9AOXbiplGNZSDjg8DWZzqNeZwvpY9wky7hTitZXC
         /KQA==
X-Gm-Message-State: ACrzQf3ZV5iHAaY088Terybh8JBJaA23lM0mkMiv0c4AMrauVdVQHtrC
        wl9Gqj92T6hUxIee6AIL69w=
X-Google-Smtp-Source: AMsMyM5twZjBnULscb5TqdGxbbkL1wwzFTKORC1Xgut/J53AKPRxJd8AOrjt0ZRSXIdb8RMe/XiAeA==
X-Received: by 2002:a17:907:7fa3:b0:782:3034:cbc5 with SMTP id qk35-20020a1709077fa300b007823034cbc5mr17520247ejc.96.1664860465809;
        Mon, 03 Oct 2022 22:14:25 -0700 (PDT)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id hh14-20020a170906a94e00b0073dc4385d3bsm6450716ejb.105.2022.10.03.22.14.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 22:14:25 -0700 (PDT)
Message-ID: <d73089a7-f7ad-2f45-8307-3c4ec20cbb79@gmail.com>
Date:   Tue, 4 Oct 2022 07:14:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH v6 2/2] dt-bindings: mips: brcm: add Broadcom SoCs
 bindings
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        hauke@hauke-m.de, tsbogend@alpha.franken.de,
        zhouyanjie@wanyeetech.com, linux-mips@vger.kernel.org,
        arinc.unal@arinc9.com, f.fainelli@gmail.com,
        Rob Herring <robh@kernel.org>
References: <20221004050924.986211-1-sergio.paracuellos@gmail.com>
 <20221004050924.986211-3-sergio.paracuellos@gmail.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20221004050924.986211-3-sergio.paracuellos@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 4.10.2022 07:09, Sergio Paracuellos wrote:
> Add the yaml binding for MIPS Broadcom cable/DSL/settop platforms.
> 
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>   .../devicetree/bindings/mips/brcm/soc.yaml    | 98 +++++++++++++++++++
>   1 file changed, 98 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mips/brcm/soc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.yaml b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
> new file mode 100644
> index 000000000000..39b4609cd1cc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom cable/DSL/settop platforms
> +
> +maintainers:
> +  - Hauke Mehrtens <hauke@hauke-m.de>
> +  - Rafał Miłecki <zajec5@gmail.com>
> +  - Florian Fainelli <f.fainelli@gmail.com>

The only MIPS SoCs I really worked on were BCM47xx. I didn't do any real
work on cable/DSL/STB.

I don't really feel up to like maintaining those SoCs.


> +
> +description: |
> +    Boards Broadcom cable/DSL/settop SoC shall have the following properties.
> +    The experimental -viper variants are for running Linux on the 3384's
> +    BMIPS4355 cable modem CPU instead of the BMIPS5000 application processor.
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +
> +  compatible:
> +    enum:
> +      - brcm,bcm3368
> +      - brcm,bcm3384
> +      - brcm,bcm33843
> +      - brcm,bcm3384-viper
> +      - brcm,bcm33843-viper
> +      - brcm,bcm6328
> +      - brcm,bcm6358
> +      - brcm,bcm6362
> +      - brcm,bcm6368
> +      - brcm,bcm63168
> +      - brcm,bcm63268
> +      - brcm,bcm7125
> +      - brcm,bcm7346
> +      - brcm,bcm7358
> +      - brcm,bcm7360
> +      - brcm,bcm7362
> +      - brcm,bcm7420
> +      - brcm,bcm7425
> +
> +  cpus:
> +    type: object
> +    additionalProperties: false
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +      mips-hpt-frequency:
> +        description: MIPS counter high precision timer frequency.
> +         This is common to all CPUs in the system so it lives
> +         under the "cpus" node.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +    patternProperties:
> +      "^cpu@[0-9]$":
> +        type: object
> +        $ref: /schemas/mips/cpus.yaml#
> +        unevaluatedProperties: false
> +
> +    required:
> +      - mips-hpt-frequency
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +     / {
> +         compatible = "brcm,bcm3368";
> +         #address-cells = <1>;
> +         #size-cells = <1>;
> +         model = "Broadcom 3368";
> +
> +         cpus {
> +           #address-cells = <1>;
> +           #size-cells = <0>;
> +
> +           mips-hpt-frequency = <150000000>;
> +
> +           cpu@0 {
> +             compatible = "brcm,bmips4350";
> +             device_type = "cpu";
> +             reg = <0>;
> +           };
> +
> +           cpu@1 {
> +             compatible = "brcm,bmips4350";
> +             device_type = "cpu";
> +             reg = <1>;
> +           };
> +         };
> +       };
> +...

