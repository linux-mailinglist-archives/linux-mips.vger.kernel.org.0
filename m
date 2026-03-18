Return-Path: <linux-mips+bounces-13768-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePcQKhzdumk3cwIAu9opvQ
	(envelope-from <linux-mips+bounces-13768-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 18:13:00 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDD82BFFCA
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 18:12:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A02D306C53B
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 15:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0347E3F0750;
	Wed, 18 Mar 2026 15:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dChUK4Jh"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7941C3ED5C5;
	Wed, 18 Mar 2026 15:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849083; cv=none; b=aIfcWD1A3S/PZoCx2sRm3bpYiMq/w79tqgUEZwSXbE7a6a6BzVW1ffdWA6RTNcFkcHAl6wsIe5pRzX4sFpPZaN3FinyLh138UcaS2MVClHx3lpl35lHL4d6OW6cpbk2IGXxELLv9xoHMylDEmQqT/+C76U8dOhJNJIdYk8JETOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849083; c=relaxed/simple;
	bh=WTtdyZXbISPP1kcYqp/J+dovRgyrhT8ehSC7WOVjmko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cfVJYczeG6JieH15Mh5mCACjorx42c+wNd+IztUvI/R5+9t58UHIVtgDColYptfopb38jW0Fh+EJfVIc5Fcu32wLCgG7kFqBWUTP9dKQmknYLusnfyc2EldjgXOCF0SG6b8kQByOtzgMdiAylCgM/gj4kvCphBsq8i+rZRZ808k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dChUK4Jh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30483C2BC87;
	Wed, 18 Mar 2026 15:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773849082;
	bh=WTtdyZXbISPP1kcYqp/J+dovRgyrhT8ehSC7WOVjmko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dChUK4Jh9ZIVsDSCCL8U8ZytT0/xMqCscZqdj29DI7Wsx3plLasi+0/pKgtulbkz8
	 DUJ5FxuumcOv/B0D39i9fxvUzDGq3ecUq2dQuzdMXJaHW/nfbyjMVwQD1Y9H4fDhsA
	 Tq5XhQIk+U+l/1xNy1wgtvkpgNuUACEN6N8NwulBz+B3yQgNC/YSODcALTpNRWPE2o
	 ElObt07L2oCIKwEVUsrqELHod10F2ixGRftVlh82X8tunP//IVGxOse4nYEeIqRrjg
	 Mya9vUT0S1mvtnVJUp2KLTRvyIOIWVjMuJHoqvFj7b7hp5/ARQZrb0DPIvf/UIEVr1
	 eiBNfvTgH7pJg==
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
Subject: [PATCH v3 15/23] mm: introduce vma_flags_count() and vma[_flags]_test_single_mask()
Date: Wed, 18 Mar 2026 15:50:26 +0000
Message-ID: <02a6b26542ab70d60175e0125cff5fd00073c7ae.1773846935.git.ljs@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oracle.com,google.com,suse.de,kvack.org,vger.kernel.org,armlinux.org.uk,arm.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,nod.at,cambridgegreys.com,sipsolutions.net,zeniv.linux.org.uk,suse.cz,zte.com.cn,linux.dev,suse.com,paul-moore.com,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13768-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_GT_50(0.00)[62];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-0.969];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AFDD82BFFCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

vma_flags_count() determines how many bits are set in VMA flags, using
bitmap_weight().

vma_flags_test_single_mask() determines if a vma_flags_t set of flags
contains a single flag specified as another vma_flags_t value, or if the
sought flag mask is empty, it is defined to return false.

This is useful when we want to declare a VMA flag as optionally a single
flag in a mask or empty depending on kernel configuration.

This allows us to have VM_NONE-like semantics when checking whether the
flag is set.

In a subsequent patch, we introduce the use of VMA_DROPPABLE of type
vma_flags_t using precisely these semantics.

