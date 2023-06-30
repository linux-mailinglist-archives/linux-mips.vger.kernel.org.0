Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8C3674394E
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jun 2023 12:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232111AbjF3K0E (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Jun 2023 06:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231633AbjF3K0B (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 30 Jun 2023 06:26:01 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 889E3297C
        for <linux-mips@vger.kernel.org>; Fri, 30 Jun 2023 03:26:00 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-992acf67388so182742866b.1
        for <linux-mips@vger.kernel.org>; Fri, 30 Jun 2023 03:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688120759; x=1690712759;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RgUhcpjTGiXDPm11FEABoqmACOXtom4yU9rCcxjxYIs=;
        b=sYXnO/iYoSb91A0MJA7UGr8luu0VOZmdLA+ekOEHANuHUqIgUdHI/OAoX4lKL7HLcb
         j/+p/A5RSVMW7ScVk2umzQoHIA6mZ53aNsdqWH82tRFNW0cyHX8Nt0r5O8kdfGMOEYlm
         iKFtr3WNCLv9ueFBBkcGWCVAekuejR+jbcHhGecaivkwzIdOXVenQguh1zYyjGM6js7a
         KvarAQcbxX2C8HIAOtg5dXiiVKxZUDym6SzvGLPtLhYck0eTQzGM++mhWZljZqBzze6D
         APP3X1X+QQJFngv9KzY7GcWp9FOmx9WYQSR+DRn7Oo753cERrc1KzOGV0LEbBTi4f9MU
         H8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688120759; x=1690712759;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RgUhcpjTGiXDPm11FEABoqmACOXtom4yU9rCcxjxYIs=;
        b=jaWKuFrwpVkBLWXl2zGFaAVIKYc9WWL+8KyqxIEJYMMOr4NYC63Fvr4N6HJO0PcjhJ
         VZ3eNLIosBsB8mQaMtyBd/K862tjWZbAgCDRqGVGjoOW36+5VaIeccUHrLNkZ0MEWZTJ
         f0EA3e+77Z2gvUd9p1hv0f9nKRoxX0XJG3K5TpP4tXQQ20oRfPnHiDhBaFFjjQyCBZA7
         OTL1AuPAqJarOv2ZHHKtrullejAjA+HOstzqerlxb3ltBPgx4qwEMEzdo5585kBlPjz5
         OEaVI3vylK8fajhFo5+JmvfNN7WsF+BXg/x+Ls8vjSfeFHQNMcyP/JOKh3502CaIdA2/
         K5oA==
X-Gm-Message-State: ABy/qLbcSq0PwOw+oRg6pJDGmmbp2jwud/AekIJ+T+5KqhSo+hA24Hi8
        7QlVHYobqwCZdL1SuWxOyuQ5rg==
X-Google-Smtp-Source: APBJJlG0FH0tYyeB3HU4LuLg1dicCSOkXTHiDH2XjMVg9JKwab1fm08F4rNviOokTskexCdGZ99iKA==
X-Received: by 2002:a17:906:d7ac:b0:991:c842:2ca2 with SMTP id pk12-20020a170906d7ac00b00991c8422ca2mr1398727ejb.15.1688120758982;
        Fri, 30 Jun 2023 03:25:58 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.211.104])
        by smtp.gmail.com with ESMTPSA id x15-20020a1709064a8f00b00993017b64a8sm5205eju.224.2023.06.30.03.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 03:25:58 -0700 (PDT)
Message-ID: <0464bf9a-2fcd-cd55-e591-43ea0dc7beaa@linaro.org>
Date:   Fri, 30 Jun 2023 12:25:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 3/8] pwm: jz4740: Put per-channel clk into driver data
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org,
        linux-pwm@vger.kernel.org, kernel@pengutronix.de
References: <20230629094839.757092-1-u.kleine-koenig@pengutronix.de>
 <20230629094839.757092-4-u.kleine-koenig@pengutronix.de>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230629094839.757092-4-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 29/6/23 11:48, Uwe Kleine-König wrote:
> Stop using chip_data which is about to go away. Instead track the
> per-channel clk in struct jz4740_pwm_chip.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/pwm/pwm-jz4740.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

