Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D647556AC00
	for <lists+linux-mips@lfdr.de>; Thu,  7 Jul 2022 21:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235709AbiGGTnE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Jul 2022 15:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236091AbiGGTnE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 Jul 2022 15:43:04 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 456BB5A2C8
        for <linux-mips@vger.kernel.org>; Thu,  7 Jul 2022 12:43:02 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id o7so3739301lfq.9
        for <linux-mips@vger.kernel.org>; Thu, 07 Jul 2022 12:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VlMUEKp7Oqv2z/jyCVuMBqHDTjHetDPVwyTnoZgZas8=;
        b=Tbg1837cAQS/Y7hbnnccUfKEayfNhLrPPSlrUvEWrG3qYzYLd2dMX/ZLp0yhfPq/G4
         dLpKXFwyhjxMa+gtq99668t9KCpOuX011ac/FEcd6kiuFZTWAxHkm7FCQMFaWD3hF99l
         DmIzMjmO8PI5IWa1diSZCfCvks342D7M8Et/lKnTBOYMH/ulsays/ea3jP6NT0pga7um
         v9erEibYLRst7bSTeUU6BBE/i9Og87782XgkWaUjTd3W/i+C7ov9T/hihGgK4kvS2Ojh
         NlJLQP9+BcPx8pGBP+bjehs44QwNzBJF6TxybvnXB7QTc/AM5kaRk2yeee2h7WO9a89i
         aztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VlMUEKp7Oqv2z/jyCVuMBqHDTjHetDPVwyTnoZgZas8=;
        b=Fd5lBsMiOaW2Qh6wAceVtWxYferRnAmLPkBJAIukTzeyMxi+TZLiHb5iMLGMpzekTE
         ELb9HUz8ZK0eQ/9rPg529bGRrMvpWrlFyQdE1T46VMtZBrC66FUkWMBVoOp8hM2cns/X
         xo5WbTOryWkc6+sp+D/SLQPJgB3+rTP33u3PyEdjzRRXqBlNHOQ3Y/n01x+Vo6jLM8Ja
         lcS8AwxpKinFb8nneI9vP8SYHm8obqOJjaHbEilw4S4V7s2DL0/otbJ4sTRIdHSrIBFz
         MlLnE16kyjE5XE1jZ9XtkrEnBP0jt0W9vfAaMlZL5PZNUxWDU4EykohXBpYdV2sulgLa
         wndA==
X-Gm-Message-State: AJIora8LDu90pkkZyEaaO6ms4laH6QIqiwOtCq7sjlGn5gMJt+ymfSIf
        xqTLGVZkaBajlfPwWIR3V4o=
X-Google-Smtp-Source: AGRyM1vAnn9IFi7mhGAQlCpQTUxME0EUxH+eqCyJO8lkAFIulczDQf2ETt1Rfos97Ltl+jxdEm0IqQ==
X-Received: by 2002:ac2:46f5:0:b0:488:c5c8:d09c with SMTP id q21-20020ac246f5000000b00488c5c8d09cmr2568715lfo.566.1657222980442;
        Thu, 07 Jul 2022 12:43:00 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
        by smtp.gmail.com with ESMTPSA id x12-20020a0565123f8c00b0047255d211d4sm6949560lfa.259.2022.07.07.12.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 12:42:58 -0700 (PDT)
Date:   Thu, 7 Jul 2022 22:42:56 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Greg Ungerer <gerg@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: "virt_to_phys used for non-linear address" warnings
Message-ID: <20220707194256.v6bbi6axfc745xfz@mobilestation>
References: <1e4f33d7-7eb5-3fb5-e44d-c4652e7cb8c6@kernel.org>
 <20220705174215.qpt3wreiykgw7ert@mobilestation>
 <e635a799-fd11-7417-7a66-0ab10f25581f@kernel.org>
 <20220706120547.mat3yhjygqfoyr5s@mobilestation>
 <3c4a0ab9-bc54-4584-bb27-d6045096335b@kernel.org>
 <20220707114047.o4wrbab2laoka3nb@mobilestation>
 <9894b5ff-836b-d061-220b-7efec9a1a6b7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9894b5ff-836b-d061-220b-7efec9a1a6b7@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jul 07, 2022 at 09:59:14AM -0700, Florian Fainelli wrote:
> On 7/7/22 04:40, Serge Semin wrote:
> > !To+= Florian
> > 
> > On Thu, Jul 07, 2022 at 02:49:36PM +1000, Greg Ungerer wrote:
> > > Hi Serge,
> > > 
> > > On 6/7/22 22:05, Serge Semin wrote:
> > > > On Wed, Jul 06, 2022 at 03:47:41PM +1000, Greg Ungerer wrote:
> > > > > Hi Serge,
> > > > > 
> > > > > On 6/7/22 03:42, Serge Semin wrote:
> > > > > > !To += Thomas
> > > > > > !Cc += Jiaxun
> > > > > > 
> > > > > > Hi Greg,
> > > > > > 
> > > > > > On Fri, Jul 01, 2022 at 05:24:22PM +1000, Greg Ungerer wrote:
> > > > > > > Hi,
> > > > > > > 
> > > > > > > I am debugging a strange memory problem on a Mediatek MT7621 SoC based
> > > > > > > hardware platform. That problem leads to rare and somewhat random
> > > > > > > oops that are mostly within vma and generic memory functions (often in
> > > > > > > kmem_cache_alloc(), but sometimes other places like unlink_anon_vmas() or
> > > > > > > anon_vma_interval_tree_remove() or vma_interval_tree_remove()).
> > > > > > > 
> > > > > > > To help track this down I enabled a few of the kernels hacking memory
> > > > > > > debug config options. Now this immediately leads to getting this on
> > > > > > > every process fork/exec:
> > > > > > > 
> > > > > > >      ------------[ cut here ]------------
> > > > > > >      WARNING: CPU: 0 PID: 1 at arch/mips/mm/physaddr.c:38 __virt_to_phys+0x50/0x84
> > > > > > >      virt_to_phys used for non-linear address: c443e370 (0xbfbd0000)
> > > > > > >      Modules linked in:
> > > > > > >      CPU: 0 PID: 1 Comm: init Not tainted 5.17.0-ac0 #1
> > > > > > >      Stack : 81c70000 7ffbd000 77de5000 81086784 00000000 00000004 00000000 d95b60c8
> > > > > > >              80441c84 81c43654 81b70000 81b60000 804583d8 00000001 80441c28 8045cd00
> > > > > > >              00000000 00000000 81aaf3b4 80441a70 00000187 80441adc 00000000 20306361
> > > > > > >              203a6d6d 81c4d2f5 81c4d31c 74696e69 81b60000 00000001 80441d3c 81b6dbf0
> > > > > > >              82070040 8066f240 81c70000 7ffbd000 00000000 814ff0f4 00000000 81c40000
> > > > > > >              ...
> > > > > > >      Call Trace:
> > > > > > >      [<81008ed0>] show_stack+0x38/0x118
> > > > > > >      [<8198f9e4>] dump_stack_lvl+0x5c/0x7c
> > > > > > >      [<81989300>] __warn+0xc0/0xf4
> > > > > > >      [<819893c0>] warn_slowpath_fmt+0x8c/0xb8
> > > > > > >      [<81025480>] __virt_to_phys+0x50/0x84
> > > > > > >      [<8100bb30>] arch_setup_additional_pages+0x120/0x230
> > > > > > >      [<81239280>] load_elf_binary+0xacc/0x14e0
> > > > > > >      [<811d6788>] bprm_execve+0x288/0x5dc
> > > > > > >      [<811d7240>] kernel_execve+0x130/0x1b4
> > > > > > >      [<81988154>] try_to_run_init_process+0x14/0x4c
> > > > > > >      [<81995e40>] kernel_init+0xe4/0x118
> > > > > > >      [<81003398>] ret_from_kernel_thread+0x14/0x1c
> > > > > > >      ---[ end trace 0000000000000000 ]---
> > > > > > > 
> > > > > > > This is caused by this code in arch/mips/kernel/vdso.c, function
> > > > > > > arch_setup_additional_pages():
> > > > > > > 
> > > > > > >            /* Map GIC user page. */
> > > > > > >            if (gic_size) {
> > > > > > >                    gic_base = (unsigned long)mips_gic_base + MIPS_GIC_USER_OFS;
> > > > > > >                    gic_pfn = virt_to_phys((void *)gic_base) >> PAGE_SHIFT;
> > > > > > > 
> > > > > > >                    ret = io_remap_pfn_range(vma, base, gic_pfn, gic_size,
> > > > > > >                                             pgprot_noncached(vma->vm_page_prot));
> > > > > > >                    if (ret)
> > > > > > >                            goto out;
> > > > > > >            }
> > > > > > > 
> > > > > > 
> > > > > > > That virt_to_phys() is being passed a value assigned from an ioremap().
> > > > > > > According to the comments in io.h, this is not a correct usage of it:
> > > > > > > 
> > > > > > >     *     The returned physical address is the physical (CPU) mapping for
> > > > > > >     *     the memory address given. It is only valid to use this function on
> > > > > > >     *     addresses directly mapped or allocated via kmalloc.
> > > > > > 
> > > > > > Physical address you are trying to retrieve is directly mapped. It's
> > > > > > 0xbfbd0000, which belong to the UCAC kseg1 MIPS space:
> > > > > > https://johnloomis.org/microchip/pic32/memory/memory.html
> > > > > > So virt_to_phys() shall work for it with no problem.
> > > > > 
> > > > > Yeah, I can see that in this case it always ended up with the same pfn.
> > > > > 
> > > > > 
> > > > > > Anyway IIUC from the __debug_virt_addr_valid() implementation you've
> > > > > > got the "high_memory" variable initialized with inaccurate value. At
> > > > > > very least it causes your directly mapped IO-address to cause the
> > > > > > warning printed. In some circumstance it may lead to more complex
> > > > > > problems. I've got a patch created some time ago, which fixes that
> > > > > > misconfiguration. Could you try it out and see whether it solves your
> > > > > > problems?
> > > > > 
> > > > 
> > > > > Tried the patch. Does not fix the issue. Still get the warning and dump
> > > > > on every process startup.
> > > > 
> > > > It's pity. I was hoping it would work and we wouldn't need to debug the
> > > > problem remotely. See my next guess then.
> > > > 
> > > > > 
> > > > > 
> > > > > > Could you also send out a log with "Zone ranges:" info retrieved on
> > > > > > the kernel without my patch applied?
> > > > > 
> > > > > Before patch (original code):
> > > > > 
> > > > >       Zone ranges:
> > > > >         Normal   [mem 0x0000000000000000-0x000000000fffffff]
> > > > >       Movable zone start for each node
> > > > >       Early memory node ranges
> > > > >         node   0: [mem 0x0000000000000000-0x000000000fffffff]
> > > > >       Initmem setup node 0 [mem 0x0000000000000000-0x000000000fffffff]
> > > > 
> > > > Here is what I can see from the arch code and the info above:
> > > > 1). Mediatek MT7621 SoC is based on the MIPS32r2 arch revision. So it
> > > > supports 32bit kernel with highmem used to access the memory above
> > > > HIGHMEM_START = _AC(0x20000000, UL). // 512MB+
> > > > Most likely CONFIG_HIGHMEM is enabled in your kernel.
> > > 
> > > No, HIGHMEM is disabled in my kernel:
> > > 
> > >      # CONFIG_HIGHMEM is not set
> > >      CONFIG_CPU_SUPPORTS_HIGHMEM=y
> > >      CONFIG_SYS_SUPPORTS_HIGHMEM=y
> > > 
> > > Yes, the MT7621 is a MIPS32r2 based CPU:
> > > 
> > >      # CONFIG_CPU_MIPS32_R1 is not set
> > >      CONFIG_CPU_MIPS32_R2=y
> > >      CONFIG_SYS_SUPPORTS_ZBOOT=y
> > >      CONFIG_SYS_HAS_CPU_MIPS32_R1=y
> > >      CONFIG_SYS_HAS_CPU_MIPS32_R2=y
> > >      CONFIG_WEAK_ORDERING=y
> > >      # end of CPU selection
> > > 
> > >      CONFIG_CPU_MIPS32=y
> > >      CONFIG_CPU_MIPSR2=y
> > >      CONFIG_TARGET_ISA_REV=2
> > >      CONFIG_SYS_SUPPORTS_32BIT_KERNEL=y
> > >      CONFIG_CPU_SUPPORTS_32BIT_KERNEL=y
> > > 
> > > 
> > > > 2). Judging by the Zone ranges log above your platform have only 256MB
> > > > of memory detected. Thus
> > > > max_pfn = 256MB >> PAGE_SHIFT
> > > > max_low_pfn = max_pfn (see arch/mips/kernel/setup.c: bootmem_init)
> > > > high_memory = (void *) __va(max_low_pfn << PAGE_SHIFT) (see arch/mips/mm/init.c: mem_init())
> > > > All of that memory is accessible over the kseg0 segment, which
> > > > reflects the directly mapped memory. So no highmem really needed.
> > > > That's why there is no highmem zone printed in the log. It also caused
> > > > my patch not working for you.
> > > 
> > > Yep, that makes sense.
> > > My platform does have 256MB of RAM.
> > > 
> > > 
> > > > 3) There is still IO-memory available in the directly mapped range:
> > > > [0x1e000000 0x1fffffff] (arch/mips/boot/dts/ralink/mt7621.dtsi), which
> > > > due to too small RAM detected turned to be out of the memory
> > > > PFN/page-based access.
> > > > 
> > > > Anyway I am not absolutely sure, but still inclined to thinking that
> > > > the problem is in the inaccurate/invalid max_low_pfn value, which
> > > > consequently causes having invalid 'high_memory' variable content.
> > > > Most likely the problem has been caused by the commit a94e4f24ec83
> > > > ("MIPS: init: Drop boot_mem_map"), but it's too complicated to revert.
> > > > So at this stage I would focus on hacking the bootmem_init() method
> > > > defined in arch/mips/kernel/setup.c. As a dirty hack I would try the
> > > > next fixup:
> > > > 
> > > > --- a/arch/mips/kernel/setup.c
> > > > +++ b/arch/mips/kernel/setup.c
> > > >    	if (min_low_pfn >= max_low_pfn)
> > > >    		panic("Incorrect memory mapping !!!");
> > > > +	max_pfn = max_low_pfn = PFN_DOWN(HIGHMEM_START);
> > > >    	if (max_pfn > PFN_DOWN(HIGHMEM_START)) {
> > > >    #ifdef CONFIG_HIGHMEM
> > > >    		highstart_pfn = PFN_DOWN(HIGHMEM_START);
> > > > 
> > > > If it helps then the problem most likely is in the
> > > > max_pfn/min_low_pfn/max_low_pfn setup algorithm implemented in the
> > > > bootmem_init() method. I would think of refactoring it then.
> > > 
> > 
> > > No, still makes no difference. As soon as init runs the warnings start:
> > > 
> > > ...
> > > Freeing unused kernel image (initmem) memory: 288K
> > > This architecture does not have kernel memory protection.
> > > Run /sbin/init as init process
> > > Run /etc/init as init process
> > > Run /bin/init as init process
> > > ------------[ cut here ]------------
> > > WARNING: CPU: 3 PID: 1 at arch/mips/mm/physaddr.c:38 __virt_to_phys+0x50/0x84
> > > virt_to_phys used for non-linear address: (ptrval) (0xbfbd0000)
> > > Modules linked in:
> > > CPU: 3 PID: 1 Comm: init Not tainted 5.17.0-ac0 #8
> > > Stack : 80c20000 7ffd6000 77de7000 80086784 00000000 00000004 00000000 f881894e
> > >          82c41c84 80bf3654 80b20000 80b10000 82c583d8 00000001 82c41c28 82c9bf00
> > >          00000000 00000000 80a64648 82c41a70 00000149 82c41adc 00000000 20306361
> > >          203a6d6d 80bfd185 80bfd1ac 74696e69 80b10000 00000001 82c41d3c 80b1bcb0
> > >          82688040 85257240 80c20000 7ffd6000 00000000 804fc754 0000000c 80bf000c
> > >          ...
> > > Call Trace:
> > > [<80008ed0>] show_stack+0x38/0x118
> > > [<80957c14>] dump_stack_lvl+0x5c/0x7c
> > > [<80951530>] __warn+0xc0/0xf4
> > > [<809515f0>] warn_slowpath_fmt+0x8c/0xb8
> > > [<80025480>] __virt_to_phys+0x50/0x84
> > > [<8000bb30>] arch_setup_additional_pages+0x120/0x230
> > > [<802392a0>] load_elf_binary+0xacc/0x14e0
> > > [<801d67a8>] bprm_execve+0x288/0x5dc
> > > [<801d7260>] kernel_execve+0x130/0x1b4
> > > [<80950384>] try_to_run_init_process+0x14/0x4c
> > > [<8095df18>] kernel_init+0xe4/0x118
> > > [<80003398>] ret_from_kernel_thread+0x14/0x1c
> > > 
> > > ---[ end trace 0000000000000000 ]---
> > 
> > Finally I think I've got it. Your high_memory value still doesn't permit the
> > IO-addresses. It is initialized to support the kseg0 virtual space only.
> > [0x80000000; 0xa0000000) = [CAC_BASE;  CAC_BASE + 512MB): kseg0 - Cached;
> > [0xa0000000; 0xc0000000) = [UCAC_BASE; UCAC_BASE + 512MB]: kseg1 - Uncached;
> > In your case high_memory ~ (0x90000000|0xa0000000) (without and with
> > my last suggestion applied). You keep getting the warning printed because the
> > MIPS GIC virtual base address is 0xbfbd0000 and it belongs to kseg1,
> > which is higher than the defined by the high_memory limit.
> > 
> > So to speak the warning&trace is misleading in this case because you
> > do access the linearly mapped address, but it's just the uncached
> > mirror of the low memory. Most likely using the high_memory variable
> > as the upper limit of the linearly mapped space wasn't quite correct,
> > because the __pa() macro supports both Cached and Uncached addresses
> > thus returning correct physical address for you. (The modification
> > was introduced in commit dfad83cb7193 ("MIPS: Add support for
> > CONFIG_DEBUG_VIRTUAL"), @Florian please join the discussion.) But I
> > currently can't suggest better alternative.
> 
> Let me think about how to best approach being fed both KSEG0 and KSEG1
> virtual addresses into __debug_virt_addr_valid() but I do agree that we need
> to solve this somehow.
> 
> > 
> > Getting back to what you asked in the original email:
> > 
> > > It is trivial to fix this by using __pa() directly here instead of
> > > virt_to_phys(). So simply doing this fixes it:
> > > ...
> > > I am wondering if that is the right approach or if there is a more correct way?
> > 
> > It's OK to use __pa() in this particular case. But in general IMO it
> > would be more useful to fix the __virt_addr_valid() method
> > implementation somehow. At least taking the Uncached addresses into
> > account there would be required.
> 

> In general, we tend to use __pa() for in-kernel symbols that is when you
> access symbols of the kernel image itself which are guaranteed to be within
> the linear mapped range. For register/IO space like here with the GIC, which
> is specially installed into each process' address space, then using
> KSEG1ADDR() + PFN_DOWN() might be more appropriate?

Did you mean something like CPHYSADDR()? Because KSEG1ADDR() is used
to get a virtual address. Moreover the macro isn't portable since it's
MIPS32-specific. So is the CPHYSADDR() macro though (no EVA support).
IMO in this case __pa() is more appropriate because it works for the
64/32-bit archs and 32-bit EVA-capable chips.

-Sergey

> 
> > 
> > In your first email you also said:
> > 
> > > That problem leads to rare and somewhat random
> > > oops that are mostly within vma and generic memory functions (often in
> > > kmem_cache_alloc(), but sometimes other places like unlink_anon_vmas() or
> > > anon_vma_interval_tree_remove() or vma_interval_tree_remove()).
> > 
> > Alas I don't really see how the denoted warning is connected with the
> > random oopses you described, because the warning turn to be
> > misleading. Most likely the oopses are caused by another problem.
> 
> I can understand that you get unwanted/spurious warnings due to the
> __debug_virt_addr_valid() deficiencies with KSEG0/1 virtual addresses,
> however the crashes sound unrelated, unless the warnings being printed
> somehow change the scheduling enough that bugs do creep up as a consequence
> of printing the warnings which would be interesting...
> -- 
> Florian
