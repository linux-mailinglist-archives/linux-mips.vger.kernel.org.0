Return-Path: <linux-mips+bounces-1050-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDFA8387FB
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jan 2024 08:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D036B282710
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jan 2024 07:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FBC53E35;
	Tue, 23 Jan 2024 07:34:40 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875AD524A5;
	Tue, 23 Jan 2024 07:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705995280; cv=none; b=AsrR2G/0Zzl60ajYpgrLqdR25fXmlCHPG+5AkyO3c3phYEjMj9y7ppBSJwcSwDfxZ+6ah2eRukqEkNwUF3f47wm09tAYlQgQ6WHoZSVW8z99OjZBUT/B3/xrh5/x3xiebtzo8Kq4i5b6ZytFUfaIb3Koewsy6CZ2izUGrPci8GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705995280; c=relaxed/simple;
	bh=rJD71ycdK+4ItTSlLNtu7v1YBXs+sHOrDMS3lq1DmnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yg0Kz2yeJBkr+1T+OnpcbNEqSAdMpytocPlepS0TPzq7wFAlanivCjpR6/Pu/g82r857PTRI6VnNfcPcYPTnyamZjKvYcjy1ruhm2NkcY/1tGRV66aMpJF/a6nXYomFIwEptX7fMgLdM4QFP9bam8dB1KlIQYU+TPpZ/wcuCVYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8AxjuuuhadlPBUBAA--.5127S3;
	Wed, 17 Jan 2024 15:45:50 +0800 (CST)
