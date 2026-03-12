Return-Path: <linux-mips+bounces-13604-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Iz+DUASs2mDSAAAu9opvQ
	(envelope-from <linux-mips+bounces-13604-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 20:21:36 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5748277BAC
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 20:21:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EB9F3240BB4
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 19:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68FC389111;
	Thu, 12 Mar 2026 19:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6fR6eUA"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C2C34CFA7;
	Thu, 12 Mar 2026 19:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343011; cv=none; b=h4/EDnxYj+33c1vYSM4SKdEM1jnr02f7B7XvvTl6/pBlUlXdAcOgIDImKERHl0C7V8ekpoh79J0xN+TPviTq5qgHYeR91GerHHwr4CRbxdEsrrZx7PUr6fwEoX0GrDblnXSI52HdV2xLy4c05rB1pwPDAxju+o0Vqlge+syOUkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343011; c=relaxed/simple;
	bh=PE+79SwCD7fosJSOIvbwHAGwcb45uOKMid7HM/Dh6oA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wmt0+3p76TvdbxmKyIe/zOZFhoF++EjIvegNtwn+Jgb38JJu8uLmPkhlOOuzNIej7NE4bDSBduKv+rOWUbiexUrN0edzEJV1E6Uufd4EA5pVAGdbvTzM5wAC0gnu0BJN3gEEF+ZMXSPBdQJrCyFlBv1sqpAFSJRgpEDUh20GhvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6fR6eUA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBAD4C2BC9E;
	Thu, 12 Mar 2026 19:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773343011;
	bh=PE+79SwCD7fosJSOIvbwHAGwcb45uOKMid7HM/Dh6oA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n6fR6eUA63QunMsWSIzaCYe33LTDMFRPvmipbF6v7wSIJDBNz39ISBMVua7R1BfsU
	 1qo+hM8zksLXKVnZQ5CLvTGbUQNdXU3bhcnlDpA8pmrz/6uCgyScdnOX3xDONteP+6
	 MHR4uV/zQUxbOqm2DLyTW6Ye/fmaOPuLycSRro9LB5UCF+JH7y8RYU2y1uefPZ8XYX
	 M4qp20x+mPsix0yLfdfMRsVEvhAr7vxwh8tJb0a/mFM1R6LI55h0L5+ebOpgpBa16H
	 hzuYVSX8BmNoyD+DxUAQp+H9fAL0q7eUBcKXaBeworsh1q9l3X6DJihddMUvZAJ+yc
	 7IgDFGxav0bbg==
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
Subject: [PATCH 07/20] mm/vma: add append_vma_flags() helper
Date: Thu, 12 Mar 2026 19:16:05 +0000
Message-ID: <eea579f943910c6d41dc6c0cadc33ea3b9b9c89e.1773342102.git.ljs@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-13604-lists,linux-mips=lfdr.de];
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
X-Rspamd-Queue-Id: D5748277BAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In order to be able to efficiently combine VMA flag masks with additional
VMA flag bits we need to extend the concept introduced in mk_vma_flags()
and __mk_vma_flags() by allowing the specification of a VMA flag mask to
append VMA flag bits to.

Update __mk_vma_flags() to allow for this and update mk_vma_flags()
accordingly, and also provide append_vma_flags() to allow for the caller to
specify which VMA flags mask to append to.

Finally, update the VMA flags tests to reflect the change.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 include/linux/mm.h              | 20 ++++++++++++++------
 tools/testing/vma/include/dup.h | 14 +++++++-------
 2 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7acd2f0237eb..5a287e58c1e6 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1049,13 +1049,11 @@ static __always_inline void vma_flags_set_flag(vma_flags_t *flags,
 	__set_bit((__force int)bit, bitmap);
 }
 
-static __always_inline vma_flags_t __mk_vma_flags(size_t count,
-		const vma_flag_t *bits)
+static __always_inline vma_flags_t __mk_vma_flags(vma_flags_t flags,
+		size_t count, const vma_flag_t *bits)
 {
-	vma_flags_t flags;
 	int i;
 
-	vma_flags_clear_all(&flags);
 	for (i = 0; i < count; i++)
 		vma_flags_set_flag(&flags, bits[i]);
 	return flags;
@@ -1071,8 +1069,18 @@ static __always_inline vma_flags_t __mk_vma_flags(size_t count,
  * The compiler cleverly optimises away all of the work and this ends up being
  * equivalent to aggregating the values manually.
  */
-#define mk_vma_flags(...) __mk_vma_flags(COUNT_ARGS(__VA_ARGS__), \
-					 (const vma_flag_t []){__VA_ARGS__})
+#define mk_vma_flags(...) __mk_vma_flags(EMPTY_VMA_FLAGS,			\
+		COUNT_ARGS(__VA_ARGS__), (const vma_flag_t []){__VA_ARGS__})
+
+/*
+ * Helper macro which acts like mk_vma_flags, only appending to a copy of the
+ * specified flags rather than establishing new flags. E.g.:
+ *
+ * vma_flags_t flags = append_vma_flags(VMA_STACK_DEFAULT_FLAGS, VMA_STACK_BIT,
+ *              VMA_ACCOUNT_BIT);
+ */
+#define append_vma_flags(flags, ...) __mk_vma_flags(flags,			\
+		COUNT_ARGS(__VA_ARGS__), (const vma_flag_t []){__VA_ARGS__})
 
 /*
  * Test whether a specific VMA flag is set, e.g.:
diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index 29ff6c97f37a..0d75ac23ac4d 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -851,21 +851,21 @@ static inline void vm_flags_clear(struct vm_area_struct *vma,
 	vma_flags_clear_word(&vma->flags, flags);
 }
 
-static __always_inline vma_flags_t __mk_vma_flags(size_t count,
-		const vma_flag_t *bits)
+static __always_inline vma_flags_t __mk_vma_flags(vma_flags_t flags,
+		size_t count, const vma_flag_t *bits)
 {
-	vma_flags_t flags;
 	int i;
 
-	vma_flags_clear_all(&flags);
 	for (i = 0; i < count; i++)
 		vma_flags_set_flag(&flags, bits[i]);
-
 	return flags;
 }
 
-#define mk_vma_flags(...) __mk_vma_flags(COUNT_ARGS(__VA_ARGS__),	\
-		(const vma_flag_t []){__VA_ARGS__})
+#define mk_vma_flags(...) __mk_vma_flags(EMPTY_VMA_FLAGS,			\
+		COUNT_ARGS(__VA_ARGS__), (const vma_flag_t []){__VA_ARGS__})
+
+#define append_vma_flags(flags, ...) __mk_vma_flags(flags,			\
+		COUNT_ARGS(__VA_ARGS__), (const vma_flag_t []){__VA_ARGS__})
 
 static __always_inline bool vma_flags_test(const vma_flags_t *flags,
 		vma_flag_t bit)
-- 
2.53.0


