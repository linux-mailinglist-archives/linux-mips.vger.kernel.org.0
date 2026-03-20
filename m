Return-Path: <linux-mips+bounces-13806-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGk6KQ4fvWnG6QIAu9opvQ
	(envelope-from <linux-mips+bounces-13806-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 11:18:54 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 274F72D8978
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 11:18:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60E43300E725
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 10:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1087A387589;
	Fri, 20 Mar 2026 10:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VpGnIYfO"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CB92DFF3F;
	Fri, 20 Mar 2026 10:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774001769; cv=none; b=qtQolArbYgq4453mNsovs/XRnK/5N7Y+32ODYNQH6Eol2qdsqB62lv1W7acQOFZuz29N/lNXeV8ZQEbKceeYZFN8d7C8py/U8kZvWzSKI1jiw2lRA/gsFkUGj4+dcdd7oMU+le1GX/XIWjwi+ysOygSMwYrpq5l575tmsrHLVKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774001769; c=relaxed/simple;
	bh=ap9t23GAznSjlYBwe3WH7nSlcvQ4uwkCMM8JPtwfdBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ADYwLkiOQCLI7UAt9MiTM9aWiu9hSrPPzSceYXsRo2YaK/vqHbBh4yvtBNcGg/npBOc5y4ew+NIUvYNraSmaPNtwUrHH7T4w9U5hJSaBbjIIgS9HMVnHZlycjj7Rg+O7Rrnx8Qd3B4fGIvstVWa55azipMJT2j4PWu4bodV2OI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VpGnIYfO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3FF9C4CEF7;
	Fri, 20 Mar 2026 10:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774001769;
	bh=ap9t23GAznSjlYBwe3WH7nSlcvQ4uwkCMM8JPtwfdBU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VpGnIYfOhfS5un78DFGTJ5loTHw41DGnYvLF83kfJLhLDtl86vDxsK7+kZYUzaYnE
	 5V9zcIkNRIqSzj4tbwQLydHMYDPmXOCMLIySJ4ULjxFk/lefzNfI9hnLeFOCIGnnDl
	 mAxr5fguFL4uy3itIhWz2Fy0cYKrzKJpZhkuV6STy5rmqivM3mA46b4dMOAVIm8aX5
	 aL1J/e+lrGnyidQShydB7ZP25CoL8lbUtLPYsSX+m708iSuLKQWfBy+aNV3CStt/8O
	 sw5JQcZVkYlp6nZd/W4kU0jl8JC6+CIhgGnco8oF5shbFK5ws3inZ7cQkjFITK2eiJ
	 D0/iPE2qO9fcw==
Message-ID: <a7535063-abaa-4f67-a090-4a47098f10e7@kernel.org>
Date: Fri, 20 Mar 2026 11:15:52 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/23] mm/vma: convert as much as we can in mm/vma.c to
 vma_flags_t
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
 <44a952b98d68fc231ab231de6de04b077866bab8.1773846935.git.ljs@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <44a952b98d68fc231ab231de6de04b077866bab8.1773846935.git.ljs@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-13806-lists,linux-mips=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 274F72D8978
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 16:50, Lorenzo Stoakes (Oracle) wrote:
> Now we have established a good foundation for vm_flags_t to vma_flags_t
> changes, update mm/vma.c to utilise vma_flags_t wherever possible.
> 
> We are able to convert VM_STARTGAP_FLAGS entirely as this is only used in
> mm/vma.c, and to account for the fact we can't use VM_NONE to make life
> easier, place the definition of this within existing #ifdef's to be
> cleaner.
> 
> Generally the remaining changes are mechanical.
> 
> Also update the VMA tests to reflect the changes.
> 
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

Nits:

> @@ -2338,8 +2339,11 @@ void mm_drop_all_locks(struct mm_struct *mm)
>   * We account for memory if it's a private writeable mapping,
>   * not hugepages and VM_NORESERVE wasn't set.
>   */
> -static bool accountable_mapping(struct file *file, vm_flags_t vm_flags)
> +static bool accountable_mapping(struct mmap_state *map)
>  {
> +	const struct file *file = map->file;
> +	vma_flags_t mask;
> +
>  	/*
>  	 * hugetlb has its own accounting separate from the core VM
>  	 * VM_HUGETLB may not be set yet so we cannot check for that flag.
> @@ -2347,7 +2351,9 @@ static bool accountable_mapping(struct file *file, vm_flags_t vm_flags)
>  	if (file && is_file_hugepages(file))
>  		return false;
>  
> -	return (vm_flags & (VM_NORESERVE | VM_SHARED | VM_WRITE)) == VM_WRITE;
> +	mask = vma_flags_and(&map->vma_flags, VMA_NORESERVE_BIT, VMA_SHARED_BIT,
> +			     VMA_WRITE_BIT);
> +	return vma_flags_same(&mask, VMA_WRITE_BIT);

Another case of possible refactor, if you agree with those pointed out in
earlier patch.

>  }
>  
>  /*

> @@ -2993,7 +2998,8 @@ unsigned long unmapped_area(struct vm_unmapped_area_info *info)
>  	gap = vma_iter_addr(&vmi) + info->start_gap;
>  	gap += (info->align_offset - gap) & info->align_mask;
>  	tmp = vma_next(&vmi);
> -	if (tmp && (tmp->vm_flags & VM_STARTGAP_FLAGS)) { /* Avoid prev check if possible */
> +	/* Avoid prev check if possible */
> +	if (tmp && (vma_test_any_mask(tmp, VMA_STARTGAP_FLAGS))) {

The parentheses around function call not necessary?

>  		if (vm_start_gap(tmp) < gap + length - 1) {
>  			low_limit = tmp->vm_end;
>  			vma_iter_reset(&vmi);
> @@ -3045,7 +3051,8 @@ unsigned long unmapped_area_topdown(struct vm_unmapped_area_info *info)
>  	gap -= (gap - info->align_offset) & info->align_mask;
>  	gap_end = vma_iter_end(&vmi);
>  	tmp = vma_next(&vmi);
> -	if (tmp && (tmp->vm_flags & VM_STARTGAP_FLAGS)) { /* Avoid prev check if possible */
> +	 /* Avoid prev check if possible */
> +	if (tmp && (vma_test_any_mask(tmp, VMA_STARTGAP_FLAGS))) {

Same.

>  		if (vm_start_gap(tmp) < gap_end) {
>  			high_limit = vm_start_gap(tmp);
>  			vma_iter_reset(&vmi);

