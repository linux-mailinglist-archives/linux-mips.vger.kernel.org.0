Return-Path: <linux-mips+bounces-15417-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4RHpDU9URmqxQwsAu9opvQ
	(envelope-from <linux-mips+bounces-15417-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 02 Jul 2026 14:06:39 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF41B6F74F3
	for <lists+linux-mips@lfdr.de>; Thu, 02 Jul 2026 14:06:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=SNO+TI3y;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15417-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15417-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55362311DD92
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jul 2026 11:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B7F3EB80D;
	Thu,  2 Jul 2026 11:15:57 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC3B3EC2FB
	for <linux-mips@vger.kernel.org>; Thu,  2 Jul 2026 11:15:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782990957; cv=none; b=DJsmCY1rYoI2Rqsx9/JBNI83JAephC2N9abndhxUJEGosby44LMFmBQ/RhLnBFbcAaMsARzaBEcs1OD8EwxE3OEBdq/oMeMxrXjyMALnOg39DnT1EdEu/hPDcyUy8hNnMAAhWOJzLnFry6gXsQr9nOZDF3Q1IhivPa4wjAGKlEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782990957; c=relaxed/simple;
	bh=GnYBDGATmtulOrbHYieuBQYJQv+WuoHKcBOPpP2DOUE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S1MNZqCbPx0/khsexKMN5BQ8NhQMRneOUo4tIUFvczeCAEw5uR/x9STCzyB7WWttX1lNsqhFRnmGfQZkzgZYVRkF2w9PxDuTh7P9pVRk73omOkKiJyputY+2w6u8bmrUopvRkFSSCmG9rfp4KXBPkDOWowAVkb5lxxvDrD/CnHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SNO+TI3y; arc=none smtp.client-ip=91.218.175.178
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782990951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MXoiAeiZxppUV0bbr36tbNoILtIVkAZHXOhXlmlq9aE=;
	b=SNO+TI3ysBG4+DhR3hPTF1SvhO32c4IR52yjAPmkR78MakGGmD/cQOYIcE8MmMX2BXfJ/B
	PngJwUk8MPDHueMWfaVQgxbOjSa6VTjHZniUa88SClGCvA5JNzJYRen32CdMAokXiIgXtC
	8TVZTPLK3UhpO1X2vjoT/Jd84+uq0gc=
From: Lance Yang <lance.yang@linux.dev>
To: ljs@kernel.org
Cc: akpm@linux-foundation.org,
	tsbogend@alpha.franken.de,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	l.stach@pengutronix.de,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	peter.griffin@linaro.org,
	jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com,
	tursulin@ursulin.net,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	lyude@redhat.com,
	dakr@kernel.org,
	tomi.valkeinen@ideasonboard.com,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	thierry.reding@kernel.org,
	mperttunen@nvidia.com,
	jonathanh@nvidia.com,
	kraxel@redhat.com,
	dmitry.osipenko@collabora.com,
	zack.rusin@broadcom.com,
	matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com,
	oleksandr_andrushchenko@epam.com,
	deller@gmx.de,
	bcrl@kvack.org,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	hughd@google.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	jannh@google.com,
	pfalcato@suse.de,
	kees@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	etnaviv@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	virtualization@lists.linux.dev,
	intel-xe@lists.freedesktop.org,
	xen-devel@lists.xenproject.org,
	linux-fbdev@vger.kernel.org,
	linux-aio@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 02/13] mm/vma: update do_mmap() to use vma_flags_t
