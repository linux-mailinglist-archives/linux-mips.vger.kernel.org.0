Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4334B71582F
	for <lists+linux-mips@lfdr.de>; Tue, 30 May 2023 10:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbjE3IR6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 May 2023 04:17:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbjE3IRz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 May 2023 04:17:55 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68816BF
        for <linux-mips@vger.kernel.org>; Tue, 30 May 2023 01:17:52 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9700219be87so770764866b.1
        for <linux-mips@vger.kernel.org>; Tue, 30 May 2023 01:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685434671; x=1688026671;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wj2vfQdeCUjWFOPL+bMFdYDd0gpNNfItUQBUV/Ri/2M=;
        b=Wf7KuFj7iGQR88uOLPjc+IB78K44kDu2wxK0pshvE7DCoA1ZxklnaM0i57sXuqbzoH
         JMqJ81tCkjUCNwmYFwT5nB/Jgj/LfVCF8F8mGLyjc/TbKxFxRhr4j2VtUlWxGmPRy2m5
         jM8RlB6BMf4gfyL0A9SNnR/39KDUjrrKXn3WdpoajS3yvZ7ofLspdaV+XKUOtu20r5kg
         0DQ3bSE/GSwm9kUgakt3s+flOHdHteLLjYVckLjrZn0yRin8rnHEhi4JLA3E9QIkVaJI
         vCUxbxQAtCS/AdM2v+2CDAM3oWb/5oTxHX6wyG5CLn7+/ifyboGpL1OuvHdUyoEji8Rk
         a2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685434671; x=1688026671;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wj2vfQdeCUjWFOPL+bMFdYDd0gpNNfItUQBUV/Ri/2M=;
        b=PAlZRswfzDPQ4JgxfN1gSRxnfxa5S1jbmaYUhN+veV5GsVC3wsBIcX5fl2cHRY3ajV
         ODGEzGbi1eCmaW1W0fZN+N3i+SFtZepPizp0QWTV5VlqeQfOWOpsu1UMKB3JJVXFxZYY
         V+keWV3+IJ63mB0B9Cj9Zm4o1ZvioH2FSh6nC2YIHF10pj0W0DpJGFUHGKYbRih6myU9
         XuXe7wUAYie256PBXyqry0Ao08TqA9T/mukR73rVlowAKJTlRHCHfCLNdW89fJxj+1Hs
         KTIg3phA6+qsSl8theOm+iCy9JxPv/GhZDGyLuz4PC3Pr1UHHj/z6pnPDutr1s4vqg+D
         KRwg==
X-Gm-Message-State: AC+VfDwEBkgkYbY0TmVMtkHd2MaD32xl24UUFIg4E7b/QR4WDCrphmsw
        G6xoj5heblUMGGf5BDaCyDjcZQ==
X-Google-Smtp-Source: ACHHUZ4ugdMu/st7rHgbvOjOdy3SxB7DRmoSoqFn8ddgzUQzF4fLz9AHwm0lhkzCFrruSb2/UPMBQQ==
X-Received: by 2002:a17:907:ea4:b0:953:37eb:7727 with SMTP id ho36-20020a1709070ea400b0095337eb7727mr1853835ejc.43.1685434670780;
        Tue, 30 May 2023 01:17:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id sa24-20020a170906edb800b0096595cc0810sm6994419ejb.72.2023.05.30.01.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 01:17:50 -0700 (PDT)
Message-ID: <6845b6ce-06a8-9a0c-7f04-50fa906cd1e4@linaro.org>
Date:   Tue, 30 May 2023 10:17:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V4 1/5] dt-bindings: rtc: Remove the LS2X from the trivial
 RTCs
Content-Language: en-US
To:     Binbin Zhou <zhoubb.aaron@gmail.com>,
        Conor Dooley <conor@kernel.org>
Cc:     Keguang Zhang <keguang.zhang@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Huacai Chen <chenhuacai@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        zhao zhang <zhzhl555@gmail.com>,
        Yang Ling <gnaygnil@gmail.com>,
        loongson-kernel@lists.loongnix.cn
