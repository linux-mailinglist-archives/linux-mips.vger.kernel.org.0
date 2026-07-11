Return-Path: <linux-mips+bounces-15781-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D9dtFZqPUmrLQwMAu9opvQ
	(envelope-from <linux-mips+bounces-15781-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 20:46:50 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 132ED7428C1
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 20:46:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Cml+CY1M;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15781-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15781-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8178E300493F
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 18:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C2330C159;
	Sat, 11 Jul 2026 18:46:47 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77FB2F7EEE;
	Sat, 11 Jul 2026 18:46:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783795607; cv=none; b=KRsln/dltU0Mo6NPQnv6yw6Jh9K2/SgyAK1W0Pme+e42Mh2AimqqpiCvbOB2NcS5l8oSHyePuuhCrBaQDywWSBdmRzqDQKx5zJq/E7eDaDPq45CSMZU7b2/V1QRj09uHhTexJFPxo1YZP+WE3FcmH2E7+L5NY9sPRNM9NWyznu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783795607; c=relaxed/simple;
	bh=P0Efpepv9aum3/hXSHnF6jwUomGPaWFDJdFnLdhoXJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kdDOvOU1D8t4o5HAir8agc8tiEkU0jACeyJKqGp1kYaVeW7hO4BHXO/B2wLNV2cVdBSAV4Gbw6TeTNyhTb4QkaJv6YDy5w/v2agVZyFhzj9zaGjauL8yc2P65RSScw2l3l0CY1lEt5T5rBOWa4mEFy6VxlWVo/JOeUdahgSFMhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cml+CY1M; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0801F00A3A;
	Sat, 11 Jul 2026 18:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783795605;
	bh=+oyZ6VXOyf4ckjeNtdyGIBWr/UznafJo3nCv5RCwhdU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Cml+CY1MKh9iVCaXSwyy6lG3+svNJMWg+WudrFkeSHkVlr1sQGGiZzdcqL8HJbI+A
	 rXuXtkh5gKQ1rSQYZPuWrdWlAUMPoPlZVEDx0atFOjr2KtSAJjf3rDgIu3xThiSiQM
	 HX1/tqt8hWTLPU/KAccJSQ5EH/bfLUB7EEfE0AKJp85chpipCgPl9xVnNZagJbwTfR
	 I/eUKWUU5C/SeilvNVERd66MVxAvV2vsfeTyz76Ualz74to9fWZfJVf52ooiF2vi+v
	 7G6CnYstSi7Q/Nn0dfxn9rxYwzz4gdrTPUd0waE92egL1j6qcgR2A2M2kyUPm8UN72
	 XTgF2KlMJvQSA==
From: Lorenzo Stoakes <ljs@kernel.org>
Date: Sat, 11 Jul 2026 19:45:00 +0100
Subject: [PATCH v2 03/13] mm: convert __get_unmapped_area() to use
 vma_flags_t
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-b4-vma-flags-mm-v2-3-0fa2357d5431@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9398; i=ljs@kernel.org;
 h=from:subject:message-id; bh=P0Efpepv9aum3/hXSHnF6jwUomGPaWFDJdFnLdhoXJo=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLKC+i1XfIv0CD/o0frojeduF9dp+Rfm/9jrr3ds68Nz3
 57n/OKU6yhlYRDjYpAVU2R5/kV8f5BI2LzOC/5uMHNYmUCGMHBxCsBEnDoZGd5HcnpZ869dcttu
 2bF2Swk/5rTaDe8c/3RGds0Md33/o5Dhf5b45Mv7GttXXJ6oxSr/d85Sl/UV2UdDRPJXMmd5+xk
 8YwAA
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
	TAGGED_FROM(0.00)[bounces-15781-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.dev:email,nvidia.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 132ED7428C1

Update __get_unmapped_area() to be parameterised by vma_flags_t rather than
vm_flags_t as part of the effort to move VMA flags from a system word to a
bitmap.

We cascade the changes up to arch_get_unmapped_area_topdown() and
arch_get_unmapped_area(), where, for now, we use vma_flags_to_legacy() in
order to propagate the VMA flags.

No functional change intended.

Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 fs/hugetlbfs/inode.c     |  3 ++-
 include/linux/huge_mm.h  | 10 +++++-----
 include/linux/mm.h       |  6 ++++--
 include/linux/sched/mm.h |  9 +++------
 mm/huge_memory.c         | 21 ++++++++++++---------
 mm/mmap.c                | 27 ++++++++++++++-------------
 6 files changed, 40 insertions(+), 36 deletions(-)

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 9fddd1e0b813..43066f9ddf52 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -184,7 +184,8 @@ hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
 	if (addr)
 		addr0 = ALIGN(addr, huge_page_size(h));
 
-	return mm_get_unmapped_area_vmflags(file, addr0, len, pgoff, flags, 0);
+	return mm_get_unmapped_area_vmaflags(file, addr0, len, pgoff, flags,
+					     EMPTY_VMA_FLAGS);
 }
 
 /*
diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index cae97c307280..9e43e138c0b7 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -391,9 +391,9 @@ static inline bool thp_disabled_by_hw(void)
 
 unsigned long thp_get_unmapped_area(struct file *filp, unsigned long addr,
 		unsigned long len, unsigned long pgoff, unsigned long flags);
-unsigned long thp_get_unmapped_area_vmflags(struct file *filp, unsigned long addr,
+unsigned long thp_get_unmapped_area_vmaflags(struct file *filp, unsigned long addr,
 		unsigned long len, unsigned long pgoff, unsigned long flags,
-		vm_flags_t vm_flags);
+		vma_flags_t vma_flags);
 
 enum split_type {
 	SPLIT_TYPE_UNIFORM,
@@ -617,9 +617,9 @@ static inline unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
 #define thp_get_unmapped_area	NULL
 
 static inline unsigned long
-thp_get_unmapped_area_vmflags(struct file *filp, unsigned long addr,
-			      unsigned long len, unsigned long pgoff,
-			      unsigned long flags, vm_flags_t vm_flags)
+thp_get_unmapped_area_vmaflags(struct file *filp, unsigned long addr,
+			       unsigned long len, unsigned long pgoff,
+			       unsigned long flags, vma_flags_t vma_flags)
 {
 	return 0;
 }
diff --git a/include/linux/mm.h b/include/linux/mm.h
index d20aa2f80472..5b3825fddf58 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4191,13 +4191,15 @@ unsigned long randomize_page(unsigned long start, unsigned long range);
 
 unsigned long
 __get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
-		    unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags);
+		    unsigned long pgoff, unsigned long flags,
+		    vma_flags_t vma_flags);
 
 static inline unsigned long
 get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
 		  unsigned long pgoff, unsigned long flags)
 {
-	return __get_unmapped_area(file, addr, len, pgoff, flags, 0);
+	return __get_unmapped_area(file, addr, len, pgoff, flags,
+				   EMPTY_VMA_FLAGS);
 }
 
 unsigned long do_mmap(struct file *file, unsigned long addr,
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 95d0040df584..10d723bee95c 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -193,12 +193,9 @@ unsigned long mm_get_unmapped_area(struct file *filp, unsigned long addr,
 				   unsigned long len, unsigned long pgoff,
 				   unsigned long flags);
 
-unsigned long mm_get_unmapped_area_vmflags(struct file *filp,
-					   unsigned long addr,
-					   unsigned long len,
-					   unsigned long pgoff,
-					   unsigned long flags,
-					   vm_flags_t vm_flags);
+unsigned long mm_get_unmapped_area_vmaflags(struct file *filp,
+		unsigned long addr, unsigned long len, unsigned long pgoff,
+		unsigned long flags, vma_flags_t vma_flags);
 
 unsigned long
 generic_get_unmapped_area(struct file *filp, unsigned long addr,
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 0dc6d630570f..40d6b4078e3d 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1196,7 +1196,7 @@ static inline bool is_transparent_hugepage(const struct folio *folio)
 static unsigned long __thp_get_unmapped_area(struct file *filp,
 		unsigned long addr, unsigned long len,
 		loff_t off, unsigned long flags, unsigned long size,
-		vm_flags_t vm_flags)
+		vma_flags_t vma_flags)
 {
 	loff_t off_end = off + len;
 	loff_t off_align = round_up(off, size);
@@ -1212,8 +1212,9 @@ static unsigned long __thp_get_unmapped_area(struct file *filp,
 	if (len_pad < len || (off + len_pad) < off)
 		return 0;
 
-	ret = mm_get_unmapped_area_vmflags(filp, addr, len_pad,
-					   off >> PAGE_SHIFT, flags, vm_flags);
+	ret = mm_get_unmapped_area_vmaflags(filp, addr, len_pad,
+					    off >> PAGE_SHIFT, flags,
+					    vma_flags);
 
 	/*
 	 * The failure might be due to length padding. The caller will retry
@@ -1238,25 +1239,27 @@ static unsigned long __thp_get_unmapped_area(struct file *filp,
 	return ret;
 }
 
-unsigned long thp_get_unmapped_area_vmflags(struct file *filp, unsigned long addr,
+unsigned long thp_get_unmapped_area_vmaflags(struct file *filp, unsigned long addr,
 		unsigned long len, unsigned long pgoff, unsigned long flags,
-		vm_flags_t vm_flags)
+		vma_flags_t vma_flags)
 {
 	unsigned long ret;
 	loff_t off = (loff_t)pgoff << PAGE_SHIFT;
 
-	ret = __thp_get_unmapped_area(filp, addr, len, off, flags, PMD_SIZE, vm_flags);
+	ret = __thp_get_unmapped_area(filp, addr, len, off, flags, PMD_SIZE,
+				      vma_flags);
 	if (ret)
 		return ret;
 
-	return mm_get_unmapped_area_vmflags(filp, addr, len, pgoff, flags,
-					    vm_flags);
+	return mm_get_unmapped_area_vmaflags(filp, addr, len, pgoff, flags,
+					     vma_flags);
 }
 
 unsigned long thp_get_unmapped_area(struct file *filp, unsigned long addr,
 		unsigned long len, unsigned long pgoff, unsigned long flags)
 {
-	return thp_get_unmapped_area_vmflags(filp, addr, len, pgoff, flags, 0);
+	return thp_get_unmapped_area_vmaflags(filp, addr, len, pgoff, flags,
+					      EMPTY_VMA_FLAGS);
 }
 EXPORT_SYMBOL_GPL(thp_get_unmapped_area);
 
diff --git a/mm/mmap.c b/mm/mmap.c
index bcc3793e532d..4a88b2a233f7 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -411,8 +411,7 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
 	/* Obtain the address to map to. we verify (or select) it and ensure
 	 * that it represents a valid section of the address space.
 	 */
-	addr = __get_unmapped_area(file, addr, len, pgoff, flags,
-				   vma_flags_to_legacy(vma_flags));
+	addr = __get_unmapped_area(file, addr, len, pgoff, flags, vma_flags);
 	if (IS_ERR_VALUE(addr))
 		return addr;
 
@@ -812,19 +811,20 @@ arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 }
 #endif
 
