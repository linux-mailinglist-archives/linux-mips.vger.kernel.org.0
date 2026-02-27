Return-Path: <linux-mips+bounces-13291-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNaWJCkAoml4yAQAu9opvQ
	(envelope-from <linux-mips+bounces-13291-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 21:35:53 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FD41BDB41
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 21:35:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09BE7307E879
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 20:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ECCF4779AE;
	Fri, 27 Feb 2026 20:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kyuHOhzj"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49BD33EAED;
	Fri, 27 Feb 2026 20:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772224318; cv=none; b=B/xLCtjSu+XF7VLuCkFD6d0FXlJB/9LOlLP52iQUGuqMi+tNwZGAyho1r94t12u+hy4m3FbUsK6w+jn5yFkp6KddCd/trN5H5rcDmMb/ngjyjx61eZaRMJupLh0eGv0w87M0b/YhnySOyUdI7xFNaFA88IE5/NenuAB8X364KsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772224318; c=relaxed/simple;
	bh=GsGJcM5lC5dbmgIT+M4WfJsd6FtHP9AI7W3MvjVlZXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4KjkuVhyCzvwrdPRo3ZSH5DgXBLULgKS/pfjfs2aqKZGmOPclkPmWPY8Nsk6oHgrlPkcfYOfidiAbYVVx3S4mrhzCM8TrhAaCNUJZiGsDV7LPMagUVrzafwpXTjiTr9zmcJokkxsQzWYOYODi3cBKgHGgoyvIXW+IaphhFuRcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kyuHOhzj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96BD0C116C6;
	Fri, 27 Feb 2026 20:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772224318;
	bh=GsGJcM5lC5dbmgIT+M4WfJsd6FtHP9AI7W3MvjVlZXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kyuHOhzjPeaL9ZBX8v9BFk4Vl1+Z8aFaC9olyQsYhW+BEPn4gG+OirqiS0vjY7wSh
	 08AMVtHAdfLIukZECBbxqF78N9qGu5FW8Bt5tRmyiQAQYFEw5wxcQuuzR9pqH6WqJw
	 r3wShM1wgJAs/WfWXNGcQSjs2IlTlepCJqMP4x/V5zu2VMrV5sMU8NMr+KOPjW/OyS
	 itN52VkP0EjHt7tbTWQfjPdKlfT5854ZDrWUbFljsH2eAU+gk+L6ltqkFxDegpDUJq
	 GyMKzPup//vrXRRmPfxpL1HVKDjePjl8VyB6YHiKhoq6Y49SPP4z4wQTNnR2bzJ/f2
	 3gdeO5LHu2EBQ==
Date: Fri, 27 Feb 2026 22:31:41 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alex Shi <alexs@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Klara Modin <klarasmodin@gmail.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>, x86@kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org
Subject: Re: [PATCH v3 23/29] arch, mm: consolidate initialization of nodes,
 zones and memory map
Message-ID: <aaH_LVnl8FlERA_r@kernel.org>
References: <20260111082105.290734-1-rppt@kernel.org>
 <20260111082105.290734-24-rppt@kernel.org>
 <b9527ed4-7a5c-42e9-8814-b276b3741f63@suse.cz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9527ed4-7a5c-42e9-8814-b276b3741f63@suse.cz>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,linux.ibm.com,gaisler.com,alien8.de,arm.com,davemloft.net,linux.intel.com,linux-m68k.org,gmx.de,redhat.com,sipsolutions.net,physik.fu-berlin.de,lwn.net,gmail.com,oracle.com,ellerman.id.au,suse.com,monstr.eu,linux.dev,suse.de,dabbelt.com,nod.at,armlinux.org.uk,google.com,alpha.franken.de,linutronix.de,vger.kernel.org,lists.infradead.org,lists.linux-m68k.org,kvack.org,lists.ozlabs.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-13291-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[66];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qemu.org:url]
X-Rspamd-Queue-Id: 37FD41BDB41
X-Rspamd-Action: no action

Hi Vlastimil,

