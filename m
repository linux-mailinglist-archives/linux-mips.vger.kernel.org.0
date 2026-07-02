Return-Path: <linux-mips+bounces-15428-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0nzqHg9zRmopVQsAu9opvQ
	(envelope-from <linux-mips+bounces-15428-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 02 Jul 2026 16:17:51 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE456F8CA8
	for <lists+linux-mips@lfdr.de>; Thu, 02 Jul 2026 16:17:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nBuFO4OK;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15428-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15428-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9A992301F8A5
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jul 2026 14:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26954DC534;
	Thu,  2 Jul 2026 14:16:51 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EC24DBD97;
	Thu,  2 Jul 2026 14:16:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783001810; cv=none; b=ocERjdrKULWaF075KA3mU/X3rA/EduwLm6tSk5mnjt+vXcF9YnTRbumitTtaLnfeAwzm+mjvCnI/0yHFjFPSEvgkJ3OqMCcfuz4cqIbVdc27GFIEcYkC4Uar/QjTio7d/UGOVy7krt8h33CehitiC7LwJpiF/fsdOzp3ljQNdA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783001810; c=relaxed/simple;
	bh=BMNaohWnQQE3GUJu1xKZgGxifcOf8Us5+ymgGbhFLCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CogNPrqzffeyPM8KO/CUIhMNrQTLgjQwWhFgUE1ybyvvqc5M93jguDIJA9A/Onz+ENzs3gBLkoHgagF+5O/0aPkQZX7p0lHIxIwa4eoSvNCXGAaF4Dv8RRdx9IT7QsiWvfxUznaa5nFKc8XUXh5OF9pRLjfSxDAzZcH9Paw8jBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nBuFO4OK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77881F00A3A;
	Thu,  2 Jul 2026 14:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783001804;
	bh=vcXV/OFRF3o5nc90hy/rNYztoQp19dfE8boUb7skCPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nBuFO4OKuZkx4g9lHIILMu0GcvZdBu9Hnc71+r10+sQ+KcL0n3xj7kUQucOnqcAk3
	 AkoJXlYf1oNjG50cQd8gf2TOHQhPraHIQjZt480Xg/htWdV6q91LBwFijLRn3TQOuu
	 DUzRy0MHOPnAYLdnUDmlOOE6s8dMsOCBWennldGjml9Hl6vq1cQQi9Nbr1EERzrjN/
	 Lkc41jqy6VqEbMgqwe1omDOJT4iOl7aycvqDHrKI8KUC4jXNXsDmIx9h9ZJsJesofT
	 OviVXSDvnQJkEiSWSZwtp7bcBRhTwnjivbJlK0EsZWjLSEUjELxUeBndnhMBbTL5bE
	 /U9iv5KrQkB8g==
Date: Thu, 2 Jul 2026 15:16:20 +0100
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
Subject: Re: [PATCH 02/13] mm/vma: update do_mmap() to use vma_flags_t
Message-ID: <akZwsS-_cywsXSjL@lucifer>
References: <e0ac58ad2b88ff7e2f0024e3286b2e786f79ca32.1782760670.git.ljs@kernel.org>
 <20260702111531.64883-1-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702111531.64883-1-lance.yang@linux.dev>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15428-lists,linux-mips=lfdr.de];
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[82];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linux.dev:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0BE456F8CA8

On Thu, Jul 02, 2026 at 07:15:31PM +0800, Lance Yang wrote:
>
> On Mon, Jun 29, 2026 at 08:25:25PM +0100, Lorenzo Stoakes wrote:
> >The core do_mmap() function accepts a vm_flags_t parameter which it then
> >manipulates before passing to mmap_region() to do the heavy lifting of the
> >memory mapping.
> >
> >Update do_mmap() to instead accept a vma_flags_t parameter, and adjust all
> >the logic within do_mmap() to manipulate this instead.
> >
> >This is as part of the ongoing effort to convert VMA flags from a system
> >word size to a bitmap type which allows us to unrestrict the number of VMA
> >flags, as well as gain control over how VMA flag manipulation occurs.
> >
> >We do not cascade these changes to all functions which accept vm_flags_t,
> >but rather use vma_flags_to_legacy() where necessary, specifically
> >deferring converting calc_vm_prot_bits(), calc_vm_flag_bits() and
> >__get_unmapped_area() to vma_flags_t.
> >
> >Also utilise the new vma_flags_can_grow() predicate which correctly handles
> >the case of architectures without upward growing stacks.
> >
> >As part of this change, introduce VMA_SHADOW_STACK so we can correctly
> >handle the case of the shadow stack not being defined.
> >
> >No functional change intended.
> >
> >Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> >---
>
> Not exactly a small one :) I stared at this patch for a while, hopefully
> don't miss anythig ...

