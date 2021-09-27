Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB27419D80
	for <lists+linux-mips@lfdr.de>; Mon, 27 Sep 2021 19:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236652AbhI0Rwq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 13:52:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235942AbhI0Rwm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Sep 2021 13:52:42 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E28E6C04A51B;
        Mon, 27 Sep 2021 10:47:44 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id k17so16551133pff.8;
        Mon, 27 Sep 2021 10:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8NnQ5fmWzacvL/zZWYUqL5exH3PdWXZxAmvcOks4ZZ0=;
        b=hErXiCdFXSRg55VkQzl8DdYXIayMwIIVu0wTRRX/Kt23Qhnty+3vqEYNbPaMUb5xSC
         7DLTQKmaLgdQzjnx0TRsmEa1sajeeioSWa8x+FTHFJODLgokaw1GzGCaNyOINGdB8jva
         VcnU+DGzpHQ2JSvt0opousmy7ZsLh8medetpefxUnstT7Nf+w+uoRztFeppQRfp+zgdj
         KEnw/cF5IWfZXFMuvc1fHzNhShw6XDUim4S5ZUoHLzAe/PrgygEqna1+fa5k7z6eKX3v
         5mNMyfLIejlPRn+ArOOZQrJIJMQvhqO1VuZ/0TzTXASv9W3xmaxYwizv9EWBPw7x/WkV
         mvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8NnQ5fmWzacvL/zZWYUqL5exH3PdWXZxAmvcOks4ZZ0=;
        b=QpLBpXkEKk013Ttdc6W6uilpQ8zXiGflHUThB22HsJp9IxDelTuqog4s2YzEzYnHww
         zLBn5fAsKL/2ggQJ7dulrBw0hi55sgAQI6cI2cMm6iO1y+/EFjxxtZo4v98LemmVYXmf
         n9Kx7zWlQyBN+wIVfa5W/Eg/xOCtkcwu2e2+1C4MXhPDP4vt1Oh35rlCVb6gMgEu43T/
         Ui4mZCQ/+NVgtTe82G3jX3Zq5l0z2JCoxGbRCV9lWNh6DfRdiUdLJvfgaAkddHHGsB1s
         /Jl1NRfWmYdxkK/fbGksF9u8nIe2dD6N6/0IB75SvMwzvqJnZ8w3jmiYhMAibOJ76+jj
         ak9Q==
X-Gm-Message-State: AOAM533sqqngtF1wNzIVUCIBHS0O+RHDiD41Upr9UnU/TEMgyzIIUIY4
        CweQ1t+aYgnqwIQMaXPPAwCSdrsI8ls=
X-Google-Smtp-Source: ABdhPJz6fQPeWc9WXUQdnYTpow2eEkTApy2aGh2NvBRs584NTZXIEGfWblRKxvlpFw37gjuICeiq6g==
X-Received: by 2002:a63:235f:: with SMTP id u31mr793854pgm.248.1632764863953;
        Mon, 27 Sep 2021 10:47:43 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id u12sm505547pjr.2.2021.09.27.10.47.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 10:47:43 -0700 (PDT)
Subject: Re: [PATCH 03/11] genirq: Export irq_set_affinity_locked()
To:     Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Rob Herring <robh+dt@kernel.org>,
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
 <20210924170546.805663-4-f.fainelli@gmail.com> <87tui8ub87.wl-maz@kernel.org>
 <87tui8cpwd.ffs@tglx> <87r1dccp5z.ffs@tglx>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <3e73c85e-20d1-43ae-3c3a-04322ffa970e@gmail.com>
Date:   Mon, 27 Sep 2021 10:47:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87r1dccp5z.ffs@tglx>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 9/25/21 2:37 PM, Thomas Gleixner wrote:
> On Sat, Sep 25 2021 at 23:21, Thomas Gleixner wrote:
> 
>> On Sat, Sep 25 2021 at 12:48, Marc Zyngier wrote:
>>> On Fri, 24 Sep 2021 18:05:38 +0100, Florian Fainelli <f.fainelli@gmail.com> wrote:
>>>>  }
>>>> +EXPORT_SYMBOL_GPL(irq_set_affinity_locked);
>>>
>>> This doesn't seem right.
>>>
>>> This driver seem to try and move interrupts on its own when the CPU
>>> goes down. Why can't it rely on the normal CPU hotplug infrastructure
>>> to do so like all the other drivers (bar some Cavium driver that does
>>> the same thing)?
>>>
>>> I'd rather you take this opportunity to move these drivers into the
>>> 21st century, so that we can kill irq_cpu_offline() and co altogether.
>>
>> I wanted to kill these callbacks years ago. Cavium has two variants of
>> those offline/online callbacks:
>>
>>  1) octeon_irq_cpu_offline_ciu() which is doing the same as that BCM
>>     driver. These really can go away. Just remove the callback and
>>     everything just works.
> 
> For BCM this works today when that chip is used on ARM[64] simply
> because the only architecture which invokes irq_cpu_offline() is MIPS.

That is correct. How would you recommend addressing that? In premise
when this driver is used on ARM[64] it is used as a second level
interrupt controller hanging off the ARM GIC (or another ARM CPU
interrupt controller), so in that case I suppose I could make the
irq_set_cpu_offline be dependent upon CONFIG_SMP and CONFIG_MIPS, would
that be acceptable?
-- 
Florian
