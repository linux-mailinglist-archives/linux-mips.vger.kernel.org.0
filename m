Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 358E95687C8
	for <lists+linux-mips@lfdr.de>; Wed,  6 Jul 2022 14:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233205AbiGFMF7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 Jul 2022 08:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233392AbiGFMFy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 Jul 2022 08:05:54 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC0F2A27E
        for <linux-mips@vger.kernel.org>; Wed,  6 Jul 2022 05:05:52 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id bf9so2315456lfb.13
        for <linux-mips@vger.kernel.org>; Wed, 06 Jul 2022 05:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uElaeiyhnnfqd2Hz8PKV7gF8OtwElRD9Lu5VY8G9/ns=;
        b=mLX+pQ/NZ+6L9cOAzm0D5i0HGq1JzFbeKq964aTERrUKODP2bo0g7HZLIfWAXGpmte
         uwWMgu1V7c1jxftH71txwoZ2UJjSnD4QYbCYLST9sEiDvD83ElKZQjoSOCigRLFIQDGL
         VihbhTISBwT2C5GX69hG4oymBzATHclpBpUZSfADIxrDF/DJlNaxhUs+1vtZzn70qFpW
         dIeWrcLZCsoCjAwadcaN39niZq+5dFY9LnO/EXLieiFHHyjIv3BR8Ce+ANOKYVUF2eNE
         VhQO41SMlUuW9oQxZKTybB4eIzHlRRLiMGQF7ERqOcwBwziHa2BBqpAbSUIWyoMpEoLh
         k4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uElaeiyhnnfqd2Hz8PKV7gF8OtwElRD9Lu5VY8G9/ns=;
        b=rtJBJ+4Cgfl1Z5/AkrgHZOSGZP5UXi39o/uhioSz0a0NBL/yU1Td5w+RXCuI9bUo8+
         k4vdH2NB/tJXGi9UFVpUofEZzwBv3BRvZ2QbPmsV2zHfpY4gM+fu9XzBjxxJeBotjY5M
         Ta6Jt2gZKr5YVLFfMBcfrVhGdT/2pLVvB3T4W07jtJPTzkf3mBBSTdvgHChs/6wBQ/E6
         eTFabvU/ZPLdZ3K9MFb2dmN+1Ec/vtDLUkPe99FVoHby4Vw8GCQMvLmE1oPRdvHuVBix
         lKecnQutMr402xTdw27sVSYvxBHsBsC4ph+UbC5LH+OZnv6Np2NN1LnKRh7KImCucAMj
         TbKw==
X-Gm-Message-State: AJIora8p/hjyIZlNZCe1MqZMSe6tqfo5+I2cACINYT6fh1g/6D/FX3Az
        tXRzvgJv4DSTLu5KX+85jUY=
X-Google-Smtp-Source: AGRyM1vB0dgKWLofJoh1UtuFFrFJQLaO+fZcymhEy7OUL1Arpe21YP/37SVsopKHpvSR4p4fR/1UOw==
X-Received: by 2002:ac2:4f11:0:b0:484:bd0f:1ba5 with SMTP id k17-20020ac24f11000000b00484bd0f1ba5mr4151494lfr.489.1657109150350;
        Wed, 06 Jul 2022 05:05:50 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
        by smtp.gmail.com with ESMTPSA id v8-20020ac258e8000000b0047f6d20e424sm6230920lfo.55.2022.07.06.05.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 05:05:49 -0700 (PDT)
Date:   Wed, 6 Jul 2022 15:05:47 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Greg Ungerer <gerg@kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: "virt_to_phys used for non-linear address" warnings
Message-ID: <20220706120547.mat3yhjygqfoyr5s@mobilestation>
References: <1e4f33d7-7eb5-3fb5-e44d-c4652e7cb8c6@kernel.org>
 <20220705174215.qpt3wreiykgw7ert@mobilestation>
 <e635a799-fd11-7417-7a66-0ab10f25581f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e635a799-fd11-7417-7a66-0ab10f25581f@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jul 06, 2022 at 03:47:41PM +1000, Greg Ungerer wrote:
