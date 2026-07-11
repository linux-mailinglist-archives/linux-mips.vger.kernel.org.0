Return-Path: <linux-mips+bounces-15782-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b5d1GLiPUmrZQwMAu9opvQ
	(envelope-from <linux-mips+bounces-15782-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 20:47:20 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2247428F8
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 20:47:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BGbT3efQ;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15782-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15782-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B811301BA4D
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 18:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F7630C37E;
	Sat, 11 Jul 2026 18:47:08 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41F630677C;
	Sat, 11 Jul 2026 18:47:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783795628; cv=none; b=mgpovzLXyQqXuO4btp0kV71jrHauIch+KxUhCSmNpK7Ux8uJgxyv0Op2Gk0EczIPJ9aRA8wQM3t8RvLcKbnLI8OJBl57nsj5hyl9axVgX+YMYHBhVVpgpUS+j4OZiVh6/uXCoFRXVFJ5GNw8OZKQzjHeg/kBYjB4ucSy08OSrbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783795628; c=relaxed/simple;
	bh=q7YWuxvCY0LSuxzxUdXFVMeI8S+gRJqyF3+arUou2v8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jAPIQNlTUBDhJrnnhkUbi+5LWh7igxN4yA1bxBEFKq6GTP8TKLHKDKQuNJno4GKCweLDblL4tJ8DnNeL1bh3a4lF8VQe76XkLfXuTte9F/LP1w73d6i1dywCtnYKPTFNeFWDOdb6Hqzi6+NgRJEj9iGlPNeJ/Bo7kaUbX7Rr7Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BGbT3efQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38421F000E9;
	Sat, 11 Jul 2026 18:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783795626;
	bh=Cys+jf7FSJvkCpfIdDug3cdlx8ypGdMjngNui8wSibo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BGbT3efQd05kEEjTh+aO4RIluI/3vbRGG07jZPAzbysVlgzwXnZVd8f3t8E8Vuhd6
	 /dACfscdhH9yKm6ORV9MIHznN0QDaIGK+Xd+Y+t8MqLriFyX1OaduZQhi7cZQzgZLA
	 zhkYGSy3lsS2NYCL1bWL202tjTmTDVV+eSqCV7wUyQZndnvpprLtQNMS5nm7owHWNj
	 KGyx5ds0GcgnPAShXFUlRpaavVRV26dnZg4wZ7A21dt9cXYXyOCSf0zPZMetrqJNJW
	 /KsazvPLmIyGMbdJPeU7/Pu006j9N9JCilWvEgMUxQFss7qH26Jx8s/ZkArz+vG1bl
	 K1uChQpzKnO0g==
From: Lorenzo Stoakes <ljs@kernel.org>
Date: Sat, 11 Jul 2026 19:45:01 +0100
Subject: [PATCH v2 04/13] mm: update generic_get_unmapped_area[_topdown]()
 to use vma_flags_t
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-b4-vma-flags-mm-v2-4-0fa2357d5431@kernel.org>
References: <20260711-b4-vma-flags-mm-v2-0-0fa2357d5431@kernel.org>
In-Reply-To: <20260711-b4-vma-flags-mm-v2-0-0fa2357d5431@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Benjamin LaHaise <bcrl@kvack.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, Muchun Song <muchun.song@linux.dev>, 
 Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>, 
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
 Helge Deller <deller@gmx.de>, Kees Cook <kees@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, 
 linux-fbdev@vger.kernel.org, linux-sound@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5495; i=ljs@kernel.org;
 h=from:subject:message-id; bh=q7YWuxvCY0LSuxzxUdXFVMeI8S+gRJqyF3+arUou2v8=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLKC+i2NEp1+fZh+q6WCyTJbY35wdc6HWZPCOjy54oQmS
 8fxCv3pKGVhEONikBVTZHn+RXx/kEjYvM4L/m4wc1iZQIYwcHEKwET0vBgZzm+rtfp9UtOlYFNd
 VUrv+3hJr49ru99VTjn8XNVY8UQJG8N/t7zLlVMXTLjaPmvbSZkQrfo9K1r/7GqZnb+h7uyNZ7a
 OvAA=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15782-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:david@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:tsbogend@alpha.franken.de,m:bcrl@kvack.org,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:hughd@google.com,m:baolin.wang@linux.alibaba.com,m:jannh@google.com,m:pfalcato@suse.de,m:muchun.song@linux.dev,m:osalvador@suse.de,m:ziy@nvidia.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:usama.arif@linux.dev,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:l.stach@pengutronix.de,m:linux+etnaviv@armlinux.org.uk,m:christian.gmeiner@gmail.com,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:jani.ni
 kula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:lyude@redhat.com,m:dakr@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:gurchetansingh@chromium.org,m:olvaffe@gmail.com,m:zack.rusin@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:oleksandr_andrushchenko@epam.com,m:deller@gmx.de,m:kees@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:ljs@kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-aio@kvack.org,m:l
 inux-fsdevel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:dri-devel@lists.freedesktop.org,m:etnaviv@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-rockchip@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:xen-devel@lists.xenproject.org,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux-foundation.org,kernel.org,infradead.org,google.com,suse.com,alpha.franken.de,kvack.org,zeniv.linux.org.uk,suse.cz,linux.alibaba.com,suse.de,linux.dev,nvidia.com,redhat.com,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,linux.intel.com,ffwll.ch,pengutronix.de,armlinux.org.uk,samsung.com,linaro.org,intel.com,ursulin.net,oss.qualcomm.com,poorly.run,somainline.org,ideasonboard.com,rock-chips.com,sntech.de,collabora.com,chromium.org,broadcom.com,epam.com,gmx.de,perex.cz];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[100];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,etnaviv];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email,linux.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA2247428F8

As part of the changes converting VMA flags from a system word size to a
bitmap, extend this change to generic_get_unmapped_area() and
generic_get_unmapped_area_topdown(), which also allows us to convert
stack_guard_placement() as well.

We retain arch_get_unmapped_area() and arch_get_unmapped_area_topdown()
as-is for now, using legacy_to_vma_flags() as necessary to do so.

No functional change intended.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
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
index 10d723bee95c..10be8a54b416 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -200,11 +200,11 @@ unsigned long mm_get_unmapped_area_vmaflags(struct file *filp,
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
index 4a88b2a233f7..39d33f3a55c2 100644
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
2.55.0


