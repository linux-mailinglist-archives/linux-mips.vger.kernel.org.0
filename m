Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60452569982
	for <lists+linux-mips@lfdr.de>; Thu,  7 Jul 2022 06:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234494AbiGGEu3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Jul 2022 00:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234808AbiGGEuF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 Jul 2022 00:50:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1124A31220
        for <linux-mips@vger.kernel.org>; Wed,  6 Jul 2022 21:49:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4A294621BE
        for <linux-mips@vger.kernel.org>; Thu,  7 Jul 2022 04:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2314C341C0;
        Thu,  7 Jul 2022 04:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657169379;
        bh=w8EpFM3T9WzQhYfsZVvJ+qXKEvK8ZSUJLx2AmODmrZc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ALHJOib4XjVmlVvanXsu+bx4O1mQSfcy3P6VC5am/8ESJwL+AY/6xlOlee0GIw0Nb
         5FTlitKRM0f2vhpReMpMyUDlTnBoQWCU+1InS/bmK8bHO2DZjz5pUu5aRiyZAGhYTZ
         jC6bZejLT5M1mheVYTU7wnWm3hV66gSuz+lqVNbDvX07t0MYr5jyzJf+coMWBZ3qB3
         xBzEESykcth4cWpvtT/ZVRQ1+p0HWwpPnDh061Fl024LKgwBLQToK+Gakzs7CKcjIV
         Rxdji67tQ5JHSMc7ApVNmuIgisMl8JMJhYOxYepCFu/XPwdC7S7R9DP4XZhLdXItKA
         oQmQuqFwONhWQ==
Message-ID: <3c4a0ab9-bc54-4584-bb27-d6045096335b@kernel.org>
Date:   Thu, 7 Jul 2022 14:49:36 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: "virt_to_phys used for non-linear address" warnings
Content-Language: en-US
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <1e4f33d7-7eb5-3fb5-e44d-c4652e7cb8c6@kernel.org>
 <20220705174215.qpt3wreiykgw7ert@mobilestation>
 <e635a799-fd11-7417-7a66-0ab10f25581f@kernel.org>
 <20220706120547.mat3yhjygqfoyr5s@mobilestation>
From:   Greg Ungerer <gerg@kernel.org>
In-Reply-To: <20220706120547.mat3yhjygqfoyr5s@mobilestation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Serge,

