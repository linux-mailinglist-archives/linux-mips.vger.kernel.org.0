Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58C5741A5BD
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 04:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238675AbhI1CzS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 22:55:18 -0400
Received: from foss.arm.com ([217.140.110.172]:48134 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238673AbhI1CzS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 27 Sep 2021 22:55:18 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47D5DD6E;
        Mon, 27 Sep 2021 19:53:39 -0700 (PDT)
Received: from [10.163.74.181] (unknown [10.163.74.181])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C60F3F70D;
        Mon, 27 Sep 2021 19:53:36 -0700 (PDT)
Subject: Re: [PATCH] mm/mmap: Define index macros for protection_map[]
To:     Christoph Hellwig <hch@infradead.org>
Cc:     linux-mm@kvack.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "David S. Miller" <davem@davemloft.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1632712920-8171-1-git-send-email-anshuman.khandual@arm.com>
 <YVHcCZXmQ1yjINaf@infradead.org>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <f224c661-f8f0-3c4a-bad8-095209412dd4@arm.com>
Date:   Tue, 28 Sep 2021 08:24:43 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YVHcCZXmQ1yjINaf@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 9/27/21 8:28 PM, Christoph Hellwig wrote:
> On Mon, Sep 27, 2021 at 08:52:00AM +0530, Anshuman Khandual wrote:
>> protection_map[] maps the lower four bits from vm_flags into platform page
>> protection mask. Default initialization (and possible re-initialization in
>> the platform) does not make it clear that these indices are just derived
>> from various vm_flags protections (VM_SHARED, VM_READ, VM_WRITE, VM_EXEC).
>> This defines macros for protection_map[] indices which concatenate various
>> vm_flag attributes, making it clear and explicit.
> 
> I dont think this is all that helpful.  The main issue here is that
> protection_map is a pointless obsfucation ad should be replaced with a

Agreed, protection_map[] is an additional abstraction which could be dropped.

> simple switch statement provided by each architecture.  See the below
> WIP which just works for x86 and without pagetable debugging for where I
> think we should be going.

Sure, this will work as well but all platforms need to be changed at once.
Is there any platform that would not subscribe ARCH_HAS_GET_PAGE_PROT and
export its own vm_get_page_prot() ? AFAICS all platforms are required to
export __PXXX and __SXXX elements currently.

This seems to be a better idea than the current proposal. Probably all the
vm_flags combinations, which will be used in those switch statements can be
converted into macros just to improve readability. Are you planning to send
this as a proper patch soon ?

> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index ab83c22d274e7..70d8ae60a416f 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -74,8 +74,8 @@ config X86
>  	select ARCH_HAS_EARLY_DEBUG		if KGDB
>  	select ARCH_HAS_ELF_RANDOMIZE
>  	select ARCH_HAS_FAST_MULTIPLIER
> -	select ARCH_HAS_FILTER_PGPROT
>  	select ARCH_HAS_FORTIFY_SOURCE
> +	select ARCH_HAS_GET_PAGE_PROT
>  	select ARCH_HAS_GCOV_PROFILE_ALL
>  	select ARCH_HAS_KCOV			if X86_64 && STACK_VALIDATION
>  	select ARCH_HAS_MEM_ENCRYPT
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index 448cd01eb3ecb..a0cc70b056385 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -646,11 +646,6 @@ static inline pgprot_t pgprot_modify(pgprot_t oldprot, pgprot_t newprot)
>  
>  #define canon_pgprot(p) __pgprot(massage_pgprot(p))
>  
> -static inline pgprot_t arch_filter_pgprot(pgprot_t prot)
> -{
> -	return canon_pgprot(prot);
> -}
> -
>  static inline int is_new_memtype_allowed(u64 paddr, unsigned long size,
>  					 enum page_cache_mode pcm,
>  					 enum page_cache_mode new_pcm)
> diff --git a/arch/x86/include/asm/pgtable_types.h b/arch/x86/include/asm/pgtable_types.h
> index 40497a9020c6e..1a9dd933088e6 100644
> --- a/arch/x86/include/asm/pgtable_types.h
> +++ b/arch/x86/include/asm/pgtable_types.h
> @@ -228,25 +228,6 @@ enum page_cache_mode {
>  
>  #endif	/* __ASSEMBLY__ */
>  
> -/*         xwr */
> -#define __P000	PAGE_NONE
> -#define __P001	PAGE_READONLY
> -#define __P010	PAGE_COPY
> -#define __P011	PAGE_COPY
> -#define __P100	PAGE_READONLY_EXEC
> -#define __P101	PAGE_READONLY_EXEC
> -#define __P110	PAGE_COPY_EXEC
> -#define __P111	PAGE_COPY_EXEC
> -
> -#define __S000	PAGE_NONE
> -#define __S001	PAGE_READONLY
> -#define __S010	PAGE_SHARED
> -#define __S011	PAGE_SHARED
> -#define __S100	PAGE_READONLY_EXEC
> -#define __S101	PAGE_READONLY_EXEC
> -#define __S110	PAGE_SHARED_EXEC
> -#define __S111	PAGE_SHARED_EXEC
> -
>  /*
>   * early identity mapping  pte attrib macros.
>   */
> diff --git a/arch/x86/include/uapi/asm/mman.h b/arch/x86/include/uapi/asm/mman.h
> index d4a8d0424bfbf..775dbd3aff736 100644
> --- a/arch/x86/include/uapi/asm/mman.h
> +++ b/arch/x86/include/uapi/asm/mman.h
> @@ -5,20 +5,6 @@
>  #define MAP_32BIT	0x40		/* only give out 32bit addresses */
>  
>  #ifdef CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS
> -/*
> - * Take the 4 protection key bits out of the vma->vm_flags
> - * value and turn them in to the bits that we can put in
> - * to a pte.
> - *
> - * Only override these if Protection Keys are available
> - * (which is only on 64-bit).
> - */
> -#define arch_vm_get_page_prot(vm_flags)	__pgprot(	\
> -		((vm_flags) & VM_PKEY_BIT0 ? _PAGE_PKEY_BIT0 : 0) |	\
> -		((vm_flags) & VM_PKEY_BIT1 ? _PAGE_PKEY_BIT1 : 0) |	\
> -		((vm_flags) & VM_PKEY_BIT2 ? _PAGE_PKEY_BIT2 : 0) |	\
> -		((vm_flags) & VM_PKEY_BIT3 ? _PAGE_PKEY_BIT3 : 0))
> -
>  #define arch_calc_vm_prot_bits(prot, key) (		\
>  		((key) & 0x1 ? VM_PKEY_BIT0 : 0) |      \
>  		((key) & 0x2 ? VM_PKEY_BIT1 : 0) |      \
> diff --git a/arch/x86/mm/Makefile b/arch/x86/mm/Makefile
> index 5864219221ca8..b44806c5b3de8 100644
> --- a/arch/x86/mm/Makefile
> +++ b/arch/x86/mm/Makefile
> @@ -16,8 +16,10 @@ CFLAGS_REMOVE_mem_encrypt.o		= -pg
>  CFLAGS_REMOVE_mem_encrypt_identity.o	= -pg
>  endif
>  
> -obj-y				:=  init.o init_$(BITS).o fault.o ioremap.o extable.o mmap.o \
> -				    pgtable.o physaddr.o setup_nx.o tlb.o cpu_entry_area.o maccess.o
> +obj-y				:=  init.o init_$(BITS).o fault.o ioremap.o \
> +				    extable.o mmap.o pgtable.o physaddr.o \
> +				    setup_nx.o tlb.o cpu_entry_area.o \
> +				    maccess.o pgprot.o
>  
>  obj-y				+= pat/
>  
> diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
> index ff08dc4636347..e1d1168ed25e8 100644
> --- a/arch/x86/mm/mem_encrypt.c
> +++ b/arch/x86/mm/mem_encrypt.c
> @@ -189,10 +189,6 @@ void __init sme_early_init(void)
>  
>  	__supported_pte_mask = __sme_set(__supported_pte_mask);
>  
> -	/* Update the protection map with memory encryption mask */
> -	for (i = 0; i < ARRAY_SIZE(protection_map); i++)
> -		protection_map[i] = pgprot_encrypted(protection_map[i]);
> -
>  	if (sev_active())
>  		swiotlb_force = SWIOTLB_FORCE;
>  }
> diff --git a/arch/x86/mm/pgprot.c b/arch/x86/mm/pgprot.c
> new file mode 100644
> index 0000000000000..4d8e9dbcce993
> --- /dev/null
> +++ b/arch/x86/mm/pgprot.c
> @@ -0,0 +1,70 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#include <linux/export.h>
> +#include <linux/mm.h>
> +#include <asm/pgtable.h>
> +
> +static inline pgprot_t __vm_get_page_prot(unsigned long vm_flags)
> +{
> +	switch (vm_flags & (VM_READ | VM_WRITE | VM_EXEC | VM_SHARED)) {
> +	case 0:
> +		return PAGE_NONE;
> +	case VM_READ:
> +		return PAGE_READONLY;
> +	case VM_WRITE:
> +		return PAGE_COPY;
> +	case VM_READ | VM_WRITE:
> +		return PAGE_COPY;
> +	case VM_EXEC:
> +	case VM_EXEC | VM_READ:
> +		return PAGE_READONLY_EXEC;
> +	case VM_EXEC | VM_WRITE:
> +	case VM_EXEC | VM_READ | VM_WRITE:
> +		return PAGE_COPY_EXEC;
> +	case VM_SHARED:
> +		return PAGE_NONE;
> +	case VM_SHARED | VM_READ:
> +		return PAGE_READONLY;
> +	case VM_SHARED | VM_WRITE:
> +	case VM_SHARED | VM_READ | VM_WRITE:
> +		return PAGE_SHARED;
> +	case VM_SHARED | VM_EXEC:
> +	case VM_SHARED | VM_READ | VM_EXEC:
> +		return PAGE_READONLY_EXEC;
> +	case VM_SHARED | VM_WRITE | VM_EXEC:
> +	case VM_SHARED | VM_READ | VM_WRITE | VM_EXEC:
> +		return PAGE_SHARED_EXEC;
> +	default:
> +		BUILD_BUG();
> +		return PAGE_NONE;
> +	}
> +}
> +
> +pgprot_t vm_get_page_prot(unsigned long vm_flags)
> +{
> +	unsigned long val = pgprot_val(__vm_get_page_prot(vm_flags));
> +
> +#ifdef CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS
> +	/*
> +	 * Take the 4 protection key bits out of the vma->vm_flags value and
> +	 * turn them in to the bits that we can put in to a pte.
> +	 *
> +	 * Only override these if Protection Keys are available (which is only
> +	 * on 64-bit).
> +	 */
> +	if (vm_flags & VM_PKEY_BIT0)
> +		val |= _PAGE_PKEY_BIT0;
> +	if (vm_flags & VM_PKEY_BIT1)
> +		val |= _PAGE_PKEY_BIT1;
> +	if (vm_flags & VM_PKEY_BIT2)
> +		val |= _PAGE_PKEY_BIT2;
> +	if (vm_flags & VM_PKEY_BIT3)
> +		val |= _PAGE_PKEY_BIT3;
> +#endif
> +
> +	val = __sme_set(val);
> +	if (val & _PAGE_PRESENT)
> +		val &= __supported_pte_mask;
> +	return __pgprot(val);
> +}
> +EXPORT_SYMBOL(vm_get_page_prot);
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 73a52aba448f9..def17c5fb6afc 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -428,12 +428,6 @@ extern unsigned int kobjsize(const void *objp);
>  #endif
>  #define VM_FLAGS_CLEAR	(ARCH_VM_PKEY_FLAGS | VM_ARCH_CLEAR)
>  
> -/*
> - * mapping from the currently active vm_flags protection bits (the
> - * low four bits) to a page protection mask..
> - */
> -extern pgprot_t protection_map[16];
> -
>  /**
>   * enum fault_flag - Fault flag definitions.
>   * @FAULT_FLAG_WRITE: Fault was a write fault.
> diff --git a/mm/Kconfig b/mm/Kconfig
> index d16ba9249bc53..d9fa0bac189b4 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -894,6 +894,9 @@ config IO_MAPPING
>  config SECRETMEM
>  	def_bool ARCH_HAS_SET_DIRECT_MAP && !EMBEDDED
>  
> +config ARCH_HAS_GET_PAGE_PROT
> +	bool
> +
>  source "mm/damon/Kconfig"
>  
>  endmenu
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 88dcc5c252255..c6031dfcedd18 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -80,6 +80,7 @@ static void unmap_region(struct mm_struct *mm,
>  		struct vm_area_struct *vma, struct vm_area_struct *prev,
>  		unsigned long start, unsigned long end);
>  
> +#ifndef CONFIG_ARCH_HAS_GET_PAGE_PROT
>  /* description of effects of mapping type and prot in current implementation.
>   * this is due to the limited x86 page protection hardware.  The expected
>   * behavior is in parens:
> @@ -100,11 +101,6 @@ static void unmap_region(struct mm_struct *mm,
>   *								w: (no) no
>   *								x: (yes) yes
>   */
> -pgprot_t protection_map[16] __ro_after_init = {
> -	__P000, __P001, __P010, __P011, __P100, __P101, __P110, __P111,
> -	__S000, __S001, __S010, __S011, __S100, __S101, __S110, __S111
> -};
> -
>  #ifndef CONFIG_ARCH_HAS_FILTER_PGPROT
>  static inline pgprot_t arch_filter_pgprot(pgprot_t prot)
>  {
> @@ -112,15 +108,57 @@ static inline pgprot_t arch_filter_pgprot(pgprot_t prot)
>  }
>  #endif
>  
> +static pgprot_t __vm_get_page_prot(unsigned long vm_flags)
> +{
> +	switch (vm_flags & (VM_READ | VM_WRITE | VM_EXEC | VM_SHARED)) {
> +	case 0:
> +		return __P000;
> +	case VM_READ:
> +		return __P001;
> +	case VM_WRITE:
> +		return __P010;
> +	case VM_READ | VM_WRITE:
> +		return __P011;
> +	case VM_EXEC:
> +		return __P100;
> +	case VM_EXEC | VM_READ:
> +		return __P101;
> +	case VM_EXEC | VM_WRITE:
> +		return __P110;
> +	case VM_EXEC | VM_READ | VM_WRITE:
> +		return __P111;
> +	case VM_SHARED:
> +		return __S000;
> +	case VM_SHARED | VM_READ:
> +		return __S001;
> +	case VM_SHARED | VM_WRITE:
> +		return __S010;
> +	case VM_SHARED | VM_READ | VM_WRITE:
> +		return __S011;
> +	case VM_SHARED | VM_EXEC:
> +		return __S100;
> +	case VM_SHARED | VM_READ | VM_EXEC:
> +		return __S101;
> +	case VM_SHARED | VM_WRITE | VM_EXEC:
> +		return __S110;
> +	case VM_SHARED | VM_READ | VM_WRITE | VM_EXEC:
> +		return __S111;
> +	default:
> +		BUG();
> +	}
> +}
> +
>  pgprot_t vm_get_page_prot(unsigned long vm_flags)
>  {
> -	pgprot_t ret = __pgprot(pgprot_val(protection_map[vm_flags &
> -				(VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]) |
> -			pgprot_val(arch_vm_get_page_prot(vm_flags)));
> +	pgprot_t ret;
> +
> +	ret = __pgprot(pgprot_val(__vm_get_page_prot(vm_flags)) |
> +		       pgprot_val(arch_vm_get_page_prot(vm_flags)));
>  
>  	return arch_filter_pgprot(ret);
>  }
>  EXPORT_SYMBOL(vm_get_page_prot);
> +#endif /* CONFIG_ARCH_HAS_GET_PAGE_PROT */
>  
>  static pgprot_t vm_pgprot_modify(pgprot_t oldprot, unsigned long vm_flags)
>  {
> @@ -1660,10 +1698,9 @@ SYSCALL_DEFINE1(old_mmap, struct mmap_arg_struct __user *, arg)
>  #endif /* __ARCH_WANT_SYS_OLD_MMAP */
>  
>  /*
> - * Some shared mappings will want the pages marked read-only
> - * to track write events. If so, we'll downgrade vm_page_prot
> - * to the private version (using protection_map[] without the
> - * VM_SHARED bit).
> + * Some shared mappings will want the pages marked read-only to track write
> + * events.  If so, we'll downgrade vm_page_prot to the private version without
> + * the VM_SHARED bit.
>   */
>  int vma_wants_writenotify(struct vm_area_struct *vma, pgprot_t vm_page_prot)
>  {
> 
