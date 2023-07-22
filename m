Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28F0375D8F7
	for <lists+linux-mips@lfdr.de>; Sat, 22 Jul 2023 04:23:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbjGVCXK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Jul 2023 22:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231229AbjGVCXH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Jul 2023 22:23:07 -0400
Received: from mail-oo1-xc4a.google.com (mail-oo1-xc4a.google.com [IPv6:2607:f8b0:4864:20::c4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8890E1711
        for <linux-mips@vger.kernel.org>; Fri, 21 Jul 2023 19:23:06 -0700 (PDT)
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-5667dddaa5cso4101749eaf.2
        for <linux-mips@vger.kernel.org>; Fri, 21 Jul 2023 19:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689992586; x=1690597386;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t6IhHBctPmj0Hd53w4ZNc/Re4kwSrUfdnR+nipXWIaQ=;
        b=XM2WvQ2J6mE1rfTmtu+H3ixFfDqyyOigJ/cXxpZjzgxUeTEvruySCAG/rKQGRMkMXD
         07rrVwzG0IXIfadckFTDSzoIT6JBfxBjNKBOeSU/6MBVc1LmSKHsji/nuGGmGQPIKW9Z
         8e7BSL6ztWh3Jw6Z6PGETSGeZe5ZaSFMswnjP4AvGCsDJMra7BRdKmnFvYajNsuV/JMY
         bITmLvO3fa24IoVT1k5ocCvwVwzy0L2JEzDhQGC+xQG5l7KYRVRGLld5r1cQJkxXDbfN
         F/fdZbbGBuGYNfoaMNU2jMex6wIQ2ZaUo1INEFODeKlvJppQiagrfGq9lolGYB2gzo7l
         nv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689992586; x=1690597386;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t6IhHBctPmj0Hd53w4ZNc/Re4kwSrUfdnR+nipXWIaQ=;
        b=IfO6J/aCpoFbnNrRWl/G9xjVXmkB2zmcBHakE+bgoXdt5CXHqSZR/8c1edMwmSLIsh
         nvbIvt1pzoyF9DBNb9R3hwfGtlCNznP5OastgqqdcDEx/LrC1R4gyuDdt0iUcnzY1oTp
         qKAVpo1Qi8CzVU1iqAMskQi9vORClU+nA0pjj5SCs1WLEi8lfm1PmwYXChTOveJ1hiHA
         rttxvwGWZYQhkjpIDeB4+7FVuaAgKoN21DvXNsa0CFuZK7Z9Rk1A3pBXJYpbZeEeJiQk
         UAIIFCzvqtHV9F8wYalaWmnBS/RYpVMZSE+ZCHPd6iHC8qoZv7ON38Fhel3K2yxA26Sv
         gmzA==
X-Gm-Message-State: ABy/qLat3t0luZo376YvzHl407AK5MK6NetnO5CJnXUM/Kwcu02LUOuZ
        5BF4GrKS7wyy2B6CvR/vy07Vx2JaW5wW
X-Google-Smtp-Source: APBJJlFmDJaT04gilXUKF4ITcHc4g3ZgKVKs4LBErP5xQ6ZXCTsrqhRw0GlVaRy9+yiIaqdevGRTlG/Ko5mu
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a4a:4fc3:0:b0:564:360c:2895 with SMTP id
 c186-20020a4a4fc3000000b00564360c2895mr5302803oob.1.1689992585914; Fri, 21
 Jul 2023 19:23:05 -0700 (PDT)
Date:   Sat, 22 Jul 2023 02:22:50 +0000
In-Reply-To: <20230722022251.3446223-1-rananta@google.com>
Mime-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230722022251.3446223-12-rananta@google.com>
Subject: [PATCH v7 11/12] KVM: arm64: Invalidate the table entries upon a range
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
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org, Gavin Shan <gshan@redhat.com>,
        Shaoqin Huang <shahuang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Currently, during the operations such as a hugepage collapse,
KVM would flush the entire VM's context using 'vmalls12e1is'
TLBI operation. Specifically, if the VM is faulting on many
hugepages (say after dirty-logging), it creates a performance
penalty for the guest whose pages have already been faulted
earlier as they would have to refill their TLBs again.

Instead, leverage kvm_tlb_flush_vmid_range() for table entries.
If the system supports it, only the required range will be
flushed. Else, it'll fallback to the previous mechanism.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 5d14d5d5819a..5ef098af1736 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -806,7 +806,8 @@ static bool stage2_try_break_pte(const struct kvm_pgtable_visit_ctx *ctx,
 		 * evicted pte value (if any).
 		 */
 		if (kvm_pte_table(ctx->old, ctx->level))
-			kvm_call_hyp(__kvm_tlb_flush_vmid, mmu);
+			kvm_tlb_flush_vmid_range(mmu, ctx->addr,
+						kvm_granule_size(ctx->level));
 		else if (kvm_pte_valid(ctx->old))
 			kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, mmu,
 				     ctx->addr, ctx->level);
-- 
2.41.0.487.g6d72f3e995-goog

