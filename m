Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E448C41848C
	for <lists+linux-mips@lfdr.de>; Sat, 25 Sep 2021 23:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbhIYVBl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 Sep 2021 17:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbhIYVBk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 25 Sep 2021 17:01:40 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 987BAC061570;
        Sat, 25 Sep 2021 14:00:05 -0700 (PDT)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1632603603;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=OqJbVc4PIkymdexYtCAgR5HPDd/Rii+ka465iyNfbT8=;
        b=17gAUXwaAhZ2CO+nNGbNkCTPFMKm+VW1yCZuwdbvIQ2oukZjdFGnJwRYdxyYHh2YPixMzo
        SAwQlb94yQKH+ydYtnfFtXHi1sf6FFgtr/Lx62zBgE3R3hj9agl8rmBpM7lmdLZ/BxuCvi
        sE5Aht6E3ZS/pFaVVnWAbsH9thQxn1bZ0YYWF0D3zDUSDpdrvZncWPK8cr1nc9SuHz2Cg1
        ToQQuEz7eA2JgkMb8DD6jubGmUN7zea4a7gs5lLHGGW2qdsXls6ySJAh3GohuyG6yqEb8m
        /3AMGdvdU6ckvZOOdOQdEaAUQFDLXY9x0ewhndhQbLOqlvM+I5YjLR47igA+EQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1632603603;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=OqJbVc4PIkymdexYtCAgR5HPDd/Rii+ka465iyNfbT8=;
        b=/0Gpe0hIKdMNR/SsUg0H+azUWSxbSDChe7GSX5Xpfgqab86WMqTQ0i0YSmYRl5ZpcgLVP1
        fNrzWdOWqpSyxIAg==
To:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, Marc Zyngier <maz@kernel.org>,
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
Subject: Re: [PATCH 02/11] genirq: Export irq_to_desc() again to modules
In-Reply-To: <20210924170546.805663-3-f.fainelli@gmail.com>
References: <20210924170546.805663-1-f.fainelli@gmail.com>
 <20210924170546.805663-3-f.fainelli@gmail.com>
Date:   Sat, 25 Sep 2021 23:00:02 +0200
Message-ID: <87wnn4cqwd.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Sep 24 2021 at 10:05, Florian Fainelli wrote:
> In order to build drivers/irqchip/irq-bcm7038-l1.c as a module (for use
> in GKI), we need to export_to_desc() which is used in this snippet of
> code:
>
> 	irqd_set_single_target(irq_desc_get_irq_data(irq_to_desc(virq)));
>
> This effectively reverts 64a1b95bb9fe ("genirq: Restrict export of
> irq_to_desc()").

No. I'm not reexporting this. We've spent quite some time to prevent all
kind of drivers for fiddle with irq descriptors and I'm not going
to reopen that can of worms.

irq_get_irq_data() is exported and provides you what you need.

Thanks,

        tglx
