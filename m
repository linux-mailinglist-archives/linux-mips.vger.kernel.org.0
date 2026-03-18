Return-Path: <linux-mips+bounces-13766-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAZRANjOummfcAIAu9opvQ
	(envelope-from <linux-mips+bounces-13766-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 17:12:08 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB262BF18A
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 17:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 239B23155EAD
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 15:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B680E3EF671;
	Wed, 18 Mar 2026 15:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="flX+JrcA"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D013EF662;
	Wed, 18 Mar 2026 15:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849078; cv=none; b=d8rjmQM/sp+k27LbZQ5z0/4YDmZDWBqlAZ/59ImPf3EVqlF9H8MiMjIMxz2tydZql+weDCwtn94YKd4be34HAfgogTpIpjYgooxh8Lct75UFA1cGULj8LepBXJ6KUKDsRo4ugocQFYSdAYQ+fG4j0CB09BWyoJzZmjUaYhT/M48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849078; c=relaxed/simple;
	bh=5aVx5Ao5857cPCABjWXjupBGI3eGTimuzba0WTpAO6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S/Vy+Z7GLmC9Hd3XFIT+JVKom/ZmutZtHLda7/1T/gBi0lj9qKOhpNfQdRYYtPLof+083HobgcHF0g8zgV3f5Bi5wKDmKij8G6AUBGmfxYNXvNic30voFO+EI/iW8JEqTbV6I5dcnNXMhcyVu1zkhFkOFkSUJG/aZn3t/hybBjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=flX+JrcA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA0FC19421;
	Wed, 18 Mar 2026 15:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773849077;
	bh=5aVx5Ao5857cPCABjWXjupBGI3eGTimuzba0WTpAO6U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=flX+JrcAzh4ALOwqLhpYfnWNYaWfc7u00pGMRIQz0nmX/2ETrd1uLVrZzBTOE0aCe
	 1RZQ+08FUazW6cAwp5wHChA1xuQqaNI2YL5DleipUAV9rDuh8We8+3HSOqDfygrXlI
	 m+RqbGkWp3F7n6KG4lnjyfVgrmUXdcAMuECFxtFZIbfPj997avKoPGoYKTHUMw6sTu
	 itpy34AbZKMwX5s/o2PFny3uY3t2UqTSoEGBX/XnRG0QPIjh8f2YhF0i7sOY7VcFJ/
	 ZsKtOyyWuVyCjbVRtq2+CLb8Rq69C51gXZYXGgQQuwNyyvfLWIRFvQVSxEX3lpm6Vt
	 64CvBAuebkKZg==
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
Subject: [PATCH v3 13/23] mm/vma: introduce vma_test[_any[_mask]](), and make inlining consistent
Date: Wed, 18 Mar 2026 15:50:24 +0000
Message-ID: <7ea63af87bd35f20b204a14ad4912592e02b15a6.1773846935.git.ljs@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-13766-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_GT_50(0.00)[62];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-0.971];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AEB262BF18A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce helper functions and macros to make it convenient to test flags
and flag masks for VMAs, specifically:

* vma_test() - determine if a single VMA flag is set in a VMA.
* vma_test_any_mask() - determine if any flags in a vma_flags_t value are
			set in a VMA.
* vma_test_any() - Helper macro to test if any of specific flags are set.

Also, there are a mix of 'inline's and '__always_inline's in VMA helper
function declarations, update to consistently use __always_inline.

Finally, update the VMA tests to reflect the changes.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 include/linux/mm.h              | 49 +++++++++++++++++++++-----
 include/linux/mm_types.h        | 12 ++++---
 tools/testing/vma/include/dup.h | 61 +++++++++++++++++++++------------
 3 files changed, 88 insertions(+), 34 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index b170cee95e25..47bf9f166924 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -999,7 +999,8 @@ static inline void vm_flags_mod(struct vm_area_struct *vma,
 	__vm_flags_mod(vma, set, clear);
 }
 
