Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E475D4582A1
	for <lists+linux-mips@lfdr.de>; Sun, 21 Nov 2021 10:01:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237887AbhKUJEg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 21 Nov 2021 04:04:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237869AbhKUJEf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 21 Nov 2021 04:04:35 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D661C061574;
        Sun, 21 Nov 2021 01:01:30 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id k4so11498798plx.8;
        Sun, 21 Nov 2021 01:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uQeJj6IFfvjTH7tZDTd0bi24dF8RigJdyTH2xVfGgTs=;
        b=Tgb5Ic+uwSSoM4JZA36HMAnlatkdP+klPPLN5bBR4mKKK7eTLYbvh8o7E0EcmDPq2Q
         qLbdPM+Vl8mxGeh64K6wzQ+bz31be5sOsZRi7/BFqa+3UZR2mkUMH1od5ApykCQ4oge7
         PWRsbIqGPWCVfPaQ/9SinTdE1/ZkUXrgz0XtKq4W6GhO2Tqz3W9WDL2YZ864OPwKasYW
         XOd5tML9uld3R9EbWMfJk2iapJud7W6QS3RAsn8xBt2Px10d2Ru8NLyAcujfPW2JGJIW
         WoJyuNX3QATWQwrzDElQcMEP/yNoxhjpnku/gWQVFiahs4VyOBv8MikwZLaNOsRVBr4h
         1RLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uQeJj6IFfvjTH7tZDTd0bi24dF8RigJdyTH2xVfGgTs=;
        b=pK+bFYG2jsNqeWxsZNKJ12E7bSEmyi8HtCQXEw6aSfHkKkTx+cJKzi0DA3Ps7hbEIV
         xROvm5QSWNx1dcS5Cm5uXUwRl334xpG3soPPtbVanCuKdBj5Dbkvfw5Q6dCFOkmnum3N
         WXFXJPBINjXXAAj/RhlP7Xl1TetZp1dNK6j4DXvMvKzjF9aqhb9BzudRic+0+nUmg0dj
         KvozEy/abQl/EQrdTBMZumyLl6hl1hVtif1ABvoZmhtUAK9ISNECDPl+53ETMv356sBj
         2RiZiSV7f44/oEdC15kA+Sr2cSW2lbvTaPLDfTVu3ITEA1AWy2IVGfiFAYePWd+JytWo
         3kNA==
X-Gm-Message-State: AOAM5308S3e3/NwoO0A9ItV+PMwrd2N0jbphKlYA4ZBYuCxdeLlHpfn6
        N6PfcZ811lBD53r+m6c6p4k=
X-Google-Smtp-Source: ABdhPJzLtHKp3ARITLkl6IEvP9ASH3fdvPyqX2o54+OrpL9oFv6P8ZWeoiFpXMGZlDp44TWDeD62sQ==
X-Received: by 2002:a17:903:1d2:b0:142:24f1:1213 with SMTP id e18-20020a17090301d200b0014224f11213mr96857331plh.81.1637485290032;
        Sun, 21 Nov 2021 01:01:30 -0800 (PST)
Received: from localhost ([103.99.179.247])
        by smtp.gmail.com with ESMTPSA id lp12sm4320990pjb.24.2021.11.21.01.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 01:01:29 -0800 (PST)
Date:   Sun, 21 Nov 2021 17:01:20 +0800
From:   Calvin Zhang <calvinzhang.cool@gmail.com>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Vineet Gupta <vgupta@kernel.org>,
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
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Vladimir Isaev <isaev@synopsys.com>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        "Kirill A. Shutemov" <kirill.shtuemov@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Marc Zyngier <maz@kernel.org>,
        David Brazdil <dbrazdil@google.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Souptick Joarder <jrdr.linux@gmail.com>,
        Jinyang He <hejinyang@loongson.cn>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        Andreas Oetken <andreas.oetken@siemens.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Zhang Yunkai <zhang.yunkai@zte.com.cn>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Markus Elfring <elfring@users.sourceforge.net>,
        Ganesh Goudar <ganeshgr@linux.ibm.com>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Atish Patra <atish.patra@wdc.com>,
        Anup Patel <anup.patel@wdc.com>,
        Nick Kossifidis <mick@ics.forth.gr>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Vitaly Wool <vitaly.wool@konsulko.com>,
        Thierry Reding <treding@nvidia.com>,
        Lee Jones <lee.jones@linaro.org>,
        Guo Ren <guoren@linux.alibaba.com>,
        Alexander Sverdlin <alexander.sverdlin@nokia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauri Sandberg <sandberg@mailfence.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        uclinux-h8-devel@lists.sourceforge.jp, linux-mips@vger.kernel.org,
        openrisc@lists.librecores.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] of: remove reserved regions count restriction
Message-ID: <YZoK4IiBOTPduEyN@debian>
References: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
 <YZnqo3oA7srQik4N@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZnqo3oA7srQik4N@kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Nov 21, 2021 at 08:43:47AM +0200, Mike Rapoport wrote:
>On Fri, Nov 19, 2021 at 03:58:17PM +0800, Calvin Zhang wrote:
>> The count of reserved regions in /reserved-memory was limited because
>> the struct reserved_mem array was defined statically. This series sorts
>> out reserved memory code and allocates that array from early allocator.
>> 
>> Note: reserved region with fixed location must be reserved before any
>> memory allocation. While struct reserved_mem array should be allocated
>> after allocator is activated. We make early_init_fdt_scan_reserved_mem()
>> do reservation only and add another call to initialize reserved memory.
>> So arch code have to change for it.
>
>I think much simpler would be to use the same constant for sizing
>memblock.reserved and reserved_mem arrays.
>
>If there is too much reserved regions in the device tree, reserving them in
>memblock will fail anyway because memblock also starts with static array
>for memblock.reserved, so doing one pass with memblock_reserve() and
>another to set up reserved_mem wouldn't help anyway.

Yes. This happens only if there are two many fixed reserved regions.
memblock.reserved can be resized after paging.

I also find another problem. Initializing dynamic reservation after
paging would fail to mark it no-map because no-map flag works when doing
direct mapping. This seems to be a circular dependency.

Thank You,
Calvin
