Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 120ED458267
	for <lists+linux-mips@lfdr.de>; Sun, 21 Nov 2021 07:44:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237573AbhKUGrU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 21 Nov 2021 01:47:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:58642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229621AbhKUGrT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 21 Nov 2021 01:47:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 60B98604AC;
        Sun, 21 Nov 2021 06:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637477055;
        bh=fF0qMHEWbaZWbEit/VvNjQKirKtWS4o0c8b9dFvtOFg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o40YeyKWlss6qPqzIaBC1BRaoNsy8h4lRluMS6PA711BRFcqyhJOnzbksEMtKtJO/
         8jbTZZa3TfDTwFyR4bB+BvkwZH8B4Lq6zUtBDhL0B4WDBH9OrnY/ZIAuUCLySCed3G
         BY0pW/832nzdNqDcLtde/+ux9ozmIiM3YLALWMwekxe0nZCbZ8Eac9fyNJkYF8xblI
         zzUk/gDwJpgD0wAYRzlFYo+zhx5+msTuR9KF/8/1WOgKdEL1RlhcobAeHzb+LuS7g/
         jBCVo5DEsOze9uLZm95vmKlvgKfjbEPyxEhw1wZAFN+rxMTmDM0V/oXbaGrjJoZ0t1
         JqBkAezCYdBnA==
Date:   Sun, 21 Nov 2021 08:43:47 +0200
From:   Mike Rapoport <rppt@kernel.org>
To:     Calvin Zhang <calvinzhang.cool@gmail.com>
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
Message-ID: <YZnqo3oA7srQik4N@kernel.org>
References: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 19, 2021 at 03:58:17PM +0800, Calvin Zhang wrote:
> The count of reserved regions in /reserved-memory was limited because
> the struct reserved_mem array was defined statically. This series sorts
> out reserved memory code and allocates that array from early allocator.
> 
> Note: reserved region with fixed location must be reserved before any
> memory allocation. While struct reserved_mem array should be allocated
> after allocator is activated. We make early_init_fdt_scan_reserved_mem()
> do reservation only and add another call to initialize reserved memory.
> So arch code have to change for it.

I think much simpler would be to use the same constant for sizing
memblock.reserved and reserved_mem arrays.

If there is too much reserved regions in the device tree, reserving them in
memblock will fail anyway because memblock also starts with static array
for memblock.reserved, so doing one pass with memblock_reserve() and
another to set up reserved_mem wouldn't help anyway.

> I'm only familiar with arm and arm64 architectures. Approvals from arch
> maintainers are required. Thank you all.
> 
> Calvin Zhang (2):
>   of: Sort reserved_mem related code
>   of: reserved_mem: Remove reserved regions count restriction
> 
>  arch/arc/mm/init.c                 |   3 +
>  arch/arm/kernel/setup.c            |   2 +
>  arch/arm64/kernel/setup.c          |   3 +
>  arch/csky/kernel/setup.c           |   3 +
>  arch/h8300/kernel/setup.c          |   2 +
>  arch/mips/kernel/setup.c           |   3 +
>  arch/nds32/kernel/setup.c          |   3 +
>  arch/nios2/kernel/setup.c          |   2 +
>  arch/openrisc/kernel/setup.c       |   3 +
>  arch/powerpc/kernel/setup-common.c |   3 +
>  arch/riscv/kernel/setup.c          |   2 +
>  arch/sh/kernel/setup.c             |   3 +
>  arch/xtensa/kernel/setup.c         |   2 +
>  drivers/of/fdt.c                   | 107 +---------------
>  drivers/of/of_private.h            |  12 +-
>  drivers/of/of_reserved_mem.c       | 189 ++++++++++++++++++++++++-----
>  include/linux/of_reserved_mem.h    |   4 +
>  17 files changed, 207 insertions(+), 139 deletions(-)
> 
> -- 
> 2.30.2
> 

-- 
Sincerely yours,
Mike.
