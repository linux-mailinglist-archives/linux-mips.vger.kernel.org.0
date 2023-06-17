Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 050757341B3
	for <lists+linux-mips@lfdr.de>; Sat, 17 Jun 2023 16:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbjFQOoH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 17 Jun 2023 10:44:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231450AbjFQOoF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 17 Jun 2023 10:44:05 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 832011BF3
        for <linux-mips@vger.kernel.org>; Sat, 17 Jun 2023 07:44:03 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51a3e7a9127so2954244a12.1
        for <linux-mips@vger.kernel.org>; Sat, 17 Jun 2023 07:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687013042; x=1689605042;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KK2+YFUG/6HmL4tcdhB8f8ESWlAE0VcF40UXIVzAPuo=;
        b=uRkenpha2+Snmt2ZqLpbiOEu7lU0WybjKCO73iSIQE8Uu9AevsrBAAIbbG0jobIoie
         g1X3Pql5QlV4aL26S5MbUKVwefxWQP7+8omvrHKRjkh4H7ELph0Udn54Li/0lDgjwCjz
         PKR1MjnETnS7b9yTta1/+kYxnHiLBYp0cSv97Au6wdgGuNkOyQ+FLyNHRIHcaRlqoXuq
         abDbL99zb0WRxwoOpWlmA6KtJyPIbjBaamsFOCKdKIA82V2/tP9XCLWW6k+1D1V7hokN
         JvkjhCZb02tFrqVUb681zLCIW/9T8jSzsSTZxXO1zwQhBCFGCOfmfWJ/qWP3NzUOxo4h
         A2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687013042; x=1689605042;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KK2+YFUG/6HmL4tcdhB8f8ESWlAE0VcF40UXIVzAPuo=;
        b=lR9M/X9MEejZzklGilB9hYVuL/G0GpzAdAIshXfTWVQtBl9hpXPd5EfRjc9P8Buir4
         bvTINDzBYQ6sQzWQBea53AiDzfdIbE/vKL+u2y7bTf3fU4HI9KCEM9Jh4fdTrYeWMf9+
         D5JVF1oYm/0kFrJBxvnomhkTIhxX7kdlxJ1PyqJ+3nbEiQgeHAqQepxbuskWwP8IxeO0
         URpEEsaKERplU7Hh36lHVeRtkwCWha8DzjzkUZE76whNNiQWOMaDES/zbCyR54zjOnYc
         6wdzQ1jGyyNkAS60izErkypUp11E0L+zhEsYgzuZrW16b9fbUJJl9p8mWAx/6uzNO8Ip
         u7Ew==
X-Gm-Message-State: AC+VfDyAbolxm4qXHZi90NWI5v/+akEed+JY9N3O2zQ7roXPvvIRog4i
        tef9479blW+0U3w5Fus6D25NGQ==
X-Google-Smtp-Source: ACHHUZ5Fu0+bj+UPlLd3J6AJvxrm4h1iSaRendUhAIKFPorvmtKoMwQaDwq/rbuf4+ub5GoxYwYsTg==
X-Received: by 2002:a05:6402:18c:b0:518:741e:9314 with SMTP id r12-20020a056402018c00b00518741e9314mr4660226edv.11.1687013042132;
        Sat, 17 Jun 2023 07:44:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u3-20020aa7d543000000b00514bddcb87csm11293575edr.31.2023.06.17.07.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jun 2023 07:44:01 -0700 (PDT)
Message-ID: <a61180e8-5732-2208-3a0c-e2b0137f9290@linaro.org>
Date:   Sat, 17 Jun 2023 16:43:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 2/9] clk: ralink: add clock and reset driver for MTMIPS
 SoCs
Content-Language: en-US
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Shiji Yang <yangshiji66@outlook.com>
Cc:     arinc.unal@arinc9.com, devicetree@vger.kernel.org,
        john@phrozen.org, krzysztof.kozlowski+dt@linaro.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, matthias.bgg@gmail.com,
        mturquette@baylibre.com, p.zabel@pengutronix.de,
        robh+dt@kernel.org, sboyd@kernel.org, tsbogend@alpha.franken.de
References: <20230617052435.359177-3-sergio.paracuellos@gmail.com>
 <TYAP286MB0315AB8274CDD341D49809A2BC59A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
 <CAMhs-H8rt3-ffvjkNSORiNXQUVCUHCc7FNwYN7TOyQ0DxCe2fA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMhs-H8rt3-ffvjkNSORiNXQUVCUHCc7FNwYN7TOyQ0DxCe2fA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 17/06/2023 15:26, Sergio Paracuellos wrote:
>>> void __init plat_time_init(void)
>>> {
>>> +      struct of_phandle_args clkspec;
>>>       struct clk *clk;
>>> +      int cpu_clk_idx;
>>>
>>>       ralink_of_remap();
>>>
>>> -      ralink_clk_init();
>>> -      clk = clk_get_sys("cpu", NULL);
>>> +      cpu_clk_idx = clk_cpu_index();
>>> +      if (cpu_clk_idx == -1)
>>> +              panic("unable to get CPU clock index");
>>> +
>>> +      of_clk_init(NULL);
>>> +      clkspec.np = of_find_node_by_name(NULL, "sysc");
>>
>> The node name should be "syscon" as the example node name in the
>> dt-bindings document is "syscon".
> 
> sysc is label to get this node since it is the one shared by all
> different dtsi files.

If it is label, why do you use it to get by name? name != label.

Best regards,
Krzysztof

