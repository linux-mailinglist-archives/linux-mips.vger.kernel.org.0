Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7F03456D52
	for <lists+linux-mips@lfdr.de>; Fri, 19 Nov 2021 11:32:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234634AbhKSKdR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Nov 2021 05:33:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234698AbhKSKdQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 19 Nov 2021 05:33:16 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9AADC061574;
        Fri, 19 Nov 2021 02:30:14 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id nh10-20020a17090b364a00b001a69adad5ebso8458683pjb.2;
        Fri, 19 Nov 2021 02:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mI6KtEpWF619oecwW9ziIW9hw+HsMKzn28OULpWVurc=;
        b=KPFYp17Oy/uF3pbSIvlZbA7tgtmLiBC3HIruVIaKeBTx1ALHk1wBHI9RWH4Y/TRiM2
         hAq35CyJOhqjAvnIz+XnfBNiKxqvsUzF8MUMqrbb+qoLapa3GCOHgXxaI6x9Km0AlL0K
         2wG7B8CCYpBSr+ZNFswMkvUZagoAlzcdTSS//NHNiGf8CdixgEqb6uKPGS2QpTEgcUAp
         yArb+GP+Q+XhbKyaqKWupK7SJqNy6AAI7qZH/W5TKcSo7ZV4POw8PNPyAsvkQzKhD740
         EiMIWTjA0fXMyULJynwnTQN6Kgk/iWbRQ1iPpWyGjz39JFmP0lOhp61wqe2NJVi1cPEy
         0utQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mI6KtEpWF619oecwW9ziIW9hw+HsMKzn28OULpWVurc=;
        b=cwJLLMTNvO00pR8CmpzKLxJqptfILtE6FW5yGdDI0ZRZTJJenCalNdDJU5iby6fS2P
         8cbiiThNbuoAPpccyaMgu9A661i7Pk0J4auSTIZbYyH/D/Y8cD0J5sILDq+ZpeVkeCPf
         Tv6BjX84TrRErPblCgGAKs6y4SKRHT0pb1cfK5wjlzu7haBVUJaa4X/XNvA2dMQyYS85
         GESe94zF9ZltHuQOkq2aHro8mSTePyeaeJ2CQX9zeqGi9PGsrGSSqcPjBP3cmXJ06wjz
         ZtPAsi1JK0GVDUHh17YSpTKP1iS+Edhrg9Sjllw/0TuTRf15HNp+cIvD4GVRVedme74j
         x7tA==
X-Gm-Message-State: AOAM532UK6twORoNzF7EqMqkgQ99eW0G6y4MyRvi1i8JzOpPf0bcBSza
        +EWGuWxl9rhVjhYDyMMUcEU=
X-Google-Smtp-Source: ABdhPJwCL45zphX6sAUQpCTH2XR0MI6TO3LxQucz8xUZnsL94laUGiXdLG1KlgE2xhwPB5DYkk54PQ==
X-Received: by 2002:a17:902:bc85:b0:143:954e:8548 with SMTP id bb5-20020a170902bc8500b00143954e8548mr73204786plb.82.1637317814262;
        Fri, 19 Nov 2021 02:30:14 -0800 (PST)
Received: from localhost ([103.99.179.247])
        by smtp.gmail.com with ESMTPSA id u22sm2537834pfk.148.2021.11.19.02.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 02:30:14 -0800 (PST)
Date:   Fri, 19 Nov 2021 18:30:09 +0800
From:   Calvin Zhang <calvinzhang.cool@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Calvin Zhang <calvinzhang.cool@gmail.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Jonas Bonn <jonas@southpole.se>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stafford Horne <shorne@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Rich Felker <dalias@libc.org>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Vladimir Isaev <isaev@synopsys.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Marc Zyngier <maz@kernel.org>,
        David Brazdil <dbrazdil@google.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Souptick Joarder <jrdr.linux@gmail.com>,
        Jinyang He <hejinyang@loongson.cn>,
        Mauri Sandberg <sandberg@mailfence.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Alexander Sverdlin <alexander.sverdlin@nokia.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        Andreas Oetken <andreas.oetken@siemens.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Ganesh Goudar <ganeshgr@linux.ibm.com>,
        Markus Elfring <elfring@users.sourceforge.net>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Atish Patra <atish.patra@wdc.com>,
        Anup Patel <anup.patel@wdc.com>,
        Nick Kossifidis <mick@ics.forth.gr>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Vitaly Wool <vitaly.wool@konsulko.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Lee Jones <lee.jones@linaro.org>,
        Guo Ren <guoren@linux.alibaba.com>,
        Rob Herring <robh@kernel.org>,
        Zhang Yunkai <zhang.yunkai@zte.com.cn>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        uclinux-h8-devel@lists.sourceforge.jp, linux-mips@vger.kernel.org,
        openrisc@lists.librecores.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] of: reserved_mem: Remove reserved regions count
 restriction
Message-ID: <YZd8sc6E0bgNA9ag@debian>
References: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
 <20211119075844.2902592-3-calvinzhang.cool@gmail.com>
 <YZd0uEWNH6Def3+8@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZd0uEWNH6Def3+8@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 19, 2021 at 11:56:08AM +0200, Andy Shevchenko wrote:
>On Fri, Nov 19, 2021 at 03:58:19PM +0800, Calvin Zhang wrote:
>> Change to allocate reserved_mems dynamically. Static reserved regions
>> must be reserved before any memblock allocations. The reserved_mems
>> array couldn't be allocated until memblock and linear mapping are ready.
>> 
>> So move the allocation and initialization of records and reserved memory
>> from early_init_fdt_scan_reserved_mem() to of_reserved_mem_init().
>
>>  arch/arc/mm/init.c                 |  3 ++
>>  arch/arm/kernel/setup.c            |  2 +
>>  arch/arm64/kernel/setup.c          |  3 ++
>>  arch/csky/kernel/setup.c           |  3 ++
>>  arch/h8300/kernel/setup.c          |  2 +
>>  arch/mips/kernel/setup.c           |  3 ++
>>  arch/nds32/kernel/setup.c          |  3 ++
>>  arch/nios2/kernel/setup.c          |  2 +
>>  arch/openrisc/kernel/setup.c       |  3 ++
>>  arch/powerpc/kernel/setup-common.c |  3 ++
>>  arch/riscv/kernel/setup.c          |  2 +
>>  arch/sh/kernel/setup.c             |  3 ++
>>  arch/xtensa/kernel/setup.c         |  2 +
>
>Isn't x86 missed? Is it on purpose?
>Would be nice to have this in the commit message or fixed accordingly.
AFAIK, x86 doesn't reserve memory through "/reserved-memory" node until now.
Actually, I got the arch list from callers of
early_init_fdt_scan_reserved_mem().
>
>-- 
>With Best Regards,
>Andy Shevchenko
>
>
>
Thanks,
Calvin
