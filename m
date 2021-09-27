Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 198ED419E03
	for <lists+linux-mips@lfdr.de>; Mon, 27 Sep 2021 20:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235983AbhI0SUR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 14:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235845AbhI0SUQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Sep 2021 14:20:16 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDAFAC061575;
        Mon, 27 Sep 2021 11:18:38 -0700 (PDT)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1632766716;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CMYV0yIsOtj4fMiy4VosAZYi9HZ7pXiZjifQ1Yu1Prk=;
        b=ruqru5DUfPQHCSSvmad3d6lsxiYORgcdFhRNGeVySerSuSO4vPUfVqZZ9LNL9KTKc4WzSY
        Upn7RMdIQru3XEFn1x69F/m5vSI9//LqPDIb0ADmh/mTXU79wCoDLUn8c9kf6URJF2NZvf
        lG2tbOeoDR/nLOjZkL0BYtVSVcVLvLZPjPqQpiM4dFUrBI6JidzO62YWMo9nDjsGAH2I3t
        NgMNInQJxge86aMYhPjKeWyOiW/92GLX7NZ1wxt6O74D3QUQhbrE9Inh9c+tez56coSw3G
        hFFjZctcl9ZbjYNvxpForZ/nyTKrta4OcFK5TXsWRa2Pk2ib3a22dcuJSv15aA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1632766716;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CMYV0yIsOtj4fMiy4VosAZYi9HZ7pXiZjifQ1Yu1Prk=;
        b=ntC20B/zQ9HRCnABj2abMrdgxN94DOPuojjgK2tBuRN2V6DiKd6tkfoF9J8qhxFm4icjlB
        i+j+Y7afwFDIweDQ==
To:     Florian Fainelli <f.fainelli@gmail.com>,
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
Subject: Re: [PATCH 03/11] genirq: Export irq_set_affinity_locked()
In-Reply-To: <3e73c85e-20d1-43ae-3c3a-04322ffa970e@gmail.com>
References: <20210924170546.805663-1-f.fainelli@gmail.com>
 <20210924170546.805663-4-f.fainelli@gmail.com>
 <87tui8ub87.wl-maz@kernel.org> <87tui8cpwd.ffs@tglx> <87r1dccp5z.ffs@tglx>
 <3e73c85e-20d1-43ae-3c3a-04322ffa970e@gmail.com>
Date:   Mon, 27 Sep 2021 20:18:36 +0200
Message-ID: <87tui5c26b.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Sep 27 2021 at 10:47, Florian Fainelli wrote:
> On 9/25/21 2:37 PM, Thomas Gleixner wrote:
>>> I wanted to kill these callbacks years ago. Cavium has two variants of
>>> those offline/online callbacks:
>>>
>>>  1) octeon_irq_cpu_offline_ciu() which is doing the same as that BCM
>>>     driver. These really can go away. Just remove the callback and
>>>     everything just works.
>> 
>> For BCM this works today when that chip is used on ARM[64] simply
>> because the only architecture which invokes irq_cpu_offline() is MIPS.
>
> That is correct. How would you recommend addressing that? In premise
> when this driver is used on ARM[64] it is used as a second level
> interrupt controller hanging off the ARM GIC (or another ARM CPU
> interrupt controller), so in that case I suppose I could make the
> irq_set_cpu_offline be dependent upon CONFIG_SMP and CONFIG_MIPS, would
> that be acceptable?

Why? Just get rid of the callback in that driver and ensure that
irq_migrate_all_off_this_cpu() is invoked when the CPU dies.

arch/mips/kernel/smp-cps.c already does that, but I don't know whether
your MIPS platform uses those SMP ops. If not you surely have a template
there.

Thanks,

        tglx


