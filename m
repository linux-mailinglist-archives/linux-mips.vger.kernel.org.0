Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C478F55920A
	for <lists+linux-mips@lfdr.de>; Fri, 24 Jun 2022 07:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbiFXFXT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Jun 2022 01:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbiFXFXR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Jun 2022 01:23:17 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CB8DD2A713;
        Thu, 23 Jun 2022 22:23:16 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE747176B;
        Thu, 23 Jun 2022 22:23:16 -0700 (PDT)
Received: from [10.162.41.7] (unknown [10.162.41.7])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77AE93F66F;
        Thu, 23 Jun 2022 22:23:08 -0700 (PDT)
Message-ID: <4e8b3213-2ca8-0bff-6ea9-3b03d1d1ad27@arm.com>
Date:   Fri, 24 Jun 2022 10:53:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH V4 03/26] powerpc/mm: Move protection_map[] inside the
 platform
Content-Language: en-US
To:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>
Cc:     "hch@infradead.org" <hch@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
        "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
        "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
        "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
        "linux-snps-arc@lists.infradead.org" 
        <linux-snps-arc@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
        "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Nicholas Piggin <npiggin@gmail.com>
References: <20220624044339.1533882-1-anshuman.khandual@arm.com>
 <20220624044339.1533882-4-anshuman.khandual@arm.com>
 <bce16cfe-45e1-6417-2a01-6a3ff6b67077@csgroup.eu>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <bce16cfe-45e1-6417-2a01-6a3ff6b67077@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 6/24/22 10:48, Christophe Leroy wrote:
> 
> 
> Le 24/06/2022 à 06:43, Anshuman Khandual a écrit :
>> This moves protection_map[] inside the platform and while here, also enable
>> ARCH_HAS_VM_GET_PAGE_PROT on 32 bit platforms via DECLARE_VM_GET_PAGE_PROT.
> 
> Not only 32 bit platforms, also nohash 64 (aka book3e/64)

Sure, will update the commit message.

> 
>>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>   arch/powerpc/Kconfig               |  2 +-
>>   arch/powerpc/include/asm/pgtable.h | 20 +-------------------
>>   arch/powerpc/mm/pgtable.c          | 24 ++++++++++++++++++++++++
>>   3 files changed, 26 insertions(+), 20 deletions(-)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index c2ce2e60c8f0..1035d172c7dd 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -140,7 +140,7 @@ config PPC
>>   	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
>>   	select ARCH_HAS_UACCESS_FLUSHCACHE
>>   	select ARCH_HAS_UBSAN_SANITIZE_ALL
>> -	select ARCH_HAS_VM_GET_PAGE_PROT	if PPC_BOOK3S_64
>> +	select ARCH_HAS_VM_GET_PAGE_PROT
>>   	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>>   	select ARCH_KEEP_MEMBLOCK
>>   	select ARCH_MIGHT_HAVE_PC_PARPORT
>> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
>> index d564d0ecd4cd..bf98db844579 100644
>> --- a/arch/powerpc/include/asm/pgtable.h
>> +++ b/arch/powerpc/include/asm/pgtable.h
>> @@ -20,25 +20,6 @@ struct mm_struct;
>>   #include <asm/nohash/pgtable.h>
>>   #endif /* !CONFIG_PPC_BOOK3S */
>>   
>> -/* Note due to the way vm flags are laid out, the bits are XWR */
>> -#define __P000	PAGE_NONE
>> -#define __P001	PAGE_READONLY
>> -#define __P010	PAGE_COPY
>> -#define __P011	PAGE_COPY
>> -#define __P100	PAGE_READONLY_X
>> -#define __P101	PAGE_READONLY_X
>> -#define __P110	PAGE_COPY_X
>> -#define __P111	PAGE_COPY_X
>> -
>> -#define __S000	PAGE_NONE
>> -#define __S001	PAGE_READONLY
>> -#define __S010	PAGE_SHARED
>> -#define __S011	PAGE_SHARED
>> -#define __S100	PAGE_READONLY_X
>> -#define __S101	PAGE_READONLY_X
>> -#define __S110	PAGE_SHARED_X
>> -#define __S111	PAGE_SHARED_X
>> -
>>   #ifndef __ASSEMBLY__
>>   
>>   #ifndef MAX_PTRS_PER_PGD
>> @@ -79,6 +60,7 @@ extern void paging_init(void);
>>   void poking_init(void);
>>   
>>   extern unsigned long ioremap_bot;
>> +extern pgprot_t protection_map[16] __ro_after_init;
>>   
>>   /*
>>    * kern_addr_valid is intended to indicate whether an address is a valid
>> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
>> index e6166b71d36d..618f30d35b17 100644
>> --- a/arch/powerpc/mm/pgtable.c
>> +++ b/arch/powerpc/mm/pgtable.c
>> @@ -472,3 +472,27 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
>>   	return ret_pte;
>>   }
>>   EXPORT_SYMBOL_GPL(__find_linux_pte);
>> +
>> +/* Note due to the way vm flags are laid out, the bits are XWR */
>> +pgprot_t protection_map[16] __ro_after_init = {
> 
> I can't see any place where protection_map[] gets modified. This could 
> be made const.

Sure, will make it a const as in case for many other platforms as well.

> 
>> +	[VM_NONE]					= PAGE_NONE,
>> +	[VM_READ]					= PAGE_READONLY,
>> +	[VM_WRITE]					= PAGE_COPY,
>> +	[VM_WRITE | VM_READ]				= PAGE_COPY,
>> +	[VM_EXEC]					= PAGE_READONLY_X,
>> +	[VM_EXEC | VM_READ]				= PAGE_READONLY_X,
>> +	[VM_EXEC | VM_WRITE]				= PAGE_COPY_X,
>> +	[VM_EXEC | VM_WRITE | VM_READ]			= PAGE_COPY_X,
>> +	[VM_SHARED]					= PAGE_NONE,
>> +	[VM_SHARED | VM_READ]				= PAGE_READONLY,
>> +	[VM_SHARED | VM_WRITE]				= PAGE_SHARED,
>> +	[VM_SHARED | VM_WRITE | VM_READ]		= PAGE_SHARED,
>> +	[VM_SHARED | VM_EXEC]				= PAGE_READONLY_X,
>> +	[VM_SHARED | VM_EXEC | VM_READ]			= PAGE_READONLY_X,
>> +	[VM_SHARED | VM_EXEC | VM_WRITE]		= PAGE_SHARED_X,
>> +	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= PAGE_SHARED_X
>> +};
>> +
>> +#ifndef CONFIG_PPC_BOOK3S_64
>> +DECLARE_VM_GET_PAGE_PROT
>> +#endif
