Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13AE36C1F81
	for <lists+linux-mips@lfdr.de>; Mon, 20 Mar 2023 19:23:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbjCTSXO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Mar 2023 14:23:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjCTSWv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Mar 2023 14:22:51 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E5A837543
        for <linux-mips@vger.kernel.org>; Mon, 20 Mar 2023 11:15:49 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id cn12so4703592edb.4
        for <linux-mips@vger.kernel.org>; Mon, 20 Mar 2023 11:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679336124;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XClxnA6CuNm9Jv3g/SBjzKVTxx9V3YQWxRpzWOtZeK0=;
        b=gjbNIiRFV4g3/umiBJrM9XjVfQCtaP89f5l2xEApmWsocYAhxCKeUEMydKzCjUFGFo
         zma9mS/+UYlB62DjSHaAIt1386w45pBuwKloGXJeb6Qhh0AvEGwz0TXijZuj/0gbhB9c
         2Y6w0xF/iRpCt4Jk3DS1kmkxoiF03Ps/6slZOhQn/9/1PhalgRyPUcNGuFd9v8ozgrqo
         jYq3Twd//95CysQGQzIuOz9gNn0dhsjhB12xmC6duZVhzhCCuruE4W+vOaAT5XHao18y
         7ZoDvoPKzBq200bNsrs6KsSYB4IPFwdI4F+U6hLO9EzYOddnv6MI1wpg5YBMAtrMW2CL
         4uFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679336124;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XClxnA6CuNm9Jv3g/SBjzKVTxx9V3YQWxRpzWOtZeK0=;
        b=Wo05SkosdN7Cfn99RgBhO1uXtbak3G3I8347Ufbd+Sh26jCfbtezmd+5qBJy8LfLQA
         ooHdzQArN4wZr6CDB83v4+iu8AR+MQZcOauqaiRw6cDNq+zm5D+2yKFfZHCgKld3w+np
         0ZnEAFAyp3JpERVDkdTlrji/tAge2qnY1/wrKVdipe+4XAVt22eL8KLsbC3hoPCU9QCV
         KDEYpppRiFoJlZxma9GRgCTMdqWivLJMDx9iubx1YzeKsHy1lXmeKM2r4PCxHivW0DuQ
         o41394yB29UoHCYrtVg5euG2WlKoIAkkxGB88y4Wg1zKk0MfqY4Ssv3qZNuXdFhMHQBE
         mvwQ==
X-Gm-Message-State: AO0yUKXg/668LsFWk8Lwm7ZQIdyzXW2a5S7j1nPICyabX7Za/cyu98LL
        6d/zDs9FIvu2gb2+ajzSWo/JhQ==
X-Google-Smtp-Source: AK7set+1kFbo8VjwA55qZFsLE6aSvLHmQeKoBcRT0nvPAsSumlCBBsHtwVA/rSAVBc20ka2J5qQcFw==
X-Received: by 2002:a17:907:d9f:b0:930:ba36:2211 with SMTP id go31-20020a1709070d9f00b00930ba362211mr92543ejc.0.1679336124367;
        Mon, 20 Mar 2023 11:15:24 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:458e:64e7:8cf1:78b0? ([2a02:810d:15c0:828:458e:64e7:8cf1:78b0])
        by smtp.gmail.com with ESMTPSA id a10-20020a1709065f8a00b0092595899cfcsm4722308eju.53.2023.03.20.11.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 11:15:24 -0700 (PDT)
Message-ID: <507f79cf-acd8-5238-031a-fd71024e0c6a@linaro.org>
Date:   Mon, 20 Mar 2023 19:15:22 +0100
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <525a6388-a4b8-3052-fe81-5aa21d8f424a@arinc9.com>
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

On 20/03/2023 19:09, Arınç ÜNAL wrote:
>>> Would mediatek,mtmips-clock.yaml make sense?
>>
>> More, except:
>> 1. This is not clock, but sysc.
> 
> Sergio, beware.

I meant, that's what I understood from what Sergio said. :)

> 
>> 2. mips sounds redundant. Do you have rt2xxx and mt7xxx chips which are ARM?
> 
> All of the SoCs, RTXXXX, MT7620, MT7621, MT7628, MT7688 are MIPS. So I 
> decided to call this platform MTMIPS as I've seen MediaTek use this on 
> other projects like U-Boot. This is what I did on my pinctrl patch 
> series as well.

Ah, but indeed there are newer Mediatek MT6xxx and MT8xxx SoCs which are
ARM, so mediatek,mtmips-sysc would work.

Best regards,
Krzysztof

