Return-Path: <linux-mips+bounces-13605-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOqbLkMRs2mDSAAAu9opvQ
	(envelope-from <linux-mips+bounces-13605-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 20:17:23 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B29F2778E6
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 20:17:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 48C50303D8BB
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 19:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EFA93AA501;
	Thu, 12 Mar 2026 19:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HKZZ1baF"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D36351C1B;
	Thu, 12 Mar 2026 19:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343014; cv=none; b=lxnoKzK89p3q6UkQ1b6ytCpx3ewP+zadJy4pp5fTk3Mkoea0hp5BVxK0T9v/PCbxdPPlz+NbD23q2DgljqV1dc4ov2jPDsiXOx8aV3suxDB1c5kLQpqEKax0bNAH847WPDLaWt5viPf2872IyPEuGPyjPDD3oAD7g8o+tQmV+is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343014; c=relaxed/simple;
	bh=KRWYCGfl5lbWVhLpxZ5/m8TfhMQA6wilm9HLXB+msSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=guYOnXotpoe1W/3i0KnrGSex0UdYCw1t+/oXd1niqumy+Lp5OtyCITZDTyA7gCp2ggrAoWNEglxTM1htVuzeULQJFX4zEsv8hR+dmmavMq7ZP3+Ui35jUM3Rp1XyUc9v7yelnJ7o8HZI7YyB4x/16HzlWYj4IPK8yUZvsuaQ+pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HKZZ1baF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD78C2BCB6;
	Thu, 12 Mar 2026 19:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773343014;
	bh=KRWYCGfl5lbWVhLpxZ5/m8TfhMQA6wilm9HLXB+msSw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HKZZ1baFCEA0tzjGFaVeqWf2HDaTcqvoB759G8Q5c0vtNk65QKPFFb0OOdWERryQY
	 Z3Oz+Kznf8ItIS34XxfiFsfwlsWjWLR+h5CdDLZNZe9BvCWuvWJsQsICOhpd6qgwWV
	 +khw9B/HheqAmqpee+fmPU9+S7iD5GfsB4F4HLtwfkLI/42aZIT9SVfH1Pti6XRnSv
	 aK8563R9HFe4tiVDHAAXgxxOT8G8GXdbYPRuVz2EmFYuDJRou0rDdLcEZYX8Kd/T37
	 e15K9f8C7fYQPjJrUHkUrTlCU077d0Qq+FJ/Rl3mZ++7VcVkyvUgbDsZ32NcKggkfJ
	 7+JNRNBD+FfXw==
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
Subject: [PATCH 08/20] tools/testing/vma: add simple test for append_vma_flags()
Date: Thu, 12 Mar 2026 19:16:06 +0000
Message-ID: <60ad2ccb9e975247ba52748cafb6b988b79a1168.1773342102.git.ljs@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oracle.com,google.com,suse.de,kvack.org,vger.kernel.org,armlinux.org.uk,arm.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,nod.at,cambridgegreys.com,sipsolutions.net,zeniv.linux.org.uk,suse.cz,zte.com.cn,linux.dev,suse.com,paul-moore.com,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13605-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6B29F2778E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a simple test for append_vma_flags() to assert that it behaves as
expected.

Additionally, include the VMA_REMAP_FLAGS definition in the VMA tests to
allow us to use this value in the testing.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 tools/testing/vma/include/dup.h |  3 +++
 tools/testing/vma/tests/vma.c   | 25 +++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index 0d75ac23ac4d..c3be8a2381e1 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -345,6 +345,9 @@ enum {
  */
 #define VM_SPECIAL (VM_IO | VM_DONTEXPAND | VM_PFNMAP | VM_MIXEDMAP)
 
+#define VMA_REMAP_FLAGS mk_vma_flags(VMA_IO_BIT, VMA_PFNMAP_BIT,	\
+				     VMA_DONTEXPAND_BIT, VMA_DONTDUMP_BIT)
+
 #define DEFAULT_MAP_WINDOW	((1UL << 47) - PAGE_SIZE)
 #define TASK_SIZE_LOW		DEFAULT_MAP_WINDOW
 #define TASK_SIZE_MAX		DEFAULT_MAP_WINDOW
diff --git a/tools/testing/vma/tests/vma.c b/tools/testing/vma/tests/vma.c
index feea6d270233..98e465fb1bf2 100644
--- a/tools/testing/vma/tests/vma.c
+++ b/tools/testing/vma/tests/vma.c
@@ -555,6 +555,30 @@ static bool test_vma_flags_and(void)
 	return true;
 }
 
+/* Ensure append_vma_flags() acts as expected. */
+static bool test_append_vma_flags(void)
+{
+	vma_flags_t flags = append_vma_flags(VMA_REMAP_FLAGS, VMA_READ_BIT,
+					     VMA_WRITE_BIT
+#if NUM_VMA_FLAG_BITS > 64
+					     , 64, 65
+#endif
+		);
+
+	ASSERT_FLAGS_SAME(&flags, VMA_IO_BIT, VMA_PFNMAP_BIT,
+			  VMA_DONTEXPAND_BIT, VMA_DONTDUMP_BIT, VMA_READ_BIT,
+			  VMA_WRITE_BIT
+#if NUM_VMA_FLAG_BITS > 64
+					     , 64, 65
+#endif
+		);
+
+	flags = append_vma_flags(EMPTY_VMA_FLAGS, VMA_READ_BIT, VMA_WRITE_BIT);
+	ASSERT_FLAGS_SAME(&flags, VMA_READ_BIT, VMA_WRITE_BIT);
+
+	return true;
+}
+
 static void run_vma_tests(int *num_tests, int *num_fail)
 {
 	TEST(copy_vma);
@@ -569,4 +593,5 @@ static void run_vma_tests(int *num_tests, int *num_fail)
 	TEST(vma_flags_empty);
 	TEST(vma_flags_diff);
 	TEST(vma_flags_and);
+	TEST(append_vma_flags);
 }
-- 
2.53.0


