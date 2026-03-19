Return-Path: <linux-mips+bounces-13788-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8J7ZAKozvGl3uwIAu9opvQ
	(envelope-from <linux-mips+bounces-13788-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 19 Mar 2026 18:34:34 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A282D0155
	for <lists+linux-mips@lfdr.de>; Thu, 19 Mar 2026 18:34:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1A4630B0C07
	for <lists+linux-mips@lfdr.de>; Thu, 19 Mar 2026 17:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC563EF641;
	Thu, 19 Mar 2026 17:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ni11x5qH"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98C33EDAD9;
	Thu, 19 Mar 2026 17:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773941277; cv=none; b=sWqx/XwYBHaA6kiQrzyE/KZL5du+0biUx+LL93qtBe4jz2DPlX0eNdnGirHTz48jmI5xZzcaIZI1FwHjlChBL3dKJRjCJlKK1i2aiiaZQrfM6vhXIZB4C1QsCF0xj1lqB0XmVQ9aubHJ/hQrwnKqS0Rj8+kS5ApWk0m8RkWKpJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773941277; c=relaxed/simple;
	bh=wnmsKZ1D1KfzQIEHQIk8Eq+6eKtEf+x/yXH1sCkJxLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cOGdA+x+1gSAVDYaXSMKuxDeFNBqfEnBCFqCQhS/7TcuIwJ9NPUJRP4sBIbT3qKd7NulWleE/MuD7lHPP1J3P968bpey5yNJmE4zpJwTj1ncazMDItOw0GUgVjJk8bCMlVYw0sCW6Ua7M2WwCNUWUFNk4mlVe0QIUpePgbltAaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ni11x5qH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C008C19424;
	Thu, 19 Mar 2026 17:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773941277;
	bh=wnmsKZ1D1KfzQIEHQIk8Eq+6eKtEf+x/yXH1sCkJxLE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ni11x5qHEQ6U2LG6CI2Vjyjh8t7GcOt+96zl91V9r2Di7PZwwNlUqIZVECtb5H2w5
	 aQAItB7sZ8iybPVrttsTi0XPAtP+zr/ASNQ1euqvkmHf5ydGP6UZqDwpxf8ALEXyxe
	 8pCPJtXU8n7uKWcfbNhSoQVeIfHgpw1D/+DaX6oVnt1IqKlW7ofgHpLFNeb9PCwYJO
	 z9xyzSEe9mrHUJmqAXRi85ear0h0WPeoMl9z5fS+NVNSAnh6OhiWOJtu46EqEDWHpx
	 ropdkm9HGkEYmJPnTkidmpipti0N5Xx1ibqNhPY2cRQYPPciTZ+SLEtNcx/Gs/2xYI
	 UmlXn7wXZROVA==
Message-ID: <624d9f1f-656a-4a63-888c-e953b90bf56e@kernel.org>
Date: Thu, 19 Mar 2026 18:27:44 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/23] mm: unexport vm_brk_flags() and eliminate
 vm_flags parameter
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
 <297c7690f17257ba11a7b8c94fe54709a64d89fb.1773846935.git.ljs@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <297c7690f17257ba11a7b8c94fe54709a64d89fb.1773846935.git.ljs@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oracle.com,google.com,suse.de,kvack.org,vger.kernel.org,armlinux.org.uk,arm.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,nod.at,cambridgegreys.com,sipsolutions.net,zeniv.linux.org.uk,suse.cz,zte.com.cn,linux.dev,suse.com,paul-moore.com,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-13788-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[62];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vbabka@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A0A282D0155
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 16:50, Lorenzo Stoakes (Oracle) wrote:
> This function is only used by elf_load(), and that is a static function
> that doesn't need an exported symbol to invoke an internal function, so
> un-EXPORT_SYMBOLS() it.
> 
> Also, the vm_flags parameter is unnecessary, as we only ever set VM_EXEC,
> so simply make this parameter a boolean.
> 
> While we're here, clean up the mm.h definitions for the various vm_xxx()
> helpers so we actually specify parameter names and elide the redundant
> extern's.
> 
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

> ---
>  fs/binfmt_elf.c    |  3 +--
>  include/linux/mm.h | 12 ++++++------
>  mm/mmap.c          |  8 ++------
>  3 files changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
> index fb857faaf0d6..16a56b6b3f6c 100644
> --- a/fs/binfmt_elf.c
> +++ b/fs/binfmt_elf.c
> @@ -453,14 +453,13 @@ static unsigned long elf_load(struct file *filep, unsigned long addr,
>  		zero_end = ELF_PAGEALIGN(zero_end);
>  
>  		error = vm_brk_flags(zero_start, zero_end - zero_start,
> -				     prot & PROT_EXEC ? VM_EXEC : 0);
> +				     prot & PROT_EXEC);
>  		if (error)
>  			map_addr = error;
>  	}
>  	return map_addr;
>  }
>  
> -
>  static unsigned long total_mapping_size(const struct elf_phdr *phdr, int nr)
>  {
>  	elf_addr_t min_addr = -1;
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 0c35423177bf..42d346684678 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -4005,12 +4005,12 @@ static inline void mm_populate(unsigned long addr, unsigned long len) {}
>  #endif
>  
>  /* This takes the mm semaphore itself */
> -extern int __must_check vm_brk_flags(unsigned long, unsigned long, unsigned long);
> -extern int vm_munmap(unsigned long, size_t);
> -extern unsigned long __must_check vm_mmap(struct file *, unsigned long,
> -        unsigned long, unsigned long,
> -        unsigned long, unsigned long);
> -extern unsigned long __must_check vm_mmap_shadow_stack(unsigned long addr,
> +int __must_check vm_brk_flags(unsigned long addr, unsigned long request, bool is_exec);
> +int vm_munmap(unsigned long start, size_t len);
> +unsigned long __must_check vm_mmap(struct file *file, unsigned long addr,
> +		unsigned long len, unsigned long prot,
> +		unsigned long flag, unsigned long offset);
> +unsigned long __must_check vm_mmap_shadow_stack(unsigned long addr,
>  		unsigned long len, unsigned long flags);
>  
>  struct vm_unmapped_area_info {
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 79544d893411..2d2b814978bf 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -1201,8 +1201,9 @@ SYSCALL_DEFINE5(remap_file_pages, unsigned long, start, unsigned long, size,
>  	return ret;
>  }
>  
> -int vm_brk_flags(unsigned long addr, unsigned long request, vm_flags_t vm_flags)
> +int vm_brk_flags(unsigned long addr, unsigned long request, bool is_exec)
>  {
> +	const vm_flags_t vm_flags = is_exec ? VM_EXEC : 0;
>  	struct mm_struct *mm = current->mm;
>  	struct vm_area_struct *vma = NULL;
>  	unsigned long len;
> @@ -1217,10 +1218,6 @@ int vm_brk_flags(unsigned long addr, unsigned long request, vm_flags_t vm_flags)
>  	if (!len)
>  		return 0;
>  
> -	/* Until we need other flags, refuse anything except VM_EXEC. */
> -	if ((vm_flags & (~VM_EXEC)) != 0)
> -		return -EINVAL;
> -
>  	if (mmap_write_lock_killable(mm))
>  		return -EINTR;
>  
> @@ -1246,7 +1243,6 @@ int vm_brk_flags(unsigned long addr, unsigned long request, vm_flags_t vm_flags)
>  	mmap_write_unlock(mm);
>  	return ret;
>  }
> -EXPORT_SYMBOL(vm_brk_flags);
>  
>  static
>  unsigned long tear_down_vmas(struct mm_struct *mm, struct vma_iterator *vmi,


