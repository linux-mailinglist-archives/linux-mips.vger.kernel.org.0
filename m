Return-Path: <linux-mips+bounces-15789-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KQWAAk6QUmokRAMAu9opvQ
	(envelope-from <linux-mips+bounces-15789-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 20:49:50 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4657429F2
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 20:49:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="YgX1w/cj";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15789-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15789-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7D67A30028EA
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 18:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA0D30D400;
	Sat, 11 Jul 2026 18:49:34 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2459630D3E7;
	Sat, 11 Jul 2026 18:49:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783795774; cv=none; b=UbEki9akkS7suRJiAHtULbt5bM6JCU5bOb2ysZR6nFikl9wMeROSDK0XwYoxGGodXxbePgX7JT4/KyeuMuuIzeSAc1MiSqnteQ0MYqZa5h/RBgr7zgkbUmXgpr1UWnQcXf8t/rBmDiUE2aYtSN2ROl6mZZ7AJQwtMTG+KN10254=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783795774; c=relaxed/simple;
	bh=12NkDtkZsgv4tumIZ1Li1kdvxPQKo0e0f0d/e5C85HE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MJ/S28NO9xStd2OExvF3tO45Zz/Y3IRXfYblp2iNEji+/eBiOupNI6pR2BYfENoVddzCvaClJnu+PCPLVif2Yqjp3EgGH2LmfpeXpCnVutfJjEUSRClg/JrE3yGNOoOWO37iikwPgwRcLOzczxeQ18thLuOIb1cPyhKyzpd9YXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YgX1w/cj; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ABD01F00A3A;
	Sat, 11 Jul 2026 18:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783795772;
	bh=F7JbYfoR0cBo3rK9+sjl2GjH5zAlrFeYJDLZN+6KwQc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YgX1w/cjR8WW7yAZK54+rQ0d90kWJBtvSsotwFoOsbT1jEjUv+GBeJk+emgMy+T1b
	 4NmtgJa3KAaWfNdlVas+DLRld0NYlKD608QgNo3ayghduF02ZaZspWu7cFAVIEwmQT
	 i/QMae1t1yCToyOSygT8AGwDD8ih5WV9TxgWALUrWKoKSlJDM32b/4wZb56F/MNqwa
	 ibM6KyzyLmz+I9eMGK75CzcO/6KXshFhD90r8Nyp0a3VNBMw8MLH6TTnhDIiICXDCE
	 qX519KpT+qQjZgiMubdoDozDvMvaNHUGSTjH3oTfJO/3AqH3CmZEAioli+P7/Fd/Gr
	 Zw3fCwHDxMEWQ==
From: Lorenzo Stoakes <ljs@kernel.org>
Date: Sat, 11 Jul 2026 19:45:08 +0100
Subject: [PATCH v2 11/13] mm/mlock: convert mlock code to use vma_flags_t
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-b4-vma-flags-mm-v2-11-0fa2357d5431@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10659; i=ljs@kernel.org;
 h=from:subject:message-id; bh=12NkDtkZsgv4tumIZ1Li1kdvxPQKo0e0f0d/e5C85HE=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLKC+q2U/t/Zc52rw7NtrciSmor9vhun7bDe9HnRAg7Ja
 cyqWbnrOkpZGMS4GGTFFFmefxHfHyQSNq/zgr8bzBxWJpAhDFycAjCRpRwM/52KL+dGd2U+vcZ6
 5VvA0uleV8Mu5Ck9uXaQ8eBm7fZnmj2MDN2eM1TPyd28I+kbcNei+mhv94Tzv59s1gvJ8+BYoHC
 ZkR0A
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15789-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,etnaviv];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,nvidia.com:email,linux.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B4657429F2

Replace use of the legacy vm_flags_t flags with vma_flags_t values
throughout the mlock logic.

Additionally update comments to reflect the changes to be consistent.

No functional change intended.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 mm/mlock.c | 88 +++++++++++++++++++++++++++++++++-----------------------------
 1 file changed, 47 insertions(+), 41 deletions(-)

