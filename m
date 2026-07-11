Return-Path: <linux-mips+bounces-15780-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nJKKGoaPUmq8QwMAu9opvQ
	(envelope-from <linux-mips+bounces-15780-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 20:46:30 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A1874288B
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 20:46:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PkVO9vCW;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15780-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15780-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C72F73010EF8
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 18:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2E4306B1B;
	Sat, 11 Jul 2026 18:46:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024D57262E;
	Sat, 11 Jul 2026 18:46:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783795586; cv=none; b=Fnz1hjasy7XA8lal6P3Ql4uhrIJ3XXHF8dSaGroGrAm8CC0PliILLTgdtUWqFhovj5G1xAJMdqbfZCjejh4dCPCWKVRqHxTMsX5hSra4AXs3o+N0PY8EzFk6wiK4FHTn+t2TXkoSsF8qUe311ZGwGOolI2hbDcfHpb2F5s4o5yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783795586; c=relaxed/simple;
	bh=jfSqPsoKaHvqoj7aeYFJY5iN46n5aMbHR0GOh5Ad3CA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ef2heU8/V3xKOGVetBeQRTTrtvRD4j47FaMj6OSf+9xF73i2EGjuqtTFMuglU689DAl0XON5Ax5+KBk64jUgP3Bx32Vb32qgkaViKwJKCeGjYNL7fEztWrAA5bLzAF3aqFf4wcVw+zM2C5P1lkWREs7T4MKlZqophE8SD1fj6Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PkVO9vCW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 260051F000E9;
	Sat, 11 Jul 2026 18:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783795584;
	bh=g+agf5d0VA4ULdU6f5yFEwAUx+bbxEeKzc9rvtTsBpc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PkVO9vCW0DyAVzc8IQWQQkCWDHnQgKIkX7aDK5COn6zF/CYn9txG6K23wjGaVTeSN
	 74SlcnIcO738w9F80wwcU3UhuXDHcgmdhoG8X+7QQcHTRwqV4h8z9enbPM7CKcXoEy
	 /W2QFrz0nX/aYDhB7nSIgGdOQRoUHqqs3qu+9XbiGZ2PIBpJocQJ+L0UM0dgkXFAD0
	 p5tafu+eTgCny17Azi8KCZTFS6xdCyO0bhELJLi8BSxyF3YpAdOBvAPrBJ+0knvgbg
	 LSTJrnmrJumRE9x1UANqzaeOqQOl1L2kUlqtwNjISxcPvxhc7UUc3cGQ/JngA3KjuN
	 AddE/VMZzCQAw==
From: Lorenzo Stoakes <ljs@kernel.org>
Date: Sat, 11 Jul 2026 19:44:59 +0100
Subject: [PATCH v2 02/13] mm/vma: update do_mmap() to use vma_flags_t
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-b4-vma-flags-mm-v2-2-0fa2357d5431@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=18260; i=ljs@kernel.org;
 h=from:subject:message-id; bh=jfSqPsoKaHvqoj7aeYFJY5iN46n5aMbHR0GOh5Ad3CA=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLKC+i2vNMxmaVvw8B7zgtors6vfpa5gnX+t0OnO6h3H3
 s7QO84j3lHKwiDGxSArpsjy/Iv4/iCRsHmdF/zdYOawMoEMYeDiFICJrF/PyDA3Ri5aftfVrf+5
 zx4uPP3X/v+pNpHMv3UPaw/Vz1p6fmY4w//oM8vKtp5iXmkhkVrSl217YfHxzClVy6afFuwucJl
 basIPAA==
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15780-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,etnaviv];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1A1874288B

The core do_mmap() function accepts a vm_flags_t parameter which it then
manipulates before passing to mmap_region() to do the heavy lifting of the
memory mapping.

Update do_mmap() to instead accept a vma_flags_t parameter, and adjust all
the logic within do_mmap() to manipulate this instead.

This is as part of the ongoing effort to convert VMA flags from a system
word size to a bitmap type which allows us to unrestrict the number of VMA
flags, as well as gain control over how VMA flag manipulation occurs.

We do not cascade these changes to all functions which accept vm_flags_t,
but rather use vma_flags_to_legacy() where necessary, specifically
deferring converting calc_vm_prot_bits(), calc_vm_flag_bits() and
__get_unmapped_area() to vma_flags_t.

