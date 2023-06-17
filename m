Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 722D373429C
	for <lists+linux-mips@lfdr.de>; Sat, 17 Jun 2023 19:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346338AbjFQR1N (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 17 Jun 2023 13:27:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232014AbjFQR1M (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 17 Jun 2023 13:27:12 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D73137
        for <linux-mips@vger.kernel.org>; Sat, 17 Jun 2023 10:27:09 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-983f499fc81so265155866b.3
        for <linux-mips@vger.kernel.org>; Sat, 17 Jun 2023 10:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687022828; x=1689614828;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5T+EGK226eOs1uvd8FU4XjimHmNEnziSAMgt6UX6BMM=;
        b=dWhVoGKAvkEzL0WoeGaVYwK1JnZdYCKoswGm9iBoaYB6YKg32fAXSLjN2US6Dl49Yw
         rW6KgqAY+QayVQjRVk7VepwGnZ0sU3A/BuN5BcRP1hLfk4HWivSlLV52O/Nt2DNPnO3e
         nourwR54lKlUj+QDRQ+AVUVeHjtpmeeBY9TDioQ0oP9jh+zKERTs7MdAeE+1qWY6UGCl
         9dVVUY6x34Xp0PwTz/AWbGfkW6tdVghwY7lRVeV0Y6XnnvCFofCofzbLUio86iNwynIB
         RCsrSRfmSTib/wTGXAaAcxJEIPEKSK/Tqx1AsqxNDkhsxms9qsr0UXDWQ/56EOeUqeJU
         T+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687022828; x=1689614828;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5T+EGK226eOs1uvd8FU4XjimHmNEnziSAMgt6UX6BMM=;
        b=V2dGvWiKC2Dp+E1Ptvv3jTCNsX9/6ESydjyq5pYvVPCcKP7dK/T/1nSpkl9d9CfIga
         U/cCNbpaEZ6xGyC0njQM66xSBvReZD4mi7uzE3B2JvnztgTePZNe/Y9f39+eQWuzvM5a
         w3nZXX45y2poCK2OttBapac+AC7EgSWOaL3l+UyEia7lM3kcNW0Ma26Z0az+NSANiVU0
         7VkUStWMKmYTeWf/FZSgGDqqwNlUyV6ozKPaISVe10FpDchakAkA5BXbcd5VrKWOO8LI
         j5z3wgrT+HPuAGyhTfgtRT+op9oY83f4tz1bYnwoG6hfYypbHiqJTzyWmivIoWaa2vua
         1kGg==
X-Gm-Message-State: AC+VfDwBnBbni7lskSw0FKfyX8L9wicPSL5BWeRQzP3ia0eCgDg1cfrA
        pgpsjDslLGi1nm1VLo9G8jreSQ==
X-Google-Smtp-Source: ACHHUZ65DsKf1sDpxsHVVDWKYW/iErpSizRIN4Gt9KVqxf8XEweMpqFguDQToNmnZonPrlHceusN/g==
X-Received: by 2002:a17:907:9281:b0:982:caf9:126 with SMTP id bw1-20020a170907928100b00982caf90126mr5454986ejc.42.1687022827931;
        Sat, 17 Jun 2023 10:27:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id qn4-20020a170907210400b009875a6d28b0sm1092554ejb.51.2023.06.17.10.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jun 2023 10:27:07 -0700 (PDT)
Message-ID: <b995dead-5cca-de05-5840-bed882d2c4ff@linaro.org>
Date:   Sat, 17 Jun 2023 19:27:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 8/9] mips: ralink: get cpu rate from new driver code
Content-Language: en-US
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
        tsbogend@alpha.franken.de, john@phrozen.org,
        linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        devicetree@vger.kernel.org, arinc.unal@arinc9.com
References: <20230617052435.359177-1-sergio.paracuellos@gmail.com>
 <20230617052435.359177-9-sergio.paracuellos@gmail.com>
 <c1a69db7-96c2-f3ad-3ef2-9a655b10bfb5@linaro.org>
 <CAMhs-H_HjsT2om2CZpMmVDYao=M5FoZwyy0Te1QB9MLj6mAxnw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMhs-H_HjsT2om2CZpMmVDYao=M5FoZwyy0Te1QB9MLj6mAxnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 17/06/2023 17:35, Sergio Paracuellos wrote:
> On Sat, Jun 17, 2023 at 4:48 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 17/06/2023 07:24, Sergio Paracuellos wrote:
>>> At very early stage on boot, there is a need to set 'mips_hpt_frequency'.
>>> This timer frequency is a half of the CPU frequency. To get clocks properly
>>> set we need to call to 'of_clk_init()' and properly get cpu clock frequency
>>> afterwards. Depending on the SoC, CPU clock index in the clock provider is
>>> different being two for MT7620 SoC and one for the rest. Hence, adapt code
>>> to be aligned with new clock driver.
>>
>>
>>>  void __init plat_time_init(void)
>>>  {
>>> +     struct of_phandle_args clkspec;
>>>       struct clk *clk;
>>> +     int cpu_clk_idx;
>>>
>>>       ralink_of_remap();
>>>
>>> -     ralink_clk_init();
>>> -     clk = clk_get_sys("cpu", NULL);
>>> +     cpu_clk_idx = clk_cpu_index();
>>> +     if (cpu_clk_idx == -1)
>>> +             panic("unable to get CPU clock index");
>>> +
>>> +     of_clk_init(NULL);
>>> +     clkspec.np = of_find_node_by_name(NULL, "sysc");
>>> +     clkspec.args_count = 1;
>>> +     clkspec.args[0] = cpu_clk_idx;
>>> +     clk = of_clk_get_from_provider(&clkspec);
>>
>> This is very obfuscated way of getting clock. Why can't you get it from
>> "clocks" property of "cpu", like every other recent platform?
> 
> I did not find any other approach that works for me. So I ended up in this one.
> Can you point me out in a sample of code doing the same so I can check
> if it works for me then?

You mean bindings?
git grep cpus.yaml

Driver?
git grep clk_get_rate
clk_get
eventually of_clk_get

It all depends on the context.

Anyway, it is very easy to find existing solutions not using
of_find_node_by_name for your platform:

git grep mips_hpt_frequency

First result.


Best regards,
Krzysztof

