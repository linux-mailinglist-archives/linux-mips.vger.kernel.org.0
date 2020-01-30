Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2C5214DB58
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jan 2020 14:12:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727317AbgA3NMM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Jan 2020 08:12:12 -0500
Received: from foss.arm.com ([217.140.110.172]:52512 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727258AbgA3NMM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Jan 2020 08:12:12 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 087D6328;
        Thu, 30 Jan 2020 05:12:11 -0800 (PST)
Received: from [192.168.0.129] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AAD5D3F68E;
        Thu, 30 Jan 2020 05:11:57 -0800 (PST)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
To:     Gerald Schaefer <gerald.schaefer@de.ibm.com>
Cc:     linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
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
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Ingo Molnar <mingo@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
References: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
 <20200129232028.5a27e656@thinkpad>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <5baed7e2-fc83-6223-8bb4-dcd771f9a4ea@arm.com>
Date:   Thu, 30 Jan 2020 18:41:49 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200129232028.5a27e656@thinkpad>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 01/30/2020 03:50 AM, Gerald Schaefer wrote:
> On Tue, 28 Jan 2020 06:57:53 +0530
> Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> 
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
>> Tested-by: Christophe Leroy <christophe.leroy@c-s.fr>		#PPC32
> 
> Tested-by: Gerald Schaefer <gerald.schaefer@de.ibm.com> # s390

Thanks for testing.

> 
> Thanks again for this effort, and for keeping up the spirit against
> all odds and even after 12 iterations :-)
> 
>>
>> diff --git a/Documentation/features/debug/debug-vm-pgtable/arch-support.txt b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
>> new file mode 100644
>> index 000000000000..f3f8111edbe3
>> --- /dev/null
>> +++ b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
>> @@ -0,0 +1,35 @@
>> +#
>> +# Feature name:          debug-vm-pgtable
>> +#         Kconfig:       ARCH_HAS_DEBUG_VM_PGTABLE
>> +#         description:   arch supports pgtable tests for semantics compliance
>> +#
>> +    -----------------------
>> +    |         arch |status|
>> +    -----------------------
>> +    |       alpha: | TODO |
>> +    |         arc: |  ok  |
>> +    |         arm: | TODO |
>> +    |       arm64: |  ok  |
>> +    |         c6x: | TODO |
>> +    |        csky: | TODO |
>> +    |       h8300: | TODO |
>> +    |     hexagon: | TODO |
>> +    |        ia64: | TODO |
>> +    |        m68k: | TODO |
>> +    |  microblaze: | TODO |
>> +    |        mips: | TODO |
>> +    |       nds32: | TODO |
>> +    |       nios2: | TODO |
>> +    |    openrisc: | TODO |
>> +    |      parisc: | TODO |
>> +    |  powerpc/32: |  ok  |
>> +    |  powerpc/64: | TODO |
>> +    |       riscv: | TODO |
>> +    |        s390: | TODO |
> 
> s390 is ok now, with my patches included in v5.5-rc1. So you can now add
> 
> --- a/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
> +++ b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
> @@ -25,7 +25,7 @@
>      |  powerpc/32: |  ok  |
>      |  powerpc/64: | TODO |
>      |       riscv: | TODO |
> -    |        s390: | TODO |
> +    |        s390: |  ok  |
>      |          sh: | TODO |
>      |       sparc: | TODO |
>      |          um: | TODO |
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -59,6 +59,7 @@ config KASAN_SHADOW_OFFSET
>  config S390
>  	def_bool y
>  	select ARCH_BINFMT_ELF_STATE
> +	select ARCH_HAS_DEBUG_VM_PGTABLE
>  	select ARCH_HAS_DEVMEM_IS_ALLOWED
>  	select ARCH_HAS_ELF_RANDOMIZE
>  	select ARCH_HAS_FORTIFY_SOURCE

Sure, will add this up.
