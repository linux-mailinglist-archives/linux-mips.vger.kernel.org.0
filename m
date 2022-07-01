Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADC80562C86
	for <lists+linux-mips@lfdr.de>; Fri,  1 Jul 2022 09:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbiGAHY2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 Jul 2022 03:24:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231218AbiGAHY1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 Jul 2022 03:24:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F6143150C
        for <linux-mips@vger.kernel.org>; Fri,  1 Jul 2022 00:24:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 10214623D0
        for <linux-mips@vger.kernel.org>; Fri,  1 Jul 2022 07:24:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AE74C3411E
        for <linux-mips@vger.kernel.org>; Fri,  1 Jul 2022 07:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656660265;
        bh=r4hdj4HNnrq5lepz0SJaxw/+hMkDEcoq8ASRg/mFgRo=;
        h=Date:To:From:Subject:From;
        b=glnZX74yVBPfXvZoafk1OPTwToHO0k/mNtVLU6lS7RZm1Tcf1EZcQcvNku6X2fHQt
         yKWgVEqQPBozZcKHi+w1wov8CrXf9C7fFUGbT4g24pu4DQlRe0O1RYeQ8kbCDVteMm
         giCniawg/d5JL7FoYL1B8+oj9YyNmIz72qmKXbhRuX3szOYGjJgubkFHL+UpC9HxYs
         QfoXghAyOMag4h8iT7NjsiP3gfwnDXWqRbxahM3i9Ak57Uvq+xUBdY4fUr5+T7bZSw
         /Wdk6b+WkrrIKKxTRS4AzkNK1Ls+WXbmzTYabW7tkjU9TL0TYDu3A1oZFm2Nb89Zql
         iGMSInVYyuLHQ==
Message-ID: <1e4f33d7-7eb5-3fb5-e44d-c4652e7cb8c6@kernel.org>
Date:   Fri, 1 Jul 2022 17:24:22 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To:     "open list:MIPS" <linux-mips@vger.kernel.org>
From:   Greg Ungerer <gerg@kernel.org>
Subject: "virt_to_phys used for non-linear address" warnings
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

I am debugging a strange memory problem on a Mediatek MT7621 SoC based
hardware platform. That problem leads to rare and somewhat random
oops that are mostly within vma and generic memory functions (often in
kmem_cache_alloc(), but sometimes other places like unlink_anon_vmas() or
anon_vma_interval_tree_remove() or vma_interval_tree_remove()).

To help track this down I enabled a few of the kernels hacking memory
debug config options. Now this immediately leads to getting this on
every process fork/exec:

   ------------[ cut here ]------------
   WARNING: CPU: 0 PID: 1 at arch/mips/mm/physaddr.c:38 __virt_to_phys+0x50/0x84
   virt_to_phys used for non-linear address: c443e370 (0xbfbd0000)
   Modules linked in:
   CPU: 0 PID: 1 Comm: init Not tainted 5.17.0-ac0 #1
   Stack : 81c70000 7ffbd000 77de5000 81086784 00000000 00000004 00000000 d95b60c8
           80441c84 81c43654 81b70000 81b60000 804583d8 00000001 80441c28 8045cd00
           00000000 00000000 81aaf3b4 80441a70 00000187 80441adc 00000000 20306361
           203a6d6d 81c4d2f5 81c4d31c 74696e69 81b60000 00000001 80441d3c 81b6dbf0
           82070040 8066f240 81c70000 7ffbd000 00000000 814ff0f4 00000000 81c40000
           ...
   Call Trace:
   [<81008ed0>] show_stack+0x38/0x118
   [<8198f9e4>] dump_stack_lvl+0x5c/0x7c
   [<81989300>] __warn+0xc0/0xf4
   [<819893c0>] warn_slowpath_fmt+0x8c/0xb8
   [<81025480>] __virt_to_phys+0x50/0x84
   [<8100bb30>] arch_setup_additional_pages+0x120/0x230
   [<81239280>] load_elf_binary+0xacc/0x14e0
   [<811d6788>] bprm_execve+0x288/0x5dc
   [<811d7240>] kernel_execve+0x130/0x1b4
   [<81988154>] try_to_run_init_process+0x14/0x4c
   [<81995e40>] kernel_init+0xe4/0x118
   [<81003398>] ret_from_kernel_thread+0x14/0x1c
   
   ---[ end trace 0000000000000000 ]---

This is caused by this code in arch/mips/kernel/vdso.c, function
arch_setup_additional_pages():

         /* Map GIC user page. */
         if (gic_size) {
                 gic_base = (unsigned long)mips_gic_base + MIPS_GIC_USER_OFS;
                 gic_pfn = virt_to_phys((void *)gic_base) >> PAGE_SHIFT;

                 ret = io_remap_pfn_range(vma, base, gic_pfn, gic_size,
                                          pgprot_noncached(vma->vm_page_prot));
                 if (ret)
                         goto out;
         }

That virt_to_phys() is being passed a value assigned from an ioremap().
According to the comments in io.h, this is not a correct usage of it:

  *     The returned physical address is the physical (CPU) mapping for
  *     the memory address given. It is only valid to use this function on
  *     addresses directly mapped or allocated via kmalloc.

So the debug warning is consistent with this comment.

It is trivial to fix this by using __pa() directly here instead of
virt_to_phys(). So simply doing this fixes it:

--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -159,7 +159,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
         /* Map GIC user page. */
         if (gic_size) {
                 gic_base = (unsigned long)mips_gic_base + MIPS_GIC_USER_OFS;
-               gic_pfn = virt_to_phys((void *)gic_base) >> PAGE_SHIFT;
+               gic_pfn = __pa(gic_base) >> PAGE_SHIFT;
  
                 ret = io_remap_pfn_range(vma, base, gic_pfn, gic_size,
                                          pgprot_noncached(vma->vm_page_prot));

I am wondering if that is the right approach or if there is a more correct way?

Regards
Greg

