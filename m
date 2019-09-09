Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9263EADCFC
	for <lists+linux-mips@lfdr.de>; Mon,  9 Sep 2019 18:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389324AbfIIQWo convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 9 Sep 2019 12:22:44 -0400
Received: from mx2.suse.de ([195.135.220.15]:43210 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389271AbfIIQWo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 9 Sep 2019 12:22:44 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id C41ABACC1;
        Mon,  9 Sep 2019 16:22:42 +0000 (UTC)
Date:   Mon, 9 Sep 2019 18:22:42 +0200
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH] mips: sgi-ip27: switch from DISCONTIGMEM to SPARSEMEM
Message-Id: <20190909182242.c1ef9717d14b20212ef75954@suse.de>
In-Reply-To: <20190906130223.GA17704@rapoport-lnx>
References: <1567662477-27404-1-git-send-email-rppt@kernel.org>
        <20190905152150.f7ff6ef70726085de63df828@suse.de>
        <20190905133251.GA3650@rapoport-lnx>
        <20190905154831.88b7853b47ba7db7bd7626bd@suse.de>
        <20190905154747.GB3650@rapoport-lnx>
        <20190905233800.0f6b3fb3722cde2f5a88663a@suse.de>
        <20190906130223.GA17704@rapoport-lnx>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 6 Sep 2019 16:02:24 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> I suspect that unaligned access comes from __page_to_pfn, can you please
> check what scripts/fadd2line reports for kernel_init_free_pages+0xcc/0x138?

kernel_init_free_pages+0xcc/0x138:
pagefault_disabled_dec at include/linux/uaccess.h:173
(inlined by) pagefault_enable at include/linux/uaccess.h:200
(inlined by) __kunmap_atomic at include/linux/highmem.h:101
(inlined by) clear_highpage at include/linux/highmem.h:215
(inlined by) kernel_init_free_pages at mm/page_alloc.c:1124

While making some sense out of this I booted the system a few times
with the same kernel and I get different crashes (it even booted once
to userspace).

Here a list (decoded with fadd2line)

cache_grow_begin+0x1bc/0x4b8:
__section_mem_map_addr at include/linux/mmzone.h:1263
(inlined by) lowmem_page_address at include/linux/mm.h:1302
(inlined by) alloc_slabmgmt at mm/slab.c:2298
(inlined by) cache_grow_begin at mm/slab.c:2625

kfree+0x90/0x1d0:
__section_mem_map_addr at include/linux/mmzone.h:1263
(inlined by) virt_to_head_page at include/linux/mm.h:751
(inlined by) virt_to_cache at mm/slab.h:408
(inlined by) kfree at mm/slab.c:3748

kfree+0xac/0x1d0:
__read_once_size at include/linux/compiler.h:199
(inlined by) compound_head at include/linux/page-flags.h:174
(inlined by) virt_to_head_page at include/linux/mm.h:753
(inlined by) virt_to_cache at mm/slab.h:408
(inlined by) kfree at mm/slab.c:3748

___cache_free+0x120/0x540:
page_to_nid at include/linux/mm.h:1088
(inlined by) cache_free_alien at mm/slab.c:785
(inlined by) ___cache_free at mm/slab.c:3449

free_block+0xe8/0x2c0:
__read_once_size at include/linux/compiler.h:199
(inlined by) compound_head at include/linux/page-flags.h:174
(inlined by) virt_to_head_page at include/linux/mm.h:753
(inlined by) free_block at mm/slab.c:3342

copy_process+0x254/0x1738:
__section_mem_map_addr at include/linux/mmzone.h:1263
(inlined by) lowmem_page_address at include/linux/mm.h:1302
(inlined by) alloc_thread_stack_node at kernel/fork.c:252
(inlined by) dup_task_struct at kernel/fork.c:855
(inlined by) copy_process at kernel/fork.c:1856

I couldn't make real sense out of this yet, but maybe it gives
a hint for you.

Thomas.

-- 
SUSE Software Solutions Germany GmbH
HRB 247165 (AG München)
Geschäftsführer: Felix Imendörffer