It would be actively confusing to use vma_flags_test_any_single_mask() for
this (and vma_flags_test_all_mask() is not correct to use here, as it
trivially returns true when tested against an empty vma flags mask).

We introduce vma_flags_count() to be able to assert that the compared flag
mask is singular or empty, checked when CONFIG_DEBUG_VM is enabled.

Also update the VMA tests as part of this change.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 include/linux/mm.h                 | 46 ++++++++++++++++++++++++++++++
 tools/testing/vma/include/custom.h |  6 ----
 tools/testing/vma/include/dup.h    | 21 ++++++++++++++
 tools/testing/vma/vma_internal.h   |  6 ++++
 4 files changed, 73 insertions(+), 6 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 47bf9f166924..324b6e8a66fa 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1083,6 +1083,14 @@ static __always_inline vma_flags_t __mk_vma_flags(vma_flags_t flags,
 #define append_vma_flags(flags, ...) __mk_vma_flags(flags,			\
 		COUNT_ARGS(__VA_ARGS__), (const vma_flag_t []){__VA_ARGS__})
 
+/* Calculates the number of set bits in the specified VMA flags. */
+static __always_inline int vma_flags_count(const vma_flags_t *flags)
+{
+	const unsigned long *bitmap = flags->__vma_flags;
+
+	return bitmap_weight(bitmap, NUM_VMA_FLAG_BITS);
+}
+
 /*
  * Test whether a specific VMA flag is set, e.g.:
  *
@@ -1158,6 +1166,26 @@ static __always_inline bool vma_flags_test_all_mask(const vma_flags_t *flags,
 #define vma_flags_test_all(flags, ...) \
 	vma_flags_test_all_mask(flags, mk_vma_flags(__VA_ARGS__))
 
+/*
+ * Helper to test that a flag mask of type vma_flags_t has a SINGLE flag set
+ * (returning false if flagmask has no flags set).
+ *
+ * This is defined to make the semantics clearer when testing an optionally
+ * defined VMA flags mask, e.g.:
+ *
+ * if (vma_flags_test_single_mask(&flags, VMA_DROPPABLE)) { ... }
+ *
+ * When VMA_DROPPABLE is defined if available, or set to EMPTY_VMA_FLAGS
+ * otherwise.
+ */
+static __always_inline bool vma_flags_test_single_mask(const vma_flags_t *flags,
+		vma_flags_t flagmask)
+{
+	VM_WARN_ON_ONCE(vma_flags_count(&flagmask) > 1);
+
+	return vma_flags_test_any_mask(flags, flagmask);
+}
+
 /* Set each of the to_set flags in flags, non-atomically. */
 static __always_inline void vma_flags_set_mask(vma_flags_t *flags,
 		vma_flags_t to_set)