> Hi Serge,
> 
> On 6/7/22 03:42, Serge Semin wrote:
> > !To += Thomas
> > !Cc += Jiaxun
> > 
> > Hi Greg,
> > 
> > On Fri, Jul 01, 2022 at 05:24:22PM +1000, Greg Ungerer wrote:
> > > Hi,
> > > 
> > > I am debugging a strange memory problem on a Mediatek MT7621 SoC based
> > > hardware platform. That problem leads to rare and somewhat random
> > > oops that are mostly within vma and generic memory functions (often in
> > > kmem_cache_alloc(), but sometimes other places like unlink_anon_vmas() or
> > > anon_vma_interval_tree_remove() or vma_interval_tree_remove()).
> > > 
> > > To help track this down I enabled a few of the kernels hacking memory
> > > debug config options. Now this immediately leads to getting this on
> > > every process fork/exec:
> > > 
> > >    ------------[ cut here ]------------
> > >    WARNING: CPU: 0 PID: 1 at arch/mips/mm/physaddr.c:38 __virt_to_phys+0x50/0x84
> > >    virt_to_phys used for non-linear address: c443e370 (0xbfbd0000)
> > >    Modules linked in:
> > >    CPU: 0 PID: 1 Comm: init Not tainted 5.17.0-ac0 #1
> > >    Stack : 81c70000 7ffbd000 77de5000 81086784 00000000 00000004 00000000 d95b60c8
> > >            80441c84 81c43654 81b70000 81b60000 804583d8 00000001 80441c28 8045cd00
> > >            00000000 00000000 81aaf3b4 80441a70 00000187 80441adc 00000000 20306361
> > >            203a6d6d 81c4d2f5 81c4d31c 74696e69 81b60000 00000001 80441d3c 81b6dbf0
> > >            82070040 8066f240 81c70000 7ffbd000 00000000 814ff0f4 00000000 81c40000
> > >            ...
> > >    Call Trace:
> > >    [<81008ed0>] show_stack+0x38/0x118
> > >    [<8198f9e4>] dump_stack_lvl+0x5c/0x7c
> > >    [<81989300>] __warn+0xc0/0xf4
> > >    [<819893c0>] warn_slowpath_fmt+0x8c/0xb8
> > >    [<81025480>] __virt_to_phys+0x50/0x84
> > >    [<8100bb30>] arch_setup_additional_pages+0x120/0x230
> > >    [<81239280>] load_elf_binary+0xacc/0x14e0
> > >    [<811d6788>] bprm_execve+0x288/0x5dc
> > >    [<811d7240>] kernel_execve+0x130/0x1b4
> > >    [<81988154>] try_to_run_init_process+0x14/0x4c
> > >    [<81995e40>] kernel_init+0xe4/0x118
> > >    [<81003398>] ret_from_kernel_thread+0x14/0x1c
> > >    ---[ end trace 0000000000000000 ]---
> > > 
> > > This is caused by this code in arch/mips/kernel/vdso.c, function
> > > arch_setup_additional_pages():
> > > 
> > >          /* Map GIC user page. */
> > >          if (gic_size) {
> > >                  gic_base = (unsigned long)mips_gic_base + MIPS_GIC_USER_OFS;
> > >                  gic_pfn = virt_to_phys((void *)gic_base) >> PAGE_SHIFT;
> > > 
> > >                  ret = io_remap_pfn_range(vma, base, gic_pfn, gic_size,
> > >                                           pgprot_noncached(vma->vm_page_prot));
> > >                  if (ret)
> > >                          goto out;
> > >          }
> > > 
> > 
> > > That virt_to_phys() is being passed a value assigned from an ioremap().
> > > According to the comments in io.h, this is not a correct usage of it:
> > > 
> > >   *     The returned physical address is the physical (CPU) mapping for
> > >   *     the memory address given. It is only valid to use this function on
> > >   *     addresses directly mapped or allocated via kmalloc.
> > 
> > Physical address you are trying to retrieve is directly mapped. It's
> > 0xbfbd0000, which belong to the UCAC kseg1 MIPS space:
> > https://johnloomis.org/microchip/pic32/memory/memory.html
> > So virt_to_phys() shall work for it with no problem.
> 
> Yeah, I can see that in this case it always ended up with the same pfn.
> 
> 
> > Anyway IIUC from the __debug_virt_addr_valid() implementation you've
> > got the "high_memory" variable initialized with inaccurate value. At
> > very least it causes your directly mapped IO-address to cause the
> > warning printed. In some circumstance it may lead to more complex
> > problems. I've got a patch created some time ago, which fixes that
> > misconfiguration. Could you try it out and see whether it solves your
> > problems?
> 

