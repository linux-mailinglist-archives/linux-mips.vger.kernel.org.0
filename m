Return-Path: <linux-mips+bounces-13814-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFetGx14vWmt9wIAu9opvQ
	(envelope-from <linux-mips+bounces-13814-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 17:38:53 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3504A2DD904
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 17:38:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7ABC830039A0
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 16:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B613A3B19C0;
	Fri, 20 Mar 2026 16:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/OfmVcP"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC8F3148A3;
	Fri, 20 Mar 2026 16:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024729; cv=none; b=tQ4u2vb4GyEBsL7FxFkadwtf+OJanR6xf9Prg2sR/oxQBl4DZfyN+fAgkoZ4mejEqJLkDuIPsf5p6XDagcip6mdQVuGZtzdBhi/cAQaQeP5LZh+J0fzRf+TNScZ7N6vJntgAd3IzpM8iuz8r/cj9aanjebTTkmXo0z4W54trIcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024729; c=relaxed/simple;
	bh=Ksk0/Cy+7k9g8VSMuw5OALSCZ2GB9qpziu6Wa5P0d+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ieAeJ30wVBt20n884dL1tEdndnECwoqlIGgUmH9Nl5KRXi/hQ5gS4VReqjZkm7n7TEoUaD6CxuCAgTC31ooaf+w7huRbcR7PbzkXDvxo3Ji0hm8zZNzDMMyuPFnjKr9XgdQn6tY60QaAzpfxH4D1XaEReEPUWUYxoO7lP0IU+Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/OfmVcP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDAC6C19425;
	Fri, 20 Mar 2026 16:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024729;
	bh=Ksk0/Cy+7k9g8VSMuw5OALSCZ2GB9qpziu6Wa5P0d+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I/OfmVcP71NX/eXv6rVA2H8uavbrfsew5pTj2wiVU5s+aHz5rN91R2Pz36DoL2+Fo
	 rANmKpvbZV7cOFQK+lP7oYlsRq/4paUxujz4rezTBqKA66bwYPVNNBhzhmCr6J4xbi
	 vjtP4kZEQ3amGKczLKy0m9YptVW35xq5Lm0Uxk2IG2Ler/6ijJ1G8YxCbmrxkSEC7Y
	 M29VqGltRdx6Sm1ifElpqV0bL0Tm8oltBzYTbPzaR+3rGw9s9CGPX7CR94ZjYtEyJX
	 jNLGM6YhVKgZpqntE0j9rerpK2JQejQf6CXMtXpXIuBddKssqb6KupwcU8OClk6p8E
	 qhsKSOvDUiIBg==
Date: Fri, 20 Mar 2026 16:38:34 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Kees Cook <kees@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dinh Nguyen <dinguyen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Xu Xin <xu.xin16@zte.com.cn>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@suse.com>, Paul Moore <paul@paul-moore.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-fsdevel@vger.kernel.org, selinux@vger.kernel.org
Subject: Re: [PATCH v3 17/23] mm: convert do_brk_flags() to use vma_flags_t
Message-ID: <366b74cf-b569-4004-bd12-dfbcefc25e56@lucifer.local>
References: <cover.1773846935.git.ljs@kernel.org>
 <981ed1afcd19115432e61778e7d226a36f8f5c2b.1773846935.git.ljs@kernel.org>
 <1d300b3b-2476-4381-b8df-a680f486b284@kernel.org>
 <f47e24c4-3a11-4a58-96f5-871443660246@lucifer.local>
 <7e2aea13-e047-4891-bd6f-ff6705c4fc28@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e2aea13-e047-4891-bd6f-ff6705c4fc28@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,oracle.com,google.com,suse.de,kvack.org,vger.kernel.org,armlinux.org.uk,arm.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,nod.at,cambridgegreys.com,sipsolutions.net,zeniv.linux.org.uk,suse.cz,zte.com.cn,linux.dev,suse.com,paul-moore.com,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-13814-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[62];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.970];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3504A2DD904
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 04:06:15PM +0100, Vlastimil Babka (SUSE) wrote:
> On 3/20/26 14:42, Lorenzo Stoakes (Oracle) wrote:
> >>
> >> More nits below:
> >>
> >> > diff --git a/arch/arm64/include/asm/page.h b/arch/arm64/include/asm/page.h
> >> > index b39cc1127e1f..e25d0d18f6d7 100644
> >> > --- a/arch/arm64/include/asm/page.h
> >> > +++ b/arch/arm64/include/asm/page.h
> >> > @@ -46,7 +46,12 @@ int pfn_is_map_memory(unsigned long pfn);
> >> >
> >> >  #endif /* !__ASSEMBLER__ */
> >> >
> >> > -#define VM_DATA_DEFAULT_FLAGS	(VM_DATA_FLAGS_TSK_EXEC | VM_MTE_ALLOWED)
> >> > +#ifdef CONFIG_ARM64_MTE
> >> > +#define VMA_DATA_DEFAULT_FLAGS	append_vma_flags(VMA_DATA_FLAGS_TSK_EXEC, \
> >> > +						 VMA_MTE_ALLOWED_BIT)
> >>
> >> I wonder what's the bloat-o-meter impact of these #define's (this
> >> arm64-specific one isn't the only one) being no longer compile-time-constants?
> >
> > I mean there's a precedent for this, but the compiler _should_ figure out this
> > as a constant value, I have repeatedly confirmed that it's good at that in
> > godbolt, via make foo/bar.S etc.
>
> Great, thanks!
>
> >
> >>
> >> >   */
> >> >  #define vma_desc_set_flags(desc, ...) \
> >> >  	vma_desc_set_flags_mask(desc, mk_vma_flags(__VA_ARGS__))
> >> > @@ -4059,7 +4071,6 @@ extern int replace_mm_exe_file(struct mm_struct *mm, struct file *new_exe_file);
> >> >  extern struct file *get_mm_exe_file(struct mm_struct *mm);
> >> >  extern struct file *get_task_exe_file(struct task_struct *task);
> >> >
> >> > -extern bool may_expand_vm(struct mm_struct *, vm_flags_t, unsigned long npages);
> >> >  extern void vm_stat_account(struct mm_struct *, vm_flags_t, long npages);
> >> >
> >> >  extern bool vma_is_special_mapping(const struct vm_area_struct *vma,
> >> > diff --git a/mm/internal.h b/mm/internal.h
> >> > index f98f4746ac41..80d8651441a7 100644
> >>
> >> > diff --git a/mm/mprotect.c b/mm/mprotect.c
> >> > index 9681f055b9fc..eaa724b99908 100644
> >> > --- a/mm/mprotect.c
> >> > +++ b/mm/mprotect.c
> >>
> >> > @@ -773,19 +778,24 @@ mprotect_fixup(struct vma_iterator *vmi, struct mmu_gather *tlb,
> >> >
> >> >  	change_protection(tlb, vma, start, end, mm_cp_flags);
> >> >
> >> > -	if ((oldflags & VM_ACCOUNT) && !(newflags & VM_ACCOUNT))
> >> > +	if (vma_flags_test(&old_vma_flags, VMA_ACCOUNT_BIT) &&
> >> > +	    !vma_flags_test(&new_vma_flags, VMA_ACCOUNT_BIT))
> >> >  		vm_unacct_memory(nrpages);
> >> >
> >> >  	/*
> >> >  	 * Private VM_LOCKED VMA becoming writable: trigger COW to avoid major
> >> >  	 * fault on access.
> >> >  	 */
> >> > -	if ((oldflags & (VM_WRITE | VM_SHARED | VM_LOCKED)) == VM_LOCKED &&
> >> > -			(newflags & VM_WRITE)) {
> >> > -		populate_vma_page_range(vma, start, end, NULL);
> >> > +	if (vma_flags_test(&new_vma_flags, VMA_WRITE_BIT)) {
> >> > +		const vma_flags_t mask =
> >> > +			vma_flags_and(&old_vma_flags, VMA_WRITE_BIT,
> >> > +				      VMA_SHARED_BIT, VMA_LOCKED_BIT);
> >> > +
> >> > +		if (vma_flags_same(&mask, VMA_LOCKED_BIT))
> >>
> >> That converts the original logic 1:1, but I wonder if it's now feasible to
> >> write it more obviously as "VMA_LOCKED_BIT must be set, VM_WRITE_BIT and
> >> VM_SHARED_BIT must not" ?
> >
> > Hmm, I'm not sure if I can express this more clearly, it's a pain either
> > way. Could do:
> >
> > 	if (vma_flags_test(&new_vma_flags, VMA_WRITE_BIT) &&
> > 	    !vma_flags_test_any(&old_vma_flags, VMA_WRITE_BIT, VMA_SHARED_BIT))
> > 		populate_vma_page_range(vma, start, end, NULL);
>
> It would be a bit more:
>
> 	if (vma_flags_test(&new_vma_flags, VMA_WRITE_BIT) &&
> 	    vma_flags_test(&old_vma_flags, VMA_LOCKED_BIT) &&
>  	    !vma_flags_test_any(&old_vma_flags, VMA_WRITE_BIT, VMA_SHARED_BIT))
>  		populate_vma_page_range(vma, start, end, NULL);

Right yeah sorry :)

That is clearer but still pretty verbose. Will think about how to do it but I
think as a follow up still makes more sense.

>
> (or reordered in whatever way the short circuting works best here, the original
> code tested oldflags first).
>
> But yeah, at least to me it's more clear what that's testing and doesn't need to
> set up the intermediate mask variable, and VMA_LOCKED_BIT is there only once
> in the code now. The number of vma_flags_* operations is the same.
>
> >>
> >> > +			populate_vma_page_range(vma, start, end, NULL);
> >> >  	}
> >> >
> >> > -	vm_stat_account(mm, oldflags, -nrpages);
> >> > +	vm_stat_account(mm, vma_flags_to_legacy(old_vma_flags), -nrpages);
> >> >  	vm_stat_account(mm, newflags, nrpages);
> >> >  	perf_event_mmap(vma);
> >> >  	return 0;
> >>
> >> > diff --git a/mm/vma.h b/mm/vma.h
> >> > index cf8926558bf6..1f2de6cb3b97 100644
> >> > --- a/mm/vma.h
> >> > +++ b/mm/vma.h
> >>
> >> > +static inline bool is_data_mapping_vma_flags(const vma_flags_t *vma_flags)
> >> > +{
> >> > +	const vma_flags_t mask = vma_flags_and(vma_flags,
> >> > +			VMA_WRITE_BIT, VMA_SHARED_BIT, VMA_STACK_BIT);
> >> > +
> >> > +	return vma_flags_same(&mask, VMA_WRITE_BIT);
> >>
> >> Ditto?
> >
> > I may do both as a follow up patch given the series is a pain to rework at this point
> > and I want at least the first version to be like-for-like intentionally.
>
> OK sure.

Cheers!

>
> >>
> >> > +}
> >> >
> >> >  static inline void vma_iter_config(struct vma_iterator *vmi,
> >> >  		unsigned long index, unsigned long last)
> >> > diff --git a/mm/vma_exec.c b/mm/vma_exec.c
> >> > index 8134e1afca68..5cee8b7efa0f 100644
> >
> > Thanks, Lorenzo
>

