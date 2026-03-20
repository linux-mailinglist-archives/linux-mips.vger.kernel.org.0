Return-Path: <linux-mips+bounces-13809-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UO/lJa0qvWkG7QIAu9opvQ
	(envelope-from <linux-mips+bounces-13809-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 12:08:29 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF552D94E8
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 12:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F6683057EB1
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 11:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4623639DBF9;
	Fri, 20 Mar 2026 11:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lM0U/sma"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455BB395DB5;
	Fri, 20 Mar 2026 11:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774004904; cv=none; b=OqPX/vcQXWV0+GDDqztJbFnpMRN0ryRBUNZDrXAZw5q49d8XhFlgTCbD2R5XvUEhPillVFsbIvzvD37ks+5ej7i0G4i28ZdZLOMnmjU1Ae6qBHVdlYizjzyb2XyxKPzWLPBGUMfkDdc1XdoRBOO/yMTPj/7Y0h+ClW8xfDxCulI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774004904; c=relaxed/simple;
	bh=IubUj+jqwRzKoQPj58xDc4nZfpvuDGr1R52SQV2ZLLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OAk1iZ9LE9bTdB/8HHpgQL0eln9VvHrq2UfNQxWgV59Vu9WJOxz2DudgnJMPtz8Od1A6s+W+oII02nNXJxlXdC1lQE3tCspIyKFsvIMDnDX/mi2Rc1+UIwVygifY4xyUw5yntVFOjNwMC/Y9ZMrmEwnrqCXPqVy7jlIAKCHv2Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lM0U/sma; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E98DC4CEF7;
	Fri, 20 Mar 2026 11:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774004903;
	bh=IubUj+jqwRzKoQPj58xDc4nZfpvuDGr1R52SQV2ZLLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lM0U/smadkBEflGyTvmy4GTZW1CFk/3otou6bjFy+dQmA00CHj/ypWe+e73C+zMZQ
	 jhmmO/CjnbFULEMKZS8VBpTbomAMt/cjPAVKyMfPOEREZs8pQlH04qTV/9MvL9x8YN
	 TrPExLO4WzXOykz6o15XYE3r5fRQKyGZ8l0sR0R7p7noB+1Xlz9xivuUpaESQBfpJp
	 Uyof/p8lwb2nc+aKhxOi6BQIC0quLodlIc6P0Iz2eYTTYq69lyrHX9jDbzPea2sYop
	 DmVdpjbcONP/eCN6f1cRlmFQAT+Qh0Z77PP3l/hk1KZKNUaP6VaiRb7tSkfT2VopkI
	 oaRAH25ZcMSnA==
Date: Fri, 20 Mar 2026 11:08:08 +0000
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
Subject: Re: [PATCH v3 22/23] mm/vma: convert vma_modify_flags[_uffd]() to
 use vma_flags_t
Message-ID: <7e22cc48-aa04-406d-b4d0-8ebb182b34b9@lucifer.local>
References: <cover.1773846935.git.ljs@kernel.org>
 <98a004bf89227ea9abaef5fef06ea7e584f77bcf.1773846935.git.ljs@kernel.org>
 <0b5765da-67e9-4e2e-99d8-08501730bf76@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b5765da-67e9-4e2e-99d8-08501730bf76@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,oracle.com,google.com,suse.de,kvack.org,vger.kernel.org,armlinux.org.uk,arm.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,nod.at,cambridgegreys.com,sipsolutions.net,zeniv.linux.org.uk,suse.cz,zte.com.cn,linux.dev,suse.com,paul-moore.com,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-13809-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[62];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.971];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: ECF552D94E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 11:39:58AM +0100, Vlastimil Babka (SUSE) wrote:
