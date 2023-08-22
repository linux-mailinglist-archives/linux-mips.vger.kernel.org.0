Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37848783970
	for <lists+linux-mips@lfdr.de>; Tue, 22 Aug 2023 07:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232869AbjHVFoi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Aug 2023 01:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232865AbjHVFoi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Aug 2023 01:44:38 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7174D7
        for <linux-mips@vger.kernel.org>; Mon, 21 Aug 2023 22:44:35 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-523b066d7ceso4906043a12.2
        for <linux-mips@vger.kernel.org>; Mon, 21 Aug 2023 22:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692683074; x=1693287874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Pz65IM6yK+nsY8GMYtZPvYOmwUF6F4yt+xPaiBO+hQ=;
        b=j0ze+Q9Xmul9BQ10lkn/30oKMU0MyDZKtP7kQkGfEnhhujbMxX7Ip2T/3BVh19T2IU
         pCzUdFVH3moQIcnmtDZdQeXuNpJmo5Kv+3i+BHQboEBpqFdd2/JYifyyhZHCpBSdXk9S
         6nZnfj0hOiXu74eY9Ly0NZyI3gOK4bnrWsik1o27xn7A9wUmRbW+wY4DigX2ZdZiVHwy
         h5QrSneVtgDKfqyZYSwUlyAKD5mVaMTHoproyvuT+UUjLWtElgjfZs+1qIe99hNqCnQf
         fLhPUGBIrZ1QY2KGIjkZd+Sq6sUJwTa/J7iiEgVwbQBl+Mb+LpeMziVfNTDXF4Op9lf4
         +JDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692683074; x=1693287874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Pz65IM6yK+nsY8GMYtZPvYOmwUF6F4yt+xPaiBO+hQ=;
        b=NdOj84NU9sZWM9y8TtLvjevbCo/fSzPMUD+K5EMRo6/vWIpxziaiZT1/mJ+zFgehSB
         35RNc80Ivb06eR53HYxZsOzVMLwZRbk4lP1yAoRxftWPJoUQDWoQXvcMhkELBhRhtQ29
         OyEeetAeFzfZtu4+2UhDJshXC6JYP60rt254iwQb2icIrjM9AICgagyqfbiczMzFSZS8
         Crl0Db1VyjN2rF8aEokcK4mFhHs14bhZgsngmw3FmJN4ma+AdjDym6i1/j2N4Lu3ftyN
         pYrTZVnyIVdVT7JmytKQ6r5FR+2E7JqnEMHTfPHAcQS7ZsS6EOOjr1Vi3G18eS2XT+fj
         wjrg==
X-Gm-Message-State: AOJu0YzLoT6wKi8fYO9U+Z8mE4mkYDl/FN7RdusK4yKPrazYmawjCuDa
        Dam7+jswVe5yS/OK+OLgD5x5Yg==
X-Google-Smtp-Source: AGHT+IFsW2EHW1wtQRSB+/XNA/5uXxvwe55YXZkjJn3VtfUvXo1Lrm3RDMPjqSfYk1A6u+bSg2Uevw==
X-Received: by 2002:a17:906:3089:b0:9a1:c216:c89c with SMTP id 9-20020a170906308900b009a1c216c89cmr26722ejv.66.1692683074320;
        Mon, 21 Aug 2023 22:44:34 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id bv17-20020a170906b1d100b00992e265495csm7557220ejb.212.2023.08.21.22.44.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 22:44:33 -0700 (PDT)
Message-ID: <e62185ca-cdf6-bde9-ad46-f4150db9ed6d@linaro.org>
Date:   Tue, 22 Aug 2023 07:44:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller: loongson,liointc:
 Fix warnings about liointc-2.0
To:     Binbin Zhou <zhoubinbin@loongson.cn>,
        Binbin Zhou <zhoubb.aaron@gmail.com>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        loongson-kernel@lists.loongnix.cn, devicetree@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, diasyzhang@tencent.com,
        linux-kernel@vger.kernel.org
