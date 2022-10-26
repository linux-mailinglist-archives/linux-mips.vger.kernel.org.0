Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5809A60DE12
	for <lists+linux-mips@lfdr.de>; Wed, 26 Oct 2022 11:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233280AbiJZJ36 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 Oct 2022 05:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233113AbiJZJ35 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 26 Oct 2022 05:29:57 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E69140001
        for <linux-mips@vger.kernel.org>; Wed, 26 Oct 2022 02:29:55 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id v130-20020a1cac88000000b003bcde03bd44so1017201wme.5
        for <linux-mips@vger.kernel.org>; Wed, 26 Oct 2022 02:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E6H2u9oGK4VXsKGNASBOoMX/dBF+iFbozvBEkuT+Wq4=;
        b=J/hcPlK3P0/PYAh25MBDjVEkt187l1iYYxU1NZk+huy0jgX0oshlzMSF6CjcOYSU2o
         dG5pFlczZphLMxv24nIB9lVa2tv7isgeXZhRBgdCn5/cwuqImKY6g+8axch5PZGLL2mZ
         dSWdNHeoZPXAV59kpgyQnOhHuxZFCj62uqI/VWBma+i0099OJFiJh/kRaGOXWyHxfxQ+
         hurBoUYM1HQfiAN6kLDAavZL/rDvS7yf+0zMAqurtFQ79tYDcOtnQl1gBIehu2ccb1bc
         NkJYXeFFPlCgLk/DGUae59LtyoosODTcMChgph6vQogQOq7HvdC/Lr1sO30vBUKTi5yB
         EgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E6H2u9oGK4VXsKGNASBOoMX/dBF+iFbozvBEkuT+Wq4=;
        b=Lg+Z+b81N2WGUBcxqt1azdN4iQU1Yupiu3RzFhk9WCwzMb66emcMy1g6VMxoppxJ2J
         N2P0Xo+1qKtfEFlt+yNZ4+jGnnkCZ/lTLwZl1QLnSwj0sfZeZ44uvd3uSDx77HwEP2iJ
         j6cBs3bAtefzcVnFIcfBSO6mw4L0rm1nOxpGQQLsq1evTtK9YToqptJzOpE5JtKdJJKz
         /Ebu9w9ytViLjNkLJaNcTl0Pqv/szubnW6AFoHbvlbHh6efNPJKSsqjf2NntiQWHbqdZ
         j0XyZWGkZl3dXvK3qlwvBbIFcbgMcVRURh2/iiDD38n70ivBi17AV5CxX7M8VlgtRvDC
         RI8A==
X-Gm-Message-State: ACrzQf3ozcKui6u2tXqSRtS9ptWAqsqUGVoHINniMEM8cNhReIwqyRPs
        tIdy7Xw9iS3+xpAjYopw6q9/sby415e7isZ3
X-Google-Smtp-Source: AMsMyM7q2Of+tpOxmL6S+98KSburHfj8xefTLmFr4ZHGUAH2MsZs2ksElXyw8bypxAEc6yn3vjKRNw==
X-Received: by 2002:a05:600c:4f0f:b0:3ca:31ba:d77c with SMTP id l15-20020a05600c4f0f00b003ca31bad77cmr1766099wmq.36.1666776594461;
        Wed, 26 Oct 2022 02:29:54 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id bd14-20020a05600c1f0e00b003b492753826sm1320809wmb.43.2022.10.26.02.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 02:29:53 -0700 (PDT)
Message-ID: <9604b16e-df7d-634b-5c76-3aa6f9071fc0@linaro.org>
Date:   Wed, 26 Oct 2022 11:29:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH] mips: alchemy: gpio: Include the right header
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Ralf Baechle <ralf@linux-mips.org>
Cc:     linux-mips@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org
References: <20221026080528.105967-1-linus.walleij@linaro.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221026080528.105967-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 26/10/22 10:05, Linus Walleij wrote:
> The local GPIO driver in the MIPS Alchemy is including the legacy
> <linux/gpio.h> header but what it wants is to implement a GPIO
> driver so include <linux/gpio/driver.h> instead.
> 
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   arch/mips/alchemy/common/gpiolib.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