On Fri, Feb 27, 2026 at 04:14:42PM +0100, Vlastimil Babka wrote:
> On 1/11/26 09:20, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > To initialize node, zone and memory map data structures every architecture
> > calls free_area_init() during setup_arch() and passes it an array of zone
> > limits.
> > 
> > Beside code duplication it creates "interesting" ordering cases between
> > allocation and initialization of hugetlb and the memory map. Some
> > architectures allocate hugetlb pages very early in setup_arch() in certain
> > cases, some only create hugetlb CMA areas in setup_arch() and sometimes
> > hugetlb allocations happen mm_core_init().
> > 
> > With arch_zone_limits_init() helper available now on all architectures it
> > is no longer necessary to call free_area_init() from architecture setup
> > code. Rather core MM initialization can call arch_zone_limits_init() in a
> > single place.
> > 
> > This allows to unify ordering of hugetlb vs memory map allocation and
> > initialization.
> > 
> > Remove the call to free_area_init() from architecture specific code and
> > place it in a new mm_core_init_early() function that is called immediately
> > after setup_arch().
> > 
> > After this refactoring it is possible to consolidate hugetlb allocations
> > and eliminate differences in ordering of hugetlb and memory map
> > initialization among different architectures.
> > 
> > As the first step of this consolidation move hugetlb_bootmem_alloc() to
> > mm_core_early_init().
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> I've bisected a problem with virtme-ng testing a NUMA memoryless
> node setup (on x86_64) to this patch (commit d49004c5f0c1).
> 
> It's executed like this, where node 0 has memory and node 1 only cpus:
> 
> vng -vr . -p 8 -m 4G --numa 4G,cpus=0-3 --numa 0,cpus=4-7
> 
> This fails to boot due to:
> 
> [    0.095894] BUG: unable to handle page fault for address: 0000000000004620
> [    0.097196] #PF: supervisor read access in kernel mode
> [    0.098180] #PF: error_code(0x0000) - not-present page
> [    0.099155] PGD 0 P4D 0 
> [    0.099641] Oops: Oops: 0000 [#1] SMP NOPTI
> [    0.100437] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.19.0-rc6-00152-gf206359553c9 #53 PREEMPT 
> [    0.102201] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.17.0-2-g4f253b9b-prebuilt.qemu.org 04/01/2014
> [    0.104313] RIP: 0010:mm_core_init_early+0x263/0x900
> [    0.105271] Code: 93 ff 72 09 8b 7c 24 30 e8 da 82 00 00 48 63 44 24 30 45 31 db 4c 8b 24 c5 a0 7b 1d 9a 48 89 c3 4c 89 5c 24 50 4c 89 5c 24 58 <41> 83 bc 24 20 46 00 00 00 75 0b 41 83 bc 24 14 47 00 00 00 74 04
> [    0.108863] RSP: 0000:ffffffff99403e38 EFLAGS: 00010046
> [    0.109861] RAX: 0000000000000001 RBX: 0000000000000001 RCX: 0000000000000001
> [    0.111223] RDX: 0000000000000040 RSI: 0000000000100000 RDI: ffff89597fffae00
> [    0.112577] RBP: 0000000000000005 R08: 0000000000000000 R09: ffff89597fffa200
> [    0.113924] R10: 80000000ffffe000 R11: 0000000000000000 R12: 0000000000000000
> [    0.115294] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> [    0.116656] FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
> [    0.118193] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.119283] CR2: 0000000000004620 CR3: 0000000060048000 CR4: 00000000000000b0
> [    0.120645] Call Trace:
> [    0.121122]  <TASK>
> [    0.121521]  start_kernel+0x5d/0x780
> [    0.122206]  x86_64_start_reservations+0x24/0x30
> [    0.123079]  x86_64_start_kernel+0xd1/0xe0
> [    0.123860]  common_startup_64+0x12c/0x138
> [    0.124641]  </TASK>
> [    0.125061] Modules linked in:
> [    0.125646] CR2: 0000000000004620
> [    0.126279] ---[ end trace 0000000000000000 ]---
> [    0.127162] RIP: 0010:mm_core_init_early+0x263/0x900
> [    0.128106] Code: 93 ff 72 09 8b 7c 24 30 e8 da 82 00 00 48 63 44 24 30 45 31 db 4c 8b 24 c5 a0 7b 1d 9a 48 89 c3 4c 89 5c 24 50 4c 89 5c 24 58 <41> 83 bc 24 20 46 00 00 00 75 0b 41 83 bc 24 14 47 00 00 00 74 04
> [    0.131676] RSP: 0000:ffffffff99403e38 EFLAGS: 00010046
> [    0.132684] RAX: 0000000000000001 RBX: 0000000000000001 RCX: 0000000000000001
> [    0.134033] RDX: 0000000000000040 RSI: 0000000000100000 RDI: ffff89597fffae00
> [    0.135412] RBP: 0000000000000005 R08: 0000000000000000 R09: ffff89597fffa200
> [    0.136763] R10: 80000000ffffe000 R11: 0000000000000000 R12: 0000000000000000
> [    0.138112] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> [    0.139487] FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
> [    0.141014] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.142094] CR2: 0000000000004620 CR3: 0000000060048000 CR4: 00000000000000b0
> [    0.143448] Kernel panic - not syncing: Attempted to kill the idle task!
> [    0.144833] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---
> 
> > ./scripts/faddr2line vmlinux mm_core_init_early+0x263/0x900
> mm_core_init_early+0x263/0x900:
> free_area_init_node at mm/mm_init.c:1721
> (inlined by) free_area_init at mm/mm_init.c:1902
> (inlined by) mm_core_init_early at mm/mm_init.c:2681
> 
> It crashes at WARN_ON(pgdat->nr_zones || pgdat->kswapd_highest_zoneidx);
> because pgdat is NULL.
> 
> With some debug printk's I've figured out that in free_area_init()
> we have:
> 
>                 if (!node_online(nid))
>                         alloc_offline_node_data(nid);
>              
>                 pgdat = NODE_DATA(nid);
>                 free_area_init_node(nid);
> 
> 
> But node_online() is true so this allocation doesn't happen, and
> pgdat remains NULL.
> 
> And node_online() becomes true in init_cpu_to_node():
> 
>                 if (!node_online(node))
>                         node_set_online(node);
> 
> But without having a pgdat allocated.
> 
> I was able to workaround this by changing the code in free_area_init() to
> 
>                if (!node_online(nid) || !NODE_DATA(nid))
>                         alloc_offline_node_data(nid);

if (!NODE_DATA(nid)) is enough ...
 
> But I don't have the bigger picture, and also didn't check yet what exactly
> about this patch results in the failure. Probably ordering of various related 
> actions. Thoughts?

... and there's a fix already in the mm-hotfixes-stable:

https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?h=mm-hotfixes-unstable&id=a4ab97e34bb687a2ca63fc70b47e8762e689797f

-- 
Sincerely yours,
Mike.

