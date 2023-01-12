Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AFA1666D76
	for <lists+linux-mips@lfdr.de>; Thu, 12 Jan 2023 10:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236603AbjALJIy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Jan 2023 04:08:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239631AbjALJIM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 12 Jan 2023 04:08:12 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AA714F128
        for <linux-mips@vger.kernel.org>; Thu, 12 Jan 2023 01:03:20 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id cf18so36752740ejb.5
        for <linux-mips@vger.kernel.org>; Thu, 12 Jan 2023 01:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NPg45aihulxFcwTt727w+mL/usKIND+jUszExCuHhXY=;
        b=MEKnkpY7fZaDBRZ0GOoGL+5J1rSvAP8tz+GM5LCiulO58ykRwW5361vjH5gxAeEoTv
         8HhjnXzMTuVGML79PFXQGwbgf5poVUiyY3JZQ/kxQKDoQDOgSFvZirbzNAoalx5RnAIo
         W837pnqEu6ErV/K5C/TSut+95htAA3jdC85im8RYpa2Mv6Wf8gigkXc66wQ3vp7EW9jG
         99CbxHCvE1P/wla42oE6rDpKSOx9JX2xV8TtbABTXNatIUem6GM68FEzT9TlJi46V4F5
         p4OAsmgHzFf9g/x76nO013ohi75SH8DxRI4ld+AMCZf9VNCU4qQSAPS7K1ju3MGQsRPN
         surw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NPg45aihulxFcwTt727w+mL/usKIND+jUszExCuHhXY=;
        b=At99u+cVmFIqgXe5mjFpm9wHYlcwA0qs7huWTbcgkxLtfFqmur405QnGp5F42vmVDr
         v7Crj5F5mr25nUn31CxSzWgjXNh0yltvPhdlGk3aFMPMjedRdVdw9zS+Qsf2Gzn0udnE
         207xr1rxlujUWBRCyBRR4FfgpSANiKIaq8gvVcCKZUU4K46nmKvrujse1uuIGo9w/0Gk
         hjBkteciCIk0BBhGzJGYKDqos7ffk/BbfeYTzgTtDyTARAm86cz9Y51AC1jJWHxUeNuv
         EbxDhDCkcCVoX8aulRhX0GyoELX0s72rao80e2LFJb4mDwFrZIbLQLcGYIsszTTAZwW0
         yVWQ==
X-Gm-Message-State: AFqh2koJRKDyNXkllHSIMhOMK1h/xrgLU91WDT1bvfyiDMYJNSsc9jbK
        1B7UqjhFfsZejfHoCT4A6fmxFQ==
X-Google-Smtp-Source: AMrXdXvzRX9flDjGK/8oJ+WqOQPVMaaniUk/Te2rCqcHpO/BoL8tDSkKBKpzsxbv6klDJbEcUyLzaA==
X-Received: by 2002:a17:906:1655:b0:7b5:73aa:9984 with SMTP id n21-20020a170906165500b007b573aa9984mr60091934ejd.14.1673514199160;
        Thu, 12 Jan 2023 01:03:19 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906059100b007933047f923sm7202212ejn.118.2023.01.12.01.03.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 01:03:18 -0800 (PST)
Message-ID: <21a5fc20-05d7-5d96-aa75-bc335835033c@linaro.org>
Date:   Thu, 12 Jan 2023 10:03:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 6/6] dt-bindings: pinctrl: rt3883: add proper function
 muxing binding
Content-Language: en-US
To:     =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, erkin.bozoglu@xeront.com
References: <20221231160849.40544-1-arinc.unal@arinc9.com>
 <20221231160849.40544-7-arinc.unal@arinc9.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221231160849.40544-7-arinc.unal@arinc9.com>
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

On 31/12/2022 17:08, Arınç ÜNAL wrote:
> Not every function can be muxed to a group. Add proper binding which
> documents which function can be muxed to a group or set of groups.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

