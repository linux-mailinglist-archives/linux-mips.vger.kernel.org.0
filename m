Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12C3862F51F
	for <lists+linux-mips@lfdr.de>; Fri, 18 Nov 2022 13:40:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241879AbiKRMkZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 18 Nov 2022 07:40:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241870AbiKRMkX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 18 Nov 2022 07:40:23 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AB7F72118
        for <linux-mips@vger.kernel.org>; Fri, 18 Nov 2022 04:40:22 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id b9so6630625ljr.5
        for <linux-mips@vger.kernel.org>; Fri, 18 Nov 2022 04:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/zLTYsXHR/2HWPYQijXGBO91u/5WmcoUCXMlBqcrLxE=;
        b=NqmKwrLbeZtYmWVypNV9cw9sVY8Uh0yA6ockCssS1ZW75SofXF8qdOtqUfQMry96sv
         leC+y7V2WvnDfbLwbzkDg7ztJnrcxoL4uCBqz+kxduqpJev0UsmRsmKTtJ9uTfZI9HXe
         6zoekzQEulbmlkQb6I2l43uKgmjdGK4lDzGm75xdRNxTrnernduIDMEE2W3BQy7JUDF4
         4KY2uWtn4Q7DhPosMCKq3qvVUYy5nzDYvyP/NkGaDRz9OcXUyjkWGey6hlmY4/nsv/3m
         EaV2eXIkvpidckVPkoycILrmEh/Xdsx10yTDgRgIYEAeYBmWToOrGwFcCFJZ2NvHTNrS
         v3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/zLTYsXHR/2HWPYQijXGBO91u/5WmcoUCXMlBqcrLxE=;
        b=pKH7ZzpicSWSXQ5XmLhdsFOUBhjMh+HpNff9twv18HkB2zEIFAuU8F2UMQ7EVk7K/6
         EvoVuILVJLPD5RAfs+TkF79APJhaPCAnzJu/XZcLmMcvpa7ffG89RiIj8QwqOleJ3eYm
         5fEXRigTweuceG6HbCcr8AaeqkVhei30NdeHly3dcp6CJsJ4bcSPustXB9YiROSpAcd3
         eyGx7eufr5ezPtU+3Yrljc+wUqnYNYcZyTkhE5wQnY3jDuNeixXNn7BWq1OmF18EaqsI
         CcoTqIoc5k3wgUQeUWkQrwXlmWycJSBEoVzkyzGI8g8fB6C5OpMXD8uuKOazezK+gdzI
         1VYA==
X-Gm-Message-State: ANoB5pkpZJNZ16koL1rb6N3LKPuRRb7V1PTZxy3DqSh+8r7AN6tZLQYW
        n0pEFarNBr3eIKtZfJJm8n7EQQ==
X-Google-Smtp-Source: AA0mqf6JHaqd3SdG/FMh7z7NgcZ5t7HsgeEP1/ln5CmlzAKzsWOfgilv2P8o79vy350QVlD7csdD3g==
X-Received: by 2002:a2e:b10c:0:b0:26f:bd6e:7f7f with SMTP id p12-20020a2eb10c000000b0026fbd6e7f7fmr2456769ljl.87.1668775219007;
        Fri, 18 Nov 2022 04:40:19 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k11-20020a05651c10ab00b002793cf0e9e8sm48983ljn.122.2022.11.18.04.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 04:40:18 -0800 (PST)
Message-ID: <13c5292b-4f04-0f85-98a2-bf4b5265b567@linaro.org>
Date:   Fri, 18 Nov 2022 13:40:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/2] dt-bindings: gpio: add loongson series gpio
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
References: <20221114095332.21079-1-zhuyinbo@loongson.cn>
 <20221114095332.21079-2-zhuyinbo@loongson.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114095332.21079-2-zhuyinbo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 14/11/2022 10:53, Yinbo Zhu wrote:
> Add the Loongson series gpio binding with DT schema format using
> json-schema.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

