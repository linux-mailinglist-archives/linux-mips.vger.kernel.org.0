Return-Path: <linux-mips+bounces-13774-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGJzGIDdumk3cwIAu9opvQ
	(envelope-from <linux-mips+bounces-13774-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 18:14:40 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6250A2C002B
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 18:14:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2CEF23252152
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 15:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A23B3F23BF;
	Wed, 18 Mar 2026 15:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KuKmJ6ic"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD8D3F23B5;
	Wed, 18 Mar 2026 15:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849100; cv=none; b=M4KDdAEWBXvXi0pQXioZcQiwKL9ZTUBdpvcbdf8DcQ/5Emnyk3LaaHQ5DTirTUm96Y1XZ+9Z938z/+P/fdft+RKegXNYXpmkXRq2pc549tHNhHy4nltDInFKY8+ZKwdz2yCm6H2/alZhOiSdrnxOZ9j+9n4Vae3zPHWY8OAltmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849100; c=relaxed/simple;
	bh=f6wGZWohcDMbp1KKJoODa6C/YhuDf8xcljUyzEm0aKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lfLxcujURrbzmAMv57TR4HJdBFBQ5CDqGSYbT/9Z+Mrj+y6jSyH4WI8Gcs44M5Fd1RUmYZCzMY3CF2CzRVP3ZwW6h91TOOqBgwW5gDg5Tco9uRkdM/znLckwvuh3eBhWIWxJFUj4KQhNY9wdI4qmIToMI0ZuNT6fbYS1Y0Hed0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KuKmJ6ic; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1D4C2BCB0;
	Wed, 18 Mar 2026 15:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773849100;
	bh=f6wGZWohcDMbp1KKJoODa6C/YhuDf8xcljUyzEm0aKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KuKmJ6icYdWvxJe+IoaarWmp6pi88IHbKJ07T5n2JOncinHbG66j6LZvykf53XJi0
	 W8u2c08aHTFu7vw9tKc3eMA7r0WOSvyVigGM9xpLn3iPii/OgZWbBYtGh05y/XZ3dB
	 BQ1eEyVonwER3u5JeTqasCA1q6Y8MFZ7SLW0N9Hfe3pAFKdwBvvYN1lhs6X/suMuU1
	 MEE8nk7FXgFPlfEpFu8+Mr1bdr0/WCKV/TGwM4u1yITesWBnujQELNcxjrSo43MglM
	 BRD/scrJjtzX9v3NzzpDwQwUEbh14NwT2oB9FHzX1BPAs6R9F0M1craouJa+3oSgox
	 oiyBOLWgeD5vA==
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Kees Cook <kees@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Brian Cain <bcain@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Michal Hocko <mhocko@suse.com>,
	Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	selinux@vger.kernel.org
Subject: [PATCH v3 21/23] mm/vma: convert as much as we can in mm/vma.c to vma_flags_t
Date: Wed, 18 Mar 2026 15:50:32 +0000
Message-ID: <44a952b98d68fc231ab231de6de04b077866bab8.1773846935.git.ljs@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773846935.git.ljs@kernel.org>
References: <cover.1773846935.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oracle.com,google.com,suse.de,kvack.org,vger.kernel.org,armlinux.org.uk,arm.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,nod.at,cambridgegreys.com,sipsolutions.net,zeniv.linux.org.uk,suse.cz,zte.com.cn,linux.dev,suse.com,paul-moore.com,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13774-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_GT_50(0.00)[62];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-0.967];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6250A2C002B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Now we have established a good foundation for vm_flags_t to vma_flags_t
changes, update mm/vma.c to utilise vma_flags_t wherever possible.

We are able to convert VM_STARTGAP_FLAGS entirely as this is only used in
mm/vma.c, and to account for the fact we can't use VM_NONE to make life
easier, place the definition of this within existing #ifdef's to be
cleaner.

Generally the remaining changes are mechanical.