diff --git a/mm/mlock.c b/mm/mlock.c
index 34ffa954006f..efa6716e4dfb 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -329,7 +329,7 @@ static inline bool allow_mlock_munlock(struct folio *folio,
 	 * be split. And the pages are not in VM_LOCKed VMA
 	 * can be reclaimed.
 	 */
-	if (!(vma->vm_flags & VM_LOCKED))
+	if (!vma_test(vma, VMA_LOCKED_BIT))
 		return true;
 
 	/* folio_within_range() cannot take KSM, but any small folio is OK */
@@ -368,7 +368,7 @@ static int mlock_pte_range(pmd_t *pmd, unsigned long addr,
 		folio = pmd_folio(*pmd);
 		if (folio_is_zone_device(folio))
 			goto out;
-		if (vma->vm_flags & VM_LOCKED)
+		if (vma_test(vma, VMA_LOCKED_BIT))
 			mlock_folio(folio);
 		else
 			munlock_folio(folio);
@@ -393,7 +393,7 @@ static int mlock_pte_range(pmd_t *pmd, unsigned long addr,
 		if (!allow_mlock_munlock(folio, vma, start, end, step))
 			goto next_entry;
 
-		if (vma->vm_flags & VM_LOCKED)
+		if (vma_test(vma, VMA_LOCKED_BIT))
 			mlock_folio(folio);
 		else
 			munlock_folio(folio);
@@ -417,8 +417,8 @@ static int mlock_pte_range(pmd_t *pmd, unsigned long addr,
  * @end - end of range in @vma
  * @new_vma_flags - the new set of flags for @vma.
  *
- * Called for mlock(), mlock2() and mlockall(), to set @vma VM_LOCKED;
- * called for munlock() and munlockall(), to clear VM_LOCKED from @vma.
+ * Called for mlock(), mlock2() and mlockall(), to set @vma VMA_LOCKED_BIT;
+ * called for munlock() and munlockall(), to clear VMA_LOCKED_BIT from @vma.
  */
 static void mlock_vma_pages_range(struct vm_area_struct *vma,
 	unsigned long start, unsigned long end,
@@ -431,14 +431,14 @@ static void mlock_vma_pages_range(struct vm_area_struct *vma,
 
 	/*
 	 * There is a slight chance that concurrent page migration,
-	 * or page reclaim finding a page of this now-VM_LOCKED vma,
+	 * or page reclaim finding a page of this now-VMA_LOCKED_BIT vma,
 	 * will call mlock_vma_folio() and raise page's mlock_count:
 	 * double counting, leaving the page unevictable indefinitely.
-	 * Communicate this danger to mlock_vma_folio() with VM_IO,
-	 * which is a VM_SPECIAL flag not allowed on VM_LOCKED vmas.
+	 * Communicate this danger to mlock_vma_folio() with VMA_IO_BIT,
+	 * which is a VMA_SPECIAL_FLAGS flag not allowed on VMA_LOCKED_BIT vmas.
 	 * mmap_lock is held in write mode here, so this weird
 	 * combination should not be visible to other mmap_lock users;
-	 * but WRITE_ONCE so rmap walkers must see VM_IO if VM_LOCKED.
+	 * but WRITE_ONCE so rmap walkers must see VMA_IO_BIT if VMA_LOCKED_BIT.
 	 */
 	if (vma_flags_test(new_vma_flags, VMA_LOCKED_BIT))
 		vma_flags_set(new_vma_flags, VMA_IO_BIT);
@@ -458,7 +458,7 @@ static void mlock_vma_pages_range(struct vm_area_struct *vma,
 /*
  * mlock_fixup  - handle mlock[all]/munlock[all] requests.
  *
- * Filters out "special" vmas -- VM_LOCKED never gets set for these, and
+ * Filters out "special" vmas -- VMA_LOCKED_BIT never gets set for these, and
  * munlock is a no-op.  However, for some special vmas, we go ahead and
  * populate the ptes.
  *
@@ -466,24 +466,23 @@ static void mlock_vma_pages_range(struct vm_area_struct *vma,
  */
 static int mlock_fixup(struct vma_iterator *vmi, struct vm_area_struct *vma,
 	       struct vm_area_struct **prev, unsigned long start,
-	       unsigned long end, vm_flags_t newflags)
+	       unsigned long end, vma_flags_t *new_vma_flags)
 {
-	vma_flags_t new_vma_flags = legacy_to_vma_flags(newflags);
 	const vma_flags_t old_vma_flags = vma->flags;
 	struct mm_struct *mm = vma->vm_mm;
 	int nr_pages;
 	int ret = 0;
 
-	if (vma_flags_same_pair(&old_vma_flags, &new_vma_flags) ||
+	if (vma_flags_same_pair(&old_vma_flags, new_vma_flags) ||
 	    vma_is_secretmem(vma) || !vma_supports_mlock(vma)) {
 		/*
-		 * Don't set VM_LOCKED or VM_LOCKONFAULT and don't count.
-		 * For secretmem, don't allow the memory to be unlocked.
+		 * Don't set VMA_LOCKED_BIT or VMA_LOCKONFAULT_BIT and don't
+		 * count.  For secretmem, don't allow the memory to be unlocked.
 		 */
 		goto out;
 	}
 
-	vma = vma_modify_flags(vmi, *prev, vma, start, end, &new_vma_flags);
+	vma = vma_modify_flags(vmi, *prev, vma, start, end, new_vma_flags);
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);
 		goto out;
@@ -493,7 +492,7 @@ static int mlock_fixup(struct vma_iterator *vmi, struct vm_area_struct *vma,
 	 * Keep track of amount of locked VM.
 	 */
 	nr_pages = (end - start) >> PAGE_SHIFT;
-	if (!vma_flags_test(&new_vma_flags, VMA_LOCKED_BIT))
+	if (!vma_flags_test(new_vma_flags, VMA_LOCKED_BIT))
 		nr_pages = -nr_pages;
 	else if (vma_flags_test(&old_vma_flags, VMA_LOCKED_BIT))
 		nr_pages = 0;
@@ -502,15 +501,15 @@ static int mlock_fixup(struct vma_iterator *vmi, struct vm_area_struct *vma,
 	/*
 	 * vm_flags is protected by the mmap_lock held in write mode.
 	 * It's okay if try_to_unmap_one unmaps a page just after we
-	 * set VM_LOCKED, populate_vma_page_range will bring it back.
+	 * set VMA_LOCKED_BIT, populate_vma_page_range will bring it back.
 	 */
-	if (vma_flags_test(&new_vma_flags, VMA_LOCKED_BIT) &&
+	if (vma_flags_test(new_vma_flags, VMA_LOCKED_BIT) &&
 	    vma_flags_test(&old_vma_flags, VMA_LOCKED_BIT)) {
 		/* No work to do, and mlocking twice would be wrong */
 		vma_start_write(vma);
-		vma->flags = new_vma_flags;
+		vma->flags = *new_vma_flags;
 	} else {
-		mlock_vma_pages_range(vma, start, end, &new_vma_flags);
+		mlock_vma_pages_range(vma, start, end, new_vma_flags);
 	}
 out:
 	*prev = vma;
@@ -518,7 +517,7 @@ static int mlock_fixup(struct vma_iterator *vmi, struct vm_area_struct *vma,
 }
 
 static int apply_vma_lock_flags(unsigned long start, size_t len,
-				vm_flags_t flags)
+				const vma_flags_t *flags)
 {
 	unsigned long nstart, end, tmp;
 	struct vm_area_struct *vma, *prev;
@@ -543,18 +542,20 @@ static int apply_vma_lock_flags(unsigned long start, size_t len,
 	tmp = vma->vm_start;
 	for_each_vma_range(vmi, vma, end) {
 		int error;
-		vm_flags_t newflags;
+		vma_flags_t newflags;
 
 		if (vma->vm_start != tmp)
 			return -ENOMEM;
 
-		newflags = vma->vm_flags & ~VM_LOCKED_MASK;
-		newflags |= flags;
+		newflags = vma->flags;
+		vma_flags_clear_mask(&newflags, VMA_LOCKED_MASK);
+		vma_flags_set_mask(&newflags, *flags);
+
 		/* Here we know that  vma->vm_start <= nstart < vma->vm_end. */
 		tmp = vma->vm_end;
 		if (tmp > end)
 			tmp = end;
-		error = mlock_fixup(&vmi, vma, &prev, nstart, tmp, newflags);
+		error = mlock_fixup(&vmi, vma, &prev, nstart, tmp, &newflags);
 		if (error)
 			return error;
 		tmp = vma_iter_end(&vmi);
@@ -589,7 +590,7 @@ static unsigned long count_mm_mlocked_page_nr(struct mm_struct *mm,
 		end = start + len;
 
 	for_each_vma_range(vmi, vma, end) {
-		if (vma->vm_flags & VM_LOCKED) {
+		if (vma_test(vma, VMA_LOCKED_BIT)) {
 			if (start > vma->vm_start)
 				count -= (start - vma->vm_start);
 			if (end < vma->vm_end) {
@@ -615,7 +616,8 @@ static int __mlock_posix_error_return(long retval)
 	return retval;
 }
 
-static __must_check int do_mlock(unsigned long start, size_t len, vm_flags_t flags)
+static __must_check int do_mlock(unsigned long start, size_t len,
+				 vma_flags_t *flags)
 {
 	unsigned long locked;
 	unsigned long lock_limit;
@@ -664,24 +666,27 @@ static __must_check int do_mlock(unsigned long start, size_t len, vm_flags_t fla
 
 SYSCALL_DEFINE2(mlock, unsigned long, start, size_t, len)
 {
-	return do_mlock(start, len, VM_LOCKED);
+	vma_flags_t flags = mk_vma_flags(VMA_LOCKED_BIT);
+
+	return do_mlock(start, len, &flags);
 }
 
 SYSCALL_DEFINE3(mlock2, unsigned long, start, size_t, len, int, flags)
 {
-	vm_flags_t vm_flags = VM_LOCKED;
+	vma_flags_t vma_flags = mk_vma_flags(VMA_LOCKED_BIT);
 
 	if (flags & ~MLOCK_ONFAULT)
 		return -EINVAL;
 
 	if (flags & MLOCK_ONFAULT)
-		vm_flags |= VM_LOCKONFAULT;
+		vma_flags_set(&vma_flags, VMA_LOCKONFAULT_BIT);
 
-	return do_mlock(start, len, vm_flags);
+	return do_mlock(start, len, &vma_flags);
 }
 
 SYSCALL_DEFINE2(munlock, unsigned long, start, size_t, len)
 {
+	vma_flags_t flags = EMPTY_VMA_FLAGS;
 	int ret;
 
 	start = untagged_addr(start);
@@ -691,7 +696,7 @@ SYSCALL_DEFINE2(munlock, unsigned long, start, size_t, len)
 
 	if (mmap_write_lock_killable(current->mm))
 		return -EINTR;
-	ret = apply_vma_lock_flags(start, len, 0);
+	ret = apply_vma_lock_flags(start, len, &flags);
 	mmap_write_unlock(current->mm);
 
 	return ret;
@@ -705,14 +710,15 @@ SYSCALL_DEFINE2(munlock, unsigned long, start, size_t, len)
  * There are a couple of subtleties with this.  If mlockall() is called multiple
  * times with different flags, the values do not necessarily stack.  If mlockall
  * is called once including the MCL_FUTURE flag and then a second time without
- * it, VM_LOCKED and VM_LOCKONFAULT will be cleared from mm->def_vma_flags.
+ * it, VMA_LOCKED_BIT and VMA_LOCKONFAULT_BIT will be cleared from
+ * mm->def_vma_flags.
  */
 static int apply_mlockall_flags(int flags)
 {
 	VMA_ITERATOR(vmi, current->mm, 0);
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma, *prev = NULL;
-	vm_flags_t to_add = 0;
+	vma_flags_t to_add = EMPTY_VMA_FLAGS;
 
 	vma_flags_clear_mask(&mm->def_vma_flags, VMA_LOCKED_MASK);
 	if (flags & MCL_FUTURE) {
@@ -726,20 +732,20 @@ static int apply_mlockall_flags(int flags)
 	}
 
 	if (flags & MCL_CURRENT) {
-		to_add |= VM_LOCKED;
+		vma_flags_set(&to_add, VMA_LOCKED_BIT);
 		if (flags & MCL_ONFAULT)
-			to_add |= VM_LOCKONFAULT;
+			vma_flags_set(&to_add, VMA_LOCKONFAULT_BIT);
 	}
 
 	for_each_vma(vmi, vma) {
 		int error;
-		vm_flags_t newflags;
+		vma_flags_t newflags = vma->flags;
 
-		newflags = vma->vm_flags & ~VM_LOCKED_MASK;
-		newflags |= to_add;
+		vma_flags_clear_mask(&newflags, VMA_LOCKED_MASK);
+		vma_flags_set_mask(&newflags, to_add);
 
 		error = mlock_fixup(&vmi, vma, &prev, vma->vm_start, vma->vm_end,
-				    newflags);
+				    &newflags);
 		/* Ignore errors, but prev needs fixing up. */
 		if (error)
 			prev = vma;

-- 
2.55.0


