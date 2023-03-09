Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB03A6B280B
	for <lists+linux-mips@lfdr.de>; Thu,  9 Mar 2023 16:01:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231936AbjCIPBU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Mar 2023 10:01:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231968AbjCIPA6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Mar 2023 10:00:58 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84B2F5F225
        for <linux-mips@vger.kernel.org>; Thu,  9 Mar 2023 06:57:28 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so3800336wms.2
        for <linux-mips@vger.kernel.org>; Thu, 09 Mar 2023 06:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678373846;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fcSAcUKERpimj8PFFDmVRfuOLaQLta93SnD5jOr/Zg8=;
        b=pqgljRMCE+BQVRPIY9J6v+fvfncls5I/K25hHOnXp7pzkJQd5bI7Ci+o7sg0MwkcJa
         +JsSU+suCedwjkL+ZGx/xAHn3dA1XQMTnSUQ8dShxteFM441EvQ6iogJWFBIV+XuOgN4
         4dbKFtx2rEsvZPIwF+ck0vnqqjxdy/dV33JmwymliR0i6qLw71Kt2OtQBZCNQ/myXQDf
         sRwH5pxmfKRbad6nKK6pbgee00aX2lN/RDzNqNWjFnps3cm82AJZ+nLWibKpjGP2W+jG
         dZ0KRZUfiddys0hHMDREIi78mAa3k2coQ1Dr7KYFVGygBcRB6XjRjAToUEafJm+0pHx8
         /+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678373846;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fcSAcUKERpimj8PFFDmVRfuOLaQLta93SnD5jOr/Zg8=;
        b=vyfKdxnzvVt4Nw9097pMHLcy5zJDNExDQrjugYXZlv1MUbMrHFxEIgZFNA5I0ObmG6
         KB9EosaTeny3V6lgaXRxswrj08/TKCd7DsI0QDwI/DjqQvOG19H2veycEAima1wRkAp0
         PRKLBWP75wC5bsOyC1PkvJRZmlDTBuYy5/v414A+MW30tEy+r1jQbq2S7RCnB3q9DMYP
         jm8NlZ4sO8oB5A1m/c0SqJuzES1tj47jFqzy6OgFkonlcj9hYoz8cRU05uOD+eWuOqDk
         iBVujlzQYll++gwnwKkmqMbGB1fUJkpMfOeKvAOewOaPn26wYW2QtYpKTH1q13/pOYW/
         9BzQ==
X-Gm-Message-State: AO0yUKUg5ShYH2I0k/hYqijyyuqjXu5W+YdVUzlhzgdir/XpHKfmCBiX
        hNqVMlNKkZzSg5LDzVdb5hIUWg==
X-Google-Smtp-Source: AK7set8ak/WU5ZyG7fUciVCezPKcPTmpqMtiPFyBeHZUQLgVXQ2aqIiXmrRdqS1JG1UFna6N5KmgGA==
X-Received: by 2002:a05:600c:5008:b0:3df:e41f:8396 with SMTP id n8-20020a05600c500800b003dfe41f8396mr19069741wmr.37.1678373845894;
        Thu, 09 Mar 2023 06:57:25 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id k29-20020a05600c1c9d00b003df7b40f99fsm141198wms.11.2023.03.09.06.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 06:57:25 -0800 (PST)
Message-ID: <58445cac-501a-c4b8-01a9-34b5c21ef6e0@linaro.org>
Date:   Thu, 9 Mar 2023 15:57:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] mips: ar71: include linux/gpio/driver.h
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230308145303.826942-1-arnd@kernel.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230308145303.826942-1-arnd@kernel.org>
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

On 8/3/23 15:52, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The change to remove the implicit gpio/driver.h include was done
> after fixing all the other users, but the ar7 file still needs
> the same change.
> 
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Fixes: 21d9526d13b5 ("gpiolib: Make the legacy <linux/gpio.h> consumer-only")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/mips/ar7/gpio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


