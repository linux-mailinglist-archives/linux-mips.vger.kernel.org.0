Return-Path: <linux-mips+bounces-13841-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGdhGuqlvWm4/wIAu9opvQ
	(envelope-from <linux-mips+bounces-13841-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 20:54:18 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D437F2E08E4
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 20:54:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3DFF03142819
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 19:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2C23FE342;
	Fri, 20 Mar 2026 19:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GOZcrxua"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5392F3FD14B;
	Fri, 20 Mar 2026 19:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774035580; cv=none; b=FfNniZ3w5utV24HW9frt4Djqqe/NDwZvbfg/DxklPxnoDsCtwDO2b2YDTLfFyXd0KAHWy7GY+e2Icxdbgo5qT4/XnTQrrYbWIWCN9rLRUB4dNziW95jebGKgzwWPazLYZvctLxHL0HmDTsA7CLy8JM7K7ZiArkY5WG1I4GMAz9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774035580; c=relaxed/simple;
	bh=qgURgkUZNOsJmO77nXEy3fs45sa96k/SWUJW+aWQ9/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CVLNjh4Zy0B08UOAM+mc6ydd0J+rAewIpsxJnW/zYMCjvaD2yw/ixPg1p8Zb95aQl+akkAu5FWX371pMxnon/Jp73snzQ7igukKNfyVSB4KQPeSlgXuQ5I0Tb/QhMR+U+eel0qA3Trp526kVQ6RkLhq5VDVuwxNJSmceM4u9ePU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GOZcrxua; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D386C2BCAF;
	Fri, 20 Mar 2026 19:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774035580;
	bh=qgURgkUZNOsJmO77nXEy3fs45sa96k/SWUJW+aWQ9/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GOZcrxuaBBadu3+mSwGnV/iePFHZuUM8J0URBA+6XAWA2jR2BkumSrgsaTigAHaz6
	 tCmjOqIhwjqSjkdRd0UmrLY7HxEkZObpwDw9FXcZW3fc+WBUBs8wOo6o6BaJ3trf/F
	 vdJnWj75Dx45BvNTTihekzEKePEjrdH1KX7xgW+d2h3fnaB4XX8t0lPR+xzmNSqUaF
	 dbrg/DntIzq11iAu2avhbJ/45lJemd6PenyzAKZ2uSt/Z4LtOEPpjXebbnIUi0O1ut
	 Kzg1f52yrycr8jWrAux+BPOpZvm6Wip1Y+v4DTrj5wWPhD62GsTZ0aIu6iudCBd1Mc
	 wdnjXzQoPfJAA==
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
Subject: [PATCH v4 24/25] mm/vma: convert __mmap_region() to use vma_flags_t
Date: Fri, 20 Mar 2026 19:38:41 +0000
Message-ID: <1fc33a404c962f02da778da100387cc19bd62153.1774034900.git.ljs@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774034900.git.ljs@kernel.org>
References: <cover.1774034900.git.ljs@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oracle.com,google.com,suse.de,kvack.org,vger.kernel.org,armlinux.org.uk,arm.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,nod.at,cambridgegreys.com,sipsolutions.net,zeniv.linux.org.uk,suse.cz,zte.com.cn,linux.dev,suse.com,paul-moore.com,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13841-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D437F2E08E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update the mmap() implementation logic implemented in __mmap_region() and
functions invoked by it.  The mmap_region() function converts its input
vm_flags_t parameter to a vma_flags_t value which it then passes to
__mmap_region() which uses the vma_flags_t value consistently from then
on.

As part of the change, we convert map_deny_write_exec() to using
vma_flags_t (it was incorrectly using unsigned long before), and place it
in vma.h, as it is only used internal to mm.

With this change, we eliminate the legacy is_shared_maywrite_vm_flags()
helper function which is now no longer required.

We are also able to update the MMAP_STATE() and VMG_MMAP_STATE() macros to
use the vma_flags_t value.

Finally, we update the VMA tests to reflect the change.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 include/linux/mm.h              | 18 ++++++++----
 include/linux/mman.h            | 49 -------------------------------
 mm/mprotect.c                   |  4 ++-
 mm/vma.c                        | 25 ++++++++--------
 mm/vma.h                        | 51 +++++++++++++++++++++++++++++++++
 tools/testing/vma/include/dup.h | 34 +++++-----------------
 tools/testing/vma/tests/mmap.c  | 18 ++++--------
 7 files changed, 92 insertions(+), 107 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index fb989f1fa74e..6e88b4afb44e 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1527,12 +1527,6 @@ static inline bool vma_is_accessible(const struct vm_area_struct *vma)
 	return vma->vm_flags & VM_ACCESS_FLAGS;
 }
 
