Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56420199A2A
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2020 17:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731013AbgCaPr5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 31 Mar 2020 11:47:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31080 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730999AbgCaPr4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 31 Mar 2020 11:47:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585669676;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=JZtZSbKo5LIE2USs8ZYw0MKFj7vPTw9aUaKq/XN8w6g=;
        b=KxNPvEdBUo23UzmjFTIyZ4QFSqeDAsMNRhZ2JYMqW0Yoe8ZrlxDh4FLJXTbXlt9o3iBXDe
        vehWY5mbDWq8GW7yUwndW1kVOGU+B3gRwXNH/vnXrH96by7HDvkOWCPzWEttmwL3Fnhaps
        ASd66qq8oRBShngx61T//LSQyTswdy8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-tCcb4IJzNseAWG37EiM-yA-1; Tue, 31 Mar 2020 11:47:54 -0400
X-MC-Unique: tCcb4IJzNseAWG37EiM-yA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1812C149C0;
        Tue, 31 Mar 2020 15:47:53 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BD76060BE2;
        Tue, 31 Mar 2020 15:47:49 +0000 (UTC)
From:   Paolo Bonzini <pbonzini@redhat.com>
To:     linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Cc:     linux-mips@vger.kernel.org, peterx@redhat.com, rppt@linux.ibm.com
Subject: [PATCH] KVM: MIPS: fix compilation
Date:   Tue, 31 Mar 2020 11:47:49 -0400
Message-Id: <20200331154749.5457-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 31168f033e37 is correct that pud_index() & __pud_offset() are the same
when pud_index() is actually provided, however it does not take into account
the __PAGETABLE_PUD_FOLDED case.  Provide kvm_pud_index so that MIPS KVM
compiles.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/mips/kvm/mmu.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index 7dad7a293eae..ccf98c22fd2c 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -25,6 +25,12 @@
 #define KVM_MMU_CACHE_MIN_PAGES 2
 #endif
 
+#if defined(__PAGETABLE_PUD_FOLDED)
+#define kvm_pud_index(gva) 0
+#else
+#define kvm_pud_index(gva) pud_index(gva)
+#endif
+
 static int mmu_topup_memory_cache(struct kvm_mmu_memory_cache *cache,
 				  int min, int max)
 {
@@ -234,8 +240,8 @@ static bool kvm_mips_flush_gpa_pud(pud_t *pud, unsigned long start_gpa,
 {
 	pmd_t *pmd;
 	unsigned long end = ~0ul;
-	int i_min = pud_index(start_gpa);
-	int i_max = pud_index(end_gpa);
+	int i_min = kvm_pud_index(start_gpa);
+	int i_max = kvm_pud_index(end_gpa);
 	bool safe_to_remove = (i_min == 0 && i_max == PTRS_PER_PUD - 1);
 	int i;
 
@@ -361,8 +367,8 @@ static int kvm_mips_##name##_pud(pud_t *pud, unsigned long start,	\
 	int ret = 0;							\
 	pmd_t *pmd;							\
 	unsigned long cur_end = ~0ul;					\
-	int i_min = pud_index(start);				\
-	int i_max = pud_index(end);					\
+	int i_min = kvm_pud_index(start);				\
+	int i_max = kvm_pud_index(end);					\
 	int i;								\
 									\
 	for (i = i_min; i <= i_max; ++i, start = 0) {			\
@@ -896,8 +902,8 @@ static bool kvm_mips_flush_gva_pud(pud_t *pud, unsigned long start_gva,
 {
 	pmd_t *pmd;
 	unsigned long end = ~0ul;
-	int i_min = pud_index(start_gva);
-	int i_max = pud_index(end_gva);
+	int i_min = kvm_pud_index(start_gva);
+	int i_max = kvm_pud_index(end_gva);
 	bool safe_to_remove = (i_min == 0 && i_max == PTRS_PER_PUD - 1);
 	int i;
 
-- 
2.18.2

