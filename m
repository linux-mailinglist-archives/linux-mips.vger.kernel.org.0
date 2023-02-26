Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4156A6A3493
	for <lists+linux-mips@lfdr.de>; Sun, 26 Feb 2023 23:18:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjBZWSk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Feb 2023 17:18:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjBZWSj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 26 Feb 2023 17:18:39 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74BC1C650
        for <linux-mips@vger.kernel.org>; Sun, 26 Feb 2023 14:18:38 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id l7-20020a05600c4f0700b003e79fa98ce1so2770186wmq.2
        for <linux-mips@vger.kernel.org>; Sun, 26 Feb 2023 14:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bpKKmg/YcLP+pSehPY1RvJN7ppvx9uaUoxuTxOaRUnQ=;
        b=xWtlOxPRt4hOw3zHSQDokjqCy49f8sDxGOOOe7xM7TH99y9Su99sEhFU3lyWNJ+fPX
         +LS7MaghJfYsHttFdgfvNMNJCZ66Nwy3W8T5Yz7ZuNS8JaBc//mcIfgEXz8YuCtIn2lF
         X/PbmBAWlehW+ZP/MERp/z1qlNPxV/dgnv99CBWae2eXdVTTIVtgt2zdwAKacGZ/mkbP
         6JWaViSttzTYknk0MqPHqBl/6QayhpwwOhF8kHVinRvuHaWc4NQqLxdsa2jTjQd1TSXA
         WB/hYypCkC1L9nBtTrSuuDgGMYRKuep2hBsPWAg/t8SAs8CwrJsjE8RX6b6yXJMLZPW5
         X6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bpKKmg/YcLP+pSehPY1RvJN7ppvx9uaUoxuTxOaRUnQ=;
        b=eOqxCtV7lHWoGKb7TZLnYSDxuthAcb1QhjQb2zhQXSQnwKkIuAXIHvUnTIJBC745of
         eDWG+XZpaV022VEGJHJCCGfcwPCiKfC7eItwHpxCHZK6kSNGY+8tfpCaQXKGG/Q8aDul
         zAizO0ygtFde8dQXKyB8nObxpnVY6q3j6CDpQ+AJhqbNApJHhG46dQY2X7F4xu+TTHsa
         cHClu7agnjAo0EIUPuOQvm8BS324jRvFJHOFYfDMkdFw0Z2dkYg41KBt8iROh737RpXm
         wPvqbt4fXWXOZ5ursTPPhDQ7zr8ftconvXWGIsA6xqe98fuZPQhceUC9D6qQOCOwGP68
         C2jQ==
X-Gm-Message-State: AO0yUKUZm3hEgwTGjjcHI6DcebiRFASm2o0b8Qu1vaue7i28/zX4N5eu
        9wRdsRGUih+d8bLLxpoQSj2fM5RImTM9QWwX
X-Google-Smtp-Source: AK7set+uAzPJnO+Z5LC4HJXhX+IcqZ7dKL9mlxxGTRYTbLDK7Q+7hlCKDv2Fqy+ZYQLDctgEEmoe2g==
X-Received: by 2002:a05:600c:43d3:b0:3eb:253c:faae with SMTP id f19-20020a05600c43d300b003eb253cfaaemr8403192wmn.36.1677449916997;
        Sun, 26 Feb 2023 14:18:36 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c348200b003e8f0334db8sm10865568wmq.5.2023.02.26.14.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Feb 2023 14:18:36 -0800 (PST)
Message-ID: <a005dc2c-510b-3961-e00a-b69e85a702c7@linaro.org>
Date:   Sun, 26 Feb 2023 23:18:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/4] MIPS: Remove DMA_PERDEV_COHERENT
Content-Language: en-US
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, tsbogend@alpha.franken.de,
        Christoph Hellwig <hch@lst.de>
References: <20230222132425.7442-1-jiaxun.yang@flygoat.com>
 <20230222132425.7442-2-jiaxun.yang@flygoat.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230222132425.7442-2-jiaxun.yang@flygoat.com>
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

On 22/2/23 14:24, Jiaxun Yang wrote:
> As now we are always managing DMA coherence on per dev bias,
> there is no need to have such option. And it's not selected
> by any platform.

Leftover from 4e0664416c70 ("MIPS: remove CONFIG_DMA_PERDEV_COHERENT").

> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v2: Remove unrelated change.
> ---
>   arch/mips/Kconfig | 5 -----
>   1 file changed, 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

