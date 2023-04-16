Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85E4A6E3A87
	for <lists+linux-mips@lfdr.de>; Sun, 16 Apr 2023 19:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbjDPRbH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Apr 2023 13:31:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjDPRbG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Apr 2023 13:31:06 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7459193
        for <linux-mips@vger.kernel.org>; Sun, 16 Apr 2023 10:31:03 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id ud9so58195393ejc.7
        for <linux-mips@vger.kernel.org>; Sun, 16 Apr 2023 10:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681666262; x=1684258262;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t2xdlz8zT+95r3jmtcx8udaHAYRhzx4/xxqNOYfEnyQ=;
        b=UPY/xgMpRi7Kh3LDgP73wLTw2JkroVmtHnv/SAQoKEFd9c1Wf02DTgKcc1vp/Kxr73
         bdru6k/Dw1+Bm6LbrYS8dhsiZQOMSrbhyRRRX0meRpBqV/8g1Nx7ycJL5KjzZu+8gXPn
         aUjJe4lKUq8AenHDO+FCIYZWc76l/DCsxHz+15NYhpf+wBpRAn+tSFHrIBhhApOh++Gu
         TtZAW2J8607Q+zeHwPgkerUTI4O0T3R9rEtt/45UFrZbvYrYRiUN3JwNwgBHTMkt8fKv
         /8g+7NDp9FBTyowBuslUKfhZUdsPiCEg7MsPq3a0Q213pd85yUp4OubyfM0Djxbb3X7z
         e38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681666262; x=1684258262;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t2xdlz8zT+95r3jmtcx8udaHAYRhzx4/xxqNOYfEnyQ=;
        b=KBihvaJ4WnTHp1A4bZ333byiBsyaUHTHv0buH3+F0Dq3EVSuGarMiS5cSsACsrHvp3
         PDvB5c0ghSvtvWkS9idWR6M9J7sPV7bdFOZcfSSaepE267MElwL9AjwAoj60OnGt0z4f
         pYcCI1u4WyWNx66TbzlywXXFHgMiGJrdKZSq6fIW9aUM49Y+zgkqa45EUkSo4o6znbxN
         dhmaSdBVrNw6pPwrxX98x7zG28aBSVXt40mbNO1o2yWERgTHFkn6yfGc2GKc85YwN3wN
         ZqqTXuXVKhBXIjiP04GBzwPDVbTE7N05sKS9SgX4aHjfF+UgRe/Qx1G1Do+ZvA9bhH5+
         Njfg==
X-Gm-Message-State: AAQBX9fw8uqbN+3F79gRU8GbhcfhWEGuHwCFd5R6KQ68R/wSEeqvsA+c
        5bBtgE6jC1KiKRbob7FpUVGvmOPecMT6EK70b2w=
X-Google-Smtp-Source: AKy350bBiTeu1+2CyyTo8pFcohBJFEKu8qa2Y86EZfdwvjg5nTgSrLcbsgbgwIeXPh0aZSNxI/5L/A==
X-Received: by 2002:a17:906:2dd4:b0:94f:a03:3d3b with SMTP id h20-20020a1709062dd400b0094f0a033d3bmr4288204eji.20.1681666262173;
        Sun, 16 Apr 2023 10:31:02 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f9e3:1d38:66a7:ae92? ([2a02:810d:15c0:828:f9e3:1d38:66a7:ae92])
        by smtp.gmail.com with ESMTPSA id sg32-20020a170907a42000b008c16025b318sm5344804ejc.155.2023.04.16.10.31.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 10:31:01 -0700 (PDT)
Message-ID: <b4b23751-a44c-2b38-0d55-a34711ad53c4@linaro.org>
Date:   Sun, 16 Apr 2023 19:31:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V3 1/7] dt-bindings: rtc: Subdivision of LS2X RTC
 compatible
Content-Language: en-US
To:     Binbin Zhou <zhoubinbin@loongson.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>
Cc:     linux-rtc@vger.kernel.org, linux-mips@vger.kernel.org,
        loongarch@lists.linux.dev, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Qing Zhang <zhangqing@loongson.cn>,
        zhaoxiao <zhaoxiao@uniontech.com>, keguang.zhang@gmail.com
References: <cover.1681370153.git.zhoubinbin@loongson.cn>
 <35f43a8cfc32b5a065e4a04eb6cc6abf311f2700.1681370153.git.zhoubinbin@loongson.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <35f43a8cfc32b5a065e4a04eb6cc6abf311f2700.1681370153.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 13/04/2023 09:57, Binbin Zhou wrote:
> The LS2X RTC alarm depends on the associated registers in a separate
> power management domain.
> 
> In order to define the PM domain addresses of the different chips, a
> more detailed description of compatible is required.

This does not match your diff at all.

> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> index a3603e638c37..2928811b83a0 100644
> --- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> @@ -47,8 +47,11 @@ properties:
>        - isil,isl1218
>        # Intersil ISL12022 Real-time Clock
>        - isil,isl12022
> -      # Loongson-2K Socs/LS7A bridge Real-time Clock
> -      - loongson,ls2x-rtc

Why removing it?

> +      # Loongson LS7A bridge Real-time Clock
> +      - loongson,ls7a-rtc
> +      # Loongson-2K Socs Real-time Clock
> +      - loongson,ls2k0500-rtc
> +      - loongson,ls2k1000-rtc

That's even more surprising...

I don't understand what you are doing here at all.

Best regards,
Krzysztof

