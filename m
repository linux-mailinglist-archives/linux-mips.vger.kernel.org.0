Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2C6419F22
	for <lists+linux-mips@lfdr.de>; Mon, 27 Sep 2021 21:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236507AbhI0TaM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 15:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236395AbhI0TaL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Sep 2021 15:30:11 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 608FDC061575;
        Mon, 27 Sep 2021 12:28:33 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id e7so18766553pgk.2;
        Mon, 27 Sep 2021 12:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2WCKCLD+E5NvjwkI1u2gwUcULJ5IK33etMXEH83ht1c=;
        b=EqOtwktlrfN3eZZvPKgxXOPPzDxsmsr+bDjRtJM2yKY/3NTX3Sa1zXfDjIvxOR/I6p
         ppXyvZRiW+oEoZnh9ChmgXvnpv7Ik4nledII/MZrF7ADVZoxw5iSunhiyuEsGRwIrOxH
         0gyD+ElMPVTeQDbq8gM/ILf7h7HkiSbGSo1blKMJjaOSexhE8W3Ukpc7Imen3gUxXpzk
         ccpSDK/N29n/o5mWwJP8DSh49R7skNijw5/i5gP5TAqc5tCwAzmJJ9uNQkI1j/e97m04
         7P2CfuL5eeoskQEPfu2hFvxTwytoSPh6ntlX2yQZ74+gcAE3wVpypXPdLU436S6EFmPS
         wQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2WCKCLD+E5NvjwkI1u2gwUcULJ5IK33etMXEH83ht1c=;
        b=oVrqhduw/wuwgLsbmt1C7/ZuCqPI6zUkqZA0dgKJ4IB9hZczaMY//4aenwOr1u8J+O
         XMyBXdN2DMBxgkME0FhhKByK262dIlSuxa80zM9Qb3mZrSEWlXlmreSgo5v+q1A/v2wh
         JBiR7ZFb0EcTTICEmXXSmu7ESR+6q9fRzCwq3//IRgd0TqajpDwf8HYzfwWAnmAxRbgG
         iVCd3noRoWVkhB4XPOQLBMA27nc4jAVSv+NcHnEFkZTuYfUAgMh1zwAwylJLuyf+tJKA
         IUbTIKDFDyEMleyzayn8h35aKWqVy0YUsnRu4QfVfJ4mAOJkHYGNlM32IAh1Vgj7uGsC
         aGtg==
X-Gm-Message-State: AOAM530PTYNUqNb28h9LeaZUBu+IqwqfLpTpgx3/775ggkYfiGNUGdg3
        rWxDtZKbFCEJ0SEs6wZ/kRyQg1bZxOo=
X-Google-Smtp-Source: ABdhPJx7n5NObtDqqeAkG+dNbgTc9x39cUdTZLNBM5JfGj3BdU/peQHScO1hrv7OXAQ2BrLp5L257A==
X-Received: by 2002:a62:60c2:0:b0:446:b494:39cc with SMTP id u185-20020a6260c2000000b00446b49439ccmr1705100pfb.22.1632770912456;
        Mon, 27 Sep 2021 12:28:32 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id k14sm19253598pga.65.2021.09.27.12.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 12:28:31 -0700 (PDT)
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
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <b9bf844c-b6c0-9277-07e0-7592527ce4e4@gmail.com>
Date:   Mon, 27 Sep 2021 12:28:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLSiCb7-tHW3VTOTdMt=qahAij77zF2us-CZqXYAi0jmg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 9/27/21 12:08 PM, Rob Herring wrote:
> On Fri, Sep 24, 2021 at 12:07 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>>
>> In order to build drivers/irqchip/irq-bcm7120-l2.c as a module, we will
>> need to have of_irq_count() exported to modules.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>  drivers/of/irq.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
>> index 352e14b007e7..949b9d1f8729 100644
>> --- a/drivers/of/irq.c
>> +++ b/drivers/of/irq.c
>> @@ -440,6 +440,7 @@ int of_irq_count(struct device_node *dev)
>>
>>         return nr;
>>  }
>> +EXPORT_SYMBOL_GPL(of_irq_count);
> 
> Please convert to use platform_irq_count() instead.

That requires a platform_device to be passed to platform_irq_count(),
will that work even when the drivers remain built into the kernel and
get initialized early on?
-- 
Florian
