Return-Path: <linux-mips+bounces-13778-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGEKDWPsuml0dAIAu9opvQ
	(envelope-from <linux-mips+bounces-13778-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 19:18:11 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A06BA2C11C3
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 19:18:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E83E312D323
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 17:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7104E355F58;
	Wed, 18 Mar 2026 17:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="jzROPGVp"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375792DB7AE;
	Wed, 18 Mar 2026 17:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773856082; cv=none; b=fcmBgbDOhHLb6smXC9y8NOami16Cg1K7hxQQSvGd0EBc+r10c8F72vZi7FXbLSextLkjrfrP/GD23aRV7gSRFX1gIKc1fHn/yW1GBkdNmEHv4Ro/NlS7r+qDvK3JGj30G2W+GwTz0dv+Cm0vkus02GATQE7S1CofdAGmAOwTnHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773856082; c=relaxed/simple;
	bh=hq72KfDI9YIjm4UqddYP9KoqIbbXOeXeI0l+6wtPMMo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=X5h0LuMwvML8u1zmaYQO1oUenrhqUxGsvVW4/W6Dbwa4kinB2agVeACG/bsifsyOYa/sPSGWa2j7V30qRv0IN4vTEuZjbKR4Ez2/loEr/E9nvuCe810rCAMkEYI7MkdNYJky29ztjqtgJWkjnqGJ9wkfL6LUyl99XRLR7uzvohM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=jzROPGVp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B7CC19421;
	Wed, 18 Mar 2026 17:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1773856081;
	bh=hq72KfDI9YIjm4UqddYP9KoqIbbXOeXeI0l+6wtPMMo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jzROPGVpzZ38jRINIUlrs6pYfFojw6d5rE/vbNiFKT2UViwtaZd0lDJtPPR3nnuYS
	 FF9HJXYzwRihCsjyfkE7AMRmpanGALhCQ9VX7i/W6cYBSjxY2y2GwDDanrboMs/kOZ
	 kogswLXx++OfebTDVl2acbny9BYIqCrFpBBH+dng=
Date: Wed, 18 Mar 2026 10:47:59 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn
 <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Kees Cook
 <kees@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Vineet
 Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Brian
 Cain <bcain@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dinh
 Nguyen <dinguyen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H . Peter Anvin"
 <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Xu Xin
 <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>, Michal
 Hocko <mhocko@suse.com>, Paul Moore <paul@paul-moore.com>, Stephen Smalley
 <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 selinux@vger.kernel.org
Subject: Re: [PATCH v3 00/23] mm/vma: convert vm_flags_t to vma_flags_t in
 vma code
Message-Id: <20260318104759.92b339d382e7d8d25daea54b@linux-foundation.org>
In-Reply-To: <cover.1773846935.git.ljs@kernel.org>
References: <cover.1773846935.git.ljs@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-13778-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,oracle.com,google.com,suse.de,kvack.org,vger.kernel.org,armlinux.org.uk,arm.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,nod.at,cambridgegreys.com,sipsolutions.net,zeniv.linux.org.uk,suse.cz,zte.com.cn,linux.dev,suse.com,paul-moore.com,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[62];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-0.941];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:dkim,linux-foundation.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A06BA2C11C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 18 Mar 2026 15:50:11 +0000 "Lorenzo Stoakes (Oracle)" <ljs@kernel.org> wrote:

> This series converts a lot of the existing use of the legacy vm_flags_t
> data type to the new vma_flags_t type which replaces it.

Updated, thanks.  Below is how v3 altered mm.git:


 arch/arm64/include/asm/page.h   |    4 +++
 include/linux/mm_types.h        |   32 +++++++++++++++---------------
 mm/mseal.c                      |    1 
 mm/vma.c                        |   27 +++++++++++++------------
 tools/testing/vma/include/dup.h |   22 +++++++++++---------
 tools/testing/vma/tests/vma.c   |    3 --
 6 files changed, 48 insertions(+), 41 deletions(-)

--- a/arch/arm64/include/asm/page.h~b
+++ a/arch/arm64/include/asm/page.h
@@ -46,8 +46,12 @@ int pfn_is_map_memory(unsigned long pfn)
 
 #endif /* !__ASSEMBLER__ */
 
+#ifdef CONFIG_ARM64_MTE
 #define VMA_DATA_DEFAULT_FLAGS	append_vma_flags(VMA_DATA_FLAGS_TSK_EXEC, \
 						 VMA_MTE_ALLOWED_BIT)
+#else
+#define VMA_DATA_DEFAULT_FLAGS	VMA_DATA_FLAGS_TSK_EXEC
+#endif
 
 #include <asm-generic/getorder.h>
 
