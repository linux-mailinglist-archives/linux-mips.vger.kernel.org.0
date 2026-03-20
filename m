Return-Path: <linux-mips+bounces-13803-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGCqL2QavWnG6QIAu9opvQ
	(envelope-from <linux-mips+bounces-13803-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 10:59:00 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 537B82D8628
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 10:59:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D22D3074F24
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 09:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54E538A701;
	Fri, 20 Mar 2026 09:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQRWsGQH"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F83035C1B7;
	Fri, 20 Mar 2026 09:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774000668; cv=none; b=OV5GsaXVOw8T3T9ai1ltzn7HFIqo8MYKSaZ7TGVVHgHnZcI+JsT+T2IRq1cHpE03VUyXcwJu1NtEHvwVOY9xFXDT6mt/FY1ZOnGv/Hahtm71UEr0qY6hjyrJi4b6beMyWPPPlyhiOSu5XYHWfmH+WyAyceDhxURZdZPyYnDEiQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774000668; c=relaxed/simple;
	bh=BHH+c4Y1mXQAFcGaqGCCWfuTYkgGp//q1BrbsXIDSaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=klSwSzY6iZOq3Ew2A7vk6ZHgQMk2MJE+oukf5fR9WOilr4o83F9ZnUGuRD+WQOflsoCNeldc6kzks3pzVqGaUPQhrP86ftJIc/Mb++75J5W8PO1y59H3jBgGjuFr8gT6YvhS5+vQzNm5JA4EVmElhuQMjzAYxPFuPdn881u2/u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQRWsGQH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 857BBC4CEF7;
	Fri, 20 Mar 2026 09:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774000668;
	bh=BHH+c4Y1mXQAFcGaqGCCWfuTYkgGp//q1BrbsXIDSaQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QQRWsGQH7qeVicMQ3QSUVrL6+6ykgppWH2udWWMxJcvzUOilTI2D7Y834vvr9Cqyt
	 icef8KeIyRBqnM8w4ArrDNWl6Ob6UJXBNgrvlMt/tBdIreYgyDBKMJlUoyuOasLmfa
	 iMtWGY20neqLWTJ9QFVatHUq5kcOHBKCnWsq8XUDgm0NFAhoArRULvDwYK/kV6czLG
	 7ILzyx2cbMCcr+fQ27sX6WdG5X0iCQZVcM/UkIyri/M4ayLGpsmDafgz5CXXcO9/eT
	 NoXV7TLdZ3AryMYN76uq3e720RaA8DpDZue8f2q9/TUxNy/PRtDVcIeYSQDOm+3jmm
	 Zksp5/xFc4XNg==
Message-ID: <1d300b3b-2476-4381-b8df-a680f486b284@kernel.org>
Date: Fri, 20 Mar 2026 10:57:32 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/23] mm: convert do_brk_flags() to use vma_flags_t
Content-Language: en-US
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
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
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <981ed1afcd19115432e61778e7d226a36f8f5c2b.1773846935.git.ljs@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oracle.com,google.com,suse.de,kvack.org,vger.kernel.org,armlinux.org.uk,arm.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,nod.at,cambridgegreys.com,sipsolutions.net,zeniv.linux.org.uk,suse.cz,zte.com.cn,linux.dev,suse.com,paul-moore.com,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-13803-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[62];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vbabka@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[paul-moore.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 537B82D8628
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 16:50, Lorenzo Stoakes (Oracle) wrote:
> In order to be able to do this, we need to change VM_DATA_DEFAULT_FLAGS
> and friends and update the architecture-specific definitions also.
> 
> We then have to update some KSM logic to handle VMA flags, and introduce
> VMA_STACK_FLAGS to define the vma_flags_t equivalent of VM_STACK_FLAGS.
> 
> We also introduce two helper functions for use during the time we are
> converting legacy flags to vma_flags_t values - vma_flags_to_legacy() and
> legacy_to_vma_flags().

Nit: this was done by an earlier patch.

> This enables us to iteratively make changes to break these changes up into
> separate parts.
> 
> We use these explicitly here to keep VM_STACK_FLAGS around for certain
> users which need to maintain the legacy vm_flags_t values for the time
> being.
> 
> We are no longer able to rely on the simple VM_xxx being set to zero if
> the feature is not enabled, so in the case of VM_DROPPABLE we introduce
> VMA_DROPPABLE as the vma_flags_t equivalent, which is set to
> EMPTY_VMA_FLAGS if the droppable flag is not available.
> 
> While we're here, we make the description of do_brk_flags() into a kdoc
> comment, as it almost was already.
> 
> We use vma_flags_to_legacy() to not need to update the vm_get_page_prot()
> logic as this time.
> 
> Note that in create_init_stack_vma() we have to replace the BUILD_BUG_ON()
> with a VM_WARN_ON_ONCE() as the tested values are no longer build time
> available.
> 
> We also update mprotect_fixup() to use VMA flags where possible, though we
> have to live with a little duplication between vm_flags_t and vma_flags_t
> values for the time being until further conversions are made.
> 
> Finally, we update the VMA tests to reflect these changes.
> 
> Acked-by: Paul Moore <paul@paul-moore.com>	[SELinux]
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

More nits below:

> diff --git a/arch/arm64/include/asm/page.h b/arch/arm64/include/asm/page.h
> index b39cc1127e1f..e25d0d18f6d7 100644
> --- a/arch/arm64/include/asm/page.h
> +++ b/arch/arm64/include/asm/page.h
> @@ -46,7 +46,12 @@ int pfn_is_map_memory(unsigned long pfn);
>  
>  #endif /* !__ASSEMBLER__ */
>  
> -#define VM_DATA_DEFAULT_FLAGS	(VM_DATA_FLAGS_TSK_EXEC | VM_MTE_ALLOWED)
> +#ifdef CONFIG_ARM64_MTE
> +#define VMA_DATA_DEFAULT_FLAGS	append_vma_flags(VMA_DATA_FLAGS_TSK_EXEC, \
> +						 VMA_MTE_ALLOWED_BIT)

