Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E456E7786BE
	for <lists+linux-mips@lfdr.de>; Fri, 11 Aug 2023 06:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233747AbjHKEwY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Aug 2023 00:52:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233159AbjHKEv6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 11 Aug 2023 00:51:58 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD6A82D7D
        for <linux-mips@vger.kernel.org>; Thu, 10 Aug 2023 21:51:46 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-583d1d0de65so20507207b3.0
        for <linux-mips@vger.kernel.org>; Thu, 10 Aug 2023 21:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691729506; x=1692334306;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CwKTqZRHBF6wuN1C9cAW2HapO35gWwZnaXscRj6lwnc=;
        b=siKzlnyeJYxNxz3Le8APQ8uLcQDtQqwiSQdt6bti4OnKCrnHioFgjEot+EwjAKZlZk
         P9katyZ2JtDsI8FPdIPMQYuckWNVQ5RfjwpRdQhAMFEwhgD7E0eUrp3A0uStx/N0UzhL
         4Ib4FS/HKhPlrslYEhf4bRkLeti0q5O+S43TqWtGnA5mbcXMOQ0sOHExR4e18KudVMIM
         +gsKAXATZIeVV6zWjmXpe2nel8pvZAoV6Cdm7wSDFmb+FgKWoTaCWMpAZi1va3S+D+BS
         4KbaNzlRFGZu0d060Mbd+mqHAW0BvsFI1Oql8h2q/mQt8DVk9UFWyigyB13jSZ+L3pM7
         Nm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691729506; x=1692334306;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CwKTqZRHBF6wuN1C9cAW2HapO35gWwZnaXscRj6lwnc=;
        b=bTpp20Aa4AUnKRe/qT20QcTSAOxEahVhj49/AGgR1ajOkuK57jZeOYAvYQIes/GnsG
         9+NEoVYtdnBtxn3gwoH021WHGLREv7CiZML2SiTYj03wTdc98bdvBaUiAnxsP5Vhwo8Q
         QudiZ1UfmUEisc1wG2rO3Rb2dAg3w1oOicIAdXVWh3kfoKgjX5tVvjcRtjbv9SXAi5g8
         EaeZ048yRByMMy9mVRXDNxjuurUP1FgYWLrw77XtfyTduymgWOquhQZS4PV7ST0AxR6V
         +93AViICq9XRa9atHnOX7MYep7aS6551se7ELdT81a/ODZzrLZRhSG3QWF5bpK/RiQVF
         9Pmg==
X-Gm-Message-State: AOJu0YwEYufptmM3ftm4X4yN/k+lhYrKcX269H3BhiBMn0WGul98Rave
        gx9Pj1MAFPW0G0vkQJM/fhtDcLYd/kdI
X-Google-Smtp-Source: AGHT+IEoLRdyr3lsTK4vKyN6f7vXGgpqz2mVAAYTzW+KAu5EcGudZd07SchN8aesdD/7sDPFXHJ3RHFbNwel
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a25:8185:0:b0:d63:1d2b:624e with SMTP id
 p5-20020a258185000000b00d631d2b624emr9342ybk.0.1691729505983; Thu, 10 Aug
 2023 21:51:45 -0700 (PDT)
Date:   Fri, 11 Aug 2023 04:51:23 +0000
In-Reply-To: <20230811045127.3308641-1-rananta@google.com>
Mime-Version: 1.0
References: <20230811045127.3308641-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230811045127.3308641-11-rananta@google.com>
Subject: [PATCH v9 10/14] KVM: arm64: Define kvm_tlb_flush_vmid_range()
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
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Implement the helper kvm_tlb_flush_vmid_range() that acts
as a wrapper for range-based TLB invalidations. For the
given VMID, use the range-based TLBI instructions to do
the job or fallback to invalidating all the TLB entries.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 10 ++++++++++
 arch/arm64/kvm/hyp/pgtable.c         | 20 ++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 8294a9a7e566d..5e8b1ff07854b 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -754,4 +754,14 @@ enum kvm_pgtable_prot kvm_pgtable_stage2_pte_prot(kvm_pte_t pte);
  *	   kvm_pgtable_prot format.
  */
 enum kvm_pgtable_prot kvm_pgtable_hyp_pte_prot(kvm_pte_t pte);
+
+/**
+ * kvm_tlb_flush_vmid_range() - Invalidate/flush a range of TLB entries
+ *
+ * @mmu:	Stage-2 KVM MMU struct
+ * @addr:	The base Intermediate physical address from which to invalidate
+ * @size:	Size of the range from the base to invalidate
+ */
+void kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
+				phys_addr_t addr, size_t size);
 #endif	/* __ARM64_KVM_PGTABLE_H__ */
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index aa740a974e024..5d14d5d5819a1 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -670,6 +670,26 @@ static bool stage2_has_fwb(struct kvm_pgtable *pgt)
 	return !(pgt->flags & KVM_PGTABLE_S2_NOFWB);
 }
 
+void kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
+				phys_addr_t addr, size_t size)
+{
+	unsigned long pages, inval_pages;
+
+	if (!system_supports_tlb_range()) {
+		kvm_call_hyp(__kvm_tlb_flush_vmid, mmu);
+		return;
+	}
+
+	pages = size >> PAGE_SHIFT;
+	while (pages > 0) {
+		inval_pages = min(pages, MAX_TLBI_RANGE_PAGES);
+		kvm_call_hyp(__kvm_tlb_flush_vmid_range, mmu, addr, inval_pages);
+
+		addr += inval_pages << PAGE_SHIFT;
+		pages -= inval_pages;
+	}
+}
+
 #define KVM_S2_MEMATTR(pgt, attr) PAGE_S2_MEMATTR(attr, stage2_has_fwb(pgt))
 
 static int stage2_set_prot_attr(struct kvm_pgtable *pgt, enum kvm_pgtable_prot prot,
-- 
2.41.0.640.ga95def55d0-goog

