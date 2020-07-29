Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92336231B38
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jul 2020 10:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgG2IcC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Jul 2020 04:32:02 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2548 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726707AbgG2IcB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Jul 2020 04:32:01 -0400
Received: from lhreml710-chm.china.huawei.com (unknown [172.18.7.106])
        by Forcepoint Email with ESMTP id 2439AD46260FB3D2AD69;
        Wed, 29 Jul 2020 09:31:58 +0100 (IST)
Received: from localhost (10.52.120.141) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Wed, 29 Jul
 2020 09:31:56 +0100
Date:   Wed, 29 Jul 2020 09:30:31 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mike Rapoport <rppt@kernel.org>
CC:     Andrew Morton <akpm@linux-foundation.org>,
        <linux-sh@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        <linux-mips@vger.kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
        "Paul Mackerras" <paulus@samba.org>, <sparclinux@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
        "Stafford Horne" <shorne@gmail.com>, <linux-s390@vger.kernel.org>,
        <linux-c6x-dev@linux-c6x.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Michael Ellerman <mpe@ellerman.id.au>, <x86@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Mike Rapoport <rppt@linux.ibm.com>,
        <clang-built-linux@googlegroups.com>,
        Ingo Molnar <mingo@redhat.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <uclinux-h8-devel@lists.sourceforge.jp>,
        <linux-xtensa@linux-xtensa.org>, <openrisc@lists.librecores.org>,
        Borislav Petkov <bp@alien8.de>,
        "Andy Lutomirski" <luto@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        <linux-arm-kernel@lists.infradead.org>,
        Michal Simek <monstr@monstr.eu>, <linux-mm@kvack.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <iommu@lists.linux-foundation.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/15] arm64: numa: simplify dummy_numa_init()
Message-ID: <20200729093031.0000316b@Huawei.com>
In-Reply-To: <20200728051153.1590-5-rppt@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
        <20200728051153.1590-5-rppt@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.120.141]
X-ClientProxiedBy: lhreml738-chm.china.huawei.com (10.201.108.188) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 28 Jul 2020 08:11:42 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> dummy_numa_init() loops over memblock.memory and passes nid=0 to
> numa_add_memblk() which essentially wraps memblock_set_node(). However,
> memblock_set_node() can cope with entire memory span itself, so the loop
> over memblock.memory regions is redundant.
> 
> Replace the loop with a single call to memblock_set_node() to the entire
> memory.

Hi Mike,

I had a similar patch I was going to post shortly so can add a bit more
on the advantages of this one.

Beyond cleaning up, it also fixes an issue with a buggy ACPI firmware in which the SRAT
table covers some but not all of the memory in the EFI memory map.  Stealing bits
from the draft cover letter I had for that...

> This issue can be easily triggered by having an SRAT table which fails
> to cover all elements of the EFI memory map.
> 
> This firmware error is detected and a warning printed. e.g.
> "NUMA: Warning: invalid memblk node 64 [mem 0x240000000-0x27fffffff]"
> At that point we fall back to dummy_numa_init().
> 
> However, the failed ACPI init has left us with our memblocks all broken
> up as we split them when trying to assign them to NUMA nodes.
> 
> We then iterate over the memblocks and add them to node 0.
> 
> for_each_memblock(memory, mblk) {
> 	ret = numa_add_memblk(0, mblk->base, mblk->base + mblk->size);
> 	if (!ret)
> 		continue;
> 	pr_err("NUMA init failed\n");
> 	return ret;
> }
> 
> numa_add_memblk() calls memblock_set_node() which merges regions that
> were previously split up during the earlier attempt to add them to different
> nodes during parsing of SRAT.
> 
> This means elements are moved in the memblock array and we can end up
> in a different memblock after the call to numa_add_memblk().
> Result is:
> 
> Unable to handle kernel paging request at virtual address 0000000000003a40
> Mem abort info:
>   ESR = 0x96000004
>   EC = 0x25: DABT (current EL), IL = 32 bits
>   SET = 0, FnV = 0
>   EA = 0, S1PTW = 0
> Data abort info:
>   ISV = 0, ISS = 0x00000004
>   CM = 0, WnR = 0
> [0000000000003a40] user address but active_mm is swapper
> Internal error: Oops: 96000004 [#1] PREEMPT SMP
> 
> ...
> 
> Call trace:
>   sparse_init_nid+0x5c/0x2b0
>   sparse_init+0x138/0x170
>   bootmem_init+0x80/0xe0
>   setup_arch+0x2a0/0x5fc
>   start_kernel+0x8c/0x648
> 
> As an illustrative example:
> EFI table has one block of memory.
> memblks[0] = [0...0x2f]  so we start with a single memblock.
> 
> SRAT has
> [0x00...0x0f] in node 0
> [0x10...0x1f] in node 1
> but no entry covering 
> [0x20...0x2f].
> 
> Whilst parsing SRAT the single memblock is broken into 3.
> memblks[0] = [0x00...0x0f] in node 0
> memblks[1] = [0x10...0x1f] in node 1
> memblks[2] = [0x20...0x2f] in node MAX_NUM_NODES (invalid value)
> 
> A sanity check parse then detects the invalid section and acpi_numa_init
> fails.  We then fall back to the dummy path.
> 
> That iterates over the memblocks.  We'll use i an index in the array of memblocks
> 
> i = 0;
> memblks[0] = [0x00...0x0f] set to node0.
>    merge doesn't do anything because the neighbouring memblock is still in node1.
> 
> i = 1
> memblks[1] = [0x10...0x1f] set to node 0.
>    merge combines memblock 0 and 1 to give a new set of memblocks.
> 
> memblks[0] = [0x00..0x1f] in node 0
> memblks[1] = [0x20..0x2f] in node MAX_NUM_NODES.
> 
> i = 2 off the end of the now reduced array of memblocks, so exit the loop.
> (if we restart the loop here everything will be fine).
> 
> Later sparse_init_nid tries to use the node of the second memblock to index
> somethings and boom.


> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  arch/arm64/mm/numa.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/mm/numa.c b/arch/arm64/mm/numa.c
> index aafcee3e3f7e..0cbdbcc885fb 100644
> --- a/arch/arm64/mm/numa.c
> +++ b/arch/arm64/mm/numa.c
> @@ -423,19 +423,16 @@ static int __init numa_init(int (*init_func)(void))
>   */
>  static int __init dummy_numa_init(void)
>  {
> +	phys_addr_t start = memblock_start_of_DRAM();
> +	phys_addr_t end = memblock_end_of_DRAM();
>  	int ret;
> -	struct memblock_region *mblk;
>  
>  	if (numa_off)
>  		pr_info("NUMA disabled\n"); /* Forced off on command line. */
> -	pr_info("Faking a node at [mem %#018Lx-%#018Lx]\n",
> -		memblock_start_of_DRAM(), memblock_end_of_DRAM() - 1);
> -
> -	for_each_memblock(memory, mblk) {
> -		ret = numa_add_memblk(0, mblk->base, mblk->base + mblk->size);
> -		if (!ret)
> -			continue;
> +	pr_info("Faking a node at [mem %#018Lx-%#018Lx]\n", start, end - 1);
>  
> +	ret = numa_add_memblk(0, start, end);
> +	if (ret) {
>  		pr_err("NUMA init failed\n");
>  		return ret;
>  	}


