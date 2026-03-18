Return-Path: <linux-mips+bounces-13764-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLJOLETNummfcAIAu9opvQ
	(envelope-from <linux-mips+bounces-13764-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 17:05:24 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F582BEF1D
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 17:05:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC2133025158
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 15:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897173ECBDD;
	Wed, 18 Mar 2026 15:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bgl0CnFw"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE84F3CD8C8;
	Wed, 18 Mar 2026 15:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849072; cv=none; b=AlYZFYv+CM9V5eZDblBZlr9RQWBU8r3uhLJkg3XIGtdAGyfdSgEfIyO6H3/Aud6zv3+NxwGasc0i/QRA+be9jcz81+F9mEDOmZ5R205yXlibQFzXf0V61+rY72J0eRu09k3zbYyVBT84uHl3C/x1y8KbGl6TMl3+Oq802/Flfww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849072; c=relaxed/simple;
	bh=nrs6iJ/XdiJB/0ese2zp+YaeuL3aT0WXZzGBimGG+OU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KgcwcpwFmwi0Ja2A+tfOyiu1z30SFdONM4g3VxuVNNjiKIek9eOZ+IMSnaT1tQLPsXfb3FDHJvvy3llpC1f2g8aAi//Q3rfHF9QNiGn9vGp1a9Nw4RM/kquvac28sVi1OKtigiOFEboBhzayQbNsYgDecsv0KyyxCl3I5rclEBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bgl0CnFw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E17C2BCAF;
	Wed, 18 Mar 2026 15:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773849071;
	bh=nrs6iJ/XdiJB/0ese2zp+YaeuL3aT0WXZzGBimGG+OU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bgl0CnFw2w9iWUKNyKcHV0ooDagsFya2kSGZSYS7wnv4UhCgV18vg76y6TBaqtIZd
	 O5lQWXgBUJyqGSyaju2M6OQARsj3bWDWDwtDGHo/pVVg3fk3bPy5v78bx1HdGc2Y5K
	 MJQJqe1DZVubyhOly75eGjM04WgpWjWwi+B6eqJYWuiCPReF2fliFBIeUinwFnu6/N
	 XuDVbwq/SckZdhjf5HM5g6fNLXJxjt/aDSy1IymOy1wEUDWGZEnX+eQu6PXw57Jg4i
	 oT3zLzACxdFXlhf5OF6zdvkmS4vxnmgj3U4aAWBq2muCepbEkLB9JJ/yEB1vWWKMPa
	 LotP1Xt38hFGA==
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
Subject: [PATCH v3 11/23] mm/vma: introduce [vma_flags,legacy]_to_[legacy,vma_flags]() helpers
Date: Wed, 18 Mar 2026 15:50:22 +0000
Message-ID: <4fdffd05ee7fabe2dc313850a4300bf184beba69.1773846935.git.ljs@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-13764-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_GT_50(0.00)[62];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-0.971];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 51F582BEF1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

While we are still converting VMA flags from vma_flags_t to vm_flags_t,
introduce helpers to convert between the two to allow for iterative
development without having to 'change the world' in a single commit'.

Also update VMA flags tests to reflect the change.

Finally, refresh vma_flags_overwrite_word(),
vma_flag_overwrite_word_once(), vma_flags_set_word() and
vma_flags_clear_word() in the VMA tests to reflect current kernel
implementations - this should make no functional difference, but keeps the
logic consistent between the two.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 include/linux/mm_types.h        | 26 ++++++++++++++++++++++++
 tools/testing/vma/include/dup.h | 36 +++++++++++++++++++++++++++++----
 2 files changed, 58 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 47d64057b74c..c5ad55b8a45b 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1069,6 +1069,18 @@ static __always_inline void vma_flags_clear_all(vma_flags_t *flags)
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
 /*
  * Copy value to the first system word of VMA flags, non-atomically.
  *
@@ -1082,6 +1094,20 @@ static inline void vma_flags_overwrite_word(vma_flags_t *flags, unsigned long va
 	bitmap[0] = value;
 }
 
+/*
+ * Helper function which converts a legacy vm_flags_t value to a vma_flags_t
+ * value.
+ *
+ * Will be removed once the conversion to VMA flags is complete.
+ */
+static __always_inline vma_flags_t legacy_to_vma_flags(vm_flags_t flags)
+{
+	vma_flags_t ret = EMPTY_VMA_FLAGS;
+
+	vma_flags_overwrite_word(&ret, flags);
+	return ret;
+}
+
 /*
  * Copy value to the first system word of VMA flags ONCE, non-atomically.
  *
diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index 65f630923461..f49af21319ba 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -766,7 +766,9 @@ static inline bool mm_flags_test(int flag, const struct mm_struct *mm)
  */
 static inline void vma_flags_overwrite_word(vma_flags_t *flags, unsigned long value)
 {
-	*ACCESS_PRIVATE(flags, __vma_flags) = value;
+	unsigned long *bitmap = flags->__vma_flags;
+
+	bitmap[0] = value;
 }
 
 /*
@@ -777,7 +779,7 @@ static inline void vma_flags_overwrite_word(vma_flags_t *flags, unsigned long va
  */
 static inline void vma_flags_overwrite_word_once(vma_flags_t *flags, unsigned long value)
 {
-	unsigned long *bitmap = ACCESS_PRIVATE(flags, __vma_flags);
+	unsigned long *bitmap = flags->__vma_flags;
 
 	WRITE_ONCE(*bitmap, value);
 }
@@ -785,7 +787,7 @@ static inline void vma_flags_overwrite_word_once(vma_flags_t *flags, unsigned lo
 /* Update the first system word of VMA flags setting bits, non-atomically. */
 static inline void vma_flags_set_word(vma_flags_t *flags, unsigned long value)
 {
-	unsigned long *bitmap = ACCESS_PRIVATE(flags, __vma_flags);
+	unsigned long *bitmap = flags->__vma_flags;
 
 	*bitmap |= value;
 }
@@ -793,7 +795,7 @@ static inline void vma_flags_set_word(vma_flags_t *flags, unsigned long value)
 /* Update the first system word of VMA flags clearing bits, non-atomically. */
 static inline void vma_flags_clear_word(vma_flags_t *flags, unsigned long value)
 {
-	unsigned long *bitmap = ACCESS_PRIVATE(flags, __vma_flags);
+	unsigned long *bitmap = flags->__vma_flags;
 
 	*bitmap &= ~value;
 }
@@ -803,6 +805,32 @@ static __always_inline void vma_flags_clear_all(vma_flags_t *flags)
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
+	vma_flags_t ret = EMPTY_VMA_FLAGS;
+
+	vma_flags_overwrite_word(&ret, flags);
+	return ret;
+}
+
 static __always_inline void vma_flags_set_flag(vma_flags_t *flags,
 		vma_flag_t bit)
 {
-- 
2.53.0


