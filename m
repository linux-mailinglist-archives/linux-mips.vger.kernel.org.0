Return-Path: <linux-mips+bounces-13842-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJiKDhmnvWkAAAMAu9opvQ
	(envelope-from <linux-mips+bounces-13842-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 20:59:21 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 160612E0A64
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 20:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8FDC430D79D0
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 19:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA043FE644;
	Fri, 20 Mar 2026 19:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YNEQNMxC"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56817346E5A;
	Fri, 20 Mar 2026 19:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774035582; cv=none; b=Js2SQNDkfdWHyncQC5EWHl0uxhsJP052rbWPrDRukt4JiRoBkTGFR0SK6lg+BOSHFL4aOEh+SwjVg8QkTIp35LGmqszz0lzSAIcPBWbdHYEweKzv1MFqHpxS0ZE5mNbkZBovieWu9l+jWoqP6G2RxK7YL2ataMxyWAR1tyw8SZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774035582; c=relaxed/simple;
	bh=Zhv1fm6PGlE9I5DuXJBB0cLrVMXpxk9UQr3R6GGX2pM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JwWgRp3ickgLYCvOb6CgX3QNNeFe2v1bgHym65o8E5CiH5hdcXv88keHIB7XcAitVAk43qSLKUBmJu89ONe3WKR8TNu/+5CMHOpZ00XChpx5xo7Cg6pXdksV+fcuEQQgkkeoVTS6HVzK2reR6SObAxqLH/61BCGovccBi4N7OL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YNEQNMxC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57BFC2BCB4;
	Fri, 20 Mar 2026 19:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774035582;
	bh=Zhv1fm6PGlE9I5DuXJBB0cLrVMXpxk9UQr3R6GGX2pM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YNEQNMxCWbltp4ulEcA/1pi0w9rAVKrTGQS8+v4PLs+aFYEzztK3IIefy1UFIkuOR
	 rTDQcWY0SioZrCgW7IXmcLKciwKlGXqabHTR/PcPYieqDzBPZ60XqkkxP5s59rZg1A
	 xan9A1ghdC6iIBLyXGYzuD8n0RYMLN+9ymJTqE/THx9LECKRwfgZYXza+nT86iX/k6
	 8p+GKYR5eQNho+Uv+ID2mHduFoCDPEsGOedTudZT9YZBqkya5QuQ6VKpjiS64ChS4F
	 YZzIJnzVkO0R7vQNfDQ1O4zJG1AtpdIzGw2MrsNefJt4teIMi0TcMEfp1mYeAj2lCz
	 AoksKkIoUqu0w==
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
Subject: [PATCH v4 25/25] mm: simplify VMA flag tests of excluded flags
Date: Fri, 20 Mar 2026 19:38:42 +0000
Message-ID: <d395c5dd837a9864f5efcec42175910afbe3ce73.1774034900.git.ljs@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oracle.com,google.com,suse.de,kvack.org,vger.kernel.org,armlinux.org.uk,arm.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,nod.at,cambridgegreys.com,sipsolutions.net,zeniv.linux.org.uk,suse.cz,zte.com.cn,linux.dev,suse.com,paul-moore.com,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13842-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 160612E0A64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We have implemented flag mask comparisons of the form:

if ((vm_flags & (VM_FOO|VM_BAR|VM_BAZ) == VM_FOO) { ... }

Like-for-like in the code using a bitwise-and mask via vma_flags_and() and
using vma_flags_same() to ensure the final result equals only the required
flag value.

This is fine but confusing, make things clearer by instead explicitly
excluding undesired flags and including the desired one via tests of the
form:

	if (vma_flags_test(&flags, VMA_FOO_BIT) &&
	    !vma_flags_test_any(&flags, VMA_BAR_BIT, VMA_BAZ_BIT)) { ... }

Which makes it easier to understand what is going on.

No functional change intended.

Suggested-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 mm/mprotect.c | 12 ++++--------
 mm/vma.c      |  7 +++----
 mm/vma.h      |  6 ++----
 3 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/mm/mprotect.c b/mm/mprotect.c
index 007d9a72b2f0..110d47a36d4b 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -784,14 +784,10 @@ mprotect_fixup(struct vma_iterator *vmi, struct mmu_gather *tlb,
 	 * Private VM_LOCKED VMA becoming writable: trigger COW to avoid major
 	 * fault on access.
 	 */
-	if (vma_flags_test(&new_vma_flags, VMA_WRITE_BIT)) {
-		const vma_flags_t mask =
-			vma_flags_and(&old_vma_flags, VMA_WRITE_BIT,
-				      VMA_SHARED_BIT, VMA_LOCKED_BIT);
-
-		if (vma_flags_same(&mask, VMA_LOCKED_BIT))
-			populate_vma_page_range(vma, start, end, NULL);
-	}
+	if (vma_flags_test(&new_vma_flags, VMA_WRITE_BIT) &&
+	    vma_flags_test(&old_vma_flags, VMA_LOCKED_BIT) &&
+	    !vma_flags_test_any(&old_vma_flags, VMA_WRITE_BIT, VMA_SHARED_BIT))
+		populate_vma_page_range(vma, start, end, NULL);
 
 	vm_stat_account(mm, vma_flags_to_legacy(old_vma_flags), -nrpages);
 	newflags = vma_flags_to_legacy(new_vma_flags);
diff --git a/mm/vma.c b/mm/vma.c
index c335f989586f..a4b30a069153 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -2343,7 +2343,6 @@ void mm_drop_all_locks(struct mm_struct *mm)
 static bool accountable_mapping(struct mmap_state *map)
 {
 	const struct file *file = map->file;
-	vma_flags_t mask;
 
 	/*
 	 * hugetlb has its own accounting separate from the core VM
@@ -2352,9 +2351,9 @@ static bool accountable_mapping(struct mmap_state *map)
 	if (file && is_file_hugepages(file))
 		return false;
 
-	mask = vma_flags_and(&map->vma_flags, VMA_NORESERVE_BIT, VMA_SHARED_BIT,
-			     VMA_WRITE_BIT);
-	return vma_flags_same(&mask, VMA_WRITE_BIT);
+	return vma_flags_test(&map->vma_flags, VMA_WRITE_BIT) &&
+		!vma_flags_test_any(&map->vma_flags, VMA_NORESERVE_BIT,
+				    VMA_SHARED_BIT);
 }
 
 /*
diff --git a/mm/vma.h b/mm/vma.h
index adc18f7dd9f1..1bfe7e47f6be 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -529,10 +529,8 @@ static inline bool is_data_mapping(vm_flags_t flags)
 
 static inline bool is_data_mapping_vma_flags(const vma_flags_t *vma_flags)
 {
-	const vma_flags_t mask = vma_flags_and(vma_flags,
-			VMA_WRITE_BIT, VMA_SHARED_BIT, VMA_STACK_BIT);
-
-	return vma_flags_same(&mask, VMA_WRITE_BIT);
+	return vma_flags_test(vma_flags, VMA_WRITE_BIT) &&
+		!vma_flags_test_any(vma_flags, VMA_SHARED_BIT, VMA_STACK_BIT);
 }
 
 static inline void vma_iter_config(struct vma_iterator *vmi,
-- 
2.53.0


