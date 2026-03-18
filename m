Return-Path: <linux-mips+bounces-13758-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOHcEPXMummfcAIAu9opvQ
	(envelope-from <linux-mips+bounces-13758-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 17:04:05 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EE81A2BEEBF
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 17:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC3A931CA57B
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 15:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29F83E95AC;
	Wed, 18 Mar 2026 15:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6C+93Xf"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A093E714B;
	Wed, 18 Mar 2026 15:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849055; cv=none; b=LSXE4hokSnyIkVJDUm+K9WDxYIjF/yr39MbvZR58ywv0qHHd0DoKDoLq2Rn1+qW9QwjI5U+P/8PVD0DpQvlNs2dITAhsZP4x7iJRUL3Lz1Xg2tLwSwVzis4YQrsk1aGHki0dD9XlqOJ4rgYLpC6W9PV4faA3G9S6YfZsH61cmwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849055; c=relaxed/simple;
	bh=eD2PnbzvQlV2K2S2SOWT7iMdlTUiHa06R4kQ29f3pyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l0wClMF9jl5U575K/+5wljBoUdx/II9nHM2u92ZV9Lqn9itPU96Lh4y3ii5lBpJQ23svKqJ2CrvxoKwasMMs9yxYwfng7hvAr7IcBPcFjG62TqoaTAigBbUA5sUykmpFAFuV05tCSllBE/Wm//3u3ayaOr3EzNdmbMiJ+og5XGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6C+93Xf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE06BC2BC87;
	Wed, 18 Mar 2026 15:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773849054;
	bh=eD2PnbzvQlV2K2S2SOWT7iMdlTUiHa06R4kQ29f3pyc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f6C+93XfxcDT+r9pjyaYB5FCfdHK3AASHSN6qyIReV07WIbF+de/1T2eZE4mYwF0v
	 96N+rTUNTS6/ZPFHIvLK9jAk8HTO2DXqzm3utYA8zJ0WQ9fvLB8n5nHxFi2PmRWDQ7
	 H0LEIawEs70XJGyrBpuzA1Xu8mUtTbVtanZCBh1PBkTtBZ8BYKVaqI6b+lpLkc2/iT
	 RxSn3Axgp7sdY1bXBvxifYc/fmq+tDCxN3zIqULjQ0XCxgmSyDael0+9BOsNNasHpX
	 gDSdEIBqRsE6fUuFggR3Hngd7H8DLlmoOy7icBJu1wNY9zwoDJ0rjJ/u4RwSs/9rbz
	 YnXgU+Dl/RIpQ==
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
Subject: [PATCH v3 05/23] mm/vma: use new VMA flags for sticky flags logic
Date: Wed, 18 Mar 2026 15:50:16 +0000
Message-ID: <fd4276d39055290061f87e9fded20b6a6b712975.1773846935.git.ljs@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oracle.com,google.com,suse.de,kvack.org,vger.kernel.org,armlinux.org.uk,arm.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,nod.at,cambridgegreys.com,sipsolutions.net,zeniv.linux.org.uk,suse.cz,zte.com.cn,linux.dev,suse.com,paul-moore.com,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13758-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_GT_50(0.00)[62];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-0.965];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EE81A2BEEBF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use the new vma_flags_t flags implementation to perform the logic around
sticky flags and what flags are ignored on VMA merge.

We make use of the new vma_flags_empty(), vma_flags_diff_pair(), and
vma_flags_and_mask() functionality.