Yeah sorry maybe I could have broken this down more!

>
> Just one tiny nit below. Overall, LGTM, feel free to add:
>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>

Thanks!

>
> [...]
> >diff --git a/mm/mmap.c b/mm/mmap.c
> >index 46174e706bbe..547352183214 100644
> >--- a/mm/mmap.c
> >+++ b/mm/mmap.c
> [...]
> >@@ -488,23 +496,27 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
> > 		 * Check to see if we are violating any seals and update VMA
> > 		 * flags if necessary to avoid future seal violations.
> > 		 */
> >-		err = memfd_check_seals_mmap(file, &vm_flags);
> >+		err = memfd_check_seals_mmap(file, &vma_flags);
> > 		if (err)
> > 			return (unsigned long)err;
> > 	} else {
> > 		switch (flags & MAP_TYPE) {
> > 		case MAP_SHARED:
> >-			if (vm_flags & (VM_GROWSDOWN|VM_GROWSUP))
> >+			if (vma_flags_can_grow(&vma_flags))
> > 				return -EINVAL;
> > 			/*
> > 			 * Ignore pgoff.
> > 			 */
> > 			pgoff = 0;
> >-			vm_flags |= VM_SHARED | VM_MAYSHARE;
> >+			vma_flags_set(&vma_flags, VMA_SHARED_BIT, VMA_MAYSHARE_BIT);
> > 			break;
> >-		case MAP_DROPPABLE:
> >-			if (VM_DROPPABLE == VM_NONE)
> >+		case MAP_DROPPABLE: {
> >+			vma_flags_t droppable = VMA_DROPPABLE;
> >+
> >+			if (vma_flags_empty(&droppable))
> > 				return -EOPNOTSUPP;
> >+			vma_flags_set_mask(&vma_flags, droppable);
> >+
> > 			/*
> > 			 * A locked or stack area makes no sense to be droppable.
> > 			 *
> >@@ -515,23 +527,24 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
> > 			 */
> > 			if (flags & (MAP_LOCKED | MAP_HUGETLB))
> > 			        return -EINVAL;
> >-			if (vm_flags & (VM_GROWSDOWN | VM_GROWSUP))
> >+			if (vma_flags_can_grow(&vma_flags))
> > 			        return -EINVAL;
> >
> >-			vm_flags |= VM_DROPPABLE;
>
> Old code checked VM_GROWSDOWN|VM_GROWSUP before seting VM_DROPPABLE. New
> code flips that around. Hmm, shouldn't master, just made me look twice ;)
>
> Maybe keep old order?

I guess I feared that defining droppable above then referencing it below would
be less clear?

Can move if you feel strongly about it, and sorry for making the move at the
same time as the general vm_flags_t -> vma_flags_t refactor as it does make that
less clear...

>
> Cheers, Lance
>
> >-
> > 			/*
> > 			 * If the pages can be dropped, then it doesn't make
> > 			 * sense to reserve them.
> > 			 */
> >-			vm_flags |= VM_NORESERVE;
> >+			vma_flags_set(&vma_flags, VMA_NORESERVE_BIT);
> >
> > 			/*
> > 			 * Likewise, they're volatile enough that they
> > 			 * shouldn't survive forks or coredumps.
> > 			 */
> >-			vm_flags |= VM_WIPEONFORK | VM_DONTDUMP;
> >+			vma_flags_set(&vma_flags, VMA_WIPEONFORK_BIT,
> >+				      VMA_DONTDUMP_BIT);
> >+
> > 			fallthrough;
> >+		}
> > 		case MAP_PRIVATE:
> > 			/*
> > 			 * Set pgoff according to addr for anon_vma.
> [...]

Thanks, Lorenzo

