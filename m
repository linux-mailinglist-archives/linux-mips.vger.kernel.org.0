Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6A006C1F1E
	for <lists+linux-mips@lfdr.de>; Mon, 20 Mar 2023 19:09:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjCTSJ0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Mar 2023 14:09:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbjCTSJH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Mar 2023 14:09:07 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B886930195
        for <linux-mips@vger.kernel.org>; Mon, 20 Mar 2023 11:02:57 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id cn12so4558736edb.4
        for <linux-mips@vger.kernel.org>; Mon, 20 Mar 2023 11:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679335370;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s0eoWfmO41fcTesmFbumMelX1mm4aMPERyhh0espiXY=;
        b=qmP95LEReUwzh5aFhObeTYcZF8mkRX+F2NKB82E7CMqOUN2qq7XLyh8EJXDIKkvQ9M
         iRMAPlV3qmDQl46VrmXFD9r16xGdGc3riIb3SX5cjcxqca9Ixlf95ni69oIUH9yfMHPj
         ya6DT8n8KRcHpeIZ8EaCGlaOlDPu+h6b1PvZCW/1ZnwJSe+cxxA4RNuPd6I964iA7un5
         PKDxsMcZIbVOtW5IHFoJcXGK/Hb5N4WV8jtUOWRWQ0WzGbkuWtW+qPzLRYVZ9J8rR1yZ
         jZxLhkTneuUUVn/AlSD3jYviJfqOdXocoPv/ztf0jF1GLiOiYxY6NwhNb7uAkrtM5Qfs
         +2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679335370;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s0eoWfmO41fcTesmFbumMelX1mm4aMPERyhh0espiXY=;
        b=IWOGSunS2Gv3cA4d4JrL76jgvbBh4uh/FtREtVG9z00dXOc15A9qpY4Y7NOfqSpla2
         g3SQCL8Tq4pUYJl7Scc7DxMN6yXQ/A+mG/QzQRWw0dufrTXh6CQZust8c3RaXd6xlOLZ
         6s1rcQFgJ5d9f34216oyD3r//LmCgi1/1XUfuZ3RIPaeEqy3akQ4P4fBuZR20xDk2V+B
         952JW41MiHi76gvkI0upLPtNXjfkYt7G55b2vLdx6JB5eywjQlav6gZ3vVP49hh8+YtF
         qTJxR/Lr/uojuPs6U56s0ddOI1lz/hFF2ByJe7Sb4ZoQizBAwEk6sRlLXvolEr+Sqbev
         7lOQ==
X-Gm-Message-State: AO0yUKVmtD6CpPDnItKSk38gmkpyr4CNNqNqbELBcoTvga2UEYCvzqTH
        9H5FczTSgXLw58n8U5Idu+c5dA==
X-Google-Smtp-Source: AK7set+X8Ws3lSJorXAGlLHIxDKllor1Be8KbnrGdbc3YDiOHCp60p/e04Sg1zXSgKAnrXNGG2uQuw==
X-Received: by 2002:a17:906:2b15:b0:922:8fc9:d235 with SMTP id a21-20020a1709062b1500b009228fc9d235mr533372ejg.9.1679335370626;
        Mon, 20 Mar 2023 11:02:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:458e:64e7:8cf1:78b0? ([2a02:810d:15c0:828:458e:64e7:8cf1:78b0])
        by smtp.gmail.com with ESMTPSA id gv27-20020a1709072bdb00b008b9b4ab6ad1sm4705102ejc.102.2023.03.20.11.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 11:02:50 -0700 (PDT)
Message-ID: <21a90597-78c9-4d46-7b01-257702e7afca@linaro.org>
Date:   Mon, 20 Mar 2023 19:02:49 +0100
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <bdc82b4a-f1a9-0372-5a57-200a422b1b70@arinc9.com>
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

On 20/03/2023 18:57, Arınç ÜNAL wrote:
>>> All of these are at the end the
>>> way we can properly match compatible-data to write a proper driver.
>>> The current ralink dtsi files which are in tree now
>>> are totally incomplete and not documented so we are planning to align
>>
>> Nothing like this was said in commit msg, so how can we know?
>>
>>> all of this with openWRT used files and others soon. That's the reason
>>> we are not touching
>>> 'arch/mips/boot/dts' at all now. I don't think anybody is using any of
>>> this but mt7621 which is properly completed and documented.
>>
>> Anyway, none of this explains exception from naming convention - vendor,
>> device or family name.
> 
> Would mediatek,mtmips-clock.yaml make sense?

More, except:
1. This is not clock, but sysc.
2. mips sounds redundant. Do you have rt2xxx and mt7xxx chips which are ARM?

Best regards,
Krzysztof

