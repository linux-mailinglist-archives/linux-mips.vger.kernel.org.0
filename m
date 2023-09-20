Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03FE07A88B4
	for <lists+linux-mips@lfdr.de>; Wed, 20 Sep 2023 17:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234622AbjITPoq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Sep 2023 11:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236798AbjITPop (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 Sep 2023 11:44:45 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98244A9
        for <linux-mips@vger.kernel.org>; Wed, 20 Sep 2023 08:44:39 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2bffc55af02so61983311fa.2
        for <linux-mips@vger.kernel.org>; Wed, 20 Sep 2023 08:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695224678; x=1695829478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nwiViBM+Ng2Zbve/53EB1qRCOS4sOxEjrY7Ch3Gjuko=;
        b=CRkX8zcM82KHlrizb10Yz9xe/1/6uo+QQYDQDMA5yyWiGPv/IEijh0qZYLl30QnU1l
         OLduempe77iTYsoyUWy0z2lRBoscVhwqXx5j5yPT9GERdsEyjQYmz8CkklSzNfGW+fo5
         7b2PQK1y1JWVF5OXvP2ruchyAxyBThUiuyNe5kmHoYQtgYr7MtskHhmHbbiv5bZoVzyw
         3o5KEhVi+zWG+MofxwRVgTh8CCePeWxQYr3tiLQ32M6ID7iGXycp2bemIzk2j42JrKwN
         wBeZWO+Mj/66sV15igMNAgIaIIR5oRWLLakCCzXUJKxLyCVDCQVFoCLbRBq6eO0mI09I
         sQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695224678; x=1695829478;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nwiViBM+Ng2Zbve/53EB1qRCOS4sOxEjrY7Ch3Gjuko=;
        b=DfefnMlnRv0s5eyF++UVkZr3qUH1i04cKGMk5kjWscQQUnaih4u2cjqCldszitFyBG
         UCCUlBBXAJbOpUAzCeUJ2twpz9p7FYlNXXfwhetBrYI4Hn1wUx/kEBZw9UBrsuhzh0pe
         ZeKSYA8U24R9keY8xaFoH2N6ZLeGDvb7RW4MqSkm9toD8Ehtp6gqge7Jxib65hNoemPX
         ozqHElsh7pETArHCTmGguyh7H0kv9RQPY+24v4UxuxXVvuMufLjfAaIGpm1Bzz1lHyO8
         gz8h4by/3e4uHuLCSppB07d7H3c8m15B5gQLI9YTX/5WH93/n3QRvOWLx0KkRbDZSjZG
         9/hQ==
X-Gm-Message-State: AOJu0YzUvltpKMOzRK02QfcFoVk7ZYJ6hgHVmSfRIZNty+F3GYCnQ/XD
        +oOiMDnBRLp+Jb/rH7lyD7MXPA==
X-Google-Smtp-Source: AGHT+IHL1BxFCB0RMETNh8MVHkFqrO5tu9cYC6MGMWkxjrGnG4pdcx7diZ7tSnuuONrha5On1aR5JA==
X-Received: by 2002:a2e:6a09:0:b0:2bc:b557:cee9 with SMTP id f9-20020a2e6a09000000b002bcb557cee9mr2559470ljc.43.1695224677761;
        Wed, 20 Sep 2023 08:44:37 -0700 (PDT)
Received: from [172.20.41.70] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id x6-20020a170906710600b00992e14af9c3sm9624125ejj.143.2023.09.20.08.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 08:44:37 -0700 (PDT)
Message-ID: <6fb10313-ac31-f5ed-763f-4424ec502d78@linaro.org>
Date:   Wed, 20 Sep 2023 17:44:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 09/59] dma: dma-jz4780: Convert to platform remove
 callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org,
        dmaengine@vger.kernel.org, kernel@pengutronix.de
References: <20230919133207.1400430-1-u.kleine-koenig@pengutronix.de>
 <20230919133207.1400430-10-u.kleine-koenig@pengutronix.de>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230919133207.1400430-10-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 19/9/23 15:31, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() is renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/dma/dma-jz4780.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