--- a/include/linux/mm_types.h~b
+++ a/include/linux/mm_types.h
@@ -871,9 +871,9 @@ typedef struct {
 #define EMPTY_VMA_FLAGS ((vma_flags_t){ })
 
 /* Are no flags set in the specified VMA flags? */
-static __always_inline bool vma_flags_empty(vma_flags_t *flags)
+static __always_inline bool vma_flags_empty(const vma_flags_t *flags)
 {
-	unsigned long *bitmap = flags->__vma_flags;
+	const unsigned long *bitmap = flags->__vma_flags;
 
 	return bitmap_empty(bitmap, NUM_VMA_FLAG_BITS);
 }
@@ -1082,20 +1082,6 @@ static __always_inline vm_flags_t vma_fl
 }
 
 /*
- * Helper function which converts a legacy vm_flags_t value to a vma_flags_t
- * value.
- *
- * Will be removed once the conversion to VMA flags is complete.
- */
-static __always_inline vma_flags_t legacy_to_vma_flags(vm_flags_t flags)
-{
-	vma_flags_t ret;
-
-	ret.__vma_flags[0] = (unsigned long)flags;
-	return ret;
-}
-
-/*
  * Copy value to the first system word of VMA flags, non-atomically.
  *
  * IMPORTANT: This does not overwrite bytes past the first system word. The
@@ -1110,6 +1096,20 @@ static __always_inline void vma_flags_ov
 }
 
 /*
+ * Helper function which converts a legacy vm_flags_t value to a vma_flags_t
+ * value.
+ *
+ * Will be removed once the conversion to VMA flags is complete.
+ */
+static __always_inline vma_flags_t legacy_to_vma_flags(vm_flags_t flags)
+{
+	vma_flags_t ret = EMPTY_VMA_FLAGS;
+
+	vma_flags_overwrite_word(&ret, flags);
+	return ret;
+}
+
+/*
  * Copy value to the first system word of VMA flags ONCE, non-atomically.
  *
  * IMPORTANT: This does not overwrite bytes past the first system word. The
--- a/mm/mseal.c~b
+++ a/mm/mseal.c
@@ -77,6 +77,7 @@ static int mseal_apply(struct mm_struct
 					       curr_end, &vma_flags);
 			if (IS_ERR(vma))
 				return PTR_ERR(vma);
+			vma_start_write(vma);
 			vma_set_flags(vma, VMA_SEALED_BIT);
 		}
 
--- a/mm/vma.c~b
+++ a/mm/vma.c
@@ -905,20 +905,21 @@ static __must_check struct vm_area_struc
 	vma_start_write(middle);
 
 	if (merge_right) {
-		const vma_flags_t next_sticky =
-			vma_flags_and_mask(&next->flags, VMA_STICKY_FLAGS);
+		vma_flags_t next_sticky;
 
 		vma_start_write(next);
 		vmg->target = next;
+		next_sticky = vma_flags_and_mask(&next->flags, VMA_STICKY_FLAGS);
 		vma_flags_set_mask(&sticky_flags, next_sticky);
 	}
 
 	if (merge_left) {
-		const vma_flags_t prev_sticky =
-			vma_flags_and_mask(&prev->flags, VMA_STICKY_FLAGS);
+		vma_flags_t prev_sticky;
 
 		vma_start_write(prev);
 		vmg->target = prev;
+
+		prev_sticky = vma_flags_and_mask(&prev->flags, VMA_STICKY_FLAGS);
 		vma_flags_set_mask(&sticky_flags, prev_sticky);
 	}
 
@@ -1170,13 +1171,14 @@ int vma_expand(struct vma_merge_struct *
 	bool remove_next = false;
 	vma_flags_t sticky_flags =
 		vma_flags_and_mask(&vmg->vma_flags, VMA_STICKY_FLAGS);
-	const vma_flags_t target_sticky =
-		vma_flags_and_mask(&target->flags, VMA_STICKY_FLAGS);
+	vma_flags_t target_sticky;
 	int ret = 0;
 
 	mmap_assert_write_locked(vmg->mm);
 	vma_start_write(target);
 
+	target_sticky = vma_flags_and_mask(&target->flags, VMA_STICKY_FLAGS);
+
 	if (next && target != next && vmg->end == next->vm_end)
 		remove_next = true;
 
@@ -1192,12 +1194,6 @@ int vma_expand(struct vma_merge_struct *
 		       target->vm_end > vmg->end, vmg);
 
 	vma_flags_set_mask(&sticky_flags, target_sticky);
-	if (remove_next) {
-		const vma_flags_t next_sticky =
-			vma_flags_and_mask(&next->flags, VMA_STICKY_FLAGS);
-
-		vma_flags_set_mask(&sticky_flags, next_sticky);
-	}
 
 	/*
 	 * If we are removing the next VMA or copying from a VMA
@@ -1214,8 +1210,13 @@ int vma_expand(struct vma_merge_struct *
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
@@ -2950,7 +2951,7 @@ out:
 	if (vma_flags_test(&vma_flags, VMA_LOCKED_BIT))
 		mm->locked_vm += (len >> PAGE_SHIFT);
 	if (pgtable_supports_soft_dirty())
-		vma_flags_set(&vma_flags, VMA_SOFTDIRTY_BIT);
+		vma_set_flags(vma, VMA_SOFTDIRTY_BIT);
 	return 0;
 
 mas_store_fail:
--- a/tools/testing/vma/include/dup.h~b
+++ a/tools/testing/vma/include/dup.h
@@ -441,9 +441,9 @@ struct vma_iterator {
 #define MAPCOUNT_ELF_CORE_MARGIN	(5)
 #define DEFAULT_MAX_MAP_COUNT	(USHRT_MAX - MAPCOUNT_ELF_CORE_MARGIN)
 
-static __always_inline bool vma_flags_empty(vma_flags_t *flags)
+static __always_inline bool vma_flags_empty(const vma_flags_t *flags)
 {
-	unsigned long *bitmap = flags->__vma_flags;
+	const unsigned long *bitmap = flags->__vma_flags;
 
 	return bitmap_empty(bitmap, NUM_VMA_FLAG_BITS);
 }
@@ -775,7 +775,9 @@ static inline bool mm_flags_test(int fla
 static __always_inline void vma_flags_overwrite_word(vma_flags_t *flags,
 		unsigned long value)
 {
-	*ACCESS_PRIVATE(flags, __vma_flags) = value;
+	unsigned long *bitmap = flags->__vma_flags;
+
+	bitmap[0] = value;
 }
 
 /*
@@ -787,7 +789,7 @@ static __always_inline void vma_flags_ov
 static __always_inline void vma_flags_overwrite_word_once(vma_flags_t *flags,
 		unsigned long value)
 {
-	unsigned long *bitmap = ACCESS_PRIVATE(flags, __vma_flags);
+	unsigned long *bitmap = flags->__vma_flags;
 
 	WRITE_ONCE(*bitmap, value);
 }
@@ -796,7 +798,7 @@ static __always_inline void vma_flags_ov
 static __always_inline void vma_flags_set_word(vma_flags_t *flags,
 		unsigned long value)
 {
-	unsigned long *bitmap = ACCESS_PRIVATE(flags, __vma_flags);
+	unsigned long *bitmap = flags->__vma_flags;
 
 	*bitmap |= value;
 }
@@ -805,7 +807,7 @@ static __always_inline void vma_flags_se
 static __always_inline void vma_flags_clear_word(vma_flags_t *flags,
 		unsigned long value)
 {
-	unsigned long *bitmap = ACCESS_PRIVATE(flags, __vma_flags);
+	unsigned long *bitmap = flags->__vma_flags;
 
 	*bitmap &= ~value;
 }
@@ -835,9 +837,9 @@ static __always_inline vm_flags_t vma_fl
  */
 static __always_inline vma_flags_t legacy_to_vma_flags(vm_flags_t flags)
 {
-	vma_flags_t ret;
+	vma_flags_t ret = EMPTY_VMA_FLAGS;
 
-	ret.__vma_flags[0] = (unsigned long)flags;
+	vma_flags_overwrite_word(&ret, flags);
 	return ret;
 }
 
