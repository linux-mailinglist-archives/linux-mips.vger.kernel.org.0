Return-Path: <linux-mips+bounces-15328-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hkKiE4fHQmrMBgoAu9opvQ
	(envelope-from <linux-mips+bounces-15328-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 21:29:11 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B756DE63A
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 21:29:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BExgykrx;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15328-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15328-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B298306DC70
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 19:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977293DDDB1;
	Mon, 29 Jun 2026 19:26:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2527E39EB7C;
	Mon, 29 Jun 2026 19:26:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782761169; cv=none; b=X8tTrx1hDd9iPRKHkKzbpfFQrzRpL3S4T5tLa2LLoNahcrnkbfwVqM3Nl3nbFS+/M28D0bxc5JXQyrUgaXPn0Sm9b9VbI4Kl6aqMXRUWe0JUo3M4aLi+a0RE6p2kmtZi3IbsvHSm0RcKHuW8kKWHXyoNPGpl3AsihkVOXqAxBn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782761169; c=relaxed/simple;
	bh=5Cr+5ea+2dRKG+1jIaUFmxMoFMQWRveuvRsHS3vCLfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gN/wMM9kl619JiORhHIEUDtSginMsfb9MO0tJEb7VUlbsYNuNTP8c6IBnKi+bFgXqqxU7/ieOlzGVZZGybWCE2wki0H2E9FW/qdif2l2209PEWdcyYPGtOscK3PpEhGlUuG3Bn75N4ThVIGJBp+meZ2zlYvIji+jiTDZlBQx9xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BExgykrx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A2DC1F00A3E;
	Mon, 29 Jun 2026 19:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782761168;
	bh=hVd6ZuVqENj3zeMR4aL2t+2UMMhczNHM+gJ9snfAafg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BExgykrxcgTd5RClbXfmFD5Hp/1Grb/Kjey3DiRaMUeFZgqydXxsDWyRIvpzoISG7
	 /Iilv3IrxTXNlJUqKZNyr5TyZZvKbnpj8BmRYrG9ZFdN0Nb0i0NyJk8Sl7npMKfdti
	 1DTOuDeaNgSBKxd+05qng9++fyrY+sD0P/+0C6uNIMSgwntxptodo0GGuiVJ2fa7Xh
	 tcbnSkYetMr8IMTjqAFSQc8sq/Xc+KvUA6heTO4Lwayd0uEmx/7h0R2T9dkwHlc5h+
	 iCD7J6P0FnSJ3xPPyRVSFdOIImy48N18CmoYp7IbeVR4j1E/heYWHJ8ULXWfCEAyFn
	 uHB+/Pwf3DOzg==
From: Lorenzo Stoakes <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Lucas Stach <l.stach@pengutronix.de>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Helge Deller <deller@gmx.de>,
	Benjamin LaHaise <bcrl@kvack.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Hugh Dickins <hughd@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Kees Cook <kees@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
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
Subject: [PATCH 04/13] mm: update generic_get_unmapped_area[_topdown]() to use vma_flags_t
Date: Mon, 29 Jun 2026 20:25:27 +0100
Message-ID: <cef55b19f86c110952f13829aefa4859db3a70ed.1782760670.git.ljs@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782760670.git.ljs@kernel.org>
References: <cover.1782760670.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[alpha.franken.de,linux.ibm.com,ellerman.id.au,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,samsung.com,linaro.org,intel.com,ursulin.net,oss.qualcomm.com,redhat.com,ideasonboard.com,rock-chips.com,sntech.de,nvidia.com,collabora.com,broadcom.com,epam.com,gmx.de,kvack.org,zeniv.linux.org.uk,linux.dev,linux.alibaba.com,infradead.org,arm.com,google.com,suse.com,perex.cz,vger.kernel.org,lists.ozlabs.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,lists.xenproject.org];
	TAGGED_FROM(0.00)[bounces-15328-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:tsbogend@alpha.franken.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:l.stach@pengutronix.de,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:lyude@redhat.com,m:dakr@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:zack.rusin@broadcom.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:oleksandr_andrushchenko@epam.com,m:deller@gmx.de,m:bcrl@kvack.org,m:viro@zeniv.linux.org.uk,m:bra
 uner@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:ziy@nvidia.com,m:baolin.wang@linux.alibaba.com,m:liam@infradead.org,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:hughd@google.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:kees@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:dri-devel@lists.freedesktop.org,m:etnaviv@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-rockchip@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:xen-devel@lists.xenproject.org,m:linux-fbdev@vger.kernel.o
 rg,m:linux-aio@kvack.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-sound@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_GT_50(0.00)[82];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D9B756DE63A

As part of the changes converting VMA flags from a system word size to a
bitmap, extend this change to generic_get_unmapped_area() and
generic_get_unmapped_area_topdown(), which also allows us to convert
stack_guard_placement() as well.

We retain arch_get_unmapped_area() and arch_get_unmapped_area_topdown()
as-is for now, using legacy_to_vma_flags() as necessary to do so.

No functional change intended.

Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 arch/powerpc/mm/book3s64/slice.c |  6 ++++--
 include/linux/sched/mm.h         |  4 ++--
 mm/mmap.c                        | 16 ++++++++--------
 3 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/slice.c b/arch/powerpc/mm/book3s64/slice.c
index 28bec5bc7879..82127e31dca6 100644
--- a/arch/powerpc/mm/book3s64/slice.c
+++ b/arch/powerpc/mm/book3s64/slice.c
@@ -659,7 +659,8 @@ unsigned long arch_get_unmapped_area(struct file *filp,
 	unsigned int psize;
 
 	if (radix_enabled())
-		return generic_get_unmapped_area(filp, addr, len, pgoff, flags, vm_flags);
+		return generic_get_unmapped_area(filp, addr, len, pgoff, flags,
+						 legacy_to_vma_flags(vm_flags));
 
 	if (filp && is_file_hugepages(filp))
 		psize = file_to_psize(filp);
@@ -679,7 +680,8 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp,
 	unsigned int psize;
 
 	if (radix_enabled())
-		return generic_get_unmapped_area_topdown(filp, addr0, len, pgoff, flags, vm_flags);
+		return generic_get_unmapped_area_topdown(filp, addr0, len,
+				pgoff, flags, legacy_to_vma_flags(vm_flags));
 
 	if (filp && is_file_hugepages(filp))
 		psize = file_to_psize(filp);
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index b301ec90740a..c8720d8e2158 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -203,11 +203,11 @@ unsigned long mm_get_unmapped_area_vmaflags(struct file *filp,
 unsigned long
 generic_get_unmapped_area(struct file *filp, unsigned long addr,
 			  unsigned long len, unsigned long pgoff,
-			  unsigned long flags, vm_flags_t vm_flags);
+			  unsigned long flags, vma_flags_t vma_flags);
 unsigned long
 generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 				  unsigned long len, unsigned long pgoff,
-				  unsigned long flags, vm_flags_t vm_flags);
+				  unsigned long flags, vma_flags_t vma_flags);
 #else
 static inline void arch_pick_mmap_layout(struct mm_struct *mm,
 					 const struct rlimit *rlim_stack) {}
diff --git a/mm/mmap.c b/mm/mmap.c
index 461ce510e12a..3ef603d5ff00 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -657,9 +657,9 @@ SYSCALL_DEFINE1(old_mmap, struct mmap_arg_struct __user *, arg)
  * Determine if the allocation needs to ensure that there is no
  * existing mapping within it's guard gaps, for use as start_gap.
  */
-static inline unsigned long stack_guard_placement(vm_flags_t vm_flags)
+static inline unsigned long stack_guard_placement(vma_flags_t vma_flags)
 {
-	if (vm_flags & VM_SHADOW_STACK)
+	if (vma_flags_test_single_mask(&vma_flags, VMA_SHADOW_STACK))
 		return PAGE_SIZE;
 
 	return 0;
@@ -701,7 +701,7 @@ unsigned long vm_unmapped_area(struct vm_unmapped_area_info *info)
 unsigned long
 generic_get_unmapped_area(struct file *filp, unsigned long addr,
 			  unsigned long len, unsigned long pgoff,
-			  unsigned long flags, vm_flags_t vm_flags)
+			  unsigned long flags, vma_flags_t vma_flags)
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma, *prev;
@@ -726,7 +726,7 @@ generic_get_unmapped_area(struct file *filp, unsigned long addr,
 	info.length = len;
 	info.low_limit = mm->mmap_base;
 	info.high_limit = mmap_end;
-	info.start_gap = stack_guard_placement(vm_flags);
+	info.start_gap = stack_guard_placement(vma_flags);
 	if (filp && is_file_hugepages(filp))
 		info.align_mask = huge_page_mask_align(filp);
 	return vm_unmapped_area(&info);
@@ -739,7 +739,7 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		       unsigned long flags, vm_flags_t vm_flags)
 {
 	return generic_get_unmapped_area(filp, addr, len, pgoff, flags,
-					 vm_flags);
+					 legacy_to_vma_flags(vm_flags));
 }
 #endif
 
@@ -750,7 +750,7 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 unsigned long
 generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 				  unsigned long len, unsigned long pgoff,
-				  unsigned long flags, vm_flags_t vm_flags)
+				  unsigned long flags, vma_flags_t vma_flags)
 {
 	struct vm_area_struct *vma, *prev;
 	struct mm_struct *mm = current->mm;
@@ -778,7 +778,7 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 	info.length = len;
 	info.low_limit = PAGE_SIZE;
 	info.high_limit = arch_get_mmap_base(addr, mm->mmap_base);
-	info.start_gap = stack_guard_placement(vm_flags);
+	info.start_gap = stack_guard_placement(vma_flags);
 	if (filp && is_file_hugepages(filp))
 		info.align_mask = huge_page_mask_align(filp);
 	addr = vm_unmapped_area(&info);
@@ -807,7 +807,7 @@ arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 			       unsigned long flags, vm_flags_t vm_flags)
 {
 	return generic_get_unmapped_area_topdown(filp, addr, len, pgoff, flags,
-						 vm_flags);
+						 legacy_to_vma_flags(vm_flags));
 }
 #endif
 
-- 
2.54.0


