Return-Path: <linux-mips+bounces-15436-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hr/ZBdmMRmquYQsAu9opvQ
	(envelope-from <linux-mips+bounces-15436-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 02 Jul 2026 18:07:53 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 108F66F9F1B
	for <lists+linux-mips@lfdr.de>; Thu, 02 Jul 2026 18:07:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RQbSkv+E;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15436-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15436-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B4C5F30881A8
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jul 2026 15:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC7A3346A8;
	Thu,  2 Jul 2026 15:53:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52DA318ED9;
	Thu,  2 Jul 2026 15:53:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783007606; cv=none; b=QITPnA1DsfaabAcCUYun1ADuSVmW3VC0GvOVM9AeoRehvqpuhwQJbYAZTzDCAJAsrl+bWbqoUWsTthsdYcTdHTAKTdMwbMWWobG7EppD7xGouM+OtL99mdqp6p6YMY1rXdK/43dNqKjtdhB+enEyArX0d8vLxS27kxyJD40eZ6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783007606; c=relaxed/simple;
	bh=G3R3XVM72MpaRpXMUu4AsaetodMwDO7DaeF/yHf7CG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PODBy/Mi1N8nnBRNg186MZu08n1aClqsVciZB82/d5omTRo2Tykunq411Vr2MhnSyFkxC4gWX/wVZssxzuvURAE0Lmd/XNP0LIuG2xm776Y7HO2fxGks9iEi8CmMp4wFlNh7uBwCJLwDpJne+9L01rFmQuMe121hM6veJ+PlkS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQbSkv+E; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87BC51F000E9;
	Thu,  2 Jul 2026 15:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783007605;
	bh=rQoQgNL4RLwOJnesXJ906iiowNQYEhnsDiycftRDMfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RQbSkv+EjZljB5g46djvoiDLFxojsXRU7Kht7L4jS+hQfEbvLoddE5ik5cDm8RdCY
	 BqtXzK5uRv9pKYN6O4Tsu8EtqfPc36l/PyBm4MnF4L/Lj7XhDm03p3BdIE6c5nK+EW
	 WgpMr9xlTDqRIB0VqPTmKhcFe7wtPBcgkLNUiWKV6EXjD7eDfr1juT0c0xwZM3oIhX
	 yoTEQ0aDxj88mE4YuknOHetVU7Tkkxdet4F5l/46xPMCuTjg7uKR5BnT4gNu2YfNUW
	 X6p/cRUZ6h1qZ1EK6Q4sO2TBLVEUPUv3Po11nDMVUJoDiNp2oyKVRliXzikuEZxJQO
	 doneV51wWqdgg==
Date: Thu, 2 Jul 2026 16:53:01 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, tsbogend@alpha.franken.de, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	l.stach@pengutronix.de, inki.dae@samsung.com, sw0312.kim@samsung.com, 
	kyungmin.park@samsung.com, krzk@kernel.org, peter.griffin@linaro.org, 
	jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, 
	tursulin@ursulin.net, robin.clark@oss.qualcomm.com, lumag@kernel.org, lyude@redhat.com, 
	dakr@kernel.org, tomi.valkeinen@ideasonboard.com, hjc@rock-chips.com, 
	heiko@sntech.de, andy.yan@rock-chips.com, thierry.reding@kernel.org, 
	mperttunen@nvidia.com, jonathanh@nvidia.com, kraxel@redhat.com, 
	dmitry.osipenko@collabora.com, zack.rusin@broadcom.com, matthew.brost@intel.com, 
	thomas.hellstrom@linux.intel.com, oleksandr_andrushchenko@epam.com, deller@gmx.de, bcrl@kvack.org, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, muchun.song@linux.dev, osalvador@suse.de, 
	david@kernel.org, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	liam@infradead.org, npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	baohua@kernel.org, hughd@google.com, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, jannh@google.com, pfalcato@suse.de, 
	kees@kernel.org, perex@perex.cz, tiwai@suse.com, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
	etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, linux-fbdev@vger.kernel.org, 
	linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 12/13] mm/mprotect: convert mprotect code to use
 vma_flags_t
