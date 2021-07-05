Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 504A33BC162
	for <lists+linux-mips@lfdr.de>; Mon,  5 Jul 2021 18:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbhGEQLY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Jul 2021 12:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbhGEQLX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Jul 2021 12:11:23 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B54A3C061574;
        Mon,  5 Jul 2021 09:08:45 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso18749106otu.10;
        Mon, 05 Jul 2021 09:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4b3DICOpYGt0t2pRIBY3meTjj8iWdWQuqZZbZkb3EME=;
        b=GrE5Y/wjN6FQ817LDO5hwL4Aok5NmRbduG1+JxkVbYFGMsML8tGTIs6gnot/ibpZrA
         EVYo0nWYa8riUiXjtEcYplAOApmi8+So7WGWNOJs701SrKyiFQu4aAE7vjlR9uFYUd8M
         OeggBLkUBKhP2a+f4FVrdGxi0o08esLwMeL7T/bZYNAU0xNNoKbU5gtj3N6pNTGGjuYn
         t/PWA95jx+00uA8D01MlRHutxMN68CqXj/zSf0A/s9QRYyPI9zn0eGzunN7116UIP7X9
         WuIbacNC07kkjJxKl5gEYyBXB0QA0puFvkZ7AUuouOylKk7Xj5XUU/45hR4Yje1GiUWD
         iw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4b3DICOpYGt0t2pRIBY3meTjj8iWdWQuqZZbZkb3EME=;
        b=MOsyRw7btEqmQGYZUd1jlN5ssIyMmy5lFT+fy/aQwFVgvvuAMngeFBceuDVBHCmBjl
         0cAt8PHECI8EW+YTALNN36SxYHcinWCB3xs+2zb0x1bYAjGe5aIPMmz9k34D5aWF2i6e
         XqpGMirIxzQiZ6cJf18d8IXE5hztyIt88REoLddZblP+mDNH9A+zooDqSa0uxb3SQxNY
         Uqb5CzgakowK9xzeP4zoy52pqlOGC7ceTRzMNGlIDn6pqdhMCJoy3RXB5hmDmA/4ZBkL
         WGmlzrBlx5Q4KDQUXmOmKbtbPQF8bNgriNr8VluO/80fSYk7w1/TWYmw4P8dAma1ZI8Y
         zIzw==
X-Gm-Message-State: AOAM532wpAHMclgnF9X69o0K4P5/hvy1A0fJac7OAHKZsQKGk1p0LcsF
        b02PWiIb18FBmgX/bkwRfxiygn6AbZE=
X-Google-Smtp-Source: ABdhPJzla0T6UDQB/v5pFw6ULW8O5Ujd19pAHyDw9rcE45hdmfCfy4bN19tValAyehND3v5dPNbDpg==
X-Received: by 2002:a9d:6185:: with SMTP id g5mr11688739otk.109.1625501324521;
        Mon, 05 Jul 2021 09:08:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a44sm2286948ooj.12.2021.07.05.09.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jul 2021 09:08:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] MIPS: ralink: of: fix build of rt2880_wdt watchdog module
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, John Crispin <john@phrozen.org>
Cc:     Lee Jones <lee.jones@linaro.org>, kernel test robot <lkp@intel.com>
References: <20210514131750.52867-1-krzysztof.kozlowski@canonical.com>
 <2b427eca-fd6c-d099-337f-39cfbd85cb46@roeck-us.net>
 <a15e7f62-12a0-1ec7-5104-f01f9e3eccc7@canonical.com>
 <9d98ec40-757d-28c7-1669-a683b2cd3881@canonical.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <b87bbb80-ed02-447d-f778-7997848731cd@roeck-us.net>
Date:   Mon, 5 Jul 2021 09:08:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9d98ec40-757d-28c7-1669-a683b2cd3881@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 7/5/21 8:15 AM, Krzysztof Kozlowski wrote:
> On 14/05/2021 16:04, Krzysztof Kozlowski wrote:
>> On 14/05/2021 09:48, Guenter Roeck wrote:
>>> On 5/14/21 6:17 AM, Krzysztof Kozlowski wrote:
>>>> When rt2880_wdt watchdog driver is built as a module, the
>>>> rt_sysc_membase needs to be exported (it is being used via inlined
>>>> rt_sysc_r32):
>>>>
>>>>     ERROR: modpost: "rt_sysc_membase" [drivers/watchdog/rt2880_wdt.ko] undefined!
>>>>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>>
>>> Acked-by: Guenter Roeck <linux@roeck-us.net>
>>>
>>> I don't see a recent change in the code. Has that problem been there
>>> all along ?
>>
>> I think the problem was there always but 0-day builder did not hit it
>> until recently:
>> https://lore.kernel.org/lkml/202105082122.yrF7ploN-lkp@intel.com/
> 
> Hi Guenter,
> 
> It seems that patch was not applied. Anything to fix here?
> 
I see commit fef532ea0cd8 ("MIPS: ralink: export rt_sysc_membase for
rt2880_wdt.c"). Does that not solve the problem ?

Guenter
