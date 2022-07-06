Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF105567E01
	for <lists+linux-mips@lfdr.de>; Wed,  6 Jul 2022 07:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbiGFFrr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 Jul 2022 01:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230180AbiGFFrq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 Jul 2022 01:47:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7249220DE
        for <linux-mips@vger.kernel.org>; Tue,  5 Jul 2022 22:47:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 80D8761D0B
        for <linux-mips@vger.kernel.org>; Wed,  6 Jul 2022 05:47:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF968C3411C;
        Wed,  6 Jul 2022 05:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657086464;
        bh=KCK63eKlgsetzJUgUazm2dbtzRCodlNohAuFTbwWcKA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=N2PKCW29SKfhfmoe9DrkccsHTBZ9Zo5V6CGyH2erZVCZ/weZ4NbAux9H88xOvNXhs
         97ou8j05Dh06tQiUSv01+VjBNL4QVYxTYf6jhu3acsfrtg+HkuH7ME/BsfVe0RNmt/
         V1hAMNELd31WQtqrzYPAj+2QZx0Wlr8mP1+exTwsBEWAnwWrA6TBLUHKLSmaJtR/Ir
         zoMum6b2ZWrMT8hZ0wXx1gGp/ON5yOuZYAFKRI33D35icfue3WCkoL9oDNJMkX6Qd5
         S+DPCHTaq+l+zAiqfNeTnFNgrpATbilSzBjxUXp8K6kYLYQN1ehb+I2qh4NDButgHY
         v4aEM9NaSnQ8Q==
Message-ID: <e635a799-fd11-7417-7a66-0ab10f25581f@kernel.org>
Date:   Wed, 6 Jul 2022 15:47:41 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: "virt_to_phys used for non-linear address" warnings
Content-Language: en-US
To:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <1e4f33d7-7eb5-3fb5-e44d-c4652e7cb8c6@kernel.org>
 <20220705174215.qpt3wreiykgw7ert@mobilestation>
From:   Greg Ungerer <gerg@kernel.org>
In-Reply-To: <20220705174215.qpt3wreiykgw7ert@mobilestation>
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