On 6/7/22 22:05, Serge Semin wrote:
> On Wed, Jul 06, 2022 at 03:47:41PM +1000, Greg Ungerer wrote:
>> Hi Serge,
>>
>> On 6/7/22 03:42, Serge Semin wrote:
>>> !To += Thomas
>>> !Cc += Jiaxun
>>>
>>> Hi Greg,
>>>
>>> On Fri, Jul 01, 2022 at 05:24:22PM +1000, Greg Ungerer wrote:
>>>> Hi,
>>>>
>>>> I am debugging a strange memory problem on a Mediatek MT7621 SoC based
>>>> hardware platform. That problem leads to rare and somewhat random
>>>> oops that are mostly within vma and generic memory functions (often in
>>>> kmem_cache_alloc(), but sometimes other places like unlink_anon_vmas() or
>>>> anon_vma_interval_tree_remove() or vma_interval_tree_remove()).
>>>>
>>>> To help track this down I enabled a few of the kernels hacking memory
>>>> debug config options. Now this immediately leads to getting this on
>>>> every process fork/exec:
>>>>
>>>>     ------------[ cut here ]------------
>>>>     WARNING: CPU: 0 PID: 1 at arch/mips/mm/physaddr.c:38 __virt_to_phys+0x50/0x84
>>>>     virt_to_phys used for non-linear address: c443e370 (0xbfbd0000)
>>>>     Modules linked in:
>>>>     CPU: 0 PID: 1 Comm: init Not tainted 5.17.0-ac0 #1
>>>>     Stack : 81c70000 7ffbd000 77de5000 81086784 00000000 00000004 00000000 d95b60c8
>>>>             80441c84 81c43654 81b70000 81b60000 804583d8 00000001 80441c28 8045cd00
>>>>             00000000 00000000 81aaf3b4 80441a70 00000187 80441adc 00000000 20306361
>>>>             203a6d6d 81c4d2f5 81c4d31c 74696e69 81b60000 00000001 80441d3c 81b6dbf0
>>>>             82070040 8066f240 81c70000 7ffbd000 00000000 814ff0f4 00000000 81c40000
>>>>             ...
>>>>     Call Trace:
>>>>     [<81008ed0>] show_stack+0x38/0x118
>>>>     [<8198f9e4>] dump_stack_lvl+0x5c/0x7c
>>>>     [<81989300>] __warn+0xc0/0xf4
>>>>     [<819893c0>] warn_slowpath_fmt+0x8c/0xb8
>>>>     [<81025480>] __virt_to_phys+0x50/0x84
>>>>     [<8100bb30>] arch_setup_additional_pages+0x120/0x230
>>>>     [<81239280>] load_elf_binary+0xacc/0x14e0
>>>>     [<811d6788>] bprm_execve+0x288/0x5dc
>>>>     [<811d7240>] kernel_execve+0x130/0x1b4
>>>>     [<81988154>] try_to_run_init_process+0x14/0x4c
>>>>     [<81995e40>] kernel_init+0xe4/0x118
>>>>     [<81003398>] ret_from_kernel_thread+0x14/0x1c
>>>>     ---[ end trace 0000000000000000 ]---
>>>>
>>>> This is caused by this code in arch/mips/kernel/vdso.c, function
>>>> arch_setup_additional_pages():
>>>>
>>>>           /* Map GIC user page. */
>>>>           if (gic_size) {
>>>>                   gic_base = (unsigned long)mips_gic_base + MIPS_GIC_USER_OFS;
>>>>                   gic_pfn = virt_to_phys((void *)gic_base) >> PAGE_SHIFT;
>>>>
>>>>                   ret = io_remap_pfn_range(vma, base, gic_pfn, gic_size,
>>>>                                            pgprot_noncached(vma->vm_page_prot));
>>>>                   if (ret)
>>>>                           goto out;
>>>>           }
>>>>
>>>
>>>> That virt_to_phys() is being passed a value assigned from an ioremap().
>>>> According to the comments in io.h, this is not a correct usage of it:
>>>>
>>>>    *     The returned physical address is the physical (CPU) mapping for
>>>>    *     the memory address given. It is only valid to use this function on
>>>>    *     addresses directly mapped or allocated via kmalloc.
>>>
>>> Physical address you are trying to retrieve is directly mapped. It's
>>> 0xbfbd0000, which belong to the UCAC kseg1 MIPS space:
>>> https://johnloomis.org/microchip/pic32/memory/memory.html
>>> So virt_to_phys() shall work for it with no problem.
>>
>> Yeah, I can see that in this case it always ended up with the same pfn.
>>
>>
>>> Anyway IIUC from the __debug_virt_addr_valid() implementation you've
>>> got the "high_memory" variable initialized with inaccurate value. At
>>> very least it causes your directly mapped IO-address to cause the
>>> warning printed. In some circumstance it may lead to more complex
>>> problems. I've got a patch created some time ago, which fixes that
>>> misconfiguration. Could you try it out and see whether it solves your
>>> problems?
>>
> 
>> Tried the patch. Does not fix the issue. Still get the warning and dump
>> on every process startup.
> 
> It's pity. I was hoping it would work and we wouldn't need to debug the
> problem remotely. See my next guess then.
> 
>>
>>
>>> Could you also send out a log with "Zone ranges:" info retrieved on
>>> the kernel without my patch applied?
>>
>> Before patch (original code):
>>
>>      Zone ranges:
>>        Normal   [mem 0x0000000000000000-0x000000000fffffff]
>>      Movable zone start for each node
>>      Early memory node ranges
>>        node   0: [mem 0x0000000000000000-0x000000000fffffff]
>>      Initmem setup node 0 [mem 0x0000000000000000-0x000000000fffffff]
> 
> Here is what I can see from the arch code and the info above:
> 1). Mediatek MT7621 SoC is based on the MIPS32r2 arch revision. So it
> supports 32bit kernel with highmem used to access the memory above
> HIGHMEM_START = _AC(0x20000000, UL). // 512MB+
> Most likely CONFIG_HIGHMEM is enabled in your kernel.

No, HIGHMEM is disabled in my kernel:

     # CONFIG_HIGHMEM is not set
     CONFIG_CPU_SUPPORTS_HIGHMEM=y
     CONFIG_SYS_SUPPORTS_HIGHMEM=y

Yes, the MT7621 is a MIPS32r2 based CPU:

     # CONFIG_CPU_MIPS32_R1 is not set
     CONFIG_CPU_MIPS32_R2=y
     CONFIG_SYS_SUPPORTS_ZBOOT=y
     CONFIG_SYS_HAS_CPU_MIPS32_R1=y
     CONFIG_SYS_HAS_CPU_MIPS32_R2=y
     CONFIG_WEAK_ORDERING=y
     # end of CPU selection

     CONFIG_CPU_MIPS32=y
     CONFIG_CPU_MIPSR2=y
     CONFIG_TARGET_ISA_REV=2
     CONFIG_SYS_SUPPORTS_32BIT_KERNEL=y
     CONFIG_CPU_SUPPORTS_32BIT_KERNEL=y


> 2). Judging by the Zone ranges log above your platform have only 256MB
> of memory detected. Thus
> max_pfn = 256MB >> PAGE_SHIFT
> max_low_pfn = max_pfn (see arch/mips/kernel/setup.c: bootmem_init)
> high_memory = (void *) __va(max_low_pfn << PAGE_SHIFT) (see arch/mips/mm/init.c: mem_init())
> All of that memory is accessible over the kseg0 segment, which
> reflects the directly mapped memory. So no highmem really needed.
> That's why there is no highmem zone printed in the log. It also caused
> my patch not working for you.

