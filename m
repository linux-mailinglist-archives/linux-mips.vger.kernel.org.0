Return-Path: <linux-mips+bounces-2591-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CE0899C38
	for <lists+linux-mips@lfdr.de>; Fri,  5 Apr 2024 13:59:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAFBA285686
	for <lists+linux-mips@lfdr.de>; Fri,  5 Apr 2024 11:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA5B16D4DB;
	Fri,  5 Apr 2024 11:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jn3Ed/BF"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B471116D308
	for <linux-mips@vger.kernel.org>; Fri,  5 Apr 2024 11:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712318311; cv=none; b=Ho99w+6PfohqBBh1SUZnDUIxLU7p426OEdikUl6UX31DiKpbktaNHC+qlhrz9Gxng8bwsRJmqE9SsD0rT3DXzUwj+l1IUYBiLz5QNnZ14ibFuIlNwJ+ywiNKipSypAqVKV273b6akJFUoGN+wf0AA0qNEkOKNuOzGeN19RnHIDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712318311; c=relaxed/simple;
	bh=VOl9mQCZZBeBKTYD0q38JVa+rIW4wA9u/6sOyqn9PV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q1e3es02BNQFNyUNjuGvqU2sgzEV5DjY56B05oEc2JtuP7fadnV9IppmX0UZLw1xG1ZkTpqLEJ7HQhCuqPW0HTl1zUzIkGBGTi3UAC4JCeSurHlo9fHs1NindtblNIhBJMKIIA6feGSr5qgbgTtK3Hf4XpY4Bb410v5f5mti4JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jn3Ed/BF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712318308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bNbIAMV3AIIh+finZC0kYCtErDA0HoO+gaZWe4mDURE=;
	b=Jn3Ed/BFsSdJZ2jFrWDfg9m4gT7KE5nLaxmOOYPdBQlCBt2jLPcNPTePdDGlUkeZKYRZWT
	2SANn5saA18wTPcpiJkDZCip6gQ1w0Nex2oE/jWMP+xhTMJj/+kSjkjDsYsaQGYFKaPvZC
	nMadEha8VgS1ZM7JJUxk5qnuprnINBg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-j7EJIyIYM6OGTJqf_yp9KQ-1; Fri, 05 Apr 2024 07:58:23 -0400
X-MC-Unique: j7EJIyIYM6OGTJqf_yp9KQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 584B885CF01;
	Fri,  5 Apr 2024 11:58:22 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D080D40C6CB5;
	Fri,  5 Apr 2024 11:58:20 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 4/4] mm: replace set_pte_at_notify() with just set_pte_at()
Date: Fri,  5 Apr 2024 07:58:15 -0400
Message-ID: <20240405115815.3226315-5-pbonzini@redhat.com>
In-Reply-To: <20240405115815.3226315-1-pbonzini@redhat.com>
References: <20240405115815.3226315-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

With the demise of the .change_pte() MMU notifier callback, there is no
notification happening in set_pte_at_notify().  It is a synonym of
set_pte_at() and can be replaced with it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/linux/mmu_notifier.h | 2 --
 kernel/events/uprobes.c      | 5 ++---
 mm/ksm.c                     | 4 ++--
 mm/memory.c                  | 7 +------
 mm/migrate_device.c          | 8 ++------
 5 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index 8c72bf651606..d39ebb10caeb 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -657,6 +657,4 @@ static inline void mmu_notifier_synchronize(void)
 
 #endif /* CONFIG_MMU_NOTIFIER */
 
-#define set_pte_at_notify set_pte_at
-
 #endif /* _LINUX_MMU_NOTIFIER_H */
diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index e4834d23e1d1..f4523b95c945 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -18,7 +18,6 @@
 #include <linux/sched/coredump.h>
 #include <linux/export.h>
 #include <linux/rmap.h>		/* anon_vma_prepare */
-#include <linux/mmu_notifier.h>	/* set_pte_at_notify */
 #include <linux/swap.h>		/* folio_free_swap */
 #include <linux/ptrace.h>	/* user_enable_single_step */
 #include <linux/kdebug.h>	/* notifier mechanism */
@@ -195,8 +194,8 @@ static int __replace_page(struct vm_area_struct *vma, unsigned long addr,
 	flush_cache_page(vma, addr, pte_pfn(ptep_get(pvmw.pte)));
 	ptep_clear_flush(vma, addr, pvmw.pte);
 	if (new_page)
-		set_pte_at_notify(mm, addr, pvmw.pte,
-				  mk_pte(new_page, vma->vm_page_prot));
+		set_pte_at(mm, addr, pvmw.pte,
+			   mk_pte(new_page, vma->vm_page_prot));
 
 	folio_remove_rmap_pte(old_folio, old_page, vma);
 	if (!folio_mapped(old_folio))
diff --git a/mm/ksm.c b/mm/ksm.c
index 8c001819cf10..108a4d167824 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -1345,7 +1345,7 @@ static int write_protect_page(struct vm_area_struct *vma, struct page *page,
 		if (pte_write(entry))
 			entry = pte_wrprotect(entry);
 
-		set_pte_at_notify(mm, pvmw.address, pvmw.pte, entry);
+		set_pte_at(mm, pvmw.address, pvmw.pte, entry);
 	}
 	*orig_pte = entry;
 	err = 0;
@@ -1447,7 +1447,7 @@ static int replace_page(struct vm_area_struct *vma, struct page *page,
 	 * See Documentation/mm/mmu_notifier.rst
 	 */
 	ptep_clear_flush(vma, addr, ptep);
-	set_pte_at_notify(mm, addr, ptep, newpte);
+	set_pte_at(mm, addr, ptep, newpte);
 
 	folio = page_folio(page);
 	folio_remove_rmap_pte(folio, page, vma);
diff --git a/mm/memory.c b/mm/memory.c
index f2bc6dd15eb8..9a6f4d8aa379 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3327,13 +3327,8 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
 		ptep_clear_flush(vma, vmf->address, vmf->pte);
 		folio_add_new_anon_rmap(new_folio, vma, vmf->address);
 		folio_add_lru_vma(new_folio, vma);
-		/*
-		 * We call the notify macro here because, when using secondary
-		 * mmu page tables (such as kvm shadow page tables), we want the
-		 * new page to be mapped directly into the secondary page table.
-		 */
 		BUG_ON(unshare && pte_write(entry));
-		set_pte_at_notify(mm, vmf->address, vmf->pte, entry);
+		set_pte_at(mm, vmf->address, vmf->pte, entry);
 		update_mmu_cache_range(vmf, vma, vmf->address, vmf->pte, 1);
 		if (old_folio) {
 			/*
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index b6c27c76e1a0..66206734b1b9 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -664,13 +664,9 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 	if (flush) {
 		flush_cache_page(vma, addr, pte_pfn(orig_pte));
 		ptep_clear_flush(vma, addr, ptep);
-		set_pte_at_notify(mm, addr, ptep, entry);
-		update_mmu_cache(vma, addr, ptep);
-	} else {
-		/* No need to invalidate - it was non-present before */
-		set_pte_at(mm, addr, ptep, entry);
-		update_mmu_cache(vma, addr, ptep);
 	}
+	set_pte_at(mm, addr, ptep, entry);
+	update_mmu_cache(vma, addr, ptep);
 
 	pte_unmap_unlock(ptep, ptl);
 	*src = MIGRATE_PFN_MIGRATE;
-- 
2.43.0


