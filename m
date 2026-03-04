Return-Path: <linux-mips+bounces-13361-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCPaGO3yp2mtmwAAu9opvQ
	(envelope-from <linux-mips+bounces-13361-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 09:53:01 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CE21FCF60
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 09:53:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CAD7C30DB182
	for <lists+linux-mips@lfdr.de>; Wed,  4 Mar 2026 08:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1710394792;
	Wed,  4 Mar 2026 08:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MlL8Gp8h"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC79D39478C;
	Wed,  4 Mar 2026 08:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772614152; cv=none; b=T3kJ03Dkbtu4Ay3OF+BNlZB/O4wlfdExIzxTx/Fln/ps3/aHIwDIahifvAc97HhBvYjO+ppTgCjFe5QVWu8/bVcPwA33tGggFJ1su/Z+tzy8K8NOB7QV15bZKiXfEo9Jx99v8GwD/QH3kQBKV+kV164lI8bVzV/B5fwZrjNse4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772614152; c=relaxed/simple;
	bh=TD8F4xQavyxZ5Y5KpJUoNpSILLZS41Y69rivFsWe7vQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=llrm1GCxyGwP5FnSqdig27DDJm2L9WV4x79S7p+YjT9NWhUSjMMZL111pCVQR6rOGGqug4/gkm1yRgJtX2MjLKpcOxqUkCd9X8Fry83MeYtXob5bPc7xij4yzCq913V2IZG1uZQrmPGDstcItyItSIWXslky5H3OzFHME3v3sBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MlL8Gp8h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A447EC19423;
	Wed,  4 Mar 2026 08:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772614152;
	bh=TD8F4xQavyxZ5Y5KpJUoNpSILLZS41Y69rivFsWe7vQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MlL8Gp8hwogxltsa4BXo64o0kOu/E+O7UXlChe6ulR4Cyqo/1XaTYAe5rnx1uzYs+
	 8E7SttY7nPdc6+UGwgtvQV2zMhpCw6zHvfK+O4+RB2eX++KZEJ+wrx5IN1vQP3eVTG
	 Gpxei4kfTLRUtamcIKXbmA7jeaQNKdS2Hf5ZOikYurGMJdjGvfEOAtz6OEGm63aX7r
	 oAoRn9HMKoe0grgeSP0zt8DgIOi72y1zHJ66LLGjOWGEfNZQaKE1xFsWcRxrO4jOLW
	 BnxJw22oYlX3M1v0bwjZdfuMve9KBr6/1t/MEGHZdtVvb/ys9lY+3QBMxBA7YpfXBe
	 nQxaQQ34/1wiA==
Message-ID: <dcef1004-3087-4a3a-942f-3e2bf3084a4c@kernel.org>
Date: Wed, 4 Mar 2026 09:49:03 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/14] vdso/datastore: Allocate data pages dynamically
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Andy Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnd Bergmann
 <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>,
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Russell King
 <linux@armlinux.org.uk>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>,
 Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
References: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
 <20260304-vdso-sparc64-generic-2-v6-3-d8eb3b0e1410@linutronix.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260304-vdso-sparc64-generic-2-v6-3-d8eb3b0e1410@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C8CE21FCF60
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13361-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linutronix.de,kernel.org,arm.com,arndb.de,davemloft.net,gaisler.com,oracle.com,google.com,physik.fu-berlin.de,mit.edu,zx2c4.com,armlinux.org.uk,linux.ibm.com,ellerman.id.au,gmail.com,xen0n.name,alpha.franken.de,onemain.com];
	URIBL_MULTI_FAIL(0.00)[linutronix.de:server fail,tor.lore.kernel.org:server fail];
	RCPT_COUNT_TWELVE(0.00)[37];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linutronix.de:email]
X-Rspamd-Action: no action