Message-ID: <akaIfhfbTCAdJm3H@lucifer>
References: <7ef626d8a12dc742cfc09d080be5dc09850e873a.1782760670.git.ljs@kernel.org>
 <20260701160917.91435-1-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701160917.91435-1-lance.yang@linux.dev>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15436-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[linux-foundation.org,alpha.franken.de,linux.ibm.com,ellerman.id.au,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,samsung.com,linaro.org,intel.com,ursulin.net,oss.qualcomm.com,redhat.com,ideasonboard.com,rock-chips.com,sntech.de,nvidia.com,collabora.com,broadcom.com,epam.com,gmx.de,kvack.org,zeniv.linux.org.uk,linux.dev,linux.alibaba.com,infradead.org,arm.com,google.com,suse.com,perex.cz,vger.kernel.org,lists.ozlabs.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lance.yang@linux.dev,m:akpm@linux-foundation.org,m:tsbogend@alpha.franken.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:l.stach@pengutronix.de,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:lyude@redhat.com,m:dakr@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:zack.rusin@broadcom.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:oleksandr_andrushchenko@epam.com,m:deller@gmx.de,m:bcrl@kvack.org,m:viro@z
 eniv.linux.org.uk,m:brauner@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:ziy@nvidia.com,m:baolin.wang@linux.alibaba.com,m:liam@infradead.org,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:hughd@google.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:kees@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:dri-devel@lists.freedesktop.org,m:etnaviv@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-rockchip@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:xen-devel@lists.xenproject.org,m:linux-fbdev@vger.kernel.o
 rg,m:linux-aio@kvack.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-sound@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[82];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-mips@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lucifer:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 108F66F9F1B

On Thu, Jul 02, 2026 at 12:09:17AM +0800, Lance Yang wrote:
>
> On Mon, Jun 29, 2026 at 08:25:35PM +0100, Lorenzo Stoakes wrote:
> >Replace use of the legacy vm_flags_t flags with vma_flags_t values
> >throughout the mprotect logic.
> >
> >Note that we retain the legacy vm_flags_t bit shifting code in
> >do_mprotect_key(), deferring a vma_flags_t approach to this for the time
> >being.
> >
> >Additionally update comments to reflect the changes to be consistent.
> >
> >No functional change intended.
> >
> >Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> >---
> > mm/mprotect.c | 16 ++++++++--------
> > 1 file changed, 8 insertions(+), 8 deletions(-)
> >
> >diff --git a/mm/mprotect.c b/mm/mprotect.c
> >index 9cbf932b028c..c9504b2a2525 100644
> >--- a/mm/mprotect.c
> >+++ b/mm/mprotect.c
> >@@ -40,7 +40,7 @@
> >
> > static bool maybe_change_pte_writable(struct vm_area_struct *vma, pte_t pte)
> > {
> >-	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
> >+	if (WARN_ON_ONCE(!vma_test(vma, VMA_WRITE_BIT)))
> > 		return false;
> >
> > 	/* Don't touch entries that are not even readable. */
> >@@ -97,7 +97,7 @@ static bool can_change_shared_pte_writable(struct vm_area_struct *vma,
> > bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
> > 			     pte_t pte)
> > {
> >-	if (!(vma->vm_flags & VM_SHARED))
> >+	if (!vma_test(vma, VMA_SHARED_BIT))
> > 		return can_change_private_pte_writable(vma, addr, pte);
> >
> > 	return can_change_shared_pte_writable(vma, pte);
> >@@ -194,7 +194,7 @@ static __always_inline void set_write_prot_commit_flush_ptes(struct vm_area_stru
> > {
> > 	bool set_write;
> >
> >-	if (vma->vm_flags & VM_SHARED) {
> >+	if (vma_test(vma, VMA_SHARED_BIT)) {
> > 		set_write = can_change_shared_pte_writable(vma, ptent);
> > 		prot_commit_flush_ptes(vma, addr, ptep, oldpte, ptent, nr_ptes,
> > 				       /* idx = */ 0, set_write, tlb);
> >@@ -811,8 +811,8 @@ mprotect_fixup(struct vma_iterator *vmi, struct mmu_gather *tlb,
> > 		vm_unacct_memory(nrpages);
> >
> > 	/*
> >-	 * Private VM_LOCKED VMA becoming writable: trigger COW to avoid major
> >-	 * fault on access.
> >+	 * Private VMA_LOCKED_BIT VMA becoming writable: trigger COW to avoid
> >+	 * major fault on access.
> > 	 */
> > 	if (vma_flags_test(&new_vma_flags, VMA_WRITE_BIT) &&
> > 	    vma_flags_test(&old_vma_flags, VMA_LOCKED_BIT) &&
> >@@ -886,7 +886,7 @@ static int do_mprotect_pkey(unsigned long start, size_t len,
> > 			goto out;
> > 		start = vma->vm_start;
> > 		error = -EINVAL;
> >-		if (!(vma->vm_flags & VM_GROWSDOWN))
> >+		if (!vma_test(vma, VMA_GROWSDOWN_BIT))
> > 			goto out;
> > 	} else {
> > 		if (vma->vm_start > start)
> >@@ -894,7 +894,7 @@ static int do_mprotect_pkey(unsigned long start, size_t len,
> > 		if (unlikely(grows & PROT_GROWSUP)) {
> > 			end = vma->vm_end;
> > 			error = -EINVAL;
> >-			if (!(vma->vm_flags & VM_GROWSUP))
> >+			if (!vma_test(vma, VMA_GROWSUP_BIT))
>
> IIUC, should this be
>
> if (!vma_test_single_mask(vma, VMA_GROWSUP))
>
> instead?
>
> #elif defined(CONFIG_PARISC)
> #define VM_GROWSUP	INIT_VM_FLAG(GROWSUP)
> ...
> #ifndef VM_GROWSUP
> #define VM_GROWSUP	VM_NONE
> ...
>
> VM_GROWSUP is only defined as GROWSUP on parisc and becomes VM_NONE
> elsewhere. But VMA_GROWSUP_BIT is the raw ARCH_1 bit, which is also used
> for other arch-specific VMA flags:
>
> 	DECLARE_VMA_BIT_ALIAS(SAO, ARCH_1),		/* Strong Access Ordering (powerpc) */
> 	DECLARE_VMA_BIT_ALIAS(GROWSUP, ARCH_1),		/* parisc */
> 	DECLARE_VMA_BIT_ALIAS(SPARC_ADI, ARCH_1),	/* sparc64 */
> 	DECLARE_VMA_BIT_ALIAS(ARM64_BTI, ARCH_1),	/* arm64 */
> 	DECLARE_VMA_BIT_ALIAS(ARCH_CLEAR, ARCH_1),	/* sparc64, arm64 */
> 	DECLARE_VMA_BIT_ALIAS(MAPPED_COPY, ARCH_1),	/* !CONFIG_MMU */
>
> Other vma_test() changes look fine to me: just fixed INIT_VM_FLAG()
> masks matching their VMA_*_BIT :)

Thanks you're right, will fix!

Again I swear I ran claude on all of this so it's failing me here :)

>
> Cheers, Lance
>
> > 				goto out;
> > 		}
> > 	}
> >@@ -918,7 +918,7 @@ static int do_mprotect_pkey(unsigned long start, size_t len,
> > 		}
> >
> > 		/* Does the application expect PROT_READ to imply PROT_EXEC */
> >-		if (rier && (vma->vm_flags & VM_MAYEXEC))
> >+		if (rier && vma_test(vma, VMA_MAYEXEC_BIT))
> > 			prot |= PROT_EXEC;
> >
> > 		/*
> >--
> >2.54.0
> >
> >

