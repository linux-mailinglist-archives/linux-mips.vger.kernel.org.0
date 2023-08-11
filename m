Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8607786CD
	for <lists+linux-mips@lfdr.de>; Fri, 11 Aug 2023 06:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbjHKEwx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Aug 2023 00:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233561AbjHKEwX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 11 Aug 2023 00:52:23 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D19830E4
        for <linux-mips@vger.kernel.org>; Thu, 10 Aug 2023 21:51:51 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-c647150c254so3174939276.1
        for <linux-mips@vger.kernel.org>; Thu, 10 Aug 2023 21:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691729510; x=1692334310;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=G001bKqgoFEW2hLjB7/836JCEIDwO1wziDEr7SkyYCE=;
        b=W3WTn+szTpGRYJ4Nrsk4rxOWrftcekNscs22xwqlhuJB93Ar0BfqRGdEWyk/Q+jqhP
         ri5qHyFNgBLpKKH06LH+HsWb1MpZhFmzfXxeF/ORAT07Zun/zgnJLSX6I3leqAoY8QXR
         Cn/et64Ad2ndHQvQUM0T7mioUm2x1aprIMcTE/Orm1a2GcZucR8dO9nfLrJGDH4DDtBH
         Zqv+GVr8tvgyxrI1x+huGGPPptiOeQdCMsGwnp+KGtkceCK4aB9KNjMvLKxJMtaqApLO
         0pB9A/SZQYJ4zNbgL0iGKFGckcIBEfW0AiexbMyF7GNuqQ22QUyKuY/29OVGxcSI10vu
         hGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691729510; x=1692334310;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G001bKqgoFEW2hLjB7/836JCEIDwO1wziDEr7SkyYCE=;
        b=CHAXNgWjj4KjVVk7DDwfANCRE6BsTflW2teytCo/+Lc3ZLeHgicc31gmF9bTqBGaDd
         tHjjJ51DiuyqcwKkQS1yK11cBo0vtFQpoeQz5jRT6qjtM7g4FTYXMM4j0FC6sUibWHhg
         Q10WDhXzhP/l1IPK0hTgeIzwQmOXeHN2aDPENPqNmB78j8kv1pksOD9ZTbbuxO9m7hBf
         3/0ExeVmWXL8aIfUUMb9phk6K/CHXUSKB7qcTV3603ZKERDpPBe6FHQ+oTNzsm5UakQc
         okxP3izKkz0N33wHkKxnEnWDCJei2JxjabgQnDlWqiF0+RFXoWl2Z7LIZB8Ryi6+spd/
         zqjQ==
X-Gm-Message-State: AOJu0YyBx2nqoK9b7cVjbWJNGLRLrjSy/6UgWEREWrbmvr85c3gKBzJL
        HGuFCEphr36b1g69tVIWB5lAGDJo62H9
X-Google-Smtp-Source: AGHT+IGp8zLlvGKgsKPT+euh9i0KtpqBPibbJyYiSM4xY/zJavK9m1k0FyNfqcnUQJamiQjlUlH81wBUvAac
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a05:6902:91b:b0:d15:53b5:509f with SMTP id
 bu27-20020a056902091b00b00d1553b5509fmr80327ybb.2.1691729510277; Thu, 10 Aug
 2023 21:51:50 -0700 (PDT)
Date:   Fri, 11 Aug 2023 04:51:27 +0000
In-Reply-To: <20230811045127.3308641-1-rananta@google.com>
Mime-Version: 1.0
References: <20230811045127.3308641-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230811045127.3308641-15-rananta@google.com>
Subject: [PATCH v9 14/14] KVM: arm64: Use TLBI range-based instructions for unmap
From:   Raghavendra Rao Ananta <rananta@google.com>
To:     Oliver Upton <oliver.upton@linux.dev>,
        Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Jing Zhang <jingzhangos@google.com>,
        Reiji Watanabe <reijiw@google.com>,
        Colton Lewis <coltonlewis@google.com>,
        Raghavendra Rao Anata <rananta@google.com>,
        David Matlack <dmatlack@google.com>,
        Fuad Tabba <tabba@google.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org, Shaoqin Huang <shahuang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The current implementation of the stage-2 unmap walker traverses
