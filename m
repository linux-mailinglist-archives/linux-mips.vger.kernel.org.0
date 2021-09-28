Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E557841B3EA
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 18:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231284AbhI1QcP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 12:32:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbhI1QcP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Sep 2021 12:32:15 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94A55C06161C;
        Tue, 28 Sep 2021 09:30:35 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id k23-20020a17090a591700b001976d2db364so3262823pji.2;
        Tue, 28 Sep 2021 09:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pf7A/zPJOzJAdofq5BEHkXRKW+JfDq2B/Lw5Xi7ZWR8=;
        b=I4n1mLS6yyfK2Pml5cOKdjeIkbSwIYZLV1kxNVZE/n460OJwUf+RbDmq6TgahzaoBI
         q6zhekv/AaAaRbObftJBKV3n2MSjsX+Hr7FRxK3nLLv8jivdiDRc4zBjjaAsbOEosNll
         Hw/imLKtAgakirL7A+XpUhqV5ijyJ+6EP9pc/OWqLDyRhE6KujUutSg0vADaC19ieR5g
         ML4Pli5vowDdD8C58JRCEJ5iPysIT+JjLcrt4l1U743c3uviaV8Z778KCX2wApagZF9Q
         AscWkFUer3XyzPPXXU1b+59jGjY4TtKQ2mJC15gVlHgC+idM5W7bi/xe44MQaTCgLPS+
         5Ulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pf7A/zPJOzJAdofq5BEHkXRKW+JfDq2B/Lw5Xi7ZWR8=;
        b=cauHUuBBVQJF6NJYIVC3QLbMVBwAOQLTB+aqV64d9GuUmj1K89rYGwmgldLxBfyJb1
         JJWOE53RRDWFA6cXGadPIyr7WLie2FfA1SQIlDrsDgbTmFlaNNDbG02z9aWhSeUBYtWU
         cfYSzbZAnXumHYXTBH+2Jxi0w1S/BzfzNpfwymEa0D0bVlUYtxOoUf8iojzHw/SeAdp1
         6+mrufJyJR3m3TICJc94aEWXz28A6y6THNBnjXTdmQwhRxN+BViprGZS5u4D3X/EX1+T
         9E/ykAAgYZQ3AllwYZBOWUXAnGT+mfxkpfFo+i39aIQLswDr4XmOvRnTK5RnL9qX4RZ1
         tDvw==
X-Gm-Message-State: AOAM531C4Bs10QcGhYSzkekMoiaaimsAD4NRKEg8HOnmnMg+0/7a81+N
        wOu4KrINRmP/MdqD/bUlv3xgczcTf3g=
X-Google-Smtp-Source: ABdhPJxraXf/1lgwJVd1Vhv/3FcnTg8Dk/MhQmlABdVIrIJz8K/OqIBjWXnSd9qBc+GMVUwcBHmbtA==
X-Received: by 2002:a17:90a:a585:: with SMTP id b5mr899537pjq.201.1632846634657;
        Tue, 28 Sep 2021 09:30:34 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id e6sm2479799pgp.85.2021.09.28.09.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Sep 2021 09:30:34 -0700 (PDT)
Subject: Re: [PATCH v2 01/12] arch: Export cpu_logical_map to modules
To:     Christoph Hellwig <hch@infradead.org>,
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
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
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
References: <20210928022715.369160-1-f.fainelli@gmail.com>
 <20210928022715.369160-2-f.fainelli@gmail.com>
 <YVKjYxf5bzJzWJDb@infradead.org>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <d585d000-17c2-8641-2a6c-664dbea69ce9@gmail.com>
Date:   Tue, 28 Sep 2021 09:30:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVKjYxf5bzJzWJDb@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 9/27/21 10:08 PM, Christoph Hellwig wrote:
> On Mon, Sep 27, 2021 at 07:27:04PM -0700, Florian Fainelli wrote:
>> In order to allow drivers/irqchip/irq-bcm7038-l1.c to be built as a
>> module and usable in GKI, export cpu_logical_map or __cpu_logical_map
>> towards the modules. This follows what MIPS has been doing since
>> 2dc2ae344e0e ("MIPS: Export __cpu_number_map and __cpu_logical_map.")
> 
> This seems like a pretty bad idea.  For one you should export an
> accessor instead of the data structure.  And this probably should be an
> EXPORT_SYMBOL_GPL.

In hindsight, we should not need that change, and the use of
cpu_logical_map[] within drivers/irqchip/irq-bcm7038-l1.c should be
restricted to a MIPS build where the driver is a level 1 interrupt
controller and there are multiple per-cpu register copies.

In an ARM/ARM64 configuration that driver is always used as a second
level interrupt controller whereby it is hanging off the ARM GIC
interrupt controller, and the intc->cpus[] array will only be 1 element.
Fortunately since you cannot re-parent a L2 interrupt controller's
interrupt handler to a different CPU, "it just happens to work".

Thanks!
-- 
Florian
