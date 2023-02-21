Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8122B69DDF6
	for <lists+linux-mips@lfdr.de>; Tue, 21 Feb 2023 11:37:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233604AbjBUKg7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Feb 2023 05:36:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233226AbjBUKg6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Feb 2023 05:36:58 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7093D252B7
        for <linux-mips@vger.kernel.org>; Tue, 21 Feb 2023 02:36:56 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id ec43so14692445edb.8
        for <linux-mips@vger.kernel.org>; Tue, 21 Feb 2023 02:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j8j7KTBK9Rfc7IY0LrJUgT9g3CY++MiN0OpCXK6gjow=;
        b=a1zO2uUkn8gyZgBynjbVl/d9OE9Y50Z3oEMzWjIWEanGIRTKhUdNVAAUBdM6Km9RkS
         CjtWeaCO2DJvIP6n2CuyCUFkpYCeYjKPQva0wK9WM4WGknT/Ng94yS5LqWqxS++LW7Sm
         ZFAQJOkQjw9CccDIIHqpt6/tsS+2RWE4pBLhE2QdJYo1+sm25qkD8d3g4F5wq7vfGB/Q
         LT4Ka6CNiWWPDmNnL1E/stYA6Jwv+EeSy+rvzBtFixj6fP54rQXN0pvNrBkRj7KpAZQn
         e1nfz93VAK+763heL8/iudj+lZvQ6THrxdFuo8m3A4lGEmRsLY51TJMruVzr4Qtgg1hj
         F3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j8j7KTBK9Rfc7IY0LrJUgT9g3CY++MiN0OpCXK6gjow=;
        b=Dv8SyzCnqjNOyJkNB4eqKJMAPwVwzKpKZ9qavzppMB/5xTwA2Yi0YZ9sV1E1kX6UVV
         Qkns2ovheeeLtnBysorLNGoQzYdzt/r27AycbZ0VCoCZFAkm6bh6jIp5YDIs7EqJvWXs
         pwye7SPcFzY5emo0q2UUYixvUzB4SU3B7Vq9QgB9SWB5HJbsd3W/xGBMs9Qvdb2AWaZv
         SgiXgNQ77IAK6k2u3CpqUr/frD4+wl5uCLPXafzylqJlaGUGOnnqJeyTJ2xJebIYxEmS
         q9MgbjbOD/OaeIPQoTlnRYUBjmKKeyYxav18Lb4tx33VwZ5RPOi5E94bwHqI4XjGIl0X
         /SGQ==
X-Gm-Message-State: AO0yUKUhmx9QQ0ZIlKWAJxIOMQiUyA5G5qyay5666x9mXj9VUQSnSJvD
        x0fVs7YnVBVQT0uUONgfm2Wo0A==
X-Google-Smtp-Source: AK7set+fclxknO6q+GhGGpmhl8PRP6hAQGRweZutdt7Q+px+bFZr/53+/bfmjE2zzKXpIn4koakKwA==
X-Received: by 2002:a05:6402:1a32:b0:4a0:e31a:434 with SMTP id be18-20020a0564021a3200b004a0e31a0434mr4536646edb.27.1676975814933;
        Tue, 21 Feb 2023 02:36:54 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v18-20020a509552000000b004a23558f01fsm2034046eda.43.2023.02.21.02.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 02:36:54 -0800 (PST)
Message-ID: <cc0c458c-8c4b-c187-8b65-5943499ddf94@linaro.org>
Date:   Tue, 21 Feb 2023 11:36:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] dt-bindings: mips: loongson: Add Loongson-1 based
 boards
Content-Language: en-US
To:     Keguang Zhang <keguang.zhang@gmail.com>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230221102605.2103657-1-keguang.zhang@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230221102605.2103657-1-keguang.zhang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 21/02/2023 11:26, Keguang Zhang wrote:
> Add two Loongson-1 based boards: LSGZ 1B and Smartloong 1C.
> 
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
> V1 -> V2: Add the according vendor prefix
>           Change the board string to enum
>           Modify the board description

Thank you for your patch. There is something to discuss/improve.

> ---
>  .../devicetree/bindings/mips/loongson/devices.yaml   | 12 ++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml         |  2 ++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mips/loongson/devices.yaml b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
> index f13ce386f42c..15a43ce51bbf 100644
> --- a/Documentation/devicetree/bindings/mips/loongson/devices.yaml
> +++ b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
> @@ -37,6 +37,18 @@ properties:
>          items:
>            - const: loongson,loongson64v-4core-virtio
>  
> +      - description: LS1B based boards
> +        items:
> +          - enum:
> +              - loongson,lsgz-1b-dev
> +          - const: loongson,ls1b
> +
> +      - description: LS1C based boards
> +        items:
> +          - enum:
> +              - loongsonclub,smartloong-1c
> +          - const: loongson,ls1c
> +
>  additionalProperties: true
>  
>  ...
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 0e57ae744199..47565ebae4d1 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -757,6 +757,8 @@ patternProperties:
>      description: Lontium Semiconductor Corporation
>    "^loongson,.*":
>      description: Loongson Technology Corporation Limited
> +  "^loongsonclub,.*":
> +    description: Loongson Club

Are you sure that this is a board manufacturer?

Best regards,
Krzysztof

