Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3EA15064B2
	for <lists+linux-mips@lfdr.de>; Tue, 19 Apr 2022 08:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348769AbiDSGoo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Apr 2022 02:44:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238054AbiDSGoo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Apr 2022 02:44:44 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25F4A2AE2D
        for <linux-mips@vger.kernel.org>; Mon, 18 Apr 2022 23:42:00 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id b15so19979519edn.4
        for <linux-mips@vger.kernel.org>; Mon, 18 Apr 2022 23:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=crADoU7TuQHIvNUCkN3bftpXZTQCbbgAEyPuKyFnosA=;
        b=kAxwmtbFjL2vIdyOc0SJTzQ1jRxFAwAUqZgQ5ZkF1NnHm/Blxgwz0k4NqRpDIYYQ78
         xhSPQgOzkY9gQf99yy3p41mmtlzDPDmiYI52EsDiF+zGA+55HjVgUpusGGDgep56zcNq
         bUtdQi87v1F95EInqQD+8T4uTWUmj2yzlZu6IWdrpAQCptuo+9OTisBgR0v3WQy/VraS
         RrxbA/RZxjNO1u8ZrFuYuENtRVtEjLz3ninsRhxtlVNMfTB7+tnBfzxAUWAJvTHO+k7a
         QPNNa95lLWCrzTe18SxlB0kCZGLXQ4g87upZCMEyWRVcJr0ZmDYEoSVnsq9HjMb7VAZN
         ZxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=crADoU7TuQHIvNUCkN3bftpXZTQCbbgAEyPuKyFnosA=;
        b=m9SWG7gw26nPGoJUF2lFTiMTpCijqF8iSCXL4lq9i5Kyra4oKMXCljGWDHKjK/RtnQ
         lTHlsXCQPs3mWLmMHk8kiTyvdQury4VFCoq1IrnjEAXMnAeC3cWcbiY4oIV7XmFuI2pb
         n7mrO86UYWiT+WpGLd8KgHBAXdd4YUEmIFVU0/WNejiM5RxSESq2dNrNRBCrBCil6CMc
         Diab3VhFQovN3dVa6fRtaH8FKIRqRSXhd5ltvL2JCWx7sacrYkdASDbSiszTd+vDyy/U
         GPTHzDCJflvwqZIULpeQ842k1rKrDIK1CqXUtd2+cX+it9fqaczKko9fpxQD5sPgyPww
         Bo4g==
X-Gm-Message-State: AOAM533G7cYhEl91f+tLWuKFRSnctDP51YAuL+QWeyeOgz6H+kyztKu5
        lcnv71Cq73aOvDY4BKzwvHs7Vg==
X-Google-Smtp-Source: ABdhPJwzHBRz4mz5yTbCzi/y8+W/yiUPkQ8vl23P9aHgnApQ8eiW8ymYJ0xHpdkdGZF7fZE8OTCANQ==
X-Received: by 2002:a05:6402:909:b0:415:cdbf:4748 with SMTP id g9-20020a056402090900b00415cdbf4748mr15663935edz.395.1650350518753;
        Mon, 18 Apr 2022 23:41:58 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q14-20020a17090622ce00b006e898c912e5sm5303190eja.217.2022.04.18.23.41.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Apr 2022 23:41:58 -0700 (PDT)
Message-ID: <1e9bf9d6-cd5a-6a47-f0d7-5a4bc6e6d2f0@linaro.org>
Date:   Tue, 19 Apr 2022 08:41:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/5] dt-bindings: rtc: Rework compatible strings and add
 #clock-cells
Content-Language: en-US
To:     Paul Cercueil <paul@crapouillou.net>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     list@opendingux.net, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220418184933.13172-1-paul@crapouillou.net>
 <20220418184933.13172-2-paul@crapouillou.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220418184933.13172-2-paul@crapouillou.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 18/04/2022 20:49, Paul Cercueil wrote:
> The RTC in the JZ4770 is compatible with the JZ4760, but has an extra
> register that permits to configure the behaviour of the CLK32K pin. The
> same goes for the RTC in the JZ4780.
> 
> Therefore, the ingenic,jz4770-rtc and ingenic,jz4780-rtc strings do not
> fall back anymore to ingenic,jz4760-rtc. The ingenic,jz4780-rtc string
> now falls back to the ingenic,jz4770-rtc string.
> 
> Additionally, since the RTCs in the JZ4770 and JZ4780 support outputting
> the input oscillator's clock to the CLK32K pin, the RTC node is now also
> a clock provider on these SoCs, so a #clock-cells property is added.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> ---
>  Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml b/Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml
> index b235b2441997..57393c3ac724 100644
> --- a/Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml
> @@ -18,14 +18,14 @@ properties:
>        - enum:
>            - ingenic,jz4740-rtc
>            - ingenic,jz4760-rtc
> +          - ingenic,jz4770-rtc
>        - items:
>            - const: ingenic,jz4725b-rtc
>            - const: ingenic,jz4740-rtc
>        - items:
>            - enum:
> -              - ingenic,jz4770-rtc
>                - ingenic,jz4780-rtc
> -          - const: ingenic,jz4760-rtc
> +          - const: ingenic,jz4770-rtc
>  
>    reg:
>      maxItems: 1
> @@ -39,6 +39,9 @@ properties:
>    clock-names:
>      const: rtc
>  
> +  "#clock-cells":
> +    const: 0
> +
>    system-power-controller:
>      description: |
>        Indicates that the RTC is responsible for powering OFF

Inside allOf:if:then:, please add a constraint which compatible cannot
have clock-cells (or maybe better which can?).

Some modification of:
https://elixir.bootlin.com/linux/v5.17-rc2/source/Documentation/devicetree/bindings/media/renesas,vsp1.yaml#L53

Best regards,
Krzysztof
