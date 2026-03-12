Return-Path: <linux-mips+bounces-13606-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDVZKMkRs2mDSAAAu9opvQ
	(envelope-from <linux-mips+bounces-13606-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 20:19:37 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDFC277AA0
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 20:19:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D59DE30492CB
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 19:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA23D3AC0C5;
	Thu, 12 Mar 2026 19:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n0QPCRke"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A368B3AB28C;
	Thu, 12 Mar 2026 19:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343016; cv=none; b=pUZHULJRvCCqwcFkauteudlbihA8Gy8rthaGbs1jYlUrcVJ3HXox4jNssXf5f2YFazcnK20TxGMvZvO2mQKmGNaPlUTW1HMCJJQom9SsuPMSjyvV3O1z7xdn4P+l9HwUy3VHDw8A2h4Z3n33I0gc2QrrqFdngb+c6Pma7i2uGdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343016; c=relaxed/simple;
	bh=+e1g977jTwjB+zEC2CJ+9F2tdTBXCV682f8unTTGMIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PNNLJi0S9TpXq50ZO/vvTcKXQ88YK1+mgGQTbetgRRRbmJ1+tnt117WVQsQ5Iij6FnFbjAzRa/IqDBHc7VWWq9cxfMeLlUJy0nsn+5MSgTua6qCaSS7a1iegfaAPfRCyusCJY4VZ6j9YLxcTFTzDVWMlUePRVsUN4aC1/lXzXoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n0QPCRke; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2682C19425;
	Thu, 12 Mar 2026 19:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773343016;
	bh=+e1g977jTwjB+zEC2CJ+9F2tdTBXCV682f8unTTGMIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n0QPCRkeZvOSpKttJbEMNGISp72NEhokKKRJJynYNTBZF0zDW4IGMN6vFnvuI0AeL
	 3EHrqxJ/4P1fH7oHlI0ZTp/YdO/rxVan/+0cHwGZOFjKvhCEuJOKVfWPsytnz1UYcQ
	 /ketSHre3DxPHmd7Zqlvad/UzaNh80MG0UQsGOE++mK2lbfcuvbsOIwyTdc1bKeZEv
	 ploIKrt7Ql3mhXhW9mNao+RPmeJnsKqDzTsd3v9UQ7FrVEOWe4NFJC1fmr6CsvmvN9
	 yrLf9PDi2Jf3ksfsXwZzcREwtaTz8b4npfCrCiDMeTxUmM2KOj5zs1ynl/P5gBf7jE
	 mEU03T7+JW3yw==
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
Subject: [PATCH 09/20] mm: unexport vm_brk_flags() and eliminate vm_flags parameter
Date: Thu, 12 Mar 2026 19:16:07 +0000
Message-ID: <d1b222f47c2e52e6bd2b5b077c27ce27913abac3.1773342102.git.ljs@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oracle.com,google.com,suse.de,kvack.org,vger.kernel.org,armlinux.org.uk,arm.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,nod.at,cambridgegreys.com,sipsolutions.net,zeniv.linux.org.uk,suse.cz,zte.com.cn,linux.dev,suse.com,paul-moore.com,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13606-lists,linux-mips=lfdr.de];
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
X-Rspamd-Queue-Id: BBDFC277AA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This function is only used by elf_load(), and that is a static function
that doesn't need an exported symbol to invoke an internal function, so
un-EXPORT_SYMBOLS() it.

Also, the vm_flags parameter is unnecessary, as we only ever set VM_EXEC,
so simply make this parameter a boolean.

While we're here, clean up the mm.h definitions for the various vm_xxx()
helpers so we actually specify parameter names and elide the redundant
extern's.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 fs/binfmt_elf.c    |  3 +--
 include/linux/mm.h | 12 ++++++------
 mm/mmap.c          |  8 ++------
 3 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index fb857faaf0d6..16a56b6b3f6c 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -453,14 +453,13 @@ static unsigned long elf_load(struct file *filep, unsigned long addr,
 		zero_end = ELF_PAGEALIGN(zero_end);
 
 		error = vm_brk_flags(zero_start, zero_end - zero_start,
-				     prot & PROT_EXEC ? VM_EXEC : 0);
+				     prot & PROT_EXEC);
 		if (error)
 			map_addr = error;
 	}
 	return map_addr;
 }
 
-
 static unsigned long total_mapping_size(const struct elf_phdr *phdr, int nr)
 {
 	elf_addr_t min_addr = -1;
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 5a287e58c1e6..2c16c744d49d 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3985,12 +3985,12 @@ static inline void mm_populate(unsigned long addr, unsigned long len) {}
 #endif
 
 /* This takes the mm semaphore itself */
-extern int __must_check vm_brk_flags(unsigned long, unsigned long, unsigned long);
-extern int vm_munmap(unsigned long, size_t);
-extern unsigned long __must_check vm_mmap(struct file *, unsigned long,
-        unsigned long, unsigned long,
-        unsigned long, unsigned long);
-extern unsigned long __must_check vm_mmap_shadow_stack(unsigned long addr,
+int __must_check vm_brk_flags(unsigned long addr, unsigned long request, bool is_exec);
+int vm_munmap(unsigned long start, size_t len);
+unsigned long __must_check vm_mmap(struct file *file, unsigned long addr,
+		unsigned long len, unsigned long prot,
+		unsigned long flag, unsigned long offset);
+unsigned long __must_check vm_mmap_shadow_stack(unsigned long addr,
 		unsigned long len, unsigned long flags);
 
 struct vm_unmapped_area_info {
diff --git a/mm/mmap.c b/mm/mmap.c
index 843160946aa5..2a0721e75988 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1201,8 +1201,9 @@ SYSCALL_DEFINE5(remap_file_pages, unsigned long, start, unsigned long, size,
 	return ret;
 }
 
-int vm_brk_flags(unsigned long addr, unsigned long request, vm_flags_t vm_flags)
+int vm_brk_flags(unsigned long addr, unsigned long request, bool is_exec)
 {
+	const vm_flags_t vm_flags = is_exec ? VM_EXEC : 0;
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma = NULL;
 	unsigned long len;
@@ -1217,10 +1218,6 @@ int vm_brk_flags(unsigned long addr, unsigned long request, vm_flags_t vm_flags)
 	if (!len)
 		return 0;
 
-	/* Until we need other flags, refuse anything except VM_EXEC. */
-	if ((vm_flags & (~VM_EXEC)) != 0)
-		return -EINVAL;
-
 	if (mmap_write_lock_killable(mm))
 		return -EINTR;
 
@@ -1246,7 +1243,6 @@ int vm_brk_flags(unsigned long addr, unsigned long request, vm_flags_t vm_flags)
 	mmap_write_unlock(mm);
 	return ret;
 }
-EXPORT_SYMBOL(vm_brk_flags);
 
 static
 unsigned long tear_down_vmas(struct mm_struct *mm, struct vma_iterator *vmi,
-- 
2.53.0


