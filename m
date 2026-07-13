Return-Path: <linux-mips+bounces-15817-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LZPzBJrvVGoqhgAAu9opvQ
	(envelope-from <linux-mips+bounces-15817-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 16:00:58 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C1574C057
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 16:00:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=jgMpd1XN;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15817-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15817-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2009C30477F2
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 13:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00728437101;
	Mon, 13 Jul 2026 13:56:34 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 265BF43637E;
	Mon, 13 Jul 2026 13:56:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783950993; cv=none; b=G/5z6MW1PCZXGCBrD6978ziUtBSRCi3zwDcEjvHmmW5B3t+OzMTZk9Lq3tkebsNH+oXvAHBq0bLJikeLwpkUPndIKMFjwi/ZTQQcElN2GbfMEf6sC/NGxK3NWNFtV9x2yA2rMVTFyIy4u2FWrEb/HzDdCp4Px51Zcghl0hhEUUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783950993; c=relaxed/simple;
	bh=a803yHhNKkzlLM5udi9zzm2zAj+wvACzTi3ySnyKLew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MNs7wXa9Qf1dPAoojMinfUbDzLcyn2QPAZSarIcGxQ7SF3oPQJ4saiaPg9gP59witnNCZ8sRKMs6OjITLIQGbW6JbKT/WBFKeNHv5sqceDivCebB8wDwI0xUcnu5ThZe2us39ZCjhSgpUieusaMD+9qitA8rERx3yxyokQe1Vho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jgMpd1XN; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E30B71576;
	Mon, 13 Jul 2026 06:56:24 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EC1153F7B4;
	Mon, 13 Jul 2026 06:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783950989; bh=a803yHhNKkzlLM5udi9zzm2zAj+wvACzTi3ySnyKLew=;
	h=From:To:Cc:Subject:Date:From;
	b=jgMpd1XNQv71U7DXeJ1h7jnvieXwYpoUFE20Nk1qreF39M5EDswShoN8YI1iYonao
	 mpbbq893Ohfpd/mgYuCRux/Rcp6Kx9soqI0ZGO7Z8o4N5y6pRlcAocE+2YLNFetElg
	 7W3XeJO4AuPs2v4nW1+sFx6aMUzfa+PGz771bJow=
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-arch@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com,
	linux-csky@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org
Cc: david@kernel.org,
	linux@armlinux.org.uk,
	akpm@linux-foundation.org,
	ankur.a.arora@oracle.com,
	rppt@kernel.org,
	linmag7@gmail.com,
	chleroy@kernel.org,
	klarasmodin@gmail.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	kas@kernel.org,
	zhangtianyang@loongson.cn,
	wangyuli@aosc.io,
	tsbogend@alpha.franken.de,
	ljs@kernel.org,
	jgg@ziepe.ca,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	ryan.roberts@arm.com,
	pasha.tatashin@soleen.com,
	rmclure@linux.ibm.com,
	baolin.wang@linux.alibaba.com,
	tj@kernel.org,
	kevin.brodsky@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com,
	hannes@cmpxchg.org,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	anshuman.khandual@arm.com,
	yang@os.amperecomputing.com,
	chaitanyas.prakash@arm.com,
	ardb@kernel.org,
	guoren@kernel.org,
	yang.li85200@gmail.com,
	viro@zeniv.linux.org.uk,
	dinguyen@kernel.org,
	schuster.simon@siemens-energy.com,
	wangruikang@iscas.ac.cn,
	junhui.liu@pigmoral.tech,
	muchun.song@linux.dev,
	vishal.moola@gmail.com,
	namcao@linutronix.de,
	pavel@kernel.org,
	djbw@kernel.org,
	yu-cheng.yu@intel.com,
	baolu.lu@linux.intel.com,
	Jonathan.Cameron@huawei.com,
	coxu@redhat.com,
	andreas@gaisler.com,
	liam@infradead.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	geert@linux-m68k.org,
	shorne@gmail.com,
	jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [RFC PATCH 00/34] mm: optimize unnecessary loads due to ptep_get() and friends out
Date: Mon, 13 Jul 2026 14:55:39 +0100
Message-ID: <20260713135614.1618183-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,armlinux.org.uk,linux-foundation.org,oracle.com,gmail.com,xen0n.name,loongson.cn,aosc.io,alpha.franken.de,ziepe.ca,arm.com,arndb.de,soleen.com,linux.ibm.com,linux.alibaba.com,brainfault.org,linux.dev,dabbelt.com,eecs.berkeley.edu,ghiti.fr,linux.intel.com,infradead.org,redhat.com,alien8.de,zytor.com,cmpxchg.org,tencent.com,google.com,os.amperecomputing.com,zeniv.linux.org.uk,siemens-energy.com,iscas.ac.cn,pigmoral.tech,linutronix.de,intel.com,huawei.com,gaisler.com,suse.com,linux-m68k.org,southpole.se,saunalahti.fi];
	TAGGED_FROM(0.00)[bounces-15817-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[yeoreum.yun@arm.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linux-arch@vger.kernel.org,m:kvm-riscv@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:x86@kernel.org,m:linux-mm@kvack.org,m:kasan-dev@googlegroups.com,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:david@kernel.org,m:linux@armlinux.org.uk,m:akpm@linux-foundation.org,m:ankur.a.arora@oracle.com,m:rppt@kernel.org,m:linmag7@gmail.com,m:chleroy@kernel.org,m:klarasmodin@gmail.com,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:kas@kernel.org,m:zhangtianyang@loongson.cn,m:wangyuli@aosc.io,m:tsbogend@alpha.franken.de,m:ljs@kernel.org,m:jgg@ziepe.ca,m:catalin.marinas@arm.com,m:will@kernel.org,m:arnd@arndb.de,m:ryan.roberts@arm.com,m:pasha.tatashin@soleen.com,m:rmclure@linux.ibm.com,m:baolin.wang@linux.alibaba.com,m:tj@kernel.org,m:kevin.brodsky@arm.com,m:anup@brainfault.org,m:atish.pa
 tra@linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:dave.hansen@linux.intel.com,m:luto@kernel.org,m:peterz@infradead.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:hannes@cmpxchg.org,m:mhocko@kernel.org,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kasong@tencent.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:anshuman.khandual@arm.com,m:yang@os.amperecomputing.com,m:chaitanyas.prakash@arm.com,m:ardb@kernel.org,m:guoren@kernel.org,m:yang.li85200@gmail.com,m:viro@zeniv.linux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:wangruikang@iscas.ac.cn,m:junhui.liu@pigmoral.tech,m:muchun.song@linux.dev,m:vishal.moola@gmail.com,m:namcao@linutronix.de,m:pavel@kernel.org,m:djbw@kernel.org,m:yu-cheng.yu@intel.com,m:baolu.lu@linux.intel.com,m:Jon
 athan.Cameron@huawei.com,m:coxu@redhat.com,m:andreas@gaisler.com,m:liam@infradead.org,m:vbabka@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:geert@linux-m68k.org,m:shorne@gmail.com,m:jonas@southpole.se,m:stefan.kristiansson@saunalahti.fi,m:yeoreum.yun@arm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yeoreum.yun@arm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_GT_50(0.00)[95];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:from_mime,arm.com:dkim,arm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A2C1574C057

Using ptep_get() and its counterparts in common code is suboptimal on
kernel configurations with generic compile-time folded page tables.
By default, ptep_get() and its friends expands to READ_ONCE(),
forcing the compiler to emit a load even when the value is not used afterwards.

This issue was recently reported by Christophe Leroy [1] for ppc32
preventing futher code conversion to ptep_get()/pmdp_get()/... helper
and the same behavior can also be observed on arm64 when built with
2- or 3-level page tables

e.g) perf_get_page_size() in arm64 with CONFIG_PGTABLE_LEVEL=3:

00000000000052a0 <perf_get_page_size>:
    ...
    52dc: d53b4234     	mrs	x20, DAIF
    52e0: d50343df     	msr	DAIFSet, #0x3
    ...
    52fc: d35e9a69     	ubfx	x9, x19, #30, #9        /* pud_offset_lockless() */
    5300: f9403508     	ldr	x8, [x8, #0x68]
    5304: f869790a     	ldr	x10, [x8, x9, lsl #3]   /* pudp_get() */
    5308: f90007ea     	str	x10, [sp, #0x8]
    530c: f8697908     	ldr	x8, [x8, x9, lsl #3]    /* pudp_get() */
    ...
    5360: 90000009     	adrp	x9, 0x5000 <perf_prepare_sample+0x548>
    5364: 92746908     	and	x8, x8, #0x7ffffff000
    5368: d3557675     	ubfx	x21, x19, #21, #9       /* pmd_offset_lockless() */
    ...
    5394: f8757ac8     	ldr	x8, [x22, x21, lsl #3]  /* pmdp_get() */

Though PGTABLE_LEVEL=3, since the pudp_get() still remain with
READ_ONCE(), there's redundant load for the pud which is folded.

To prevent generating suboptimal code, define dummy pXdp_get() and
pXd_offset_lockless() in the pgtable-nopXd.h to handle folded page tables
properly.

As the pXdp_get() can return *dummy* entry, some of code using
the stack value where saves the pXdp_get() could be a problematic:

  1. Passing address of stack value where saves the pXdp_get() result
     to pXd_offset() for example:

       pud_t *pudp, pud;
       pmd_t *pmdp;

       pud = pudp_get(pudp, address);
       pmdp = pmd_offset(&pud, pud, address);

     (e.g. host_pfn_mapping_level() in loongarch).

  2. Using the pXdp_get() result to use as argument of pXd_val() and
     to check prot without checking pgtable is folded.
     for example, x86's effective_prot().

  3. Using set_pXd() with pXdp_get() will set problematic dummy entry
     in folded page table like:

       set_pXd(pxdp, pXdp_get(pxdp_k));

     To prevent this, Let set_pXd() triggers the compile error
     to catch the wrong usage of set_pXd() in the generic compile-time
     folded page table and change the set_pgd() usage to set the
     first-level page table with the proper set_pXd().

  4. Using pgd_page_vaddr() to get the first-level pgtable.
     passing dummy pxdp_get() for pgd_page_vaddr() will return wrong
     address. Therefore, make pgd_page_vaddr() and pXd_pgtable() to
     trigger the error for improper usage in the generic compile-time
     folded pgtable.

Thanksfully, above cases are rare since (1) most of usage using
pXd_offset() with result of upper pXd_offset(), (2) it's extreamely
rare to use pXd_val() for non-leaf entry in the kernel,
(3) is to handle the vmalloc_fault or set the first level of page table
and (4) to setup early page table and etc.

Therefore, convert this kind of problematic rare pattern properly.

Furthermore, passing the ptep_get() (or its counterparts) as argument
directly to pte_present() and related helpers can generate suboptimal code,
in arm64 as the current macro implementation may evaluate its argument
more than once like:

  !pte_val(READ_ONCE(*pte) || pte_present_invalid(READ_ONCE(*pte))

resulting in redundant loads.

A typical example is pud_free_pmd_page(), where the expansion of
pmd_present() generates:
    ...
    /* pmd_present() (x20 = pmdp) */
    1b88: f9400288     ldr	x8, [x20]        // read pmdp.
    1b8c: f9000fa8     str	x8, [x29, #0x18]
    1b90: 3707fec8     tbnz	w8, #0x0, 0x1b68 <pud_free_pmd_page+0xd0>
    1b94: f9400288     ldr	x8, [x20]        // redundant read of pmdp.
    1b98: 8a170109     and	x9, x8, x23
    1b9c: f9000fa8     str	x8, [x29, #0x18]
    1ba0: f120013f     cmp	x9, #0x800
    1ba4: 54fffe20     b.eq	0x1b68 <pud_free_pmd_page+0xd0>
    1ba8: 17fffff4     b	0x1b78 <pud_free_pmd_page+0xe0>
    ...

To address this in arm64, convert pte_present() macro and its friends
to static inline function.

Future work
===========
 - print_bad_page_map() and show_pte() still prints dummy values
   instead of printing the same content for all generic compile-time
   folded page tables. We might want to skip printing dummy values later.

 - We currently catch abuse of dummy values on the stack at compile-time by
   relying on constant propagation by the compiler. Usama's work [3] on using
   distinct types for sw vs. hw PTEs could help here as well."

Link: [1] https://lore.kernel.org/all/0019d675-ce3d-4a5c-89ed-f126c45145c9@kernel.org/
Link: [2] https://lore.kernel.org/all/20251113014656.2605447-1-samuel.holland@sifive.com/
Link: [3] https://lore.kernel.org/r/74182e50-b54f-4d2d-a27f-3a59a538d6bc@arm.com

David Hildenbrand (Arm) (13):
  ARM: mm: make nommu pgd_t a scalar
  ARM: mm: make 2-level pgd_t a scalar
  ARM: mm: remove custom pgdp_get()
  LoongArch: mm: define pud_leaf() only when PUD exists
  MIPS: mm: define pud_leaf() only when PUD exists
  mm/pgtable: define (pgd|p4d|pud)_leaf() for folded page tables
  mm/pgtable: define (pgd|p4d|pud)_offset_lockless() for folded page
    tables
  x86: mm: carve out the generic compile-time folded pgtable case in
    effective_prot()
  mm/pgtable: disallow calling folded set_pgd/set_p4d/set_pud
  mm/pgtable: disallow calling folded (pgd|p4d|pud)_page,
    pgd_page_vaddr() and (p4d|pud)_pgtable
  mm/pgtable: optimize pmdp_get() and friends for folded pagetable
    levels
  openrisc/pgtable: drop __pmd_offset()
  mm/pgtable: catch abuse of folded dummy pgd_t/p4d_t/pud_t

Yeoreum Yun (21):
  loongarch: kvm: remove stack copy address of pXd in pXd_offset()
  riscv: kvm: remove stack copy address of pXd in pXd_offset()
  mm: vmscan: remove stack copy address of pud pass in wallk_pud_range()
  arm64: mm: use proper set_pXd() for generic compile-time folded
    patable in kasan_early_init()
  arm64: mm: define pud_set_huge() when __PGTABLE_PMD_FOLDED not defined
  csky: mm: use proper set_pXd() for generic compile-time folded patable
    in vmalloc_fault()
  mips: mm: use proper set_pXd() for generic compile-time folded patable
    in vmalloc_fault path
  nios2: mm: use proper set_pXd() for generic compile-time folded
    patable in vmalloc_fault path
  riscv: mm: use proper set_pXd() for generic compile-time folded
    patable in vmalloc_fault()
  riscv: mm: use proper set_pXd() for generic compile-time folded
    patable in setup_vm_final()
  x86: power: use proper set_pXd() for generic compile-time folded
    patable in resume_one_md_table_init()
  x86: kexec: use proper set_pXd() for generic compile-time folded
    patable in machine_kexec_page_table_set_one()
  x86: platform: use proper set_pXd() for generic compile-time folded
    patable in setup_olpc_ofw_pgd()
  x86: mm: use proper set_pXd() for generic compile-time folded patable
    in one_md_table_init()
  x86: mm: skip pud setup when using generic compile-time folded
    pagetable
  x86: mm: call try_to_free_pmd_page() when CONFIG_PGTABLE_LEVELS > 2
  x86: mm: remove usage of pgd_page_vaddr() for CONFIG_x86_PAE
  x86: mm: define pudp_set_access_flags() when
    CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD is enabled only.
  m68k: mm: remove usage of pgd_page_vaddr() for CONFIG_PGTABLE_LEVELS=3
  arm: mm: use proper pgtable APIs for generic compile-time folded
    patable in kasan_init()
  arm64: pgtable: convert pte_present() from macro to static inline

 arch/arm/include/asm/page-nommu.h           |  4 +-
 arch/arm/include/asm/pgtable-2level-types.h | 13 ++++--
 arch/arm/include/asm/pgtable.h              |  2 -
 arch/arm/mm/kasan_init.c                    |  8 ++--
 arch/arm64/include/asm/pgtable.h            | 35 ++++----------
 arch/arm64/mm/kasan_init.c                  | 26 ++++++++++-
 arch/arm64/mm/mmu.c                         |  2 +
 arch/csky/mm/fault.c                        | 35 +++++---------
 arch/loongarch/include/asm/pgtable.h        |  2 +
 arch/loongarch/kvm/mmu.c                    | 20 ++++----
 arch/m68k/mm/init.c                         |  2 +-
 arch/m68k/mm/motorola.c                     |  2 +-
 arch/mips/include/asm/pgtable.h             |  2 +
 arch/mips/mm/fault.c                        | 13 ++++--
 arch/nios2/mm/fault.c                       | 36 +++++---------
 arch/openrisc/include/asm/pgtable.h         |  3 --
 arch/riscv/kvm/mmu.c                        | 20 ++++----
 arch/riscv/mm/fault.c                       | 52 +++++++++++++--------
 arch/riscv/mm/init.c                        |  7 ++-
 arch/x86/kernel/machine_kexec_32.c          |  8 ++--
 arch/x86/mm/dump_pagetables.c               | 18 ++++++-
 arch/x86/mm/init_32.c                       | 10 ++--
 arch/x86/mm/pat/set_memory.c                |  9 ++--
 arch/x86/mm/pgtable.c                       | 43 ++++++++++-------
 arch/x86/platform/olpc/olpc_ofw.c           |  5 +-
 arch/x86/power/hibernate_32.c               | 14 ++----
 include/asm-generic/pgtable-nop4d.h         | 45 ++++++++++++++----
 include/asm-generic/pgtable-nopmd.h         | 46 +++++++++++++-----
 include/asm-generic/pgtable-nopud.h         | 46 ++++++++++++++----
 include/linux/pgtable.h                     |  5 ++
 mm/vmscan.c                                 |  2 +-
 31 files changed, 329 insertions(+), 206 deletions(-)


base-commit: bdc38bfc1262e3d1432afadd2aa2ffd83d139dbb
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


