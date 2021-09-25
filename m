Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8114184B8
	for <lists+linux-mips@lfdr.de>; Sat, 25 Sep 2021 23:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbhIYVjG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 Sep 2021 17:39:06 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:48740 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbhIYVjF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 25 Sep 2021 17:39:05 -0400
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1632605848;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pomYC2RreN2r1Fegwh7zApoZcyGO3FxxTvC2W51quWw=;
        b=DV3X8cyqLm9feMouLl0hl6IXL/8C3xFxSGPet+ZFBU38HSPov+Iywyz/cTgS/XO1DB5s66
        dpJiqFpcarYXm2AVU6z3RgBBZzgcosZVJ7t/RKw7gW1FMmyj312Lph9JddFQzbLEFi9+F1
        tjeQrWz6ojlD9y8qixeDEltAt1xzqo5607B7TF3ESI3CZBBTL8YXaluZa5A8LoRwJdEBt9
        gJv4dcYlJ3HTre5F0I0R5p75HmVaJLOoV4mUlEQ29GQPAMfPAskw9Clxjj1Wcns5p+Bv+y
        daicTAdmA/8Fk7YFCKqijcpC3t+Q8yGLgmLqryXQclp2VwNxOXgyqSicVJv5zw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1632605848;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pomYC2RreN2r1Fegwh7zApoZcyGO3FxxTvC2W51quWw=;
        b=+dk6d0B8gKbC4x5WmHxGAcGDurd99AWeV90/l1woW0pVaoeX5FX8PN1zYithUUHRtWoBuD
        LWZjtgMGaLHXaIBg==
To:     Marc Zyngier <maz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>
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
Subject: Re: [PATCH 03/11] genirq: Export irq_set_affinity_locked()
In-Reply-To: <87tui8cpwd.ffs@tglx>
References: <20210924170546.805663-1-f.fainelli@gmail.com>
 <20210924170546.805663-4-f.fainelli@gmail.com>
 <87tui8ub87.wl-maz@kernel.org> <87tui8cpwd.ffs@tglx>
Date:   Sat, 25 Sep 2021 23:37:28 +0200
Message-ID: <87r1dccp5z.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Sep 25 2021 at 23:21, Thomas Gleixner wrote:

> On Sat, Sep 25 2021 at 12:48, Marc Zyngier wrote:
>> On Fri, 24 Sep 2021 18:05:38 +0100, Florian Fainelli <f.fainelli@gmail.com> wrote:
>>>  }
>>> +EXPORT_SYMBOL_GPL(irq_set_affinity_locked);
>>
>> This doesn't seem right.
>>
>> This driver seem to try and move interrupts on its own when the CPU
>> goes down. Why can't it rely on the normal CPU hotplug infrastructure
>> to do so like all the other drivers (bar some Cavium driver that does
>> the same thing)?
>>
>> I'd rather you take this opportunity to move these drivers into the
>> 21st century, so that we can kill irq_cpu_offline() and co altogether.
>
> I wanted to kill these callbacks years ago. Cavium has two variants of
> those offline/online callbacks:
>
>  1) octeon_irq_cpu_offline_ciu() which is doing the same as that BCM
>     driver. These really can go away. Just remove the callback and
>     everything just works.

For BCM this works today when that chip is used on ARM[64] simply
because the only architecture which invokes irq_cpu_offline() is MIPS.

Thanks,

        tglx
