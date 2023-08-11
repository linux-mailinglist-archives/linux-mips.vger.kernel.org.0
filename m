Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 434E37786AA
	for <lists+linux-mips@lfdr.de>; Fri, 11 Aug 2023 06:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233528AbjHKEvq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Aug 2023 00:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233467AbjHKEvo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 11 Aug 2023 00:51:44 -0400
Received: from mail-ot1-x349.google.com (mail-ot1-x349.google.com [IPv6:2607:f8b0:4864:20::349])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52C8C2D78
        for <linux-mips@vger.kernel.org>; Thu, 10 Aug 2023 21:51:41 -0700 (PDT)
Received: by mail-ot1-x349.google.com with SMTP id 46e09a7af769-6bd1e0975cbso1484991a34.3
        for <linux-mips@vger.kernel.org>; Thu, 10 Aug 2023 21:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691729500; x=1692334300;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K3pnh3N/YIF0SxqOcKLFCFAu/7kR/Uv7ltNd2DAApng=;
        b=Q/eD8y0h2l6JvWr9yxmhkzDz3/gU+uCMrAapE+RfKfpEujedU2m/cioIEtNiwyWcDq
         6oU/mRQTOMuz+meNoZkHUXpRaB1Kf60Q4R97OmOR3SyHx7RuYNOseDNnfQaON1qyo5sp
         Yy7qpgB8KdX4r7NgDYWnxRanbAd0O25zsnOgYls8iU4oaEYwKOd4OuGHRAElOOULjwZ7
         zv+qj9vFVZl3xEcKvgpLumSuTYsp2PPSqwEIKmfHkh1NMsSMLhmU4qETWPBj1KkWIsjx
         AfAcpwHEssHw6PsET2R5l/KBjsPVbkindLK/jYg8Jg4IOgwBWrE2JstApGnRH9vE/HVL
         nJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691729500; x=1692334300;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K3pnh3N/YIF0SxqOcKLFCFAu/7kR/Uv7ltNd2DAApng=;
        b=QZy81nJMnK2Y0MXoMTPfWpURk1mFRT5UdRQsO6Y345UVQPIYgfy6NGdQkWsYCjsN1f
         UIUwmHjJTgmSKnhSD6AoXX6buV8d/aSMJZpSSkZfYwar8A3ddRw2EBdT0psy1bx8EBs3
         NWyEpnWoQpFWYqKAs8+S0zjcohy/HNBefdhY6uHihrfLewM4H/D1itL93k6d9QX1K2tt
         BmRE/sK8z2tRXFPPjutVZxEDMoUr0sws9zXxdRT38rB7KP148GIOtu9X8gkaQ93cE+Bj
         0f2EIrXXfvBtSyJdzEgs/IDubH5BwUB+hFs9eSACDA+Qf8Ozd+kuC163jH3S9gRHg8Pb
         vHTQ==
X-Gm-Message-State: AOJu0YzD0+6hnrSscybCTvNbqt8BQrRFGxbuPPIibBSC4VV/DqwWv6hC
        nuOUNdToTtWRiSpb0y7K3wNveL8D6552
X-Google-Smtp-Source: AGHT+IFGVe7NxFpz5VE0E4/WvtFaQI/uiF+IxB2dFVJtq+EJbiYPxTNleKK3q6v99h+PTIzxrx3AKKcqdkl2
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a05:6870:7685:b0:1c2:d3de:c298 with SMTP
 id dx5-20020a056870768500b001c2d3dec298mr3535oab.11.1691729500567; Thu, 10
 Aug 2023 21:51:40 -0700 (PDT)
Date:   Fri, 11 Aug 2023 04:51:18 +0000
In-Reply-To: <20230811045127.3308641-1-rananta@google.com>
Mime-Version: 1.0
References: <20230811045127.3308641-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230811045127.3308641-6-rananta@google.com>
Subject: [PATCH v9 05/14] KVM: Allow range-based TLB invalidation from common code
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
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: David Matlack <dmatlack@google.com>

Make kvm_flush_remote_tlbs_range() visible in common code and create a
default implementation that just invalidates the whole TLB.