@@ -1073,8 +1075,8 @@ static __always_inline void vma_clear_fl
 	vma_flags_clear_mask(&vma->flags, flags);
 }
 
-#define vma_clear_flags(vmag, ...) \
-	vma_clear_flags_mask(vmag, mk_vma_flags(__VA_ARGS__))
+#define vma_clear_flags(vma, ...) \
+	vma_clear_flags_mask(vma, mk_vma_flags(__VA_ARGS__))
 
 static __always_inline bool vma_desc_test(const struct vm_area_desc *desc,
 		vma_flag_t bit)
--- a/tools/testing/vma/tests/vma.c~b
+++ a/tools/testing/vma/tests/vma.c
@@ -356,10 +356,9 @@ static bool test_vma_flags_clear(void)
 
 	/* Cursory check of _mask() variant, as the helper macros imply. */
 	vma_flags_clear_mask(&flags, mask);
-	vma_flags_clear_mask(&vma.flags, mask);
+	vma_clear_flags_mask(&vma, mask);
 	vma_desc_clear_flags_mask(&desc, mask);
 #if NUM_VMA_FLAG_BITS > 64
-	vma_clear_flags_mask(&vma, mask);
 	ASSERT_FALSE(vma_flags_test_any(&flags, VMA_EXEC_BIT, 64));
 	ASSERT_FALSE(vma_test_any(&vma, VMA_EXEC_BIT, 64));
 	ASSERT_FALSE(vma_desc_test_any(&desc, VMA_EXEC_BIT, 64));
_


