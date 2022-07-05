Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 898AD5675EB
	for <lists+linux-mips@lfdr.de>; Tue,  5 Jul 2022 19:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233346AbiGERmV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Jul 2022 13:42:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233343AbiGERmV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 5 Jul 2022 13:42:21 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D72F519006
        for <linux-mips@vger.kernel.org>; Tue,  5 Jul 2022 10:42:19 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id z13so21733701lfj.13
        for <linux-mips@vger.kernel.org>; Tue, 05 Jul 2022 10:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uwRSlPMYCc8awJjuBU5BPxPNAO6rDwctsqDv7WPWYlI=;
        b=X8KCIEIv3R/65K8N4Ozo40Au0LpsAUF2PAU+659Th8Ki0M1dxyJDlx2WYiuu9noDNj
         m93jGIuCiawixcvKL1sSDwnnq8ST2bllz7iTiWwWj1bWekDs/f+mDcnVbDazamIVY5OM
         OeVSkZP2PUlVYmGH8uo9fa99PGXFlJ3wf8//hBgLHl84+SKgO4eki0kmIuO/CdEpSzNq
         rINk4WqQQZBleAxm9+LPW7K9XT3ZK8OKQ5AtUD4Cq12vSDiUyzkzrGjNyiSaHkTZE0r1
         shZLiBLvW5t/b62gq3ztP86ecQ06ZRQ0f47XD6wLOCkmtVHt7yCDhWrUZfkj/elNajyU
         QsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uwRSlPMYCc8awJjuBU5BPxPNAO6rDwctsqDv7WPWYlI=;
        b=VcEIGGevvE0t1xQCplQ9SXVEFo2qqAPoR9H+lg4MPC3/psQ80pphEVFvLX3586oBse
         C7Wv184RlE43zOXhWkrwSGD5d7zGjh8NZ2Ur/McXTzbVpmEQliP8za4wSYC9+z6cjPia
         2OaXJBXMjWvu20+sXyJYjjCLMMvp+ZP6WRSqjweb7oYVymC+iHTePRhMNc8YTjF8I+BP
         /2KIMTOK3X+M2yGybr6dSoAPZSeEs5IgcjV5U/DpQW0NKZq5JR4KhvDtB7m0xBw7Dv/X
         1aKK+xQpUKvaRpKjVXC6ILjuTerjLUiZlR8VZyUnZVh0PXYmRsI8yDUnwsysmEmJVK9U
         Aewg==
X-Gm-Message-State: AJIora/VtzIxbIvo4BDewF5v+W2QewtYZ2IWwkxek3HbZo15jUwvgMva
        swEAaDyBqClGvl6iMOETQD8wiRIQcJaw/w==
X-Google-Smtp-Source: AGRyM1szPY/kt8sBQ2OQIYK2L0nkuDWv4RBxUP1H3gjqW5Dl/Cl/1LWdizvEI0Zk9T2jJN2Zel7iZQ==
X-Received: by 2002:a05:6512:340c:b0:47f:a3a8:cb4a with SMTP id i12-20020a056512340c00b0047fa3a8cb4amr22015961lfr.129.1657042938062;
        Tue, 05 Jul 2022 10:42:18 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
        by smtp.gmail.com with ESMTPSA id q5-20020a056512210500b0047f5a2842c4sm5805087lfr.136.2022.07.05.10.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 10:42:17 -0700 (PDT)
Date:   Tue, 5 Jul 2022 20:42:15 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Greg Ungerer <gerg@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: "virt_to_phys used for non-linear address" warnings
Message-ID: <20220705174215.qpt3wreiykgw7ert@mobilestation>
References: <1e4f33d7-7eb5-3fb5-e44d-c4652e7cb8c6@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="fn6y2opvpdphtfek"
Content-Disposition: inline
In-Reply-To: <1e4f33d7-7eb5-3fb5-e44d-c4652e7cb8c6@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--fn6y2opvpdphtfek
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

!To += Thomas
!Cc += Jiaxun

Hi Greg,