-static inline bool __vma_atomic_valid_flag(struct vm_area_struct *vma, vma_flag_t bit)
+static __always_inline bool __vma_atomic_valid_flag(struct vm_area_struct *vma,
+		vma_flag_t bit)
 {
 	const vm_flags_t mask = BIT((__force int)bit);
 
@@ -1014,7 +1015,8 @@ static inline bool __vma_atomic_valid_flag(struct vm_area_struct *vma, vma_flag_
  * Set VMA flag atomically. Requires only VMA/mmap read lock. Only specific
  * valid flags are allowed to do this.
  */
-static inline void vma_set_atomic_flag(struct vm_area_struct *vma, vma_flag_t bit)
+static __always_inline void vma_set_atomic_flag(struct vm_area_struct *vma,
+		vma_flag_t bit)
 {
 	unsigned long *bitmap = vma->flags.__vma_flags;
 
@@ -1030,7 +1032,8 @@ static inline void vma_set_atomic_flag(struct vm_area_struct *vma, vma_flag_t bi
  * This is necessarily racey, so callers must ensure that serialisation is
  * achieved through some other means, or that races are permissible.
  */
-static inline bool vma_test_atomic_flag(struct vm_area_struct *vma, vma_flag_t bit)
+static __always_inline bool vma_test_atomic_flag(struct vm_area_struct *vma,
+		vma_flag_t bit)
 {
 	if (__vma_atomic_valid_flag(vma, bit))
 		return test_bit((__force int)bit, &vma->vm_flags);
@@ -1235,13 +1238,41 @@ static __always_inline bool vma_flags_same_mask(const vma_flags_t *flags,
 #define vma_flags_same(flags, ...) \
 	vma_flags_same_mask(flags, mk_vma_flags(__VA_ARGS__))
 
+/*
+ * Test whether a specific flag in the VMA is set, e.g.:
+ *
+ * if (vma_test(vma, VMA_READ_BIT)) { ... }
+ */
+static __always_inline bool vma_test(const struct vm_area_struct *vma,
+		vma_flag_t bit)
+{
+	return vma_flags_test(&vma->flags, bit);
+}
+
+/* Helper to test any VMA flags in a VMA . */
+static __always_inline bool vma_test_any_mask(const struct vm_area_struct *vma,
+		vma_flags_t flags)
+{
+	return vma_flags_test_any_mask(&vma->flags, flags);
+}
+
+/*
+ * Helper macro for testing whether any VMA flags are set in a VMA,
+ * e.g.:
+ *
+ * if (vma_test_any(vma, VMA_IO_BIT, VMA_PFNMAP_BIT,
+ *		VMA_DONTEXPAND_BIT, VMA_DONTDUMP_BIT)) { ... }
+ */
+#define vma_test_any(vma, ...) \
+	vma_test_any_mask(vma, mk_vma_flags(__VA_ARGS__))
+
 /*
  * Helper to test that ALL specified flags are set in a VMA.
  *
  * Note: appropriate locks must be held, this function does not acquire them for
  * you.
  */
-static inline bool vma_test_all_mask(const struct vm_area_struct *vma,
+static __always_inline bool vma_test_all_mask(const struct vm_area_struct *vma,
 		vma_flags_t flags)
 {
 	return vma_flags_test_all_mask(&vma->flags, flags);
@@ -1261,7 +1292,7 @@ static inline bool vma_test_all_mask(const struct vm_area_struct *vma,
  * Note: appropriate locks must be held, this function does not acquire them for
  * you.
  */
-static inline void vma_set_flags_mask(struct vm_area_struct *vma,
+static __always_inline void vma_set_flags_mask(struct vm_area_struct *vma,
 		vma_flags_t flags)
 {
 	vma_flags_set_mask(&vma->flags, flags);
@@ -1291,7 +1322,7 @@ static __always_inline bool vma_desc_test(const struct vm_area_desc *desc,
 }
 
 /* Helper to test any VMA flags in a VMA descriptor. */
-static inline bool vma_desc_test_any_mask(const struct vm_area_desc *desc,
+static __always_inline bool vma_desc_test_any_mask(const struct vm_area_desc *desc,
 		vma_flags_t flags)
 {
 	return vma_flags_test_any_mask(&desc->vma_flags, flags);
@@ -1308,7 +1339,7 @@ static inline bool vma_desc_test_any_mask(const struct vm_area_desc *desc,
 	vma_desc_test_any_mask(desc, mk_vma_flags(__VA_ARGS__))
 
 /* Helper to test all VMA flags in a VMA descriptor. */
-static inline bool vma_desc_test_all_mask(const struct vm_area_desc *desc,
+static __always_inline bool vma_desc_test_all_mask(const struct vm_area_desc *desc,
 		vma_flags_t flags)
 {
 	return vma_flags_test_all_mask(&desc->vma_flags, flags);
@@ -1324,7 +1355,7 @@ static inline bool vma_desc_test_all_mask(const struct vm_area_desc *desc,
 	vma_desc_test_all_mask(desc, mk_vma_flags(__VA_ARGS__))
 
 /* Helper to set all VMA flags in a VMA descriptor. */
-static inline void vma_desc_set_flags_mask(struct vm_area_desc *desc,
+static __always_inline void vma_desc_set_flags_mask(struct vm_area_desc *desc,
 		vma_flags_t flags)
 {
 	vma_flags_set_mask(&desc->vma_flags, flags);
@@ -1341,7 +1372,7 @@ static inline void vma_desc_set_flags_mask(struct vm_area_desc *desc,
 	vma_desc_set_flags_mask(desc, mk_vma_flags(__VA_ARGS__))
 
 /* Helper to clear all VMA flags in a VMA descriptor. */
-static inline void vma_desc_clear_flags_mask(struct vm_area_desc *desc,
+static __always_inline void vma_desc_clear_flags_mask(struct vm_area_desc *desc,
 		vma_flags_t flags)
 {
 	vma_flags_clear_mask(&desc->vma_flags, flags);
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index c5ad55b8a45b..16d31045e26e 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1087,7 +1087,8 @@ static __always_inline vm_flags_t vma_flags_to_legacy(vma_flags_t flags)
  * IMPORTANT: This does not overwrite bytes past the first system word. The
  * caller must account for this.
  */
-static inline void vma_flags_overwrite_word(vma_flags_t *flags, unsigned long value)
+static __always_inline void vma_flags_overwrite_word(vma_flags_t *flags,
+		unsigned long value)
 {
 	unsigned long *bitmap = flags->__vma_flags;
 
@@ -1114,7 +1115,8 @@ static __always_inline vma_flags_t legacy_to_vma_flags(vm_flags_t flags)
  * IMPORTANT: This does not overwrite bytes past the first system word. The
  * caller must account for this.
  */
-static inline void vma_flags_overwrite_word_once(vma_flags_t *flags, unsigned long value)
+static __always_inline void vma_flags_overwrite_word_once(vma_flags_t *flags,
+		unsigned long value)
 {
 	unsigned long *bitmap = flags->__vma_flags;
 
@@ -1122,7 +1124,8 @@ static inline void vma_flags_overwrite_word_once(vma_flags_t *flags, unsigned lo
 }
 
 /* Update the first system word of VMA flags setting bits, non-atomically. */
-static inline void vma_flags_set_word(vma_flags_t *flags, unsigned long value)
+static __always_inline void vma_flags_set_word(vma_flags_t *flags,
+		unsigned long value)
 {
 	unsigned long *bitmap = flags->__vma_flags;
 
@@ -1130,7 +1133,8 @@ static inline void vma_flags_set_word(vma_flags_t *flags, unsigned long value)
 }
 
 /* Update the first system word of VMA flags clearing bits, non-atomically. */
-static inline void vma_flags_clear_word(vma_flags_t *flags, unsigned long value)
+static __always_inline void vma_flags_clear_word(vma_flags_t *flags,
+		unsigned long value)
 {
 	unsigned long *bitmap = flags->__vma_flags;
 
diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index f49af21319ba..f9fe07a8a443 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -764,7 +764,8 @@ static inline bool mm_flags_test(int flag, const struct mm_struct *mm)
  * IMPORTANT: This does not overwrite bytes past the first system word. The
  * caller must account for this.
  */
-static inline void vma_flags_overwrite_word(vma_flags_t *flags, unsigned long value)
+static __always_inline void vma_flags_overwrite_word(vma_flags_t *flags,
+		unsigned long value)
 {
 	unsigned long *bitmap = flags->__vma_flags;
 
@@ -777,7 +778,8 @@ static inline void vma_flags_overwrite_word(vma_flags_t *flags, unsigned long va
  * IMPORTANT: This does not overwrite bytes past the first system word. The
  * caller must account for this.
  */
-static inline void vma_flags_overwrite_word_once(vma_flags_t *flags, unsigned long value)
+static __always_inline void vma_flags_overwrite_word_once(vma_flags_t *flags,
+		unsigned long value)
 {
 	unsigned long *bitmap = flags->__vma_flags;
 
@@ -785,7 +787,8 @@ static inline void vma_flags_overwrite_word_once(vma_flags_t *flags, unsigned lo
 }
 
 /* Update the first system word of VMA flags setting bits, non-atomically. */
-static inline void vma_flags_set_word(vma_flags_t *flags, unsigned long value)
+static __always_inline void vma_flags_set_word(vma_flags_t *flags,
+		unsigned long value)
 {
 	unsigned long *bitmap = flags->__vma_flags;
 
@@ -793,7 +796,8 @@ static inline void vma_flags_set_word(vma_flags_t *flags, unsigned long value)
 }
 
 /* Update the first system word of VMA flags clearing bits, non-atomically. */
-static inline void vma_flags_clear_word(vma_flags_t *flags, unsigned long value)
+static __always_inline void vma_flags_clear_word(vma_flags_t *flags,
+		unsigned long value)
 {
 	unsigned long *bitmap = flags->__vma_flags;
 
@@ -1003,23 +1007,32 @@ static __always_inline bool vma_flags_same_mask(const vma_flags_t *flags,
 #define vma_flags_same(flags, ...) \
 	vma_flags_same_mask(flags, mk_vma_flags(__VA_ARGS__))
 
-static inline bool vma_test_all_mask(const struct vm_area_struct *vma,
-				     vma_flags_t flags)
+static __always_inline bool vma_test(const struct vm_area_struct *vma,
+		vma_flag_t bit)
 {
-	return vma_flags_test_all_mask(&vma->flags, flags);
+	return vma_flags_test(&vma->flags, bit);
 }
 
-#define vma_test_all(vma, ...) \
-	vma_test_all_mask(vma, mk_vma_flags(__VA_ARGS__))
+static __always_inline bool vma_test_any_mask(const struct vm_area_struct *vma,
+		vma_flags_t flags)
+{
+	return vma_flags_test_any_mask(&vma->flags, flags);
+}
 
-static inline bool is_shared_maywrite_vm_flags(vm_flags_t vm_flags)
+#define vma_test_any(vma, ...) \
+	vma_test_any_mask(vma, mk_vma_flags(__VA_ARGS__))
+
+static __always_inline bool vma_test_all_mask(const struct vm_area_struct *vma,
+		vma_flags_t flags)
 {
-	return (vm_flags & (VM_SHARED | VM_MAYWRITE)) ==
-		(VM_SHARED | VM_MAYWRITE);
+	return vma_flags_test_all_mask(&vma->flags, flags);
 }
 
-static inline void vma_set_flags_mask(struct vm_area_struct *vma,
-				      vma_flags_t flags)
+#define vma_test_all(vma, ...) \
+	vma_test_all_mask(vma, mk_vma_flags(__VA_ARGS__))
+
+static __always_inline void vma_set_flags_mask(struct vm_area_struct *vma,
+		vma_flags_t flags)
 {
 	vma_flags_set_mask(&vma->flags, flags);
 }
@@ -1033,8 +1046,8 @@ static __always_inline bool vma_desc_test(const struct vm_area_desc *desc,
 	return vma_flags_test(&desc->vma_flags, bit);
 }
 
-static inline bool vma_desc_test_any_mask(const struct vm_area_desc *desc,
-					    vma_flags_t flags)
+static __always_inline bool vma_desc_test_any_mask(const struct vm_area_desc *desc,
+		vma_flags_t flags)
 {
 	return vma_flags_test_any_mask(&desc->vma_flags, flags);
 }
@@ -1042,7 +1055,7 @@ static inline bool vma_desc_test_any_mask(const struct vm_area_desc *desc,
 #define vma_desc_test_any(desc, ...) \
 	vma_desc_test_any_mask(desc, mk_vma_flags(__VA_ARGS__))
 
-static inline bool vma_desc_test_all_mask(const struct vm_area_desc *desc,
+static __always_inline bool vma_desc_test_all_mask(const struct vm_area_desc *desc,
 		vma_flags_t flags)
 {
 	return vma_flags_test_all_mask(&desc->vma_flags, flags);
@@ -1051,8 +1064,8 @@ static inline bool vma_desc_test_all_mask(const struct vm_area_desc *desc,
 #define vma_desc_test_all(desc, ...) \
 	vma_desc_test_all_mask(desc, mk_vma_flags(__VA_ARGS__))
 
-static inline void vma_desc_set_flags_mask(struct vm_area_desc *desc,
-					   vma_flags_t flags)
+static __always_inline void vma_desc_set_flags_mask(struct vm_area_desc *desc,
+		vma_flags_t flags)
 {
 	vma_flags_set_mask(&desc->vma_flags, flags);
 }
@@ -1060,8 +1073,8 @@ static inline void vma_desc_set_flags_mask(struct vm_area_desc *desc,
 #define vma_desc_set_flags(desc, ...) \
 	vma_desc_set_flags_mask(desc, mk_vma_flags(__VA_ARGS__))
 
-static inline void vma_desc_clear_flags_mask(struct vm_area_desc *desc,
-					     vma_flags_t flags)
+static __always_inline void vma_desc_clear_flags_mask(struct vm_area_desc *desc,
+		vma_flags_t flags)
 {
 	vma_flags_clear_mask(&desc->vma_flags, flags);
 }
@@ -1069,6 +1082,12 @@ static inline void vma_desc_clear_flags_mask(struct vm_area_desc *desc,
 #define vma_desc_clear_flags(desc, ...) \
 	vma_desc_clear_flags_mask(desc, mk_vma_flags(__VA_ARGS__))
 
+static inline bool is_shared_maywrite_vm_flags(vm_flags_t vm_flags)
+{
+	return (vm_flags & (VM_SHARED | VM_MAYWRITE)) ==
+		(VM_SHARED | VM_MAYWRITE);
+}
+
 static inline bool is_shared_maywrite(const vma_flags_t *flags)
 {
 	return vma_flags_test_all(flags, VMA_SHARED_BIT, VMA_MAYWRITE_BIT);
-- 
2.53.0