the given range and, as a part of break-before-make, performs
TLB invalidations with a DSB for every PTE. A multitude of this
combination could cause a performance bottleneck on some systems.

Hence, if the system supports FEAT_TLBIRANGE, defer the TLB
invalidations until the entire walk is finished, and then
use range-based instructions to invalidate the TLBs in one go.
Condition deferred TLB invalidation on the system supporting FWB,
as the optimization is entirely pointless when the unmap walker
needs to perform CMOs.

Rename stage2_put_pte() to stage2_unmap_put_pte() as the function
now serves the stage-2 unmap walker specifically, rather than
acting generic.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 40 +++++++++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 5ef098af17362..eaaae76481fa9 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -831,16 +831,36 @@ static void stage2_make_pte(const struct kvm_pgtable_visit_ctx *ctx, kvm_pte_t n
 	smp_store_release(ctx->ptep, new);
 }
 
-static void stage2_put_pte(const struct kvm_pgtable_visit_ctx *ctx, struct kvm_s2_mmu *mmu,
-			   struct kvm_pgtable_mm_ops *mm_ops)
+static bool stage2_unmap_defer_tlb_flush(struct kvm_pgtable *pgt)
 {
 	/*
-	 * Clear the existing PTE, and perform break-before-make with
-	 * TLB maintenance if it was valid.
+	 * If FEAT_TLBIRANGE is implemented, defer the individual
+	 * TLB invalidations until the entire walk is finished, and
+	 * then use the range-based TLBI instructions to do the
+	 * invalidations. Condition deferred TLB invalidation on the
+	 * system supporting FWB as the optimization is entirely
+	 * pointless when the unmap walker needs to perform CMOs.
+	 */
+	return system_supports_tlb_range() && stage2_has_fwb(pgt);
+}
+
+static void stage2_unmap_put_pte(const struct kvm_pgtable_visit_ctx *ctx,
+				struct kvm_s2_mmu *mmu,
+				struct kvm_pgtable_mm_ops *mm_ops)
+{
+	struct kvm_pgtable *pgt = ctx->arg;
+
+	/*
+	 * Clear the existing PTE, and perform break-before-make if it was
+	 * valid. Depending on the system support, defer the TLB maintenance
+	 * for the same until the entire unmap walk is completed.
 	 */
 	if (kvm_pte_valid(ctx->old)) {
 		kvm_clear_pte(ctx->ptep);
-		kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, mmu, ctx->addr, ctx->level);
+
+		if (!stage2_unmap_defer_tlb_flush(pgt))
+			kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, mmu,
+					ctx->addr, ctx->level);
 	}
 
 	mm_ops->put_page(ctx->ptep);
@@ -1098,7 +1118,7 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	 * block entry and rely on the remaining portions being faulted
 	 * back lazily.
 	 */
-	stage2_put_pte(ctx, mmu, mm_ops);
+	stage2_unmap_put_pte(ctx, mmu, mm_ops);
 
 	if (need_flush && mm_ops->dcache_clean_inval_poc)
 		mm_ops->dcache_clean_inval_poc(kvm_pte_follow(ctx->old, mm_ops),
@@ -1112,13 +1132,19 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
 
 int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
 {
+	int ret;
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_unmap_walker,
 		.arg	= pgt,
 		.flags	= KVM_PGTABLE_WALK_LEAF | KVM_PGTABLE_WALK_TABLE_POST,
 	};
 
-	return kvm_pgtable_walk(pgt, addr, size, &walker);
+	ret = kvm_pgtable_walk(pgt, addr, size, &walker);
+	if (stage2_unmap_defer_tlb_flush(pgt))
+		/* Perform the deferred TLB invalidations */
+		kvm_tlb_flush_vmid_range(pgt->mmu, addr, size);
+
+	return ret;
 }
 
 struct stage2_attr_data {
-- 
2.41.0.640.ga95def55d0-goog

