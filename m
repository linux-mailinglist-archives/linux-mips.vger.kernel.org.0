Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9DB414DB33
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jan 2020 14:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbgA3NEd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Jan 2020 08:04:33 -0500
Received: from foss.arm.com ([217.140.110.172]:52310 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726980AbgA3NEc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Jan 2020 08:04:32 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 726D7328;
        Thu, 30 Jan 2020 05:04:31 -0800 (PST)
Received: from [192.168.0.129] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 818EF3F68E;
        Thu, 30 Jan 2020 05:04:18 -0800 (PST)
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
To:     Christophe Leroy <christophe.leroy@c-s.fr>, linux-mm@kvack.org
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
        Ingo Molnar <mingo@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
References: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
 <68ed6488-aa25-ab41-8da6-f0ddeb15d52b@c-s.fr>
Message-ID: <49754f74-53a7-0e4a-bb16-53617f8c902c@arm.com>
Date:   Thu, 30 Jan 2020 18:34:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <68ed6488-aa25-ab41-8da6-f0ddeb15d52b@c-s.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 01/28/2020 10:35 PM, Christophe Leroy wrote:
> 
> 
> Le 28/01/2020 à 02:27, Anshuman Khandual a écrit :
>> This adds tests which will validate architecture page table helpers and
>> other accessors in their compliance with expected generic MM semantics.
>> This will help various architectures in validating changes to existing
>> page table helpers or addition of new ones.
>>
>> This test covers basic page table entry transformations including but not
>> limited to old, young, dirty, clean, write, write protect etc at various
>> level along with populating intermediate entries with next page table page
>> and validating them.
>>
>> Test page table pages are allocated from system memory with required size
>> and alignments. The mapped pfns at page table levels are derived from a
>> real pfn representing a valid kernel text symbol. This test gets called
>> right after page_alloc_init_late().
>>
>> This gets build and run when CONFIG_DEBUG_VM_PGTABLE is selected along with
>> CONFIG_VM_DEBUG. Architectures willing to subscribe this test also need to
>> select CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE which for now is limited to x86 and
>> arm64. Going forward, other architectures too can enable this after fixing
>> build or runtime problems (if any) with their page table helpers.
>>
>> Folks interested in making sure that a given platform's page table helpers
>> conform to expected generic MM semantics should enable the above config
>> which will just trigger this test during boot. Any non conformity here will
>> be reported as an warning which would need to be fixed. This test will help
>> catch any changes to the agreed upon semantics expected from generic MM and
>> enable platforms to accommodate it thereafter.
>>
> 
> [...]
> 
>>
>> Tested-by: Christophe Leroy <christophe.leroy@c-s.fr>        #PPC32
> 
> Also tested on PPC64 (under QEMU): book3s/64 64k pages, book3s/64 4k pages and book3e/64

Hmm but earlier Michael Ellerman had reported some problems while
running these tests on PPC64, a soft lock up in hash__pte_update()
and a kernel BUG (radix MMU). Are those problems gone away now ?

Details in this thread - https://patchwork.kernel.org/patch/11214603/

> 
>> Reviewed-by: Ingo Molnar <mingo@kernel.org>
>> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
>> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
> 
> [...]
> 
>>
>> diff --git a/Documentation/features/debug/debug-vm-pgtable/arch-support.txt b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
>> new file mode 100644
>> index 000000000000..f3f8111edbe3
>> --- /dev/null
>> +++ b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
>> @@ -0,0 +1,35 @@
>> +#
>> +# Feature name:          debug-vm-pgtable
>> +#         Kconfig:       ARCH_HAS_DEBUG_VM_PGTABLE
>> +#         description:   arch supports pgtable tests for semantics compliance
>> +#
>> +    -----------------------
>> +    |         arch |status|
>> +    -----------------------
>> +    |       alpha: | TODO |
>> +    |         arc: |  ok  |
>> +    |         arm: | TODO |
>> +    |       arm64: |  ok  |
>> +    |         c6x: | TODO |
>> +    |        csky: | TODO |
>> +    |       h8300: | TODO |
>> +    |     hexagon: | TODO |
>> +    |        ia64: | TODO |
>> +    |        m68k: | TODO |
>> +    |  microblaze: | TODO |
>> +    |        mips: | TODO |
>> +    |       nds32: | TODO |
>> +    |       nios2: | TODO |
>> +    |    openrisc: | TODO |
>> +    |      parisc: | TODO |
>> +    |  powerpc/32: |  ok  |
>> +    |  powerpc/64: | TODO |
> 
> You can change the two above lines by
> 
>     powerpc: ok
>
>> +    |       riscv: | TODO |
>> +    |        s390: | TODO |
>> +    |          sh: | TODO |
>> +    |       sparc: | TODO |
>> +    |          um: | TODO |
>> +    |   unicore32: | TODO |
>> +    |         x86: |  ok  |
>> +    |      xtensa: | TODO |
>> +    -----------------------
> 
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 1ec34e16ed65..253dcab0bebc 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -120,6 +120,7 @@ config PPC
>>       #
>>       select ARCH_32BIT_OFF_T if PPC32
>>       select ARCH_HAS_DEBUG_VIRTUAL
>> +    select ARCH_HAS_DEBUG_VM_PGTABLE if PPC32
> 
> Remove the 'if PPC32' as we now know it also work on PPC64.

But in case there is a subset of PPC64 which still does not work
(problem reported earlier) with the test, will have to adjust the
config accordingly.

> 
>>       select ARCH_HAS_DEVMEM_IS_ALLOWED
>>       select ARCH_HAS_ELF_RANDOMIZE
>>       select ARCH_HAS_FORTIFY_SOURCE
> 
>> diff --git a/arch/x86/include/asm/pgtable_64.h b/arch/x86/include/asm/pgtable_64.h
>> index 0b6c4042942a..fb0e76d254b3 100644
>> --- a/arch/x86/include/asm/pgtable_64.h
>> +++ b/arch/x86/include/asm/pgtable_64.h
>> @@ -53,6 +53,12 @@ static inline void sync_initial_page_table(void) { }
>>     struct mm_struct;
>>   +#define mm_p4d_folded mm_p4d_folded
>> +static inline bool mm_p4d_folded(struct mm_struct *mm)
>> +{
>> +    return !pgtable_l5_enabled();
>> +}
>> +
> 
> For me this should be part of another patch, it is not directly linked to the tests.

We did discuss about this earlier and Kirril mentioned its not worth
a separate patch.

https://lore.kernel.org/linux-arm-kernel/20190913091305.rkds4f3fqv3yjhjy@box/

> 
>>   void set_pte_vaddr_p4d(p4d_t *p4d_page, unsigned long vaddr, pte_t new_pte);
>>   void set_pte_vaddr_pud(pud_t *pud_page, unsigned long vaddr, pte_t new_pte);
>>   diff --git a/include/asm-generic/pgtable.h b/include/asm-generic/pgtable.h
>> index 798ea36a0549..e0b04787e789 100644
>> --- a/include/asm-generic/pgtable.h
>> +++ b/include/asm-generic/pgtable.h
>> @@ -1208,6 +1208,12 @@ static inline bool arch_has_pfn_modify_check(void)
>>   # define PAGE_KERNEL_EXEC PAGE_KERNEL
>>   #endif
>>   +#ifdef CONFIG_DEBUG_VM_PGTABLE
> 
> Not sure it is a good idea to put that in include/asm-generic/pgtable.h

Logically that is the right place, as it is related to page table but
not something platform related.

> 
> By doing this you are forcing a rebuild of almost all files, whereas only init/main.o and mm/debug_vm_pgtable.o should be rebuilt when activating this config option.

I agreed but whats the alternative ? We could move these into init/main.c
to make things simpler but will that be a right place, given its related
to generic page table.

> 
>> +extern void debug_vm_pgtable(void);
> 
> Please don't use the 'extern' keyword, it is useless and not to be used for functions declaration.

Really ? But, there are tons of examples doing the same thing both in
generic and platform code as well.

> 
>> +#else
>> +static inline void debug_vm_pgtable(void) { }
>> +#endif
>> +
>>   #endif /* !__ASSEMBLY__ */
>>     #ifndef io_remap_pfn_range
>> diff --git a/init/main.c b/init/main.c
>> index da1bc0b60a7d..5e59e6ac0780 100644
>> --- a/init/main.c
>> +++ b/init/main.c
>> @@ -1197,6 +1197,7 @@ static noinline void __init kernel_init_freeable(void)
>>       sched_init_smp();
>>         page_alloc_init_late();
>> +    debug_vm_pgtable();
> 
> Wouldn't it be better to call debug_vm_pgtable() in kernel_init() between the call to async_synchronise_full() and ftrace_free_init_mem() ?

IIRC, proposed location is the earliest we could call debug_vm_pgtable().
Is there any particular benefit or reason to move it into kernel_init() ?

> 
>>       /* Initialize page ext after all struct pages are initialized. */
>>       page_ext_init();
>>   diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
>> index 5ffe144c9794..7cceae923c05 100644
>> --- a/lib/Kconfig.debug
>> +++ b/lib/Kconfig.debug
>> @@ -653,6 +653,12 @@ config SCHED_STACK_END_CHECK
>>         data corruption or a sporadic crash at a later stage once the region
>>         is examined. The runtime overhead introduced is minimal.
>>   +config ARCH_HAS_DEBUG_VM_PGTABLE
>> +    bool
>> +    help
>> +      An architecture should select this when it can successfully
>> +      build and run DEBUG_VM_PGTABLE.
>> +
>>   config DEBUG_VM
>>       bool "Debug VM"
>>       depends on DEBUG_KERNEL
>> @@ -688,6 +694,22 @@ config DEBUG_VM_PGFLAGS
>>           If unsure, say N.
>>   +config DEBUG_VM_PGTABLE
>> +    bool "Debug arch page table for semantics compliance"
>> +    depends on MMU
>> +    depends on DEBUG_VM
> 
> Does it really need to depend on DEBUG_VM ?

No. It seemed better to package this test along with DEBUG_VM (although I
dont remember the conversation around it) and hence this dependency.

> I think we could make it standalone and 'default y if DEBUG_VM' instead.

Which will yield the same result like before but in a different way. But
yes, this test could go about either way but unless there is a good enough
reason why change the current one.

> 
>> +    depends on ARCH_HAS_DEBUG_VM_PGTABLE
>> +    default y
>> +    help
>> +      This option provides a debug method which can be used to test
>> +      architecture page table helper functions on various platforms in
>> +      verifying if they comply with expected generic MM semantics. This
>> +      will help architecture code in making sure that any changes or
>> +      new additions of these helpers still conform to expected
>> +      semantics of the generic MM.
>> +
>> +      If unsure, say N.
>> +
> 
> Does it make sense to make it 'default y' and say 'If unsure, say N' ?

No it does. Not when it defaults 'y' unconditionally. Will drop the last
sentence "If unsure, say N". Nice catch, thank you.

> 
>>   config ARCH_HAS_DEBUG_VIRTUAL
>>       bool
>>   
> 
> Christophe
> 
