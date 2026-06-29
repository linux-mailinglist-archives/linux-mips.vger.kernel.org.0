Return-Path: <linux-mips+bounces-15330-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1KuyGOPHQmoQBwoAu9opvQ
	(envelope-from <linux-mips+bounces-15330-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 21:30:43 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0A36DE670
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 21:30:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=F+1lY+lC;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15330-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15330-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35AA230ACCA4
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 19:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ACCB426D32;
	Mon, 29 Jun 2026 19:26:15 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D3E3B42DD;
	Mon, 29 Jun 2026 19:26:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782761175; cv=none; b=cdjl7EdleipppHII/fAF51xqmhd87ZAxcLcs9MuKJ30GsSO4xa3+qV1DOIrM23xyQyM/s7R2iIGfsLYQMbuYe8w8aKDeg382a4T8tpU4tz+jPrDUC+u24saQ6Snbk/hElM8Hm1pJEI+OBy613owi452xI7gpu6lfTKlq5br91P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782761175; c=relaxed/simple;
	bh=cZgpx9ycr7f068GPSQ7VRQ58TwjMm6btirZrrsYD7tg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZDmbsV9JfwkeUXPtWokUclNRgvUjPVYoarpPP9AX72moalA5/OVqZPGQrIien0Dh03kCVzJDxgZGtpj8UcOphBOBOp4Ctgbx1kAjsWMPsAkNAzlgLvw5bOVx21I8c/qzlHWDQ7oLEmEekg1Tij89Zhenf7XD6pC3BltJ8V4CQYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+1lY+lC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2FCC1F00A3D;
	Mon, 29 Jun 2026 19:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782761173;
	bh=gKmo4U1gXLGtJnRP+WhnxnFRqzwXuOB5h6v9uTSdV1s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=F+1lY+lCh4/ljg4cAF+WiIYMH69AbV51hkuC1jZywIIRJtnSTTT9Cl417kLqBvIL2
	 8OgnOg+47T8fRg2he/k0Czan1lawmcrV1QOn8ALLq/c2Ln2nuZw+lUVlp9IBNBM7O9
	 ULuAgYhvU87+ozqV7cC/Uv3vF3QGLRPm547HTvpe+ig3eiPKismCLxZqLocHJJSRPE
	 ub2TJPIrtzztEsLj+o6x6PxyaZ56GCtceA3IiAP5fOpSWc8Uo+I5/jmojutM8causc
	 cQ+/HDIGoeC5yU7JzcyMSeGb6xZ0mYXeADHJM+UmSIQ/cxJ8RXeP+AGDV1OS3TxIGG
	 sMbSC7d+ndHmA==
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
Subject: [PATCH 06/13] mm/vma: convert vm_pgprot_modify() to use vma_flags_t and rename
Date: Mon, 29 Jun 2026 20:25:29 +0100
Message-ID: <548ba81b2971734d4d2143237ad1465bd1b2f525.1782760670.git.ljs@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[alpha.franken.de,linux.ibm.com,ellerman.id.au,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,samsung.com,linaro.org,intel.com,ursulin.net,oss.qualcomm.com,redhat.com,ideasonboard.com,rock-chips.com,sntech.de,nvidia.com,collabora.com,broadcom.com,epam.com,gmx.de,kvack.org,zeniv.linux.org.uk,linux.dev,linux.alibaba.com,infradead.org,arm.com,google.com,suse.com,perex.cz,vger.kernel.org,lists.ozlabs.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,lists.xenproject.org];
	TAGGED_FROM(0.00)[bounces-15330-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:tsbogend@alpha.franken.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:l.stach@pengutronix.de,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:lyude@redhat.com,m:dakr@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:zack.rusin@broadcom.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:oleksandr_andrushchenko@epam.com,m:deller@gmx.de,m:bcrl@kvack.org,m:viro@zeniv.linux.org.uk,m:bra
 uner@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:ziy@nvidia.com,m:baolin.wang@linux.alibaba.com,m:liam@infradead.org,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:hughd@google.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:kees@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:dri-devel@lists.freedesktop.org,m:etnaviv@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-rockchip@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:xen-devel@lists.xenproject.org,m:linux-fbdev@vger.kernel.o
 rg,m:linux-aio@kvack.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-sound@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_GT_50(0.00)[82];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA0A36DE670

Update vm_pgprot_modify() to use the new VMA flags type vma_flags_t, and
rename to vma_pgprot_modify() accordingly.

This is part of the ongoing work to convert vm_flags_t to vma_flags_t, in
order to eliminate the arbitrary limit of the number of bits in a system
word on available VMA flags.

Update VMA userland tests accordingly, updating vma_set_page_prot() to no
longer inline vma_pgprot_modify(), rather we can simply define
vma_pgprot_modify() as a static inline function and the tests will pick it
up from vma.h.

No functional change intended.

Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 mm/mmap.c                       |  8 ++++----
 mm/vma.c                        |  2 +-
 mm/vma.h                        |  6 ++++--
 tools/testing/vma/include/dup.h | 12 +++++-------
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index 477f4a77361a..e834ec9273e3 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -80,13 +80,13 @@ core_param(ignore_rlimit_data, ignore_rlimit_data, bool, 0644);
 /* Update vma->vm_page_prot to reflect vma->vm_flags. */
 void vma_set_page_prot(struct vm_area_struct *vma)
 {
-	vm_flags_t vm_flags = vma->vm_flags;
+	vma_flags_t vma_flags = vma->flags;
 	pgprot_t vm_page_prot;
 
-	vm_page_prot = vm_pgprot_modify(vma->vm_page_prot, vm_flags);
+	vm_page_prot = vma_pgprot_modify(vma->vm_page_prot, vma_flags);
 	if (vma_wants_writenotify(vma, vm_page_prot)) {
-		vm_flags &= ~VM_SHARED;
-		vm_page_prot = vm_pgprot_modify(vm_page_prot, vm_flags);
+		vma_flags_clear(&vma_flags, VMA_SHARED_BIT);
+		vm_page_prot = vma_pgprot_modify(vm_page_prot, vma_flags);
 	}
 	/* remove_protection_ptes reads vma->vm_page_prot without mmap_lock */
 	WRITE_ONCE(vma->vm_page_prot, vm_page_prot);
diff --git a/mm/vma.c b/mm/vma.c
index fb4341943576..395b6619ecc1 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -2179,7 +2179,7 @@ bool vma_wants_writenotify(struct vm_area_struct *vma, pgprot_t vm_page_prot)
 	/* The open routine did something to the protections that pgprot_modify
 	 * won't preserve? */
 	if (pgprot_val(vm_page_prot) !=
-	    pgprot_val(vm_pgprot_modify(vm_page_prot, vma->vm_flags)))
+	    pgprot_val(vma_pgprot_modify(vm_page_prot, vma->flags)))
 		return false;
 
 	/*
diff --git a/mm/vma.h b/mm/vma.h
index bcf0c2773449..6a8abb8ae937 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -522,9 +522,11 @@ static inline bool vma_wants_manual_pte_write_upgrade(struct vm_area_struct *vma
 }
 
 #ifdef CONFIG_MMU
-static inline pgprot_t vm_pgprot_modify(pgprot_t oldprot, vm_flags_t vm_flags)
+static inline pgprot_t vma_pgprot_modify(pgprot_t oldprot, vma_flags_t vma_flags)
 {
-	return pgprot_modify(oldprot, vm_get_page_prot(vm_flags));
+	const pgprot_t prot = vma_get_page_prot(vma_flags);
+
+	return pgprot_modify(oldprot, prot);
 }
 #endif
 
diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index 6f5bcd7fbcd8..813044781719 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -1434,20 +1434,18 @@ struct vm_area_struct *vma_iter_next_range(struct vma_iterator *vmi)
 }
 
 bool vma_wants_writenotify(struct vm_area_struct *vma, pgprot_t vm_page_prot);
+static inline pgprot_t vma_pgprot_modify(pgprot_t oldprot, vma_flags_t vma_flags);
 
 /* Update vma->vm_page_prot to reflect vma->vm_flags. */
 static inline void vma_set_page_prot(struct vm_area_struct *vma)
 {
-	vm_flags_t vm_flags = vma->vm_flags;
+	vma_flags_t vma_flags = vma->flags;
 	pgprot_t vm_page_prot;
 
-	/* testing: we inline vm_pgprot_modify() to avoid clash with vma.h. */
-	vm_page_prot = pgprot_modify(vma->vm_page_prot, vm_get_page_prot(vm_flags));
-
+	vm_page_prot = vma_pgprot_modify(vma->vm_page_prot, vma_flags);
 	if (vma_wants_writenotify(vma, vm_page_prot)) {
-		vm_flags &= ~VM_SHARED;
-		/* testing: we inline vm_pgprot_modify() to avoid clash with vma.h. */
-		vm_page_prot = pgprot_modify(vm_page_prot, vm_get_page_prot(vm_flags));
+		vma_flags_clear(&vma_flags, VMA_SHARED_BIT);
+		vm_page_prot = vma_pgprot_modify(vm_page_prot, vma_flags);
 	}
 	/* remove_protection_ptes reads vma->vm_page_prot without mmap_lock */
 	WRITE_ONCE(vma->vm_page_prot, vm_page_prot);
-- 
2.54.0


