Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8500F774F2C
	for <lists+linux-mips@lfdr.de>; Wed,  9 Aug 2023 01:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232311AbjHHXOb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Aug 2023 19:14:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231926AbjHHXOR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Aug 2023 19:14:17 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D8212109
        for <linux-mips@vger.kernel.org>; Tue,  8 Aug 2023 16:13:49 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d5e792a163dso449724276.1
        for <linux-mips@vger.kernel.org>; Tue, 08 Aug 2023 16:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691536428; x=1692141228;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ceh3/nJpRP3LCUTMqceYFYfxrY0H2MNGDIBSz6bT86E=;
        b=lYWCq7XVM6FudJxW5r6RH/4QIo159OCh6BgBZTBQDRkAKhfeKsfGNQQCUQnkN8KvPr
         t2l9cZJpTHvXHX31KaawaEBmdl57OidB6o+0jjp9TDmM0VLLVpgNjiCEG1/+aYqFU6hC
         eAp6ynp7sqYoyVQ64la2au+GLVmINvRuVrGSHYiSeGeSQjAXxRWyTBZdKnV0DHkwK074
         YgL4nZU6PyCxpLCA6hze9IY8+wLAXkT7Chl05pETXiSkaPo3evGfyJZWaUFGflARAI1I
         CWJ4pe0DcCV/6ZrRmXGPD36mbRDc3h8lapnceaa/GYhujd1Sc5T65R444ON8TKY8zetm
         jTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691536428; x=1692141228;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ceh3/nJpRP3LCUTMqceYFYfxrY0H2MNGDIBSz6bT86E=;
        b=NHzwBpp7yPb06Flkt68ndbLYZbadLtx+JggUa/hyuOZktXd+rCGm3ydTvkDjcaWxJ6
         dJAjT9EHNdtJyhZHQZQ+bWi3T8jtK29t9Ny6Ku1vbjZep+AsJ9kV8inuWKD9hmfZAaOm
         yswcRUSKP3UZf5J8FRfDe7g0L7HtBvP5elhZhOLvpc5BiHFjXmmeIXR12XDaETg8OOhp
         lAtzqIUQwU+d7uCDr36Ae70CIwdicFYJmCYro6j07FwJCO5PdOeYi6GCrXdhKu5gf9yV
         i9emdreWEZM6qkqt8b+fOAIL2b2UqgTm1eZTX+hV8UcIJsEFPXpWdDmWgOblPeLwjsEu
         vvLw==
X-Gm-Message-State: AOJu0YzKZbVfSYsJd8j374YtoxexaJV9Z+QvmhrrEFy5rLvkwFc4+Tey
        PXKuMcWUpHbezhwH0hvfQ9DjvAizbhsX
X-Google-Smtp-Source: AGHT+IFZf7KdCrM3mKKctDL4eJEFrZL/iyXXoQ3odpF+ERPp4XkakMR9xXlj55lUKXM5dTMxS4wP8F7laVhf
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a25:ab50:0:b0:d10:5b67:843c with SMTP id
 u74-20020a25ab50000000b00d105b67843cmr20552ybi.4.1691536428387; Tue, 08 Aug
 2023 16:13:48 -0700 (PDT)
Date:   Tue,  8 Aug 2023 23:13:29 +0000
In-Reply-To: <20230808231330.3855936-1-rananta@google.com>
Mime-Version: 1.0
References: <20230808231330.3855936-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230808231330.3855936-14-rananta@google.com>
Subject: [PATCH v8 13/14] KVM: arm64: Invalidate the table entries upon a range
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
        kvm@vger.kernel.org, Gavin Shan <gshan@redhat.com>,
        Shaoqin Huang <shahuang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
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
index 5d14d5d5819a1..5ef098af17362 100644
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
2.41.0.640.ga95def55d0-goog

