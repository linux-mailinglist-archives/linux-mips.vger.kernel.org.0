Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6EFD78E5
	for <lists+linux-mips@lfdr.de>; Tue, 15 Oct 2019 16:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732734AbfJOOlu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Oct 2019 10:41:50 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:36963 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732650AbfJOOlt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Oct 2019 10:41:49 -0400
Received: by mail-qt1-f193.google.com with SMTP id n17so11527497qtr.4
        for <linux-mips@vger.kernel.org>; Tue, 15 Oct 2019 07:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KOthtKc750ha5x4f9O1nDtFHxGzvuirdOiPTMzSqTsk=;
        b=AtgdjehMIW2BLhP3jeK/qmKXq2+AXxzyWeIH6bKw4O3o0bC6XJQt+cAWIC0yMh6wiP
         SupmvGOupyWxPBHXOSFIRoapYlzZ1hYO8VI7pDOCxTY/Dx1Dgrvi2XOEp2yl+LhIOEHT
         u2tYUEb7UC7Y+OmoO377QG3dWxUE+13skl13Dwf1FBQ4rIPA/dbKnr+HRCDUS7FZtcdV
         L3b45BZgHc50mOaywiqTTOXCkKt7paRreX5ny4ScY/osK3vBY9jN0JO82EN8FpMzG1Nn
         DuZelOJa5PuYyzq9v5gfHBe8i4OKeqTjui1sMrU6aselqYDmxj1po/GPeKBXBAMZGEJa
         1g3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KOthtKc750ha5x4f9O1nDtFHxGzvuirdOiPTMzSqTsk=;
        b=FFJLqstBUArz+e4SwC0HJe6n+MvC7ENyXPmfapOMT+J7qWMvyHP5XsZymAIAV6tVie
         PeJQ7ppc2iRtBaOEtNSvVxIhmsU/EcRQMPBarV7xFcaNEMc/3v4MAg2iiJxrEa0w5SZQ
         YyKOfsr3pFhb7PyyUgFOIcxViRZJeTgobj6KzFWilxgM24osyZPqzGZoGS8zil2pJ0yl
         7AVWa+aOAywl6q8/xBb06j/pVpZd/g8QWotXKB1Q0PDQwgE/c/y20lhZO25IADt9uzyi
         J2dVpR+yW+zNSG0er1G4iHora8DWqqo7Ga1LuzxSDwwjSt9pWfmT/K4Q6i7cz04Tu53O
         QVJg==
X-Gm-Message-State: APjAAAXsz9qjEhCvhGx8DVppbFXGSVdsZ7hmZ1NFNyrbe9OW2kDj6E9c
        Z/pZg3duo0pzi3TEmudwhxiTiA==
X-Google-Smtp-Source: APXvYqz1jaDLsZXCujEQqKw2NmGGpxtStBi3XubJKmoqx4STHaHJWThY1IvGZuOPXBVemA+XaCvAzg==
X-Received: by 2002:ac8:6ede:: with SMTP id f30mr38381128qtv.205.1571150507816;
        Tue, 15 Oct 2019 07:41:47 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id z200sm10605390qkb.5.2019.10.15.07.41.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 07:41:47 -0700 (PDT)
Message-ID: <1571150502.5937.39.camel@lca.pw>
Subject: Re: [PATCH V6 0/2] mm/debug: Add tests validating architecture page
 table helpers
From:   Qian Cai <cai@lca.pw>
To:     Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Michal Hocko <mhocko@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Steven Price <Steven.Price@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Kees Cook <keescook@chromium.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Matthew Wilcox <willy@infradead.org>,
        Sri Krishna chowdary <schowdary@nvidia.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Vineet Gupta <vgupta@synopsys.com>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        "Kirill A . Shutemov" <kirill@shutemov.name>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 15 Oct 2019 10:41:42 -0400
