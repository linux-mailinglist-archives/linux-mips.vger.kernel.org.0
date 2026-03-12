Return-Path: <linux-mips+bounces-13608-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GE/JM7ISs2maSAAAu9opvQ
	(envelope-from <linux-mips+bounces-13608-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 20:23:30 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F365277CCD
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 20:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96DB931825C8
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 19:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2EDC401A1F;
	Thu, 12 Mar 2026 19:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMJh0BE1"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A02401A16;
	Thu, 12 Mar 2026 19:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343021; cv=none; b=WKKnngAfVqf6ZJCvOhwvvB7f11bPUkPxh05bFGqECbPd5c8h6BK5hWg+xo+qYSY5OuSZMvBaYGy+b+EHDjZ32jPoZqewcUlIL0nYytmQPeYI560TdvESQ6fcvFhrctUqfOadsMUGbrjnKqbABqS96vuUVhLumo4txAgkhkKa4sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343021; c=relaxed/simple;
	bh=YB+Prps3NXNgyZK18AV53Ial+ZlTulYn7HfTP5zg1OA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RkG2X+W3tDVWQM9tGk+Cmb6QLtRIkQFcRvp9VeG9IygSrZExYcHM0jBIHYzbKMRO2+CPP07UvNQhKIqNThyoZqZFHkkvYrZIMcyz0g+Rdqvt6E+NBTb2lcL9YBR+g+NO5AnAiKnotWOpjfUlbrrf+gRkOppEjaUJRkdG9QFsNP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gMJh0BE1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C000C2BC86;
	Thu, 12 Mar 2026 19:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773343021;
	bh=YB+Prps3NXNgyZK18AV53Ial+ZlTulYn7HfTP5zg1OA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gMJh0BE1l4pIrUpBOQOh9D0ec4tGxSzEvRYmthhi119lf9iOWb5fcVzwx49BnIuUB
	 VWRKKNEjlXklZ/MKcv7E9t7zFb59I8aEqvkXuVrDSllPkBxGHpolum72wTTsrJTkiF
	 spDfNyLhWiSKFHWQGTVB1CTVmT2QoazGq+/sClR9wwRC9VCKIplL93es7Lv21glqdQ
	 CZufPhsaTQS2n43UB/AzEjxhUY7DikC3bKimUKGl2QZqa/JNpaabr3g6beHKXS7pyn
	 87i8vn+8SWsQ5SYUtU6mVrSnrjAtpeGs4vonxtw21ga3DSoEIPnbwZPIZ/ZFWaaY+R
	 YnxNze0QQkOUQ==
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
Subject: [PATCH 11/20] mm/vma: introduce [vma_flags,legacy]_to_[legacy,vma_flags]() helpers
Date: Thu, 12 Mar 2026 19:16:09 +0000
Message-ID: <b5c3c0f9a2f4b016bdf032dc959b988f585f0afc.1773342102.git.ljs@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-13608-lists,linux-mips=lfdr.de];
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
X-Rspamd-Queue-Id: 4F365277CCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

While we are still converting VMA flags from vma_flags_t to vm_flags_t,
introduce helpers to convert between the two to allow for iterative
development without having to 'change the world' in a single commit'.

Also update VMA flags tests to reflect the change.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 include/linux/mm_types.h        | 26 ++++++++++++++++++++++++++
 tools/testing/vma/include/dup.h | 26 ++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index ea76821c01e3..63a25f97cd1c 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1069,6 +1069,32 @@ static __always_inline void vma_flags_clear_all(vma_flags_t *flags)
 	bitmap_zero(flags->__vma_flags, NUM_VMA_FLAG_BITS);
 }
 
+/*
+ * Helper function which converts a vma_flags_t value to a legacy vm_flags_t
+ * value. This is only valid if the input flags value can be expressed in a
+ * system word.
+ *
+ * Will be removed once the conversion to VMA flags is complete.
+ */
+static __always_inline vm_flags_t vma_flags_to_legacy(vma_flags_t flags)
+{
+	return (vm_flags_t)flags.__vma_flags[0];
+}
+
+/*
+ * Helper function which converts a legacy vm_flags_t value to a vma_flags_t
+ * value.
+ *
+ * Will be removed once the conversion to VMA flags is complete.
+ */
+static __always_inline vma_flags_t legacy_to_vma_flags(vm_flags_t flags)
+{
+	vma_flags_t ret;
+
+	ret.__vma_flags[0] = (unsigned long)flags;
+	return ret;
+}
+
 /*
  * Copy value to the first system word of VMA flags, non-atomically.
  *
diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index fa2df96f9dee..c27fcfb50d8d 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -800,6 +800,32 @@ static __always_inline void vma_flags_clear_all(vma_flags_t *flags)
 	bitmap_zero(ACCESS_PRIVATE(flags, __vma_flags), NUM_VMA_FLAG_BITS);
 }
 
+/*
+ * Helper function which converts a vma_flags_t value to a legacy vm_flags_t
+ * value. This is only valid if the input flags value can be expressed in a
+ * system word.
+ *
+ * Will be removed once the conversion to VMA flags is complete.
+ */
+static __always_inline vm_flags_t vma_flags_to_legacy(vma_flags_t flags)
+{
+	return (vm_flags_t)flags.__vma_flags[0];
+}
+
+/*
+ * Helper function which converts a legacy vm_flags_t value to a vma_flags_t
+ * value.
+ *
+ * Will be removed once the conversion to VMA flags is complete.
+ */
+static __always_inline vma_flags_t legacy_to_vma_flags(vm_flags_t flags)
+{
+	vma_flags_t ret;
+
+	ret.__vma_flags[0] = (unsigned long)flags;
+	return ret;
+}
+
 static __always_inline void vma_flags_set_flag(vma_flags_t *flags,
 		vma_flag_t bit)
 {
-- 
2.53.0