> On 3/18/26 16:50, Lorenzo Stoakes (Oracle) wrote:
> > Update the vma_modify_flags() and vma_modify_flags_uffd() functions to
> > accept a vma_flags_t parameter rather than a vm_flags_t one, and propagate
> > the changes as needed to implement this change.
> >
> > Finally, update the VMA tests to reflect this.
> >
> > Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
>
> > --- a/mm/mlock.c
> > +++ b/mm/mlock.c
> > @@ -415,13 +415,14 @@ static int mlock_pte_range(pmd_t *pmd, unsigned long addr,
> >   * @vma - vma containing range to be mlock()ed or munlock()ed
> >   * @start - start address in @vma of the range
> >   * @end - end of range in @vma
> > - * @newflags - the new set of flags for @vma.
> > + * @new_vma_flags - the new set of flags for @vma.
> >   *
> >   * Called for mlock(), mlock2() and mlockall(), to set @vma VM_LOCKED;
> >   * called for munlock() and munlockall(), to clear VM_LOCKED from @vma.
> >   */
> >  static void mlock_vma_pages_range(struct vm_area_struct *vma,
> > -	unsigned long start, unsigned long end, vm_flags_t newflags)
> > +	unsigned long start, unsigned long end,
> > +	vma_flags_t *new_vma_flags)
> >  {
> >  	static const struct mm_walk_ops mlock_walk_ops = {
> >  		.pmd_entry = mlock_pte_range,
> > @@ -439,18 +440,18 @@ static void mlock_vma_pages_range(struct vm_area_struct *vma,
> >  	 * combination should not be visible to other mmap_lock users;
> >  	 * but WRITE_ONCE so rmap walkers must see VM_IO if VM_LOCKED.
> >  	 */
> > -	if (newflags & VM_LOCKED)
> > -		newflags |= VM_IO;
> > +	if (vma_flags_test(new_vma_flags, VMA_LOCKED_BIT))
> > +		vma_flags_set(new_vma_flags, VMA_IO_BIT);
> >  	vma_start_write(vma);
> > -	vm_flags_reset_once(vma, newflags);
> > +	WRITE_ONCE(vma->flags, *new_vma_flags);
>
> It's not clear to me, how is switching from vm_flags_t to vma_flags_t
> allowing us to simply do WRITE_ONCE() instead of the full logic of
> vm_flags_reset_once()? Won't it fail to compile once once flags are more
> than single word? Or worse, will compile but silently allow tearing?

We only care about tearing in the flags that can be contained within a
system word, but true we should probably do this more carefully, as I did
for vm_flags_reset_once().

I will reimplement this as a new, hideous, helper function.

I am not a fan of this being a thing to handle races, it's a hack. But I
guess that should be addressed separately.

>
> >
> >  	lru_add_drain();
> >  	walk_page_range(vma->vm_mm, start, end, &mlock_walk_ops, NULL);
> >  	lru_add_drain();
> >
> > -	if (newflags & VM_IO) {
> > -		newflags &= ~VM_IO;
> > -		vm_flags_reset_once(vma, newflags);
> > +	if (vma_flags_test(new_vma_flags, VMA_IO_BIT)) {
> > +		vma_flags_clear(new_vma_flags, VMA_IO_BIT);
> > +		WRITE_ONCE(vma->flags, *new_vma_flags);
>
> Ditto.

Yup.

>
> >  	}
> >  }
> >
> > @@ -467,20 +468,22 @@ static int mlock_fixup(struct vma_iterator *vmi, struct vm_area_struct *vma,
> >  	       struct vm_area_struct **prev, unsigned long start,
> >  	       unsigned long end, vm_flags_t newflags)
> >  {
> > +	vma_flags_t new_vma_flags = legacy_to_vma_flags(newflags);
> > +	const vma_flags_t old_vma_flags = vma->flags;
> >  	struct mm_struct *mm = vma->vm_mm;
> >  	int nr_pages;
> >  	int ret = 0;
> > -	vm_flags_t oldflags = vma->vm_flags;
> >
> > -	if (newflags == oldflags || vma_is_secretmem(vma) ||
> > -	    !vma_supports_mlock(vma))
> > +	if (vma_flags_same_pair(&old_vma_flags, &new_vma_flags) ||
> > +	    vma_is_secretmem(vma) || !vma_supports_mlock(vma)) {
> >  		/*
> >  		 * Don't set VM_LOCKED or VM_LOCKONFAULT and don't count.
> >  		 * For secretmem, don't allow the memory to be unlocked.
> >  		 */
> >  		goto out;
> > +	}
> >
> > -	vma = vma_modify_flags(vmi, *prev, vma, start, end, &newflags);
> > +	vma = vma_modify_flags(vmi, *prev, vma, start, end, &new_vma_flags);
> >  	if (IS_ERR(vma)) {
> >  		ret = PTR_ERR(vma);
> >  		goto out;
> > @@ -490,9 +493,9 @@ static int mlock_fixup(struct vma_iterator *vmi, struct vm_area_struct *vma,
> >  	 * Keep track of amount of locked VM.
> >  	 */
> >  	nr_pages = (end - start) >> PAGE_SHIFT;
> > -	if (!(newflags & VM_LOCKED))
> > +	if (!vma_flags_test(&new_vma_flags, VMA_LOCKED_BIT))
> >  		nr_pages = -nr_pages;
> > -	else if (oldflags & VM_LOCKED)
> > +	else if (vma_flags_test(&old_vma_flags, VMA_LOCKED_BIT))
> >  		nr_pages = 0;
> >  	mm->locked_vm += nr_pages;
> >
> > @@ -501,12 +504,13 @@ static int mlock_fixup(struct vma_iterator *vmi, struct vm_area_struct *vma,
> >  	 * It's okay if try_to_unmap_one unmaps a page just after we
> >  	 * set VM_LOCKED, populate_vma_page_range will bring it back.
> >  	 */
> > -	if ((newflags & VM_LOCKED) && (oldflags & VM_LOCKED)) {
> > +	if (vma_flags_test(&new_vma_flags, VMA_LOCKED_BIT) &&
> > +	    vma_flags_test(&old_vma_flags, VMA_LOCKED_BIT)) {
> >  		/* No work to do, and mlocking twice would be wrong */
> >  		vma_start_write(vma);
> > -		vm_flags_reset(vma, newflags);
> > +		vma->flags = new_vma_flags;
>
> This also does lot less than vm_flags_reset()?

Well let's look:

	VM_WARN_ON_ONCE(!pgtable_supports_soft_dirty() && (flags & VM_SOFTDIRTY));

Are we really at a point where this is problematic? Do we hit this? Why are
we specifically checking only this case on every single instance of
resetting VMA flags?

	vma_assert_write_locked(vma);

Note the vma_start_write() line above. I want to separate vma_flags_t
helpers from asserts like that, because:

1. We might be operating on a VMA that is not yet added to the tree
2. We might be operating on a VMA that is now detached
3. Really in all but core code, you should be using vma_desc_xxx().
4. Other VMA fields are manipulated with no such checks.
5. It'd be egregious to have to add variants of flag functions just to
   account for cases such as the above, especially when we don't do so for
   other VMA fields. Drivers are the problematic cases and why it was
   especially important (and also for debug as VMA locks were introduced),
   the mmap_prepare work is solving this generally.

	vm_flags_init(vma, flags);

Analysing what's in this function:

	VM_WARN_ON_ONCE(!pgtable_supports_soft_dirty() && (flags & VM_SOFTDIRTY));

Duplicated.

	vma_flags_clear_all(&vma->flags);

Only necessary while you're only setting the first system word of
vma->flags.

	vma_flags_overwrite_word(&vma->flags, flags);

Again only necessary when you're only setting the first system word.

So yeah it's doing the equivalent and (intentionally) eliminating some
noise.

But I'll add the S/D check back I guess.

>
> >  	} else {
> > -		mlock_vma_pages_range(vma, start, end, newflags);
> > +		mlock_vma_pages_range(vma, start, end, &new_vma_flags);
> >  	}
> >  out:
> >  	*prev = vma;
> > diff --git a/mm/mprotect.c b/mm/mprotect.c
> > index eaa724b99908..2b8a85689ab7 100644
> > --- a/mm/mprotect.c
> > +++ b/mm/mprotect.c
> > @@ -756,13 +756,11 @@ mprotect_fixup(struct vma_iterator *vmi, struct mmu_gather *tlb,
> >  		vma_flags_clear(&new_vma_flags, VMA_ACCOUNT_BIT);
> >  	}
> >
> > -	newflags = vma_flags_to_legacy(new_vma_flags);
> > -	vma = vma_modify_flags(vmi, *pprev, vma, start, end, &newflags);
> > +	vma = vma_modify_flags(vmi, *pprev, vma, start, end, &new_vma_flags);
> >  	if (IS_ERR(vma)) {
> >  		error = PTR_ERR(vma);
> >  		goto fail;
> >  	}
> > -	new_vma_flags = legacy_to_vma_flags(newflags);
> >
> >  	*pprev = vma;
> >
> > @@ -771,7 +769,7 @@ mprotect_fixup(struct vma_iterator *vmi, struct mmu_gather *tlb,
> >  	 * held in write mode.
> >  	 */
> >  	vma_start_write(vma);
> > -	vm_flags_reset_once(vma, newflags);
> > +	WRITE_ONCE(vma->flags, new_vma_flags);
>
> Ditto.

I mean overall these cases are hacks in my opinion to work around code that
should have solved their problem another way.

But sure, as above I'll add a helper function or such.

>
> >  	if (vma_wants_manual_pte_write_upgrade(vma))
> >  		mm_cp_flags |= MM_CP_TRY_CHANGE_WRITABLE;
> >  	vma_set_page_prot(vma);
> > @@ -796,6 +794,7 @@ mprotect_fixup(struct vma_iterator *vmi, struct mmu_gather *tlb,
> >  	}
> >
> >  	vm_stat_account(mm, vma_flags_to_legacy(old_vma_flags), -nrpages);
> > +	newflags = vma_flags_to_legacy(new_vma_flags);
> >  	vm_stat_account(mm, newflags, nrpages);
> >  	perf_event_mmap(vma);
> >  	return 0;
> > diff --git a/mm/mseal.c b/mm/mseal.c
> > index 316b5e1dec78..603df53ad267 100644