On 6/7/22 03:42, Serge Semin wrote:
> !To += Thomas
> !Cc += Jiaxun
> 
> Hi Greg,
> 
> On Fri, Jul 01, 2022 at 05:24:22PM +1000, Greg Ungerer wrote:
>> Hi,
>>
>> I am debugging a strange memory problem on a Mediatek MT7621 SoC based
>> hardware platform. That problem leads to rare and somewhat random
>> oops that are mostly within vma and generic memory functions (often in
>> kmem_cache_alloc(), but sometimes other places like unlink_anon_vmas() or
>> anon_vma_interval_tree_remove() or vma_interval_tree_remove()).
>>
>> To help track this down I enabled a few of the kernels hacking memory
>> debug config options. Now this immediately leads to getting this on
>> every process fork/exec:
>>
>>    ------------[ cut here ]------------
>>    WARNING: CPU: 0 PID: 1 at arch/mips/mm/physaddr.c:38 __virt_to_phys+0x50/0x84
>>    virt_to_phys used for non-linear address: c443e370 (0xbfbd0000)
>>    Modules linked in:
>>    CPU: 0 PID: 1 Comm: init Not tainted 5.17.0-ac0 #1
>>    Stack : 81c70000 7ffbd000 77de5000 81086784 00000000 00000004 00000000 d95b60c8
>>            80441c84 81c43654 81b70000 81b60000 804583d8 00000001 80441c28 8045cd00
>>            00000000 00000000 81aaf3b4 80441a70 00000187 80441adc 00000000 20306361
>>            203a6d6d 81c4d2f5 81c4d31c 74696e69 81b60000 00000001 80441d3c 81b6dbf0
>>            82070040 8066f240 81c70000 7ffbd000 00000000 814ff0f4 00000000 81c40000
>>            ...
>>    Call Trace:
>>    [<81008ed0>] show_stack+0x38/0x118
>>    [<8198f9e4>] dump_stack_lvl+0x5c/0x7c
>>    [<81989300>] __warn+0xc0/0xf4
>>    [<819893c0>] warn_slowpath_fmt+0x8c/0xb8
>>    [<81025480>] __virt_to_phys+0x50/0x84
>>    [<8100bb30>] arch_setup_additional_pages+0x120/0x230
>>    [<81239280>] load_elf_binary+0xacc/0x14e0
>>    [<811d6788>] bprm_execve+0x288/0x5dc
>>    [<811d7240>] kernel_execve+0x130/0x1b4
>>    [<81988154>] try_to_run_init_process+0x14/0x4c
>>    [<81995e40>] kernel_init+0xe4/0x118
>>    [<81003398>] ret_from_kernel_thread+0x14/0x1c
>>    ---[ end trace 0000000000000000 ]---
>>
>> This is caused by this code in arch/mips/kernel/vdso.c, function
>> arch_setup_additional_pages():
>>
>>          /* Map GIC user page. */
>>          if (gic_size) {
>>                  gic_base = (unsigned long)mips_gic_base + MIPS_GIC_USER_OFS;
>>                  gic_pfn = virt_to_phys((void *)gic_base) >> PAGE_SHIFT;
>>
>>                  ret = io_remap_pfn_range(vma, base, gic_pfn, gic_size,
>>                                           pgprot_noncached(vma->vm_page_prot));
>>                  if (ret)
>>                          goto out;
>>          }
>>
> 
>> That virt_to_phys() is being passed a value assigned from an ioremap().
>> According to the comments in io.h, this is not a correct usage of it:
>>
>>   *     The returned physical address is the physical (CPU) mapping for
>>   *     the memory address given. It is only valid to use this function on
>>   *     addresses directly mapped or allocated via kmalloc.
> 
> Physical address you are trying to retrieve is directly mapped. It's
> 0xbfbd0000, which belong to the UCAC kseg1 MIPS space:
> https://johnloomis.org/microchip/pic32/memory/memory.html
> So virt_to_phys() shall work for it with no problem.

Yeah, I can see that in this case it always ended up with the same pfn.


> Anyway IIUC from the __debug_virt_addr_valid() implementation you've
> got the "high_memory" variable initialized with inaccurate value. At
> very least it causes your directly mapped IO-address to cause the
> warning printed. In some circumstance it may lead to more complex
> problems. I've got a patch created some time ago, which fixes that
> misconfiguration. Could you try it out and see whether it solves your
> problems?

Tried the patch. Does not fix the issue. Still get the warning and dump
on every process startup.


> Could you also send out a log with "Zone ranges:" info retrieved on
> the kernel without my patch applied?

Before patch (original code):

     Zone ranges:
       Normal   [mem 0x0000000000000000-0x000000000fffffff]
     Movable zone start for each node
     Early memory node ranges
       node   0: [mem 0x0000000000000000-0x000000000fffffff]
     Initmem setup node 0 [mem 0x0000000000000000-0x000000000fffffff]

Regards
Greg



> -Sergey
> 
>>
>> So the debug warning is consistent with this comment.
>>
>> It is trivial to fix this by using __pa() directly here instead of
>> virt_to_phys(). So simply doing this fixes it:
>>
>> --- a/arch/mips/kernel/vdso.c
>> +++ b/arch/mips/kernel/vdso.c
>> @@ -159,7 +159,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
>>          /* Map GIC user page. */
>>          if (gic_size) {
>>                  gic_base = (unsigned long)mips_gic_base + MIPS_GIC_USER_OFS;
>> -               gic_pfn = virt_to_phys((void *)gic_base) >> PAGE_SHIFT;
>> +               gic_pfn = __pa(gic_base) >> PAGE_SHIFT;
>>                  ret = io_remap_pfn_range(vma, base, gic_pfn, gic_size,
>>                                           pgprot_noncached(vma->vm_page_prot));
>>
>> I am wondering if that is the right approach or if there is a more correct way?
>>
>> Regards
>> Greg
>>
