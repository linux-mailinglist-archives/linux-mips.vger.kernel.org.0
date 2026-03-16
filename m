Return-Path: <linux-mips+bounces-13666-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eF0MKGIBuGlpYAEAu9opvQ
	(envelope-from <linux-mips+bounces-13666-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 14:10:58 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6F2299EE7
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 14:10:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 380DD303F55D
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 13:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C358D396D35;
	Mon, 16 Mar 2026 13:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hk4WTrBo"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FD13947A3;
	Mon, 16 Mar 2026 13:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773666554; cv=none; b=EaXaruNWKn8j964TptK7Sg4eTlzBaGEHxr9vDCRjdIJ+M6+IyRAoQQS6lmp3Ag6BPoftm6SF50a00oyHwMApGx/lrX/nqc8cl0d5b0H2k5TUpsGGNeC/V3w9BRQ5do4oK3MfKMBxTSD+uh/qx6RhVYOJcXuhqkDjqJcJs+xf/KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773666554; c=relaxed/simple;
	bh=bbEhjgEqkd4dPM1XP+mWknexfvrvA44Gz/j1bC4Udqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gz2WD4P/qiZObfSTJ4u1gwTbEGnaUHsr27fuqPWZyzX4hwNakyGJxNIjNeza2reYGMxLe6w2NYDL1oC701odwPqHljkh98Jdgy+yw0vwAtQnuO9if/c3PGZGoODoIAqjzioeFKSex61/P8zsPVdO1EoVnmeW9S/swQsT1zKA+YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hk4WTrBo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C17E0C2BCB2;
	Mon, 16 Mar 2026 13:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773666554;
	bh=bbEhjgEqkd4dPM1XP+mWknexfvrvA44Gz/j1bC4Udqw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hk4WTrBoPWOBisLqTaABf9fprbTvuJu/Ce8nfzyYRukSQ7cCNTw9jbplRWm+5ptKs
	 wRDV9EpK7zX6W187Q18m4r4W/fvBdSHHbvfyXUEYWIEQq5b2HABkd4R9mI1+zkQjDp
	 04H2T0NwBBwr/oK+x559mQRTMaugWTrORpGgLy2B7zM1M33rshsneJ/YQPtsNws255
	 aN/7Vr+NoO+o0qFIovTO8QzIrFgfQgIr9xylOgtxNyMEbumME14YoxQkHfWK+DrI3k
	 NUMXWGY2EXXXuknHM29ID1lox1bk0xSspJIU9KeGcEvkNQkoOWr+CvdRbrilZnPzgN
	 LrgcIxD6b2N2g==
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
Subject: [PATCH v2 07/23] mm/vma: add append_vma_flags() helper
Date: Mon, 16 Mar 2026 13:07:56 +0000
Message-ID: <756b9c46ee23e00c2fe64d453ff61dd3b98aa3fc.1773665966.git.ljs@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oracle.com,google.com,suse.de,kvack.org,vger.kernel.org,armlinux.org.uk,arm.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,nod.at,cambridgegreys.com,sipsolutions.net,zeniv.linux.org.uk,suse.cz,zte.com.cn,linux.dev,suse.com,paul-moore.com,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13666-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[62];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 1D6F2299EE7
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
index b75e089dfd65..0c35423177bf 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1047,13 +1047,11 @@ static __always_inline void vma_flags_set_flag(vma_flags_t *flags,
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
@@ -1069,8 +1067,18 @@ static __always_inline vma_flags_t __mk_vma_flags(size_t count,
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
index 64b9089a0018..cbdeb03ee7e5 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -854,21 +854,21 @@ static inline void vm_flags_clear(struct vm_area_struct *vma,
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