On Fri, Jul 01, 2022 at 05:24:22PM +1000, Greg Ungerer wrote:
> Hi,
> 
> I am debugging a strange memory problem on a Mediatek MT7621 SoC based
> hardware platform. That problem leads to rare and somewhat random
> oops that are mostly within vma and generic memory functions (often in
> kmem_cache_alloc(), but sometimes other places like unlink_anon_vmas() or
> anon_vma_interval_tree_remove() or vma_interval_tree_remove()).
> 
> To help track this down I enabled a few of the kernels hacking memory
> debug config options. Now this immediately leads to getting this on
> every process fork/exec:
> 
>   ------------[ cut here ]------------
>   WARNING: CPU: 0 PID: 1 at arch/mips/mm/physaddr.c:38 __virt_to_phys+0x50/0x84
>   virt_to_phys used for non-linear address: c443e370 (0xbfbd0000)
>   Modules linked in:
>   CPU: 0 PID: 1 Comm: init Not tainted 5.17.0-ac0 #1
>   Stack : 81c70000 7ffbd000 77de5000 81086784 00000000 00000004 00000000 d95b60c8
>           80441c84 81c43654 81b70000 81b60000 804583d8 00000001 80441c28 8045cd00
>           00000000 00000000 81aaf3b4 80441a70 00000187 80441adc 00000000 20306361
>           203a6d6d 81c4d2f5 81c4d31c 74696e69 81b60000 00000001 80441d3c 81b6dbf0
>           82070040 8066f240 81c70000 7ffbd000 00000000 814ff0f4 00000000 81c40000
>           ...
>   Call Trace:
>   [<81008ed0>] show_stack+0x38/0x118
>   [<8198f9e4>] dump_stack_lvl+0x5c/0x7c
>   [<81989300>] __warn+0xc0/0xf4
>   [<819893c0>] warn_slowpath_fmt+0x8c/0xb8
>   [<81025480>] __virt_to_phys+0x50/0x84
>   [<8100bb30>] arch_setup_additional_pages+0x120/0x230
>   [<81239280>] load_elf_binary+0xacc/0x14e0
>   [<811d6788>] bprm_execve+0x288/0x5dc
>   [<811d7240>] kernel_execve+0x130/0x1b4
>   [<81988154>] try_to_run_init_process+0x14/0x4c
>   [<81995e40>] kernel_init+0xe4/0x118
>   [<81003398>] ret_from_kernel_thread+0x14/0x1c
>   ---[ end trace 0000000000000000 ]---
> 
> This is caused by this code in arch/mips/kernel/vdso.c, function
> arch_setup_additional_pages():
> 
>         /* Map GIC user page. */
>         if (gic_size) {
>                 gic_base = (unsigned long)mips_gic_base + MIPS_GIC_USER_OFS;
>                 gic_pfn = virt_to_phys((void *)gic_base) >> PAGE_SHIFT;
> 
>                 ret = io_remap_pfn_range(vma, base, gic_pfn, gic_size,
>                                          pgprot_noncached(vma->vm_page_prot));
>                 if (ret)
>                         goto out;
>         }
> 

> That virt_to_phys() is being passed a value assigned from an ioremap().
> According to the comments in io.h, this is not a correct usage of it:
> 
>  *     The returned physical address is the physical (CPU) mapping for
>  *     the memory address given. It is only valid to use this function on
>  *     addresses directly mapped or allocated via kmalloc.

Physical address you are trying to retrieve is directly mapped. It's
0xbfbd0000, which belong to the UCAC kseg1 MIPS space:
https://johnloomis.org/microchip/pic32/memory/memory.html
So virt_to_phys() shall work for it with no problem.

Anyway IIUC from the __debug_virt_addr_valid() implementation you've
got the "high_memory" variable initialized with inaccurate value. At
very least it causes your directly mapped IO-address to cause the
warning printed. In some circumstance it may lead to more complex
problems. I've got a patch created some time ago, which fixes that
misconfiguration. Could you try it out and see whether it solves your
problems?

Could you also send out a log with "Zone ranges:" info retrieved on
the kernel without my patch applied?

-Sergey

