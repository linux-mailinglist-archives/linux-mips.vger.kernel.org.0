Return-Path: <linux-mips+bounces-2587-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 992E1899C2D
	for <lists+linux-mips@lfdr.de>; Fri,  5 Apr 2024 13:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E947B2247C
	for <lists+linux-mips@lfdr.de>; Fri,  5 Apr 2024 11:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0401F16C867;
	Fri,  5 Apr 2024 11:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YNlN6w8D"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400CA16C6AC
	for <linux-mips@vger.kernel.org>; Fri,  5 Apr 2024 11:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712318307; cv=none; b=EQ5Ls/aJnEc1gq9ZLk5lvxHk3Epoj+EyKemwbeVOvv1PpXd7TSeZ6IV8FqtR7Pku6wjZRzESBcbfuf0bVo/dLArmUkVC4eZPVjnVdRdbuUR5tf1x3I3bqAgBZnpXFEELUNFxxl/hdUEOujlCVLNdVvWZQ2sFbTwWOz0vc3zSsoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712318307; c=relaxed/simple;
	bh=MVPfw12aKDAKYxBgmyfiqiiyclWrH3J9VU7NBfl7yag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MA+CWYUe2wZ9O4XHeBGvSRA9MMOBtM82s8Msl/13zgiceiCOqMnZpnTPNXq8qHsDHMRn0sGRgjXDTSFSgcyv1nlE2i/fzWl+N+OFm728u4/43JPEaksrn2F6FuraiCaB7md2CM5HP5gfsVePNDx4OURdhRUJoBtzmq9YaKDz+bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YNlN6w8D; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712318304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PYlVlmhvJPdz+cTS0GmxjcvjKIkp+1zDoZOzzNIMhco=;
	b=YNlN6w8DWj2tHYEhPnlZTjJDAT5rIUMHYTzkyGZGn2RTFtja+vhsy+JFCg+lotzLqk7WCj
	71tkCzOH1gOGjMDApLFS6Qnb4jATaqhgmf0pczWsGjThXAzy5gHCKuxbvGYY05yDfPHawP
	g1X+dZd8TXhb+giz/gjX5Yc/Tbso4PI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-94-jWBq89b1PjOkiIzryzMcEA-1; Fri,
 05 Apr 2024 07:58:21 -0400
X-MC-Unique: jWBq89b1PjOkiIzryzMcEA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07BB2382C473;
	Fri,  5 Apr 2024 11:58:20 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 470FC40C6CB5;
	Fri,  5 Apr 2024 11:58:19 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 2/4] KVM: remove unused argument of kvm_handle_hva_range()
Date: Fri,  5 Apr 2024 07:58:13 -0400
Message-ID: <20240405115815.3226315-3-pbonzini@redhat.com>
In-Reply-To: <20240405115815.3226315-1-pbonzini@redhat.com>
References: <20240405115815.3226315-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

The only user was kvm_mmu_notifier_change_pte(), which is now gone.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 virt/kvm/kvm_main.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 2fcd9979752a..9701888811ad 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -595,8 +595,6 @@ static void kvm_null_fn(void)
 }
 #define IS_KVM_NULL_FN(fn) ((fn) == (void *)kvm_null_fn)
 
-static const union kvm_mmu_notifier_arg KVM_MMU_NOTIFIER_NO_ARG;
-
 /* Iterate over each memslot intersecting [start, last] (inclusive) range */
 #define kvm_for_each_memslot_in_hva_range(node, slots, start, last)	     \
 	for (node = interval_tree_iter_first(&slots->hva_tree, start, last); \
@@ -682,14 +680,12 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
 static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
 						unsigned long start,
 						unsigned long end,
-						union kvm_mmu_notifier_arg arg,
 						gfn_handler_t handler)
 {
 	struct kvm *kvm = mmu_notifier_to_kvm(mn);
 	const struct kvm_mmu_notifier_range range = {
 		.start		= start,
 		.end		= end,
-		.arg		= arg,
 		.handler	= handler,
 		.on_lock	= (void *)kvm_null_fn,
 		.flush_on_ret	= true,
@@ -880,8 +876,7 @@ static int kvm_mmu_notifier_clear_flush_young(struct mmu_notifier *mn,
 {
 	trace_kvm_age_hva(start, end);
 
-	return kvm_handle_hva_range(mn, start, end, KVM_MMU_NOTIFIER_NO_ARG,
-				    kvm_age_gfn);
+	return kvm_handle_hva_range(mn, start, end, kvm_age_gfn);
 }
 
 static int kvm_mmu_notifier_clear_young(struct mmu_notifier *mn,
-- 
2.43.0