Date: Thu,  2 Jul 2026 19:15:31 +0800
Message-Id: <20260702111531.64883-1-lance.yang@linux.dev>
In-Reply-To: <e0ac58ad2b88ff7e2f0024e3286b2e786f79ca32.1782760670.git.ljs@kernel.org>
References: <e0ac58ad2b88ff7e2f0024e3286b2e786f79ca32.1782760670.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,alpha.franken.de,linux.ibm.com,ellerman.id.au,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,samsung.com,linaro.org,intel.com,ursulin.net,oss.qualcomm.com,redhat.com,ideasonboard.com,rock-chips.com,sntech.de,nvidia.com,collabora.com,broadcom.com,epam.com,gmx.de,kvack.org,zeniv.linux.org.uk,linux.dev,linux.alibaba.com,infradead.org,arm.com,google.com,suse.com,perex.cz,vger.kernel.org,lists.ozlabs.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,lists.xenproject.org];
	TAGGED_FROM(0.00)[bounces-15417-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:akpm@linux-foundation.org,m:tsbogend@alpha.franken.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:l.stach@pengutronix.de,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:lyude@redhat.com,m:dakr@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:zack.rusin@broadcom.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:oleksandr_andrushchenko@epam.com,m:deller@gmx.de,m:bcrl@kvack.org,m:viro@zeniv.l
 inux.org.uk,m:brauner@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:ziy@nvidia.com,m:baolin.wang@linux.alibaba.com,m:liam@infradead.org,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:hughd@google.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:kees@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:dri-devel@lists.freedesktop.org,m:etnaviv@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-rockchip@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:xen-devel@lists.xenproject.org,m:linux-fb
 dev@vger.kernel.org,m:linux-aio@kvack.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-sound@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[lance.yang@linux.dev,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lance.yang@linux.dev,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[83];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_RCPT(0.00)[linux-mips];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF41B6F74F3


On Mon, Jun 29, 2026 at 08:25:25PM +0100, Lorenzo Stoakes wrote:
>The core do_mmap() function accepts a vm_flags_t parameter which it then
>manipulates before passing to mmap_region() to do the heavy lifting of the
>memory mapping.
>
>Update do_mmap() to instead accept a vma_flags_t parameter, and adjust all
>the logic within do_mmap() to manipulate this instead.
>
>This is as part of the ongoing effort to convert VMA flags from a system
>word size to a bitmap type which allows us to unrestrict the number of VMA
>flags, as well as gain control over how VMA flag manipulation occurs.
>
>We do not cascade these changes to all functions which accept vm_flags_t,
>but rather use vma_flags_to_legacy() where necessary, specifically
>deferring converting calc_vm_prot_bits(), calc_vm_flag_bits() and
>__get_unmapped_area() to vma_flags_t.
>
>Also utilise the new vma_flags_can_grow() predicate which correctly handles
>the case of architectures without upward growing stacks.
>
>As part of this change, introduce VMA_SHADOW_STACK so we can correctly
>handle the case of the shadow stack not being defined.
>
>No functional change intended.
>
>Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
>---

Not exactly a small one :) I stared at this patch for a while, hopefully
don't miss anythig ...

Just one tiny nit below. Overall, LGTM, feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>

[...]
>diff --git a/mm/mmap.c b/mm/mmap.c
>index 46174e706bbe..547352183214 100644
>--- a/mm/mmap.c
>+++ b/mm/mmap.c
[...]
>@@ -488,23 +496,27 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
> 		 * Check to see if we are violating any seals and update VMA
> 		 * flags if necessary to avoid future seal violations.
> 		 */
>-		err = memfd_check_seals_mmap(file, &vm_flags);
>+		err = memfd_check_seals_mmap(file, &vma_flags);
> 		if (err)
> 			return (unsigned long)err;
> 	} else {
> 		switch (flags & MAP_TYPE) {
> 		case MAP_SHARED:
>-			if (vm_flags & (VM_GROWSDOWN|VM_GROWSUP))
>+			if (vma_flags_can_grow(&vma_flags))
> 				return -EINVAL;
> 			/*
> 			 * Ignore pgoff.
> 			 */
> 			pgoff = 0;
>-			vm_flags |= VM_SHARED | VM_MAYSHARE;
>+			vma_flags_set(&vma_flags, VMA_SHARED_BIT, VMA_MAYSHARE_BIT);
> 			break;
>-		case MAP_DROPPABLE:
>-			if (VM_DROPPABLE == VM_NONE)
>+		case MAP_DROPPABLE: {
>+			vma_flags_t droppable = VMA_DROPPABLE;
>+
>+			if (vma_flags_empty(&droppable))
> 				return -EOPNOTSUPP;
>+			vma_flags_set_mask(&vma_flags, droppable);
>+
> 			/*
> 			 * A locked or stack area makes no sense to be droppable.
> 			 *
>@@ -515,23 +527,24 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
> 			 */
> 			if (flags & (MAP_LOCKED | MAP_HUGETLB))
> 			        return -EINVAL;
>-			if (vm_flags & (VM_GROWSDOWN | VM_GROWSUP))
>+			if (vma_flags_can_grow(&vma_flags))
> 			        return -EINVAL;
> 
>-			vm_flags |= VM_DROPPABLE;

Old code checked VM_GROWSDOWN|VM_GROWSUP before seting VM_DROPPABLE. New
code flips that around. Hmm, shouldn't master, just made me look twice ;)

Maybe keep old order?

Cheers, Lance

>-
> 			/*
> 			 * If the pages can be dropped, then it doesn't make
> 			 * sense to reserve them.
> 			 */
>-			vm_flags |= VM_NORESERVE;
>+			vma_flags_set(&vma_flags, VMA_NORESERVE_BIT);
> 
> 			/*
> 			 * Likewise, they're volatile enough that they
> 			 * shouldn't survive forks or coredumps.
> 			 */
>-			vm_flags |= VM_WIPEONFORK | VM_DONTDUMP;
>+			vma_flags_set(&vma_flags, VMA_WIPEONFORK_BIT,
>+				      VMA_DONTDUMP_BIT);
>+
> 			fallthrough;
>+		}
> 		case MAP_PRIVATE:
> 			/*
> 			 * Set pgoff according to addr for anon_vma.
[...]

