Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86820419F52
	for <lists+linux-mips@lfdr.de>; Mon, 27 Sep 2021 21:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236491AbhI0Tpa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 15:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhI0Tp3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Sep 2021 15:45:29 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4270BC061575;
        Mon, 27 Sep 2021 12:43:51 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id on12-20020a17090b1d0c00b001997c60aa29so556450pjb.1;
        Mon, 27 Sep 2021 12:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0x+V42D6Bf0K2yZWxaHhVhsrmnmQNu3p4zZUp5NMctA=;
        b=PibCyo86mHii5K/AK9XV+KKAKC0dBj6/pduQ5cDs16CJnwJDoLbOjU6nqHzb+b5Elu
         tPjP1pLV+3t6rGLaF+JoXoIrDNw1HCo3U3LJn6F2G2hHbTIJEunAImPvHic8uVT+mIqi
         M9lbj69AEKQbP4fzAtg6pKE1jeEJLJG4zxpC3BaIHBpeKHaJlbHaHQThE30gWFDPSGW5
         3SGEXQMbTLjnoy/PAnG+jiuM1L6ukTH8eXyA0LtilgHQUFULKCAesrW3hb+/+0zczPCW
         elFZoEHegN6ZbVzMZTpSj12JLZlonuf2WHzhW2yB4e5ospKCU6rA68ryzxXp4QlIFRRo
         wETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0x+V42D6Bf0K2yZWxaHhVhsrmnmQNu3p4zZUp5NMctA=;
        b=J3p/w7H+OsVh1nVrhtTGrnO2EhQhXBgMmL6LsIym0JkpV9eeLcAUocYmAvIB+CTl+y
         XY6WXRZbfM7d5KaasJy0nPPRzqBG7YaSwuVphOH0wTlFWM+ygWGfIq0J9cQ0VuJxS3SW
         x84nxQW0CIydHhd8CcT0t2HBfRzihKDqSM4fs9nfPrVmVv6+hqpZLGdcQV6Ky3/OjFwm
         zzOvMqsV+kL2grqHcFF2DJ9gpnwy/87+1d7EM0igLzS9Rljae95PMnZDZOHB/Gz9XlD2
         FOkS4o+ig/iBQEmyNAFQNTLuwW8Z+BV2qxS508jbszFufxd+ReacsX8NOLY6AqlhkIg8
         kytQ==
X-Gm-Message-State: AOAM531GwyBchY3wFuk2ZW4rh0eqh3dnjpbxYn09p/V5NY/9EG0qgRFc
        SmeA+Wug6iQ68cCTZ53lMrKBxHI+bNI=
X-Google-Smtp-Source: ABdhPJxCD6ZuM4lslZgbWpZTP5mGztKXzC5w2f+4Nr7znYRkPYcaszyFAQD/qGur8+La8Z//mJilUA==
X-Received: by 2002:a17:90a:190:: with SMTP id 16mr926669pjc.152.1632771830388;
        Mon, 27 Sep 2021 12:43:50 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id p48sm17918097pfw.160.2021.09.27.12.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 12:43:49 -0700 (PDT)
Subject: Re: [PATCH 01/11] arch: Export cpu_logical_map to modules
To:     Rob Herring <robh+dt@kernel.org>
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
 <20210924170546.805663-2-f.fainelli@gmail.com>
 <CAL_JsqLp0o9CpG=ej3HsnDO-bG02CF4a55sYTOvxMR3rMyboqg@mail.gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <69444f17-91a7-69cc-14f8-7501443064ec@gmail.com>
Date:   Mon, 27 Sep 2021 12:43:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLp0o9CpG=ej3HsnDO-bG02CF4a55sYTOvxMR3rMyboqg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 9/27/21 12:32 PM, Rob Herring wrote:
> On Fri, Sep 24, 2021 at 12:06 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>>
>> In order to allow drivers/irqchip/irq-bcm7038-l1.c to be built as a
>> module and usable in GKI, export cpu_logical_map or __cpu_logical_map
>> towards the modules.
> 
> This is the usage:
> 
> #ifdef CONFIG_SMP
>         cpu = intc->cpus[cpu_logical_map(smp_processor_id())];
> #else
>         cpu = intc->cpus[0];
> #endif
> 
> This is totally broken! cpu_logical_map() takes the logical cpu
> number, 0-N, and returns the MPIDR which you then use as an array
> index.

There is no MPIDR on MIPS, which is where this code is being primarily
used as-is. On ARM/ARM64 the driver is used as a second level interrupt
controller with only a single "bank" of registers as opposed to one
per-CPU, meaning that we would always use intc->cpus[0] because you
cannot change the interrupt affinity of a second level interrupt
controller AFAICT. Maybe the above deserves to be made CONFIG_SMP &&
CONFIG_MIPS somehow.
-- 
Florian