> Tried the patch. Does not fix the issue. Still get the warning and dump
> on every process startup.

It's pity. I was hoping it would work and we wouldn't need to debug the
problem remotely. See my next guess then.

> 
> 
> > Could you also send out a log with "Zone ranges:" info retrieved on
> > the kernel without my patch applied?
> 
> Before patch (original code):
> 
>     Zone ranges:
>       Normal   [mem 0x0000000000000000-0x000000000fffffff]
>     Movable zone start for each node
>     Early memory node ranges
>       node   0: [mem 0x0000000000000000-0x000000000fffffff]
>     Initmem setup node 0 [mem 0x0000000000000000-0x000000000fffffff]

Here is what I can see from the arch code and the info above:
1). Mediatek MT7621 SoC is based on the MIPS32r2 arch revision. So it
supports 32bit kernel with highmem used to access the memory above
HIGHMEM_START = _AC(0x20000000, UL). // 512MB+
Most likely CONFIG_HIGHMEM is enabled in your kernel.
2). Judging by the Zone ranges log above your platform have only 256MB
of memory detected. Thus
max_pfn = 256MB >> PAGE_SHIFT
max_low_pfn = max_pfn (see arch/mips/kernel/setup.c: bootmem_init)
high_memory = (void *) __va(max_low_pfn << PAGE_SHIFT) (see arch/mips/mm/init.c: mem_init())
All of that memory is accessible over the kseg0 segment, which
reflects the directly mapped memory. So no highmem really needed.
That's why there is no highmem zone printed in the log. It also caused
my patch not working for you.
3) There is still IO-memory available in the directly mapped range:
[0x1e000000 0x1fffffff] (arch/mips/boot/dts/ralink/mt7621.dtsi), which
due to too small RAM detected turned to be out of the memory
PFN/page-based access.

Anyway I am not absolutely sure, but still inclined to thinking that
the problem is in the inaccurate/invalid max_low_pfn value, which
consequently causes having invalid 'high_memory' variable content.
Most likely the problem has been caused by the commit a94e4f24ec83
("MIPS: init: Drop boot_mem_map"), but it's too complicated to revert.
So at this stage I would focus on hacking the bootmem_init() method
defined in arch/mips/kernel/setup.c. As a dirty hack I would try the
next fixup:

--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
 	if (min_low_pfn >= max_low_pfn)
 		panic("Incorrect memory mapping !!!");
 
+	max_pfn = max_low_pfn = PFN_DOWN(HIGHMEM_START);
 	if (max_pfn > PFN_DOWN(HIGHMEM_START)) {
 #ifdef CONFIG_HIGHMEM
 		highstart_pfn = PFN_DOWN(HIGHMEM_START);

If it helps then the problem most likely is in the
max_pfn/min_low_pfn/max_low_pfn setup algorithm implemented in the
bootmem_init() method. I would think of refactoring it then.

-Sergey

> 
> Regards
> Greg
> 
> 
> 
> > -Sergey
> > 
> > > 
> > > So the debug warning is consistent with this comment.
> > > 
> > > It is trivial to fix this by using __pa() directly here instead of
> > > virt_to_phys(). So simply doing this fixes it:
> > > 
> > > --- a/arch/mips/kernel/vdso.c
> > > +++ b/arch/mips/kernel/vdso.c
> > > @@ -159,7 +159,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
> > >          /* Map GIC user page. */
> > >          if (gic_size) {
> > >                  gic_base = (unsigned long)mips_gic_base + MIPS_GIC_USER_OFS;
> > > -               gic_pfn = virt_to_phys((void *)gic_base) >> PAGE_SHIFT;
> > > +               gic_pfn = __pa(gic_base) >> PAGE_SHIFT;
> > >                  ret = io_remap_pfn_range(vma, base, gic_pfn, gic_size,
> > >                                           pgprot_noncached(vma->vm_page_prot));
> > > 
> > > I am wondering if that is the right approach or if there is a more correct way?
> > > 
> > > Regards
> > > Greg
> > > 
