Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B61AA6A8147
	for <lists+linux-mips@lfdr.de>; Thu,  2 Mar 2023 12:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbjCBLhl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 Mar 2023 06:37:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbjCBLhX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 Mar 2023 06:37:23 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EC404DE13
        for <linux-mips@vger.kernel.org>; Thu,  2 Mar 2023 03:36:50 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id s11so2350112edy.8
        for <linux-mips@vger.kernel.org>; Thu, 02 Mar 2023 03:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677757001;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=itiw5UOLyp8x5GAZYaYv1Vs2aytftoTZFE/0BZf8oio=;
        b=kIXs0xzTihohuEbRt/RONHqrNwOkJLWyJD46Cg9nHpst/qa4/ITeiXi5lHVPCYKKF8
         68gVD6Y6EJKS+cefqndrjM6eOIX0qoS4q0aLBHAPHOu7boPglfE/2HZ6f2jWzFUnFT/6
         jduwQvKVXembm5kITS0Ycwl7VQKCra5YF2soFbTtCj9PMs1qqyp90JLvqFaKQjITG8YK
         0BiuwVdH1dm3noOQzIAyNjEZlebYUB+h37E5gGxjK9iVpil71Oyz1xUx3IOHjwe+ySlF
         8pAW/b1xn3j4SFZ/zcz7E+oTT4yiEJOUaiqe+XriuS8tn+J4vkyQpt2eWIKXjFXwwPMG
         yAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677757001;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=itiw5UOLyp8x5GAZYaYv1Vs2aytftoTZFE/0BZf8oio=;
        b=u+GeBFmqZnFCGGtN76eQWwfqfP29gjxN/+kqzLsE30/11Gab0GO+OlQ2ltRRbc0ek+
         IcUmUbnoaQnwaaUX9Gd47j0Y0Y7BcGHOe6pobJxMZztC89FeMwjJ7V0yIjZ+O+SRL4oY
         zysToVwBZjs14HBEMM1gIRoidXixPgGMQt+Lz5pShfPxFA6lLlW0TvU2KGigVWropJDO
         gX+ngdjRHx77dhYApKLn4RLVyTosvTf6WQcFByvkrDlEKgAmIYeKFVE+2KhBe/NYXq2/
         ihfXy59POfuZtgcf+rl1mVh+7AODdlswmOqu+UthpTHlUpfTniWN3H4jshirZduo6QlI
         hloA==
X-Gm-Message-State: AO0yUKVs4YevvmjPI60yyz/x6sZ8Eybq3KaaxrrcM66QkDbcGrgwFOq8
        LhVpvHlg9zLGGg6YYbvIgW5YYg==
X-Google-Smtp-Source: AK7set8UroysICtw/tuh/i+KbnuaphWGNNH6VTX/a+cbEyQ42b9nkdxhdV//zLythoyXJt6AwhrTtg==
X-Received: by 2002:a17:907:1006:b0:8b1:2e7c:df49 with SMTP id ox6-20020a170907100600b008b12e7cdf49mr11219032ejb.7.1677757001526;
        Thu, 02 Mar 2023 03:36:41 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m18-20020a1709061ed200b008d427df3245sm7007014ejj.58.2023.03.02.03.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 03:36:41 -0800 (PST)
Message-ID: <83a03258-9e52-3d09-67fe-12e9e5ed4b76@linaro.org>
Date:   Thu, 2 Mar 2023 12:36:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 07/16] dt-bindings: pinctrl: ralink: add new
 compatible strings
Content-Language: en-US
To:     =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Rob Herring <robh@kernel.org>
Cc:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        William Dean <williamsukatube@gmail.com>,
        Daniel Golle <daniel@makrotopia.org>,
        Daniel Santos <daniel.santos@pobox.com>,
        Luiz Angelo Daros de Luca <luizluca@gmail.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        Landen Chao <Landen.Chao@mediatek.com>,
        DENG Qingfang <dqfext@gmail.com>,
        Sean Wang <sean.wang@mediatek.com>, erkin.bozoglu@xeront.com
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
 <20230222183932.33267-8-arinc.unal@arinc9.com>
 <20230227173333.GA496999-robh@kernel.org>
 <d7aea90f-d077-3a41-996c-804c95d72e24@arinc9.com>
 <20230301024431.GA251215-robh@kernel.org>
 <ae3346de-140f-f181-b6a3-ccaa694e1548@arinc9.com>
 <11d3c806-04b6-da54-65f1-c0bd154affbc@linaro.org>
 <a9acd3b4-2b03-86c0-711c-a3840aeab574@arinc9.com>
 <1aae7ac9-c83d-71b4-4fce-325f02fcd722@linaro.org>
 <89588f69-9cf0-e7a4-b976-5ce87d42e296@arinc9.com>
 <2ccb573d-39f4-cb80-7a3e-63a60c2bc0a8@linaro.org>
 <b48e0a5e-dd45-8b8a-4ee3-357a0985ca9c@arinc9.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b48e0a5e-dd45-8b8a-4ee3-357a0985ca9c@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 02/03/2023 11:47, Arınç ÜNAL wrote:
> On 2.03.2023 13:29, Krzysztof Kozlowski wrote:
>> On 02/03/2023 11:22, Arınç ÜNAL wrote:
>>>>>
>>>>> ## Incorrect naming
>>>>>
>>>>> MT7620, MT7621, MT7628, and MT7688 SoCs are incorrectly called Ralink,
>>>>> introduce new ralink->mediatek compatible strings to address it.
>>>>
>>>> So this part was addressed by Rob - we don't do it, because it does not
>>>> matter. Ralink is now Mediatek, thus there is no conflict and no issues
>>>> with different vendor used.
>>>
>>> I think Rob was rather addressing that updating compatible strings based
>>> on acquisition or marketing whims is not permitted. This condition does
>>> not apply here as these SoCs were never Ralink.
>>>
>>> I understand your point that Ralink is now MediaTek but still, calling
>>> these SoCs Ralink would be a bit misleading, don't you think?
>>
>> Misleading yes, but also does not matter. At least matter not enough to
>> justify ABI break, so you would need to deprecate old ones and keep
>> everything backwards compatible. You still would affect 3rd party users
>> of DTS, though...
> 
> I intend to do just that. Introduce new mediatek strings, keep the old 
> ones so it's backwards compatible, therefore don't break the ABI.
> 
> Instead of deprecating old strings, I intend to introduce the checks I 
> mentioned, on the schema, so the pin muxing bindings only apply if the 
> DT has got a string that won't match multiple schemas. This way it 
> shouldn't affect 3rd party DTs.

I meant, 3rd party users of DTS. You will replace the compatible in the
DTS, right? So the DTS exported and used in all other projects, OS,
firmwares, bootloaders, out of tree kernel forks will stop working.

Best regards,
Krzysztof

