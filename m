Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92EFD64AA8A
	for <lists+linux-mips@lfdr.de>; Mon, 12 Dec 2022 23:45:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233829AbiLLWo7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Dec 2022 17:44:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233735AbiLLWoz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Dec 2022 17:44:55 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7221CD57
        for <linux-mips@vger.kernel.org>; Mon, 12 Dec 2022 14:44:54 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id z92so15284088ede.1
        for <linux-mips@vger.kernel.org>; Mon, 12 Dec 2022 14:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R+CITe1Dq7f4WKRY/T035akkJWkeh8xmn+Ptd1Om1dA=;
        b=X2fEgZ0xL4LsQA56aa6jXEO+YbXbYLVg3ATZOObeAGMsDA0uJQwuoSbTJK2Y6woHg/
         ougGC4XXsOEfOaqm+Zuxpk/fL2nMoVNfX0+nl48qnOkoJlsI8KhW44KqRvNPGdhAuy45
         CNVjRsGvqcBi3LInVHCdzz7CCCotlCwmcQGWoOWN7oMHNENNziwydIxCkOHvHrRZquBS
         lwWNRak//AX2zz8n4Pqgo9p4joMqebzo96lBIFI44d7HCqM3X9Rcn822RJtuhv08g2Ae
         8I1uuGPcAvpSpkbUMnmK4FjY+NpTZCkvbNxa7BtLjMkqscd92Fiu/9c8KTz5/8ukoiDm
         BDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R+CITe1Dq7f4WKRY/T035akkJWkeh8xmn+Ptd1Om1dA=;
        b=VMaJdonXEFlwHdrpBmDKVRJY2aVqQ4sl53aH7n2Zrq0Jtq1PKPU+Q9ikfIGw3xWFmw
         3uIfs1lPiN8kI0bXeKSyFjoYjJadRohQJ++QoKL1JfreUbmFxBz+2ntyn0bA6x9GiMYG
         xabd2UHtANYxOFEyav+8HuQYsY+lj1Ue4+GGqgoM5Dzrf+CI2uX8GMdyiQmhnyXgMLef
         4d/eiUgX5gJWQRr5K0a+44mPWzM42z/h4dB23Zzr88KPupF4P58H+qdGjoJbF7svOxoe
         qWaAxsz3hJ57ToxiuQ+lAS1xKCGxfjdH5z8M6KlXsefjjeT6YJ7rL+U1YRgsnEcX9DnB
         n8rA==
X-Gm-Message-State: ANoB5pkqoy/MShsMglnrOH3e3ltWV/cFJtrHQmnkGfZC6G1uj3ce4A1E
        XHVFAVhUl9UjB4bOaSvBzO/fVoybZRngGgUfstk=
X-Google-Smtp-Source: AA0mqf6vJM/hyGG0TuicvbFUjskEdhD6h7q+ADs0cpbgbCYqQ6SMWi5djb5c+UuOU2hXAnNkoTWDxw==
X-Received: by 2002:a05:6402:2a09:b0:461:a5ac:61e5 with SMTP id ey9-20020a0564022a0900b00461a5ac61e5mr17648705edb.15.1670885093052;
        Mon, 12 Dec 2022 14:44:53 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id f5-20020a05640214c500b00458b41d9460sm4182489edx.92.2022.12.12.14.44.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 14:44:52 -0800 (PST)
Message-ID: <4a15b419-e543-9ae0-1447-abe5851a33cd@linaro.org>
Date:   Mon, 12 Dec 2022 23:44:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v3 03/19] irqdomain: Drop leftover brackets
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Marc Zyngier <maz@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221209140150.1453-1-johan+linaro@kernel.org>
 <20221209140150.1453-4-johan+linaro@kernel.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221209140150.1453-4-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 9/12/22 15:01, Johan Hovold wrote:
> Drop some unnecessary brackets that were left in place when the
> corresponding code was updated.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   kernel/irq/irqdomain.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

