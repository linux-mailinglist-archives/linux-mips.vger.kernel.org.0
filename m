Return-Path: <linux-mips+bounces-15788-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nYCnMzyQUmoZRAMAu9opvQ
	(envelope-from <linux-mips+bounces-15788-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 20:49:32 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3687429CA
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 20:49:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="A3lQ/qzw";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15788-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15788-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4903A300FC48
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 18:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A60830D3EB;
	Sat, 11 Jul 2026 18:49:13 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCF0233956;
	Sat, 11 Jul 2026 18:49:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783795753; cv=none; b=pqzicy5mGOvL5Qj6T2/q8x2LKQYVGQF6AW6r6hjdBXBxYBgbOByipgf8dqKUKJ9xEHSn03W/RzIAVclnvTMejvhOVenn4ATKeuJ0fj1ikjdTDembkKbn/dj1Gpybwv0G41Yn7tefkDGxF4Zf/ssfRkllhpgkDQxn7KPXZKkkfSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783795753; c=relaxed/simple;
	bh=2Eukk7/bboJXcRN4Serqm42H9hjt4k2BF/S8ckNM3q8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l0hQpYS9/fLlQVhzXh0X4ZR2E4DqLlNjbnk91fT+MK8XtHe0EckYkH3XWSJ2+mdrLT4hL0wGZhujBIwQHTfawlGvNPCRHXmxZz5pdfRWtfdARHYy72AZSWAa+xe6VtavSMBtpCKv2XWokToYLBs//vfpPGDRkE+FIOUXFbKEKp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A3lQ/qzw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7572D1F000E9;
	Sat, 11 Jul 2026 18:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783795751;
	bh=PQeVSJrFNGuAKYRqlJkf6JopIzp3qlHM9CyXIq3KHK4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=A3lQ/qzw9J0Mef36BzMgXFxCB7dkGxinxIIAW9JQmfMzrEgdVXCZbMvez44EZPEeX
	 gzXNhanDpKBvr0GU1vbuTRlAVgICQASw38QvYjbrawwYLjk41zoY+o6bs5EJQXWA4B
	 N8ZheKvFfC7ObvlfJNb/UgFOGLScihFKvVLmqfFpAtRomluF+G9vwP3+ja7py9qw8f
	 K4SpVyb7Rs9cJFxpYgZkzgj3ThMgqYWZtLE4yV783JlpDDz2j3hz/q139ORq9vViT5
	 +PH6eC4zBsvX0nSUubBGLLM+1N8LdIbC9v3OR05k+HOezHB2d7wpLQkmt7rZqu2Bfi
	 X2DIl7kAZDv+A==
From: Lorenzo Stoakes <ljs@kernel.org>
Date: Sat, 11 Jul 2026 19:45:07 +0100
Subject: [PATCH v2 10/13] mm/vma: convert miscellaneous uses of VMA flags
 in core mm
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-b4-vma-flags-mm-v2-10-0fa2357d5431@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6231; i=ljs@kernel.org;
 h=from:subject:message-id; bh=2Eukk7/bboJXcRN4Serqm42H9hjt4k2BF/S8ckNM3q8=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLKC+q1YA9XOTHweaCw7b1K84KM/l+4VzJwymz/yypnOw
 EgXoUUrO0pZGMS4GGTFFFmefxHfHyQSNq/zgr8bzBxWJpAhDFycAjARtxOMDJfd9Z1WrGFzkSqR
 k3zENmPW9uv9Jq2mlyfbPCqdYyDftZfhD/8EKYZXMltEpvpf7zFQMVFoW/Ccy10ubMFc/7tFUrK
 OTAA=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15788-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,etnaviv];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,nvidia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E3687429CA

Update various uses of legacy flags in vma.c and mmap.c to the new
vma_flags_t type, updating comments alongside them to be consistent.