Received: from Board-3A3000 (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxF82qhadlsg8GAA--.676S2;
	Wed, 17 Jan 2024 15:45:48 +0800 (CST)
Date: Wed, 17 Jan 2024 15:45:46 +0800
From: Huang Pei <huangpei@loongson.cn>
To: Mike Rapoport <rppt@kernel.org>
Cc: Yajun Deng <yajun.deng@linux.dev>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mm@kvack.org,
	Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org,
	Paul Burton <paulburton@kernel.org>,
	Li Xuefeng <lixuefeng@loongson.cn>,
	Yang Tiezhu <yangtiezhu@loongson.cn>,
	Gao Juxin <gaojuxin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org
Subject: Re: memblock_reserve for unadded region (was: [PATCH] MIPS:
 loongson64: fix boot failure)
Message-ID: <20240117074546.gm7lejjt7whjtwgr@Board-3A3000>
References: <20231225093025.23215-1-huangpei@loongson.cn>
 <731134fd-4b3d-418c-84ee-80646bffcc01@flygoat.com>
 <ZaZAqMwuql9Y5Gra@kernel.org>
 <20240116122304.qwzy7san2vgspt2x@Board-3A3000>
 <3fc2f75e-d163-1ad1-009a-0e4538011885@linux.dev>
 <20240117030113.gs2fjs6vydthsc6l@Board-3A3000>
 <234ddaeb-5988-858d-6ba1-0fef90fb7a87@linux.dev>
 <20240117035910.453ofvotbvkzje6k@Board-3A3000>
 <Zad3ynuuu8S-51eI@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zad3ynuuu8S-51eI@kernel.org>
X-CM-TRANSID:AQAAf8BxF82qhadlsg8GAA--.676S2
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWfJr18XFyDur1kGr15Xr4kXwc_yoWDAr17pr
	1fJF17CrW8Jr18Jr4Utr15Gr1jyw1Yk3WUXr1DJr18Xr1qkr13Xr18Xr10gryDJrW8JF12
	qr1UJr12vw1UAwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8uc_3UUUUU==
X-Gw-Check: 3048a62aa90648ec

On Wed, Jan 17, 2024 at 08:46:34AM +0200, Mike Rapoport wrote:
> On Wed, Jan 17, 2024 at 11:59:10AM +0800, Huang Pei wrote:
> > On Wed, Jan 17, 2024 at 11:17:18AM +0800, Yajun Deng wrote:
> > > 
> > > On 2024/1/17 11:01, Huang Pei wrote:
> > > > On Wed, Jan 17, 2024 at 10:20:00AM +0800, Yajun Deng wrote:
> > > > > On 2024/1/16 20:23, Huang Pei wrote:
> > > > > > On Tue, Jan 16, 2024 at 10:39:04AM +0200, Mike Rapoport wrote:
> > > > > > > On Mon, Jan 15, 2024 at 02:08:21PM +0000, Jiaxun Yang wrote:
> > > > > > > > Hi mm folks,
> > > > > > > > 
> > > > > > > > Just a quick question, what is the expected behavior of memblock_reserve
> > > > > > > > a region that is not added to memblock with memblock_add?
> > > > > > > > 
> > > > > > > > I'm unable to find any documentation about memblock_reserve in comments and
> > > > > > > > boot-time-mm, but as per my understanding to the code, this should be a
> > > > > > > > legit usage?
> > > > > > > Yes, memblock allows reserving memory that was not added to memblock with
> > > > > > > memblock_add().
> > > > > > I think arch/platform specific code should fix this bug, like,
> > > > > > --------------------------------------------------------------------------
> > > > > > //for loongson64
> > > > > > memblock_set_node(0, 1ULL << 44, &memblock.reserved, 0);
> > > > > > 
> > > > > > --------------------------------------------------------------------------
> > > > > > 
> > > > > > or maybe memblock provide something like memblock_reserve_node
> > > > > Hi pei,
> > > > > 
> > > > > Can you test the following patch to see if it fixes this bug?
> > > > > 
> > > > > diff --git a/mm/mm_init.c b/mm/mm_init.c
> > > > > index 2c19f5515e36..97721d99fdce 100644
> > > > > --- a/mm/mm_init.c
> > > > > +++ b/mm/mm_init.c
> > > > > @@ -708,6 +708,9 @@ static void __meminit init_reserved_page(unsigned long
> > > > > pfn, int nid)
> > > > >          pg_data_t *pgdat;
> > > > >          int zid;
> > > > > 
> > > > > +       if (unlikely(nid == NUMA_NO_NODE || nid >= MAX_NUMNODES))
> > > > > +               nid = early_pfn_to_nid(pfn);
> > > > > +
> > > > >          if (early_page_initialised(pfn, nid))
> > > > >                  return;
> 
> IMO this will fix the bug. Before 61167ad5fecd we had nid = first_online_node
> for reserved pages that didn't have nid set in memblock.reserved. After
> 61167ad5fecd we try to initialize these pages with MAX_NUMNODES and
> obviously crash when accessing node structure.
> 
> I think that the check for a valid nid should be moved to
> memmap_init_reserved_pages() though. An entire reserved region will have
> nid set to MAX_NUMNODES, so there is no point to check every page in it.
> 
> > > > I do not think this fix set the right nid, ONLY arch/platform know that
> > > > nid
> 
> Why does it matter to have the right nid in a reserved page that is not
> part of usable memory?
> 
IMO, if a reserved page DO have a valid nid, and archs knows that, archs
should set it right, and this is just the case of loongson64(and
loongarch).

> That's true that only arch knows on which node those reserved pages are,
> but core mm does not care about reserved pages that are not in memory.
>  
> > > >   int __meminit early_pfn_to_nid(unsigned long pfn)
> > > > {
> > > > 	static DEFINE_SPINLOCK(early_pfn_lock);
> > > > 	int nid;
> > > > 
> > > > 	spin_lock(&early_pfn_lock);
> > > > 	nid = __early_pfn_to_nid(pfn,
> > > > 			&early_pfnnid_cache);
> > > > 	if (nid < 0)
> > > > 	//!!!first_online_node MAY NOT be the node the pfn belong to!!!
> > > > 		nid = first_online_node;
> > > > 
> > > > 	spin_unlock(&early_pfn_lock);
> > > > 
> > > > 	return
> > > > 		nid;
> > > > }
> > > 
> > > 
> > > Okay, I don't think this bug is caused by commit 61167ad5fecd ("mm: pass nid
> > > to reserve_bootmem_region()"),
> > > 
> > > because even if you revert this commit, it will still get nid by
> > > early_pfn_to_nid(). Did I get that right?
> > 
> > Yes, more accurately, this bug is exposed by commit 61167ad5fecd. My
> > previous fix is based on presumptions that memory_reserve should reserve memory 
> > added by memblock_add{,_node}, if going across this limitation, there need
> > to set the valid nid for reserved memory region.
> > > 
> > > > > 
> > > > > > > > In practical we run into uninitialized nid of reserved block problem, should
> > > > > > > > we fix it
> > > > > > > > in our usage, or on memblock side?
> > > > > > > Apparently it's a bug in memblock :(
> > > > > > > 
> > > > > > > If you revert 61167ad5fecd ("mm: pass nid to reserve_bootmem_region()")
> > > > > > > does the issue disappear?
> > > > > > Yes, I git bisect this commit.
> > > > > > 
> > > > > > But I don't think it is a bug in memblock. IMO, memblock_reserve under
> > > > > > NUMA set nid of reserved region to MAX_NUMNODES, which is the point
> > > > > > that cause the "memblock_get_region_node from memmap_init_reserved_pages "
> > > > > > passing a invalid node id(aka MAX_NUMNODES) to "reserver_bootmem_region
> > > > > > -> init_reserved_page -> early_pfn_to_nid". If arch-specific code DOES NOT
> > > > > > initialize the nid of reserved region(only it know that), or the reserved
> > > > > > region NOT within a memblock added by memblock_add, memblock can not
> > > > > > give a valid node id to the reserved region. Commit 61167ad5fecd ("mm: pass nid to
> > > > > > reserve_bootmem_region()") just reveals the embarrassment case by an
> > > > > > out of bound memory access.
> > > > > > 
> > > > > > > > Thanks
> > > > > > > > 
> > > > > > > > 在 2023/12/25 09:30, Huang Pei 写道:
> > > > > > > > > Since commit 61167ad5fecd("mm: pass nid to reserve_bootmem_region()),
> > > > > > > > > loongson64 booting failed with CONFIG_DEFERRED_STRUCT_PAGE_INIT like
> > > > > > > > > this:
> > > > > > > > > ----------------------------------------------------------------------
> > > > > > > > >     Call Trace:
> > > > > > > > >     [<ffffffff8235d088>] reserve_bootmem_region+0xa8/0x184
> > > > > > > > >     [<ffffffff82333940>] memblock_free_all+0x104/0x2a8
> > > > > > > > >     [<ffffffff8231d8e4>] mem_init+0x84/0x94
> > > > > > > > >     [<ffffffff82330958>] mm_core_init+0xf8/0x308
> > > > > > > > >     [<ffffffff82318c38>] start_kernel+0x43c/0x86c
> > > > > > > > > 
> > > > > > > > >     Code: 10400028  2402fff0  de420000 <dc432880> 0203182b 14600022
> > > > > > > > >     64420070  00003025  24040003
> > > > > > > > > 
> > > > > > > > >     ---[ end trace 0000000000000000 ]---
> > > > > > > > >     Kernel panic - not syncing: Attempted to kill the idle task!
> > > > > > > > >     ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---
> > > > > > > > > ----------------------------------------------------------------------
> > > > > > > > > 
> > > > > > > > > The root cause is no memory region "0x0-0x1fffff" paired with
> > > > > > > > > memory-reserved region "0x0-0x1fffff" and "0x0-0xfff", with "memblock
> > > > > > > > > =debug":
> > > > > > > > > 
> > > > > > > > > ----------------------------------------------------------------------
> > > > > > > > >      memory[0x0]     [0x0000000000200000-0x000000000effffff],
> > > > > > > > >      0x000000000ee00000 bytes on node 0 flags: 0x0 !!!!here
> > > > > > > > >      memory[0x1]     [0x0000000090000000-0x00000000fdffffff],
> > > > > > > > >      0x000000006e000000 bytes on node 0 flags: 0x0
> > > > > > > > >      memory[0x2]     [0x0000000100000000-0x000000027fffffff],
> > > > > > > > >      0x0000000180000000 bytes on node 0 flags: 0x0
> > > > > > > > >      memory[0x3]     [0x0000100000000000-0x000010000fffffff],
> > > > > > > > >      0x0000000010000000 bytes on node 1 flags: 0x0
> > > > > > > > >      memory[0x4]     [0x0000100090000000-0x000010027fffffff],
> > > > > > > > >      0x00000001f0000000 bytes on node 1 flags: 0x0
> > > > > > > > >      reserved.cnt  = 0x1f
> > > > > > > > >      reserved[0x0]   [0x0000000000000000-0x000000000190c80a],
> > > > > > > > >      0x000000000190c80b bytes flags: 0x0 !!!!oops 0x0-0x1fffff not in memory[0]
> > > > > > > > >      reserved[0x1]   [0x000000000190c810-0x000000000190eea3],
> > > > > > > > >      0x0000000000002694 bytes flags: 0x0
> > > > > > > > > ----------------------------------------------------------------------
> > > > > > > > > 
> > > > > > > > > It caused memory-reserved region "0x0-0x1fffff" without valid node id
> > > > > > > > > in "memblock_get_region_node" from "memmap_init_reserved_pages", lead to
> > > > > > > > > "reserve_bootmem_region-> init_reserved_page -> early_pfn_to_nid()"
> > > > > > > > > accessing "node_data" out of bound.
> > > > > > > > > 
> > > > > > > > > To fix this bug, we should remove unnecessary memory block reservation.
> > > > > > > > > 
> > > > > > > > > +. no need to reserve 0x0-0x1fffff below kernel loading address, since
> > > > > > > > > it is not registered by "memblock_add_node"
> > > > > > > > > 
> > > > > > > > > +. no need to reserve 0x0-0xfff for exception handling if it is not
> > > > > > > > > registered by "memblock_add" either.
> > > > > > > > > 
> > > > > > > > > Fixes: commit 61167ad5fecd("mm: pass nid to reserve_bootmem_region())
> > > > > > > > > Signed-off-by: Huang Pei <huangpei@loongson.cn>
> > > > > > > > > ---
> > > > > > > > >     arch/mips/kernel/traps.c    | 3 ++-
> > > > > > > > >     arch/mips/loongson64/numa.c | 2 --
> > > > > > > > >     2 files changed, 2 insertions(+), 3 deletions(-)
> > > > > > > > > 
> > > > > > > > > diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> > > > > > > > > index 246c6a6b0261..9b632b4c10c3 100644
> > > > > > > > > --- a/arch/mips/kernel/traps.c
> > > > > > > > > +++ b/arch/mips/kernel/traps.c
> > > > > > > > > @@ -2007,7 +2007,8 @@ unsigned long vi_handlers[64];
> > > > > > > > >     void reserve_exception_space(phys_addr_t addr, unsigned long size)
> > > > > > > > >     {
> > > > > > > > > -	memblock_reserve(addr, size);
> > > > > > > > > +	if(memblock_is_region_memory(addr, size))
> > > > > > > > > +		memblock_reserve(addr, size);
> > > > > > > > >     }
> > > > > > > > >     void __init *set_except_vector(int n, void *addr)
> > > > > > > > > diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
> > > > > > > > > index 8f61e93c0c5b..0f516dde81da 100644
> > > > > > > > > --- a/arch/mips/loongson64/numa.c
> > > > > > > > > +++ b/arch/mips/loongson64/numa.c
> > > > > > > > > @@ -130,8 +130,6 @@ static void __init node_mem_init(unsigned int node)
> > > > > > > > >     			memblock_reserve((node_addrspace_offset | 0xfe000000),
> > > > > > > > >     					 32 << 20);
> > > > > > > > > -		/* Reserve pfn range 0~node[0]->node_start_pfn */
> > > > > > > > > -		memblock_reserve(0, PAGE_SIZE * start_pfn);
> > > > > > > > >     	}
> > > > > > > > >     }
> > > > > > > > -- 
> > > > > > > > ---
> > > > > > > > Jiaxun Yang
> > > > > > > > 
> > > > > > > -- 
> > > > > > > Sincerely yours,
> > > > > > > Mike.
> > 
> 
> -- 
> Sincerely yours,
> Mike.


