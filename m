Return-Path: <linux-mips+bounces-15791-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ok6ROmuQUmowRAMAu9opvQ
	(envelope-from <linux-mips+bounces-15791-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 20:50:19 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88029742A1E
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 20:50:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kGl604zO;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15791-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15791-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 034733007BA3
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 18:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9148E30E834;
	Sat, 11 Jul 2026 18:50:16 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AC630CDAE;
	Sat, 11 Jul 2026 18:50:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783795816; cv=none; b=UzyeQHh9IpO+0u+5nvjOYwq+r3aAXh8V239lXM/dxVVTUbgXE15NNigZ8xlQmdvXFSB7zfbjbCx69ay8+Np88EBbVulTuYMf4aZZhodK5DH52rIEYqW0DdWc709IqisbGkYRQnE4y8/29mIiusGG+gZWSDg1lefGylU0zrqdoKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783795816; c=relaxed/simple;
	bh=PIqQBUvFAhhZLltfbuAmGUSiDj9zb0uqnBAJox/uNeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=faMGCPEwVO9QMpfJFpumIbpgWZuKuEtTnsaj2TIqK4NClBjE6Ar8fBB7vjZyvIoQi+5elRStoUlSuoVuWmlTrLzoosIvuvi84ztkncqzHZskMYBfTD28gpDkbap3dfQGUNDB4FPOt9hgP6KbEmexqndSZlxFzgeEvBpEBOCr9Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kGl604zO; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2690E1F00A3A;
	Sat, 11 Jul 2026 18:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783795814;
	bh=VYkDI6h+waLNcPjkBya9DGnDggZvgWVLygEReXlfsZM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kGl604zOY5i/9BHc7cLc4ryqHD+01SAUicrFqMKwslfHQhi80jDyaMm2MyxhO5qOt
	 5Pq/TrS3o9h1Q+W/qwP8lSEVI5jCfMdWQHJGOSTzqQxcgi/ZcaaOXqvQkVb1FUVgE6
	 9YbVEPYs9ZC7WBFyRZhHqrj+/ntYKTZVK3XRtCayQvKHxiWeP6HYUE54e0sI1syKFA
	 s2zK3U9ax8wTAugutxfyxWaRWS5LrbXoh4d2i5NgoY8R2qopkb5XoFfc+IxgcXnP6J
	 LumgNfEnvhlL0OZHtdfacxoMtfjedGIBKxF4rKadinDpk8PtJvmtheBqh+pFiShHQX
	 BbDB2Fj9clkaw==
From: Lorenzo Stoakes <ljs@kernel.org>
Date: Sat, 11 Jul 2026 19:45:10 +0100
Subject: [PATCH v2 13/13] mm/mremap: convert mremap code to use vma_flags_t
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-b4-vma-flags-mm-v2-13-0fa2357d5431@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6381; i=ljs@kernel.org;
 h=from:subject:message-id; bh=PIqQBUvFAhhZLltfbuAmGUSiDj9zb0uqnBAJox/uNeE=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLKC+q2WCm/T1ymxZjMq/yxer2XvM7/x212H55Myy179n
 RqvN8Gno5SFQYyLQVZMkeX5F/H9QSJh8zov+LvBzGFlAhnCwMUpABPpOszIsGhLcPGPAz1FjgKb
 Jc53v4/W6X/HznOmXdW58Edb+l2lCQz/DLaa7emYsZ9lb/CKY38l3gjvWSW8537dgQvfdvIpbK9
 8xgIA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15791-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,etnaviv];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,nvidia.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 88029742A1E

Replace use of the legacy vm_flags_t flags with vma_flags_t values
throughout the mremap logic.

Note that, in replacing vm_flags_clear() (which takes the VMA write lock)
with vma_clear_flags() and vma_clear_flags_mask() (which do not)
respectively in unmap_source_vma() and dontunmap_complete(), we do not add
a VMA write lock to account for htis.