Also utilise the new vma_flags_can_grow() predicate which correctly handles
the case of architectures without upward growing stacks.

As part of this change, introduce VMA_SHADOW_STACK so we can correctly
handle the case of the shadow stack not being defined.

No functional change intended.

Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 arch/mips/kernel/vdso.c |  4 +--
 fs/aio.c                |  2 +-
 include/linux/memfd.h   |  6 ++---
 include/linux/mm.h      |  6 +++--
 ipc/shm.c               |  3 ++-
 mm/memfd.c              | 15 +++++------
 mm/mmap.c               | 67 +++++++++++++++++++++++++++++--------------------
 mm/nommu.c              |  3 ++-
 mm/util.c               | 10 ++++----
 mm/vma.c                |  7 +++---
 mm/vma.h                |  2 +-
 11 files changed, 69 insertions(+), 56 deletions(-)

diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
index bd1fc17d3975..94873775fc0f 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -91,8 +91,8 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 
 		/* Map delay slot emulation page */
 		base = do_mmap(NULL, STACK_TOP, PAGE_SIZE, PROT_READ | PROT_EXEC,
-			       MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, 0, 0, &unused,
-			       NULL);
+			       MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED,
+			       EMPTY_VMA_FLAGS, 0, &unused, NULL);
 		if (IS_ERR_VALUE(base)) {
 			ret = base;
 			goto out;
diff --git a/fs/aio.c b/fs/aio.c
index f57fa21a2503..3de586da197b 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -604,7 +604,7 @@ static int aio_setup_ring(struct kioctx *ctx, unsigned int nr_events)
 
 	ctx->mmap_base = do_mmap(ctx->aio_ring_file, 0, ctx->mmap_size,
 				 PROT_READ | PROT_WRITE,
-				 MAP_SHARED, 0, 0, &unused, NULL);
+				 MAP_SHARED, EMPTY_VMA_FLAGS, 0, &unused, NULL);
 	mmap_write_unlock(mm);
 	if (IS_ERR((void *)ctx->mmap_base)) {
 		ctx->mmap_size = 0;
diff --git a/include/linux/memfd.h b/include/linux/memfd.h
index b4fda09dab9f..c159e40e3f34 100644
--- a/include/linux/memfd.h
+++ b/include/linux/memfd.h
@@ -14,9 +14,9 @@ struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx);
  * to sealing, or 0 otherwise.
  *
  * We also update VMA flags if appropriate by manipulating the VMA flags pointed
- * to by vm_flags_ptr.
+ * to by vma_flags_ptr.
  */
-int memfd_check_seals_mmap(struct file *file, vm_flags_t *vm_flags_ptr);
+int memfd_check_seals_mmap(struct file *file, vma_flags_t *vma_flags_ptr);
 struct file *memfd_alloc_file(const char *name, unsigned int flags);
 int memfd_get_seals(struct file *file);
 int memfd_add_seals(struct file *file, unsigned int seals);
@@ -30,7 +30,7 @@ static inline struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
 	return ERR_PTR(-EINVAL);
 }
 static inline int memfd_check_seals_mmap(struct file *file,
-					 vm_flags_t *vm_flags_ptr)
+					 vma_flags_t *vma_flags_ptr)
 {
 	return 0;
 }
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7a7f559b3df0..d20aa2f80472 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -465,9 +465,11 @@ enum {
 #if defined(CONFIG_X86_USER_SHADOW_STACK) || defined(CONFIG_ARM64_GCS) || \
 	defined(CONFIG_RISCV_USER_CFI)
 #define VM_SHADOW_STACK	INIT_VM_FLAG(SHADOW_STACK)
+#define VMA_SHADOW_STACK mk_vma_flags(VMA_SHADOW_STACK_BIT)
 #define VMA_STARTGAP_FLAGS mk_vma_flags(VMA_GROWSDOWN_BIT, VMA_SHADOW_STACK_BIT)
 #else
 #define VM_SHADOW_STACK	VM_NONE
+#define VMA_SHADOW_STACK EMPTY_VMA_FLAGS
 #define VMA_STARTGAP_FLAGS mk_vma_flags(VMA_GROWSDOWN_BIT)
 #endif
 #if defined(CONFIG_PPC64)
@@ -4198,9 +4200,9 @@ get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
 	return __get_unmapped_area(file, addr, len, pgoff, flags, 0);
 }
 
