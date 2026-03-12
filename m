Return-Path: <linux-mips+bounces-13607-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DbNKqcSs2maSAAAu9opvQ
	(envelope-from <linux-mips+bounces-13607-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 20:23:19 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9F6277CC5
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 20:23:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45BAD303D30C
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 19:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4CF4014BB;
	Thu, 12 Mar 2026 19:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cEiK7/n4"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E634A40149E;
	Thu, 12 Mar 2026 19:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343019; cv=none; b=jxUoGNpIEZPwp+meN/F2O3I0tbhj/VMZzO5DN2PKIGBSkw1KftPQ0qb1jKZa6hwPzQo0NESCyTl5auh1w2TfqJ2w8KejiOpzXQAFVJPjhpX5Hm2ye+e3QiyY/T70swF5I9Rf470zJ/bB+6zFakLGMCQOGkmrIu6s0mtHusCL0s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343019; c=relaxed/simple;
	bh=cMZvtYTbVi8gGI62iqsWZ4caZrMQ/fPLlqyhjNcRyx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G0fOssk0fcbAlnjlSL1pjpAB2niW50Ela1YI8Lk4ZHTZb/ydmhOwd+pN1CDprc1Wz7Egc/17s4jiBUeQCU28yW8tPQHzugOd0+2ECGtz0GQrkI+B2o2h6Y7KidjWI/Kpvg/+gMqtniIygLWfo6tTTv4I8OZp50ZRYz9Zvg/hHrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cEiK7/n4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 126E0C2BC9E;
	Thu, 12 Mar 2026 19:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773343018;
	bh=cMZvtYTbVi8gGI62iqsWZ4caZrMQ/fPLlqyhjNcRyx0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cEiK7/n40R+U6XNkiSalA/AXJ/bEgYclxYDzCqR94yWMygwmC794VCL0NxoNYMt3J
	 RHgWYcxQkKel2D7y5Qt7KDsDDMbbnor8tS00TxPxTu7yixFOVnFjv/PAKh+RDo3tpd
	 yGc6lmIpIhzsiJVtCyAB02NBMWdKtc6jRMZms3t37fq7iqSAm8xvmcKPPar1qbfOd9
	 EvzQJ8XXrWFAYsPwnjWKyAaJA6DLfoLru6ENVdQxEMDyebpaZ7Ji0O9VLo8T3kTXXo
	 yolKRFYDkMz5uAmNg47v7Mny0fse4ZkcVEuNAaoLI86leo+dqL+SZpfMRoIRQSV5f/
	 wEw5+9/hlVO1A==
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
Subject: [PATCH 10/20] mm/vma: introduce vma_flags_same[_mask/_pair]()
Date: Thu, 12 Mar 2026 19:16:08 +0000
Message-ID: <64129ea327a7280732291e3481f1fd138aaf4caa.1773342102.git.ljs@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oracle.com,google.com,suse.de,kvack.org,vger.kernel.org,armlinux.org.uk,arm.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,nod.at,cambridgegreys.com,sipsolutions.net,zeniv.linux.org.uk,suse.cz,zte.com.cn,linux.dev,suse.com,paul-moore.com,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13607-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 1A9F6277CC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add helpers to determine if two sets of VMA flags are precisely the same,
that is - that every flag set one is set in another, and neither contain
any flags not set in the other.

We also introduce vma_flags_same_pair() for cases where we want to compare
two sets of VMA flags which are both non-const values.

Also update the VMA tests to reflect the change, we already implicitly test
that this functions correctly having used it for testing purposes
previously.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 include/linux/mm.h                 | 28 ++++++++++++++++++++++++++++
 tools/testing/vma/include/custom.h | 12 ------------
 tools/testing/vma/include/dup.h    | 21 +++++++++++++++++++++
 3 files changed, 49 insertions(+), 12 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 2c16c744d49d..33d0c2af2c75 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1209,6 +1209,34 @@ static __always_inline vma_flags_t vma_flags_diff_pair(const vma_flags_t *flags,
 	return dst;
 }
 
+/* Determine if flags and flags_other have precisely the same flags set. */
+static __always_inline bool vma_flags_same_pair(const vma_flags_t *flags,
+						const vma_flags_t *flags_other)
+{
+	const unsigned long *bitmap = flags->__vma_flags;
+	const unsigned long *bitmap_other = flags_other->__vma_flags;
+
+	return bitmap_equal(bitmap, bitmap_other, NUM_VMA_FLAG_BITS);
+}
+
+/* Determine if flags and flags_other have precisely the same flags set.  */
+static __always_inline bool vma_flags_same_mask(const vma_flags_t *flags,
+						vma_flags_t flags_other)
+{
+	const unsigned long *bitmap = flags->__vma_flags;
+	const unsigned long *bitmap_other = flags_other.__vma_flags;
+
+	return bitmap_equal(bitmap, bitmap_other, NUM_VMA_FLAG_BITS);
+}
+
+/*
+ * Helper macro to determine if only the specific flags are set, e.g.:
+ *
+ * if (vma_flags_same(&flags, VMA_WRITE_BIT) { ... }
+ */
+#define vma_flags_same(flags, ...) \
+	vma_flags_same_mask(flags, mk_vma_flags(__VA_ARGS__))
+
 /*
  * Helper to test that ALL specified flags are set in a VMA.
  *
diff --git a/tools/testing/vma/include/custom.h b/tools/testing/vma/include/custom.h
index 433b3396c281..92fe156ed7d6 100644
--- a/tools/testing/vma/include/custom.h
+++ b/tools/testing/vma/include/custom.h
@@ -99,17 +99,5 @@ static inline void vma_lock_init(struct vm_area_struct *vma, bool reset_refcnt)
 	if (reset_refcnt)
 		refcount_set(&vma->vm_refcnt, 0);
 }
-
-/* Place here until needed in the kernel code. */
-static __always_inline bool vma_flags_same_mask(vma_flags_t *flags,
-						vma_flags_t flags_other)
-{
-	const unsigned long *bitmap = flags->__vma_flags;
-	const unsigned long *bitmap_other = flags_other.__vma_flags;
-
-	return bitmap_equal(bitmap, bitmap_other, NUM_VMA_FLAG_BITS);
-}
-#define vma_flags_same(flags, ...) \
-	vma_flags_same_mask(flags, mk_vma_flags(__VA_ARGS__))
 #define VMA_SPECIAL_FLAGS mk_vma_flags(VMA_IO_BIT, VMA_DONTEXPAND_BIT, \
 				       VMA_PFNMAP_BIT, VMA_MIXEDMAP_BIT)
diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index c3be8a2381e1..fa2df96f9dee 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -951,6 +951,27 @@ static __always_inline vma_flags_t vma_flags_diff_pair(const vma_flags_t *flags,
 	return dst;
 }
 
+static __always_inline bool vma_flags_same_pair(const vma_flags_t *flags,
+						const vma_flags_t *flags_other)
+{
+	const unsigned long *bitmap = flags->__vma_flags;
+	const unsigned long *bitmap_other = flags_other->__vma_flags;
+
+	return bitmap_equal(bitmap, bitmap_other, NUM_VMA_FLAG_BITS);
+}
+
+static __always_inline bool vma_flags_same_mask(const vma_flags_t *flags,
+						vma_flags_t flags_other)
+{
+	const unsigned long *bitmap = flags->__vma_flags;
+	const unsigned long *bitmap_other = flags_other.__vma_flags;
+
+	return bitmap_equal(bitmap, bitmap_other, NUM_VMA_FLAG_BITS);
+}
+
+#define vma_flags_same(flags, ...) \
+	vma_flags_same_mask(flags, mk_vma_flags(__VA_ARGS__))
+
 static inline bool vma_test_all_mask(const struct vm_area_struct *vma,
 				     vma_flags_t flags)
 {
-- 
2.53.0


