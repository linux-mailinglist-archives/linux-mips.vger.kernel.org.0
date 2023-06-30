Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23308743958
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jun 2023 12:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbjF3K2l (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Jun 2023 06:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232344AbjF3K2k (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 30 Jun 2023 06:28:40 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F9C2D55
        for <linux-mips@vger.kernel.org>; Fri, 30 Jun 2023 03:28:37 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fb94b1423eso2627066e87.1
        for <linux-mips@vger.kernel.org>; Fri, 30 Jun 2023 03:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688120916; x=1690712916;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zYjA7+ioHhUu+w12cVByCxHhb65EzzjjDfNDUcUHPqE=;
        b=yTbx9K07Fay0LT6GB2qgYiMSze0mnTnFFGudtw5iImyppyENljgaqKC0tNX0n+8ib6
         6j0ol4hRIisDQbsZnx2GgpoLCsACsfxdY1/irJYk486lCwlvV1d3e6JMA9VoA4aosveD
         NE3z/eq0YOr74F8QLsEsKMvjizcV05RJPMmknArP0WLyxaxpj4q5a7eFlUENWIYk/E41
         hvbXgA73Gg3M2NaE+d/U4/B035IOpKWNlRcuAAI9+onilke4MZ8PLQhFtZEvqoAxJ6cz
         8EOkFrUWFulgc7RxJ05Qui/gMzgjY/gH6MQi4xvC0SL7ysKEgu6oEp2wmvUMdZjU0B5s
         7X2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688120916; x=1690712916;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zYjA7+ioHhUu+w12cVByCxHhb65EzzjjDfNDUcUHPqE=;
        b=bVcATIE2vjm48/ewR9ky9S5NoA3geInxAh7/x8ERDexmn90duardZcXockdP75SKaQ
         lv97z/Cdqi5DIA8gFsYZ0snbsdbA61aZuT27twcLh/9BGMrQCwEzx0hWDJOdkUZgdQAK
         Lq1ZaCM+4V8WLo01qXqmp2K5kp3QoFqxk+imwlK0C/QckBNqK290i41rhQQ6sWEtHkZd
         NmrSSkQUGUZGEVaEou5olzqqpXuj3sOPb3U6OS9CQhLqXA7X7qnu5327jE03V74N3L0l
         xPc9qx3YDcXyXq3p6MwpLjvXm3Y4wjgnQUC9aMTiSqVDZjZu+mixc0k74RRjVzWzzozg
         L3DA==
X-Gm-Message-State: ABy/qLbdP3JtmWmViZBlPqEf3azsU1PCC1vTbLg1s695f6kdu3fq65/v
        6HpRswYRFLzlC+9H//V5pN/mjGH4bLZvs172GOc=
X-Google-Smtp-Source: APBJJlGWqrSaBDz397ltOnXcdD3aeirP3c85aX8rPS6jtNcsg+2biwLq4/UgYjFOcxIK24VTBuql9Q==
X-Received: by 2002:a05:6512:78:b0:4fa:ce08:a9d0 with SMTP id i24-20020a056512007800b004face08a9d0mr1798032lfo.57.1688120915961;
        Fri, 30 Jun 2023 03:28:35 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.211.104])
        by smtp.gmail.com with ESMTPSA id o11-20020a05600c378b00b003fa95f328afsm13984789wmr.29.2023.06.30.03.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 03:28:35 -0700 (PDT)
Message-ID: <81aa6735-348a-a0fd-7637-9fea2903436f@linaro.org>
Date:   Fri, 30 Jun 2023 12:28:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 3/8] pwm: jz4740: Put per-channel clk into driver data
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Paul Cercueil <paul@crapouillou.net>
Cc:     linux-pwm@vger.kernel.org, kernel@pengutronix.de,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-mips@vger.kernel.org
References: <notmuch-sha1-d2bb15a9dcb5470a6eebca0b1a01c57918a22695>
 <20230629140745.fknzjerunbl2wr3k@pengutronix.de>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230629140745.fknzjerunbl2wr3k@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 29/6/23 16:07, Uwe Kleine-König wrote:

> On Thu, Jun 29, 2023 at 01:12:25PM +0200, Paul Cercueil wrote:
>> Le 29 juin 2023 11:48, Uwe Kleine-König <u.kleine-koenig@pengutronix.de> a écrit :
>>>
>>> Stop using chip_data which is about to go away. Instead track the
>>> per-channel clk in struct jz4740_pwm_chip.
>>>
>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>>> ---
>>> drivers/pwm/pwm-jz4740.c | 11 +++++++----
>>> 1 file changed, 7 insertions(+), 4 deletions(-)


>>> @@ -229,7 +231,8 @@ static int jz4740_pwm_probe(struct platform_device *pdev)
>>> if (!info)
>>> return -EINVAL;
>>>
>>> - jz4740 = devm_kzalloc(dev, sizeof(*jz4740), GFP_KERNEL);
>>> + jz4740 = devm_kzalloc(dev, sizeof(*jz4740) + info->num_pwms * sizeof(jz4740->clk[0]),
>>> +       GFP_KERNEL);
>>
>> LGTM, but please use struct_size() from <linux/overflow.h>.
> 
> Ah, I thought there is such a macro, but I didn't find it neither by
> grepping nor by asking in #kernelnewbies. Thanks, will respin the series
> in a few days.

Oh, TIL too :) R-b stands in respin.

