Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35FEE62B472
	for <lists+linux-mips@lfdr.de>; Wed, 16 Nov 2022 09:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232972AbiKPIDG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Nov 2022 03:03:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230431AbiKPIDE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Nov 2022 03:03:04 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F07C25C54
        for <linux-mips@vger.kernel.org>; Wed, 16 Nov 2022 00:03:01 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id r12so28278631lfp.1
        for <linux-mips@vger.kernel.org>; Wed, 16 Nov 2022 00:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wPMDtos2j4aykEy41/Mx5XsfSYAWFrCJwAqrA1+vLB8=;
        b=Vbf+3SJjn+cqpz+LdY9z/6r5cEJHr1+1UchnsnMsjymxGs3YX4A1/qMU+wq6PmD38S
         jn9VjKeA/BYPVDYcYaAOsH8ce3BIfl4EwVOEqvcoDl+bz9a3J9NOFmqjodPX7OSErHfH
         E6DYWl8rdfVkhxVF3nUCD1GrootUNkarZ37/ytXIkdr0R5PECXLglLAkEAqHeJ8IdFIC
         syCp+lxEgoLpeaaAX9+q7hIf4IBdV69vEeaJlfqAI6ejh53p/0efb4n5rhXUJVaA4/I9
         V2VxBuLMKkL13/qokqD+edICj1WiwepmD09zH0mSqYdMpt7A73TRqQwmGQg9/i9txPA7
         wh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wPMDtos2j4aykEy41/Mx5XsfSYAWFrCJwAqrA1+vLB8=;
        b=xIR5R0XoMTSI9lFPatV0Wskvm8FiVaGVOWygj34/xqH3F9Tb3ZfewnfeeMARn2KkqB
         ZLnHw5N+jPdp/8B3KGuXzFzCK7kFlPo4BTOZKR4MX6A1qKxy78U4snmLV1tgw6WqG7p1
         TSIe8r071dr8zm9+3J+rxdG9donO3NimadWNV5ge6zbY/hNcNzZp9KPt/fyBHUhEIqyW
         DFJrzxlhQIE6yz7KrjVKFocY7oPpYhGRQRj5didBEhEmnV5+UF8Gf2Q/EVRKrJsYQP2q
         mngnPvi8oRm9UojSmvr0l7GgbU74EQjRwDhXd8J7XPaGo0jowhivQCtweum/uKTYYEYY
         cH+w==
X-Gm-Message-State: ANoB5pnLl06Psq9lfe/xZuJ9IR7xkA8+1SprkSikOPwrji2Y1lLeYFvG
        t0vMYR7x7DxIf+9ShcfJdt01xQ==
X-Google-Smtp-Source: AA0mqf6amq0LaL/3NgcdvuzYJ/+yws2jhZw2TtQulS8lyZ6z3icivHA4KAo9VicLYX+cy3R2fBjCkw==
X-Received: by 2002:a19:f703:0:b0:4aa:a6f8:f042 with SMTP id z3-20020a19f703000000b004aaa6f8f042mr6309329lfe.405.1668585779635;
        Wed, 16 Nov 2022 00:02:59 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a17-20020a056512201100b0049d83646ce7sm2483365lfb.110.2022.11.16.00.02.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 00:02:59 -0800 (PST)
Message-ID: <8368b30c-26d5-c7b1-ceab-77df1163cbcc@linaro.org>
Date:   Wed, 16 Nov 2022 09:02:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 2/2] dt-bindings: gpio: add loongson series gpio
Content-Language: en-US
To:     Yinbo Zhu <zhuyinbo@loongson.cn>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Juxin Gao <gaojuxin@loongson.cn>,
        Bibo Mao <maobibo@loongson.cn>,
        Yanteng Si <siyanteng@loongson.cn>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        Arnaud Patard <apatard@mandriva.com>,
        Huacai Chen <chenhuacai@kernel.org>
References: <20221116065335.8823-1-zhuyinbo@loongson.cn>
 <20221116065335.8823-2-zhuyinbo@loongson.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116065335.8823-2-zhuyinbo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 16/11/2022 07:53, Yinbo Zhu wrote:
> Add the Loongson series gpio binding with DT schema format using
> json-schema.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---
> Change in v3:
> 		1. Separate some changes of MAINTAINERS file and enter the first patch.
> Change in v2:


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

