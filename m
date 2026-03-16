Return-Path: <linux-mips+bounces-13675-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qH5jB+sCuGlpYAEAu9opvQ
	(envelope-from <linux-mips+bounces-13675-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 14:17:31 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 948D029A286
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 14:17:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DBEF230804DC
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 13:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A15139B483;
	Mon, 16 Mar 2026 13:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TJG/Go8A"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C753988FA;
	Mon, 16 Mar 2026 13:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773666580; cv=none; b=kStqpaktReisameeh2E9f5O9bSWOEOb9IoCK/LcmVo114UrtNNbJT7hsDXIYsDlyCh8kgELja3ywFXFNrbQuQ94V4u8A9nTg7DRD89aCPBJvlsfUx22b+zHKYNUQaXPXUcVRdtAWtJE8ER+aFIZoZ1R3uVpB8tQdP19guPBu2cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773666580; c=relaxed/simple;
	bh=dLJAyLW52YxQ0AN/NeuZQy3GzYiIO3sQ/ClSljBmA2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dyL1z2OavEi77Z0RX2m9qVtQDA/EvxhsPgBohVHS5odEGL73gWukcCbvMILGPI8roVDSH2GQF+ehBHHrHXGUR6OWWP8tE0ByJghVFiDRoKNctu+WQ9DhjBX7KHiom1RBtrdvIWrAmEAf4Q4w+ZcK2PljasNZ0Wr9am8v7U03Q+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TJG/Go8A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4350FC19424;
	Mon, 16 Mar 2026 13:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773666579;
	bh=dLJAyLW52YxQ0AN/NeuZQy3GzYiIO3sQ/ClSljBmA2Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TJG/Go8A1cY8XS5/cAwBFroFXuBNyK85BM7BXdepftLaaH0hgiTtnWt94hTv5NzQk
	 mi9JB6jBKDTXIVd1hpifEwkrt4trzZ01AHPVwLAJZGZsYdYo/sYYijNdcV3kU2ycvb
	 xS3rsbNrAw2IJTDx0eyKMX4KxE17kIEKHD1bLFjVP8xJBSvxRirbu4wU6Ek2CSMghZ
	 IBkA/mfuSfU/btp4YszcI4RKptelvWUc4mAENue7y7fw0OdVRAlzoR+tvmrvu6llBa
	 hjs0IVHsjxs08YA4JEMwdB9gsTNAPwrbsSRB3yRw4iEgqXIW8+N4/BZ0XXiWAtToyu
	 vrXuiockp9v1A==
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
Subject: [PATCH v2 16/23] tools/testing/vma: test vma_flags_count,vma[_flags]_test_single_mask
Date: Mon, 16 Mar 2026 13:08:05 +0000
Message-ID: <140b9b77da1ef463f969cbeb2b5fb25627301cd6.1773665966.git.ljs@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773665966.git.ljs@kernel.org>
References: <cover.1773665966.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oracle.com,google.com,suse.de,kvack.org,vger.kernel.org,armlinux.org.uk,arm.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,nod.at,cambridgegreys.com,sipsolutions.net,zeniv.linux.org.uk,suse.cz,zte.com.cn,linux.dev,suse.com,paul-moore.com,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13675-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[62];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 948D029A286
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update the VMA tests to assert that vma_flags_count() behaves as expected,
as well as vma_flags_test_single_mask() and vma_test_single_mask().

For the test functions we can simply update the existing vma_test(), et
al. test to also test the single_mask variants.

We also add some explicit testing of an empty VMA flag to this test to
ensure this is handled properly.

In order to test vma_flags_count() we simply take an existing set of flags
and gradually remove flags ensuring the count remains as expected
throughout.

We also update the vma[_flags]_test_all() tests to make clear the semantics
that we expect vma[_flags]_test_all(..., EMPTY_VMA_FLAGS) to return true,
as trivially, all flags of none are always set in VMA flags.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 tools/testing/vma/tests/vma.c | 63 ++++++++++++++++++++++++++++++-----
 1 file changed, 54 insertions(+), 9 deletions(-)

diff --git a/tools/testing/vma/tests/vma.c b/tools/testing/vma/tests/vma.c
index 1395d55a1e02..c73c3a565f1d 100644
--- a/tools/testing/vma/tests/vma.c
+++ b/tools/testing/vma/tests/vma.c
@@ -174,10 +174,10 @@ static bool test_vma_flags_word(void)
 /* Ensure that vma_flags_test() and friends works correctly. */
 static bool test_vma_flags_test(void)
 {
-	const vma_flags_t flags = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT,
-					       VMA_EXEC_BIT
+	vma_flags_t flags = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT,
+					 VMA_EXEC_BIT
 #if NUM_VMA_FLAG_BITS > 64
-					       , 64, 65
+					 , 64, 65
 #endif
 		);
 	struct vm_area_desc desc = {
@@ -187,14 +187,18 @@ static bool test_vma_flags_test(void)
 		.flags = flags,
 	};
 
-#define do_test(_flag)					\
-	ASSERT_TRUE(vma_flags_test(&flags, _flag));	\
-	ASSERT_TRUE(vma_test(&vma, _flag));		\
+#define do_test(_flag)							    \
+	ASSERT_TRUE(vma_flags_test(&flags, _flag));			    \
+	ASSERT_TRUE(vma_flags_test_single_mask(&flags, mk_vma_flags(_flag))); \
+	ASSERT_TRUE(vma_test(&vma, _flag));				    \
+	ASSERT_TRUE(vma_test_single_mask(&vma, mk_vma_flags(_flag)));	    \
 	ASSERT_TRUE(vma_desc_test(&desc, _flag))
 
-#define do_test_false(_flag)				\
-	ASSERT_FALSE(vma_flags_test(&flags, _flag));	\
-	ASSERT_FALSE(vma_test(&vma, _flag));		\
+#define do_test_false(_flag)						     \
+	ASSERT_FALSE(vma_flags_test(&flags, _flag));			     \
+	ASSERT_FALSE(vma_flags_test_single_mask(&flags, mk_vma_flags(_flag))); \
+	ASSERT_FALSE(vma_test(&vma, _flag));				     \
+	ASSERT_FALSE(vma_test_single_mask(&vma, mk_vma_flags(_flag)));	     \
 	ASSERT_FALSE(vma_desc_test(&desc, _flag))
 
 	do_test(VMA_READ_BIT);
@@ -212,6 +216,15 @@ static bool test_vma_flags_test(void)
 #undef do_test
 #undef do_test_false
 
+	/* We define the _single_mask() variants to return false if empty. */
+	ASSERT_FALSE(vma_flags_test_single_mask(&flags, EMPTY_VMA_FLAGS));
+	ASSERT_FALSE(vma_test_single_mask(&vma, EMPTY_VMA_FLAGS));
+	/* Even when both flags and tested flag mask are empty! */
+	flags = EMPTY_VMA_FLAGS;
+	vma.flags = EMPTY_VMA_FLAGS;
+	ASSERT_FALSE(vma_flags_test_single_mask(&flags, EMPTY_VMA_FLAGS));
+	ASSERT_FALSE(vma_test_single_mask(&vma, EMPTY_VMA_FLAGS));
+
 	return true;
 }
 
