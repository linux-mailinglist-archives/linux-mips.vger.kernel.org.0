Return-Path: <linux-mips+bounces-13615-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF8tNSATs2mDSAAAu9opvQ
	(envelope-from <linux-mips+bounces-13615-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 20:25:20 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B9E277D5E
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 20:25:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 46311307DCA3
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 19:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6992D4035D4;
	Thu, 12 Mar 2026 19:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fJezqcaZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428514035CA;
	Thu, 12 Mar 2026 19:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343038; cv=none; b=S336C2eizegFwAA0ZnYR+kR9Euy4uKRWp3TG73gFBh96YYUU5V3glY6cgryRATYC22lmvXckwQjF/HORAGurNXQKzwVVR2/g6Xsj1XRktIK86R0dBYr1xA4AmX2R1OawdyOjnw9tktxbDYIdAYD22PKo5vNXXDtxYRs0NI6F5RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343038; c=relaxed/simple;
	bh=5mvZ7wu/pZIbbuK4W40IM5sbXFprDTVFZqGU3qkBqME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pXSIEl+RZZzvuQgFgyCIiWud/r3q+AN90xJxhN1yydaSAOQC0GZvkkJh5gRVUlDJYbOKK48dc8Dc7iRGu5EHckAZHF22awUaVedT9Ay4rf6hFvqgkce19+x/lMbGDMDbZq2BTUGI2J182jOh1EKzgKIbw3aPDglVmRXx3NajRCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fJezqcaZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542ACC4CEF7;
	Thu, 12 Mar 2026 19:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773343037;
	bh=5mvZ7wu/pZIbbuK4W40IM5sbXFprDTVFZqGU3qkBqME=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fJezqcaZpGZ3TBIjP2fvRqj37HWV9xbGq4wYKF8TMAmMduuwV4oUDBRQN/c/YrEro
	 fIYAr8qmhfBw6iQg7dn6kQGkiBZbmC2CnxoUPfEks/UrLqe8VV+OBCCQ6zA/5Z8Px4
	 CCZUBjp6yKyuTLo05qRTLPwBovvQ+u9SP/+wHKN1uwg2OIAmRPIinTpmyxvIIrpcqa
	 Yc6rjr/WHFqUfX9ylkX0NVOV9GJNTFt3N6T4Symj1KeTj+7pmj4CpBl/4WI5UQsAao
	 etqZrTjm+wGWZ7UOSFZE5fyRPy9U2a4uLjiIm9mJWk1xmknx5t9FlEAUbHMx+T8cMK
	 SujRU1NTe5VcA==
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
Subject: [PATCH 18/20] mm/vma: convert as much as we can in mm/vma.c to vma_flags_t
Date: Thu, 12 Mar 2026 19:16:16 +0000
Message-ID: <6a6d51947f23d6aa3a027808a0e150db4b8d9b14.1773342102.git.ljs@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773342102.git.ljs@kernel.org>
References: <cover.1773342102.git.ljs@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oracle.com,google.com,suse.de,kvack.org,vger.kernel.org,armlinux.org.uk,arm.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,nod.at,cambridgegreys.com,sipsolutions.net,zeniv.linux.org.uk,suse.cz,zte.com.cn,linux.dev,suse.com,paul-moore.com,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13615-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_GT_50(0.00)[62];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D8B9E277D5E
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
 include/linux/mm.h                |  6 +-
 mm/vma.c                          | 95 +++++++++++++++++--------------
 tools/testing/vma/include/dup.h   |  4 ++
 tools/testing/vma/include/stubs.h |  2 +-
 4 files changed, 62 insertions(+), 45 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index bec1b43efa50..fd873a9467f8 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -465,8 +465,10 @@ enum {
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
@@ -541,8 +543,6 @@ enum {
 /* Temporary until VMA flags conversion complete. */
 #define VM_STACK_FLAGS vma_flags_to_legacy(VMA_STACK_FLAGS)
 
-#define VM_STARTGAP_FLAGS (VM_GROWSDOWN | VM_SHADOW_STACK)
-
 #ifdef CONFIG_MSEAL_SYSTEM_MAPPINGS
 #define VM_SEALED_SYSMAP	VM_SEALED
 #else
@@ -586,6 +586,8 @@ enum {
 /* This mask represents all the VMA flag bits used by mlock */
 #define VM_LOCKED_MASK	(VM_LOCKED | VM_LOCKONFAULT)
 
+#define VMA_LOCKED_MASK	mk_vma_flags(VMA_LOCKED_BIT, VMA_LOCKONFAULT_BIT)
+
 /* These flags can be updated atomically via VMA/mmap read lock. */
 #define VM_ATOMIC_SET_ALLOWED VM_MAYBE_GUARD
 
diff --git a/mm/vma.c b/mm/vma.c
index 2018504d115b..0fe4a161960e 100644
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
@@ -1071,7 +1072,8 @@ struct vm_area_struct *vma_merge_new_range(struct vma_merge_struct *vmg)
 	vmg->state = VMA_MERGE_NOMERGE;
 
 	/* Special VMAs are unmergeable, also if no prev/next. */
-	if ((vmg->vm_flags & VM_SPECIAL) || (!prev && !next))
+	if (vma_flags_test_any_mask(&vmg->vma_flags, VMA_SPECIAL_FLAGS) ||
+	    (!prev && !next))
 		return NULL;
 
 	can_merge_left = can_vma_merge_left(vmg);
@@ -1458,17 +1460,17 @@ static int vms_gather_munmap_vmas(struct vma_munmap_struct *vms,
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
@@ -2064,14 +2066,13 @@ static bool vm_ops_needs_writenotify(const struct vm_operations_struct *vm_ops)
 
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
@@ -2337,8 +2338,11 @@ void mm_drop_all_locks(struct mm_struct *mm)
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
@@ -2346,7 +2350,9 @@ static bool accountable_mapping(struct file *file, vm_flags_t vm_flags)
 	if (file && is_file_hugepages(file))
 		return false;
 
-	return (vm_flags & (VM_NORESERVE | VM_SHARED | VM_WRITE)) == VM_WRITE;
+	mask = vma_flags_and(&map->vma_flags, VMA_NORESERVE_BIT, VMA_SHARED_BIT,
+			     VMA_WRITE_BIT);
+	return vma_flags_same(&mask, VMA_WRITE_BIT);
 }
 
 /*
@@ -2449,7 +2455,7 @@ static int __mmap_setup(struct mmap_state *map, struct vm_area_desc *desc,
 		return -ENOMEM;
 
 	/* Private writable mapping: check memory availability. */
-	if (accountable_mapping(map->file, map->vm_flags)) {
+	if (accountable_mapping(map)) {
 		map->charged = map->pglen;
 		map->charged -= vms->nr_accounted;
 		if (map->charged) {
@@ -2459,7 +2465,7 @@ static int __mmap_setup(struct mmap_state *map, struct vm_area_desc *desc,
 		}
 
 		vms->nr_accounted = 0;
-		map->vm_flags |= VM_ACCOUNT;
+		vma_flags_set(&map->vma_flags, VMA_ACCOUNT_BIT);
 	}
 
 	/*
@@ -2507,12 +2513,12 @@ static int __mmap_new_file_vma(struct mmap_state *map,
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
@@ -2543,7 +2549,7 @@ static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
 
 	vma_iter_config(vmi, map->addr, map->end);
 	vma_set_range(vma, map->addr, map->end, map->pgoff);
-	vm_flags_init(vma, map->vm_flags);
+	vma->flags = map->vma_flags;
 	vma->vm_page_prot = map->page_prot;
 
 	if (vma_iter_prealloc(vmi, vma)) {
@@ -2553,7 +2559,7 @@ static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
 
 	if (map->file)
 		error = __mmap_new_file_vma(map, vma);
-	else if (map->vm_flags & VM_SHARED)
+	else if (vma_flags_test(&map->vma_flags, VMA_SHARED_BIT))
 		error = shmem_zero_setup(vma);
 	else
 		vma_set_anonymous(vma);
@@ -2563,7 +2569,7 @@ static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
 
 	if (!map->check_ksm_early) {
 		update_ksm_flags(map);
-		vm_flags_init(vma, map->vm_flags);
+		vma->flags = map->vma_flags;
 	}
 
 #ifdef CONFIG_SPARC64
@@ -2603,7 +2609,6 @@ static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
 static void __mmap_complete(struct mmap_state *map, struct vm_area_struct *vma)
 {
 	struct mm_struct *mm = map->mm;
-	vm_flags_t vm_flags = vma->vm_flags;
 
 	perf_event_mmap(vma);
 
@@ -2611,11 +2616,11 @@ static void __mmap_complete(struct mmap_state *map, struct vm_area_struct *vma)
 	vms_complete_munmap_vmas(&map->vms, &map->mas_detach);
 
 	vm_stat_account(mm, vma->vm_flags, map->pglen);
-	if (vm_flags & VM_LOCKED) {
-		if ((vm_flags & VM_SPECIAL) || vma_is_dax(vma) ||
-					is_vm_hugetlb_page(vma) ||
-					vma == get_gate_vma(mm))
-			vm_flags_clear(vma, VM_LOCKED_MASK);
+	if (vma_test(vma, VMA_LOCKED_BIT)) {
+		if (vma_test_any_mask(vma, VMA_SPECIAL_FLAGS) ||
+		    vma_is_dax(vma) || is_vm_hugetlb_page(vma) ||
+		    vma == get_gate_vma(mm))
+			vma_clear_flags_mask(vma, VMA_LOCKED_MASK);
 		else
 			mm->locked_vm += map->pglen;
 	}
@@ -2631,7 +2636,7 @@ static void __mmap_complete(struct mmap_state *map, struct vm_area_struct *vma)
 	 * a completely new data area).
 	 */
 	if (pgtable_supports_soft_dirty())
-		vm_flags_set(vma, VM_SOFTDIRTY);
+		vma_set_flags(vma, VMA_SOFTDIRTY_BIT);
 
 	vma_set_page_prot(vma);
 }
@@ -2994,7 +2999,8 @@ unsigned long unmapped_area(struct vm_unmapped_area_info *info)
 	gap = vma_iter_addr(&vmi) + info->start_gap;
 	gap += (info->align_offset - gap) & info->align_mask;
 	tmp = vma_next(&vmi);
-	if (tmp && (tmp->vm_flags & VM_STARTGAP_FLAGS)) { /* Avoid prev check if possible */
+	/* Avoid prev check if possible */
+	if (tmp && (vma_test_any_mask(tmp, VMA_STARTGAP_FLAGS))) {
 		if (vm_start_gap(tmp) < gap + length - 1) {
 			low_limit = tmp->vm_end;
 			vma_iter_reset(&vmi);
@@ -3046,7 +3052,8 @@ unsigned long unmapped_area_topdown(struct vm_unmapped_area_info *info)
 	gap -= (gap - info->align_offset) & info->align_mask;
 	gap_end = vma_iter_end(&vmi);
 	tmp = vma_next(&vmi);
-	if (tmp && (tmp->vm_flags & VM_STARTGAP_FLAGS)) { /* Avoid prev check if possible */
+	 /* Avoid prev check if possible */
+	if (tmp && (vma_test_any_mask(tmp, VMA_STARTGAP_FLAGS))) {
 		if (vm_start_gap(tmp) < gap_end) {
 			high_limit = vm_start_gap(tmp);
 			vma_iter_reset(&vmi);
@@ -3084,12 +3091,16 @@ static int acct_stack_growth(struct vm_area_struct *vma,
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
 
@@ -3103,7 +3114,7 @@ static int acct_stack_growth(struct vm_area_struct *vma,
 	return 0;
 }
 
-#if defined(CONFIG_STACK_GROWSUP)
+#ifdef CONFIG_STACK_GROWSUP
 /*
  * PA-RISC uses this for its stack.
  * vma is the last one with address > vma->vm_end.  Have to extend vma.
@@ -3116,7 +3127,7 @@ int expand_upwards(struct vm_area_struct *vma, unsigned long address)
 	int error = 0;
 	VMA_ITERATOR(vmi, mm, vma->vm_start);
 
-	if (!(vma->vm_flags & VM_GROWSUP))
+	if (!vma_test(vma, VMA_GROWSUP_BIT))
 		return -EFAULT;
 
 	mmap_assert_write_locked(mm);
@@ -3136,7 +3147,7 @@ int expand_upwards(struct vm_area_struct *vma, unsigned long address)
 
 	next = find_vma_intersection(mm, vma->vm_end, gap_addr);
 	if (next && vma_is_accessible(next)) {
-		if (!(next->vm_flags & VM_GROWSUP))
+		if (!vma_test(next, VMA_GROWSUP_BIT))
 			return -ENOMEM;
 		/* Check that both stack segments have the same anon_vma? */
 	}
@@ -3170,7 +3181,7 @@ int expand_upwards(struct vm_area_struct *vma, unsigned long address)
 		if (vma->vm_pgoff + (size >> PAGE_SHIFT) >= vma->vm_pgoff) {
 			error = acct_stack_growth(vma, size, grow);
 			if (!error) {
-				if (vma->vm_flags & VM_LOCKED)
+				if (vma_test(vma, VMA_LOCKED_BIT))
 					mm->locked_vm += grow;
 				vm_stat_account(mm, vma->vm_flags, grow);
 				anon_vma_interval_tree_pre_update_vma(vma);
@@ -3201,7 +3212,7 @@ int expand_downwards(struct vm_area_struct *vma, unsigned long address)
 	int error = 0;
 	VMA_ITERATOR(vmi, mm, vma->vm_start);
 
-	if (!(vma->vm_flags & VM_GROWSDOWN))
+	if (!vma_test(vma, VMA_GROWSDOWN_BIT))
 		return -EFAULT;
 
 	mmap_assert_write_locked(mm);
@@ -3214,7 +3225,7 @@ int expand_downwards(struct vm_area_struct *vma, unsigned long address)
 	prev = vma_prev(&vmi);
 	/* Check that both stack segments have the same anon_vma? */
 	if (prev) {
-		if (!(prev->vm_flags & VM_GROWSDOWN) &&
+		if (!vma_test(prev, VMA_GROWSDOWN_BIT) &&
 		    vma_is_accessible(prev) &&
 		    (address - prev->vm_end < stack_guard_gap))
 			return -ENOMEM;
@@ -3249,7 +3260,7 @@ int expand_downwards(struct vm_area_struct *vma, unsigned long address)
 		if (grow <= vma->vm_pgoff) {
 			error = acct_stack_growth(vma, size, grow);
 			if (!error) {
-				if (vma->vm_flags & VM_LOCKED)
+				if (vma_test(vma, VMA_LOCKED_BIT))
 					mm->locked_vm += grow;
 				vm_stat_account(mm, vma->vm_flags, grow);
 				anon_vma_interval_tree_pre_update_vma(vma);
@@ -3298,7 +3309,7 @@ int insert_vm_struct(struct mm_struct *mm, struct vm_area_struct *vma)
 	if (find_vma_intersection(mm, vma->vm_start, vma->vm_end))
 		return -ENOMEM;
 
-	if ((vma->vm_flags & VM_ACCOUNT) &&
+	if (vma_test(vma, VMA_ACCOUNT_BIT) &&
 	     security_vm_enough_memory_mm(mm, charged))
 		return -ENOMEM;
 
@@ -3320,7 +3331,7 @@ int insert_vm_struct(struct mm_struct *mm, struct vm_area_struct *vma)
 	}
 
 	if (vma_link(mm, vma)) {
-		if (vma->vm_flags & VM_ACCOUNT)
+		if (vma_test(vma, VMA_ACCOUNT_BIT))
 			vm_unacct_memory(charged);
 		return -ENOMEM;
 	}
diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index 81bd34c62c75..71bb3559682d 100644
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
index e524873985fc..e2727870136f 100644
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


