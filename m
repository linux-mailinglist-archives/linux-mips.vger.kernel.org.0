Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 317986C1F5C
	for <lists+linux-mips@lfdr.de>; Mon, 20 Mar 2023 19:18:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbjCTSSA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Mar 2023 14:18:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230212AbjCTSRe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Mar 2023 14:17:34 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACF5234009
        for <linux-mips@vger.kernel.org>; Mon, 20 Mar 2023 11:11:17 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id t5so13465502edd.7
        for <linux-mips@vger.kernel.org>; Mon, 20 Mar 2023 11:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679335862;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jUg0Q+WSROPkEHfxFgShAYGTA3J8mTcWoer+08fMvsc=;
        b=bnYVJiiRIzf6gJuYwUIuAtnC10BZ4DrcGsVqyd4P2XSNnEZM5EIrbaMsQ2cWsSZ2+t
         PYVQETVTO27/ZXDh3SapZnC1WB8edXvBj7YYhICyPnCYPMXq4Ge10XDbCc2UIdVQLeMq
         7TCHLvgyyEggtLPaH8YvHL4E2Yh8PPe9eYqmvnvoOh0hZCZBEuE0ESPrQJ8ZZq+KzYK2
         CgKX5riXKaxi9EqTwQN6g4G5JCuW6yyD+ZkScQi6XfAjIuI9DXI9Mg98imrrkbV8/4Mo
         zPFYGIqiK/Y5QuqUvHjCsq+HEm1OMRXha1IilD5RBpQfTOcYE6O3F7iXZsEx4sL6atCs
         /MfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679335862;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jUg0Q+WSROPkEHfxFgShAYGTA3J8mTcWoer+08fMvsc=;
        b=wGoKWJyv5FJEitB3/7OTNIrhavTCC1wafnDIHL2IZ2djdq8r3f52oz/zZELZoJFA3+
         zoV4pXg32ur4FLkA4qfbFE0JWFE8uyH4mcQI8gUFxbVOGQSCx2eBFkaDn6En/382wrlf
         4qFq2uUmJtkcp/z8tST9xTYJwhZazxsn3Y0QPDoTx5OEPLvACA5S6HKEKkrzvgjtOCn+
         kjyebZluQY4XuHr6GwHZbdCNEhNd/xIB7LaArUJLouJgZ5EWTKZrUTgKuTCrqw9elzdm
         Vx8Z162ym97AZ3K5RiBEXq+r1oW1/yO/ACfsZ4Hesgsc6UJTo+36IDobYvW/RC5GiFLN
         WH4w==
X-Gm-Message-State: AO0yUKUHroNYP39p6PqP1v/5mmqy99pXIrh1i1Br5GjpGWPG8JBtmMVN
        zn/N3RU2vbIdfK1gGCmOiVqYaQ==
X-Google-Smtp-Source: AK7set+WVyztBCLeOIDg1eVOELvFK9G4urCqBzO4SR/D9tMKSvfK1yU4ce+TsY+iyke4rcuciqJ/Qw==
X-Received: by 2002:a17:907:774e:b0:879:ab3:93cd with SMTP id kx14-20020a170907774e00b008790ab393cdmr10129271ejc.46.1679335862498;
        Mon, 20 Mar 2023 11:11:02 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:458e:64e7:8cf1:78b0? ([2a02:810d:15c0:828:458e:64e7:8cf1:78b0])
        by smtp.gmail.com with ESMTPSA id i19-20020a170906251300b009312cc428e4sm4687280ejb.165.2023.03.20.11.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 11:11:02 -0700 (PDT)
Message-ID: <f323f1bc-1d91-f8bb-2c1f-2f1b93fe1b3e@linaro.org>
Date:   Mon, 20 Mar 2023 19:11:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 01/10] dt: bindings: clock: add mtmips SoCs clock device
 tree binding documentation
Content-Language: en-US
To:     =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        linux-clk@vger.kernel.org
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        john@phrozen.org, linux-kernel@vger.kernel.org,
        p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        matthias.bgg@gmail.com, devicetree@vger.kernel.org
References: <20230320161823.1424278-1-sergio.paracuellos@gmail.com>
 <20230320161823.1424278-2-sergio.paracuellos@gmail.com>
 <5109c01b-48bd-2854-3f42-bf8ef8b4a821@linaro.org>
 <9cfd5bc1-64e9-5250-5a8d-18ac4c205584@arinc9.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9cfd5bc1-64e9-5250-5a8d-18ac4c205584@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 20/03/2023 19:07, Arınç ÜNAL wrote:
> On 20.03.2023 21:01, Krzysztof Kozlowski wrote:
>> On 20/03/2023 17:18, Sergio Paracuellos wrote:
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - ralink,rt2880-sysc
>>> +          - ralink,rt3050-sysc
>>> +          - ralink,rt3052-sysc
>>> +          - ralink,rt3352-sysc
>>> +          - ralink,rt3883-sysc
>>> +          - ralink,rt5350-sysc
>>> +          - ralink,mt7620-sysc
>>> +          - ralink,mt7620a-sysc
>>> +          - ralink,mt7628-sysc
>>> +          - ralink,mt7688-sysc
>>
>> One more comment - this and maybe other compatibles - have wrong vendor
>> prefix. This is mediatek, not ralink.
> 
> This platform was acquired from Ralink by MediaTek. I couldn't change 
> some existing ralink compatible strings to mediatek as Rob explained on 
> my pinctrl patch series that we don't do that. The compatible strings on 
> this patch series here are new but I'd rather keep the compatible 
> strings ralink to keep things consistent.

The comment that you cannot change existing compatibles does not apply
to these, because these are new. However indeed some SoCs have already
compatibles with ralink, so it's fine for these. mt7620 and mt7628 are
already used with mediatek, so these should be rather corrected to new
prefix.

Best regards,
Krzysztof