This paves the way for several future features/cleanups:

 - Introduction of range-based TLBI on ARM.
 - Eliminating kvm_arch_flush_remote_tlbs_memslot()
 - Moving the KVM/x86 TDP MMU to common code.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/x86/include/asm/kvm_host.h |  2 ++
 arch/x86/kvm/mmu/mmu.c          | 10 ++++------
 arch/x86/kvm/mmu/mmu_internal.h |  3 ---
 include/linux/kvm_host.h        | 11 +++++++++++
 virt/kvm/kvm_main.c             | 13 +++++++++++++
 5 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index a2d3cfc2eb75c..b547d17c58f63 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1804,6 +1804,8 @@ static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
 		return -ENOTSUPP;
 }
 
+#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
+
 #define kvm_arch_pmi_in_guest(vcpu) \
 	((vcpu) && (vcpu)->arch.handling_intr_from_guest)
 
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index ec169f5c7dce2..00f7bda9202f2 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -278,16 +278,14 @@ static inline bool kvm_available_flush_remote_tlbs_range(void)
 	return kvm_x86_ops.flush_remote_tlbs_range;
 }
 
-void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn,
-				 gfn_t nr_pages)
+int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 nr_pages)
 {
 	int ret = -EOPNOTSUPP;
 
 	if (kvm_x86_ops.flush_remote_tlbs_range)
-		ret = static_call(kvm_x86_flush_remote_tlbs_range)(kvm, start_gfn,
-								   nr_pages);
-	if (ret)
-		kvm_flush_remote_tlbs(kvm);
+		ret = static_call(kvm_x86_flush_remote_tlbs_range)(kvm, gfn, nr_pages);
+
+	return ret;
 }
 
 static gfn_t kvm_mmu_page_get_gfn(struct kvm_mmu_page *sp, int index);
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index d39af5639ce97..86cb83bb34804 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -170,9 +170,6 @@ bool kvm_mmu_slot_gfn_write_protect(struct kvm *kvm,
 				    struct kvm_memory_slot *slot, u64 gfn,
 				    int min_level);
 
-void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn,
-				 gfn_t nr_pages);
-
 /* Flush the given page (huge or not) of guest memory. */
 static inline void kvm_flush_remote_tlbs_gfn(struct kvm *kvm, gfn_t gfn, int level)
 {
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index ade5d4500c2ce..89d2614e4b7a6 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1359,6 +1359,7 @@ int kvm_vcpu_yield_to(struct kvm_vcpu *target);
 void kvm_vcpu_on_spin(struct kvm_vcpu *vcpu, bool yield_to_kernel_mode);
 
 void kvm_flush_remote_tlbs(struct kvm *kvm);
+void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 nr_pages);
 
 #ifdef KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE
 int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min);
@@ -1488,6 +1489,16 @@ static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
 int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
 #endif
 
+#ifndef __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
+static inline int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
+						    gfn_t gfn, u64 nr_pages)
+{
+	return -EOPNOTSUPP;
+}
+#else
+int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 nr_pages);
+#endif
+
 #ifdef __KVM_HAVE_ARCH_NONCOHERENT_DMA
 void kvm_arch_register_noncoherent_dma(struct kvm *kvm);
 void kvm_arch_unregister_noncoherent_dma(struct kvm *kvm);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d6b0507861550..26e91000f579d 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -366,6 +366,19 @@ void kvm_flush_remote_tlbs(struct kvm *kvm)
 }
 EXPORT_SYMBOL_GPL(kvm_flush_remote_tlbs);
 
+void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 nr_pages)
+{
+	if (!kvm_arch_flush_remote_tlbs_range(kvm, gfn, nr_pages))
+		return;
+
+	/*
+	 * Fall back to a flushing entire TLBs if the architecture range-based
+	 * TLB invalidation is unsupported or can't be performed for whatever
+	 * reason.
+	 */
+	kvm_flush_remote_tlbs(kvm);
+}
+
 static void kvm_flush_shadow_all(struct kvm *kvm)
 {
 	kvm_arch_flush_shadow_all(kvm);
-- 
2.41.0.640.ga95def55d0-goog

