Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA7C55F21D9
	for <lists+linux-mips@lfdr.de>; Sun,  2 Oct 2022 10:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbiJBIDd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 2 Oct 2022 04:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiJBIDa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 2 Oct 2022 04:03:30 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 600F032BBA
        for <linux-mips@vger.kernel.org>; Sun,  2 Oct 2022 01:03:29 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id by7so3128932ljb.6
        for <linux-mips@vger.kernel.org>; Sun, 02 Oct 2022 01:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=N3t/YAW8VeixJOi9b+cr0ysEOUoouz6B5QXiabNpm9k=;
        b=T+4B716cTi+f11ItCUFtaLFfpBnT1unBzw1xXr4Nb4r7r9GBknTI8hGZp3VbEUYDtX
         G9VczEoKRJXMJwsBAJm3fPrzyH4CVY/fauuj2s8xfIO7NRsRBQV+i+mhLIEcaIAIhzwe
         KCD5Ql7YgE/x3SlzZjmDc41TWoNByK2MOQcWx9SIyMDzwgrz3CWgvdHBCuq8pewzl+SM
         SYGodX5PsUtx2GU68A1X0rXoJYQ9KcgITsXCGCrN1yIMHM0srYUJvd24mgUDQvJYxafa
         JAKqnAowldSaU5xJhPja18mrwwpyRGKrHeNRyZ0ETQTi1LVrQYMuunsfSRz7BXpyEiHF
         IPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=N3t/YAW8VeixJOi9b+cr0ysEOUoouz6B5QXiabNpm9k=;
        b=56nVdK51qWq0KQ6UHG6h2mVTVW3fCUUDaAa8C3LdAmZMtxz8CqHNGI/N3bF7k+MMsv
         u5p6u7JHAXUwuTox9zpbUlQa40QrLzNODqkvD8Hl8jEG2BsgZEKBww5Wsexh1Ikiusja
         z2CiTLJgcr3P7JuTTlr/gZM5S23K3t3j99mjRbIQaNQPsFPAXApCGe7QRqiSfhsncI2C
         nRuYj7/8YhHmA7Gt/rTV8iPsGy/WR69xoHO9sS1fhKItxpnp0u/b12TCodr5hrx/jCre
         uktf5i4gt2yfzttBnXKSwJo3Om7Cg3xwb9Jb9hC48v27QRfPX3qWGbc1jlzZV86wkf7B
         aFXg==
X-Gm-Message-State: ACrzQf0gBTbIeFtEiPO8/gF9d5gkTB98zQ4CVKLo/HKXzEokQkyki3bh
        lLPeWN5/gzp4dkO7tmwfYQpAWw==
X-Google-Smtp-Source: AMsMyM762gfygKykIAizmzE81WFYB7jyFb8QiSOgtIw663bOpc3u1aBkPhjnB4MVlJTO3N54P8khwA==
X-Received: by 2002:a2e:bcc6:0:b0:26d:c32d:72db with SMTP id z6-20020a2ebcc6000000b0026dc32d72dbmr2325903ljp.333.1664697807732;
        Sun, 02 Oct 2022 01:03:27 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id i8-20020a056512318800b00498f1eddad0sm1004343lfe.122.2022.10.02.01.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Oct 2022 01:03:26 -0700 (PDT)
Message-ID: <25261abe-ad91-d648-f47e-b9236b35f06f@linaro.org>
Date:   Sun, 2 Oct 2022 10:03:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v4 2/2] dt-bindings: mips: brcm: convert Broadcom SoCs to
 schema
Content-Language: en-US
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hauke Mehrtens <hauke@hauke-m.de>, zajec5@gmail.com,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        zhouyanjie@wanyeetech.com,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
References: <20221001043855.933528-1-sergio.paracuellos@gmail.com>
 <20221001043855.933528-3-sergio.paracuellos@gmail.com>
 <ce6c360a-f364-72db-4f44-dea66dc5e744@linaro.org>
 <CAMhs-H_999=LsUcEm6CNw5tai+v_D3xJ50JWycbqq4LZgPN9Zg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMhs-H_999=LsUcEm6CNw5tai+v_D3xJ50JWycbqq4LZgPN9Zg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 01/10/2022 12:35, Sergio Paracuellos wrote:
>>
>>> +  compatible:
>>> +    oneOf:
>>> +      - description: Boards with Broadcom bcm3368 SoC
>>> +        items:
>>> +          - const: brcm,bcm3368
>>> +
>>> +      - description: Boards with Broadcom bcm3384 SoC
>>> +        items:
>>> +          - const: brcm,bcm3384
>>
>> I don't understand what did you want to achieve here. Either you
>> document SoC or boards. If boards, where are the actual boards? If SoC,
>> then why calling it boards, why making it oneOf?
> 
> I agree with description should just say "Broadcom bcm3384 SoC", but I
> don't understand what is wrong with oneOf here...

If you document SoCs, this should be just an enum because it will take
20% of that lines. Much smaller, easier to read.

In the same time (for documenting SoCs) all the descriptions are
redundant. We know that this is "Broadcom bcm33843 SoC" because
compatible is "brcm,bcm33843".

> 
>>
>>
>>> +
>>> +      - description: Boards with Broadcom bcm33843 SoC
>>> +        items:
>>> +          - const: brcm,bcm33843
>>> +

(...)

> 
>>
>>> +    unevaluatedProperties: false
>>> +
>>> +    properties:
>>> +      mips-hpt-frequency:
>>> +        description: This is common to all CPUs in the system so it lives
>>> +         under the "cpus" node.
>>
>> You need to describe what is this. Not where it lives. Because where it
>> lives, we can easily see from the schema.
> 
> I have just copied this from the previous documented bmips text file. I guess
> writing the following will be better:
> 
> properties:
>       mips-hpt-frequency:
>         description: MIPS counter high precision timer frequency.
>          This is common to all CPUs in the system so it lives
>          under the "cpus" node.
>         $ref: /schemas/types.yaml#/definitions/uint32

Much better, thanks.


Best regards,
Krzysztof