In-Reply-To: <1571131302-32290-1-git-send-email-anshuman.khandual@arm.com>
References: <1571131302-32290-1-git-send-email-anshuman.khandual@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The x86 will crash with linux-next during boot due to this series (v5) with the
config below plus CONFIG_DEBUG_VM_PGTABLE=y. I am not sure if v6 would address
it.

https://raw.githubusercontent.com/cailca/linux-mm/master/x86.config

[   33.862600][    T1] page:ffffea0009000000 is uninitialized and poisoned
[   33.862608][    T1] raw: ffffffffffffffff ffffffffffffffff ffffffffffffffff
ffffff871140][    T1]  ? _raw_spin_unlock_irq+0x27/0x40
[   33.871140][    T1]  ? rest_init+0x307/0x307
[   33.871140][    T1]  kernel_init+0x11/0x139
[   33.871140][    T1]  ? rest_init+0x307/0x307
[   33.871140][    T1]  ret_from_fork+0x27/0x50
[   33.871140][    T1] Modules linked in:
[   33.871140][    T1] ---[ end trace e99d392b0f7befbd ]---
[   33.871140][    T1] RIP: 0010:alloc_gigantic_page_order+0x3fe/0x490

On Tue, 2019-10-15 at 14:51 +0530, Anshuman Khandual wrote:
> This series adds a test validation for architecture exported page table
> helpers. Patch in the series adds basic transformation tests at various
> levels of the page table. Before that it exports gigantic page allocation
> function from HugeTLB.
> 
> This test was originally suggested by Catalin during arm64 THP migration
> RFC discussion earlier. Going forward it can include more specific tests
> with respect to various generic MM functions like THP, HugeTLB etc and
> platform specific tests.
> 
> https://lore.kernel.org/linux-mm/20190628102003.GA56463@arrakis.emea.arm.com/
> 
> Changes in V6:
> 
> - Moved alloc_gigantic_page_order() into mm/page_alloc.c per Michal
> - Moved alloc_gigantic_page_order() within CONFIG_CONTIG_ALLOC in the test
> - Folded Andrew's include/asm-generic/pgtable.h fix into the test patch 2/2
> 
> Changes in V5: (https://patchwork.kernel.org/project/linux-mm/list/?series=185991)
> 
> - Redefined and moved X86 mm_p4d_folded() into a different header per Kirill/Ingo
> - Updated the config option comment per Ingo and dropped 'kernel module' reference
> - Updated the commit message and dropped 'kernel module' reference
> - Changed DEBUG_ARCH_PGTABLE_TEST into DEBUG_VM_PGTABLE per Ingo
> - Moved config option from mm/Kconfig.debug into lib/Kconfig.debug
> - Renamed core test function arch_pgtable_tests() as debug_vm_pgtable()
> - Renamed mm/arch_pgtable_test.c as mm/debug_vm_pgtable.c
> - debug_vm_pgtable() gets called from kernel_init_freeable() after init_mm_internals()
> - Added an entry in Documentation/features/debug/ per Ingo
> - Enabled the test on arm64 and x86 platforms for now
> 
> Changes in V4: (https://patchwork.kernel.org/project/linux-mm/list/?series=183465)
> 
> - Disable DEBUG_ARCH_PGTABLE_TEST for ARM and IA64 platforms
> 
> Changes in V3: (https://lore.kernel.org/patchwork/project/lkml/list/?series=411216)
> 
> - Changed test trigger from module format into late_initcall()
> - Marked all functions with __init to be freed after completion
> - Changed all __PGTABLE_PXX_FOLDED checks as mm_pxx_folded()
> - Folded in PPC32 fixes from Christophe
> 
> Changes in V2:
> 
> https://lore.kernel.org/linux-mm/1568268173-31302-1-git-send-email-anshuman.khandual@arm.com/T/#t
> 
> - Fixed small typo error in MODULE_DESCRIPTION()
> - Fixed m64k build problems for lvalue concerns in pmd_xxx_tests()
> - Fixed dynamic page table level folding problems on x86 as per Kirril
> - Fixed second pointers during pxx_populate_tests() per Kirill and Gerald
> - Allocate and free pte table with pte_alloc_one/pte_free per Kirill
> - Modified pxx_clear_tests() to accommodate s390 lower 12 bits situation
> - Changed RANDOM_NZVALUE value from 0xbe to 0xff
> - Changed allocation, usage, free sequence for saved_ptep
> - Renamed VMA_FLAGS as VMFLAGS
> - Implemented a new method for random vaddr generation
> - Implemented some other cleanups
> - Dropped extern reference to mm_alloc()
> - Created and exported new alloc_gigantic_page_order()
> - Dropped the custom allocator and used new alloc_gigantic_page_order()
> 
> Changes in V1:
> 
> https://lore.kernel.org/linux-mm/1567497706-8649-1-git-send-email-anshuman.khandual@arm.com/
> 
> - Added fallback mechanism for PMD aligned memory allocation failure
> 
> Changes in RFC V2:
> 
> https://lore.kernel.org/linux-mm/1565335998-22553-1-git-send-email-anshuman.khandual@arm.com/T/#u
> 
> - Moved test module and it's config from lib/ to mm/
> - Renamed config TEST_ARCH_PGTABLE as DEBUG_ARCH_PGTABLE_TEST
> - Renamed file from test_arch_pgtable.c to arch_pgtable_test.c
> - Added relevant MODULE_DESCRIPTION() and MODULE_AUTHOR() details
> - Dropped loadable module config option
> - Basic tests now use memory blocks with required size and alignment
> - PUD aligned memory block gets allocated with alloc_contig_range()
> - If PUD aligned memory could not be allocated it falls back on PMD aligned
>   memory block from page allocator and pud_* tests are skipped
> - Clear and populate tests now operate on real in memory page table entries
> - Dummy mm_struct gets allocated with mm_alloc()
> - Dummy page table entries get allocated with [pud|pmd|pte]_alloc_[map]()
> - Simplified [p4d|pgd]_basic_tests(), now has random values in the entries
> 
> Original RFC V1:
> 
> https://lore.kernel.org/linux-mm/1564037723-26676-1-git-send-email-anshuman.khandual@arm.com/
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Mike Rapoport <rppt@linux.vnet.ibm.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Steven Price <Steven.Price@arm.com>
> Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Sri Krishna chowdary <schowdary@nvidia.com>
> Cc: Dave Hansen <dave.hansen@intel.com>
> Cc: Russell King - ARM Linux <linux@armlinux.org.uk>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
> Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: James Hogan <jhogan@kernel.org>
> Cc: Paul Burton <paul.burton@mips.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Kirill A. Shutemov <kirill@shutemov.name>
> Cc: Gerald Schaefer <gerald.schaefer@de.ibm.com>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Mike Kravetz <mike.kravetz@oracle.com>
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-ia64@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> Cc: x86@kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> 
> Anshuman Khandual (2):
>   mm/page_alloc: Make alloc_gigantic_page() available for general use
>   mm/debug: Add tests validating architecture page table helpers
> 
>  .../debug/debug-vm-pgtable/arch-support.txt   |  34 ++
>  arch/arm64/Kconfig                            |   1 +
>  arch/x86/Kconfig                              |   1 +
>  arch/x86/include/asm/pgtable_64.h             |   6 +
>  include/asm-generic/pgtable.h                 |   6 +
>  include/linux/gfp.h                           |   3 +
>  init/main.c                                   |   1 +
>  lib/Kconfig.debug                             |  21 +
>  mm/Makefile                                   |   1 +
>  mm/debug_vm_pgtable.c                         | 450 ++++++++++++++++++
>  mm/hugetlb.c                                  |  76 +--
>  mm/page_alloc.c                               |  98 ++++
>  12 files changed, 623 insertions(+), 75 deletions(-)
>  create mode 100644 Documentation/features/debug/debug-vm-pgtable/arch-support.txt
>  create mode 100644 mm/debug_vm_pgtable.c
> 
