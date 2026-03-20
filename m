Return-Path: <linux-mips+bounces-13813-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMsSIjxkvWlF9gIAu9opvQ
	(envelope-from <linux-mips+bounces-13813-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 16:14:04 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4F52DC6FC
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 16:14:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAD0E30CEFAF
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 15:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F3B3C2771;
	Fri, 20 Mar 2026 15:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c11vSApR"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3256301704;
	Fri, 20 Mar 2026 15:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774019189; cv=none; b=Lsg6u0i9gcdRLBIRb5iS/LvWuNWiUKmD5qjHkGLGycNvWvvoz0N2r8xWDF2Ih91Hr2wghg2lkexpNQjT5aazfS5Vpop04SXwmB7Pmkgg0jnfyHkfc2doTNo01oQhGRVEMuxJvlXYD6JSLg7CMER29zKLJ0x3AL6Q6/OiZVtfYdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774019189; c=relaxed/simple;
	bh=4U/RLB5BQTlqqUA+aRxQ/uoxRsEa6t8UeWu6iGAM7vU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wi2a+jkxt2UOQtnM8ELryjGQrVZ8+4qwmPnmmciJ6k7gPUEY/5EVwXqsmTrNPpgIVnsaZAhicL5jvWREve3JPhBnZ4vA8Bom0ewruPga4oKZpoY5HF5+KsGbu3QzvatxgQUOm1oeAEateAXWl0+3bcUUCTkwklAhTF0apmP2Frw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c11vSApR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB13C2BCB0;
	Fri, 20 Mar 2026 15:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774019189;
	bh=4U/RLB5BQTlqqUA+aRxQ/uoxRsEa6t8UeWu6iGAM7vU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c11vSApRocA25rRA6R1Rg5PoZbJKYkvTzPDMmIS8hDyX2AXYHd8mYvTvGHczpbW0e
	 ZICqmAxAG7qjbn/OIwttlwgweqfJ3T6xWbF6Jn4Ykx0PlThw+3A3UFYPQkowwyM+MR
	 xph2xDZ24qQOpQjw0PB/HBpsqSQshv8HCPxdObcRx0m/O9B6JgKfWn2YSzucm3bNUO
	 LGc+GK60aJmwylKmXisUdB28GjM0TrMGRhwdo3hoTW7hoBzOgalk4j+n72KHrlUXBf
	 swr5E6qUe0gXbEloU8Cxg7ZJR5ROhpNrWzLfTbBhCZSP8AXpxr+lme2+aRUwijSnnb
	 jet5knkPIKlag==
Message-ID: <7e2aea13-e047-4891-bd6f-ff6705c4fc28@kernel.org>
Date: Fri, 20 Mar 2026 16:06:15 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/23] mm: convert do_brk_flags() to use vma_flags_t
Content-Language: en-US
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Kees Cook <kees@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Brian Cain <bcain@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>,
 Michal Hocko <mhocko@suse.com>, Paul Moore <paul@paul-moore.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, selinux@vger.kernel.org
References: <cover.1773846935.git.ljs@kernel.org>
 <981ed1afcd19115432e61778e7d226a36f8f5c2b.1773846935.git.ljs@kernel.org>
 <1d300b3b-2476-4381-b8df-a680f486b284@kernel.org>
 <f47e24c4-3a11-4a58-96f5-871443660246@lucifer.local>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <f47e24c4-3a11-4a58-96f5-871443660246@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,oracle.com,google.com,suse.de,kvack.org,vger.kernel.org,armlinux.org.uk,arm.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,nod.at,cambridgegreys.com,sipsolutions.net,zeniv.linux.org.uk,suse.cz,zte.com.cn,linux.dev,suse.com,paul-moore.com,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-13813-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[62];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vbabka@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EC4F52DC6FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/20/26 14:42, Lorenzo Stoakes (Oracle) wrote:
