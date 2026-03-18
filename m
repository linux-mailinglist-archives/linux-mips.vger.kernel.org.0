Return-Path: <linux-mips+bounces-13755-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFcZOdXNummfcAIAu9opvQ
	(envelope-from <linux-mips+bounces-13755-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 17:07:49 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1442BEFFD
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 17:07:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4AB3431BD183
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 15:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D963E558A;
	Wed, 18 Mar 2026 15:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IU2OGKrp"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5522E3BFE2D;
	Wed, 18 Mar 2026 15:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849046; cv=none; b=FlrXi3l8yBAX7CPOprV9S10Xi2u2T4/+WRg4xTRDAfep5PGlg9DBSiKzS4JuS8RBb+dQYkICasaDOycDPyE79YFvjFNrXGqsOURri2fzmNr3EOcXTUMacncKWYDnBQcJMfr5fnZ+6kkVCpuzxk6csYfP09hyyzeQBv59qudBzZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849046; c=relaxed/simple;
	bh=NUcYO8sRiJXczuLfZ/k9Sxo/9SW/SjvpmCKwjwqD0qg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZaczcQOwGUoFtxQSD5pQOdfsmT+2R55xE2g52vGfqpBYz5o4iiV+pb+fH74/6Y7KAvEgEtmbJihYx6tnG87HFS7ZlzGm8uYL8Lj4V0dZx2H9AbP8HQ7upp34qzQU27n+Py5BOWszxu3hAcOP4heaw9noquijGhqh943NHYRXbck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IU2OGKrp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2433EC19421;
	Wed, 18 Mar 2026 15:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773849045;
	bh=NUcYO8sRiJXczuLfZ/k9Sxo/9SW/SjvpmCKwjwqD0qg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IU2OGKrp5WnjkvaT0XX9nFzCAkDTe+oQNwQaS2KDuuzt7hHTA3wP3XTVRB/Umkdjy
	 Lc7ULv7Coel1AZkPJ8Cvmi099u5/6F/UeljrIwwF9FNAJWyyGhYhG4C68fdR2TK93Y
	 qN52E95g8GDFzx4qNzv+pp3zd9kAsdTLjR4BNMgYZmoLvHEsWkOpgXAzkudSxMlM25
	 raeQJxcbfyfTUj2m1TaI44ErZT0TBD/ZwxNEs/KVws2n34EoDhKOucRvPr3edRo0F0
	 hhBoG3tuJduaVI8HzgBSs9yv+zSHbxdS//ES8UZKcR4H6LkLHOvEAB4K7Iq2q9bscL
	 FXqrJg9PuhzRw==
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
Subject: [PATCH v3 02/23] tools/testing/vma: add unit tests flag empty, diff_pair, and[_mask]
Date: Wed, 18 Mar 2026 15:50:13 +0000
Message-ID: <038076638f6e828fa286cd5d19653506f56da8b4.1773846935.git.ljs@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oracle.com,google.com,suse.de,kvack.org,vger.kernel.org,armlinux.org.uk,arm.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,nod.at,cambridgegreys.com,sipsolutions.net,zeniv.linux.org.uk,suse.cz,zte.com.cn,linux.dev,suse.com,paul-moore.com,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13755-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_GT_50(0.00)[62];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-0.961];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9E1442BEFFD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add VMA unit tests to assert that:

* vma_flags_empty()
* vma_flags_diff_pair()
* vma_flags_and_mask()
* vma_flags_and()

All function as expected.

In additional to the added tests, in order to make testing easier, add
vma_flags_same_mask() and vma_flags_same() for testing only.  If/when
these are required in kernel code, they can be moved over.

Also add ASSERT_FLAGS_[NOT_]SAME[_MASK](), ASSERT_FLAGS_[NON]EMPTY() test
helpers to make asserting flag state easier and more convenient.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 tools/testing/vma/include/custom.h |  12 +++
 tools/testing/vma/shared.h         |  18 ++++
 tools/testing/vma/tests/vma.c      | 137 +++++++++++++++++++++++++++++
 3 files changed, 167 insertions(+)

diff --git a/tools/testing/vma/include/custom.h b/tools/testing/vma/include/custom.h
index 6c62a38a2f6f..578045caf5ca 100644
--- a/tools/testing/vma/include/custom.h
+++ b/tools/testing/vma/include/custom.h
@@ -120,3 +120,15 @@ static inline unsigned long vma_kernel_pagesize(struct vm_area_struct *vma)
 {
 	return PAGE_SIZE;
 }
