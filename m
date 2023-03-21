Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45E956C2A93
	for <lists+linux-mips@lfdr.de>; Tue, 21 Mar 2023 07:43:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbjCUGn2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Mar 2023 02:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbjCUGn1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Mar 2023 02:43:27 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E885014222
        for <linux-mips@vger.kernel.org>; Mon, 20 Mar 2023 23:43:25 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id r11so55692745edd.5
        for <linux-mips@vger.kernel.org>; Mon, 20 Mar 2023 23:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679381004;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TBUGEm6xD04h/1z1H1/LXCFCYvbeAFjDxoKdCWiZTRw=;
        b=TrNJRcarl79asRsxZoLMPzcwUu9wvLMOavua/gYPjGiTqabgLiBYld2RVgUkSQQ3/v
         ICaxVcfnes/fWiF0adfSWcMSu0R1Cry5cvNEqyGn+PIst6lpmh6Boz9WPoc131jdZKVg
         xQd47BhvQPqfdyvkhnDRisG68N5BO9+Fj9/BzYi6/ZyDdSlvfFMpuWJR3DZgJQUm/Pft
         V2hKilEhJ2EuUE49nz2PbPonKntN8qMXDfUQFGgwlCGYuYdup0NPD6geGrvNsHkOfx+5
         JLR5sgPtcQxlHC0FMJ/ZBhEr6z8EtoVeUXhg7jnqHvqdxjprUGQ35qnBZtrnZsigW6v7
         KPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679381004;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TBUGEm6xD04h/1z1H1/LXCFCYvbeAFjDxoKdCWiZTRw=;
        b=XX+HP8eBO4SgTU7NdawQygMGSfgKehkQl390DEGGlBsLIvFaJuWayAYkW960Dt3v+1
         StpCtvJGKsGkX74F9vcnEUvoeabSskeVBmyLDRUNL4YqeJcKclatrc0faGMWt6GUDmlo
         6d+7YnHxasj41mWe88Cjbff49RljbHlp/YVTMRxHnG9szS2td2MiIhvmXYwJ8pjBRpJ/
         q9n2nHa5FX+IX2sA2ondwCSqMDrqeCgxfIW8nF1RzXceY1M1yNqIxvSIOmj2Ztk4hVv1
         QWKksRtL2efrD0iI9vPSuKmMLyr07tw8gKfopfMjrnZucN6OIJhxasK0ydrrIb8jp0oT
         Q4qw==
X-Gm-Message-State: AO0yUKXQnpzhJaTxRrfmr+u1N568xXmGeNuNuYfks2wbuJOGsJQ20YcN
        SMzvokSjknkux8douXFwVbvvSEg7hXrp0JJg82U=
X-Google-Smtp-Source: AK7set90DgK0fLStgygz7YjDNixGQ2/rmIf/crP7sAutEUUnexfUaXlW0q3Uv8u71EKZeaXveQmNpw==
X-Received: by 2002:a17:906:2c07:b0:84d:4e4f:1f85 with SMTP id e7-20020a1709062c0700b0084d4e4f1f85mr1693912ejh.59.1679381004262;
        Mon, 20 Mar 2023 23:43:24 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id ja21-20020a170907989500b0093338259b2bsm3799951ejc.207.2023.03.20.23.43.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 23:43:23 -0700 (PDT)
Message-ID: <40e3acac-b58a-7af8-b025-3678f84434da@linaro.org>
Date:   Tue, 21 Mar 2023 07:43:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 01/10] dt: bindings: clock: add mtmips SoCs clock device
 tree binding documentation
Content-Language: en-US
To:     =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
        tsbogend@alpha.franken.de, john@phrozen.org,
        linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        devicetree@vger.kernel.org
References: <20230320161823.1424278-1-sergio.paracuellos@gmail.com>
 <20230320161823.1424278-2-sergio.paracuellos@gmail.com>
 <1e2f67b4-3bfb-d394-4f60-e6f63ce6a2fd@linaro.org>
 <CAMhs-H8OQ9gJLsifLuHD2GN8rYwnY=Zmdb0kMEfX4UUHhjMUyQ@mail.gmail.com>
 <d0f74721-bf5a-62de-53dc-62e7e735e2dc@linaro.org>
 <bdc82b4a-f1a9-0372-5a57-200a422b1b70@arinc9.com>
 <21a90597-78c9-4d46-7b01-257702e7afca@linaro.org>
 <525a6388-a4b8-3052-fe81-5aa21d8f424a@arinc9.com>
 <507f79cf-acd8-5238-031a-fd71024e0c6a@linaro.org>
 <CAMhs-H8_S5eO7B+dZ7jeq7Jjnw71QBmSo4M+woe3U5sH7dCADg@mail.gmail.com>
 <39ba681e-5bab-cffc-edf7-4bf86387987c@linaro.org>
 <132de602-6467-536c-c66d-657f22a59bd5@arinc9.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <132de602-6467-536c-c66d-657f22a59bd5@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 21/03/2023 07:38, Arınç ÜNAL wrote:
>>>>
>>>> Ah, but indeed there are newer Mediatek MT6xxx and MT8xxx SoCs which are
>>>> ARM, so mediatek,mtmips-sysc would work.
>>>
>>> I can use 'mediatek,mtmips-sysc.yaml' as the name but compatibles will
>>> start with ralink. There are already some existent compatibles for
>>> mt762x already having ralink as prefix, so to be coherent ralink
>>> should be maintained as prefix.
>>
>> The compatibles I mentioned start already with mediatek, so why do you
>> want to introduce incorrect vendor name for these?
> 
> Can you point out where these compatible strings for mt7620 and mt7628 are?

git grep

Best regards,
Krzysztof