Yep, that makes sense.
My platform does have 256MB of RAM.


> 3) There is still IO-memory available in the directly mapped range:
> [0x1e000000 0x1fffffff] (arch/mips/boot/dts/ralink/mt7621.dtsi), which
> due to too small RAM detected turned to be out of the memory
> PFN/page-based access.
> 
> Anyway I am not absolutely sure, but still inclined to thinking that
> the problem is in the inaccurate/invalid max_low_pfn value, which
> consequently causes having invalid 'high_memory' variable content.
> Most likely the problem has been caused by the commit a94e4f24ec83
> ("MIPS: init: Drop boot_mem_map"), but it's too complicated to revert.
> So at this stage I would focus on hacking the bootmem_init() method
> defined in arch/mips/kernel/setup.c. As a dirty hack I would try the
> next fixup:
> 
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
>   	if (min_low_pfn >= max_low_pfn)
>   		panic("Incorrect memory mapping !!!");
>   
> +	max_pfn = max_low_pfn = PFN_DOWN(HIGHMEM_START);
>   	if (max_pfn > PFN_DOWN(HIGHMEM_START)) {
>   #ifdef CONFIG_HIGHMEM
>   		highstart_pfn = PFN_DOWN(HIGHMEM_START);
> 
> If it helps then the problem most likely is in the
> max_pfn/min_low_pfn/max_low_pfn setup algorithm implemented in the
> bootmem_init() method. I would think of refactoring it then.

No, still makes no difference. As soon as init runs the warnings start:

...
Freeing unused kernel image (initmem) memory: 288K
This architecture does not have kernel memory protection.
Run /sbin/init as init process
Run /etc/init as init process
Run /bin/init as init process
------------[ cut here ]------------
WARNING: CPU: 3 PID: 1 at arch/mips/mm/physaddr.c:38 __virt_to_phys+0x50/0x84
virt_to_phys used for non-linear address: (ptrval) (0xbfbd0000)
Modules linked in:
CPU: 3 PID: 1 Comm: init Not tainted 5.17.0-ac0 #8
Stack : 80c20000 7ffd6000 77de7000 80086784 00000000 00000004 00000000 f881894e
         82c41c84 80bf3654 80b20000 80b10000 82c583d8 00000001 82c41c28 82c9bf00
         00000000 00000000 80a64648 82c41a70 00000149 82c41adc 00000000 20306361
         203a6d6d 80bfd185 80bfd1ac 74696e69 80b10000 00000001 82c41d3c 80b1bcb0
         82688040 85257240 80c20000 7ffd6000 00000000 804fc754 0000000c 80bf000c
         ...
Call Trace:
[<80008ed0>] show_stack+0x38/0x118
[<80957c14>] dump_stack_lvl+0x5c/0x7c
[<80951530>] __warn+0xc0/0xf4
[<809515f0>] warn_slowpath_fmt+0x8c/0xb8
[<80025480>] __virt_to_phys+0x50/0x84
[<8000bb30>] arch_setup_additional_pages+0x120/0x230
[<802392a0>] load_elf_binary+0xacc/0x14e0
[<801d67a8>] bprm_execve+0x288/0x5dc
[<801d7260>] kernel_execve+0x130/0x1b4
[<80950384>] try_to_run_init_process+0x14/0x4c
[<8095df18>] kernel_init+0xe4/0x118
[<80003398>] ret_from_kernel_thread+0x14/0x1c

---[ end trace 0000000000000000 ]---

Regards
Greg


> -Sergey
> 
>>
>> Regards
>> Greg
>>
>>
>>
>>> -Sergey
>>>
>>>>
>>>> So the debug warning is consistent with this comment.
>>>>
>>>> It is trivial to fix this by using __pa() directly here instead of
>>>> virt_to_phys(). So simply doing this fixes it:
>>>>
>>>> --- a/arch/mips/kernel/vdso.c
>>>> +++ b/arch/mips/kernel/vdso.c
>>>> @@ -159,7 +159,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
>>>>           /* Map GIC user page. */
>>>>           if (gic_size) {
>>>>                   gic_base = (unsigned long)mips_gic_base + MIPS_GIC_USER_OFS;
>>>> -               gic_pfn = virt_to_phys((void *)gic_base) >> PAGE_SHIFT;
>>>> +               gic_pfn = __pa(gic_base) >> PAGE_SHIFT;
>>>>                   ret = io_remap_pfn_range(vma, base, gic_pfn, gic_size,
>>>>                                            pgprot_noncached(vma->vm_page_prot));
>>>>
>>>> I am wondering if that is the right approach or if there is a more correct way?
>>>>
>>>> Regards
>>>> Greg
>>>>