+
+/* Place here until needed in the kernel code. */
+static __always_inline bool vma_flags_same_mask(vma_flags_t *flags,
+						vma_flags_t flags_other)
+{
+	const unsigned long *bitmap = flags->__vma_flags;
+	const unsigned long *bitmap_other = flags_other.__vma_flags;
+
+	return bitmap_equal(bitmap, bitmap_other, NUM_VMA_FLAG_BITS);
+}
+#define vma_flags_same(flags, ...) \
+	vma_flags_same_mask(flags, mk_vma_flags(__VA_ARGS__))
diff --git a/tools/testing/vma/shared.h b/tools/testing/vma/shared.h
index 6c64211cfa22..e2e5d6ef6bdd 100644
--- a/tools/testing/vma/shared.h
+++ b/tools/testing/vma/shared.h
@@ -35,6 +35,24 @@
 #define ASSERT_EQ(_val1, _val2) ASSERT_TRUE((_val1) == (_val2))
 #define ASSERT_NE(_val1, _val2) ASSERT_TRUE((_val1) != (_val2))
 
+#define ASSERT_FLAGS_SAME_MASK(_flags, _flags_other) \
+	ASSERT_TRUE(vma_flags_same_mask((_flags), (_flags_other)))
+
+#define ASSERT_FLAGS_NOT_SAME_MASK(_flags, _flags_other) \
+	ASSERT_FALSE(vma_flags_same_mask((_flags), (_flags_other)))
+
+#define ASSERT_FLAGS_SAME(_flags, ...) \
+	ASSERT_TRUE(vma_flags_same(_flags, __VA_ARGS__))
+
+#define ASSERT_FLAGS_NOT_SAME(_flags, ...) \
+	ASSERT_FALSE(vma_flags_same(_flags, __VA_ARGS__))
+
+#define ASSERT_FLAGS_EMPTY(_flags) \
+	ASSERT_TRUE(vma_flags_empty(_flags))
+
+#define ASSERT_FLAGS_NONEMPTY(_flags) \
+	ASSERT_FALSE(vma_flags_empty(_flags))
+
 #define IS_SET(_val, _flags) ((_val & _flags) == _flags)
 
 extern bool fail_prealloc;
diff --git a/tools/testing/vma/tests/vma.c b/tools/testing/vma/tests/vma.c
index f6edd44f4e9e..4a7b11a8a285 100644
--- a/tools/testing/vma/tests/vma.c
+++ b/tools/testing/vma/tests/vma.c
@@ -363,6 +363,140 @@ static bool test_vma_flags_clear(void)
 	return true;
 }
 