> 
> So the debug warning is consistent with this comment.
> 
> It is trivial to fix this by using __pa() directly here instead of
> virt_to_phys(). So simply doing this fixes it:
> 
> --- a/arch/mips/kernel/vdso.c
> +++ b/arch/mips/kernel/vdso.c
> @@ -159,7 +159,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
>         /* Map GIC user page. */
>         if (gic_size) {
>                 gic_base = (unsigned long)mips_gic_base + MIPS_GIC_USER_OFS;
> -               gic_pfn = virt_to_phys((void *)gic_base) >> PAGE_SHIFT;
> +               gic_pfn = __pa(gic_base) >> PAGE_SHIFT;
>                 ret = io_remap_pfn_range(vma, base, gic_pfn, gic_size,
>                                          pgprot_noncached(vma->vm_page_prot));
> 
> I am wondering if that is the right approach or if there is a more correct way?
> 
> Regards
> Greg
> 

--fn6y2opvpdphtfek
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-mips-Fix-incorrect-max_low_pfn-adjustment.patch"

From 723b6b293fa3774114b643eb530b95e7a26a12ab Mon Sep 17 00:00:00 2001
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Date: Fri, 9 Oct 2020 21:34:01 +0300
Subject: [PATCH] mips: Fix incorrect max_low_pfn adjustment

max_low_pfn variable is incorrectly adjusted if the kernel is built with
high memory support and the later is detected in a running system, so the
memory which actually can be directly mapped is getting into the highmem
zone. See the ZONE_NORMAL range on my MIPS32r5 system:

> Zone ranges:
>   DMA      [mem 0x0000000000000000-0x0000000000ffffff]
>   Normal   [mem 0x0000000001000000-0x0000000007ffffff]
>   HighMem  [mem 0x0000000008000000-0x000000020fffffff]

while the zones are supposed to look as follows:

> Zone ranges:
>   DMA      [mem 0x0000000000000000-0x0000000000ffffff]
>   Normal   [mem 0x0000000001000000-0x000000001fffffff]
>   HighMem  [mem 0x0000000020000000-0x000000020fffffff]

Even though the physical memory within the range [0x08000000;0x20000000]
belongs to MMIO on our system, we don't really want it to be considered as
high memory since on MIPS32 that range still can be directly mapped.

Note there might be other problems caused by the max_low_pfn variable
misconfiguration. For instance high_memory variable is initialize with
virtual address corresponding to the max_low_pfn PFN, and by design it
must define the upper bound on direct map memory, then end of the normal
zone. That in its turn potentially may cause problems in accessing the
memory by means of the /dev/mem and /dev/kmem devices.

Let's fix the discovered misconfiguration then. It turns out the commit
a94e4f24ec83 ("MIPS: init: Drop boot_mem_map") didn't introduce the
max_low_pfn adjustment quite correct. If the kernel is built with high
memory support and the system is equipped with high memory, the
max_low_pfn variable will need to be initialized with PFN of the most
upper directly reachable memory address so the zone normal would be
correctly setup. On MIPS that PFN corresponds to PFN_DOWN(HIGHMEM_START).
If the system is built with no high memory support and one is detected in
the running system, we'll just need to adjust the max_pfn variable to
discard the found high memory from the system and leave the max_low_pfn as
is, since the later will be less than PFN_DOWN(HIGHMEM_START) anyway by
design of the for_each_memblock() loop performed a bit early in the
bootmem_init() method.

Fixes: a94e4f24ec83 ("MIPS: init: Drop boot_mem_map")
Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 arch/mips/kernel/setup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 2ca156a5b231..5a9039e8ca41 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -323,10 +323,10 @@ static void __init bootmem_init(void)
 
 	if (max_pfn > PFN_DOWN(HIGHMEM_START)) {
 #ifdef CONFIG_HIGHMEM
-		highstart_pfn = PFN_DOWN(HIGHMEM_START);
+		max_low_pfn = PFN_DOWN(HIGHMEM_START);
+		highstart_pfn = max_low_pfn;
 		highend_pfn = max_pfn;
 #else
-		max_low_pfn = PFN_DOWN(HIGHMEM_START);
 		max_pfn = max_low_pfn;
 #endif
 	}
-- 
2.35.1


--fn6y2opvpdphtfek--
