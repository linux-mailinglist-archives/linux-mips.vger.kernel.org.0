Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5485F2F16
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2019 14:22:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388506AbfKGNWT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Nov 2019 08:22:19 -0500
Received: from foss.arm.com ([217.140.110.172]:56012 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388368AbfKGNWT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 Nov 2019 08:22:19 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3172D31B;
        Thu,  7 Nov 2019 05:22:18 -0800 (PST)
Received: from [10.163.1.22] (unknown [10.163.1.22])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7406D3F6C4;
        Thu,  7 Nov 2019 05:21:59 -0800 (PST)
Subject: Re: [PATCH V8] mm/debug: Add tests validating architecture page table
 helpers
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy <christophe.leroy@c-s.fr>, linux-mm@kvack.org
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
References: <1572240562-23630-1-git-send-email-anshuman.khandual@arm.com>
 <3229d68d-0b9d-0719-3370-c6e1df0ea032@arm.com>
 <42160baa-0e9d-73d0-bf72-58bdbacf10ff@c-s.fr>
 <0e0c2ce9-636d-1153-2451-baf7317ed45f@arm.com>
 <87tv7f4zkf.fsf@mpe.ellerman.id.au>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <83f14c65-035c-8387-3216-5dee8a287cfb@arm.com>
Date:   Thu, 7 Nov 2019 18:52:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <87tv7f4zkf.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 11/07/2019 06:24 PM, Michael Ellerman wrote:
> Anshuman Khandual <anshuman.khandual@arm.com> writes:
>> On 11/06/2019 12:11 PM, Christophe Leroy wrote:
>>> Le 06/11/2019 à 04:22, Anshuman Khandual a écrit :
>>>> On 10/28/2019 10:59 AM, Anshuman Khandual wrote:
>>>>> +    -----------------------
>>>>> +    |         arch |status|
>>>>> +    -----------------------
>>>>> +    |       alpha: | TODO |
>>>>> +    |         arc: | TODO |
>>>>> +    |         arm: | TODO |
>>>>> +    |       arm64: |  ok  |
>>>>> +    |         c6x: | TODO |
>>>>> +    |        csky: | TODO |
>>>>> +    |       h8300: | TODO |
>>>>> +    |     hexagon: | TODO |
>>>>> +    |        ia64: | TODO |
>>>>> +    |        m68k: | TODO |
>>>>> +    |  microblaze: | TODO |
>>>>> +    |        mips: | TODO |
>>>>> +    |       nds32: | TODO |
>>>>> +    |       nios2: | TODO |
>>>>> +    |    openrisc: | TODO |
>>>>> +    |      parisc: | TODO |
>>>>> +    |     powerpc: | TODO |
>>>>> +    |       ppc32: |  ok  |
>>>
>>> Note that ppc32 is a part of powerpc, not a standalone arch.
>>
>> Right, I understand. But we are yet to hear about how this test
>> came about on powerpc server platforms. Will update 'powerpc'
>> arch listing above once we get some confirmation. May be once
>> this works on all relevant powerpc platforms, we can just merge
>> 'powerpc' and 'ppc32' entries here as just 'powerpc'.
> 
> On pseries:
> 
>   watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [swapper/0:1]
>   Modules linked in:
>   CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.4.0-rc6-gcc-8.2.0-next-20191107-00001-g250339d6747b-dirty #152
>   NIP:  c0000000010435a0 LR: c0000000010434b4 CTR: 0000000000000000
>   REGS: c00000003a403980 TRAP: 0901   Not tainted  (5.4.0-rc6-gcc-8.2.0-next-20191107-00001-g250339d6747b-dirty)
>   MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 44000222  XER: 00000000
>   CFAR: c0000000010435a8 IRQMASK: 0 
>   GPR00: c0000000010434b4 c00000003a403c10 c000000001295000 05210001000000c0 
>   GPR04: 8000000000000105 0000000000400dc0 000000003eb00000 0000000000000001 
>   GPR08: 0000000000000000 ffffffffffffffff 0000000000000001 0000000000000100 
>   GPR12: 0000000000000000 c0000000018f0000 
>   NIP [c0000000010435a0] debug_vm_pgtable+0x43c/0x82c
>   LR [c0000000010434b4] debug_vm_pgtable+0x350/0x82c
>   Call Trace:
>   [c00000003a403c10] [c00000000104346c] debug_vm_pgtable+0x308/0x82c (unreliable)
>   [c00000003a403ce0] [c000000001004310] kernel_init_freeable+0x1d0/0x39c
>   [c00000003a403db0] [c000000000010da0] kernel_init+0x24/0x174
>   [c00000003a403e20] [c00000000000bdc4] ret_from_kernel_thread+0x5c/0x78
>   Instruction dump:
>   7d075078 7ce74b78 7ce0f9ad 40c2fff0 38800000 7f83e378 4b02eee1 60000000 
>   48000080 3920ffff 39400001 39000000 <7ea0f8a8> 7ea75039 40c2fff8 7ea74878 
> 
> Looking at the asm I think it's stuck in hash__pte_update() waiting for
> H_PAGE_BUSY to clear, but not sure why.
> 
> That's just using qemu TCG, instructions here if anyone wants to test it
> themselves :)
> 
>   https://github.com/linuxppc/wiki/wiki/Booting-with-Qemu
> 
> 
> If I boot with -cpu power9 (using Radix MMU), I get a plain old BUG:
> 
>   debug_vm_pgtable: debug_vm_pgtable: Validating architecture page table helpers
>   ------------[ cut here ]------------
>   kernel BUG at arch/powerpc/mm/pgtable.c:274!
>   Oops: Exception in kernel mode, sig: 5 [#1]
>   LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=32 NUMA pSeries
>   Modules linked in:
>   CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.4.0-rc6-gcc-8.2.0-next-20191107-00001-g250339d6747b-dirty #152
>   NIP:  c0000000000724e8 LR: c00000000104358c CTR: 0000000000000000
>   REGS: c00000003a483980 TRAP: 0700   Not tainted  (5.4.0-rc6-gcc-8.2.0-next-20191107-00001-g250339d6747b-dirty)
>   MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 24000224  XER: 20000000
>   CFAR: c000000001043588 IRQMASK: 0 
>   GPR00: c00000000104358c c00000003a483c10 c000000001295000 0000000000000009 
>   GPR04: 0000000000000000 0000000000000005 0000000000000000 0000000000000009 
>   GPR08: 0000000000000001 000000000000000e 0000000000000001 c00000003a5f0000 
>   GPR12: 0000000000000000 c0000000018f0000 c000000000010d84 0000000000000000 
>   GPR16: 0000000000000000 0000000000000000 c00000003a5f0000 8000000000000105 
>   GPR20: c000000001003ab8 0000000000000015 0500613a00000080 0900603a00000080 
>   GPR24: 09202e3a00000080 c00000000133bd90 c00000000133bd98 c00000000133bda0 
>   GPR28: c00000003a5e0000 c00000003a600af8 c00000003a2e2d48 c00000003a6100a0 
>   NIP [c0000000000724e8] assert_pte_locked+0x88/0x190
>   LR [c00000000104358c] debug_vm_pgtable+0x428/0x82c
>   Call Trace:
>   [c00000003a483c10] [c00000000104346c] debug_vm_pgtable+0x308/0x82c (unreliable)
>   [c00000003a483ce0] [c000000001004310] kernel_init_freeable+0x1d0/0x39c
>   [c00000003a483db0] [c000000000010da0] kernel_init+0x24/0x174
>   [c00000003a483e20] [c00000000000bdc4] ret_from_kernel_thread+0x5c/0x78
>   Instruction dump:
>   7d251a14 39070010 7d463030 7d084a14 38c6ffff 7c884436 7cc607b4 7d083038 
>   79081f24 7ccb402a 7cc80074 7908d182 <0b080000> 78cb0022 54c8c03e 7d473830 
>   ---[ end trace a694f1bc56529c0e ]---

Oops. Does not seem like a quick problem to fix :) Though assert_pte_locked()
gets checked only when DEBUG_VM is enabled. Probably will have to keep this
test disabled on powerpc for now.

> 
> 
> cheers
> 
