Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA2F500627
	for <lists+linux-mips@lfdr.de>; Thu, 14 Apr 2022 08:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240022AbiDNGgT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Apr 2022 02:36:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239956AbiDNGgS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 Apr 2022 02:36:18 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD3364D26A
        for <linux-mips@vger.kernel.org>; Wed, 13 Apr 2022 23:33:53 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id v15so5052284edb.12
        for <linux-mips@vger.kernel.org>; Wed, 13 Apr 2022 23:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=D/ipfU28h+YDs/vQIG6JpjOGobV5kM+7VxkHsaNF4ec=;
        b=lZLxBSicwQ6JPl/gDsf9rr5+CGdgLAmoNPUZUVHZK8g5tXZJmEny8FUdllZsxJeUfL
         M36irxT2X0vs9gudKyATRAU3b8XDS+BBkTrtvuZ0RP9pvKTY0RyWQN3sNs7QGkPA9qVb
         GmHcYJ677mTEUSgLs+n/kGTCrhJw+aVjKfE7OQbUIZB0iCeZtgvWUjXTwlis+OCrvzvw
         X4zVznSHvIOGIVB7cqueULuRBc3jXtWoDlVpQeZo1TN71MzCYkJ+CAU4kBuQwsE23Uua
         cQvhydwvxhZTzFkgtZV1uyBs9IL29U1EjZvGfqAPiYLm+HdDAzkMkVMX4OL9KPTY2t9I
         8nFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=D/ipfU28h+YDs/vQIG6JpjOGobV5kM+7VxkHsaNF4ec=;
        b=yaUxjLUlH+Isbt188bCQKWlQmZOPgZ8o+b8ipknzHEeucfRvF1KeV1YQPy5YhjaqMW
         ZCLLG6zUdwXh7Hk0/3Hw48XOhuIeX7Bmv6FrLM+ZNhZwSXujM2wY1q34UwZbAB8bQgoE
         0lXQYL3UUI8dJ4TSHU/f21dCNyu4JljSQbXgck0QTqzxXpmuaijBsamgEPF+UJq9vGDq
         jAkl1Y/v1Zyq3zXr75VDTCx/kpzKbDz4YJ9MheIh4CoIbPLvOUnazx8lIG54RYfwhrfg
         6qI+5jqVRgweUHlA0iFe2p6nUaVuhNnZhhA92H2qSpYkGIAQYy1w482wfEdfU0cHLeMt
         uw2g==
X-Gm-Message-State: AOAM530nZDuaOUqOmIzltInqYhEo0d7371qpV5OXntD6F0b5T/TfZD7b
        1eMXM+++JNl/qrksDXXfevUiWA==
X-Google-Smtp-Source: ABdhPJwI0GhVFonB/NHPCfl4LSJUKJAZdcyNcDL79mP/DnGRcGHRwDgh7BGiywroN2IPiIZTffK5sw==
X-Received: by 2002:a05:6402:40c9:b0:419:4b81:162e with SMTP id z9-20020a05640240c900b004194b81162emr1368483edb.380.1649918032495;
        Wed, 13 Apr 2022 23:33:52 -0700 (PDT)
Received: from [192.168.0.208] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id b5-20020a17090630c500b006e8044fa76bsm332851ejb.143.2022.04.13.23.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 23:33:52 -0700 (PDT)
Message-ID: <02953ce1-0a43-5918-d139-35afd5f15b5b@linaro.org>
Date:   Thu, 14 Apr 2022 08:33:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 11/14] dt-bindings: pinctrl: add binding for Ralink MT7620
 pinctrl
Content-Language: en-US
To:     =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Luiz Angelo Daros de Luca <luizluca@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     erkin.bozoglu@xeront.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
 <20220413060729.27639-12-arinc.unal@arinc9.com>
 <41fa58ee-728b-7f0d-eea7-448c59641d85@linaro.org>
 <0dd1da16-232b-d634-3146-bf91e58c9543@arinc9.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0dd1da16-232b-d634-3146-bf91e58c9543@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 14/04/2022 03:52, Arınç ÜNAL wrote:
>>
>>> +  is not supported. There is no pinconf support.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: ralink,mt7620-pinctrl
>>> +
>>> +patternProperties:
>>> +  '-pins$':
>>> +    type: object
>>> +    patternProperties:
>>> +      '^(.*-)?pinmux$':
>>
>> Why do you have two levels here? pins->pinmux->actual pin configuration?
> 
> Yes, pins->pinmux->pin-configuration is currently how it's done.

It is currently done? Aren't you bringing here new bindings and new
driver support?

Best regards,
Krzysztof