This is because, in both cases, move_vma() is their calling function and
this has already acquired the VMA write lock on vrm->vma whose VMA flags
are being cleared.

In the case of vma_set_flags() in unmap_source_vma() we do need to do this
- as prev and next were not necessarily write locked at this point.

Additionally update comments to reflect the changes to be consistent.

No functional change intended.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 mm/mremap.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/mm/mremap.c b/mm/mremap.c
index 384ef4cc2195..b64aa1f6e07e 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -68,7 +68,7 @@ struct vma_remap_struct {
 	bool populate_expand;		/* mlock()'d expanded, must populate. */
 	enum mremap_type remap_type;	/* expand, shrink, etc. */
 	bool mmap_locked;		/* Is mm currently write-locked? */
-	unsigned long charged;		/* If VM_ACCOUNT, # pages to account. */
+	unsigned long charged;		/* If VMA_ACCOUNT_BIT, # pgs to account */
 	bool vmi_needs_invalidate;	/* Is the VMA iterator invalidated? */
 };
 
@@ -963,7 +963,7 @@ static unsigned long vrm_set_new_addr(struct vma_remap_struct *vrm)
 
 	if (vrm->flags & MREMAP_FIXED)
 		map_flags |= MAP_FIXED;
-	if (vma->vm_flags & VM_MAYSHARE)
+	if (vma_test(vma, VMA_MAYSHARE_BIT))
 		map_flags |= MAP_SHARED;
 
 	res = get_unmapped_area(vma->vm_file, new_addr, vrm->new_len, pgoff,
@@ -985,7 +985,7 @@ static bool vrm_calc_charge(struct vma_remap_struct *vrm)
 {
 	unsigned long charged;
 
-	if (!(vrm->vma->vm_flags & VM_ACCOUNT))
+	if (!vma_test(vrm->vma, VMA_ACCOUNT_BIT))
 		return true;
 
 	/*
@@ -1012,7 +1012,7 @@ static bool vrm_calc_charge(struct vma_remap_struct *vrm)
  */
 static void vrm_uncharge(struct vma_remap_struct *vrm)
 {
-	if (!(vrm->vma->vm_flags & VM_ACCOUNT))
+	if (!vma_test(vrm->vma, VMA_ACCOUNT_BIT))
 		return;
 
 	vm_unacct_memory(vrm->charged);
@@ -1032,7 +1032,7 @@ static void vrm_stat_account(struct vma_remap_struct *vrm,
 	struct vm_area_struct *vma = vrm->vma;
 
 	vm_stat_account(mm, vma->vm_flags, pages);
-	if (vma->vm_flags & VM_LOCKED)
+	if (vma_test(vma, VMA_LOCKED_BIT))
 		mm->locked_vm += pages;
 }
 
@@ -1176,7 +1176,7 @@ static void unmap_source_vma(struct vma_remap_struct *vrm)
 	 * arose, in which case we _do_ wish to unmap the _new_ VMA, which means
 	 * we actually _do_ want it be unaccounted.
 	 */
-	bool accountable_move = (vma->vm_flags & VM_ACCOUNT) &&
+	bool accountable_move = vma_test(vma, VMA_ACCOUNT_BIT) &&
 		!(vrm->flags & MREMAP_DONTUNMAP);
 
 	/*
@@ -1195,7 +1195,7 @@ static void unmap_source_vma(struct vma_remap_struct *vrm)
 	 * portions of the original VMA that remain.
 	 */
 	if (accountable_move) {
-		vm_flags_clear(vma, VM_ACCOUNT);
+		vma_clear_flags(vma, VMA_ACCOUNT_BIT);
 		/* We are about to split vma, so store the start/end. */
 		vm_start = vma->vm_start;
 		vm_end = vma->vm_end;
@@ -1220,8 +1220,8 @@ static void unmap_source_vma(struct vma_remap_struct *vrm)
 	 * |             |
 	 * |-------------|
 	 *
-	 * Having cleared VM_ACCOUNT from the whole VMA, after we unmap above
-	 * we'll end up with:
+	 * Having cleared VMA_ACCOUNT_BIT from the whole VMA, after we unmap
+	 * above we'll end up with:
 	 *
 	 *    addr  end
 	 *     |     |
@@ -1241,13 +1241,15 @@ static void unmap_source_vma(struct vma_remap_struct *vrm)
 		if (vm_start < addr) {
 			struct vm_area_struct *prev = vma_prev(&vmi);
 
-			vm_flags_set(prev, VM_ACCOUNT); /* Acquires VMA lock. */
+			vma_start_write(prev);
+			vma_set_flags(prev, VMA_ACCOUNT_BIT);
 		}
 
 		if (vm_end > end) {
 			struct vm_area_struct *next = vma_next(&vmi);
 
-			vm_flags_set(next, VM_ACCOUNT); /* Acquires VMA lock. */
+			vma_start_write(next);
+			vma_set_flags(next, VMA_ACCOUNT_BIT);
 		}
 	}
 }
@@ -1330,8 +1332,8 @@ static void dontunmap_complete(struct vma_remap_struct *vrm,
 	unsigned long old_start = vrm->vma->vm_start;
 	unsigned long old_end = vrm->vma->vm_end;
 
-	/* We always clear VM_LOCKED[ONFAULT] on the old VMA. */
-	vm_flags_clear(vrm->vma, VM_LOCKED_MASK);
+	/* We always clear VMA_LOCKED[ONFAULT]_BIT on the old VMA. */
+	vma_clear_flags_mask(vrm->vma, VMA_LOCKED_MASK);
 
 	/*
 	 * anon_vma links of the old vma is no longer needed after its page
@@ -1767,14 +1769,14 @@ static int check_prep_vma(struct vma_remap_struct *vrm)
 	 * based on the original.  There are no known use cases for this
 	 * behavior.  As a result, fail such attempts.
 	 */
-	if (!old_len && !(vma->vm_flags & (VM_SHARED | VM_MAYSHARE))) {
+	if (!old_len && !vma_test_any(vma, VMA_SHARED_BIT, VMA_MAYSHARE_BIT)) {
 		pr_warn_once("%s (%d): attempted to duplicate a private mapping with mremap.  This is not supported.\n",
 			     current->comm, current->pid);
 		return -EINVAL;
 	}
 
 	if ((vrm->flags & MREMAP_DONTUNMAP) &&
-			(vma->vm_flags & (VM_DONTEXPAND | VM_PFNMAP)))
+	    vma_test_any(vma, VMA_DONTEXPAND_BIT, VMA_PFNMAP_BIT))
 		return -EINVAL;
 
 	/*
@@ -1804,7 +1806,7 @@ static int check_prep_vma(struct vma_remap_struct *vrm)
 		return 0;
 
 	/* We are expanding and the VMA is mlock()'d so we need to populate. */
-	if (vma->vm_flags & VM_LOCKED)
+	if (vma_test(vma, VMA_LOCKED_BIT))
 		vrm->populate_expand = true;
 
 	/* Need to be careful about a growing mapping */
@@ -1812,10 +1814,10 @@ static int check_prep_vma(struct vma_remap_struct *vrm)
 	if (pgoff + (new_len >> PAGE_SHIFT) < pgoff)
 		return -EINVAL;
 
-	if (vma->vm_flags & (VM_DONTEXPAND | VM_PFNMAP))
+	if (vma_test_any(vma, VMA_DONTEXPAND_BIT, VMA_PFNMAP_BIT))
 		return -EFAULT;
 
-	if (!mlock_future_ok(mm, vma->vm_flags & VM_LOCKED, vrm->delta))
+	if (!mlock_future_ok(mm, vma_test(vma, VMA_LOCKED_BIT), vrm->delta))
 		return -EAGAIN;
 
 	if (!may_expand_vm(mm, &vma->flags, vrm->delta >> PAGE_SHIFT))

-- 
2.55.0


