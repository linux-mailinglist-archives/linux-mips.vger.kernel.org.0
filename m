Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17BCD5BC312
	for <lists+linux-mips@lfdr.de>; Mon, 19 Sep 2022 08:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbiISGtb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Sep 2022 02:49:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiISGt3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Sep 2022 02:49:29 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90B5CBE
        for <linux-mips@vger.kernel.org>; Sun, 18 Sep 2022 23:49:26 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id x27so12160239lfu.0
        for <linux-mips@vger.kernel.org>; Sun, 18 Sep 2022 23:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=wg2LdSzIVICz31LePZFG1Iioz/4ESF1qtF7G+S/AiOU=;
        b=LQ0PJ9UOqgyHgtKde1U+ptQ/Mn5uhuov1fljVavJrCae4aiLpr+S9LuMZGmwW8Er0X
         55L/sPk1gsFl2P+81tIVaB8A8UXNyxqJ1OP9BEefC10k6YGhdjTGhqIj4NOUg8r80QDx
         3rkVEyqttk4oI3ziHt2n99izkCrrda6v4MwZtAj8TdYbOaw/vRBn3mJ82CyCAzPS+6dK
         r3JToyYsi9a6jZo22NNWxc/ZMuaX9UmacwRVF4ByNC1z2QXb2eSNdzsiWs0CqdWtg/SL
         XcmEZ3GKGoh1qSiDd5wzZjp4jxyfM4wFuXHGMCGYzowZNhAUMbEq5wD33cVGKhiUqQBQ
         kDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=wg2LdSzIVICz31LePZFG1Iioz/4ESF1qtF7G+S/AiOU=;
        b=IV1u2ouDMhr7jCnmOf1BMYjcMTE21iTODSGYvHGLlIPzAx2OS/0EWznuriTwGTcVt3
         FekBprWfg7uL+yE7u6xDpipry7GspX/R0mL9GLYPXxeN/5IrihJcmt1pLXu9UVu7sSxe
         yHBQ5MMfupc9Uptz4VDG/910I1plx6pIXEn9EjfJiygI5l8Yf5erph7KIHzjvPs7QlhK
         hZJxfbo+bsT+Bu6kxhuROJtTsMr76zjglxkF5YG94uDEGLd3qNvqb8wtb7o1hRmrDMkg
         1b1qne/UNGoTMEfdnCr8nRUSYJB/xzzJa5dmwJffQKc8yHpg3/uIF6lOXP/ymmxYrmqQ
         +aXA==
X-Gm-Message-State: ACrzQf3fo5cGttQKUpnPOP4woih2nj+9cV37WVju+887cshwhRD4c9v9
        KWSk0uq7kjwJOnvivPe2Ft8Llw==
X-Google-Smtp-Source: AMsMyM72JEClxw2NN07eQDI1hAMv1/diGyAp/pVGnimUheZZ+u+vF3d+fFkVgA8U2duV6CGVs7Sgpg==
X-Received: by 2002:ac2:4c4b:0:b0:499:3234:64fd with SMTP id o11-20020ac24c4b000000b00499323464fdmr5911754lfk.190.1663570164871;
        Sun, 18 Sep 2022 23:49:24 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y24-20020a199158000000b00498fbec3f8asm5053820lfj.129.2022.09.18.23.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Sep 2022 23:49:24 -0700 (PDT)
Message-ID: <f6542e2e-8214-a53d-70c0-5389e0b6e568@linaro.org>
Date:   Mon, 19 Sep 2022 08:49:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 net-next 04/10] dt-bindings: memory: mt7621: add syscon
 as compatible string
Content-Language: en-US
To:     =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Landen Chao <Landen.Chao@mediatek.com>,
        DENG Qingfang <dqfext@gmail.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        erkin.bozoglu@xeront.com
Cc:     netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
References: <20220918134118.554813-1-arinc.unal@arinc9.com>
 <20220918134118.554813-5-arinc.unal@arinc9.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220918134118.554813-5-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 18/09/2022 15:41, Arınç ÜNAL wrote:
>  
>    reg:
>      maxItems: 1
> @@ -24,7 +26,7 @@ additionalProperties: false
>  
>  examples:
>    - |
> -    memory-controller@5000 {

This is still memory-controller, so node name should stay.


Best regards,
Krzysztof
