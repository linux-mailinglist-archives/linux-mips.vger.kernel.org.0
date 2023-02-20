Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF20369CB20
	for <lists+linux-mips@lfdr.de>; Mon, 20 Feb 2023 13:36:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbjBTMg4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Feb 2023 07:36:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbjBTMgz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Feb 2023 07:36:55 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 899F61ABFA
        for <linux-mips@vger.kernel.org>; Mon, 20 Feb 2023 04:36:53 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id b12so4068969edd.4
        for <linux-mips@vger.kernel.org>; Mon, 20 Feb 2023 04:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c9bk6+oU7r7LqrGqog3gYa5JEir5nO0erp+1IpOd/bk=;
        b=FGDseztLQfRF3u8tEYJZGhX7nDCfVfiIgefBwF6Q/Ezy5YanB/4nOEllpzsInHoIM1
         UERU7PIL1cMpxPvGthKPe5cFKZgFTP5FiD9N8dAaanAsWWou9JX5XAALt+ZbWLqf4WwH
         1TKw4bgqMMXDwRQnCST1F29trC/sUqmorYavQoCFoOfauMyO4agGhnk8FowtHnOQGU3t
         k9H1REOHDMQW47f7JCf5ZD/8v5LpeM8PcSPQd6shEaK1WBonxOIhaVfyJOy8jlSksGsy
         Hw4z2lqFS4mYSsVl75o3UdzWlIN3lgJeEP2zAJFDc/bsPWOTkBuJtrZ4zS686byuUGqS
         dguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c9bk6+oU7r7LqrGqog3gYa5JEir5nO0erp+1IpOd/bk=;
        b=H/t+h5uchFK2Gh+Da1s/SRI4XtVkEGhX63RdK+gsM19OSC01dZWCKxJtPebTnS37wR
         pLEXIUpM0KXapA9iGGEf0mvvofhDlAjDknTS4KOQQkZInwYxcQ63xHbyDN/N7WlFMLIL
         +qxcKjkuTnrmO5EbqIMy+3s9DFPZC70r2eP34V+nHo+3UCVqrhl8JjPl3vcqE+bRHQNM
         8j1+9Phnm7eowckcRG6gvqm/AWG2SZNuUOiJ1Y5BRJ9DgGGq7IQbfLqCGGloKSe+Nlz8
         5jpAf1kN6rKVqPpobXElEuKX4/0d3+z+aqKNYcOQiPxUAxUrk70pCgXZoW0KNicADDiF
         n70A==
X-Gm-Message-State: AO0yUKW5Yd1P0Rww0QQ3XUGc0ZsX0DMq2EAx1Lp9lRPHjCMF0CmmstOF
        vtoa9ukzkydqdzwwX49JeXFfNp9KbO1D94S/
X-Google-Smtp-Source: AK7set9jTy2U+SGl12BpD4a5QHyqIKMMbxeftfz7f9wD4BKSH8cNxsrFbirwOok8KO4rVdi1sBcumA==
X-Received: by 2002:aa7:d705:0:b0:4ac:b2c8:aeaf with SMTP id t5-20020aa7d705000000b004acb2c8aeafmr2179650edq.26.1676896612007;
        Mon, 20 Feb 2023 04:36:52 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y36-20020a50bb27000000b004ac54d4da22sm6125659ede.71.2023.02.20.04.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 04:36:51 -0800 (PST)
Message-ID: <926d3354-95c1-a6b0-38ad-f711c4ed6fe3@linaro.org>
Date:   Mon, 20 Feb 2023 13:36:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] dt-bindings: mips: loongson: Add Loongson-1 based boards
Content-Language: en-US
To:     Keguang Zhang <keguang.zhang@gmail.com>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230220113007.2037750-1-keguang.zhang@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220113007.2037750-1-keguang.zhang@gmail.com>
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

On 20/02/2023 12:30, Keguang Zhang wrote:
> Add two Loongson-1 based boards: LSGZ 1B and Smartloongson 1C.
> 
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
>  .../devicetree/bindings/mips/loongson/devices.yaml     | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mips/loongson/devices.yaml b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
> index f13ce386f42c..6ed6e8d1c0a6 100644
> --- a/Documentation/devicetree/bindings/mips/loongson/devices.yaml
> +++ b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
> @@ -37,6 +37,16 @@ properties:
>          items:
>            - const: loongson,loongson64v-4core-virtio
>  
> +      - description: LSGZ 1B Development Board
> +        items:
> +          - const: lsgz,1b

1. Undocumented vendor prefix
2. This should be rather enum as it will grow with more boards. Also
description could be rather - LS1B based boards.

> +          - const: loongson,ls1b
> +
> +      - description: Smart Loongson 1C Board
> +        items:
> +          - const: smartloongson,1c

Same comments.

> +          - const: loongson,ls1c
> +
>  additionalProperties: true
>  
>  ...
> 
> base-commit: 39459ce717b863556d7d75466fcbd904a6fbbbd8

Best regards,
Krzysztof