+/* Ensure that vma_flags_empty() works correctly. */
+static bool test_vma_flags_empty(void)
+{
+	vma_flags_t flags = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT,
+					 VMA_EXEC_BIT, 64, 65);
+
+	ASSERT_FLAGS_NONEMPTY(&flags);
+	vma_flags_clear(&flags, VMA_READ_BIT, VMA_WRITE_BIT, VMA_EXEC_BIT);
+#if NUM_VMA_FLAG_BITS > 64
+	ASSERT_FLAGS_NONEMPTY(&flags);
+	vma_flags_clear(&flags, 64, 65);
+	ASSERT_FLAGS_EMPTY(&flags);
+#else
+	ASSERT_FLAGS_EMPTY(&flags);
+#endif
+
+	return true;
+}
+
+/* Ensure that vma_flags_diff_pair() works correctly. */
+static bool test_vma_flags_diff(void)
+{
+	vma_flags_t flags1 = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT,
+					  VMA_EXEC_BIT, 64, 65);
+	vma_flags_t flags2 = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT,
+					  VMA_EXEC_BIT, VMA_MAYWRITE_BIT,
+					  VMA_MAYEXEC_BIT, 64, 65, 66, 67);
+	vma_flags_t diff = vma_flags_diff_pair(&flags1, &flags2);
+
+#if NUM_VMA_FLAG_BITS > 64
+	ASSERT_FLAGS_SAME(&diff, VMA_MAYWRITE_BIT, VMA_MAYEXEC_BIT, 66, 67);
+#else
+	ASSERT_FLAGS_SAME(&diff, VMA_MAYWRITE_BIT, VMA_MAYEXEC_BIT);
+#endif
+	/* Should be the same even if re-ordered. */
+	diff = vma_flags_diff_pair(&flags2, &flags1);
+#if NUM_VMA_FLAG_BITS > 64
+	ASSERT_FLAGS_SAME(&diff, VMA_MAYWRITE_BIT, VMA_MAYEXEC_BIT, 66, 67);
+#else
+	ASSERT_FLAGS_SAME(&diff, VMA_MAYWRITE_BIT, VMA_MAYEXEC_BIT);
+#endif
+
+	/* Should be no difference when applied against themselves. */
+	diff = vma_flags_diff_pair(&flags1, &flags1);
+	ASSERT_FLAGS_EMPTY(&diff);
+	diff = vma_flags_diff_pair(&flags2, &flags2);
+	ASSERT_FLAGS_EMPTY(&diff);
+
+	/* One set of flags against an empty one should equal the original. */
+	flags2 = EMPTY_VMA_FLAGS;
+	diff = vma_flags_diff_pair(&flags1, &flags2);
+	ASSERT_FLAGS_SAME_MASK(&diff, flags1);
+
+	/* A subset should work too. */
+	flags2 = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT);
+	diff = vma_flags_diff_pair(&flags1, &flags2);
+#if NUM_VMA_FLAG_BITS > 64
+	ASSERT_FLAGS_SAME(&diff, VMA_EXEC_BIT, 64, 65);
+#else
+	ASSERT_FLAGS_SAME(&diff, VMA_EXEC_BIT);
+#endif
+
+	return true;
+}
+
+/* Ensure that vma_flags_and() and friends work correctly. */
+static bool test_vma_flags_and(void)
+{
+	vma_flags_t flags1 = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT,
+					  VMA_EXEC_BIT, 64, 65);
+	vma_flags_t flags2 = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT,
+					  VMA_EXEC_BIT, VMA_MAYWRITE_BIT,
+					  VMA_MAYEXEC_BIT, 64, 65, 66, 67);
+	vma_flags_t flags3 = mk_vma_flags(VMA_IO_BIT, VMA_MAYBE_GUARD_BIT,
+					  68, 69);
+	vma_flags_t and = vma_flags_and_mask(&flags1, flags2);
+
+#if NUM_VMA_FLAG_BITS > 64
+	ASSERT_FLAGS_SAME(&and, VMA_READ_BIT, VMA_WRITE_BIT, VMA_EXEC_BIT,
+			  64, 65);
+#else
+	ASSERT_FLAGS_SAME(&and, VMA_READ_BIT, VMA_WRITE_BIT, VMA_EXEC_BIT);
+#endif
+
+	and = vma_flags_and_mask(&flags1, flags1);
+	ASSERT_FLAGS_SAME_MASK(&and, flags1);
+
+	and = vma_flags_and_mask(&flags2, flags2);
+	ASSERT_FLAGS_SAME_MASK(&and, flags2);
+
+	and = vma_flags_and_mask(&flags1, flags3);
+	ASSERT_FLAGS_EMPTY(&and);
+	and = vma_flags_and_mask(&flags2, flags3);
+	ASSERT_FLAGS_EMPTY(&and);
+
+	and = vma_flags_and(&flags1, VMA_READ_BIT);
+	ASSERT_FLAGS_SAME(&and, VMA_READ_BIT);
+
+	and = vma_flags_and(&flags1, VMA_READ_BIT, VMA_WRITE_BIT);
+	ASSERT_FLAGS_SAME(&and, VMA_READ_BIT, VMA_WRITE_BIT);
+
+	and = vma_flags_and(&flags1, VMA_READ_BIT, VMA_WRITE_BIT, VMA_EXEC_BIT);
+	ASSERT_FLAGS_SAME(&and, VMA_READ_BIT, VMA_WRITE_BIT, VMA_EXEC_BIT);
+
+#if NUM_VMA_FLAG_BITS > 64
+	and = vma_flags_and(&flags1, VMA_READ_BIT, VMA_WRITE_BIT, VMA_EXEC_BIT,
+			    64);
+	ASSERT_FLAGS_SAME(&and, VMA_READ_BIT, VMA_WRITE_BIT, VMA_EXEC_BIT, 64);
+
+	and = vma_flags_and(&flags1, VMA_READ_BIT, VMA_WRITE_BIT, VMA_EXEC_BIT,
+			    64, 65);
+	ASSERT_FLAGS_SAME(&and, VMA_READ_BIT, VMA_WRITE_BIT, VMA_EXEC_BIT, 64,
+			  65);
+#endif
+
+	/* And against some missing values. */
+
+	and = vma_flags_and(&flags1, VMA_READ_BIT, VMA_WRITE_BIT, VMA_EXEC_BIT,
+			    VMA_IO_BIT);
+	ASSERT_FLAGS_SAME(&and, VMA_READ_BIT, VMA_WRITE_BIT, VMA_EXEC_BIT);
+
+	and = vma_flags_and(&flags1, VMA_READ_BIT, VMA_WRITE_BIT, VMA_EXEC_BIT,
+			    VMA_IO_BIT, VMA_RAND_READ_BIT);
+	ASSERT_FLAGS_SAME(&and, VMA_READ_BIT, VMA_WRITE_BIT, VMA_EXEC_BIT);
+
+#if NUM_VMA_FLAG_BITS > 64
+	and = vma_flags_and(&flags1, VMA_READ_BIT, VMA_WRITE_BIT, VMA_EXEC_BIT,
+			    VMA_IO_BIT, VMA_RAND_READ_BIT, 69);
+	ASSERT_FLAGS_SAME(&and, VMA_READ_BIT, VMA_WRITE_BIT, VMA_EXEC_BIT);
+#endif
+
+	return true;
+}
+
 static void run_vma_tests(int *num_tests, int *num_fail)
 {
 	TEST(copy_vma);
@@ -372,4 +506,7 @@ static void run_vma_tests(int *num_tests, int *num_fail)
 	TEST(vma_flags_test);
 	TEST(vma_flags_test_any);
 	TEST(vma_flags_clear);
+	TEST(vma_flags_empty);
+	TEST(vma_flags_diff);
+	TEST(vma_flags_and);
 }
-- 
2.53.0