-extern unsigned long do_mmap(struct file *file, unsigned long addr,
+unsigned long do_mmap(struct file *file, unsigned long addr,
 	unsigned long len, unsigned long prot, unsigned long flags,
-	vm_flags_t vm_flags, unsigned long pgoff, unsigned long *populate,
+	vma_flags_t vma_flags, unsigned long pgoff, unsigned long *populate,
 	struct list_head *uf);
 extern int do_vmi_munmap(struct vma_iterator *vmi, struct mm_struct *mm,
 			 unsigned long start, size_t len, struct list_head *uf,
diff --git a/ipc/shm.c b/ipc/shm.c
index b3e8a58e177d..bb1a721a3e74 100644
--- a/ipc/shm.c
+++ b/ipc/shm.c
@@ -1661,7 +1661,8 @@ long do_shmat(int shmid, char __user *shmaddr, int shmflg,
 			goto invalid;
 	}
 
-	addr = do_mmap(file, addr, size, prot, flags, 0, 0, &populate, NULL);
+	addr = do_mmap(file, addr, size, prot, flags, EMPTY_VMA_FLAGS, 0,
+		       &populate, NULL);
 	*raddr = addr;
 	err = 0;
 	if (IS_ERR_VALUE(addr))
diff --git a/mm/memfd.c b/mm/memfd.c
index 6c72fe6caef7..c708d92533f4 100644
--- a/mm/memfd.c
+++ b/mm/memfd.c
@@ -370,39 +370,36 @@ static inline bool is_write_sealed(unsigned int seals)
 	return seals & (F_SEAL_WRITE | F_SEAL_FUTURE_WRITE);
 }
 
-static int check_write_seal(vm_flags_t *vm_flags_ptr)
+static int check_write_seal(vma_flags_t *vma_flags_ptr)
 {
-	vm_flags_t vm_flags = *vm_flags_ptr;
-	vm_flags_t mask = vm_flags & (VM_SHARED | VM_WRITE);
-
 	/* If a private mapping then writability is irrelevant. */
-	if (!(mask & VM_SHARED))
+	if (!vma_flags_test(vma_flags_ptr, VMA_SHARED_BIT))
 		return 0;
 
 	/*
 	 * New PROT_WRITE and MAP_SHARED mmaps are not allowed when
 	 * write seals are active.
 	 */
-	if (mask & VM_WRITE)
+	if (vma_flags_test(vma_flags_ptr, VMA_WRITE_BIT))
 		return -EPERM;
 
 	/*
 	 * This is a read-only mapping, disallow mprotect() from making a
 	 * write-sealed mapping writable in future.
 	 */
-	*vm_flags_ptr &= ~VM_MAYWRITE;
+	vma_flags_clear(vma_flags_ptr, VMA_MAYWRITE_BIT);
 
 	return 0;
 }
 
-int memfd_check_seals_mmap(struct file *file, vm_flags_t *vm_flags_ptr)
+int memfd_check_seals_mmap(struct file *file, vma_flags_t *vma_flags_ptr)
 {
 	int err = 0;
 	unsigned int *seals_ptr = memfd_file_seals_ptr(file);
 	unsigned int seals = seals_ptr ? *seals_ptr : 0;
 
 	if (is_write_sealed(seals))
-		err = check_write_seal(vm_flags_ptr);
+		err = check_write_seal(vma_flags_ptr);
 
 	return err;
 }
diff --git a/mm/mmap.c b/mm/mmap.c
index 308a43eabd83..bcc3793e532d 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -280,7 +280,7 @@ static inline bool file_mmap_ok(struct file *file, struct inode *inode,
  * do_mmap() - Perform a userland memory mapping into the current process
  * address space of length @len with protection bits @prot, mmap flags @flags
  * (from which VMA flags will be inferred), and any additional VMA flags to
- * apply @vm_flags. If this is a file-backed mapping then the file is specified
+ * apply @vma_flags. If this is a file-backed mapping then the file is specified
  * in @file and page offset into the file via @pgoff.
  *
  * This function does not perform security checks on the file and assumes, if
@@ -320,7 +320,8 @@ static inline bool file_mmap_ok(struct file *file, struct inode *inode,
  * (2) for details.
  * @flags: Flags specifying how the mapping should be performed, see mmap (2)
  * for details.
- * @vm_flags: VMA flags which should be set by default, or 0 otherwise.
+ * @vma_flags: VMA flags which should be set by default, or EMPTY_VMA_FLAGS
+ * otherwise.
  * @pgoff: Page offset into the @file if file-backed, should be 0 otherwise.
  * @populate: A pointer to a value which will be set to 0 if no population of
  * the range is required, or the number of bytes to populate if it is. Must be
@@ -335,7 +336,7 @@ static inline bool file_mmap_ok(struct file *file, struct inode *inode,
  */
 unsigned long do_mmap(struct file *file, unsigned long addr,
 			unsigned long len, unsigned long prot,
-			unsigned long flags, vm_flags_t vm_flags,
+			unsigned long flags, vma_flags_t vma_flags,
 			unsigned long pgoff, unsigned long *populate,
 			struct list_head *uf)
 {
@@ -399,13 +400,19 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
 	 * to. we assume access permissions have been handled by the open
 	 * of the memory object, so we don't do any here.
 	 */
-	vm_flags |= calc_vm_prot_bits(prot, pkey) | calc_vm_flag_bits(file, flags) |
-			mm->def_flags | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC;
+	vma_flags_set_mask(&vma_flags,
+			   legacy_to_vma_flags(calc_vm_prot_bits(prot, pkey)));
+	vma_flags_set_mask(&vma_flags,
+			   legacy_to_vma_flags(calc_vm_flag_bits(file, flags)));
+	vma_flags_set_mask(&vma_flags, mm->def_vma_flags);
+	vma_flags_set(&vma_flags, VMA_MAYREAD_BIT, VMA_MAYWRITE_BIT,
+		      VMA_MAYEXEC_BIT);
 
 	/* Obtain the address to map to. we verify (or select) it and ensure
 	 * that it represents a valid section of the address space.
 	 */
-	addr = __get_unmapped_area(file, addr, len, pgoff, flags, vm_flags);
+	addr = __get_unmapped_area(file, addr, len, pgoff, flags,
+				   vma_flags_to_legacy(vma_flags));
 	if (IS_ERR_VALUE(addr))
 		return addr;
 
@@ -418,7 +425,7 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
 		if (!can_do_mlock())
 			return -EPERM;
 
-	if (!mlock_future_ok(mm, vm_flags & VM_LOCKED, len))
+	if (!mlock_future_ok(mm, vma_flags_test(&vma_flags, VMA_LOCKED_BIT), len))
 		return -EAGAIN;
 
 	if (file) {
@@ -461,22 +468,23 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
 			if (IS_APPEND(inode) && (file->f_mode & FMODE_WRITE))
 				return -EACCES;
 
-			vm_flags |= VM_SHARED | VM_MAYSHARE;
+			vma_flags_set(&vma_flags, VMA_SHARED_BIT, VMA_MAYSHARE_BIT);
 			if (!(file->f_mode & FMODE_WRITE))
-				vm_flags &= ~(VM_MAYWRITE | VM_SHARED);
+				vma_flags_clear(&vma_flags, VMA_MAYWRITE_BIT,
+						VMA_SHARED_BIT);
 			fallthrough;
 		case MAP_PRIVATE:
 			if (!(file->f_mode & FMODE_READ))
 				return -EACCES;
 			if (path_noexec(&file->f_path)) {
-				if (vm_flags & VM_EXEC)
+				if (vma_flags_test(&vma_flags, VMA_EXEC_BIT))
 					return -EPERM;
-				vm_flags &= ~VM_MAYEXEC;
+				vma_flags_clear(&vma_flags, VMA_MAYEXEC_BIT);
 			}
 
 			if (!can_mmap_file(file))
 				return -ENODEV;
-			if (vm_flags & (VM_GROWSDOWN|VM_GROWSUP))
+			if (vma_flags_can_grow(&vma_flags))
 				return -EINVAL;
 			break;
 
@@ -488,23 +496,27 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
 		 * Check to see if we are violating any seals and update VMA
 		 * flags if necessary to avoid future seal violations.
 		 */
-		err = memfd_check_seals_mmap(file, &vm_flags);
+		err = memfd_check_seals_mmap(file, &vma_flags);
 		if (err)
 			return (unsigned long)err;
 	} else {
 		switch (flags & MAP_TYPE) {
 		case MAP_SHARED:
-			if (vm_flags & (VM_GROWSDOWN|VM_GROWSUP))
+			if (vma_flags_can_grow(&vma_flags))
 				return -EINVAL;
 			/*
 			 * Ignore pgoff.
 			 */
 			pgoff = 0;
-			vm_flags |= VM_SHARED | VM_MAYSHARE;
+			vma_flags_set(&vma_flags, VMA_SHARED_BIT, VMA_MAYSHARE_BIT);
 			break;
-		case MAP_DROPPABLE:
-			if (VM_DROPPABLE == VM_NONE)
+		case MAP_DROPPABLE: {
+			vma_flags_t droppable = VMA_DROPPABLE;
+
+			if (vma_flags_empty(&droppable))
 				return -EOPNOTSUPP;
+			vma_flags_set_mask(&vma_flags, droppable);
+
 			/*
 			 * A locked or stack area makes no sense to be droppable.
 			 *
@@ -515,23 +527,24 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
 			 */
 			if (flags & (MAP_LOCKED | MAP_HUGETLB))
 			        return -EINVAL;
-			if (vm_flags & (VM_GROWSDOWN | VM_GROWSUP))
+			if (vma_flags_can_grow(&vma_flags))
 			        return -EINVAL;
 
-			vm_flags |= VM_DROPPABLE;
-
 			/*
 			 * If the pages can be dropped, then it doesn't make
 			 * sense to reserve them.
 			 */
-			vm_flags |= VM_NORESERVE;
+			vma_flags_set(&vma_flags, VMA_NORESERVE_BIT);
 
 			/*
 			 * Likewise, they're volatile enough that they
 			 * shouldn't survive forks or coredumps.
 			 */
-			vm_flags |= VM_WIPEONFORK | VM_DONTDUMP;
+			vma_flags_set(&vma_flags, VMA_WIPEONFORK_BIT,
+				      VMA_DONTDUMP_BIT);
+
 			fallthrough;
+		}
 		case MAP_PRIVATE:
 			/*
 			 * Set pgoff according to addr for anon_vma.
@@ -550,16 +563,16 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
 	if (flags & MAP_NORESERVE) {
 		/* We honor MAP_NORESERVE if allowed to overcommit */
 		if (sysctl_overcommit_memory != OVERCOMMIT_NEVER)
-			vm_flags |= VM_NORESERVE;
+			vma_flags_set(&vma_flags, VMA_NORESERVE_BIT);
 
 		/* hugetlb applies strict overcommit unless MAP_NORESERVE */
 		if (file && is_file_hugepages(file))
-			vm_flags |= VM_NORESERVE;
+			vma_flags_set(&vma_flags, VMA_NORESERVE_BIT);
 	}
 
-	addr = mmap_region(file, addr, len, vm_flags, pgoff, uf);
+	addr = mmap_region(file, addr, len, vma_flags, pgoff, uf);
 	if (!IS_ERR_VALUE(addr) &&
-	    ((vm_flags & VM_LOCKED) ||
+	    (vma_flags_test(&vma_flags, VMA_LOCKED_BIT) ||
 	     (flags & (MAP_POPULATE | MAP_NONBLOCK)) == MAP_POPULATE))
 		*populate = len;
 	return addr;
@@ -1191,7 +1204,7 @@ SYSCALL_DEFINE5(remap_file_pages, unsigned long, start, unsigned long, size,
 	}
 
 	ret = do_mmap(vma->vm_file, start, size,
-			prot, flags, 0, pgoff, &populate, NULL);
+			prot, flags, EMPTY_VMA_FLAGS, pgoff, &populate, NULL);
 out:
 	mmap_write_unlock(mm);
 	fput(file);
diff --git a/mm/nommu.c b/mm/nommu.c
index adc0b0ca906b..498e01ee40b0 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -1014,11 +1014,12 @@ unsigned long do_mmap(struct file *file,
 			unsigned long len,
 			unsigned long prot,
 			unsigned long flags,
-			vm_flags_t vm_flags,
+			vma_flags_t vma_flags,
 			unsigned long pgoff,
 			unsigned long *populate,
 			struct list_head *uf)
 {
+	vm_flags_t vm_flags = vma_flags_to_legacy(vma_flags);
 	struct vm_area_struct *vma;
 	struct vm_region *region;
 	struct rb_node *rb;
diff --git a/mm/util.c b/mm/util.c
index 5090457542ca..bf0513d1d3d0 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -578,8 +578,8 @@ unsigned long vm_mmap_pgoff(struct file *file, unsigned long addr,
 	if (!ret) {
 		if (mmap_write_lock_killable(mm))
 			return -EINTR;
-		ret = do_mmap(file, addr, len, prot, flag, 0, pgoff, &populate,
-			      &uf);
+		ret = do_mmap(file, addr, len, prot, flag, EMPTY_VMA_FLAGS, pgoff,
+			      &populate, &uf);
 		mmap_write_unlock(mm);
 		userfaultfd_unmap_complete(mm, &uf);
 		if (populate)
@@ -627,20 +627,20 @@ EXPORT_SYMBOL(vm_mmap);
 unsigned long vm_mmap_shadow_stack(unsigned long addr, unsigned long len,
 		unsigned long flags)
 {
+	vma_flags_t vma_flags = VMA_SHADOW_STACK;
 	struct mm_struct *mm = current->mm;
 	unsigned long ret, unused;
-	vm_flags_t vm_flags = VM_SHADOW_STACK;
 
 	flags |= MAP_ANONYMOUS | MAP_PRIVATE;
 	if (addr)
 		flags |= MAP_FIXED_NOREPLACE;
 
 	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
-		vm_flags |= VM_NOHUGEPAGE;
+		vma_flags_set(&vma_flags, VMA_NOHUGEPAGE_BIT);
 
 	mmap_write_lock(mm);
 	ret = do_mmap(NULL, addr, len, PROT_READ | PROT_WRITE, flags,
-		      vm_flags, 0, &unused, NULL);
+		      vma_flags, 0, &unused, NULL);
 	mmap_write_unlock(mm);
 
 	return ret;
diff --git a/mm/vma.c b/mm/vma.c
index 9d556d33b24b..70b08c76ea2f 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -2883,7 +2883,7 @@ static unsigned long __mmap_region(struct file *file, unsigned long addr,
  * file to be mapped, otherwise NULL.
  * @addr: The page-aligned address at which to perform the mapping.
  * @len: The page-aligned, non-zero, length of the mapping.
- * @vm_flags: The VMA flags which should be applied to the mapping.
+ * @vma_flags: The VMA flags which should be applied to the mapping.
  * @pgoff: If @file is specified, the page offset into the file, if not then
  * the virtual page offset in memory of the anonymous mapping.
  * @uf: Optionally, a pointer to a list head used for tracking userfaultfd unmap
@@ -2893,12 +2893,11 @@ static unsigned long __mmap_region(struct file *file, unsigned long addr,
  * been performed.
  */
 unsigned long mmap_region(struct file *file, unsigned long addr,
-			  unsigned long len, vm_flags_t vm_flags,
+			  unsigned long len, vma_flags_t vma_flags,
 			  unsigned long pgoff, struct list_head *uf)
 {
 	unsigned long ret;
 	bool writable_file_mapping = false;
-	const vma_flags_t vma_flags = legacy_to_vma_flags(vm_flags);
 
 	mmap_assert_write_locked(current->mm);
 
@@ -2907,7 +2906,7 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
 		return -EACCES;
 
 	/* Allow architectures to sanity-check the vm_flags. */
-	if (!arch_validate_flags(vm_flags))
+	if (!arch_validate_flags(vma_flags_to_legacy(vma_flags)))
 		return -EINVAL;
 
 	/* Map writable and ensure this isn't a sealed memfd. */
diff --git a/mm/vma.h b/mm/vma.h
index adb7a0ba1192..4eb85b4a6adc 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -517,7 +517,7 @@ int mm_take_all_locks(struct mm_struct *mm);
 void mm_drop_all_locks(struct mm_struct *mm);
 
 unsigned long mmap_region(struct file *file, unsigned long addr,
-		unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
+		unsigned long len, vma_flags_t vma_flags, unsigned long pgoff,
 		struct list_head *uf);
 
 int do_brk_flags(struct vma_iterator *vmi, struct vm_area_struct *brkvma,

-- 
2.55.0


