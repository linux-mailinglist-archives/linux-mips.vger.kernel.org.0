Return-Path: <linux-mips+bounces-13820-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HnAErqivWkM/wIAu9opvQ
	(envelope-from <linux-mips+bounces-13820-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 20:40:42 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C94A2E02D7
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 20:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B9BB4303FD3B
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 19:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194003DC4AE;
	Fri, 20 Mar 2026 19:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="liqFOLuS"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66813D3314;
	Fri, 20 Mar 2026 19:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774035534; cv=none; b=CTbZvegz3WewCF5Qbvliv1GXUrr/Csrc20VXtYvw6qK5XAN/iQ1jw6U2zmJbyXdXpJeeUZbYTOppqIT1D73NXYcJEVYzokD4SbNv4TjylU55j+HXRyBf67SFPioond+2VRMAdtNXYw3RLcmQZZh9WSY+shdU/g2pihUuiEfGHi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774035534; c=relaxed/simple;
	bh=PvxeCoUH6mYcAW+t825wYCo2q3PVvHiBg5/Yn7CCaIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T8Tj04ocRomByQDcF+C0IC7ZXwvN+1U3uZ79OI56dG6ZYhB09TnJ/+/IMEa0HvaYQc7fxVYz96jJGUNoeZwzRniEScZnTGLGzB3esov1LSzxlM7Sa7lNlchVn5/6Q6pC/ldIu+JD6H55cMP/SUSUZW2l/PGY6BxXiuiqktVWrz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=liqFOLuS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B32C2BCB0;
	Fri, 20 Mar 2026 19:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774035533;
	bh=PvxeCoUH6mYcAW+t825wYCo2q3PVvHiBg5/Yn7CCaIU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=liqFOLuSKA9Wc9gTQOMeY6jA3+GN7oM4ESZtfQ3WaIml/s9yeaVEFKKgeEdILjfHw
	 6ZSFZZkdExG3YmcOnJmcxHfOb8dwWPPdm2Kius2AZPeeLOtScCYWy92jmr0lpis+1p
	 ObjYYywPs0TKvgjLKhcxbeMtroVdrdrR4W1KbrQVUwrUoR5d53labAWfWzlmljvzFY
	 4OqfQVhaFctQPOcm+41zXUXSx+ztfgGsTqUZ33MMm1/40NVD0waoy99ETjRoFTIObP
	 /LyUn+4yOqna5Pol7EibTuGDNg5m3J7Ar6Z7GuhdtSF2kWO1D+tnk/2hGZh/+Y0PSx
	 6QnH4WE044V1w==
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
Subject: [PATCH v4 03/25] mm/vma: add further vma_flags_t unions
Date: Fri, 20 Mar 2026 19:38:20 +0000
Message-ID: <d507d542c089ba132e9da53f2ff7f80ca117c3b4.1774034900.git.ljs@kernel.org>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oracle.com,google.com,suse.de,kvack.org,vger.kernel.org,armlinux.org.uk,arm.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,nod.at,cambridgegreys.com,sipsolutions.net,zeniv.linux.org.uk,suse.cz,zte.com.cn,linux.dev,suse.com,paul-moore.com,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13820-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[62];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 2C94A2E02D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In order to utilise the new vma_flags_t type, we currently place it in
union with legacy vm_flags fields of type vm_flags_t to make the
transition smoother.

Add vma_flags_t union entries for mm->def_flags and vmg->vm_flags -
mm->def_vma_flags and vmg->vma_flags respectively.

Once the conversion is complete, these will be replaced with vma_flags_t
entries alone.

Also update the VMA tests to reflect the change.

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 include/linux/mm_types.h        | 6 +++++-
 mm/vma.h                        | 6 +++++-
 tools/testing/vma/include/dup.h | 5 ++++-
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 5584a0c7bcea..47d64057b74c 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1262,7 +1262,11 @@ struct mm_struct {
 		unsigned long data_vm;	   /* VM_WRITE & ~VM_SHARED & ~VM_STACK */
 		unsigned long exec_vm;	   /* VM_EXEC & ~VM_WRITE & ~VM_STACK */
 		unsigned long stack_vm;	   /* VM_STACK */
-		vm_flags_t def_flags;
+		union {
+			/* Temporary while VMA flags are being converted. */
+			vm_flags_t def_flags;
+			vma_flags_t def_vma_flags;
+		};
 
 		/**
 		 * @write_protect_seq: Locked when any thread is write
diff --git a/mm/vma.h b/mm/vma.h
index eba388c61ef4..cf8926558bf6 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -98,7 +98,11 @@ struct vma_merge_struct {
 	unsigned long end;
 	pgoff_t pgoff;
 
-	vm_flags_t vm_flags;
+	union {
+		/* Temporary while VMA flags are being converted. */
+		vm_flags_t vm_flags;
+		vma_flags_t vma_flags;
+	};
 	struct file *file;
 	struct anon_vma *anon_vma;
 	struct mempolicy *policy;
diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index 8091a5caaeb8..58e063b1ee27 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -33,7 +33,10 @@ struct mm_struct {
 	unsigned long exec_vm;	   /* VM_EXEC & ~VM_WRITE & ~VM_STACK */
 	unsigned long stack_vm;	   /* VM_STACK */
 
-	unsigned long def_flags;
+	union {
+		vm_flags_t def_flags;
+		vma_flags_t def_vma_flags;
+	};
 
 	mm_flags_t flags; /* Must use mm_flags_* helpers to access */
 };
-- 
2.53.0