-unsigned long mm_get_unmapped_area_vmflags(struct file *filp, unsigned long addr,
-					   unsigned long len, unsigned long pgoff,
-					   unsigned long flags, vm_flags_t vm_flags)
+unsigned long mm_get_unmapped_area_vmaflags(struct file *filp, unsigned long addr,
+		unsigned long len, unsigned long pgoff, unsigned long flags,
+		vma_flags_t vma_flags)
 {
 	if (mm_flags_test(MMF_TOPDOWN, current->mm))
 		return arch_get_unmapped_area_topdown(filp, addr, len, pgoff,
-						      flags, vm_flags);
-	return arch_get_unmapped_area(filp, addr, len, pgoff, flags, vm_flags);
+				flags, vma_flags_to_legacy(vma_flags));
+	return arch_get_unmapped_area(filp, addr, len, pgoff, flags,
+			vma_flags_to_legacy(vma_flags));
 }
 
 unsigned long
 __get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
-		unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
+		unsigned long pgoff, unsigned long flags, vma_flags_t vma_flags)
 {
 	unsigned long (*get_area)(struct file *, unsigned long,
 				  unsigned long, unsigned long, unsigned long)
@@ -859,11 +859,11 @@ __get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
 		   && !addr /* no hint */
 		   && IS_ALIGNED(len, PMD_SIZE)) {
 		/* Ensures that larger anonymous mappings are THP aligned. */
-		addr = thp_get_unmapped_area_vmflags(file, addr, len,
-						     pgoff, flags, vm_flags);
+		addr = thp_get_unmapped_area_vmaflags(file, addr, len,
+						      pgoff, flags, vma_flags);
 	} else {
-		addr = mm_get_unmapped_area_vmflags(file, addr, len,
-						    pgoff, flags, vm_flags);
+		addr = mm_get_unmapped_area_vmaflags(file, addr, len,
+						     pgoff, flags, vma_flags);
 	}
 	if (IS_ERR_VALUE(addr))
 		return addr;
@@ -881,7 +881,8 @@ unsigned long
 mm_get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
 		     unsigned long pgoff, unsigned long flags)
 {
-	return mm_get_unmapped_area_vmflags(file, addr, len, pgoff, flags, 0);
+	return mm_get_unmapped_area_vmaflags(file, addr, len, pgoff, flags,
+					     EMPTY_VMA_FLAGS);
 }
 EXPORT_SYMBOL(mm_get_unmapped_area);
 

-- 
2.55.0