References: <20230821061315.3416836-1-zhoubinbin@loongson.cn>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230821061315.3416836-1-zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 21/08/2023 08:13, Binbin Zhou wrote:
> Since commit f4dee5d8e1fa ("dt-bindings: interrupt-controller: Add
> Loongson-2K1000 LIOINTC"), the loongson liointc supports configuring
> routes for 64-bit interrupt sources.
> 
> For liointc-2.0, we need to define two liointc nodes in dts, one for
> "0-31" interrupt sources and the other for "32-63" interrupt sources.
> This applies to mips Loongson-2K1000.
> 
> Unfortunately, there are some warnings about "loongson,liointc-2.0":
> 1. "interrupt-names" should be "required", the driver gets the parent
> interrupts through it.

No, why? Parent? This does not make sense.

> 
> 2. Since not all CPUs are multicore, e.g. Loongson-2K0500 is a
> single-core CPU, there is no core1-related registers. So "reg" and
> "reg-names" should be set to "minItems 2".
> 
> 3. Routing interrupts from "int0" is a common solution in practice, but
> theoretically there is no such requirement, as long as conflicts are
> avoided. So "interrupt-names" should be defined by "pattern".

Why? What the pattern has to do with anything in routing or not routing
something?

> 
> This fixes dtbs_check warning:
> 
> DTC_CHK arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb
> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: interrupt-controller@1fe11440: interrupt-names:0: 'int0' was expected
>       From schema: Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: interrupt-controller@1fe11440: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
>       From schema: Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> 
> Fixes: f4dee5d8e1fa ("dt-bindings: interrupt-controller: Add Loongson-2K1000 LIOINTC")
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
> V2:
> 1. Update commit message;
> 2. "interruprt-names" should be "required", the driver gets the parent
> interrupts through it;
> 3. Add more descriptions to explain the rationale for multiple nodes;
> 4. Rewrite if-else statements.
> 
> Link to V1:
> https://lore.kernel.org/all/20230815084713.1627520-1-zhoubinbin@loongson.cn/
> 
>  .../loongson,liointc.yaml                     | 74 +++++++++----------
>  1 file changed, 37 insertions(+), 37 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> index 00b570c82903..f695d3a75ddf 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> @@ -11,11 +11,11 @@ maintainers:
>  
>  description: |
>    This interrupt controller is found in the Loongson-3 family of chips and
> -  Loongson-2K1000 chip, as the primary package interrupt controller which
> +  Loongson-2K series chips, as the primary package interrupt controller which
>    can route local I/O interrupt to interrupt lines of cores.
> -
> -allOf:
> -  - $ref: /schemas/interrupt-controller.yaml#
> +  In particular, the Loongson-2K1000/2K0500 has 64 interrupt sources that we
> +  need to describe with two dts nodes. One for interrupt sources "0-31" and
> +  the other for interrupt sources "32-63".
>  
>  properties:
>    compatible:
> @@ -24,15 +24,9 @@ properties:
>        - loongson,liointc-1.0a
>        - loongson,liointc-2.0
>  
> -  reg:
> -    minItems: 1
> -    maxItems: 3
> +  reg: true

No. Constraints must be here.

>  
> -  reg-names:
> -    items:
> -      - const: main
> -      - const: isr0
> -      - const: isr1
> +  reg-names: true

No, keep at least min/maxItems here.

>  
>    interrupt-controller: true
>  
> @@ -45,11 +39,9 @@ properties:
>    interrupt-names:
>      description: List of names for the parent interrupts.
>      items:
> -      - const: int0
> -      - const: int1
> -      - const: int2
> -      - const: int3
> +      pattern: int[0-3]
>      minItems: 1
> +    maxItems: 4

I don't see reason behind it.

>  
>    '#interrupt-cells':
>      const: 2
> @@ -69,32 +61,41 @@ required:
>    - compatible
>    - reg
>    - interrupts
> +  - interrupt-names

Why? You are doing multiple things at once, without proper explanation.

>    - interrupt-controller
>    - '#interrupt-cells'
>    - loongson,parent_int_map
>  
> -
>  unevaluatedProperties: false
>  
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        enum:
> -          - loongson,liointc-2.0
> -
> -then:
> -  properties:
> -    reg:
> -      minItems: 3
> -
> -  required:
> -    - reg-names
> -
> -else:
> -  properties:
> -    reg:
> -      maxItems: 1
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - loongson,liointc-2.0
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +          items:
> +            - description: Interrupt routing registers.
> +            - description: Low/high 32-bit interrupt status routed to core0.
> +            - description: Low/high 32-bit interrupt status routed to core1.
> +        reg-names:
> +          minItems: 2
> +          items:
> +            - const: main
> +            - const: isr0
> +            - const: isr1

Srsly, why this is moved here from the top? It does not make sense.

> +      required:
> +        - reg-names
> +    else:
> +      properties:
> +        reg:
> +          maxItems: 1

so reg-names can be "pink-pony"?

Best regards,
Krzysztof

