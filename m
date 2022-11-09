Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27D1F623281
	for <lists+linux-mips@lfdr.de>; Wed,  9 Nov 2022 19:34:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbiKISeR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Nov 2022 13:34:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231182AbiKISdu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Nov 2022 13:33:50 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1369B13F34;
        Wed,  9 Nov 2022 10:33:45 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id i9so11454488qki.10;
        Wed, 09 Nov 2022 10:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9dRNz7Ny5K+jqxnZilH19TOkJ/QT0eJ784jLcqdXod0=;
        b=TWXroYadorY59nuW+mjreNHZ/MpPTyO7CZoKfqX5fBCHRq7BX+SrcAbJUsxXaZ74Yn
         bTLZrXdAA54ss3Hmcn3n20icAiMMEkiM/QrtakYRQcyLMIB1i3E7+qJslmjftVGVZo9R
         Sh4jzSfqpTR9LO/cA9PLpJPQhV9adWWN1DgZQEpzxaAP4xXdgHG/8blAMre83lqxCdcY
         7pRQVGynsDn8cBVSG19vhsmfcUpxsEvZkKIAtMWS5kg9bDyL24hFumGCqzrJtpywF2/v
         26u349H1MN8W4+oQAPLirw5T5Jjh2aYYUJitHE1cnyNSAfl2q6fsaPcuMXBe3ribNy1M
         INMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9dRNz7Ny5K+jqxnZilH19TOkJ/QT0eJ784jLcqdXod0=;
        b=1dno93po8XB5KLWK+DWpvb+mvM9vSDm5UQgO2vBWsJSJDEv/Ae2Ls+OddCsFWRU5BM
         CVfSG+0h56i5w6ObHDigWekQ6LY7pOyYj1eP14N6RTqPzsdAwTev1M/WV8VxqBCdzBVp
         6vw1htr6SnqVMURnq/kP925kcsHv7fGBzra9ZVCDiptVaITruBRKZu8PIkxeojVB5EzV
         1qUf2Dkqg0Ix0FnREn6a7uzFuFxeZJdBP0sKIEoAkWIUcxD9hr0V3ortG7gYgsPxz0cS
         bnl3O3m2Kzk6VQX2UFZF2odSS1ZAFoYabJb5iuJLHN9yHcR2w5t+EyHkDq4uF4Wn2vW4
         8NKA==
X-Gm-Message-State: ACrzQf1FevJi4a1xwwuu7WbvbghPbst78CQryHu+PwI5VQu6vWXQVvbb
        eV1vSQUoJV1VPl1P58uwiPjpfc+5xvsyHw==
X-Google-Smtp-Source: AMsMyM66U2LPPnWfXVhYQRyz6a7ngPAJSOzeMEkS4mvU6vtTDbiIXinZVfTY4ZGJKhpA2DKbhdUIhQ==
X-Received: by 2002:a05:620a:22e1:b0:6fa:46cc:8d84 with SMTP id p1-20020a05620a22e100b006fa46cc8d84mr34531729qki.10.1668018823298;
        Wed, 09 Nov 2022 10:33:43 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id x25-20020ac84d59000000b003a4f14378d1sm10022604qtv.33.2022.11.09.10.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 10:33:42 -0800 (PST)
Message-ID: <b91fb605-c421-b80d-07a5-c6b65f99ccf0@gmail.com>
Date:   Wed, 9 Nov 2022 10:33:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] mips: dts: bcm63268: add TWD block timer
Content-Language: en-US
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20221103110641.22305-1-zajec5@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20221103110641.22305-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/3/22 04:06, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> BCM63268 TWD contains block with 3 timers. Add binding for it.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

