Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52AA36D96D7
	for <lists+linux-mips@lfdr.de>; Thu,  6 Apr 2023 14:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237299AbjDFMNE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Apr 2023 08:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235777AbjDFMNC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Apr 2023 08:13:02 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3B04213B
        for <linux-mips@vger.kernel.org>; Thu,  6 Apr 2023 05:12:58 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id v1so39298451wrv.1
        for <linux-mips@vger.kernel.org>; Thu, 06 Apr 2023 05:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680783177;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aM8G9VB4LucfLng4CJyPcuDiKrMR8vPWj1cFc+E8RgY=;
        b=v1TKWAKJZucyK4QdlSO4zYPjB2CfNqXBHt5I7AtHbgE05cSbfPlrePjTIjYtiLicWI
         Fyr0XFR8RH7+oH7j84H6T+imZbp6QpRC3Cw+pyJOxVCyUbiHWL4pCKNZ+h6Yimn4bFW2
         xuC/2nkAthmwKOhqwwEsHJQ9V8++H93GSeC0cii59dn72HPSpFwY/wdz4auDmqnX1jJs
         XmmXkriOrljPZjtvaX3ao1hGJG9vYbIEnQDmifEF9MSGEAj2zwfneFutAUNV1WnKWWU8
         Ti8bpxA5oYT6YgOdnmomDbeFyqEIakFrwHpRMbSeczIrDiHgcehHX8fFSOZxZCHRPhLc
         pR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680783177;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aM8G9VB4LucfLng4CJyPcuDiKrMR8vPWj1cFc+E8RgY=;
        b=emR8mzIlhb9FOcOIGBUdIAgpeladQe9ojeygtgHoSVKBd7AR34LNSKXfi5+LfcoJhU
         ccY3CVP0CgOVjv7XmarsQfCjYSYUGDU2qc7xjVEFhsnyFYNI/ztSXPyMcTumS6zDcs5b
         xhnCBzmLlRia05xnpI8lFUgkr0Z3GsYRqyfLL5uA+3u6hBCyoEVwOYilkWRH0R3A+9Xy
         OCNEjS+0+8i0ruVAKrpiZR9FkDJC1IOlSQVOfHsN9TuHaItwDdf5I/oYYMoB4eiNz8D6
         du786Z8FPo1vbq0dlJqdmgIEgINmKsrPziUaY8r1SfMX96NST+FcMSP2wZpiqrmmtkKY
         5eaw==
X-Gm-Message-State: AAQBX9fqk2GtuLtnX2/BvRoejYNigc5KklCQX2l+xjgOVqBlhdJOEs8o
        RI42ohf8xGqbBqUlo+edP4kP5g==
X-Google-Smtp-Source: AKy350bMEYpscVlI1UQLsVqK1n5pidCohJ7Qucdg37vEy6isg2HxwwkzqO9X9Ir5Yrek4Ki9Qzt0vw==
X-Received: by 2002:a5d:4cce:0:b0:2ce:fd37:938c with SMTP id c14-20020a5d4cce000000b002cefd37938cmr6338470wrt.50.1680783177207;
        Thu, 06 Apr 2023 05:12:57 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id k9-20020a5d4289000000b002d21379bcabsm1590683wrq.110.2023.04.06.05.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 05:12:56 -0700 (PDT)
Message-ID: <7990502b-67d5-eaa2-a93b-bccc270ac597@linaro.org>
Date:   Thu, 6 Apr 2023 14:12:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 02/10] usb: musb: jz4740: Convert to platform remove
 callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-mips@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
References: <20230405141009.3400693-1-u.kleine-koenig@pengutronix.de>
 <20230405141009.3400693-3-u.kleine-koenig@pengutronix.de>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230405141009.3400693-3-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/4/23 16:10, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/usb/musb/jz4740.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