No functional change intended.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 mm/mmap.c | 39 +++++++++++++++++++++------------------
 mm/vma.c  | 13 ++++++++-----
 2 files changed, 29 insertions(+), 23 deletions(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index 2076c70e7700..4bf26b0f1e6e 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -557,8 +557,8 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
 	}
 
 	/*
-	 * Set 'VM_NORESERVE' if we should not account for the
-	 * memory use of this mapping.
+	 * Set VMA_NORESERVE_BIT if we should not account for the memory use
+	 * of this mapping.
 	 */
 	if (flags & MAP_NORESERVE) {
 		/* We honor MAP_NORESERVE if allowed to overcommit */
@@ -985,7 +985,7 @@ struct vm_area_struct *find_extend_vma_locked(struct mm_struct *mm, unsigned lon
 		return NULL;
 	if (expand_stack_locked(prev, addr))
 		return NULL;
-	if (prev->vm_flags & VM_LOCKED)
+	if (vma_test(prev, VMA_LOCKED_BIT))
 		populate_vma_page_range(prev, addr, prev->vm_end, NULL);
 	return prev;
 }
@@ -1009,7 +1009,7 @@ struct vm_area_struct *find_extend_vma_locked(struct mm_struct *mm, unsigned lon
 	start = vma->vm_start;
 	if (expand_stack_locked(vma, addr))
 		return NULL;
-	if (vma->vm_flags & VM_LOCKED)
+	if (vma_test(vma, VMA_LOCKED_BIT))
 		populate_vma_page_range(vma, addr, start, NULL);
 	return vma;
 }
@@ -1134,18 +1134,18 @@ SYSCALL_DEFINE5(remap_file_pages, unsigned long, start, unsigned long, size,
 	 */
 	vma = vma_lookup(mm, start);
 
-	if (!vma || !(vma->vm_flags & VM_SHARED)) {
+	if (!vma || !vma_test(vma, VMA_SHARED_BIT)) {
 		mmap_read_unlock(mm);
 		return -EINVAL;
 	}
 
-	prot |= vma->vm_flags & VM_READ ? PROT_READ : 0;
-	prot |= vma->vm_flags & VM_WRITE ? PROT_WRITE : 0;
-	prot |= vma->vm_flags & VM_EXEC ? PROT_EXEC : 0;
+	prot |= vma_test(vma, VMA_READ_BIT) ? PROT_READ : 0;
+	prot |= vma_test(vma, VMA_WRITE_BIT) ? PROT_WRITE : 0;
+	prot |= vma_test(vma, VMA_EXEC_BIT) ? PROT_EXEC : 0;
 
 	flags &= MAP_NONBLOCK;
 	flags |= MAP_SHARED | MAP_FIXED | MAP_POPULATE;
-	if (vma->vm_flags & VM_LOCKED)
+	if (vma_test(vma, VMA_LOCKED_BIT))
 		flags |= MAP_LOCKED;
 
 	/* Save vm_flags used to calculate prot and flags, and recheck later. */
@@ -1271,7 +1271,7 @@ unsigned long tear_down_vmas(struct mm_struct *mm, struct vma_iterator *vmi,
 	mmap_assert_write_locked(mm);
 	vma_iter_set(vmi, vma->vm_end);
 	do {
-		if (vma->vm_flags & VM_ACCOUNT)
+		if (vma_test(vma, VMA_ACCOUNT_BIT))
 			nr_accounted += vma_pages(vma);
 		vma_mark_detached(vma);
 		remove_vma(vma);
@@ -1420,7 +1420,7 @@ static int special_mapping_split(struct vm_area_struct *vma, unsigned long addr)
 {
 	/*
 	 * Forbid splitting special mappings - kernel has expectations over
-	 * the number of pages in mapping. Together with VM_DONTEXPAND
+	 * the number of pages in mapping. Together with VMA_DONTEXPAND_BIT
 	 * the size of vma should stay the same over the special mapping's
 	 * lifetime.
 	 */
@@ -1692,7 +1692,7 @@ bool mmap_read_lock_maybe_expand(struct mm_struct *mm,
 		return true;
 	}
 
-	if (!(new_vma->vm_flags & VM_GROWSDOWN))
+	if (!vma_test(new_vma, VMA_GROWSDOWN_BIT))
 		return false;
 
 	mmap_write_lock(mm);
@@ -1742,7 +1742,7 @@ __latent_entropy int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm)
 		retval = vma_start_write_killable(mpnt);
 		if (retval < 0)
 			goto loop_out;
-		if (mpnt->vm_flags & VM_DONTCOPY) {
+		if (vma_test(mpnt, VMA_DONTCOPY_BIT)) {
 			retval = vma_iter_clear_gfp(&vmi, mpnt->vm_start,
 						    mpnt->vm_end, GFP_KERNEL);
 			if (retval)
@@ -1752,7 +1752,7 @@ __latent_entropy int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm)
 			continue;
 		}
 		charge = 0;
-		if (mpnt->vm_flags & VM_ACCOUNT) {
+		if (vma_test(mpnt, VMA_ACCOUNT_BIT)) {
 			unsigned long len = vma_pages(mpnt);
 
 			if (security_vm_enough_memory_mm(oldmm, len)) /* sic */
@@ -1770,16 +1770,19 @@ __latent_entropy int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm)
 		retval = dup_userfaultfd(tmp, &uf);
 		if (retval)
 			goto fail_nomem_anon_vma_fork;
-		if (tmp->vm_flags & VM_WIPEONFORK) {
+
+		if (vma_test(tmp, VMA_WIPEONFORK_BIT)) {
 			/*
-			 * VM_WIPEONFORK gets a clean slate in the child.
+			 * VMA_WIPEONFORK_BIT gets a clean slate in the child.
 			 * Don't prepare anon_vma until fault since we don't
 			 * copy page for current vma.
 			 */
 			tmp->anon_vma = NULL;
 		} else if (anon_vma_fork(tmp, mpnt))
 			goto fail_nomem_anon_vma_fork;
-		vm_flags_clear(tmp, VM_LOCKED_MASK);
+
+		vma_start_write(tmp);
+		vma_clear_flags_mask(tmp, VMA_LOCKED_MASK);
 		/*
 		 * Copy/update hugetlb private vma information.
 		 */
@@ -1812,7 +1815,7 @@ __latent_entropy int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm)
 			i_mmap_unlock_write(mapping);
 		}
 
-		if (!(tmp->vm_flags & VM_WIPEONFORK))
+		if (!vma_test(tmp, VMA_WIPEONFORK_BIT))
 			retval = copy_page_range(tmp, mpnt);
 
 		if (retval) {
diff --git a/mm/vma.c b/mm/vma.c
index e0ad895098a9..b5bc3eec961c 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -3419,17 +3419,20 @@ struct vm_area_struct *__install_special_mapping(
 	vm_flags_t vm_flags, void *priv,
 	const struct vm_operations_struct *ops)
 {
-	int ret;
+	vma_flags_t vma_flags = legacy_to_vma_flags(vm_flags);
 	struct vm_area_struct *vma;
+	int ret;
 
 	vma = vm_area_alloc(mm);
-	if (unlikely(vma == NULL))
+	if (unlikely(!vma))
 		return ERR_PTR(-ENOMEM);
 
-	vm_flags |= vma_flags_to_legacy(mm->def_vma_flags) | VM_DONTEXPAND;
+	vma_flags_set_mask(&vma_flags, mm->def_vma_flags);
+	vma_flags_set(&vma_flags, VMA_DONTEXPAND_BIT);
 	if (pgtable_supports_soft_dirty())
-		vm_flags |= VM_SOFTDIRTY;
-	vm_flags_init(vma, vm_flags & ~VM_LOCKED_MASK);
+		vma_flags_set(&vma_flags, VMA_SOFTDIRTY_BIT);
+	vma_flags_clear_mask(&vma_flags, VMA_LOCKED_MASK);
+	vma->flags = vma_flags;
 	vma->vm_page_prot = vma_get_page_prot(vma);
 
 	vma->vm_ops = ops;

-- 
2.55.0