>>
>> More nits below:
>>
>> > diff --git a/arch/arm64/include/asm/page.h b/arch/arm64/include/asm/page.h
>> > index b39cc1127e1f..e25d0d18f6d7 100644
>> > --- a/arch/arm64/include/asm/page.h
>> > +++ b/arch/arm64/include/asm/page.h
>> > @@ -46,7 +46,12 @@ int pfn_is_map_memory(unsigned long pfn);
>> >
>> >  #endif /* !__ASSEMBLER__ */
>> >
>> > -#define VM_DATA_DEFAULT_FLAGS	(VM_DATA_FLAGS_TSK_EXEC | VM_MTE_ALLOWED)
>> > +#ifdef CONFIG_ARM64_MTE
>> > +#define VMA_DATA_DEFAULT_FLAGS	append_vma_flags(VMA_DATA_FLAGS_TSK_EXEC, \
>> > +						 VMA_MTE_ALLOWED_BIT)
>>
>> I wonder what's the bloat-o-meter impact of these #define's (this
>> arm64-specific one isn't the only one) being no longer compile-time-constants?
> 
> I mean there's a precedent for this, but the compiler _should_ figure out this
> as a constant value, I have repeatedly confirmed that it's good at that in
> godbolt, via make foo/bar.S etc.

Great, thanks!

> 
>>
>> >   */
>> >  #define vma_desc_set_flags(desc, ...) \
>> >  	vma_desc_set_flags_mask(desc, mk_vma_flags(__VA_ARGS__))
>> > @@ -4059,7 +4071,6 @@ extern int replace_mm_exe_file(struct mm_struct *mm, struct file *new_exe_file);
>> >  extern struct file *get_mm_exe_file(struct mm_struct *mm);
>> >  extern struct file *get_task_exe_file(struct task_struct *task);
>> >
>> > -extern bool may_expand_vm(struct mm_struct *, vm_flags_t, unsigned long npages);
>> >  extern void vm_stat_account(struct mm_struct *, vm_flags_t, long npages);
>> >
>> >  extern bool vma_is_special_mapping(const struct vm_area_struct *vma,
>> > diff --git a/mm/internal.h b/mm/internal.h
>> > index f98f4746ac41..80d8651441a7 100644
>>
>> > diff --git a/mm/mprotect.c b/mm/mprotect.c
>> > index 9681f055b9fc..eaa724b99908 100644
>> > --- a/mm/mprotect.c
>> > +++ b/mm/mprotect.c
>>
>> > @@ -773,19 +778,24 @@ mprotect_fixup(struct vma_iterator *vmi, struct mmu_gather *tlb,
>> >
>> >  	change_protection(tlb, vma, start, end, mm_cp_flags);
>> >
>> > -	if ((oldflags & VM_ACCOUNT) && !(newflags & VM_ACCOUNT))
>> > +	if (vma_flags_test(&old_vma_flags, VMA_ACCOUNT_BIT) &&
>> > +	    !vma_flags_test(&new_vma_flags, VMA_ACCOUNT_BIT))
>> >  		vm_unacct_memory(nrpages);
>> >
>> >  	/*
>> >  	 * Private VM_LOCKED VMA becoming writable: trigger COW to avoid major
>> >  	 * fault on access.
>> >  	 */
>> > -	if ((oldflags & (VM_WRITE | VM_SHARED | VM_LOCKED)) == VM_LOCKED &&
>> > -			(newflags & VM_WRITE)) {
>> > -		populate_vma_page_range(vma, start, end, NULL);
>> > +	if (vma_flags_test(&new_vma_flags, VMA_WRITE_BIT)) {
>> > +		const vma_flags_t mask =
>> > +			vma_flags_and(&old_vma_flags, VMA_WRITE_BIT,
>> > +				      VMA_SHARED_BIT, VMA_LOCKED_BIT);
>> > +
>> > +		if (vma_flags_same(&mask, VMA_LOCKED_BIT))
>>
>> That converts the original logic 1:1, but I wonder if it's now feasible to
>> write it more obviously as "VMA_LOCKED_BIT must be set, VM_WRITE_BIT and
>> VM_SHARED_BIT must not" ?
> 
> Hmm, I'm not sure if I can express this more clearly, it's a pain either
> way. Could do:
> 
> 	if (vma_flags_test(&new_vma_flags, VMA_WRITE_BIT) &&
> 	    !vma_flags_test_any(&old_vma_flags, VMA_WRITE_BIT, VMA_SHARED_BIT))
> 		populate_vma_page_range(vma, start, end, NULL);

It would be a bit more:

	if (vma_flags_test(&new_vma_flags, VMA_WRITE_BIT) &&
	    vma_flags_test(&old_vma_flags, VMA_LOCKED_BIT) &&
 	    !vma_flags_test_any(&old_vma_flags, VMA_WRITE_BIT, VMA_SHARED_BIT))
 		populate_vma_page_range(vma, start, end, NULL);

(or reordered in whatever way the short circuting works best here, the original
code tested oldflags first).

But yeah, at least to me it's more clear what that's testing and doesn't need to
set up the intermediate mask variable, and VMA_LOCKED_BIT is there only once
in the code now. The number of vma_flags_* operations is the same.
 
>>
>> > +			populate_vma_page_range(vma, start, end, NULL);
>> >  	}
>> >
>> > -	vm_stat_account(mm, oldflags, -nrpages);
>> > +	vm_stat_account(mm, vma_flags_to_legacy(old_vma_flags), -nrpages);
>> >  	vm_stat_account(mm, newflags, nrpages);
>> >  	perf_event_mmap(vma);
>> >  	return 0;
>>
>> > diff --git a/mm/vma.h b/mm/vma.h
>> > index cf8926558bf6..1f2de6cb3b97 100644
>> > --- a/mm/vma.h
>> > +++ b/mm/vma.h
>>
>> > +static inline bool is_data_mapping_vma_flags(const vma_flags_t *vma_flags)
>> > +{
>> > +	const vma_flags_t mask = vma_flags_and(vma_flags,
>> > +			VMA_WRITE_BIT, VMA_SHARED_BIT, VMA_STACK_BIT);
>> > +
>> > +	return vma_flags_same(&mask, VMA_WRITE_BIT);
>>
>> Ditto?
> 
> I may do both as a follow up patch given the series is a pain to rework at this point
> and I want at least the first version to be like-for-like intentionally.

OK sure.

>>
>> > +}
>> >
>> >  static inline void vma_iter_config(struct vma_iterator *vmi,
>> >  		unsigned long index, unsigned long last)
>> > diff --git a/mm/vma_exec.c b/mm/vma_exec.c
>> > index 8134e1afca68..5cee8b7efa0f 100644
> 
> Thanks, Lorenzo


