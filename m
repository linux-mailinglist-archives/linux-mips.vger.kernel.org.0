Return-Path: <linux-mips+bounces-13601-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GCcDP8Rs2mDSAAAu9opvQ
	(envelope-from <linux-mips+bounces-13601-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 20:20:31 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C38C277B08
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 20:20:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50B973220F2E
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 19:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7667936405E;
	Thu, 12 Mar 2026 19:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ujyqLIew"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F061317170;
	Thu, 12 Mar 2026 19:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343006; cv=none; b=ttkLVfuUY6Vpe+1wgTYXh7pnA2fhgrfnycc/MorRxUYk4jIteczHfcnxQElYHWm7mjVstDal6b5/iTgq8QeJzdT3M3X5F2xERz+9H4QUOqVa4CNx1mTnL+amTBW3zeFDekrKJ9QdoSX0sRaUkZ5Ljvws+sGKXReCxKIH4pzAajY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343006; c=relaxed/simple;
	bh=+M4BT0nrwQS1+BTMjEUM7b1+CvQgWXdBFpfMn8l/bGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IEWzNNLzKxDf1RnLzBU7U7vbInH7psIlpD9at6YslyE4mLuwQnbiUztEDAmMxgFF8wZAgoQi+Y5zb1YvyEOm7SgI2f22J62AvLANFlfzkiIcrgkP2bJpPCOxKb0zhvi3dtM63KD8Ujz+TchJv7i9+J0EUACPJaBpdmo8QfVmdiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ujyqLIew; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ABB2C2BC87;
	Thu, 12 Mar 2026 19:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773343004;
	bh=+M4BT0nrwQS1+BTMjEUM7b1+CvQgWXdBFpfMn8l/bGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ujyqLIewtZtmjtNaAsAH0qHaP3lR8yFZqDc6+AfdlnGA3xRQl2l7s81sfPXdWj+2X
	 4SGtO/ZeirMdSzAfXI8W4OvIFfh5rqPjaZlRIuvmeWhl1+DxuZQviOcO/umzxgJaP9
	 qJxJxwpkzCs39WrYYDMl1a+ujyX3yHyTAfWJ4ShRXpHqPugSA1D9rFRPmeV3+98WdH
	 BBj9wLvEAOMKYTSpYr6d+qV9Vz8HR/s2GrLyKORBehB5AJhqukzl/ZGikBa39zuxdm
	 PjTtsPhy6J14UP8BpcVF++8kRYgRJIOiBdfiLS3FLpCxhg3wdqcSOf95AtUrB2QS1h
	 hCDPQkdm7vVgQ==
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
Subject: [PATCH 04/20] tools/testing/vma: convert bulk of test code to vma_flags_t
Date: Thu, 12 Mar 2026 19:16:02 +0000
Message-ID: <26712be0774921d51df284005e90f4a9e3230b20.1773342102.git.ljs@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oracle.com,google.com,suse.de,kvack.org,vger.kernel.org,armlinux.org.uk,arm.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,nod.at,cambridgegreys.com,sipsolutions.net,zeniv.linux.org.uk,suse.cz,zte.com.cn,linux.dev,suse.com,paul-moore.com,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13601-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8C38C277B08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Covert the test code to utilise vma_flags_t as opposed to the deprecate
vm_flags_t as much as possible.

As part of this change, add VMA_STICKY_FLAGS and VMA_SPECIAL_FLAGS as early
versions of what these defines will look like in the kernel logic once this
logic is implemented.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 tools/testing/vma/include/custom.h |   7 +
 tools/testing/vma/include/dup.h    |   7 +-
 tools/testing/vma/shared.c         |   8 +-
 tools/testing/vma/shared.h         |   4 +-
 tools/testing/vma/tests/merge.c    | 313 +++++++++++++++--------------
 tools/testing/vma/tests/vma.c      |  10 +-
 6 files changed, 186 insertions(+), 163 deletions(-)

diff --git a/tools/testing/vma/include/custom.h b/tools/testing/vma/include/custom.h
index ce056e790817..da84f54cf977 100644
--- a/tools/testing/vma/include/custom.h
+++ b/tools/testing/vma/include/custom.h
@@ -130,3 +130,10 @@ static __always_inline bool vma_flags_same_mask(vma_flags_t *flags,
 }
 #define vma_flags_same(flags, ...) \
 	vma_flags_same_mask(flags, mk_vma_flags(__VA_ARGS__))
+#define VMA_SPECIAL_FLAGS mk_vma_flags(VMA_IO_BIT, VMA_DONTEXPAND_BIT, \
+				       VMA_PFNMAP_BIT, VMA_MIXEDMAP_BIT)
+#ifdef CONFIG_MEM_SOFT_DIRTY
+#define VMA_STICKY_FLAGS mk_vma_flags(VMA_SOFTDIRTY_BIT, VMA_MAYBE_GUARD_BIT)
+#else
+#define VMA_STICKY_FLAGS mk_vma_flags(VMA_MAYBE_GUARD_BIT)
+#endif
diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index faaf1239123d..005cef50704f 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -504,10 +504,7 @@ struct vm_area_desc {
 	/* Mutable fields. Populated with initial state. */
 	pgoff_t pgoff;
 	struct file *vm_file;
-	union {
-		vm_flags_t vm_flags;
-		vma_flags_t vma_flags;
-	};
+	vma_flags_t vma_flags;
 	pgprot_t page_prot;
 
 	/* Write-only fields. */
@@ -1143,7 +1140,7 @@ static inline int __compat_vma_mmap(const struct file_operations *f_op,
 
 		.pgoff = vma->vm_pgoff,
 		.vm_file = vma->vm_file,
-		.vm_flags = vma->vm_flags,
+		.vma_flags = vma->flags,
 		.page_prot = vma->vm_page_prot,
 
 		.action.type = MMAP_NOTHING, /* Default */
diff --git a/tools/testing/vma/shared.c b/tools/testing/vma/shared.c
index bda578cc3304..2565a5aecb80 100644
--- a/tools/testing/vma/shared.c
+++ b/tools/testing/vma/shared.c
@@ -14,7 +14,7 @@ struct task_struct __current;
 
 struct vm_area_struct *alloc_vma(struct mm_struct *mm,
 		unsigned long start, unsigned long end,
-		pgoff_t pgoff, vm_flags_t vm_flags)
+		pgoff_t pgoff, vma_flags_t vma_flags)
 {
 	struct vm_area_struct *vma = vm_area_alloc(mm);
 
@@ -24,7 +24,7 @@ struct vm_area_struct *alloc_vma(struct mm_struct *mm,
 	vma->vm_start = start;
 	vma->vm_end = end;
 	vma->vm_pgoff = pgoff;
-	vm_flags_reset(vma, vm_flags);
+	vma->flags = vma_flags;
 	vma_assert_detached(vma);
 
 	return vma;
@@ -38,9 +38,9 @@ void detach_free_vma(struct vm_area_struct *vma)
 
 struct vm_area_struct *alloc_and_link_vma(struct mm_struct *mm,
 		unsigned long start, unsigned long end,
-		pgoff_t pgoff, vm_flags_t vm_flags)
+		pgoff_t pgoff, vma_flags_t vma_flags)
 {
-	struct vm_area_struct *vma = alloc_vma(mm, start, end, pgoff, vm_flags);
+	struct vm_area_struct *vma = alloc_vma(mm, start, end, pgoff, vma_flags);
 
 	if (vma == NULL)
 		return NULL;
diff --git a/tools/testing/vma/shared.h b/tools/testing/vma/shared.h
index e2e5d6ef6bdd..8b9e3b11c3cb 100644
--- a/tools/testing/vma/shared.h
+++ b/tools/testing/vma/shared.h
@@ -94,7 +94,7 @@ static inline void dummy_close(struct vm_area_struct *)
 /* Helper function to simply allocate a VMA. */
 struct vm_area_struct *alloc_vma(struct mm_struct *mm,
 		unsigned long start, unsigned long end,
-		pgoff_t pgoff, vm_flags_t vm_flags);
+		pgoff_t pgoff, vma_flags_t vma_flags);
 
 /* Helper function to detach and free a VMA. */
 void detach_free_vma(struct vm_area_struct *vma);
@@ -102,7 +102,7 @@ void detach_free_vma(struct vm_area_struct *vma);
 /* Helper function to allocate a VMA and link it to the tree. */
 struct vm_area_struct *alloc_and_link_vma(struct mm_struct *mm,
 		unsigned long start, unsigned long end,
-		pgoff_t pgoff, vm_flags_t vm_flags);
+		pgoff_t pgoff, vma_flags_t vma_flags);
 
 /*
  * Helper function to reset the dummy anon_vma to indicate it has not been
diff --git a/tools/testing/vma/tests/merge.c b/tools/testing/vma/tests/merge.c
index 3708dc6945b0..d3e725dc0000 100644
--- a/tools/testing/vma/tests/merge.c
+++ b/tools/testing/vma/tests/merge.c
@@ -33,7 +33,7 @@ static int expand_existing(struct vma_merge_struct *vmg)
  * specified new range.
  */
 void vmg_set_range(struct vma_merge_struct *vmg, unsigned long start,
-		   unsigned long end, pgoff_t pgoff, vm_flags_t vm_flags)
+		   unsigned long end, pgoff_t pgoff, vma_flags_t vma_flags)
 {
 	vma_iter_set(vmg->vmi, start);
 
@@ -45,7 +45,7 @@ void vmg_set_range(struct vma_merge_struct *vmg, unsigned long start,
 	vmg->start = start;
 	vmg->end = end;
 	vmg->pgoff = pgoff;
-	vmg->vm_flags = vm_flags;
+	vmg->vma_flags = vma_flags;
 
 	vmg->just_expand = false;
 	vmg->__remove_middle = false;
@@ -56,10 +56,10 @@ void vmg_set_range(struct vma_merge_struct *vmg, unsigned long start,
 
 /* Helper function to set both the VMG range and its anon_vma. */
 static void vmg_set_range_anon_vma(struct vma_merge_struct *vmg, unsigned long start,
-		unsigned long end, pgoff_t pgoff, vm_flags_t vm_flags,
+		unsigned long end, pgoff_t pgoff, vma_flags_t vma_flags,
 		struct anon_vma *anon_vma)
 {
-	vmg_set_range(vmg, start, end, pgoff, vm_flags);
+	vmg_set_range(vmg, start, end, pgoff, vma_flags);
 	vmg->anon_vma = anon_vma;
 }
 
@@ -71,12 +71,12 @@ static void vmg_set_range_anon_vma(struct vma_merge_struct *vmg, unsigned long s
  */
 static struct vm_area_struct *try_merge_new_vma(struct mm_struct *mm,
 		struct vma_merge_struct *vmg, unsigned long start,
-		unsigned long end, pgoff_t pgoff, vm_flags_t vm_flags,
+		unsigned long end, pgoff_t pgoff, vma_flags_t vma_flags,
 		bool *was_merged)
 {
 	struct vm_area_struct *merged;
 
-	vmg_set_range(vmg, start, end, pgoff, vm_flags);
+	vmg_set_range(vmg, start, end, pgoff, vma_flags);
 
 	merged = merge_new(vmg);
 	if (merged) {
@@ -89,23 +89,24 @@ static struct vm_area_struct *try_merge_new_vma(struct mm_struct *mm,
 
 	ASSERT_EQ(vmg->state, VMA_MERGE_NOMERGE);
 
-	return alloc_and_link_vma(mm, start, end, pgoff, vm_flags);
+	return alloc_and_link_vma(mm, start, end, pgoff, vma_flags);
 }
 
 static bool test_simple_merge(void)
 {
 	struct vm_area_struct *vma;
-	vm_flags_t vm_flags = VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE;
+	vma_flags_t vma_flags = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT, VMA_MAYREAD_BIT,
+					     VMA_MAYWRITE_BIT);
 	struct mm_struct mm = {};
-	struct vm_area_struct *vma_left = alloc_vma(&mm, 0, 0x1000, 0, vm_flags);
-	struct vm_area_struct *vma_right = alloc_vma(&mm, 0x2000, 0x3000, 2, vm_flags);
+	struct vm_area_struct *vma_left = alloc_vma(&mm, 0, 0x1000, 0, vma_flags);
+	struct vm_area_struct *vma_right = alloc_vma(&mm, 0x2000, 0x3000, 2, vma_flags);
 	VMA_ITERATOR(vmi, &mm, 0x1000);
 	struct vma_merge_struct vmg = {
 		.mm = &mm,
 		.vmi = &vmi,
 		.start = 0x1000,
 		.end = 0x2000,
-		.vm_flags = vm_flags,
+		.vma_flags = vma_flags,
 		.pgoff = 1,
 	};
 
@@ -118,7 +119,7 @@ static bool test_simple_merge(void)
 	ASSERT_EQ(vma->vm_start, 0);
 	ASSERT_EQ(vma->vm_end, 0x3000);
 	ASSERT_EQ(vma->vm_pgoff, 0);
-	ASSERT_EQ(vma->vm_flags, vm_flags);
+	ASSERT_FLAGS_SAME_MASK(&vma->flags, vma_flags);
 
 	detach_free_vma(vma);
 	mtree_destroy(&mm.mm_mt);
@@ -129,11 +130,12 @@ static bool test_simple_merge(void)
 static bool test_simple_modify(void)
 {
 	struct vm_area_struct *vma;
-	vm_flags_t vm_flags = VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE;
+	vma_flags_t vma_flags = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT, VMA_MAYREAD_BIT,
+					     VMA_MAYWRITE_BIT);
+	vm_flags_t legacy_flags = VM_READ | VM_WRITE;
 	struct mm_struct mm = {};
-	struct vm_area_struct *init_vma = alloc_vma(&mm, 0, 0x3000, 0, vm_flags);
+	struct vm_area_struct *init_vma = alloc_vma(&mm, 0, 0x3000, 0, vma_flags);
 	VMA_ITERATOR(vmi, &mm, 0x1000);
-	vm_flags_t flags = VM_READ | VM_MAYREAD;
 
 	ASSERT_FALSE(attach_vma(&mm, init_vma));
 
@@ -142,7 +144,7 @@ static bool test_simple_modify(void)
 	 * performs the merge/split only.
 	 */
 	vma = vma_modify_flags(&vmi, init_vma, init_vma,
-			       0x1000, 0x2000, &flags);
+			       0x1000, 0x2000, &legacy_flags);
 	ASSERT_NE(vma, NULL);
 	/* We modify the provided VMA, and on split allocate new VMAs. */
 	ASSERT_EQ(vma, init_vma);
@@ -189,9 +191,10 @@ static bool test_simple_modify(void)
 
 static bool test_simple_expand(void)
 {
-	vm_flags_t vm_flags = VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE;
+	vma_flags_t vma_flags = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT, VMA_MAYREAD_BIT,
+					     VMA_MAYWRITE_BIT);
 	struct mm_struct mm = {};
-	struct vm_area_struct *vma = alloc_vma(&mm, 0, 0x1000, 0, vm_flags);
+	struct vm_area_struct *vma = alloc_vma(&mm, 0, 0x1000, 0, vma_flags);
 	VMA_ITERATOR(vmi, &mm, 0);
 	struct vma_merge_struct vmg = {
 		.vmi = &vmi,
@@ -217,9 +220,10 @@ static bool test_simple_expand(void)
 
 static bool test_simple_shrink(void)
 {
-	vm_flags_t vm_flags = VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE;
+	vma_flags_t vma_flags = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT, VMA_MAYREAD_BIT,
+					     VMA_MAYWRITE_BIT);
 	struct mm_struct mm = {};
-	struct vm_area_struct *vma = alloc_vma(&mm, 0, 0x3000, 0, vm_flags);
+	struct vm_area_struct *vma = alloc_vma(&mm, 0, 0x3000, 0, vma_flags);
 	VMA_ITERATOR(vmi, &mm, 0);
 
 	ASSERT_FALSE(attach_vma(&mm, vma));
@@ -238,7 +242,8 @@ static bool test_simple_shrink(void)
 
 static bool __test_merge_new(bool is_sticky, bool a_is_sticky, bool b_is_sticky, bool c_is_sticky)
 {
-	vm_flags_t vm_flags = VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE;
+	vma_flags_t vma_flags = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT,
+					     VMA_MAYREAD_BIT, VMA_MAYWRITE_BIT);
 	struct mm_struct mm = {};
 	VMA_ITERATOR(vmi, &mm, 0);
 	struct vma_merge_struct vmg = {
@@ -265,31 +270,31 @@ static bool __test_merge_new(bool is_sticky, bool a_is_sticky, bool b_is_sticky,
 	bool merged;
 
 	if (is_sticky)
-		vm_flags |= VM_STICKY;
+		vma_flags_set_mask(&vma_flags, VMA_STICKY_FLAGS);
 
 	/*
 	 * 0123456789abc
 	 * AA B       CC
 	 */
-	vma_a = alloc_and_link_vma(&mm, 0, 0x2000, 0, vm_flags);
+	vma_a = alloc_and_link_vma(&mm, 0, 0x2000, 0, vma_flags);
 	ASSERT_NE(vma_a, NULL);
 	if (a_is_sticky)
-		vm_flags_set(vma_a, VM_STICKY);
+		vma_flags_set_mask(&vma_a->flags, VMA_STICKY_FLAGS);
 	/* We give each VMA a single avc so we can test anon_vma duplication. */
 	INIT_LIST_HEAD(&vma_a->anon_vma_chain);
 	list_add(&dummy_anon_vma_chain_a.same_vma, &vma_a->anon_vma_chain);
 
-	vma_b = alloc_and_link_vma(&mm, 0x3000, 0x4000, 3, vm_flags);
+	vma_b = alloc_and_link_vma(&mm, 0x3000, 0x4000, 3, vma_flags);
 	ASSERT_NE(vma_b, NULL);
 	if (b_is_sticky)
-		vm_flags_set(vma_b, VM_STICKY);
+		vma_flags_set_mask(&vma_b->flags, VMA_STICKY_FLAGS);
 	INIT_LIST_HEAD(&vma_b->anon_vma_chain);
 	list_add(&dummy_anon_vma_chain_b.same_vma, &vma_b->anon_vma_chain);
 
-	vma_c = alloc_and_link_vma(&mm, 0xb000, 0xc000, 0xb, vm_flags);
+	vma_c = alloc_and_link_vma(&mm, 0xb000, 0xc000, 0xb, vma_flags);
 	ASSERT_NE(vma_c, NULL);
 	if (c_is_sticky)
-		vm_flags_set(vma_c, VM_STICKY);
+		vma_flags_set_mask(&vma_c->flags, VMA_STICKY_FLAGS);
 	INIT_LIST_HEAD(&vma_c->anon_vma_chain);
 	list_add(&dummy_anon_vma_chain_c.same_vma, &vma_c->anon_vma_chain);
 
@@ -299,7 +304,7 @@ static bool __test_merge_new(bool is_sticky, bool a_is_sticky, bool b_is_sticky,
 	 * 0123456789abc
 	 * AA B   **  CC
 	 */
-	vma_d = try_merge_new_vma(&mm, &vmg, 0x7000, 0x9000, 7, vm_flags, &merged);
+	vma_d = try_merge_new_vma(&mm, &vmg, 0x7000, 0x9000, 7, vma_flags, &merged);
 	ASSERT_NE(vma_d, NULL);
 	INIT_LIST_HEAD(&vma_d->anon_vma_chain);
 	list_add(&dummy_anon_vma_chain_d.same_vma, &vma_d->anon_vma_chain);
@@ -314,7 +319,7 @@ static bool __test_merge_new(bool is_sticky, bool a_is_sticky, bool b_is_sticky,
 	 */
 	vma_a->vm_ops = &vm_ops; /* This should have no impact. */
 	vma_b->anon_vma = &dummy_anon_vma;
-	vma = try_merge_new_vma(&mm, &vmg, 0x2000, 0x3000, 2, vm_flags, &merged);
+	vma = try_merge_new_vma(&mm, &vmg, 0x2000, 0x3000, 2, vma_flags, &merged);
 	ASSERT_EQ(vma, vma_a);
 	/* Merge with A, delete B. */
 	ASSERT_TRUE(merged);
@@ -325,7 +330,7 @@ static bool __test_merge_new(bool is_sticky, bool a_is_sticky, bool b_is_sticky,
 	ASSERT_TRUE(vma_write_started(vma));
 	ASSERT_EQ(mm.map_count, 3);
 	if (is_sticky || a_is_sticky || b_is_sticky)
-		ASSERT_TRUE(IS_SET(vma->vm_flags, VM_STICKY));
+		ASSERT_TRUE(vma_flags_test_any_mask(&vma->flags, VMA_STICKY_FLAGS));
 
 	/*
 	 * Merge to PREVIOUS VMA.
@@ -333,7 +338,7 @@ static bool __test_merge_new(bool is_sticky, bool a_is_sticky, bool b_is_sticky,
 	 * 0123456789abc
 	 * AAAA*  DD  CC
 	 */
-	vma = try_merge_new_vma(&mm, &vmg, 0x4000, 0x5000, 4, vm_flags, &merged);
+	vma = try_merge_new_vma(&mm, &vmg, 0x4000, 0x5000, 4, vma_flags, &merged);
 	ASSERT_EQ(vma, vma_a);
 	/* Extend A. */
 	ASSERT_TRUE(merged);
@@ -344,7 +349,7 @@ static bool __test_merge_new(bool is_sticky, bool a_is_sticky, bool b_is_sticky,
 	ASSERT_TRUE(vma_write_started(vma));
 	ASSERT_EQ(mm.map_count, 3);
 	if (is_sticky || a_is_sticky)
-		ASSERT_TRUE(IS_SET(vma->vm_flags, VM_STICKY));
+		ASSERT_TRUE(vma_flags_test_any_mask(&vma->flags, VMA_STICKY_FLAGS));
 
 	/*
 	 * Merge to NEXT VMA.
@@ -354,7 +359,7 @@ static bool __test_merge_new(bool is_sticky, bool a_is_sticky, bool b_is_sticky,
 	 */
 	vma_d->anon_vma = &dummy_anon_vma;
 	vma_d->vm_ops = &vm_ops; /* This should have no impact. */
-	vma = try_merge_new_vma(&mm, &vmg, 0x6000, 0x7000, 6, vm_flags, &merged);
+	vma = try_merge_new_vma(&mm, &vmg, 0x6000, 0x7000, 6, vma_flags, &merged);
 	ASSERT_EQ(vma, vma_d);
 	/* Prepend. */
 	ASSERT_TRUE(merged);
@@ -365,7 +370,7 @@ static bool __test_merge_new(bool is_sticky, bool a_is_sticky, bool b_is_sticky,
 	ASSERT_TRUE(vma_write_started(vma));
 	ASSERT_EQ(mm.map_count, 3);
 	if (is_sticky) /* D uses is_sticky. */
-		ASSERT_TRUE(IS_SET(vma->vm_flags, VM_STICKY));
+		ASSERT_TRUE(vma_flags_test_any_mask(&vma->flags, VMA_STICKY_FLAGS));
 
 	/*
 	 * Merge BOTH sides.
@@ -374,7 +379,7 @@ static bool __test_merge_new(bool is_sticky, bool a_is_sticky, bool b_is_sticky,
 	 * AAAAA*DDD  CC
 	 */
 	vma_d->vm_ops = NULL; /* This would otherwise degrade the merge. */
-	vma = try_merge_new_vma(&mm, &vmg, 0x5000, 0x6000, 5, vm_flags, &merged);
+	vma = try_merge_new_vma(&mm, &vmg, 0x5000, 0x6000, 5, vma_flags, &merged);
 	ASSERT_EQ(vma, vma_a);
 	/* Merge with A, delete D. */
 	ASSERT_TRUE(merged);
@@ -385,7 +390,7 @@ static bool __test_merge_new(bool is_sticky, bool a_is_sticky, bool b_is_sticky,
 	ASSERT_TRUE(vma_write_started(vma));
 	ASSERT_EQ(mm.map_count, 2);
 	if (is_sticky || a_is_sticky)
-		ASSERT_TRUE(IS_SET(vma->vm_flags, VM_STICKY));
+		ASSERT_TRUE(vma_flags_test_any_mask(&vma->flags, VMA_STICKY_FLAGS));
 
 	/*
 	 * Merge to NEXT VMA.
@@ -394,7 +399,7 @@ static bool __test_merge_new(bool is_sticky, bool a_is_sticky, bool b_is_sticky,
 	 * AAAAAAAAA *CC
 	 */
 	vma_c->anon_vma = &dummy_anon_vma;
-	vma = try_merge_new_vma(&mm, &vmg, 0xa000, 0xb000, 0xa, vm_flags, &merged);
+	vma = try_merge_new_vma(&mm, &vmg, 0xa000, 0xb000, 0xa, vma_flags, &merged);
 	ASSERT_EQ(vma, vma_c);
 	/* Prepend C. */
 	ASSERT_TRUE(merged);
@@ -405,7 +410,7 @@ static bool __test_merge_new(bool is_sticky, bool a_is_sticky, bool b_is_sticky,
 	ASSERT_TRUE(vma_write_started(vma));
 	ASSERT_EQ(mm.map_count, 2);
 	if (is_sticky || c_is_sticky)
-		ASSERT_TRUE(IS_SET(vma->vm_flags, VM_STICKY));
+		ASSERT_TRUE(vma_flags_test_any_mask(&vma->flags, VMA_STICKY_FLAGS));
 
 	/*
 	 * Merge BOTH sides.
@@ -413,7 +418,7 @@ static bool __test_merge_new(bool is_sticky, bool a_is_sticky, bool b_is_sticky,
 	 * 0123456789abc
 	 * AAAAAAAAA*CCC
 	 */
-	vma = try_merge_new_vma(&mm, &vmg, 0x9000, 0xa000, 0x9, vm_flags, &merged);
+	vma = try_merge_new_vma(&mm, &vmg, 0x9000, 0xa000, 0x9, vma_flags, &merged);
 	ASSERT_EQ(vma, vma_a);
 	/* Extend A and delete C. */
 	ASSERT_TRUE(merged);
@@ -424,7 +429,7 @@ static bool __test_merge_new(bool is_sticky, bool a_is_sticky, bool b_is_sticky,
 	ASSERT_TRUE(vma_write_started(vma));
 	ASSERT_EQ(mm.map_count, 1);
 	if (is_sticky || a_is_sticky || c_is_sticky)
-		ASSERT_TRUE(IS_SET(vma->vm_flags, VM_STICKY));
+		ASSERT_TRUE(vma_flags_test_any_mask(&vma->flags, VMA_STICKY_FLAGS));
 
 	/*
 	 * Final state.
@@ -469,29 +474,30 @@ static bool test_merge_new(void)
 
 static bool test_vma_merge_special_flags(void)
 {
-	vm_flags_t vm_flags = VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE;
+	vma_flags_t vma_flags = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT,
+					     VMA_MAYREAD_BIT, VMA_MAYWRITE_BIT);
 	struct mm_struct mm = {};
 	VMA_ITERATOR(vmi, &mm, 0);
 	struct vma_merge_struct vmg = {
 		.mm = &mm,
 		.vmi = &vmi,
 	};
-	vm_flags_t special_flags[] = { VM_IO, VM_DONTEXPAND, VM_PFNMAP, VM_MIXEDMAP };
-	vm_flags_t all_special_flags = 0;
+	vma_flag_t special_flags[] = { VMA_IO_BIT, VMA_DONTEXPAND_BIT,
+		VMA_PFNMAP_BIT, VMA_MIXEDMAP_BIT };
+	vma_flags_t all_special_flags = EMPTY_VMA_FLAGS;
 	int i;
 	struct vm_area_struct *vma_left, *vma;
 
 	/* Make sure there aren't new VM_SPECIAL flags. */
-	for (i = 0; i < ARRAY_SIZE(special_flags); i++) {
-		all_special_flags |= special_flags[i];
-	}
-	ASSERT_EQ(all_special_flags, VM_SPECIAL);
+	for (i = 0; i < ARRAY_SIZE(special_flags); i++)
+		vma_flags_set(&all_special_flags, special_flags[i]);
+	ASSERT_FLAGS_SAME_MASK(&all_special_flags, VMA_SPECIAL_FLAGS);
 
 	/*
 	 * 01234
 	 * AAA
 	 */
-	vma_left = alloc_and_link_vma(&mm, 0, 0x3000, 0, vm_flags);
+	vma_left = alloc_and_link_vma(&mm, 0, 0x3000, 0, vma_flags);
 	ASSERT_NE(vma_left, NULL);
 
 	/* 1. Set up new VMA with special flag that would otherwise merge. */
@@ -502,12 +508,14 @@ static bool test_vma_merge_special_flags(void)
 	 *
 	 * This should merge if not for the VM_SPECIAL flag.
 	 */
-	vmg_set_range(&vmg, 0x3000, 0x4000, 3, vm_flags);
+	vmg_set_range(&vmg, 0x3000, 0x4000, 3, vma_flags);
 	for (i = 0; i < ARRAY_SIZE(special_flags); i++) {
-		vm_flags_t special_flag = special_flags[i];
+		vma_flag_t special_flag = special_flags[i];
+		vma_flags_t flags = vma_flags;
 
-		vm_flags_reset(vma_left, vm_flags | special_flag);
-		vmg.vm_flags = vm_flags | special_flag;
+		vma_flags_set(&flags, special_flag);
+		vma_left->flags = flags;
+		vmg.vma_flags = flags;
 		vma = merge_new(&vmg);
 		ASSERT_EQ(vma, NULL);
 		ASSERT_EQ(vmg.state, VMA_MERGE_NOMERGE);
@@ -521,15 +529,17 @@ static bool test_vma_merge_special_flags(void)
 	 *
 	 * Create a VMA to modify.
 	 */
-	vma = alloc_and_link_vma(&mm, 0x3000, 0x4000, 3, vm_flags);
+	vma = alloc_and_link_vma(&mm, 0x3000, 0x4000, 3, vma_flags);
 	ASSERT_NE(vma, NULL);
 	vmg.middle = vma;
 
 	for (i = 0; i < ARRAY_SIZE(special_flags); i++) {
-		vm_flags_t special_flag = special_flags[i];
+		vma_flag_t special_flag = special_flags[i];
+		vma_flags_t flags = vma_flags;
 
-		vm_flags_reset(vma_left, vm_flags | special_flag);
-		vmg.vm_flags = vm_flags | special_flag;
+		vma_flags_set(&flags, special_flag);
+		vma_left->flags = flags;
+		vmg.vma_flags = flags;
 		vma = merge_existing(&vmg);
 		ASSERT_EQ(vma, NULL);
 		ASSERT_EQ(vmg.state, VMA_MERGE_NOMERGE);
@@ -541,7 +551,8 @@ static bool test_vma_merge_special_flags(void)
 
 static bool test_vma_merge_with_close(void)
 {
-	vm_flags_t vm_flags = VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE;
+	vma_flags_t vma_flags = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT,
+					     VMA_MAYREAD_BIT, VMA_MAYWRITE_BIT);
 	struct mm_struct mm = {};
 	VMA_ITERATOR(vmi, &mm, 0);
 	struct vma_merge_struct vmg = {
@@ -621,11 +632,11 @@ static bool test_vma_merge_with_close(void)
 	 * PPPPPPNNN
 	 */
 
-	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, vm_flags);
-	vma_next = alloc_and_link_vma(&mm, 0x5000, 0x9000, 5, vm_flags);
+	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, vma_flags);
+	vma_next = alloc_and_link_vma(&mm, 0x5000, 0x9000, 5, vma_flags);
 	vma_next->vm_ops = &vm_ops;
 
-	vmg_set_range(&vmg, 0x3000, 0x5000, 3, vm_flags);
+	vmg_set_range(&vmg, 0x3000, 0x5000, 3, vma_flags);
 	ASSERT_EQ(merge_new(&vmg), vma_prev);
 	ASSERT_EQ(vmg.state, VMA_MERGE_SUCCESS);
 	ASSERT_EQ(vma_prev->vm_start, 0);
@@ -646,11 +657,11 @@ static bool test_vma_merge_with_close(void)
 	 * proceed.
 	 */
 
-	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, vm_flags);
-	vma = alloc_and_link_vma(&mm, 0x3000, 0x5000, 3, vm_flags);
+	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, vma_flags);
+	vma = alloc_and_link_vma(&mm, 0x3000, 0x5000, 3, vma_flags);
 	vma->vm_ops = &vm_ops;
 
-	vmg_set_range(&vmg, 0x3000, 0x5000, 3, vm_flags);
+	vmg_set_range(&vmg, 0x3000, 0x5000, 3, vma_flags);
 	vmg.prev = vma_prev;
 	vmg.middle = vma;
 
@@ -674,11 +685,11 @@ static bool test_vma_merge_with_close(void)
 	 * proceed.
 	 */
 
-	vma = alloc_and_link_vma(&mm, 0x3000, 0x5000, 3, vm_flags);
-	vma_next = alloc_and_link_vma(&mm, 0x5000, 0x9000, 5, vm_flags);
+	vma = alloc_and_link_vma(&mm, 0x3000, 0x5000, 3, vma_flags);
+	vma_next = alloc_and_link_vma(&mm, 0x5000, 0x9000, 5, vma_flags);
 	vma->vm_ops = &vm_ops;
 
-	vmg_set_range(&vmg, 0x3000, 0x5000, 3, vm_flags);
+	vmg_set_range(&vmg, 0x3000, 0x5000, 3, vma_flags);
 	vmg.middle = vma;
 	ASSERT_EQ(merge_existing(&vmg), NULL);
 	/*
@@ -702,12 +713,12 @@ static bool test_vma_merge_with_close(void)
 	 * PPPVVNNNN
 	 */
 
-	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, vm_flags);
-	vma = alloc_and_link_vma(&mm, 0x3000, 0x5000, 3, vm_flags);
-	vma_next = alloc_and_link_vma(&mm, 0x5000, 0x9000, 5, vm_flags);
+	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, vma_flags);
+	vma = alloc_and_link_vma(&mm, 0x3000, 0x5000, 3, vma_flags);
+	vma_next = alloc_and_link_vma(&mm, 0x5000, 0x9000, 5, vma_flags);
 	vma->vm_ops = &vm_ops;
 
-	vmg_set_range(&vmg, 0x3000, 0x5000, 3, vm_flags);
+	vmg_set_range(&vmg, 0x3000, 0x5000, 3, vma_flags);
 	vmg.prev = vma_prev;
 	vmg.middle = vma;
 
@@ -728,12 +739,12 @@ static bool test_vma_merge_with_close(void)
 	 * PPPPPNNNN
 	 */
 
-	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, vm_flags);
-	vma = alloc_and_link_vma(&mm, 0x3000, 0x5000, 3, vm_flags);
-	vma_next = alloc_and_link_vma(&mm, 0x5000, 0x9000, 5, vm_flags);
+	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, vma_flags);
+	vma = alloc_and_link_vma(&mm, 0x3000, 0x5000, 3, vma_flags);
+	vma_next = alloc_and_link_vma(&mm, 0x5000, 0x9000, 5, vma_flags);
 	vma_next->vm_ops = &vm_ops;
 
-	vmg_set_range(&vmg, 0x3000, 0x5000, 3, vm_flags);
+	vmg_set_range(&vmg, 0x3000, 0x5000, 3, vma_flags);
 	vmg.prev = vma_prev;
 	vmg.middle = vma;
 
@@ -750,15 +761,16 @@ static bool test_vma_merge_with_close(void)
 
 static bool test_vma_merge_new_with_close(void)
 {
-	vm_flags_t vm_flags = VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE;
+	vma_flags_t vma_flags = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT,
+					     VMA_MAYREAD_BIT, VMA_MAYWRITE_BIT);
 	struct mm_struct mm = {};
 	VMA_ITERATOR(vmi, &mm, 0);
 	struct vma_merge_struct vmg = {
 		.mm = &mm,
 		.vmi = &vmi,
 	};
-	struct vm_area_struct *vma_prev = alloc_and_link_vma(&mm, 0, 0x2000, 0, vm_flags);
-	struct vm_area_struct *vma_next = alloc_and_link_vma(&mm, 0x5000, 0x7000, 5, vm_flags);
+	struct vm_area_struct *vma_prev = alloc_and_link_vma(&mm, 0, 0x2000, 0, vma_flags);
+	struct vm_area_struct *vma_next = alloc_and_link_vma(&mm, 0x5000, 0x7000, 5, vma_flags);
 	const struct vm_operations_struct vm_ops = {
 		.close = dummy_close,
 	};
@@ -788,7 +800,7 @@ static bool test_vma_merge_new_with_close(void)
 	vma_prev->vm_ops = &vm_ops;
 	vma_next->vm_ops = &vm_ops;
 
-	vmg_set_range(&vmg, 0x2000, 0x5000, 2, vm_flags);
+	vmg_set_range(&vmg, 0x2000, 0x5000, 2, vma_flags);
 	vma = merge_new(&vmg);
 	ASSERT_NE(vma, NULL);
 	ASSERT_EQ(vmg.state, VMA_MERGE_SUCCESS);
@@ -805,9 +817,10 @@ static bool test_vma_merge_new_with_close(void)
 
 static bool __test_merge_existing(bool prev_is_sticky, bool middle_is_sticky, bool next_is_sticky)
 {
-	vm_flags_t vm_flags = VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE;
-	vm_flags_t prev_flags = vm_flags;
-	vm_flags_t next_flags = vm_flags;
+	vma_flags_t vma_flags = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT,
+					     VMA_MAYREAD_BIT, VMA_MAYWRITE_BIT);
+	vma_flags_t prev_flags = vma_flags;
+	vma_flags_t next_flags = vma_flags;
 	struct mm_struct mm = {};
 	VMA_ITERATOR(vmi, &mm, 0);
 	struct vm_area_struct *vma, *vma_prev, *vma_next;
@@ -821,11 +834,11 @@ static bool __test_merge_existing(bool prev_is_sticky, bool middle_is_sticky, bo
 	struct anon_vma_chain avc = {};
 
 	if (prev_is_sticky)
-		prev_flags |= VM_STICKY;
+		vma_flags_set_mask(&prev_flags, VMA_STICKY_FLAGS);
 	if (middle_is_sticky)
-		vm_flags |= VM_STICKY;
+		vma_flags_set_mask(&vma_flags, VMA_STICKY_FLAGS);
 	if (next_is_sticky)
-		next_flags |= VM_STICKY;
+		vma_flags_set_mask(&next_flags, VMA_STICKY_FLAGS);
 
 	/*
 	 * Merge right case - partial span.
@@ -837,11 +850,11 @@ static bool __test_merge_existing(bool prev_is_sticky, bool middle_is_sticky, bo
 	 * 0123456789
 	 *   VNNNNNN
 	 */
-	vma = alloc_and_link_vma(&mm, 0x2000, 0x6000, 2, vm_flags);
+	vma = alloc_and_link_vma(&mm, 0x2000, 0x6000, 2, vma_flags);
 	vma->vm_ops = &vm_ops; /* This should have no impact. */
 	vma_next = alloc_and_link_vma(&mm, 0x6000, 0x9000, 6, next_flags);
 	vma_next->vm_ops = &vm_ops; /* This should have no impact. */
-	vmg_set_range_anon_vma(&vmg, 0x3000, 0x6000, 3, vm_flags, &dummy_anon_vma);
+	vmg_set_range_anon_vma(&vmg, 0x3000, 0x6000, 3, vma_flags, &dummy_anon_vma);
 	vmg.middle = vma;
 	vmg.prev = vma;
 	vma_set_dummy_anon_vma(vma, &avc);
@@ -858,7 +871,7 @@ static bool __test_merge_existing(bool prev_is_sticky, bool middle_is_sticky, bo
 	ASSERT_TRUE(vma_write_started(vma_next));
 	ASSERT_EQ(mm.map_count, 2);
 	if (middle_is_sticky || next_is_sticky)
-		ASSERT_TRUE(IS_SET(vma_next->vm_flags, VM_STICKY));
+		ASSERT_TRUE(vma_flags_test_any_mask(&vma_next->flags, VMA_STICKY_FLAGS));
 
 	/* Clear down and reset. */
 	ASSERT_EQ(cleanup_mm(&mm, &vmi), 2);
@@ -873,10 +886,10 @@ static bool __test_merge_existing(bool prev_is_sticky, bool middle_is_sticky, bo
 	 * 0123456789
 	 *   NNNNNNN
 	 */
-	vma = alloc_and_link_vma(&mm, 0x2000, 0x6000, 2, vm_flags);
+	vma = alloc_and_link_vma(&mm, 0x2000, 0x6000, 2, vma_flags);
 	vma_next = alloc_and_link_vma(&mm, 0x6000, 0x9000, 6, next_flags);
 	vma_next->vm_ops = &vm_ops; /* This should have no impact. */
-	vmg_set_range_anon_vma(&vmg, 0x2000, 0x6000, 2, vm_flags, &dummy_anon_vma);
+	vmg_set_range_anon_vma(&vmg, 0x2000, 0x6000, 2, vma_flags, &dummy_anon_vma);
 	vmg.middle = vma;
 	vma_set_dummy_anon_vma(vma, &avc);
 	ASSERT_EQ(merge_existing(&vmg), vma_next);
@@ -888,7 +901,7 @@ static bool __test_merge_existing(bool prev_is_sticky, bool middle_is_sticky, bo
 	ASSERT_TRUE(vma_write_started(vma_next));
 	ASSERT_EQ(mm.map_count, 1);
 	if (middle_is_sticky || next_is_sticky)
-		ASSERT_TRUE(IS_SET(vma_next->vm_flags, VM_STICKY));
+		ASSERT_TRUE(vma_flags_test_any_mask(&vma_next->flags, VMA_STICKY_FLAGS));
 
 	/* Clear down and reset. We should have deleted vma. */
 	ASSERT_EQ(cleanup_mm(&mm, &vmi), 1);
@@ -905,9 +918,9 @@ static bool __test_merge_existing(bool prev_is_sticky, bool middle_is_sticky, bo
 	 */
 	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, prev_flags);
 	vma_prev->vm_ops = &vm_ops; /* This should have no impact. */
-	vma = alloc_and_link_vma(&mm, 0x3000, 0x7000, 3, vm_flags);
+	vma = alloc_and_link_vma(&mm, 0x3000, 0x7000, 3, vma_flags);
 	vma->vm_ops = &vm_ops; /* This should have no impact. */
-	vmg_set_range_anon_vma(&vmg, 0x3000, 0x6000, 3, vm_flags, &dummy_anon_vma);
+	vmg_set_range_anon_vma(&vmg, 0x3000, 0x6000, 3, vma_flags, &dummy_anon_vma);
 	vmg.prev = vma_prev;
 	vmg.middle = vma;
 	vma_set_dummy_anon_vma(vma, &avc);
@@ -924,7 +937,7 @@ static bool __test_merge_existing(bool prev_is_sticky, bool middle_is_sticky, bo
 	ASSERT_TRUE(vma_write_started(vma));
 	ASSERT_EQ(mm.map_count, 2);
 	if (prev_is_sticky || middle_is_sticky)
-		ASSERT_TRUE(IS_SET(vma_prev->vm_flags, VM_STICKY));
+		ASSERT_TRUE(vma_flags_test_any_mask(&vma_prev->flags, VMA_STICKY_FLAGS));
 
 	/* Clear down and reset. */
 	ASSERT_EQ(cleanup_mm(&mm, &vmi), 2);
@@ -941,8 +954,8 @@ static bool __test_merge_existing(bool prev_is_sticky, bool middle_is_sticky, bo
 	 */
 	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, prev_flags);
 	vma_prev->vm_ops = &vm_ops; /* This should have no impact. */
-	vma = alloc_and_link_vma(&mm, 0x3000, 0x7000, 3, vm_flags);
-	vmg_set_range_anon_vma(&vmg, 0x3000, 0x7000, 3, vm_flags, &dummy_anon_vma);
+	vma = alloc_and_link_vma(&mm, 0x3000, 0x7000, 3, vma_flags);
+	vmg_set_range_anon_vma(&vmg, 0x3000, 0x7000, 3, vma_flags, &dummy_anon_vma);
 	vmg.prev = vma_prev;
 	vmg.middle = vma;
 	vma_set_dummy_anon_vma(vma, &avc);
@@ -955,7 +968,7 @@ static bool __test_merge_existing(bool prev_is_sticky, bool middle_is_sticky, bo
 	ASSERT_TRUE(vma_write_started(vma_prev));
 	ASSERT_EQ(mm.map_count, 1);
 	if (prev_is_sticky || middle_is_sticky)
-		ASSERT_TRUE(IS_SET(vma_prev->vm_flags, VM_STICKY));
+		ASSERT_TRUE(vma_flags_test_any_mask(&vma_prev->flags, VMA_STICKY_FLAGS));
 
 	/* Clear down and reset. We should have deleted vma. */
 	ASSERT_EQ(cleanup_mm(&mm, &vmi), 1);
@@ -972,9 +985,9 @@ static bool __test_merge_existing(bool prev_is_sticky, bool middle_is_sticky, bo
 	 */
 	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, prev_flags);
 	vma_prev->vm_ops = &vm_ops; /* This should have no impact. */
-	vma = alloc_and_link_vma(&mm, 0x3000, 0x7000, 3, vm_flags);
+	vma = alloc_and_link_vma(&mm, 0x3000, 0x7000, 3, vma_flags);
 	vma_next = alloc_and_link_vma(&mm, 0x7000, 0x9000, 7, next_flags);
-	vmg_set_range_anon_vma(&vmg, 0x3000, 0x7000, 3, vm_flags, &dummy_anon_vma);
+	vmg_set_range_anon_vma(&vmg, 0x3000, 0x7000, 3, vma_flags, &dummy_anon_vma);
 	vmg.prev = vma_prev;
 	vmg.middle = vma;
 	vma_set_dummy_anon_vma(vma, &avc);
@@ -987,7 +1000,7 @@ static bool __test_merge_existing(bool prev_is_sticky, bool middle_is_sticky, bo
 	ASSERT_TRUE(vma_write_started(vma_prev));
 	ASSERT_EQ(mm.map_count, 1);
 	if (prev_is_sticky || middle_is_sticky || next_is_sticky)
-		ASSERT_TRUE(IS_SET(vma_prev->vm_flags, VM_STICKY));
+		ASSERT_TRUE(vma_flags_test_any_mask(&vma_prev->flags, VMA_STICKY_FLAGS));
 
 	/* Clear down and reset. We should have deleted prev and next. */
 	ASSERT_EQ(cleanup_mm(&mm, &vmi), 1);
@@ -1008,40 +1021,40 @@ static bool __test_merge_existing(bool prev_is_sticky, bool middle_is_sticky, bo
 	 */
 
 	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, prev_flags);
-	vma = alloc_and_link_vma(&mm, 0x3000, 0x8000, 3, vm_flags);
+	vma = alloc_and_link_vma(&mm, 0x3000, 0x8000, 3, vma_flags);
 	vma_next = alloc_and_link_vma(&mm, 0x8000, 0xa000, 8, next_flags);
 
-	vmg_set_range(&vmg, 0x4000, 0x5000, 4, vm_flags);
+	vmg_set_range(&vmg, 0x4000, 0x5000, 4, vma_flags);
 	vmg.prev = vma;
 	vmg.middle = vma;
 	ASSERT_EQ(merge_existing(&vmg), NULL);
 	ASSERT_EQ(vmg.state, VMA_MERGE_NOMERGE);
 
-	vmg_set_range(&vmg, 0x5000, 0x6000, 5, vm_flags);
+	vmg_set_range(&vmg, 0x5000, 0x6000, 5, vma_flags);
 	vmg.prev = vma;
 	vmg.middle = vma;
 	ASSERT_EQ(merge_existing(&vmg), NULL);
 	ASSERT_EQ(vmg.state, VMA_MERGE_NOMERGE);
 
-	vmg_set_range(&vmg, 0x6000, 0x7000, 6, vm_flags);
+	vmg_set_range(&vmg, 0x6000, 0x7000, 6, vma_flags);
 	vmg.prev = vma;
 	vmg.middle = vma;
 	ASSERT_EQ(merge_existing(&vmg), NULL);
 	ASSERT_EQ(vmg.state, VMA_MERGE_NOMERGE);
 
-	vmg_set_range(&vmg, 0x4000, 0x7000, 4, vm_flags);
+	vmg_set_range(&vmg, 0x4000, 0x7000, 4, vma_flags);
 	vmg.prev = vma;
 	vmg.middle = vma;
 	ASSERT_EQ(merge_existing(&vmg), NULL);
 	ASSERT_EQ(vmg.state, VMA_MERGE_NOMERGE);
 
-	vmg_set_range(&vmg, 0x4000, 0x6000, 4, vm_flags);
+	vmg_set_range(&vmg, 0x4000, 0x6000, 4, vma_flags);
 	vmg.prev = vma;
 	vmg.middle = vma;
 	ASSERT_EQ(merge_existing(&vmg), NULL);
 	ASSERT_EQ(vmg.state, VMA_MERGE_NOMERGE);
 
-	vmg_set_range(&vmg, 0x5000, 0x6000, 5, vm_flags);
+	vmg_set_range(&vmg, 0x5000, 0x6000, 5, vma_flags);
 	vmg.prev = vma;
 	vmg.middle = vma;
 	ASSERT_EQ(merge_existing(&vmg), NULL);
@@ -1067,7 +1080,8 @@ static bool test_merge_existing(void)
 
 static bool test_anon_vma_non_mergeable(void)
 {
-	vm_flags_t vm_flags = VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE;
+	vma_flags_t vma_flags = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT,
+					     VMA_MAYREAD_BIT, VMA_MAYWRITE_BIT);
 	struct mm_struct mm = {};
 	VMA_ITERATOR(vmi, &mm, 0);
 	struct vm_area_struct *vma, *vma_prev, *vma_next;
@@ -1091,9 +1105,9 @@ static bool test_anon_vma_non_mergeable(void)
 	 * 0123456789
 	 * PPPPPPPNNN
 	 */
-	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, vm_flags);
-	vma = alloc_and_link_vma(&mm, 0x3000, 0x7000, 3, vm_flags);
-	vma_next = alloc_and_link_vma(&mm, 0x7000, 0x9000, 7, vm_flags);
+	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, vma_flags);
+	vma = alloc_and_link_vma(&mm, 0x3000, 0x7000, 3, vma_flags);
+	vma_next = alloc_and_link_vma(&mm, 0x7000, 0x9000, 7, vma_flags);
 
 	/*
 	 * Give both prev and next single anon_vma_chain fields, so they will
@@ -1101,7 +1115,7 @@ static bool test_anon_vma_non_mergeable(void)
 	 *
 	 * However, when prev is compared to next, the merge should fail.
 	 */
-	vmg_set_range_anon_vma(&vmg, 0x3000, 0x7000, 3, vm_flags, NULL);
+	vmg_set_range_anon_vma(&vmg, 0x3000, 0x7000, 3, vma_flags, NULL);
 	vmg.prev = vma_prev;
 	vmg.middle = vma;
 	vma_set_dummy_anon_vma(vma_prev, &dummy_anon_vma_chain_1);
@@ -1129,10 +1143,10 @@ static bool test_anon_vma_non_mergeable(void)
 	 * 0123456789
 	 * PPPPPPPNNN
 	 */
-	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, vm_flags);
-	vma_next = alloc_and_link_vma(&mm, 0x7000, 0x9000, 7, vm_flags);
+	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, vma_flags);
+	vma_next = alloc_and_link_vma(&mm, 0x7000, 0x9000, 7, vma_flags);
 
-	vmg_set_range_anon_vma(&vmg, 0x3000, 0x7000, 3, vm_flags, NULL);
+	vmg_set_range_anon_vma(&vmg, 0x3000, 0x7000, 3, vma_flags, NULL);
 	vmg.prev = vma_prev;
 	vma_set_dummy_anon_vma(vma_prev, &dummy_anon_vma_chain_1);
 	__vma_set_dummy_anon_vma(vma_next, &dummy_anon_vma_chain_2, &dummy_anon_vma_2);
@@ -1154,7 +1168,8 @@ static bool test_anon_vma_non_mergeable(void)
 
 static bool test_dup_anon_vma(void)
 {
-	vm_flags_t vm_flags = VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE;
+	vma_flags_t vma_flags = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT,
+					     VMA_MAYREAD_BIT, VMA_MAYWRITE_BIT);
 	struct mm_struct mm = {};
 	VMA_ITERATOR(vmi, &mm, 0);
 	struct vma_merge_struct vmg = {
@@ -1175,11 +1190,11 @@ static bool test_dup_anon_vma(void)
 	 * This covers new VMA merging, as these operations amount to a VMA
 	 * expand.
 	 */
-	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, vm_flags);
-	vma_next = alloc_and_link_vma(&mm, 0x3000, 0x5000, 3, vm_flags);
+	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, vma_flags);
+	vma_next = alloc_and_link_vma(&mm, 0x3000, 0x5000, 3, vma_flags);
 	vma_next->anon_vma = &dummy_anon_vma;
 
-	vmg_set_range(&vmg, 0, 0x5000, 0, vm_flags);
+	vmg_set_range(&vmg, 0, 0x5000, 0, vma_flags);
 	vmg.target = vma_prev;
 	vmg.next = vma_next;
 
@@ -1201,16 +1216,16 @@ static bool test_dup_anon_vma(void)
 	 *  extend   delete  delete
 	 */
 
-	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, vm_flags);
-	vma = alloc_and_link_vma(&mm, 0x3000, 0x5000, 3, vm_flags);
-	vma_next = alloc_and_link_vma(&mm, 0x5000, 0x8000, 5, vm_flags);
+	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, vma_flags);
+	vma = alloc_and_link_vma(&mm, 0x3000, 0x5000, 3, vma_flags);
+	vma_next = alloc_and_link_vma(&mm, 0x5000, 0x8000, 5, vma_flags);
 
 	/* Initialise avc so mergeability check passes. */
 	INIT_LIST_HEAD(&vma_next->anon_vma_chain);
 	list_add(&dummy_anon_vma_chain.same_vma, &vma_next->anon_vma_chain);
 
 	vma_next->anon_vma = &dummy_anon_vma;
-	vmg_set_range(&vmg, 0x3000, 0x5000, 3, vm_flags);
+	vmg_set_range(&vmg, 0x3000, 0x5000, 3, vma_flags);
 	vmg.prev = vma_prev;
 	vmg.middle = vma;
 
@@ -1234,12 +1249,12 @@ static bool test_dup_anon_vma(void)
 	 *  extend   delete  delete
 	 */
 
-	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, vm_flags);
-	vma = alloc_and_link_vma(&mm, 0x3000, 0x5000, 3, vm_flags);
-	vma_next = alloc_and_link_vma(&mm, 0x5000, 0x8000, 5, vm_flags);
+	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, vma_flags);
+	vma = alloc_and_link_vma(&mm, 0x3000, 0x5000, 3, vma_flags);
+	vma_next = alloc_and_link_vma(&mm, 0x5000, 0x8000, 5, vma_flags);
 	vmg.anon_vma = &dummy_anon_vma;
 	vma_set_dummy_anon_vma(vma, &dummy_anon_vma_chain);
-	vmg_set_range(&vmg, 0x3000, 0x5000, 3, vm_flags);
+	vmg_set_range(&vmg, 0x3000, 0x5000, 3, vma_flags);
 	vmg.prev = vma_prev;
 	vmg.middle = vma;
 
@@ -1263,11 +1278,11 @@ static bool test_dup_anon_vma(void)
 	 *  extend shrink/delete
 	 */
 
-	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, vm_flags);
-	vma = alloc_and_link_vma(&mm, 0x3000, 0x8000, 3, vm_flags);
+	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, vma_flags);
+	vma = alloc_and_link_vma(&mm, 0x3000, 0x8000, 3, vma_flags);
 
 	vma_set_dummy_anon_vma(vma, &dummy_anon_vma_chain);
-	vmg_set_range(&vmg, 0x3000, 0x5000, 3, vm_flags);
+	vmg_set_range(&vmg, 0x3000, 0x5000, 3, vma_flags);
 	vmg.prev = vma_prev;
 	vmg.middle = vma;
 
@@ -1291,11 +1306,11 @@ static bool test_dup_anon_vma(void)
 	 * shrink/delete extend
 	 */
 
-	vma = alloc_and_link_vma(&mm, 0, 0x5000, 0, vm_flags);
-	vma_next = alloc_and_link_vma(&mm, 0x5000, 0x8000, 5, vm_flags);
+	vma = alloc_and_link_vma(&mm, 0, 0x5000, 0, vma_flags);
+	vma_next = alloc_and_link_vma(&mm, 0x5000, 0x8000, 5, vma_flags);
 
 	vma_set_dummy_anon_vma(vma, &dummy_anon_vma_chain);
-	vmg_set_range(&vmg, 0x3000, 0x5000, 3, vm_flags);
+	vmg_set_range(&vmg, 0x3000, 0x5000, 3, vma_flags);
 	vmg.prev = vma;
 	vmg.middle = vma;
 
@@ -1314,7 +1329,8 @@ static bool test_dup_anon_vma(void)
 
 static bool test_vmi_prealloc_fail(void)
 {
-	vm_flags_t vm_flags = VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE;
+	vma_flags_t vma_flags = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT,
+					     VMA_MAYREAD_BIT, VMA_MAYWRITE_BIT);
 	struct mm_struct mm = {};
 	VMA_ITERATOR(vmi, &mm, 0);
 	struct vma_merge_struct vmg = {
@@ -1330,11 +1346,11 @@ static bool test_vmi_prealloc_fail(void)
 	 * the duplicated anon_vma is unlinked.
 	 */
 
-	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, vm_flags);
-	vma = alloc_and_link_vma(&mm, 0x3000, 0x5000, 3, vm_flags);
+	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, vma_flags);
+	vma = alloc_and_link_vma(&mm, 0x3000, 0x5000, 3, vma_flags);
 	vma->anon_vma = &dummy_anon_vma;
 
-	vmg_set_range_anon_vma(&vmg, 0x3000, 0x5000, 3, vm_flags, &dummy_anon_vma);
+	vmg_set_range_anon_vma(&vmg, 0x3000, 0x5000, 3, vma_flags, &dummy_anon_vma);
 	vmg.prev = vma_prev;
 	vmg.middle = vma;
 	vma_set_dummy_anon_vma(vma, &avc);
@@ -1358,11 +1374,11 @@ static bool test_vmi_prealloc_fail(void)
 	 * performed in this case too.
 	 */
 
-	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, vm_flags);
-	vma = alloc_and_link_vma(&mm, 0x3000, 0x5000, 3, vm_flags);
+	vma_prev = alloc_and_link_vma(&mm, 0, 0x3000, 0, vma_flags);
+	vma = alloc_and_link_vma(&mm, 0x3000, 0x5000, 3, vma_flags);
 	vma->anon_vma = &dummy_anon_vma;
 
-	vmg_set_range(&vmg, 0, 0x5000, 3, vm_flags);
+	vmg_set_range(&vmg, 0, 0x5000, 3, vma_flags);
 	vmg.target = vma_prev;
 	vmg.next = vma;
 
@@ -1380,13 +1396,14 @@ static bool test_vmi_prealloc_fail(void)
 
 static bool test_merge_extend(void)
 {
-	vm_flags_t vm_flags = VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE;
+	vma_flags_t vma_flags = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT,
+					     VMA_MAYREAD_BIT, VMA_MAYWRITE_BIT);
 	struct mm_struct mm = {};
 	VMA_ITERATOR(vmi, &mm, 0x1000);
 	struct vm_area_struct *vma;
 
-	vma = alloc_and_link_vma(&mm, 0, 0x1000, 0, vm_flags);
-	alloc_and_link_vma(&mm, 0x3000, 0x4000, 3, vm_flags);
+	vma = alloc_and_link_vma(&mm, 0, 0x1000, 0, vma_flags);
+	alloc_and_link_vma(&mm, 0x3000, 0x4000, 3, vma_flags);
 
 	/*
 	 * Extend a VMA into the gap between itself and the following VMA.
@@ -1410,11 +1427,13 @@ static bool test_merge_extend(void)
 
 static bool test_expand_only_mode(void)
 {
-	vm_flags_t vm_flags = VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE;
+	vma_flags_t vma_flags = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT,
+					     VMA_MAYREAD_BIT, VMA_MAYWRITE_BIT);
+	vm_flags_t legacy_flags = VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE;
 	struct mm_struct mm = {};
 	VMA_ITERATOR(vmi, &mm, 0);
 	struct vm_area_struct *vma_prev, *vma;
-	VMG_STATE(vmg, &mm, &vmi, 0x5000, 0x9000, vm_flags, 5);
+	VMG_STATE(vmg, &mm, &vmi, 0x5000, 0x9000, legacy_flags, 5);
 
 	/*
 	 * Place a VMA prior to the one we're expanding so we assert that we do
@@ -1422,14 +1441,14 @@ static bool test_expand_only_mode(void)
 	 * have, through the use of the just_expand flag, indicated we do not
 	 * need to do so.
 	 */
-	alloc_and_link_vma(&mm, 0, 0x2000, 0, vm_flags);
+	alloc_and_link_vma(&mm, 0, 0x2000, 0, vma_flags);
 
 	/*
 	 * We will be positioned at the prev VMA, but looking to expand to
 	 * 0x9000.
 	 */
 	vma_iter_set(&vmi, 0x3000);
-	vma_prev = alloc_and_link_vma(&mm, 0x3000, 0x5000, 3, vm_flags);
+	vma_prev = alloc_and_link_vma(&mm, 0x3000, 0x5000, 3, vma_flags);
 	vmg.prev = vma_prev;
 	vmg.just_expand = true;
 
diff --git a/tools/testing/vma/tests/vma.c b/tools/testing/vma/tests/vma.c
index 4a7b11a8a285..b2f068c3d6d0 100644
--- a/tools/testing/vma/tests/vma.c
+++ b/tools/testing/vma/tests/vma.c
@@ -22,7 +22,8 @@ static bool compare_legacy_flags(vm_flags_t legacy_flags, vma_flags_t flags)
 
 static bool test_copy_vma(void)
 {
-	vm_flags_t vm_flags = VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE;
+	vma_flags_t vma_flags = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT,
+					     VMA_MAYREAD_BIT, VMA_MAYWRITE_BIT);
 	struct mm_struct mm = {};
 	bool need_locks = false;
 	VMA_ITERATOR(vmi, &mm, 0);
@@ -30,7 +31,7 @@ static bool test_copy_vma(void)
 
 	/* Move backwards and do not merge. */
 
-	vma = alloc_and_link_vma(&mm, 0x3000, 0x5000, 3, vm_flags);
+	vma = alloc_and_link_vma(&mm, 0x3000, 0x5000, 3, vma_flags);
 	vma_new = copy_vma(&vma, 0, 0x2000, 0, &need_locks);
 	ASSERT_NE(vma_new, vma);
 	ASSERT_EQ(vma_new->vm_start, 0);
@@ -42,8 +43,8 @@ static bool test_copy_vma(void)
 
 	/* Move a VMA into position next to another and merge the two. */
 
-	vma = alloc_and_link_vma(&mm, 0, 0x2000, 0, vm_flags);
-	vma_next = alloc_and_link_vma(&mm, 0x6000, 0x8000, 6, vm_flags);
+	vma = alloc_and_link_vma(&mm, 0, 0x2000, 0, vma_flags);
+	vma_next = alloc_and_link_vma(&mm, 0x6000, 0x8000, 6, vma_flags);
 	vma_new = copy_vma(&vma, 0x4000, 0x2000, 4, &need_locks);
 	vma_assert_attached(vma_new);
 
@@ -61,7 +62,6 @@ static bool test_vma_flags_unchanged(void)
 	struct vm_area_struct vma;
 	struct vm_area_desc desc;
 
-
 	vma.flags = EMPTY_VMA_FLAGS;
 	desc.vma_flags = EMPTY_VMA_FLAGS;
 
-- 
2.53.0


