Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61C6C6A7FF0
	for <lists+linux-mips@lfdr.de>; Thu,  2 Mar 2023 11:29:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbjCBK3R (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 Mar 2023 05:29:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjCBK3Q (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 Mar 2023 05:29:16 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC874DBCA
        for <linux-mips@vger.kernel.org>; Thu,  2 Mar 2023 02:29:14 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id a25so3117191edb.0
        for <linux-mips@vger.kernel.org>; Thu, 02 Mar 2023 02:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677752953;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GRjMQJRtE2Bj9BjD+ekrQkZUrzfyzg03TWtGip3bI4w=;
        b=fGGD97qyolMbVM2MF8TJC9kNf5yy1V/Nxss8muasMPP04By5S2huAuT6M4F9BEhjw+
         LZ7ShcpNaOZz49Xm730maLefpmezUuUODHNmDCCkG4h+o7758mUtk++09bXmSvBMVue5
         jN/Ud8OJeKiMp8BzM0HsmCzTWbuupJyuWWiiy24SACAbx4XfhYA0tAow6F0M2jWto9rA
         WP5zO7vwBEh942WiyRXNnUgE+PU9UKznVZuuTpSX7nQCE8iiRHZBaQTnkfo0cSeNfDEM
         hdihAt1v9K1aCoRPflebQKC+KL5W2xSZkJlsDh3UZoSy0y4Ge/FmkPtuPY4ajPM3u3Dq
         d4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677752953;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GRjMQJRtE2Bj9BjD+ekrQkZUrzfyzg03TWtGip3bI4w=;
        b=QDUVYUYRBqh+epCLJeTIo1tgm46Oua4Q+waho7VFKMVQMoO8L5fvbxaxNfBETA+JJr
         ok7MjKkOajFhu1DWkrjt7x4hD0aLXX3cLSjJ6HgHU6P++xuBcYjheScEjyt0KWlLMXrz
         o/TCouqqusvgIZOwsmPIe/oBELNHnGuf6VkHd5KvNGy+ccOiTkYq2yv9EEwwf7hvt8Ub
         4zADstSWBWzG7JzYY7juPjE9ZFJCVQf6X/ZmFhTQ3qlESD0ryZN8Xf0FtURjGCHygVKx
         KI2tRtt8ktkz/8fClLxQ9lCYvmz9sj7p2WoSYxUhVAt78CvJdgvM1USrqSjXPG0o1NYs
         cUTA==
X-Gm-Message-State: AO0yUKWSXvPY0Ygj5vNtesvL2lnzik6xf5uDnzVkUMDBn1HXju93jqjZ
        UQ90wSvna6dQyuWh2NYtSVnUVg==
X-Google-Smtp-Source: AK7set8MX5Ca2LfKKYqYHZj9wih46oAtJRMNpT+QV58afPq6J8YNFqnWqw3SqRcubazacAt+XkczUQ==
X-Received: by 2002:a05:6402:1acd:b0:499:b672:ee30 with SMTP id ba13-20020a0564021acd00b00499b672ee30mr10272126edb.11.1677752953229;
        Thu, 02 Mar 2023 02:29:13 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u6-20020a50c046000000b0049ef70a2894sm1756994edd.38.2023.03.02.02.29.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 02:29:12 -0800 (PST)
Message-ID: <2ccb573d-39f4-cb80-7a3e-63a60c2bc0a8@linaro.org>
Date:   Thu, 2 Mar 2023 11:29:10 +0100
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <89588f69-9cf0-e7a4-b976-5ce87d42e296@arinc9.com>
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

On 02/03/2023 11:22, Arınç ÜNAL wrote:
>>>
>>> ## Incorrect naming
>>>
>>> MT7620, MT7621, MT7628, and MT7688 SoCs are incorrectly called Ralink,
>>> introduce new ralink->mediatek compatible strings to address it.
>>
>> So this part was addressed by Rob - we don't do it, because it does not
>> matter. Ralink is now Mediatek, thus there is no conflict and no issues
>> with different vendor used.
> 
> I think Rob was rather addressing that updating compatible strings based 
> on acquisition or marketing whims is not permitted. This condition does 
> not apply here as these SoCs were never Ralink.
> 
> I understand your point that Ralink is now MediaTek but still, calling 
> these SoCs Ralink would be a bit misleading, don't you think?

Misleading yes, but also does not matter. At least matter not enough to
justify ABI break, so you would need to deprecate old ones and keep
everything backwards compatible. You still would affect 3rd party users
of DTS, though...

Best regards,
Krzysztof