Also update the VMA tests accordingly.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 include/linux/mm.h                 | 32 ++++++++++++--------
 mm/vma.c                           | 48 ++++++++++++++++++++++--------
 tools/testing/vma/include/custom.h |  5 ----
 tools/testing/vma/include/dup.h    |  9 ++++--
 4 files changed, 62 insertions(+), 32 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 6d2c4bd2c61d..b75e089dfd65 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -540,6 +540,7 @@ enum {
 
 /* VMA basic access permission flags */
 #define VM_ACCESS_FLAGS (VM_READ | VM_WRITE | VM_EXEC)
+#define VMA_ACCESS_FLAGS mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT, VMA_EXEC_BIT)
 
 /*
  * Special vmas that are non-mergable, non-mlock()able.
@@ -585,27 +586,32 @@ enum {
  * possesses it but the other does not, the merged VMA should nonetheless have
  * applied to it:
  *
- *   VM_SOFTDIRTY - if a VMA is marked soft-dirty, that is has not had its
- *                  references cleared via /proc/$pid/clear_refs, any merged VMA
- *                  should be considered soft-dirty also as it operates at a VMA
- *                  granularity.
+ *   VMA_SOFTDIRTY_BIT - if a VMA is marked soft-dirty, that is has not had its
+ *                       references cleared via /proc/$pid/clear_refs, any
+ *                       merged VMA should be considered soft-dirty also as it
+ *                       operates at a VMA granularity.
  *
- * VM_MAYBE_GUARD - If a VMA may have guard regions in place it implies that
- *                  mapped page tables may contain metadata not described by the
- *                  VMA and thus any merged VMA may also contain this metadata,
- *                  and thus we must make this flag sticky.
+ * VMA_MAYBE_GUARD_BIT - If a VMA may have guard regions in place it implies
+ *                       that mapped page tables may contain metadata not
+ *                       described by the VMA and thus any merged VMA may also
+ *                       contain this metadata, and thus we must make this flag
+ *                       sticky.
  */
-#define VM_STICKY (VM_SOFTDIRTY | VM_MAYBE_GUARD)
+#ifdef CONFIG_MEM_SOFT_DIRTY
+#define VMA_STICKY_FLAGS mk_vma_flags(VMA_SOFTDIRTY_BIT, VMA_MAYBE_GUARD_BIT)
+#else
+#define VMA_STICKY_FLAGS mk_vma_flags(VMA_MAYBE_GUARD_BIT)
+#endif
 
 /*
  * VMA flags we ignore for the purposes of merge, i.e. one VMA possessing one
  * of these flags and the other not does not preclude a merge.
  *
- *    VM_STICKY - When merging VMAs, VMA flags must match, unless they are
- *                'sticky'. If any sticky flags exist in either VMA, we simply
- *                set all of them on the merged VMA.
+ *    VMA_STICKY_FLAGS - When merging VMAs, VMA flags must match, unless they
+ *                       are 'sticky'. If any sticky flags exist in either VMA,
+ *                       we simply set all of them on the merged VMA.
  */
-#define VM_IGNORE_MERGE VM_STICKY
+#define VMA_IGNORE_MERGE_FLAGS VMA_STICKY_FLAGS
 
 /*
  * Flags which should result in page tables being copied on fork. These are
diff --git a/mm/vma.c b/mm/vma.c
index 4d21e7d8e93c..6af26619e020 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -86,10 +86,15 @@ static bool vma_is_fork_child(struct vm_area_struct *vma)
 static inline bool is_mergeable_vma(struct vma_merge_struct *vmg, bool merge_next)
 {
 	struct vm_area_struct *vma = merge_next ? vmg->next : vmg->prev;
+	vma_flags_t diff;
 
 	if (!mpol_equal(vmg->policy, vma_policy(vma)))
 		return false;
-	if ((vma->vm_flags ^ vmg->vm_flags) & ~VM_IGNORE_MERGE)
+
+	diff = vma_flags_diff_pair(&vma->flags, &vmg->vma_flags);
+	vma_flags_clear_mask(&diff, VMA_IGNORE_MERGE_FLAGS);
+
+	if (!vma_flags_empty(&diff))
 		return false;
 	if (vma->vm_file != vmg->file)
 		return false;
@@ -805,7 +810,8 @@ static bool can_merge_remove_vma(struct vm_area_struct *vma)
 static __must_check struct vm_area_struct *vma_merge_existing_range(
 		struct vma_merge_struct *vmg)
 {
-	vm_flags_t sticky_flags = vmg->vm_flags & VM_STICKY;
+	vma_flags_t sticky_flags = vma_flags_and_mask(&vmg->vma_flags,
+						      VMA_STICKY_FLAGS);
 	struct vm_area_struct *middle = vmg->middle;
 	struct vm_area_struct *prev = vmg->prev;
 	struct vm_area_struct *next;
@@ -898,15 +904,22 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 	vma_start_write(middle);
 
 	if (merge_right) {
+		vma_flags_t next_sticky;
+
 		vma_start_write(next);
 		vmg->target = next;
-		sticky_flags |= (next->vm_flags & VM_STICKY);
+		next_sticky = vma_flags_and_mask(&next->flags, VMA_STICKY_FLAGS);
+		vma_flags_set_mask(&sticky_flags, next_sticky);
 	}
 
 	if (merge_left) {
+		vma_flags_t prev_sticky;
+
 		vma_start_write(prev);
 		vmg->target = prev;
-		sticky_flags |= (prev->vm_flags & VM_STICKY);
+
+		prev_sticky = vma_flags_and_mask(&prev->flags, VMA_STICKY_FLAGS);
+		vma_flags_set_mask(&sticky_flags, prev_sticky);
 	}
 
 	if (merge_both) {
@@ -976,7 +989,7 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 	if (err || commit_merge(vmg))
 		goto abort;
 
-	vm_flags_set(vmg->target, sticky_flags);
+	vma_set_flags_mask(vmg->target, sticky_flags);
 	khugepaged_enter_vma(vmg->target, vmg->vm_flags);
 	vmg->state = VMA_MERGE_SUCCESS;
 	return vmg->target;
@@ -1154,12 +1167,16 @@ int vma_expand(struct vma_merge_struct *vmg)
 	struct vm_area_struct *target = vmg->target;
 	struct vm_area_struct *next = vmg->next;
 	bool remove_next = false;
-	vm_flags_t sticky_flags;
+	vma_flags_t sticky_flags =
+		vma_flags_and_mask(&vmg->vma_flags, VMA_STICKY_FLAGS);
+	vma_flags_t target_sticky;
 	int ret = 0;
 
 	mmap_assert_write_locked(vmg->mm);
 	vma_start_write(target);
 
+	target_sticky = vma_flags_and_mask(&target->flags, VMA_STICKY_FLAGS);
+
 	if (next && target != next && vmg->end == next->vm_end)
 		remove_next = true;
 
@@ -1174,10 +1191,7 @@ int vma_expand(struct vma_merge_struct *vmg)
 	VM_WARN_ON_VMG(target->vm_start < vmg->start ||
 		       target->vm_end > vmg->end, vmg);
 
-	sticky_flags = vmg->vm_flags & VM_STICKY;
-	sticky_flags |= target->vm_flags & VM_STICKY;
-	if (remove_next)
-		sticky_flags |= next->vm_flags & VM_STICKY;
+	vma_flags_set_mask(&sticky_flags, target_sticky);
 
 	/*
 	 * If we are removing the next VMA or copying from a VMA
@@ -1194,13 +1208,18 @@ int vma_expand(struct vma_merge_struct *vmg)
 		return ret;
 
 	if (remove_next) {
+		vma_flags_t next_sticky;
+
 		vma_start_write(next);
 		vmg->__remove_next = true;
+
+		next_sticky = vma_flags_and_mask(&next->flags, VMA_STICKY_FLAGS);
+		vma_flags_set_mask(&sticky_flags, next_sticky);
 	}
 	if (commit_merge(vmg))
 		goto nomem;
 
-	vm_flags_set(target, sticky_flags);
+	vma_set_flags_mask(target, sticky_flags);
 	return 0;
 
 nomem:
@@ -1950,10 +1969,15 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
  */
 static int anon_vma_compatible(struct vm_area_struct *a, struct vm_area_struct *b)
 {
+	vma_flags_t diff = vma_flags_diff_pair(&a->flags, &b->flags);
+
+	vma_flags_clear_mask(&diff, VMA_ACCESS_FLAGS);
+	vma_flags_clear_mask(&diff, VMA_IGNORE_MERGE_FLAGS);
+
 	return a->vm_end == b->vm_start &&
 		mpol_equal(vma_policy(a), vma_policy(b)) &&
 		a->vm_file == b->vm_file &&
-		!((a->vm_flags ^ b->vm_flags) & ~(VM_ACCESS_FLAGS | VM_IGNORE_MERGE)) &&
+		vma_flags_empty(&diff) &&
 		b->vm_pgoff == a->vm_pgoff + ((b->vm_start - a->vm_start) >> PAGE_SHIFT);
 }
 
diff --git a/tools/testing/vma/include/custom.h b/tools/testing/vma/include/custom.h
index 6200f938e586..7cdd0f60600a 100644
--- a/tools/testing/vma/include/custom.h
+++ b/tools/testing/vma/include/custom.h
@@ -134,8 +134,3 @@ static __always_inline bool vma_flags_same_mask(vma_flags_t *flags,
 	vma_flags_same_mask(flags, mk_vma_flags(__VA_ARGS__))
 #define VMA_SPECIAL_FLAGS mk_vma_flags(VMA_IO_BIT, VMA_DONTEXPAND_BIT, \
 				       VMA_PFNMAP_BIT, VMA_MIXEDMAP_BIT)
-#ifdef CONFIG_MEM_SOFT_DIRTY
-#define VMA_STICKY_FLAGS mk_vma_flags(VMA_SOFTDIRTY_BIT, VMA_MAYBE_GUARD_BIT)
-#else
-#define VMA_STICKY_FLAGS mk_vma_flags(VMA_MAYBE_GUARD_BIT)
-#endif
diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index 1dee78c34872..65134303b645 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -338,6 +338,7 @@ enum {
 
 /* VMA basic access permission flags */
 #define VM_ACCESS_FLAGS (VM_READ | VM_WRITE | VM_EXEC)
+#define VMA_ACCESS_FLAGS mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT, VMA_EXEC_BIT)
 
 /*
  * Special vmas that are non-mergable, non-mlock()able.
@@ -363,9 +364,13 @@ enum {
 
 #define CAP_IPC_LOCK         14
 
-#define VM_STICKY (VM_SOFTDIRTY | VM_MAYBE_GUARD)
+#ifdef CONFIG_MEM_SOFT_DIRTY
+#define VMA_STICKY_FLAGS mk_vma_flags(VMA_SOFTDIRTY_BIT, VMA_MAYBE_GUARD_BIT)
+#else
+#define VMA_STICKY_FLAGS mk_vma_flags(VMA_MAYBE_GUARD_BIT)
+#endif
 
-#define VM_IGNORE_MERGE VM_STICKY
+#define VMA_IGNORE_MERGE_FLAGS VMA_STICKY_FLAGS
 
 #define VM_COPY_ON_FORK (VM_PFNMAP | VM_MIXEDMAP | VM_UFFD_WP | VM_MAYBE_GUARD)
 
-- 
2.53.0


