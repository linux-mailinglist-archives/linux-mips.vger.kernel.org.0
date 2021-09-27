Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86976419E33
	for <lists+linux-mips@lfdr.de>; Mon, 27 Sep 2021 20:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236188AbhI0S1m (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 14:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236011AbhI0S1l (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Sep 2021 14:27:41 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81B18C061575;
        Mon, 27 Sep 2021 11:26:03 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id k24so18598431pgh.8;
        Mon, 27 Sep 2021 11:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Bf4xnM2QqgUxuhdJ2I+dKbta+av8Oq2vvSk2x8cDYEI=;
        b=Dm69+hqvEfmCFGZUnPqwLYGGIRXKkfBI68DHQFLyc5uIgGekdLt9/2tcBJXsjb5S9X
         cLJgqDkPPbtZgztN6t/SvVU/MofuRTTSEcvOqh1cKFoNQlGMsJB/llg7tquD+J3yh9DE
         SZE2N/QKMXvIoxqHUSIP9MumTRMouu3lve1Q23qHv2CS4syoRFyCTlnekbiIG8EdqbYm
         IcpXZUJfv17K+wXD2fQSM4pnuQImOobuOIcntWBEULuFdoiZagEBqzKlfrdgcRcoQ7lp
         mGQPdKjm5aS/39m0Qksw49xSslZIYRcLlTlvA7oLr3YwvAyKDKOnLQ63So+kGFii7n1H
         Q/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Bf4xnM2QqgUxuhdJ2I+dKbta+av8Oq2vvSk2x8cDYEI=;
        b=eHPgLdXDeLEeTl0sHlsqJWS/hcJtk4ZbwC8IIapfydZvqUTjvzBuj8DaOxz0Mxmc2W
         bhi5W1xqsQKCX5kyrY3wEBJFoziubpsZepOMJKu/atzK+eGaHsi4KPpIKAI2Xjn+bzge
         hcGZfFRx6mEIcWO+TXenjEWRzk4loDYp7799xjo9Z20Yc6lopijWMnBdMNlfMBIe7aCq
         tLM6NbNIFrsuSB/QcFfwi9+TVZylQv9QbeUwRGtrm5a/H9YWMl7QVEG6ooYRQrK4J7Kq
         84OIIoBvdZsupIXp4309CAd0eOGi07j5vzIibp0NKIEhca8iZpERBmHtNEYyV1eemMNG
         gNjQ==
X-Gm-Message-State: AOAM532GS4cQQkkrm124iBLi78xOYhtcDUApXufRlMCpX1CcytnSuWh1
        hOOFJBgTfxw90D3wsCko7u+LQoMX+RM=
X-Google-Smtp-Source: ABdhPJy4JNQdxtxWBqpUhRjVFIqwwaqFn55WhunZCwCE7x+aKMn9ygX0ZoEpIy2IJ6cu40CgmBM31g==
X-Received: by 2002:a63:b04c:: with SMTP id z12mr875400pgo.371.1632767162606;
        Mon, 27 Sep 2021 11:26:02 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id z65sm16337907pfc.30.2021.09.27.11.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 11:26:02 -0700 (PDT)
Subject: Re: [PATCH 03/11] genirq: Export irq_set_affinity_locked()
To:     Thomas Gleixner <tglx@linutronix.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Marc Zyngier <maz@kernel.org>
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
 <3e73c85e-20d1-43ae-3c3a-04322ffa970e@gmail.com> <87tui5c26b.ffs@tglx>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <c0a0acc3-355a-baa2-7e51-0d120400ae72@gmail.com>
Date:   Mon, 27 Sep 2021 11:25:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87tui5c26b.ffs@tglx>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 9/27/21 11:18 AM, Thomas Gleixner wrote:
> On Mon, Sep 27 2021 at 10:47, Florian Fainelli wrote:
>> On 9/25/21 2:37 PM, Thomas Gleixner wrote:
>>>> I wanted to kill these callbacks years ago. Cavium has two variants of
>>>> those offline/online callbacks:
>>>>
>>>>  1) octeon_irq_cpu_offline_ciu() which is doing the same as that BCM
>>>>     driver. These really can go away. Just remove the callback and
>>>>     everything just works.
>>>
>>> For BCM this works today when that chip is used on ARM[64] simply
>>> because the only architecture which invokes irq_cpu_offline() is MIPS.
>>
>> That is correct. How would you recommend addressing that? In premise
>> when this driver is used on ARM[64] it is used as a second level
>> interrupt controller hanging off the ARM GIC (or another ARM CPU
>> interrupt controller), so in that case I suppose I could make the
>> irq_set_cpu_offline be dependent upon CONFIG_SMP and CONFIG_MIPS, would
>> that be acceptable?
> 
> Why? Just get rid of the callback in that driver and ensure that
> irq_migrate_all_off_this_cpu() is invoked when the CPU dies.
> 
> arch/mips/kernel/smp-cps.c already does that, but I don't know whether
> your MIPS platform uses those SMP ops. If not you surely have a template
> there.

We use arch/mips/kernel/smp-bmips.c but I do see the path forward, thanks!
-- 
-- 
Florian
