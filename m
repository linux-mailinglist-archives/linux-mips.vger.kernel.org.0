Return-Path: <linux-mips+bounces-13837-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDVEILGlvWm4/wIAu9opvQ
	(envelope-from <linux-mips+bounces-13837-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 20:53:21 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 374092E0899
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 20:53:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D2658307A9E4
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 19:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D223FB7CD;
	Fri, 20 Mar 2026 19:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vAwxzBvk"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAD33FB07A;
	Fri, 20 Mar 2026 19:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774035571; cv=none; b=BaePm57veoAH89p57lcmaA3LEoXJ08LszPLCkU5hbT3rxrn3VMW6SLP/UVF786j9y9lS6RtRlUwXaevnIeDG7Xcd58tHyK3RkbYfoLawh0oIufmVajG4+DAjdOM4FjaYOa1Qav40YrGgO6fztB35AQljLdfLQp33k2s6GCj17pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774035571; c=relaxed/simple;
	bh=iW8PyaQGY3GlJfRuD9IYEogcwxKab0EzWBI+zvgE1Hk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fnnW/MIGIG4GYVomLPYe6kvzswk17OQCnWNhFGcbHDljvJI69+RdebvQkMmo13YBnkmETss6Zr8sHik0G9/bJPkSuGmc40SCX/tF3cciAnavGF7KRLrcdzCHY8Nrp4f0/AUWTJzvdR2qDjo1lwNd/RUzFXoiVtOTl3ixO1djuEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vAwxzBvk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D70A3C2BCB0;
	Fri, 20 Mar 2026 19:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774035571;
	bh=iW8PyaQGY3GlJfRuD9IYEogcwxKab0EzWBI+zvgE1Hk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vAwxzBvkn0PDDQdIMJjA3kM9WwNqMqvqcP/J1sa7H33MhBf29nqPX0POpKAi6uUiC
	 k7Nnh3gGcOt7WSsX2qDhXvI8T6i4Aep89h+tZMAdiai+sk75Wp7ejlJtaOW/HWNsF5
	 7gESjOmyzzOp2WbZ3Y4IbG/FsefBuko8nq9VtgxXPJDUqZsWLpvXaVty16hltae7cZ
	 nXHC3d/Jfp3RTMocPaHcxgrtme6xOqYFdK+ANYBwoPPDitvFhxmMrjufW1iyJ6Ohto
	 FztcPcOvruBSZ1U2g5aQhkjWOMTDKFqO/N8I3UMyQgvUyWFNvhMnDV/Bwq8EO0r98y
	 oesaEOzggNQ7g==
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
Subject: [PATCH v4 20/25] tools/testing/vma: update VMA tests to test vma_clear_flags[_mask]()
Date: Fri, 20 Mar 2026 19:38:37 +0000
Message-ID: <f5da681d3c33039dd4a838188385796eb8d58373.1774034900.git.ljs@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-13837-lists,linux-mips=lfdr.de];
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
X-Rspamd-Queue-Id: 374092E0899
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The tests have existing flag clearing logic, so simply expand this to use
the new VMA-specific flag clearing helpers.

Also correct some trivial formatting issue in a macro define.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 tools/testing/vma/tests/vma.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/tools/testing/vma/tests/vma.c b/tools/testing/vma/tests/vma.c
index c73c3a565f1d..754a2da06321 100644
--- a/tools/testing/vma/tests/vma.c
+++ b/tools/testing/vma/tests/vma.c
@@ -347,19 +347,20 @@ static bool test_vma_flags_clear(void)
 					, 64
 #endif
 		);
-	struct vm_area_struct vma;
-	struct vm_area_desc desc;
-
-	vma.flags = flags;
-	desc.vma_flags = flags;
+	struct vm_area_struct vma = {
+		.flags = flags,
+	};
+	struct vm_area_desc desc = {
+		.vma_flags = flags,
+	};
 
 	/* Cursory check of _mask() variant, as the helper macros imply. */
 	vma_flags_clear_mask(&flags, mask);
-	vma_flags_clear_mask(&vma.flags, mask);
+	vma_clear_flags_mask(&vma, mask);
 	vma_desc_clear_flags_mask(&desc, mask);
 #if NUM_VMA_FLAG_BITS > 64
 	ASSERT_FALSE(vma_flags_test_any(&flags, VMA_EXEC_BIT, 64));
-	ASSERT_FALSE(vma_flags_test_any(&vma.flags, VMA_EXEC_BIT, 64));
+	ASSERT_FALSE(vma_test_any(&vma, VMA_EXEC_BIT, 64));
 	ASSERT_FALSE(vma_desc_test_any(&desc, VMA_EXEC_BIT, 64));
 	/* Reset. */
 	vma_flags_set(&flags, VMA_EXEC_BIT, 64);
@@ -371,15 +372,15 @@ static bool test_vma_flags_clear(void)
 	 * Clear the flags and assert clear worked, then reset flags back to
 	 * include specified flags.
 	 */
-#define do_test_and_reset(...)					\
-	vma_flags_clear(&flags, __VA_ARGS__);			\
-	vma_flags_clear(&vma.flags, __VA_ARGS__);		\
-	vma_desc_clear_flags(&desc, __VA_ARGS__);		\
-	ASSERT_FALSE(vma_flags_test_any(&flags, __VA_ARGS__));	\
-	ASSERT_FALSE(vma_flags_test_any(&vma.flags, __VA_ARGS__));	\
-	ASSERT_FALSE(vma_desc_test_any(&desc, __VA_ARGS__));	\
-	vma_flags_set(&flags, __VA_ARGS__);			\
-	vma_set_flags(&vma, __VA_ARGS__);			\
+#define do_test_and_reset(...)						\
+	vma_flags_clear(&flags, __VA_ARGS__);				\
+	vma_clear_flags(&vma, __VA_ARGS__);				\
+	vma_desc_clear_flags(&desc, __VA_ARGS__);			\
+	ASSERT_FALSE(vma_flags_test_any(&flags, __VA_ARGS__));		\
+	ASSERT_FALSE(vma_test_any(&vma, __VA_ARGS__));			\
+	ASSERT_FALSE(vma_desc_test_any(&desc, __VA_ARGS__));		\
+	vma_flags_set(&flags, __VA_ARGS__);				\
+	vma_set_flags(&vma, __VA_ARGS__);				\
 	vma_desc_set_flags(&desc, __VA_ARGS__)
 
 	/* Single flags. */
-- 
2.53.0