Le 04/03/2026 à 08:49, Thomas Weißschuh a écrit :
> Allocating the data pages as part of the kernel image does not work on
> SPARC. The MMU will through a fault when userspace tries to access them.
> 
> Allocate the data pages through the page allocator instead.
> Unused pages in the vDSO VMA are still allocated to keep the virtual
> addresses aligned. Switch the mapping from PFNs to 'struct page' as that
> is required for dynamically allocated pages.
> This also aligns the allocation of the datapages with the code
> pages and is a prerequisite for mlockall() support.
> 
> VM_MIXEDMAP is necessary for the call to vmf_insert_page() in the timens
> prefault path to work.
> 
> The data pages need to be order-0, non-compound pages so that the
> mapping to userspace and the different orderings work.
> 
> These pages are also used by the timekeeping, random pool and
> architecture initialization code. Some of these are running before the
> page allocator is available. To keep these subsytems working without
> changes, introduce early, statically data storage which will then
> replaced by the real one as soon as that is available.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   include/linux/vdso_datastore.h |  6 +++
>   init/main.c                    |  2 +
>   lib/vdso/datastore.c           | 92 +++++++++++++++++++++++++++---------------
>   3 files changed, 68 insertions(+), 32 deletions(-)
> 
> diff --git a/include/linux/vdso_datastore.h b/include/linux/vdso_datastore.h
> index a91fa24b06e0..0b530428db71 100644
> --- a/include/linux/vdso_datastore.h
> +++ b/include/linux/vdso_datastore.h
> @@ -2,9 +2,15 @@
>   #ifndef _LINUX_VDSO_DATASTORE_H
>   #define _LINUX_VDSO_DATASTORE_H
>   
> +#ifdef CONFIG_HAVE_GENERIC_VDSO
>   #include <linux/mm_types.h>
>   
>   extern const struct vm_special_mapping vdso_vvar_mapping;
>   struct vm_area_struct *vdso_install_vvar_mapping(struct mm_struct *mm, unsigned long addr);
>   
> +void __init vdso_setup_data_pages(void);
> +#else /* !CONFIG_HAVE_GENERIC_VDSO */
> +static inline void vdso_setup_data_pages(void) { }
> +#endif /* CONFIG_HAVE_GENERIC_VDSO */
> +
>   #endif /* _LINUX_VDSO_DATASTORE_H */
> diff --git a/init/main.c b/init/main.c
> index 1cb395dd94e4..de867b2693d2 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -105,6 +105,7 @@
>   #include <linux/ptdump.h>
>   #include <linux/time_namespace.h>
>   #include <linux/unaligned.h>
> +#include <linux/vdso_datastore.h>
>   #include <net/net_namespace.h>
>   
>   #include <asm/io.h>
> @@ -1119,6 +1120,7 @@ void start_kernel(void)
>   	srcu_init();
>   	hrtimers_init();
>   	softirq_init();
> +	vdso_setup_data_pages();
>   	timekeeping_init();
>   	time_init();
>   
> diff --git a/lib/vdso/datastore.c b/lib/vdso/datastore.c
> index 7377fcb6e1df..faebf5b7cd6e 100644
> --- a/lib/vdso/datastore.c
> +++ b/lib/vdso/datastore.c
> @@ -1,52 +1,79 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   
> -#include <linux/linkage.h>
> +#include <linux/gfp.h>
> +#include <linux/init.h>
>   #include <linux/mm.h>
>   #include <linux/time_namespace.h>
>   #include <linux/types.h>
>   #include <linux/vdso_datastore.h>
>   #include <vdso/datapage.h>
>   
> -/*
> - * The vDSO data page.
> - */
> +static u8 vdso_initdata[VDSO_NR_PAGES * PAGE_SIZE] __aligned(PAGE_SIZE) __initdata = {};
> +
>   #ifdef CONFIG_GENERIC_GETTIMEOFDAY
> -static union {
> -	struct vdso_time_data	data;
> -	u8			page[PAGE_SIZE];
> -} vdso_time_data_store __page_aligned_data;
> -struct vdso_time_data *vdso_k_time_data = &vdso_time_data_store.data;
> -static_assert(sizeof(vdso_time_data_store) == PAGE_SIZE);
> +struct vdso_time_data *vdso_k_time_data __refdata =
> +	(void *)&vdso_initdata[VDSO_TIME_PAGE_OFFSET * PAGE_SIZE];
> +
> +static_assert(sizeof(struct vdso_time_data) <= PAGE_SIZE);
>   #endif /* CONFIG_GENERIC_GETTIMEOFDAY */
>   
>   #ifdef CONFIG_VDSO_GETRANDOM
> -static union {
> -	struct vdso_rng_data	data;
> -	u8			page[PAGE_SIZE];
> -} vdso_rng_data_store __page_aligned_data;
> -struct vdso_rng_data *vdso_k_rng_data = &vdso_rng_data_store.data;
> -static_assert(sizeof(vdso_rng_data_store) == PAGE_SIZE);
> +struct vdso_rng_data *vdso_k_rng_data __refdata =
> +	(void *)&vdso_initdata[VDSO_RNG_PAGE_OFFSET * PAGE_SIZE];
> +
> +static_assert(sizeof(struct vdso_rng_data) <= PAGE_SIZE);
>   #endif /* CONFIG_VDSO_GETRANDOM */
>   
>   #ifdef CONFIG_ARCH_HAS_VDSO_ARCH_DATA
> -static union {
> -	struct vdso_arch_data	data;
> -	u8			page[VDSO_ARCH_DATA_SIZE];
> -} vdso_arch_data_store __page_aligned_data;
> -struct vdso_arch_data *vdso_k_arch_data = &vdso_arch_data_store.data;
> +struct vdso_arch_data *vdso_k_arch_data __refdata =
> +	(void *)&vdso_initdata[VDSO_ARCH_PAGES_START * PAGE_SIZE];
>   #endif /* CONFIG_ARCH_HAS_VDSO_ARCH_DATA */
>   
> +void __init vdso_setup_data_pages(void)
> +{
> +	unsigned int order = get_order(VDSO_NR_PAGES * PAGE_SIZE);
> +	struct page *pages;
> +
> +	/*
> +	 * Allocate the data pages dynamically. SPARC does not support mapping
> +	 * static pages to be mapped into userspace.
> +	 * It is also a requirement for mlockall() support.
> +	 *
> +	 * Do not use folios. In time namespaces the pages are mapped in a different order
> +	 * to userspace, which is not handled by the folio optimizations in finish_fault().
> +	 */
> +	pages = alloc_pages(GFP_KERNEL, order);
> +	if (!pages)
> +		panic("Unable to allocate VDSO storage pages");
> +
> +	/* The pages are mapped one-by-one into userspace and each one needs to be refcounted. */
> +	split_page(pages, order);
> +
> +	/* Move the data already written by other subsystems to the new pages */
> +	memcpy(page_address(pages), vdso_initdata, VDSO_NR_PAGES * PAGE_SIZE);
> +
> +	if (IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY))
> +		vdso_k_time_data = page_address(pages + VDSO_TIME_PAGE_OFFSET);
> +
> +	if (IS_ENABLED(CONFIG_VDSO_GETRANDOM))
> +		vdso_k_rng_data = page_address(pages + VDSO_RNG_PAGE_OFFSET);
> +
> +	if (IS_ENABLED(CONFIG_ARCH_HAS_VDSO_ARCH_DATA))
> +		vdso_k_arch_data = page_address(pages + VDSO_ARCH_PAGES_START);
> +}
> +
>   static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
>   			     struct vm_area_struct *vma, struct vm_fault *vmf)
>   {
> -	struct page *timens_page = find_timens_vvar_page(vma);
> -	unsigned long pfn;
> +	struct page *page, *timens_page;
> +
> +	timens_page = find_timens_vvar_page(vma);
>   
>   	switch (vmf->pgoff) {
>   	case VDSO_TIME_PAGE_OFFSET:
>   		if (!IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY))
>   			return VM_FAULT_SIGBUS;
> -		pfn = __phys_to_pfn(__pa_symbol(vdso_k_time_data));
> +		page = virt_to_page(vdso_k_time_data);
>   		if (timens_page) {
>   			/*
>   			 * Fault in VVAR page too, since it will be accessed
> @@ -56,10 +83,10 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
>   			vm_fault_t err;
>   
>   			addr = vmf->address + VDSO_TIMENS_PAGE_OFFSET * PAGE_SIZE;
> -			err = vmf_insert_pfn(vma, addr, pfn);
> +			err = vmf_insert_page(vma, addr, page);
>   			if (unlikely(err & VM_FAULT_ERROR))
>   				return err;
> -			pfn = page_to_pfn(timens_page);
> +			page = timens_page;
>   		}
>   		break;
>   	case VDSO_TIMENS_PAGE_OFFSET:
> @@ -72,24 +99,25 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
>   		 */
>   		if (!IS_ENABLED(CONFIG_TIME_NS) || !timens_page)
>   			return VM_FAULT_SIGBUS;
> -		pfn = __phys_to_pfn(__pa_symbol(vdso_k_time_data));
> +		page = virt_to_page(vdso_k_time_data);
>   		break;
>   	case VDSO_RNG_PAGE_OFFSET:
>   		if (!IS_ENABLED(CONFIG_VDSO_GETRANDOM))
>   			return VM_FAULT_SIGBUS;
> -		pfn = __phys_to_pfn(__pa_symbol(vdso_k_rng_data));
> +		page = virt_to_page(vdso_k_rng_data);
>   		break;
>   	case VDSO_ARCH_PAGES_START ... VDSO_ARCH_PAGES_END:
>   		if (!IS_ENABLED(CONFIG_ARCH_HAS_VDSO_ARCH_DATA))
>   			return VM_FAULT_SIGBUS;
> -		pfn = __phys_to_pfn(__pa_symbol(vdso_k_arch_data)) +
> -			vmf->pgoff - VDSO_ARCH_PAGES_START;
> +		page = virt_to_page(vdso_k_arch_data) + vmf->pgoff - VDSO_ARCH_PAGES_START;
>   		break;
>   	default:
>   		return VM_FAULT_SIGBUS;
>   	}
>   
> -	return vmf_insert_pfn(vma, vmf->address, pfn);
> +	get_page(page);
> +	vmf->page = page;
> +	return 0;
>   }
>   
>   const struct vm_special_mapping vdso_vvar_mapping = {
> @@ -101,7 +129,7 @@ struct vm_area_struct *vdso_install_vvar_mapping(struct mm_struct *mm, unsigned
>   {
>   	return _install_special_mapping(mm, addr, VDSO_NR_PAGES * PAGE_SIZE,
>   					VM_READ | VM_MAYREAD | VM_IO | VM_DONTDUMP |
> -					VM_PFNMAP | VM_SEALED_SYSMAP,
> +					VM_MIXEDMAP | VM_SEALED_SYSMAP,
>   					&vdso_vvar_mapping);
>   }
>   
> 


