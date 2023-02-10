Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 207A3691E32
	for <lists+linux-mips@lfdr.de>; Fri, 10 Feb 2023 12:27:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231684AbjBJL1b (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Feb 2023 06:27:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbjBJL13 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 10 Feb 2023 06:27:29 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22E3C6C7FA
        for <linux-mips@vger.kernel.org>; Fri, 10 Feb 2023 03:27:28 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id by3so3437883wrb.10
        for <linux-mips@vger.kernel.org>; Fri, 10 Feb 2023 03:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZBeW6vGzRrjA9nywMXcAm9Ow0z3tHqf1Yj50UWAMA9c=;
        b=SJSUQsOvc+OMfF33YTWkIvbmxsjtMEE4iddA0UbBkRls2sK9HrgVuB/0Xo3INwPTru
         gIpTwW/fzwY00A5gu6FuXhaS/KGDqqyYbp1MYcOOdUGH43y9B3XaliwVlZ7sChbGxu4G
         DeNmquVOb+6sozqf09dFgy0S7WmP9M7nSl5raFeSqyOTtyyJj09C6ABjeC+MgdLpRuR0
         vz8SWAuWTwt8vaaHGi7rHgxzh3b+ljS4kWEz0gzup1CW/AZZjdHK3BcORphhhYc6EGFT
         EaH7CJy2yhY7cD7zqdG8V3ITY2lsGkcuiByPDiIoBEheYW/OAo69u0uHoGs1mYIcyVZB
         2tMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBeW6vGzRrjA9nywMXcAm9Ow0z3tHqf1Yj50UWAMA9c=;
        b=OigHq7rR93Q+dnM8hlQ2zQdhhAh/YzJAEk4gCrtYSWRpcroa3cCUJAfMdVB53yXeYW
         totJ+o88uLjWkf1nbgRUuhXG18Zxz8LV5AJFqOKodz8pLoHwYx6BWGfTAbHaQ6VkwQOZ
         giNBEBjchPfa2kIPClIPU0mzLayehysXHA1hujH3oyAONx6AziQ9Tu3VNgyhp1c9RV+9
         vW5o2Kb3vC4WOyUvt8859CfUkiMrj7r4U76/hhw3CZ07XmAxiE8+Pqh2eLaiOIz1k/SR
         jo9v3zSpMGJUyKePimxK2ZaBo+x95krObpLJRFEaFMXEgd2EiSPCQenPzRBn2Tr739Ek
         zBaA==
X-Gm-Message-State: AO0yUKXPf52oakd7zS2C/MhFdQdct7TeA9j4ikN46xKkbcEXVR6CwlvH
        JOERPXF/HQQw4dCqhLbu7Ss1pA==
X-Google-Smtp-Source: AK7set+5xVTJ10DC7GLZje5wREvBv4jB3Y+Xpz3Cu8v1f90os8wL/WNvvGzI09uXX9xC/QKvu+3ifQ==
X-Received: by 2002:adf:e9cc:0:b0:2c5:3ccf:e99a with SMTP id l12-20020adfe9cc000000b002c53ccfe99amr4632285wrn.6.1676028446701;
        Fri, 10 Feb 2023 03:27:26 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i14-20020adff30e000000b00241fab5a296sm3423182wro.40.2023.02.10.03.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 03:27:26 -0800 (PST)
Message-ID: <a592580a-df1f-1ebd-5752-8c2dd1b770fb@linaro.org>
Date:   Fri, 10 Feb 2023 12:27:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] dt-bindings: watchdog: mt7621-wdt: add phandle to
 access system controller registers
Content-Language: en-US
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        arinc.unal@arinc9.com, tsbogend@alpha.franken.de,
        p.zabel@pengutronix.de, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
References: <20230210065621.598120-1-sergio.paracuellos@gmail.com>
 <20230210065621.598120-2-sergio.paracuellos@gmail.com>
 <a0a141ef-b5ab-f84a-9a77-7b6d1f54ccc9@linaro.org>
 <CAMhs-H-w3O_Yjo7CcGdXyw0bSeqefR32Oj4hhQWsVVWoThNLyA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMhs-H-w3O_Yjo7CcGdXyw0bSeqefR32Oj4hhQWsVVWoThNLyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/02/2023 12:22, Sergio Paracuellos wrote:
> Hi Krzysztof,
> 
> On Fri, Feb 10, 2023 at 11:59 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 10/02/2023 07:56, Sergio Paracuellos wrote:
>>> MT7621 SoC provides a system controller node for accessing to some registers.
>>> Add a phandle to this node to avoid using MIPS related arch operations and
>>
>> I don't understand this part. You claim you add a phandle to this node,
>> but your binding suggest you add here a phandle to other node.
> 
> Probably my English is not the best here :-). Yes, you are right, I
> just want to add a phandle to the 'sysc' node in the current node.

Then why do you need syscon compatible here?

Best regards,
Krzysztof

