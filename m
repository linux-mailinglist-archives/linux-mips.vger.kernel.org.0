Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48096419F6F
	for <lists+linux-mips@lfdr.de>; Mon, 27 Sep 2021 21:49:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236382AbhI0Tvf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 15:51:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235209AbhI0Tvd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Sep 2021 15:51:33 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CE2AC061575;
        Mon, 27 Sep 2021 12:49:55 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id k23so13253415pji.0;
        Mon, 27 Sep 2021 12:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5QSzm8utmTgnrRlFRq4Amj6RmlERizp4a7MuqMMUEss=;
        b=WLGGXOxdA4lWf0nCQqxxlhFu9itBPN1mM9F8gOE3H4uazgHy0IiPUEYVOCXwiPMMAC
         QNZPyUlMnh+lkxV/kQPkCQT0l5pzE2XyPdiHNWOGt3zDjwKEcRFede8oKVO4CDglxGIL
         pXuStMVzlrJP6nIoissW6XdGV6mDvM2g878a96Xta6fMi8xXMgGoL9B8qhtBEZmKZIda
         Mo9mLF7XU22ot59x6W/C7tUcXOY9Kw5lqvAMHU+86030uVFC+2WozKbr1yY8J/ggQUTB
         mr8NHiPsS2daFe5e6EMpI4wxsEawSSPFQllfUavEyARbrFSuX5v5SJHku5D5woaUA0CR
         564Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5QSzm8utmTgnrRlFRq4Amj6RmlERizp4a7MuqMMUEss=;
        b=gs/HEYQDK1NP6nIEJKsxIXT3tHv5eYo1RiHLw7lUw8gmpphDDTKyNqE5IQjo3RP2OP
         I8paNkSMpEqrwkHkOShy17P4xkZD5ep2uYKzo7cg5QAAROoq+f5Q+g2LFK0yewVqpX6S
         DtnlHUjBvcmJqmD2FzSyb5W+0WvURWFvlNevQD9J/0MZxg7dEx+6XjidihAz3XSCooWq
         3c5hbWyc5nqRzsIUY7H0H6yF8IhX4ygoKwRtBNSD1KCkVU2HWnEGw6uKhE/a9WE/uQxX
         gGxmcdg8e26B9loa+wXXhpZBAzw7eVKHqmChnDX3WskYT+VmVu3J6k80giZujNsduk8N
         TTAw==
X-Gm-Message-State: AOAM530VfripBNB4kpwE/kXfYjwWSUJ7WKEa29BvDhadQIKp7J0NLY+q
        yd9y6KmE2AUP58vrQ9WH882/n5TrVdU=
X-Google-Smtp-Source: ABdhPJwM0+P0GuD9fDjPpiJXXlQj4ejazYKLGuqaLQsLFCbmRRyPYDMEh2girVfPPPRJIZYaOR2UMQ==
X-Received: by 2002:a17:902:7e84:b0:13a:3396:1c04 with SMTP id z4-20020a1709027e8400b0013a33961c04mr1210771pla.84.1632772194407;
        Mon, 27 Sep 2021 12:49:54 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id q12sm20109950pgv.26.2021.09.27.12.49.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 12:49:53 -0700 (PDT)
Subject: Re: [PATCH 07/11] of/irq: Export of_irq_count to drivers
To:     Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
        "open list:SUPERH" <linux-sh@vger.kernel.org>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <linux-mips@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" 
        <devicetree@vger.kernel.org>
References: <20210924170546.805663-1-f.fainelli@gmail.com>
 <20210924170546.805663-8-f.fainelli@gmail.com>
 <CAL_JsqLSiCb7-tHW3VTOTdMt=qahAij77zF2us-CZqXYAi0jmg@mail.gmail.com>
 <b9bf844c-b6c0-9277-07e0-7592527ce4e4@gmail.com>
 <CAL_JsqLv+RrmtDPTuMxtjbqAbGvEeAY_oOE5GqrPdP9ZpNGzqw@mail.gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <ec13207a-08b4-cbc4-7f29-1ce25ce1ebd0@gmail.com>
Date:   Mon, 27 Sep 2021 12:49:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLv+RrmtDPTuMxtjbqAbGvEeAY_oOE5GqrPdP9ZpNGzqw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 9/27/21 12:43 PM, Rob Herring wrote:
> On Mon, Sep 27, 2021 at 2:28 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>>
>> On 9/27/21 12:08 PM, Rob Herring wrote:
>>> On Fri, Sep 24, 2021 at 12:07 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>>>>
>>>> In order to build drivers/irqchip/irq-bcm7120-l2.c as a module, we will
>>>> need to have of_irq_count() exported to modules.
>>>>
>>>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>>>> ---
>>>>  drivers/of/irq.c | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
>>>> index 352e14b007e7..949b9d1f8729 100644
>>>> --- a/drivers/of/irq.c
>>>> +++ b/drivers/of/irq.c
>>>> @@ -440,6 +440,7 @@ int of_irq_count(struct device_node *dev)
>>>>
>>>>         return nr;
>>>>  }
>>>> +EXPORT_SYMBOL_GPL(of_irq_count);
>>>
>>> Please convert to use platform_irq_count() instead.
>>
>> That requires a platform_device to be passed to platform_irq_count(),
>> will that work even when the drivers remain built into the kernel and
>> get initialized early on?
> 
> No, does your irqchip using this do both? Looks to me like it is
> always a platform_device.

On ARM/ARM64 not using GKI as well as MIPS, we would want the module to
be built into the kernel image, however when using GKI that driver would
become a module. How do you suggest reconciling both usages?
-- 
Florian
