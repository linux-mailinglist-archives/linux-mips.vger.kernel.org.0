Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3B2E41849D
	for <lists+linux-mips@lfdr.de>; Sat, 25 Sep 2021 23:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbhIYVXR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 Sep 2021 17:23:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbhIYVXQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 25 Sep 2021 17:23:16 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D02FAC061570;
        Sat, 25 Sep 2021 14:21:40 -0700 (PDT)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1632604899;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FC2izg75fJTteYJOOY6ytBStpF+HBmdWWfEDalx5dPI=;
        b=zi0D8Pec3oIRsFEDPhIwdmHOrVY6LP42R44wotvWquExDYl68XwyZjr8YKRT2C/lMZPmrk
        dt9/TA8UlxiMasgJo09ceeQc6M8OKaLT69Yl5M1z9CxhuciWbmtrBUnx6NOHkbazUKHCc3
        +gkKwZyU7rIhasYeVkYNIBtaUfPbJmoiDqLsNNdltKUYLBPvVBfyJbiVSJzvKcFpN2qE03
        os7AFbvHBI9QQmNvtBa9GZe15hLFyNhZXk/a0Xd13USTH4EJJ84GIfnbIdYLcRxqXTyh/z
        HWHV7t6KKonadUpLzOOGpIdMJeXFcH3va/P7p+EUkuXObHF4ho3/9JsnYhIVdw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1632604899;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FC2izg75fJTteYJOOY6ytBStpF+HBmdWWfEDalx5dPI=;
        b=Pu7/xNkZmyrhNRUMgJdHgur9uaDO525VlERAI3Og3nK8N5yts54/hzguhnV1QeJaTTGDRK
        8Z4O+ch55n12DLBg==
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
In-Reply-To: <87tui8ub87.wl-maz@kernel.org>
References: <20210924170546.805663-1-f.fainelli@gmail.com>
 <20210924170546.805663-4-f.fainelli@gmail.com>
 <87tui8ub87.wl-maz@kernel.org>
Date:   Sat, 25 Sep 2021 23:21:38 +0200
Message-ID: <87tui8cpwd.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Sep 25 2021 at 12:48, Marc Zyngier wrote:
> On Fri, 24 Sep 2021 18:05:38 +0100, Florian Fainelli <f.fainelli@gmail.com> wrote:
>>  }
>> +EXPORT_SYMBOL_GPL(irq_set_affinity_locked);
>
> This doesn't seem right.
>
> This driver seem to try and move interrupts on its own when the CPU
> goes down. Why can't it rely on the normal CPU hotplug infrastructure
> to do so like all the other drivers (bar some Cavium driver that does
> the same thing)?
>
> I'd rather you take this opportunity to move these drivers into the
> 21st century, so that we can kill irq_cpu_offline() and co altogether.

I wanted to kill these callbacks years ago. Cavium has two variants of
those offline/online callbacks:

 1) octeon_irq_cpu_offline_ciu() which is doing the same as that BCM
    driver. These really can go away. Just remove the callback and
    everything just works.

 2) Two other variants to fiddle with chip internals, but those chips do
    not have an irq_affinity() callback which makes it more interesting.

    I don't see a proper way to solve that except for removing Cavium
    alltogether, but once the BCM one is gone, we just can make this
    muck depend on CAVIUM and be done with it. And I mean depend and not
    select.

Thanks,

        tglx



    