@@ -1286,6 +1314,24 @@ static __always_inline bool vma_test_all_mask(const struct vm_area_struct *vma,
 #define vma_test_all(vma, ...) \
 	vma_test_all_mask(vma, mk_vma_flags(__VA_ARGS__))
 
+/*
+ * Helper to test that a flag mask of type vma_flags_t has a SINGLE flag set
+ * (returning false if flagmask has no flags set).
+ *
+ * This is useful when a flag needs to be either defined or not depending upon
+ * kernel configuration, e.g.:
+ *
+ * if (vma_test_single_mask(vma, VMA_DROPPABLE)) { ... }
+ *
+ * When VMA_DROPPABLE is defined if available, or set to EMPTY_VMA_FLAGS
+ * otherwise.
+ */
+static __always_inline bool
+vma_test_single_mask(const struct vm_area_struct *vma, vma_flags_t flagmask)
+{
+	return vma_flags_test_single_mask(&vma->flags, flagmask);
+}
+
 /*
  * Helper to set all VMA flags in a VMA.
  *
diff --git a/tools/testing/vma/include/custom.h b/tools/testing/vma/include/custom.h
index 2c498e713fbd..b7d9eb0a44e4 100644
--- a/tools/testing/vma/include/custom.h
+++ b/tools/testing/vma/include/custom.h
@@ -15,12 +15,6 @@ extern unsigned long dac_mmap_min_addr;
 #define dac_mmap_min_addr	0UL
 #endif
 
-#define VM_WARN_ON(_expr) (WARN_ON(_expr))
-#define VM_WARN_ON_ONCE(_expr) (WARN_ON_ONCE(_expr))
-#define VM_WARN_ON_VMG(_expr, _vmg) (WARN_ON(_expr))
-#define VM_BUG_ON(_expr) (BUG_ON(_expr))
-#define VM_BUG_ON_VMA(_expr, _vma) (BUG_ON(_expr))
-
 #define TASK_SIZE ((1ul << 47)-PAGE_SIZE)
 
 /*
diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index f9fe07a8a443..244ee02dc21d 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -905,6 +905,13 @@ static __always_inline vma_flags_t __mk_vma_flags(vma_flags_t flags,
 #define append_vma_flags(flags, ...) __mk_vma_flags(flags,			\
 		COUNT_ARGS(__VA_ARGS__), (const vma_flag_t []){__VA_ARGS__})
 
+static __always_inline int vma_flags_count(const vma_flags_t *flags)
+{
+	const unsigned long *bitmap = flags->__vma_flags;
+
+	return bitmap_weight(bitmap, NUM_VMA_FLAG_BITS);
+}
+
 static __always_inline bool vma_flags_test(const vma_flags_t *flags,
 		vma_flag_t bit)
 {
@@ -952,6 +959,14 @@ static __always_inline bool vma_flags_test_all_mask(const vma_flags_t *flags,
 #define vma_flags_test_all(flags, ...) \
 	vma_flags_test_all_mask(flags, mk_vma_flags(__VA_ARGS__))
 
+static __always_inline bool vma_flags_test_single_mask(const vma_flags_t *flags,
+						vma_flags_t flagmask)
+{
+	VM_WARN_ON_ONCE(vma_flags_count(&flagmask) > 1);
+
+	return vma_flags_test_any_mask(flags, flagmask);
+}
+
 static __always_inline void vma_flags_set_mask(vma_flags_t *flags, vma_flags_t to_set)
 {
 	unsigned long *bitmap = flags->__vma_flags;
@@ -1031,6 +1046,12 @@ static __always_inline bool vma_test_all_mask(const struct vm_area_struct *vma,
 #define vma_test_all(vma, ...) \
 	vma_test_all_mask(vma, mk_vma_flags(__VA_ARGS__))
 
+static __always_inline bool
+vma_test_single_mask(const struct vm_area_struct *vma, vma_flags_t flagmask)
+{
+	return vma_flags_test_single_mask(&vma->flags, flagmask);
+}
+
 static __always_inline void vma_set_flags_mask(struct vm_area_struct *vma,
 		vma_flags_t flags)
 {
diff --git a/tools/testing/vma/vma_internal.h b/tools/testing/vma/vma_internal.h
index 0e1121e2ef23..e12ab2c80f95 100644
--- a/tools/testing/vma/vma_internal.h
+++ b/tools/testing/vma/vma_internal.h
@@ -51,6 +51,12 @@ typedef unsigned long	pgprotval_t;
 typedef struct pgprot { pgprotval_t pgprot; } pgprot_t;
 typedef __bitwise unsigned int vm_fault_t;
 
+#define VM_WARN_ON(_expr) (WARN_ON(_expr))
+#define VM_WARN_ON_ONCE(_expr) (WARN_ON_ONCE(_expr))
+#define VM_WARN_ON_VMG(_expr, _vmg) (WARN_ON(_expr))
+#define VM_BUG_ON(_expr) (BUG_ON(_expr))
+#define VM_BUG_ON_VMA(_expr, _vma) (BUG_ON(_expr))
+
 #include "include/stubs.h"
 #include "include/dup.h"
 #include "include/custom.h"
-- 
2.53.0


