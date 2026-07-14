Return-Path: <linux-mips+bounces-15883-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FOfVHG8gVmonzgAAu9opvQ
	(envelope-from <linux-mips+bounces-15883-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2026 13:41:35 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA76E753FC2
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2026 13:41:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=MvgpT4yw;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15883-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15883-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 729E8302C0C4
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2026 11:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 481D33845C1;
	Tue, 14 Jul 2026 11:40:50 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8548135BDDB;
	Tue, 14 Jul 2026 11:40:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784029250; cv=none; b=gkLDomIq9GdbwFK0sw4eeDfi64+PuZiyHL7Kvb1Yn6BDi6kSdw7NyTa3xqsg20MuPaSEGe8d6hBo1/KKYks7GbDXqTxxp/3w59Dyk14NMWSop6aJBCc/Upj+tl6B5KfaIcbZvBlyw5vnxbQf2MQbzJ3w8VPTYTN+kFFKFprgzlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784029250; c=relaxed/simple;
	bh=MCWhEFrql7UL36iBX9OZiHoegQ6HAcW6h4DKukQd0P8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mv2zq6TaowRwZGy7QzadnnW9GyEu/ohsgFPL/6gSWoWITjKwMXm+YAvGEWAqOgzHvrd6BazXS6Ie4c5sn9tT//HWZjSrhk18iseMGf4bo+wS5X2lNGkD2l2zQo25F9dFZJiMknCzTHT7WftETV7jpslsnHPJLmvPYSfpsKgX9Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MvgpT4yw; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EF1B1476;
	Tue, 14 Jul 2026 04:40:43 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6AA603F93E;
	Tue, 14 Jul 2026 04:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784029247; bh=MCWhEFrql7UL36iBX9OZiHoegQ6HAcW6h4DKukQd0P8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MvgpT4ywcE00IxG1JVUyBpm3lJ+pIfECdF6FM/Sc9MXmE2eFpNJRbIz7x2PHnayFc
	 rIEH/1buiyXOZIfInJgpBQRwP/xJTZ/bbTCuLcFjDgZe3iZFv28lVTuFyfnYkwAUXC
	 NhDONHzT6KNdhRrz3tcDrHH80ODV8po7FJy3msTE=
Date: Tue, 14 Jul 2026 12:40:35 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Dave Hansen <dave.hansen@intel.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-arch@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org,
	kasan-dev@googlegroups.com, linux-csky@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
	linux@armlinux.org.uk, akpm@linux-foundation.org,
	ankur.a.arora@oracle.com, rppt@kernel.org, linmag7@gmail.com,
	chleroy@kernel.org, klarasmodin@gmail.com, chenhuacai@kernel.org,
	kernel@xen0n.name, kas@kernel.org, zhangtianyang@loongson.cn,
	wangyuli@aosc.io, tsbogend@alpha.franken.de, ljs@kernel.org,
	jgg@ziepe.ca, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, ryan.roberts@arm.com, pasha.tatashin@soleen.com,
	rmclure@linux.ibm.com, baolin.wang@linux.alibaba.com, tj@kernel.org,
	kevin.brodsky@arm.com, anup@brainfault.org, atish.patra@linux.dev,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, dave.hansen@linux.intel.com, luto@kernel.org,
	peterz@infradead.org, tglx@kernel.org, mingo@redhat.com,
	bp@alien8.de, hpa@zytor.com, hannes@cmpxchg.org, mhocko@kernel.org,
	qi.zheng@linux.dev, shakeel.butt@linux.dev, kasong@tencent.com,
	baohua@kernel.org, axelrasmussen@google.com, yuanchu@google.com,
	weixugc@google.com, ryabinin.a.a@gmail.com, glider@google.com,
	andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
	anshuman.khandual@arm.com, yang@os.amperecomputing.com,
	chaitanyas.prakash@arm.com, ardb@kernel.org, guoren@kernel.org,
	yang.li85200@gmail.com, viro@zeniv.linux.org.uk,
	dinguyen@kernel.org, schuster.simon@siemens-energy.com,
	wangruikang@iscas.ac.cn, junhui.liu@pigmoral.tech,
	muchun.song@linux.dev, vishal.moola@gmail.com, namcao@linutronix.de,
	pavel@kernel.org, djbw@kernel.org, yu-cheng.yu@intel.com,
	baolu.lu@linux.intel.com, Jonathan.Cameron@huawei.com,
	coxu@redhat.com, andreas@gaisler.com, liam@infradead.org,
	vbabka@kernel.org, surenb@google.com, mhocko@suse.com,
	geert@linux-m68k.org, shorne@gmail.com, jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi
Subject: Re: [RFC PATCH 10/34] x86: mm: carve out the generic compile-time
 folded pgtable case in effective_prot()
Message-ID: <alYgMxKqRnF6_X0A@e129823.arm.com>
References: <c3edfb13-08ec-419c-bc05-8f3f64186b24@intel.com>
 <ac365196-8ccc-4d8b-83d7-28fec763e75c@kernel.org>
 <710b7eb0-8e0c-4f07-991c-2285c77e1beb@intel.com>
 <6007625e-c3f9-4ad6-99a8-61396bccbcec@kernel.org>
 <32d459d1-ad19-4baf-bbb1-0565458001d2@intel.com>
 <3ea30f8a-bb29-4bf5-8400-1c4840d46a88@kernel.org>
 <7e84b200-25eb-43a6-b5e2-5f27f2d82a77@intel.com>
 <31988089-095a-4eed-b5e2-c677c70f79f6@kernel.org>
 <14e250db-1641-4085-8d13-02f819657d5f@intel.com>
 <d83c76b3-ea4d-4c41-b4c5-f5ae558ace55@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d83c76b3-ea4d-4c41-b4c5-f5ae558ace55@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,arm.com,lists.infradead.org,vger.kernel.org,lists.linux.dev,kernel.org,kvack.org,googlegroups.com,lists.linux-m68k.org,armlinux.org.uk,linux-foundation.org,oracle.com,gmail.com,xen0n.name,loongson.cn,aosc.io,alpha.franken.de,ziepe.ca,arndb.de,soleen.com,linux.ibm.com,linux.alibaba.com,brainfault.org,linux.dev,dabbelt.com,eecs.berkeley.edu,ghiti.fr,linux.intel.com,infradead.org,redhat.com,alien8.de,zytor.com,cmpxchg.org,tencent.com,google.com,os.amperecomputing.com,zeniv.linux.org.uk,siemens-energy.com,iscas.ac.cn,pigmoral.tech,linutronix.de,huawei.com,gaisler.com,suse.com,linux-m68k.org,southpole.se,saunalahti.fi];
	TAGGED_FROM(0.00)[bounces-15883-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:dave.hansen@intel.com,m:yeoreum.yun@arm.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linux-arch@vger.kernel.org,m:kvm-riscv@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:x86@kernel.org,m:linux-mm@kvack.org,m:kasan-dev@googlegroups.com,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:linux@armlinux.org.uk,m:akpm@linux-foundation.org,m:ankur.a.arora@oracle.com,m:rppt@kernel.org,m:linmag7@gmail.com,m:chleroy@kernel.org,m:klarasmodin@gmail.com,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:kas@kernel.org,m:zhangtianyang@loongson.cn,m:wangyuli@aosc.io,m:tsbogend@alpha.franken.de,m:ljs@kernel.org,m:jgg@ziepe.ca,m:catalin.marinas@arm.com,m:will@kernel.org,m:arnd@arndb.de,m:ryan.roberts@arm.com,m:pasha.tatashin@soleen.com,m:rmclure@linux.ibm.com,m:baolin.wang@linux.alibaba.com,m:tj@kernel.org,m:kevin.br
 odsky@arm.com,m:anup@brainfault.org,m:atish.patra@linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:dave.hansen@linux.intel.com,m:luto@kernel.org,m:peterz@infradead.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:hannes@cmpxchg.org,m:mhocko@kernel.org,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kasong@tencent.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:anshuman.khandual@arm.com,m:yang@os.amperecomputing.com,m:chaitanyas.prakash@arm.com,m:ardb@kernel.org,m:guoren@kernel.org,m:yang.li85200@gmail.com,m:viro@zeniv.linux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:wangruikang@iscas.ac.cn,m:junhui.liu@pigmoral.tech,m:muchun.song@linux.dev,m:vishal.moola@gmail.com,m:namcao@linutronix.de,m:pavel@kernel.org,m:djbw@kernel.org,m:yu-cheng
 .yu@intel.com,m:baolu.lu@linux.intel.com,m:Jonathan.Cameron@huawei.com,m:coxu@redhat.com,m:andreas@gaisler.com,m:liam@infradead.org,m:vbabka@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:geert@linux-m68k.org,m:shorne@gmail.com,m:jonas@southpole.se,m:stefan.kristiansson@saunalahti.fi,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[yeoreum.yun@arm.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yeoreum.yun@arm.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[96];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:from_mime,arm.com:dkim,vger.kernel.org:from_smtp,e129823.arm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA76E753FC2

> On 7/13/26 23:40, Dave Hansen wrote:
> > On 7/13/26 14:17, David Hildenbrand (Arm) wrote:
> >>> To me, the double READ_ONCE() is a non-issue.
> >> To other arch maintainers, it is!
> > 
> > Ahh, so it seems like Christophe in ppc32 land was looking at this more
> > like a regression that needed to get fixed.
> 
> Yes, exactly. :)
> 
> And I agree that it is something we should be optimizing.
> 
> > 
> > Christophe, just out of curiosity, was this something that was causing
> > you practical problems like measurable performance regressions, or was
> > it really just insane code generation that seems unacceptably suboptimal?
> 
> I'd be curious about that as well. I mean, looking at the generated code
> it's clear that it is suboptimal.
> 
> 
> The solution space I see:
> 
> 
> (1) Pass the result from e.g., pgdp_get() into p4d_get(), so it can just return 
>     the value with folded p4ds.
> 
> That requires extreme amounts of churn in core-mm AFAIKS, so I don't see that as feasible.
> 
> 
> (2) Rewrite folding code to make p4d_present() be a dummy instead of 
>     pgd_present(), and make p4dp_get() return a dummy value.
> 
> ... a lot of churn across architectures. I'm sure we'll learn soon why it was done 
> ike the way it is today in the first place. Something interesting to look at,
> certainly, but a bit of a stretch just to optimize reads.
> 
> 
> (3) Make folded pgdp_get() use an ordinary read instead of a READ_ONCE / dummy.
> 
> I don't like that, because we couldn't catch easily if the value is then
> actually used some old/new code.
> 
> If pgd_present() etc are supposed to ignore the value, I'd rather have a mechanism
> that enforces that the values are actually ignore in pgd_offset() etc as well.
> 
> 
> (4) What we do in this series, but instead of forbidding set_pgd(), make it only 
>     complain when we are passing in a dummy value.
> 
> The expectation is that it would avoid touching most architecture code in patch
> 12 -> 27 and still prevent mistakes in the future.
> 
> @Yeoreum can you play with that and see what the end result would be?

Okay. I'll try with (4) and let me reply how much we can reuduce
the volume of this patch series.

> 
> 
> The problem of how to handle ptdump effective_prot remains. Which is unfortunately an
> x86 32-bit only problem ;) ... and effective_prot is essentially an x86-only thing.
> 
> There are various ways we could handle that, my preferred one would be
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index fb298e2191792..3d56e48fe4151 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -96,7 +96,7 @@ config X86
>         select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
>         select ARCH_HAS_PMEM_API                if X86_64
>         select ARCH_HAS_PREEMPT_LAZY
> -       select ARCH_HAS_PTDUMP
> +       select ARCH_HAS_PTDUMP                  if X86_64
>         select ARCH_HAS_PTE_SPECIAL
>         select ARCH_HAS_HW_PTE_YOUNG
>         select ARCH_HAS_NONLEAF_PMD_YOUNG       if PGTABLE_LEVELS > 2
> 
> 
> Another option would be to keep the behavior unchanged:
> 
> 
> diff --git a/mm/ptdump.c b/mm/ptdump.c
> index 5851096e6f656..ce2cf5e07ac0a 100644
> --- a/mm/ptdump.c
> +++ b/mm/ptdump.c
> @@ -39,6 +39,9 @@ static int ptdump_pgd_entry(pgd_t *pgd, unsigned long addr,
>                 return note_kasan_page_table(walk, addr);
>  #endif
>  
> +       if (mm_p4d_folded(walk->mm))
> +               return 0;
> +
>         if (st->effective_prot_pgd)
>                 st->effective_prot_pgd(st, val);
>  
> @@ -62,6 +65,13 @@ static int ptdump_p4d_entry(p4d_t *p4d, unsigned long addr,
>                 return note_kasan_page_table(walk, addr);
>  #endif
>  
> +       if (mm_pud_folded(walk->mm))
> +               return 0;
> +
> +       /* Simulate old behavior: all page table levels exist with folded values. */
> +       if (mm_p4d_folded(walk->mm) && (st->effective_prot_pgd))
> +               st->effective_prot_pgd(st, __pgd(p4d_val(val)));
> +
>         if (st->effective_prot_p4d)
>                 st->effective_prot_p4d(st, val);
>  
> @@ -85,6 +95,15 @@ static int ptdump_pud_entry(pud_t *pud, unsigned long addr,
>                 return note_kasan_page_table(walk, addr);
>  #endif
>  
> +       if (mm_pmd_folded(walk->mm))
> +               return 0;
> +
> +       /* Simulate old behavior: all page table levels exist with folded values. */
> +       if (mm_pud_folded(walk->mm) && st->effective_prot_pgd)
> +               st->effective_prot_pgd(st, __pgd(pud_val(val)));
> +       if (mm_p4d_folded(walk->mm) && st->effective_prot_p4d)
> +               st->effective_prot_p4d(st, __p4d(pud_val(val)));
> +
>         if (st->effective_prot_pud)
>                 st->effective_prot_pud(st, val);
>  
> @@ -107,6 +126,14 @@ static int ptdump_pmd_entry(pmd_t *pmd, unsigned long addr,
>                 return note_kasan_page_table(walk, addr);
>  #endif
>  
> +       /* Simulate old behavior: all page table levels exist with folded values. */
> +       if (mm_pud_folded(walk->mm) && st->effective_prot_pgd)
> +               st->effective_prot_pgd(st, __pgd(pmd_val(val)));
> +       if (mm_p4d_folded(walk->mm) && st->effective_prot_p4d)
> +               st->effective_prot_p4d(st, __p4d(pmd_val(val)));
> +       if (mm_pmd_folded(walk->mm) && st->effective_prot_pud)
> +               st->effective_prot_pud(st, __pud(pmd_val(val)));
> +
>         if (st->effective_prot_pmd)
>                 st->effective_prot_pmd(st, val);
>         if (pmd_leaf(val)) {

But I think we can get rid of simulation if the x86 allows to modify
(of course, x86 still wants to use PTDUMP) like:

diff --git a/arch/x86/mm/dump_pagetables.c b/arch/x86/mm/dump_pagetables.c
index e32848c7f26d4..aa1277f35773a 100644
--- a/arch/x86/mm/dump_pagetables.c
+++ b/arch/x86/mm/dump_pagetables.c
@@ -29,6 +29,7 @@ struct pg_state {
        struct ptdump_state ptdump;
        struct mm_struct *mm;
        int level;
+       int first_level;
        pgprotval_t current_prot;
        pgprotval_t effective_prot;
        pgprotval_t prot_levels[5];
@@ -254,22 +255,8 @@ static void effective_prot(struct ptdump_state *pt_st, int level, u64 val)
        struct pg_state *st = container_of(pt_st, struct pg_state, ptdump);
        pgprotval_t prot = val & PTE_FLAGS_MASK;
        pgprotval_t effective;
-       bool first_level = false;

-       /* Ignore folded levels ... */
-       if (((level == 0) && mm_p4d_folded(st->mm)) ||
-           ((level == 1) && mm_pud_folded(st->mm)) ||
-           ((level == 2) && mm_pmd_folded(st->mm)))
-               return;
-
-       /* ... and make the actual first level remember the protection. */
-       if (((level == 0)) ||
-           ((level == 1) && mm_p4d_folded(st->mm)) ||
-           ((level == 2) && mm_pud_folded(st->mm)) ||
-           ((level == 3) && mm_pmd_folded(st->mm)))
-               first_level = true;
-
-       if (!first_level) {
+       if (first_level > st->first_level) {
                pgprotval_t higher_prot = st->prot_levels[level - 1];

                effective = (higher_prot & prot & (_PAGE_USER | _PAGE_RW)) |
@@ -471,6 +458,15 @@ bool ptdump_walk_pgd_level_core(struct seq_file *m,
                .seq            = m
        };

+       if (mm_pmd_folded (mm))
+               st->first_level = 3;
+       else if (mm_pud_folded (mm))
+               st->first_level = 2;
+       else if (mm_p4d_folded (mm))
+               st->first_level = 1;
+       else
+               st->first_level = 0;
+
        ptdump_walk_pgd(&st.ptdump, mm, pgd);

        if (!checkwx)

-- 
Sincerely,
Yeoreum Yun

