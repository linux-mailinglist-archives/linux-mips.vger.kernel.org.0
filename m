Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE06D53DB26
	for <lists+linux-mips@lfdr.de>; Sun,  5 Jun 2022 11:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244281AbiFEJ6U (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 5 Jun 2022 05:58:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbiFEJ6T (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 5 Jun 2022 05:58:19 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0A0242BD0;
        Sun,  5 Jun 2022 02:58:18 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9300D6E;
        Sun,  5 Jun 2022 02:58:17 -0700 (PDT)
Received: from [10.163.37.253] (unknown [10.163.37.253])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FB513F66F;
        Sun,  5 Jun 2022 02:58:08 -0700 (PDT)
Message-ID: <53c7da54-e106-0161-a128-4f0cfe92d7e4@arm.com>
Date:   Sun, 5 Jun 2022 15:28:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/6] s390/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Content-Language: en-US
To:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Will Deacon <will@kernel.org>, Jonas Bonn <jonas@southpole.se>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Sven Schnelle <svens@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "David S. Miller" <davem@davemloft.net>
References: <20220603101411.488970-1-anshuman.khandual@arm.com>
 <20220603101411.488970-3-anshuman.khandual@arm.com>
 <a97cba97-73f0-e8c2-6445-1f314eb27d87@csgroup.eu>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <a97cba97-73f0-e8c2-6445-1f314eb27d87@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 6/3/22 17:55, Christophe Leroy wrote:
> 
> 
> Le 03/06/2022 à 12:14, Anshuman Khandual a écrit :
>> This defines and exports a platform specific custom vm_get_page_prot() via
>> subscribing ARCH_HAS_VM_GET_PAGE_PROT. Subsequently all __SXXX and __PXXX
>> macros can be dropped which are no longer needed.
>>
>> Cc: Heiko Carstens <hca@linux.ibm.com>
>> Cc: Vasily Gorbik <gor@linux.ibm.com>
>> Cc: linux-s390@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Acked-by: Sven Schnelle <svens@linux.ibm.com>
>> Acked-by: Alexander Gordeev <agordeev@linux.ibm.com>
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>   arch/s390/Kconfig               |  1 +
>>   arch/s390/include/asm/pgtable.h | 17 -----------------
>>   arch/s390/mm/mmap.c             | 33 +++++++++++++++++++++++++++++++++
>>   3 files changed, 34 insertions(+), 17 deletions(-)
>>
>> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
>> index b17239ae7bd4..cdcf678deab1 100644
>> --- a/arch/s390/Kconfig
>> +++ b/arch/s390/Kconfig
>> @@ -81,6 +81,7 @@ config S390
>>   	select ARCH_HAS_SYSCALL_WRAPPER
>>   	select ARCH_HAS_UBSAN_SANITIZE_ALL
>>   	select ARCH_HAS_VDSO_DATA
>> +	select ARCH_HAS_VM_GET_PAGE_PROT
>>   	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>>   	select ARCH_INLINE_READ_LOCK
>>   	select ARCH_INLINE_READ_LOCK_BH
>> diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
>> index a397b072a580..c63a05b5368a 100644
>> --- a/arch/s390/include/asm/pgtable.h
>> +++ b/arch/s390/include/asm/pgtable.h
>> @@ -424,23 +424,6 @@ static inline int is_module_addr(void *addr)
>>    * implies read permission.
>>    */
>>            /*xwr*/
>> -#define __P000	PAGE_NONE
>> -#define __P001	PAGE_RO
>> -#define __P010	PAGE_RO
>> -#define __P011	PAGE_RO
>> -#define __P100	PAGE_RX
>> -#define __P101	PAGE_RX
>> -#define __P110	PAGE_RX
>> -#define __P111	PAGE_RX
>> -
>> -#define __S000	PAGE_NONE
>> -#define __S001	PAGE_RO
>> -#define __S010	PAGE_RW
>> -#define __S011	PAGE_RW
>> -#define __S100	PAGE_RX
>> -#define __S101	PAGE_RX
>> -#define __S110	PAGE_RWX
>> -#define __S111	PAGE_RWX
>>   
>>   /*
>>    * Segment entry (large page) protection definitions.
>> diff --git a/arch/s390/mm/mmap.c b/arch/s390/mm/mmap.c
>> index d545f5c39f7e..11d75b8d5ec0 100644
>> --- a/arch/s390/mm/mmap.c
>> +++ b/arch/s390/mm/mmap.c
>> @@ -188,3 +188,36 @@ void arch_pick_mmap_layout(struct mm_struct *mm, struct rlimit *rlim_stack)
>>   		mm->get_unmapped_area = arch_get_unmapped_area_topdown;
>>   	}
>>   }
>> +
>> +pgprot_t vm_get_page_prot(unsigned long vm_flags)
>> +{
>> +	switch (vm_flags & (VM_READ | VM_WRITE | VM_EXEC | VM_SHARED)) {
>> +	case VM_NONE:
>> +		return PAGE_NONE;
>> +	case VM_READ:
>> +	case VM_WRITE:
>> +	case VM_WRITE | VM_READ:
>> +		return PAGE_RO;
>> +	case VM_EXEC:
>> +	case VM_EXEC | VM_READ:
>> +	case VM_EXEC | VM_WRITE:
>> +	case VM_EXEC | VM_WRITE | VM_READ:
>> +		return PAGE_RX;
>> +	case VM_SHARED:
>> +		return PAGE_NONE;
>> +	case VM_SHARED | VM_READ:
>> +		return PAGE_RO;
>> +	case VM_SHARED | VM_WRITE:
>> +	case VM_SHARED | VM_WRITE | VM_READ:
>> +		return PAGE_RW;
>> +	case VM_SHARED | VM_EXEC:
>> +	case VM_SHARED | VM_EXEC | VM_READ:
>> +		return PAGE_RX;
>> +	case VM_SHARED | VM_EXEC | VM_WRITE:
>> +	case VM_SHARED | VM_EXEC | VM_WRITE | VM_READ:
>> +		return PAGE_RWX;
>> +	default:
>> +		BUILD_BUG();
>> +	}
>> +}
>> +EXPORT_SYMBOL(vm_get_page_prot);
> 
> Wasn't it demonstrated in previous discussions that a switch/case is 
> suboptimal compared to a table cell read ?

Right but all these platform patches here were acked from respective
platform folks. I assumed that they might have valued the simplicity
in switch case statements, while also dropping off the __SXXX/__PXXX
macros, which is the final objective. Looks like that assumption was
not accurate.

> 
> In order to get rid of the _Sxxx/_Pxxx macros, my preference would go to 
> having architectures provide their own protection_map[] table, and keep 
> the generic vm_get_page_prot() for the architectures would don't need a 
> specific version of it.

I will try and rework the patches as suggested.

> 
> This comment applies to all following patches as well.