@@ -309,6 +322,10 @@ static bool test_vma_flags_test_any(void)
 	do_test(VMA_READ_BIT, VMA_WRITE_BIT, VMA_EXEC_BIT, 64, 65);
 #endif
 
+	/* Testing all flags against none trivially succeeds. */
+	ASSERT_TRUE(vma_flags_test_all_mask(&flags, EMPTY_VMA_FLAGS));
+	ASSERT_TRUE(vma_test_all_mask(&vma, EMPTY_VMA_FLAGS));
+
 #undef do_test
 #undef do_test_all_true
 #undef do_test_all_false
@@ -592,6 +609,33 @@ static bool test_append_vma_flags(void)
 	return true;
 }
 
+/* Assert that vma_flags_count() behaves as expected. */
+static bool test_vma_flags_count(void)
+{
+	vma_flags_t flags = mk_vma_flags(VMA_READ_BIT, VMA_WRITE_BIT,
+					 VMA_EXEC_BIT
+#if NUM_VMA_FLAG_BITS > 64
+					 , 64, 65
+#endif
+		);
+
+#if NUM_VMA_FLAG_BITS > 64
+	ASSERT_EQ(vma_flags_count(&flags), 5);
+	vma_flags_clear(&flags, 64);
+	ASSERT_EQ(vma_flags_count(&flags), 4);
+	vma_flags_clear(&flags, 65);
+#endif
+	ASSERT_EQ(vma_flags_count(&flags), 3);
+	vma_flags_clear(&flags, VMA_EXEC_BIT);
+	ASSERT_EQ(vma_flags_count(&flags), 2);
+	vma_flags_clear(&flags, VMA_WRITE_BIT);
+	ASSERT_EQ(vma_flags_count(&flags), 1);
+	vma_flags_clear(&flags, VMA_READ_BIT);
+	ASSERT_EQ(vma_flags_count(&flags), 0);
+
+	return true;
+}
+
 static void run_vma_tests(int *num_tests, int *num_fail)
 {
 	TEST(copy_vma);
@@ -607,4 +651,5 @@ static void run_vma_tests(int *num_tests, int *num_fail)
 	TEST(vma_flags_diff);
 	TEST(vma_flags_and);
 	TEST(append_vma_flags);
+	TEST(vma_flags_count);
 }
-- 
2.53.0