References: <cover.1684983279.git.zhoubinbin@loongson.cn>
 <9a2fbd6860f37760ca6089c150fd6f67628405f6.1684983279.git.zhoubinbin@loongson.cn>
 <20230525-custody-oversleep-f778eddf981c@spud>
 <CAMpQs4LuGAUfMNB93B=vgwJaLqEM6Cq5KyaCtnHOL7RWGuZy-w@mail.gmail.com>
 <20230526-dolly-reheat-06c4d5658415@wendy>
 <CAMpQs4KeHCW+9ssAn-jF0efiUOzERRFDu9Sjz1Mtv5Lk1uFuPA@mail.gmail.com>
 <A206E0A5-9BF0-4787-9B06-9F91FA3C60A3@flygoat.com>
 <20230527-passing-unfixed-39e01b787808@spud>
 <14EF9F21-8150-40D9-8870-E9151C4882CF@flygoat.com>
 <20230527-poet-antarctic-cc02aa60ab52@spud>
 <CAJhJPsU_qOJKO99S1xjJaSUqXsXAG7HpYbzs5wTb8J4-tQqSQA@mail.gmail.com>
 <E229B204-1B00-4B24-B4BF-15277682FB4B@kernel.org>
 <CAMpQs4K4e3BSVvqXa+QjhM5XDxHc_ZCiRYW+HgPo21AQ_bYSRQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMpQs4K4e3BSVvqXa+QjhM5XDxHc_ZCiRYW+HgPo21AQ_bYSRQ@mail.gmail.com>
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

On 29/05/2023 10:31, Binbin Zhou wrote:
> Hi Krzysztof:
> 
> Excuse me.
> We have different opinions on how to better describe rtc-loongson compatible.
> 
> Based on my previous communication with you, I think we should list
> all the Socs in the driver and drop the wildcards.

Suggestion was about the bindings. Not in the driver. I never said to
list all compatibles in the driver...

> This should be clearer and more straightforward:
> 
>         { .compatible = "loongson,ls1b-rtc", .data = &ls1x_rtc_config
> }, //ls1b soc
>         { .compatible = "loongson,ls1c-rtc", .data = &ls1x_rtc_config
> }, //ls1c soc
>         { .compatible = "loongson,ls7a-rtc", .data =
> &generic_rtc_config }, //ls7a bridge chip
>         { .compatible = "loongson,ls2k0500-rtc", .data =
> &generic_rtc_config }, // ls2k0500 soc
>         { .compatible = "loongson,ls2k2000-rtc", .data =
> &generic_rtc_config }, // ls2k2000 soc
>         { .compatible = "loongson,ls2k1000-rtc", .data =
> &ls2k1000_rtc_config }, // ls2k1000 soc

I would suggest to use fallbacks as suggested by Conor at least for some
of them. You referred to my previous comments about wildcards.
Wildcard != fallback.

> 
> And Conor thought it should be rendered using a fallback compatible
> form based on ".data".

Based on common (compatible) programming model unless you already have
clear hardware differences making them incompatible.

> 
>         "loongson,ls1b-rtc"
>         "loongson,ls1c-rtc", "loongson,ls1b-rtc"
>         "loongson,ls7a-rtc"
>         "loongson,ls2k0500-rtc", "loongson,ls7a-rtc"
>         "longson,ls2k2000-rtc", "longson,ls7a-rtc"
>         "loonson,ls2k1000-rtc"
> 
>         { .compatible = "loongson,ls1b-rtc", .data = &ls1x_rtc_config }
>         { .compatible = "loongson,ls7a-rtc", .data = &generic_rtc_config }
>         { .compatible = "loongson,ls2k1000-rtc", .data = &ls2k1000_rtc_config }
> 
> In this form,  I think it might not be possible to show very
> graphically which chips are using the driver.

??? How is it impossible? For all other SoCs and architectures it is
possible, so what is special for Loongson?

> Also, for example, "ls7a" is a bridge chip, while
> "ls2k2000"/"ls2k0500" are soc chips, and it seems inappropriate to
> integrate them into one item.

Why it is inappropriate? I don't see the issue here... what is a
"bridge" chip? Isn't this also an SoC?


> 
> Which one do you think is more suitable for us?

Use fallbacks for some. You pointed difference in alarm for ls1x, right?
If so, then they can stay separate.

ls2k500 and ls2k2000 seem compatible with each other so should use fallback.

Best regards,
Krzysztof