Also update the VMA tests to reflect the changes.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 include/linux/mm.h                |  6 ++-
 mm/vma.c                          | 89 +++++++++++++++++--------------
 tools/testing/vma/include/dup.h   |  4 ++
 tools/testing/vma/include/stubs.h |  2 +-
 4 files changed, 59 insertions(+), 42 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 4ba1229676ad..174b1d781ca0 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -463,8 +463,10 @@ enum {
 #if defined(CONFIG_X86_USER_SHADOW_STACK) || defined(CONFIG_ARM64_GCS) || \
 	defined(CONFIG_RISCV_USER_CFI)
 #define VM_SHADOW_STACK	INIT_VM_FLAG(SHADOW_STACK)
+#define VMA_STARTGAP_FLAGS mk_vma_flags(VMA_GROWSDOWN_BIT, VMA_SHADOW_STACK_BIT)
 #else
 #define VM_SHADOW_STACK	VM_NONE
+#define VMA_STARTGAP_FLAGS mk_vma_flags(VMA_GROWSDOWN_BIT)
 #endif
 #if defined(CONFIG_PPC64)
 #define VM_SAO		INIT_VM_FLAG(SAO)
@@ -539,8 +541,6 @@ enum {
 /* Temporary until VMA flags conversion complete. */
 #define VM_STACK_FLAGS vma_flags_to_legacy(VMA_STACK_FLAGS)
 
-#define VM_STARTGAP_FLAGS (VM_GROWSDOWN | VM_SHADOW_STACK)
-
 #ifdef CONFIG_MSEAL_SYSTEM_MAPPINGS
 #define VM_SEALED_SYSMAP	VM_SEALED
 #else
@@ -584,6 +584,8 @@ enum {
 /* This mask represents all the VMA flag bits used by mlock */
 #define VM_LOCKED_MASK	(VM_LOCKED | VM_LOCKONFAULT)
 
+#define VMA_LOCKED_MASK	mk_vma_flags(VMA_LOCKED_BIT, VMA_LOCKONFAULT_BIT)
+
 /* These flags can be updated atomically via VMA/mmap read lock. */
 #define VM_ATOMIC_SET_ALLOWED VM_MAYBE_GUARD
 
diff --git a/mm/vma.c b/mm/vma.c
index 9362860389ae..80f710f91f93 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -185,7 +185,7 @@ static void init_multi_vma_prep(struct vma_prepare *vp,
 }
 
 /*
- * Return true if we can merge this (vm_flags,anon_vma,file,vm_pgoff)
+ * Return true if we can merge this (vma_flags,anon_vma,file,vm_pgoff)
  * in front of (at a lower virtual address and file offset than) the vma.
  *
  * We cannot merge two vmas if they have differently assigned (non-NULL)
@@ -211,7 +211,7 @@ static bool can_vma_merge_before(struct vma_merge_struct *vmg)
 }
 
 /*
- * Return true if we can merge this (vm_flags,anon_vma,file,vm_pgoff)
+ * Return true if we can merge this (vma_flags,anon_vma,file,vm_pgoff)
  * beyond (at a higher virtual address and file offset than) the vma.
  *
  * We cannot merge two vmas if they have differently assigned (non-NULL)
@@ -850,7 +850,8 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 	 * furthermost left or right side of the VMA, then we have no chance of
 	 * merging and should abort.
 	 */
-	if (vmg->vm_flags & VM_SPECIAL || (!left_side && !right_side))
+	if (vma_flags_test_any_mask(&vmg->vma_flags, VMA_SPECIAL_FLAGS) ||
+	    (!left_side && !right_side))
 		return NULL;
 
 	if (left_side)
@@ -1072,7 +1073,8 @@ struct vm_area_struct *vma_merge_new_range(struct vma_merge_struct *vmg)
 	vmg->state = VMA_MERGE_NOMERGE;
 
 	/* Special VMAs are unmergeable, also if no prev/next. */
-	if ((vmg->vm_flags & VM_SPECIAL) || (!prev && !next))
+	if (vma_flags_test_any_mask(&vmg->vma_flags, VMA_SPECIAL_FLAGS) ||
+	    (!prev && !next))
 		return NULL;
 
 	can_merge_left = can_vma_merge_left(vmg);
@@ -1459,17 +1461,17 @@ static int vms_gather_munmap_vmas(struct vma_munmap_struct *vms,
 		nrpages = vma_pages(next);
 
 		vms->nr_pages += nrpages;
-		if (next->vm_flags & VM_LOCKED)
+		if (vma_test(next, VMA_LOCKED_BIT))
 			vms->locked_vm += nrpages;
 
-		if (next->vm_flags & VM_ACCOUNT)
+		if (vma_test(next, VMA_ACCOUNT_BIT))
 			vms->nr_accounted += nrpages;
 
 		if (is_exec_mapping(next->vm_flags))
 			vms->exec_vm += nrpages;
 		else if (is_stack_mapping(next->vm_flags))
 			vms->stack_vm += nrpages;
-		else if (is_data_mapping(next->vm_flags))
+		else if (is_data_mapping_vma_flags(&next->flags))
 			vms->data_vm += nrpages;
 
 		if (vms->uf) {
@@ -2065,14 +2067,13 @@ static bool vm_ops_needs_writenotify(const struct vm_operations_struct *vm_ops)
 
 static bool vma_is_shared_writable(struct vm_area_struct *vma)
 {
-	return (vma->vm_flags & (VM_WRITE | VM_SHARED)) ==
-		(VM_WRITE | VM_SHARED);
+	return vma_test_all(vma, VMA_WRITE_BIT, VMA_SHARED_BIT);
 }
 
 static bool vma_fs_can_writeback(struct vm_area_struct *vma)
 {
 	/* No managed pages to writeback. */
-	if (vma->vm_flags & VM_PFNMAP)
+	if (vma_test(vma, VMA_PFNMAP_BIT))
 		return false;
 
 	return vma->vm_file && vma->vm_file->f_mapping &&
@@ -2338,8 +2339,11 @@ void mm_drop_all_locks(struct mm_struct *mm)
  * We account for memory if it's a private writeable mapping,
  * not hugepages and VM_NORESERVE wasn't set.
  */
-static bool accountable_mapping(struct file *file, vm_flags_t vm_flags)
+static bool accountable_mapping(struct mmap_state *map)
 {
+	const struct file *file = map->file;
+	vma_flags_t mask;
+
 	/*
 	 * hugetlb has its own accounting separate from the core VM
 	 * VM_HUGETLB may not be set yet so we cannot check for that flag.
@@ -2347,7 +2351,9 @@ static bool accountable_mapping(struct file *file, vm_flags_t vm_flags)
 	if (file && is_file_hugepages(file))
 		return false;
 
-	return (vm_flags & (VM_NORESERVE | VM_SHARED | VM_WRITE)) == VM_WRITE;
+	mask = vma_flags_and(&map->vma_flags, VMA_NORESERVE_BIT, VMA_SHARED_BIT,
+			     VMA_WRITE_BIT);
+	return vma_flags_same(&mask, VMA_WRITE_BIT);
 }
 
 /*
@@ -2450,7 +2456,7 @@ static int __mmap_setup(struct mmap_state *map, struct vm_area_desc *desc,
 		return -ENOMEM;
 
 	/* Private writable mapping: check memory availability. */
-	if (accountable_mapping(map->file, map->vm_flags)) {
+	if (accountable_mapping(map)) {
 		map->charged = map->pglen;
 		map->charged -= vms->nr_accounted;
 		if (map->charged) {
@@ -2460,7 +2466,7 @@ static int __mmap_setup(struct mmap_state *map, struct vm_area_desc *desc,
 		}
 
 		vms->nr_accounted = 0;
-		map->vm_flags |= VM_ACCOUNT;
+		vma_flags_set(&map->vma_flags, VMA_ACCOUNT_BIT);
 	}
 
 	/*
@@ -2508,12 +2514,12 @@ static int __mmap_new_file_vma(struct mmap_state *map,
 	 * Drivers should not permit writability when previously it was
 	 * disallowed.
 	 */
-	VM_WARN_ON_ONCE(map->vm_flags != vma->vm_flags &&
-			!(map->vm_flags & VM_MAYWRITE) &&
-			(vma->vm_flags & VM_MAYWRITE));
+	VM_WARN_ON_ONCE(!vma_flags_same_pair(&map->vma_flags, &vma->flags) &&
+			!vma_flags_test(&map->vma_flags, VMA_MAYWRITE_BIT) &&
+			vma_test(vma, VMA_MAYWRITE_BIT));
 
 	map->file = vma->vm_file;
-	map->vm_flags = vma->vm_flags;
+	map->vma_flags = vma->flags;
 
 	return 0;
 }
@@ -2544,7 +2550,7 @@ static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
 
 	vma_iter_config(vmi, map->addr, map->end);
 	vma_set_range(vma, map->addr, map->end, map->pgoff);
-	vm_flags_init(vma, map->vm_flags);
+	vma->flags = map->vma_flags;
 	vma->vm_page_prot = map->page_prot;
 
 	if (vma_iter_prealloc(vmi, vma)) {
@@ -2554,7 +2560,7 @@ static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
 
 	if (map->file)
 		error = __mmap_new_file_vma(map, vma);
-	else if (map->vm_flags & VM_SHARED)
+	else if (vma_flags_test(&map->vma_flags, VMA_SHARED_BIT))
 		error = shmem_zero_setup(vma);
 	else
 		vma_set_anonymous(vma);
@@ -2564,7 +2570,7 @@ static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
 
 	if (!map->check_ksm_early) {
 		update_ksm_flags(map);
-		vm_flags_init(vma, map->vm_flags);
+		vma->flags = map->vma_flags;
 	}
 
 #ifdef CONFIG_SPARC64
@@ -2604,7 +2610,6 @@ static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
 static void __mmap_complete(struct mmap_state *map, struct vm_area_struct *vma)
 {
 	struct mm_struct *mm = map->mm;
-	vm_flags_t vm_flags = vma->vm_flags;
 
 	perf_event_mmap(vma);
 
@@ -2612,9 +2617,9 @@ static void __mmap_complete(struct mmap_state *map, struct vm_area_struct *vma)
 	vms_complete_munmap_vmas(&map->vms, &map->mas_detach);
 
 	vm_stat_account(mm, vma->vm_flags, map->pglen);
-	if (vm_flags & VM_LOCKED) {
+	if (vma_test(vma, VMA_LOCKED_BIT)) {
 		if (!vma_supports_mlock(vma))
-			vm_flags_clear(vma, VM_LOCKED_MASK);
+			vma_clear_flags_mask(vma, VMA_LOCKED_MASK);
 		else
 			mm->locked_vm += map->pglen;
 	}
@@ -2630,7 +2635,7 @@ static void __mmap_complete(struct mmap_state *map, struct vm_area_struct *vma)
 	 * a completely new data area).
 	 */
 	if (pgtable_supports_soft_dirty())
-		vm_flags_set(vma, VM_SOFTDIRTY);
+		vma_set_flags(vma, VMA_SOFTDIRTY_BIT);
 
 	vma_set_page_prot(vma);
 }
@@ -2993,7 +2998,8 @@ unsigned long unmapped_area(struct vm_unmapped_area_info *info)
 	gap = vma_iter_addr(&vmi) + info->start_gap;
 	gap += (info->align_offset - gap) & info->align_mask;
 	tmp = vma_next(&vmi);
-	if (tmp && (tmp->vm_flags & VM_STARTGAP_FLAGS)) { /* Avoid prev check if possible */
+	/* Avoid prev check if possible */
+	if (tmp && (vma_test_any_mask(tmp, VMA_STARTGAP_FLAGS))) {
 		if (vm_start_gap(tmp) < gap + length - 1) {
 			low_limit = tmp->vm_end;
 			vma_iter_reset(&vmi);
@@ -3045,7 +3051,8 @@ unsigned long unmapped_area_topdown(struct vm_unmapped_area_info *info)
 	gap -= (gap - info->align_offset) & info->align_mask;
 	gap_end = vma_iter_end(&vmi);
 	tmp = vma_next(&vmi);
-	if (tmp && (tmp->vm_flags & VM_STARTGAP_FLAGS)) { /* Avoid prev check if possible */
+	 /* Avoid prev check if possible */
+	if (tmp && (vma_test_any_mask(tmp, VMA_STARTGAP_FLAGS))) {
 		if (vm_start_gap(tmp) < gap_end) {
 			high_limit = vm_start_gap(tmp);
 			vma_iter_reset(&vmi);
@@ -3083,12 +3090,16 @@ static int acct_stack_growth(struct vm_area_struct *vma,
 		return -ENOMEM;
 
 	/* mlock limit tests */
-	if (!mlock_future_ok(mm, vma->vm_flags & VM_LOCKED, grow << PAGE_SHIFT))
+	if (!mlock_future_ok(mm, vma_test(vma, VMA_LOCKED_BIT),
+			     grow << PAGE_SHIFT))
 		return -ENOMEM;
 
 	/* Check to ensure the stack will not grow into a hugetlb-only region */
-	new_start = (vma->vm_flags & VM_GROWSUP) ? vma->vm_start :
-			vma->vm_end - size;
+	new_start = vma->vm_end - size;
+#ifdef CONFIG_STACK_GROWSUP
+	if (vma_test(vma, VMA_GROWSUP_BIT))
+		new_start = vma->vm_start;
+#endif
 	if (is_hugepage_only_range(vma->vm_mm, new_start, size))
 		return -EFAULT;
 
@@ -3102,7 +3113,7 @@ static int acct_stack_growth(struct vm_area_struct *vma,
 	return 0;
 }
 
-#if defined(CONFIG_STACK_GROWSUP)
+#ifdef CONFIG_STACK_GROWSUP
 /*
  * PA-RISC uses this for its stack.
  * vma is the last one with address > vma->vm_end.  Have to extend vma.
@@ -3115,7 +3126,7 @@ int expand_upwards(struct vm_area_struct *vma, unsigned long address)
 	int error = 0;
 	VMA_ITERATOR(vmi, mm, vma->vm_start);
 
-	if (!(vma->vm_flags & VM_GROWSUP))
+	if (!vma_test(vma, VMA_GROWSUP_BIT))
 		return -EFAULT;
 
 	mmap_assert_write_locked(mm);
@@ -3135,7 +3146,7 @@ int expand_upwards(struct vm_area_struct *vma, unsigned long address)
 
 	next = find_vma_intersection(mm, vma->vm_end, gap_addr);
 	if (next && vma_is_accessible(next)) {
-		if (!(next->vm_flags & VM_GROWSUP))
+		if (!vma_test(next, VMA_GROWSUP_BIT))
 			return -ENOMEM;
 		/* Check that both stack segments have the same anon_vma? */
 	}
@@ -3169,7 +3180,7 @@ int expand_upwards(struct vm_area_struct *vma, unsigned long address)
 		if (vma->vm_pgoff + (size >> PAGE_SHIFT) >= vma->vm_pgoff) {
 			error = acct_stack_growth(vma, size, grow);
 			if (!error) {
-				if (vma->vm_flags & VM_LOCKED)
+				if (vma_test(vma, VMA_LOCKED_BIT))
 					mm->locked_vm += grow;
 				vm_stat_account(mm, vma->vm_flags, grow);
 				anon_vma_interval_tree_pre_update_vma(vma);
@@ -3200,7 +3211,7 @@ int expand_downwards(struct vm_area_struct *vma, unsigned long address)
 	int error = 0;
 	VMA_ITERATOR(vmi, mm, vma->vm_start);
 
-	if (!(vma->vm_flags & VM_GROWSDOWN))
+	if (!vma_test(vma, VMA_GROWSDOWN_BIT))
 		return -EFAULT;
 
 	mmap_assert_write_locked(mm);
@@ -3213,7 +3224,7 @@ int expand_downwards(struct vm_area_struct *vma, unsigned long address)
 	prev = vma_prev(&vmi);
 	/* Check that both stack segments have the same anon_vma? */
 	if (prev) {
-		if (!(prev->vm_flags & VM_GROWSDOWN) &&
+		if (!vma_test(prev, VMA_GROWSDOWN_BIT) &&
 		    vma_is_accessible(prev) &&
 		    (address - prev->vm_end < stack_guard_gap))
 			return -ENOMEM;
@@ -3248,7 +3259,7 @@ int expand_downwards(struct vm_area_struct *vma, unsigned long address)
 		if (grow <= vma->vm_pgoff) {
 			error = acct_stack_growth(vma, size, grow);
 			if (!error) {
-				if (vma->vm_flags & VM_LOCKED)
+				if (vma_test(vma, VMA_LOCKED_BIT))
 					mm->locked_vm += grow;
 				vm_stat_account(mm, vma->vm_flags, grow);
 				anon_vma_interval_tree_pre_update_vma(vma);
@@ -3297,7 +3308,7 @@ int insert_vm_struct(struct mm_struct *mm, struct vm_area_struct *vma)
 	if (find_vma_intersection(mm, vma->vm_start, vma->vm_end))
 		return -ENOMEM;
 
-	if ((vma->vm_flags & VM_ACCOUNT) &&
+	if (vma_test(vma, VMA_ACCOUNT_BIT) &&
 	     security_vm_enough_memory_mm(mm, charged))
 		return -ENOMEM;
 
@@ -3319,7 +3330,7 @@ int insert_vm_struct(struct mm_struct *mm, struct vm_area_struct *vma)
 	}
 
 	if (vma_link(mm, vma)) {
-		if (vma->vm_flags & VM_ACCOUNT)
+		if (vma_test(vma, VMA_ACCOUNT_BIT))
 			vm_unacct_memory(charged);
 		return -ENOMEM;
 	}
diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index 93ea600d0895..58a621ec389f 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -267,8 +267,10 @@ enum {
 #endif /* CONFIG_ARCH_HAS_PKEYS */
 #if defined(CONFIG_X86_USER_SHADOW_STACK) || defined(CONFIG_ARM64_GCS)
 #define VM_SHADOW_STACK	INIT_VM_FLAG(SHADOW_STACK)
+#define VMA_STARTGAP_FLAGS mk_vma_flags(VMA_GROWSDOWN_BIT, VMA_SHADOW_STACK_BIT)
 #else
 #define VM_SHADOW_STACK	VM_NONE
+#define VMA_STARTGAP_FLAGS mk_vma_flags(VMA_GROWSDOWN_BIT)
 #endif
 #if defined(CONFIG_PPC64)
 #define VM_SAO		INIT_VM_FLAG(SAO)
@@ -366,6 +368,8 @@ enum {
 /* This mask represents all the VMA flag bits used by mlock */
 #define VM_LOCKED_MASK	(VM_LOCKED | VM_LOCKONFAULT)
 
+#define VMA_LOCKED_MASK	mk_vma_flags(VMA_LOCKED_BIT, VMA_LOCKONFAULT_BIT)
+
 #define RLIMIT_STACK		3	/* max stack size */
 #define RLIMIT_MEMLOCK		8	/* max locked-in-memory address space */
 
diff --git a/tools/testing/vma/include/stubs.h b/tools/testing/vma/include/stubs.h
index b5dced3b0bd4..5afb0afe2d48 100644
--- a/tools/testing/vma/include/stubs.h
+++ b/tools/testing/vma/include/stubs.h
@@ -229,7 +229,7 @@ static inline bool signal_pending(void *p)
 	return false;
 }
 
-static inline bool is_file_hugepages(struct file *file)
+static inline bool is_file_hugepages(const struct file *file)
 {
 	return false;
 }
-- 
2.53.0