I wonder what's the bloat-o-meter impact of these #define's (this
arm64-specific one isn't the only one) being no longer compile-time-constants?

> +#else
> +#define VMA_DATA_DEFAULT_FLAGS	VMA_DATA_FLAGS_TSK_EXEC
> +#endif
>  
>  #include <asm-generic/getorder.h>
>  

> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h

>  
> +#define VMA_STACK_FLAGS	append_vma_flags(VMA_STACK_DEFAULT_FLAGS,	\
> +		VMA_STACK_BIT, VMA_ACCOUNT_BIT)
> +
> +/* Temporary until VMA flags conversion complete. */
> +#define VM_STACK_FLAGS vma_flags_to_legacy(VMA_STACK_FLAGS)
> +
>  #define VM_STARTGAP_FLAGS (VM_GROWSDOWN | VM_SHADOW_STACK)
>  
>  #ifdef CONFIG_MSEAL_SYSTEM_MAPPINGS
> @@ -536,8 +547,6 @@ enum {
>  #define VM_SEALED_SYSMAP	VM_NONE
>  #endif
>  
> -#define VM_STACK_FLAGS	(VM_STACK | VM_STACK_DEFAULT_FLAGS | VM_ACCOUNT)
> -
>  /* VMA basic access permission flags */
>  #define VM_ACCESS_FLAGS (VM_READ | VM_WRITE | VM_EXEC)
>  #define VMA_ACCESS_FLAGS mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT, VMA_EXEC_BIT)
> @@ -547,6 +556,9 @@ enum {
>   */
>  #define VM_SPECIAL (VM_IO | VM_DONTEXPAND | VM_PFNMAP | VM_MIXEDMAP)
>  
> +#define VMA_SPECIAL_FLAGS mk_vma_flags(VMA_IO_BIT, VMA_DONTEXPAND_BIT, \
> +				       VMA_PFNMAP_BIT, VMA_MIXEDMAP_BIT)

Should VM_SPECIAL be also redefined using vma_flags_to_legacy()?

> +
>  /*
>   * Physically remapped pages are special. Tell the
>   * rest of the world about it:
> @@ -1412,7 +1424,7 @@ static __always_inline void vma_desc_set_flags_mask(struct vm_area_desc *desc,
>   * vm_area_desc object describing a proposed VMA, e.g.:
>   *
>   * vma_desc_set_flags(desc, VMA_IO_BIT, VMA_PFNMAP_BIT, VMA_DONTEXPAND_BIT,
> - *		VMA_DONTDUMP_BIT);
> + *              VMA_DONTDUMP_BIT);

Looks like spurious tabs-to-space change inconsistent with other instances.

>   */
>  #define vma_desc_set_flags(desc, ...) \
>  	vma_desc_set_flags_mask(desc, mk_vma_flags(__VA_ARGS__))
> @@ -4059,7 +4071,6 @@ extern int replace_mm_exe_file(struct mm_struct *mm, struct file *new_exe_file);
>  extern struct file *get_mm_exe_file(struct mm_struct *mm);
>  extern struct file *get_task_exe_file(struct task_struct *task);
>  
> -extern bool may_expand_vm(struct mm_struct *, vm_flags_t, unsigned long npages);
>  extern void vm_stat_account(struct mm_struct *, vm_flags_t, long npages);
>  
>  extern bool vma_is_special_mapping(const struct vm_area_struct *vma,
> diff --git a/mm/internal.h b/mm/internal.h
> index f98f4746ac41..80d8651441a7 100644

> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 9681f055b9fc..eaa724b99908 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c

> @@ -773,19 +778,24 @@ mprotect_fixup(struct vma_iterator *vmi, struct mmu_gather *tlb,
>  
>  	change_protection(tlb, vma, start, end, mm_cp_flags);
>  
> -	if ((oldflags & VM_ACCOUNT) && !(newflags & VM_ACCOUNT))
> +	if (vma_flags_test(&old_vma_flags, VMA_ACCOUNT_BIT) &&
> +	    !vma_flags_test(&new_vma_flags, VMA_ACCOUNT_BIT))
>  		vm_unacct_memory(nrpages);
>  
>  	/*
>  	 * Private VM_LOCKED VMA becoming writable: trigger COW to avoid major
>  	 * fault on access.
>  	 */
> -	if ((oldflags & (VM_WRITE | VM_SHARED | VM_LOCKED)) == VM_LOCKED &&
> -			(newflags & VM_WRITE)) {
> -		populate_vma_page_range(vma, start, end, NULL);
> +	if (vma_flags_test(&new_vma_flags, VMA_WRITE_BIT)) {
> +		const vma_flags_t mask =
> +			vma_flags_and(&old_vma_flags, VMA_WRITE_BIT,
> +				      VMA_SHARED_BIT, VMA_LOCKED_BIT);
> +
> +		if (vma_flags_same(&mask, VMA_LOCKED_BIT))

That converts the original logic 1:1, but I wonder if it's now feasible to
write it more obviously as "VMA_LOCKED_BIT must be set, VM_WRITE_BIT and
VM_SHARED_BIT must not" ?

> +			populate_vma_page_range(vma, start, end, NULL);
>  	}
>  
> -	vm_stat_account(mm, oldflags, -nrpages);
> +	vm_stat_account(mm, vma_flags_to_legacy(old_vma_flags), -nrpages);
>  	vm_stat_account(mm, newflags, nrpages);
>  	perf_event_mmap(vma);
>  	return 0;

> diff --git a/mm/vma.h b/mm/vma.h
> index cf8926558bf6..1f2de6cb3b97 100644
> --- a/mm/vma.h
> +++ b/mm/vma.h

> +static inline bool is_data_mapping_vma_flags(const vma_flags_t *vma_flags)
> +{
> +	const vma_flags_t mask = vma_flags_and(vma_flags,
> +			VMA_WRITE_BIT, VMA_SHARED_BIT, VMA_STACK_BIT);
> +
> +	return vma_flags_same(&mask, VMA_WRITE_BIT);

Ditto?

> +}
>  
>  static inline void vma_iter_config(struct vma_iterator *vmi,
>  		unsigned long index, unsigned long last)
> diff --git a/mm/vma_exec.c b/mm/vma_exec.c
> index 8134e1afca68..5cee8b7efa0f 100644

