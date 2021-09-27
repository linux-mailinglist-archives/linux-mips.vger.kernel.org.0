Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C722419F30
	for <lists+linux-mips@lfdr.de>; Mon, 27 Sep 2021 21:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236362AbhI0TeA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 15:34:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:43676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229503AbhI0Td7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 27 Sep 2021 15:33:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 52F2560FED;
        Mon, 27 Sep 2021 19:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632771141;
        bh=jIkeeH/D0+ndj+aMT/vg1wyVHZaKFaSNfGF3n68P8fw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ODcAKe5KZbR/hPTYuDzzxaIAtPbeWJga+8Ry+Ts/A7c5/K7Qpr8U3exQN+Ce+PMJI
         xPjmWmcbJOfcPCNv3xsX+Kietfb1TObXIV5VP+ncVUt/nqadBvOIVMajPG0HnjxhOD
         hUml3NfCSeSF2wxmAJ82q0BSA8/I/RCyNorbTSGft34gm1jopah/cjG1lup3LsreO9
         CNLX5lzySc65o9jKMt+M6FoBvnuP16rOMA1ptwVCA/gD67Ypm91BIoijxNWmF1GFYx
         z0qDEGcOpaIDAgHaF3GQBojAehxvMX2Z0M2uYMTmxVOmnie+y8MHOv1LQ5DvhLUjIl
         iBJOR5BNxYTFA==
Received: by mail-ed1-f50.google.com with SMTP id l8so26007780edw.2;
        Mon, 27 Sep 2021 12:32:21 -0700 (PDT)
X-Gm-Message-State: AOAM531sdJX2+uY5xYCyYXT681O7dLXW/7QhLAijKZEIUKLsyobdN+3z
        imRq1HRGOdrfRxGin0KbWCD1imxxWCckNLvYVg==
X-Google-Smtp-Source: ABdhPJy6Z59t66ELIvnrIT/bFIr4I3crn2zTrXliPgOM8IX1ESIPu3+rZon0Po+vg9STlpSYfOdW2P2RVnlLZHDV2uc=
X-Received: by 2002:a17:906:7145:: with SMTP id z5mr1942466ejj.363.1632771139871;
 Mon, 27 Sep 2021 12:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210924170546.805663-1-f.fainelli@gmail.com> <20210924170546.805663-2-f.fainelli@gmail.com>
In-Reply-To: <20210924170546.805663-2-f.fainelli@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 27 Sep 2021 14:32:08 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLp0o9CpG=ej3HsnDO-bG02CF4a55sYTOvxMR3rMyboqg@mail.gmail.com>
Message-ID: <CAL_JsqLp0o9CpG=ej3HsnDO-bG02CF4a55sYTOvxMR3rMyboqg@mail.gmail.com>
Subject: Re: [PATCH 01/11] arch: Export cpu_logical_map to modules
To:     Florian Fainelli <f.fainelli@gmail.com>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Sep 24, 2021 at 12:06 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> In order to allow drivers/irqchip/irq-bcm7038-l1.c to be built as a
> module and usable in GKI, export cpu_logical_map or __cpu_logical_map
> towards the modules.

This is the usage:

#ifdef CONFIG_SMP
        cpu = intc->cpus[cpu_logical_map(smp_processor_id())];
#else
        cpu = intc->cpus[0];
#endif

This is totally broken! cpu_logical_map() takes the logical cpu
number, 0-N, and returns the MPIDR which you then use as an array
index.

Rob