-static inline bool is_shared_maywrite_vm_flags(vm_flags_t vm_flags)
-{
-	return (vm_flags & (VM_SHARED | VM_MAYWRITE)) ==
-		(VM_SHARED | VM_MAYWRITE);
-}
-
 static inline bool is_shared_maywrite(const vma_flags_t *flags)
 {
 	return vma_flags_test_all(flags, VMA_SHARED_BIT, VMA_MAYWRITE_BIT);
@@ -4349,12 +4343,24 @@ static inline bool range_in_vma(const struct vm_area_struct *vma,
 
 #ifdef CONFIG_MMU
 pgprot_t vm_get_page_prot(vm_flags_t vm_flags);
+
+static inline pgprot_t vma_get_page_prot(vma_flags_t vma_flags)
+{
+	const vm_flags_t vm_flags = vma_flags_to_legacy(vma_flags);
+
+	return vm_get_page_prot(vm_flags);
+}
+
 void vma_set_page_prot(struct vm_area_struct *vma);
 #else
 static inline pgprot_t vm_get_page_prot(vm_flags_t vm_flags)
 {
 	return __pgprot(0);
 }
+static inline pgprot_t vma_get_page_prot(vma_flags_t vma_flags)
+{
+	return __pgprot(0);
+}
 static inline void vma_set_page_prot(struct vm_area_struct *vma)
 {
 	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
diff --git a/include/linux/mman.h b/include/linux/mman.h
index 0ba8a7e8b90a..389521594c69 100644
--- a/include/linux/mman.h
+++ b/include/linux/mman.h
@@ -170,53 +170,4 @@ static inline bool arch_memory_deny_write_exec_supported(void)
 }
 #define arch_memory_deny_write_exec_supported arch_memory_deny_write_exec_supported
 #endif
-
-/*
- * Denies creating a writable executable mapping or gaining executable permissions.
- *
- * This denies the following:
- *
- * 	a)	mmap(PROT_WRITE | PROT_EXEC)
- *
- *	b)	mmap(PROT_WRITE)
- *		mprotect(PROT_EXEC)
- *
- *	c)	mmap(PROT_WRITE)
- *		mprotect(PROT_READ)
- *		mprotect(PROT_EXEC)
- *
- * But allows the following:
- *
- *	d)	mmap(PROT_READ | PROT_EXEC)
- *		mmap(PROT_READ | PROT_EXEC | PROT_BTI)
- *
- * This is only applicable if the user has set the Memory-Deny-Write-Execute
- * (MDWE) protection mask for the current process.
- *
- * @old specifies the VMA flags the VMA originally possessed, and @new the ones
- * we propose to set.
- *
- * Return: false if proposed change is OK, true if not ok and should be denied.
- */
-static inline bool map_deny_write_exec(unsigned long old, unsigned long new)
-{
-	/* If MDWE is disabled, we have nothing to deny. */
-	if (!mm_flags_test(MMF_HAS_MDWE, current->mm))
-		return false;
-
-	/* If the new VMA is not executable, we have nothing to deny. */
-	if (!(new & VM_EXEC))
-		return false;
-
-	/* Under MDWE we do not accept newly writably executable VMAs... */
-	if (new & VM_WRITE)
-		return true;
-
-	/* ...nor previously non-executable VMAs becoming executable. */
-	if (!(old & VM_EXEC))
-		return true;
-
-	return false;
-}
-
 #endif /* _LINUX_MMAN_H */
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 941f1211da0d..007d9a72b2f0 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -882,6 +882,7 @@ static int do_mprotect_pkey(unsigned long start, size_t len,
 	tmp = vma->vm_start;
 	for_each_vma_range(vmi, vma, end) {
 		vm_flags_t mask_off_old_flags;
+		vma_flags_t new_vma_flags;
 		vm_flags_t newflags;
 		int new_vma_pkey;
 
@@ -904,6 +905,7 @@ static int do_mprotect_pkey(unsigned long start, size_t len,
 		new_vma_pkey = arch_override_mprotect_pkey(vma, prot, pkey);
 		newflags = calc_vm_prot_bits(prot, new_vma_pkey);
 		newflags |= (vma->vm_flags & ~mask_off_old_flags);
+		new_vma_flags = legacy_to_vma_flags(newflags);
 
 		/* newflags >> 4 shift VM_MAY% in place of VM_% */
 		if ((newflags & ~(newflags >> 4)) & VM_ACCESS_FLAGS) {
@@ -911,7 +913,7 @@ static int do_mprotect_pkey(unsigned long start, size_t len,
 			break;
 		}
 
-		if (map_deny_write_exec(vma->vm_flags, newflags)) {
+		if (map_deny_write_exec(&vma->flags, &new_vma_flags)) {
 			error = -EACCES;
 			break;
 		}
diff --git a/mm/vma.c b/mm/vma.c
index 16a1d708c978..c335f989586f 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -44,7 +44,7 @@ struct mmap_state {
 	bool file_doesnt_need_get :1;
 };
 
-#define MMAP_STATE(name, mm_, vmi_, addr_, len_, pgoff_, vm_flags_, file_) \
+#define MMAP_STATE(name, mm_, vmi_, addr_, len_, pgoff_, vma_flags_, file_) \
 	struct mmap_state name = {					\
 		.mm = mm_,						\
 		.vmi = vmi_,						\
@@ -52,9 +52,9 @@ struct mmap_state {
 		.end = (addr_) + (len_),				\
 		.pgoff = pgoff_,					\
 		.pglen = PHYS_PFN(len_),				\
-		.vm_flags = vm_flags_,					\
+		.vma_flags = vma_flags_,				\
 		.file = file_,						\
-		.page_prot = vm_get_page_prot(vm_flags_),		\
+		.page_prot = vma_get_page_prot(vma_flags_),		\
 	}
 
 #define VMG_MMAP_STATE(name, map_, vma_)				\
@@ -63,7 +63,7 @@ struct mmap_state {
 		.vmi = (map_)->vmi,					\
 		.start = (map_)->addr,					\
 		.end = (map_)->end,					\
-		.vm_flags = (map_)->vm_flags,				\
+		.vma_flags = (map_)->vma_flags,				\
 		.pgoff = (map_)->pgoff,					\
 		.file = (map_)->file,					\
 		.prev = (map_)->prev,					\
@@ -2746,14 +2746,14 @@ static int call_action_complete(struct mmap_state *map,
 }
 
 static unsigned long __mmap_region(struct file *file, unsigned long addr,
-		unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
-		struct list_head *uf)
+		unsigned long len, vma_flags_t vma_flags,
+		unsigned long pgoff, struct list_head *uf)
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma = NULL;
 	bool have_mmap_prepare = file && file->f_op->mmap_prepare;
 	VMA_ITERATOR(vmi, mm, addr);
-	MMAP_STATE(map, mm, &vmi, addr, len, pgoff, vm_flags, file);
+	MMAP_STATE(map, mm, &vmi, addr, len, pgoff, vma_flags, file);
 	struct vm_area_desc desc = {
 		.mm = mm,
 		.file = file,
@@ -2837,16 +2837,17 @@ static unsigned long __mmap_region(struct file *file, unsigned long addr,
  * been performed.
  */
 unsigned long mmap_region(struct file *file, unsigned long addr,
-			  unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
-			  struct list_head *uf)
+			  unsigned long len, vm_flags_t vm_flags,
+			  unsigned long pgoff, struct list_head *uf)
 {
 	unsigned long ret;
 	bool writable_file_mapping = false;
+	const vma_flags_t vma_flags = legacy_to_vma_flags(vm_flags);
 
 	mmap_assert_write_locked(current->mm);
 
 	/* Check to see if MDWE is applicable. */
-	if (map_deny_write_exec(vm_flags, vm_flags))
+	if (map_deny_write_exec(&vma_flags, &vma_flags))
 		return -EACCES;
 
 	/* Allow architectures to sanity-check the vm_flags. */
@@ -2854,7 +2855,7 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
 		return -EINVAL;
 
 	/* Map writable and ensure this isn't a sealed memfd. */
-	if (file && is_shared_maywrite_vm_flags(vm_flags)) {
+	if (file && is_shared_maywrite(&vma_flags)) {
 		int error = mapping_map_writable(file->f_mapping);
 
 		if (error)
@@ -2862,7 +2863,7 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
 		writable_file_mapping = true;
 	}
 
-	ret = __mmap_region(file, addr, len, vm_flags, pgoff, uf);
+	ret = __mmap_region(file, addr, len, vma_flags, pgoff, uf);
 
 	/* Clear our write mapping regardless of error. */
 	if (writable_file_mapping)
diff --git a/mm/vma.h b/mm/vma.h
index 270008e5babc..adc18f7dd9f1 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -704,4 +704,55 @@ int create_init_stack_vma(struct mm_struct *mm, struct vm_area_struct **vmap,
 int relocate_vma_down(struct vm_area_struct *vma, unsigned long shift);
 #endif
 
+#ifdef CONFIG_MMU
+/*
+ * Denies creating a writable executable mapping or gaining executable permissions.
+ *
+ * This denies the following:
+ *
+ *	a)	mmap(PROT_WRITE | PROT_EXEC)
+ *
+ *	b)	mmap(PROT_WRITE)
+ *		mprotect(PROT_EXEC)
+ *
+ *	c)	mmap(PROT_WRITE)
+ *		mprotect(PROT_READ)
+ *		mprotect(PROT_EXEC)
+ *
+ * But allows the following:
+ *
+ *	d)	mmap(PROT_READ | PROT_EXEC)
+ *		mmap(PROT_READ | PROT_EXEC | PROT_BTI)
+ *
+ * This is only applicable if the user has set the Memory-Deny-Write-Execute
+ * (MDWE) protection mask for the current process.
+ *
+ * @old specifies the VMA flags the VMA originally possessed, and @new the ones
+ * we propose to set.
+ *
+ * Return: false if proposed change is OK, true if not ok and should be denied.
+ */
+static inline bool map_deny_write_exec(const vma_flags_t *old,
+				       const vma_flags_t *new)
+{
+	/* If MDWE is disabled, we have nothing to deny. */
+	if (!mm_flags_test(MMF_HAS_MDWE, current->mm))
+		return false;
+
+	/* If the new VMA is not executable, we have nothing to deny. */
+	if (!vma_flags_test(new, VMA_EXEC_BIT))
+		return false;
+
+	/* Under MDWE we do not accept newly writably executable VMAs... */
+	if (vma_flags_test(new, VMA_WRITE_BIT))
+		return true;
+
+	/* ...nor previously non-executable VMAs becoming executable. */
+	if (!vma_flags_test(old, VMA_EXEC_BIT))
+		return true;
+
+	return false;
+}
+#endif
+
 #endif	/* __MM_VMA_H */
diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index 9dd57f50ea6d..ab92358b082c 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -1124,12 +1124,6 @@ static __always_inline void vma_desc_clear_flags_mask(struct vm_area_desc *desc,
 #define vma_desc_clear_flags(desc, ...) \
 	vma_desc_clear_flags_mask(desc, mk_vma_flags(__VA_ARGS__))
 
-static inline bool is_shared_maywrite_vm_flags(vm_flags_t vm_flags)
-{
-	return (vm_flags & (VM_SHARED | VM_MAYWRITE)) ==
-		(VM_SHARED | VM_MAYWRITE);
-}
-
 static inline bool is_shared_maywrite(const vma_flags_t *flags)
 {
 	return vma_flags_test_all(flags, VMA_SHARED_BIT, VMA_MAYWRITE_BIT);
@@ -1446,27 +1440,6 @@ static inline bool mlock_future_ok(const struct mm_struct *mm,
 	return locked_pages <= limit_pages;
 }
 
-static inline bool map_deny_write_exec(unsigned long old, unsigned long new)
-{
-	/* If MDWE is disabled, we have nothing to deny. */
-	if (mm_flags_test(MMF_HAS_MDWE, current->mm))
-		return false;
-
-	/* If the new VMA is not executable, we have nothing to deny. */
-	if (!(new & VM_EXEC))
-		return false;
-
-	/* Under MDWE we do not accept newly writably executable VMAs... */
-	if (new & VM_WRITE)
-		return true;
-
-	/* ...nor previously non-executable VMAs becoming executable. */
-	if (!(old & VM_EXEC))
-		return true;
-
-	return false;
-}
-
 static inline int mapping_map_writable(struct address_space *mapping)
 {
 	return atomic_inc_unless_negative(&mapping->i_mmap_writable) ?
@@ -1518,3 +1491,10 @@ static inline int get_sysctl_max_map_count(void)
 #ifndef pgtable_supports_soft_dirty
 #define pgtable_supports_soft_dirty()	IS_ENABLED(CONFIG_MEM_SOFT_DIRTY)
 #endif
+
+static inline pgprot_t vma_get_page_prot(vma_flags_t vma_flags)
+{
+	const vm_flags_t vm_flags = vma_flags_to_legacy(vma_flags);
+
+	return vm_get_page_prot(vm_flags);
+}
diff --git a/tools/testing/vma/tests/mmap.c b/tools/testing/vma/tests/mmap.c
index bded4ecbe5db..c85bc000d1cb 100644
--- a/tools/testing/vma/tests/mmap.c
+++ b/tools/testing/vma/tests/mmap.c
@@ -2,6 +2,8 @@
 
 static bool test_mmap_region_basic(void)
 {
+	const vma_flags_t vma_flags = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT,
+			VMA_MAYREAD_BIT, VMA_MAYWRITE_BIT);
 	struct mm_struct mm = {};
 	unsigned long addr;
 	struct vm_area_struct *vma;
@@ -10,27 +12,19 @@ static bool test_mmap_region_basic(void)
 	current->mm = &mm;
 
 	/* Map at 0x300000, length 0x3000. */
-	addr = __mmap_region(NULL, 0x300000, 0x3000,
-			     VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE,
-			     0x300, NULL);
+	addr = __mmap_region(NULL, 0x300000, 0x3000, vma_flags, 0x300, NULL);
 	ASSERT_EQ(addr, 0x300000);
 
 	/* Map at 0x250000, length 0x3000. */
-	addr = __mmap_region(NULL, 0x250000, 0x3000,
-			     VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE,
-			     0x250, NULL);
+	addr = __mmap_region(NULL, 0x250000, 0x3000, vma_flags, 0x250, NULL);
 	ASSERT_EQ(addr, 0x250000);
 
 	/* Map at 0x303000, merging to 0x300000 of length 0x6000. */
-	addr = __mmap_region(NULL, 0x303000, 0x3000,
-			     VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE,
-			     0x303, NULL);
+	addr = __mmap_region(NULL, 0x303000, 0x3000, vma_flags, 0x303, NULL);
 	ASSERT_EQ(addr, 0x303000);
 
 	/* Map at 0x24d000, merging to 0x250000 of length 0x6000. */
-	addr = __mmap_region(NULL, 0x24d000, 0x3000,
-			     VM_READ | VM_WRITE | VM_MAYREAD | VM_MAYWRITE,
-			     0x24d, NULL);
+	addr = __mmap_region(NULL, 0x24d000, 0x3000, vma_flags, 0x24d, NULL);
 	ASSERT_EQ(addr, 0x24d000);
 
 	ASSERT_EQ(mm.map_count, 2);
-- 
2.53.0


