Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 852804EF95E
	for <lists+linux-mips@lfdr.de>; Fri,  1 Apr 2022 19:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348189AbiDAR63 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 Apr 2022 13:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350791AbiDAR6Y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 Apr 2022 13:58:24 -0400
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EE271DB3F8
        for <linux-mips@vger.kernel.org>; Fri,  1 Apr 2022 10:56:33 -0700 (PDT)
Received: by mail-pf1-x449.google.com with SMTP id x6-20020aa79566000000b004fb3bf117daso1987139pfq.17
        for <linux-mips@vger.kernel.org>; Fri, 01 Apr 2022 10:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=KCsCCKPJw//ZakmipHFrFH80mcQyRNSTiCbn8jePd0o=;
        b=fHLn2+n3366F34M19Tmgg8BnVu9+LEvD/2GR4UBzeiov31AnJXMHjbvaLIkEhk4j3o
         N2FZDGKKyT0qh/GAFAsu7U+qc4lSEocUuRqAjOf7lQ9u6ItLIqvfQrsKijs6YPJLzBjd
         uC8gf+S8jFrJllP72uEXB2Y+07rGTl1RQKc7glH/ssP6++fOrooznYAYU5n7zg/qKHeW
         iNvNTcMHR5IsB0XNEvYETh9u4AwOCHGs2pl2pc1vOsB7472EF6j2krfhqIl8ZUkBnDZD
         UIZ5nzt2s0eTLQqqA6efcgkB3hYEgq0tDT4G/RkeDl6nWFCfmeYN3u6h2EoKQ3p5BEMe
         hyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=KCsCCKPJw//ZakmipHFrFH80mcQyRNSTiCbn8jePd0o=;
        b=DvYikLKZb4INHmujcz/Dio6FFO0MQwsTrU+PCKz7UiWtB5qiaOPcSm0iOfnMfgwbk/
         VVrq+conp6AbsV1DX/dsN3FgYbJTv00JjjFxcGgddY6Rhlb2l7CviQPrn4KMUY5HOqAL
         5ddl2TdyBHrttH4LuI04Zs5s8IkEzdNqBMvb2pELc+XDOSTBGNWLrCpdC22FNj0cjWCN
         DovW0V2zeXn613+/7xBP9vX3+sY7M+BsktrasjfagXbm6bDQMQhnKBaO64FtI5k+p9Qi
         S1BWLno5AKmRaESOB0zj6vS9LNEvRnFk+ihrU59+Yo9yliHF5L5ROTDyt0VdjrHFueU4
         fkpg==
X-Gm-Message-State: AOAM530nOJB5CSqvbWHNEAWrYD9asLQ8Yq0kyDlgemtDN2d2+TxJen/K
        uqX0cEVuf5OHfQemTxo/dZ/+ZQhIYJtGig==
X-Google-Smtp-Source: ABdhPJx3yk8DGw0UUUnESqpCywr8AT/K25hWiO7n8nNV5Yk05HotoBcuxffoYGIonmxFrdqGUZzHk5X3TRJ/9w==
X-Received: from dmatlack-heavy.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:19cd])
 (user=dmatlack job=sendgmr) by 2002:a62:1dc9:0:b0:4fa:e4d2:7745 with SMTP id
 d192-20020a621dc9000000b004fae4d27745mr11986119pfd.61.1648835793113; Fri, 01
 Apr 2022 10:56:33 -0700 (PDT)
Date:   Fri,  1 Apr 2022 17:55:51 +0000
In-Reply-To: <20220401175554.1931568-1-dmatlack@google.com>
Message-Id: <20220401175554.1931568-21-dmatlack@google.com>
Mime-Version: 1.0
References: <20220401175554.1931568-1-dmatlack@google.com>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH v3 20/23] KVM: Allow for different capacities in
 kvm_mmu_memory_cache structs
From:   David Matlack <dmatlack@google.com>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
        Andrew Jones <drjones@redhat.com>,
        Ben Gardon <bgardon@google.com>, Peter Xu <peterx@redhat.com>,
        maciej.szmigiero@oracle.com,
        "moderated list:KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)" 
        <kvmarm@lists.cs.columbia.edu>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <linux-mips@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <kvm@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" 
        <kvm-riscv@lists.infradead.org>, Peter Feiner <pfeiner@google.com>,
        David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Allow the capacity of the kvm_mmu_memory_cache struct to be chosen at
declaration time rather than being fixed for all declarations. This will
be used in a follow-up commit to declare an cache in x86 with a capacity
of 512+ objects without having to increase the capacity of all caches in
KVM.

This change requires each cache now specify its capacity at runtime,
since the cache struct itself no longer has a fixed capacity known at
compile time. To protect against someone accidentally defining a
kvm_mmu_memory_cache struct directly (without the extra storage), this
commit includes a WARN_ON() in kvm_mmu_topup_memory_cache().

This change, unfortunately, adds some grottiness to
kvm_phys_addr_ioremap() in arm64, which uses a function-local (i.e.
stack-allocated) kvm_mmu_memory_cache struct. Since C does not allow
anonymous structs in functions, the new wrapper struct that contains
kvm_mmu_memory_cache and the objects pointer array, must be named, which
means dealing with an outer and inner struct. The outer struct can't be
dropped since then there would be no guarantee the kvm_mmu_memory_cache
struct and objects array would be laid out consecutively on the stack.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/arm64/include/asm/kvm_host.h |  2 +-
 arch/arm64/kvm/arm.c              |  1 +
 arch/arm64/kvm/mmu.c              | 13 +++++++++----
 arch/mips/include/asm/kvm_host.h  |  2 +-
 arch/mips/kvm/mips.c              |  2 ++
 arch/riscv/include/asm/kvm_host.h |  2 +-
 arch/riscv/kvm/mmu.c              | 17 ++++++++++-------
 arch/riscv/kvm/vcpu.c             |  1 +
 arch/x86/include/asm/kvm_host.h   |  8 ++++----
 arch/x86/kvm/mmu/mmu.c            |  9 +++++++++
 include/linux/kvm_types.h         | 19 +++++++++++++++++--
 virt/kvm/kvm_main.c               | 10 +++++++++-
 12 files changed, 65 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 0e96087885fe..4670491899de 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -362,7 +362,7 @@ struct kvm_vcpu_arch {
 	bool pause;
 
 	/* Cache some mmu pages needed inside spinlock regions */
-	struct kvm_mmu_memory_cache mmu_page_cache;
+	DEFINE_KVM_MMU_MEMORY_CACHE(mmu_page_cache);
 
 	/* Target CPU and feature flags */
 	int target;
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index ba9165e84396..af4d8a490af5 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -320,6 +320,7 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	vcpu->arch.target = -1;
 	bitmap_zero(vcpu->arch.features, KVM_VCPU_MAX_FEATURES);
 
+	vcpu->arch.mmu_page_cache.capacity = KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE;
 	vcpu->arch.mmu_page_cache.gfp_zero = __GFP_ZERO;
 
 	/* Set up the timer */
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 0d19259454d8..01e15bcb7be2 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -764,7 +764,12 @@ int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
 {
 	phys_addr_t addr;
 	int ret = 0;
-	struct kvm_mmu_memory_cache cache = { 0, __GFP_ZERO, NULL, };
+	DEFINE_KVM_MMU_MEMORY_CACHE(cache) page_cache = {
+		.cache = {
+			.gfp_zero = __GFP_ZERO,
+			.capacity = KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE,
+		},
+	};
 	struct kvm_pgtable *pgt = kvm->arch.mmu.pgt;
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_DEVICE |
 				     KVM_PGTABLE_PROT_R |
@@ -777,14 +782,14 @@ int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
 	guest_ipa &= PAGE_MASK;
 
 	for (addr = guest_ipa; addr < guest_ipa + size; addr += PAGE_SIZE) {
-		ret = kvm_mmu_topup_memory_cache(&cache,
+		ret = kvm_mmu_topup_memory_cache(&page_cache.cache,
 						 kvm_mmu_cache_min_pages(kvm));
 		if (ret)
 			break;
 
 		write_lock(&kvm->mmu_lock);
 		ret = kvm_pgtable_stage2_map(pgt, addr, PAGE_SIZE, pa, prot,
-					     &cache);
+					     &page_cache.cache);
 		write_unlock(&kvm->mmu_lock);
 		if (ret)
 			break;
@@ -792,7 +797,7 @@ int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
 		pa += PAGE_SIZE;
 	}
 
-	kvm_mmu_free_memory_cache(&cache);
+	kvm_mmu_free_memory_cache(&page_cache.cache);
 	return ret;
 }
 
diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 717716cc51c5..935511d7fc3a 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -347,7 +347,7 @@ struct kvm_vcpu_arch {
 	unsigned long pending_exceptions_clr;
 
 	/* Cache some mmu pages needed inside spinlock regions */
-	struct kvm_mmu_memory_cache mmu_page_cache;
+	DEFINE_KVM_MMU_MEMORY_CACHE(mmu_page_cache);
 
 	/* vcpu's vzguestid is different on each host cpu in an smp system */
 	u32 vzguestid[NR_CPUS];
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index a25e0b73ee70..45c7179144dc 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -387,6 +387,8 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	if (err)
 		goto out_free_gebase;
 
+	vcpu->arch.mmu_page_cache.capacity = KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE;
+
 	return 0;
 
 out_free_gebase:
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 78da839657e5..4ec0b7a3d515 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -186,7 +186,7 @@ struct kvm_vcpu_arch {
 	struct kvm_sbi_context sbi_context;
 
 	/* Cache pages needed to program page tables with spinlock held */
-	struct kvm_mmu_memory_cache mmu_page_cache;
+	DEFINE_KVM_MMU_MEMORY_CACHE(mmu_page_cache);
 
 	/* VCPU power-off state */
 	bool power_off;
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index f80a34fbf102..5ffd164a5aeb 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -347,10 +347,12 @@ static int stage2_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
 	int ret = 0;
 	unsigned long pfn;
 	phys_addr_t addr, end;
-	struct kvm_mmu_memory_cache pcache;
-
-	memset(&pcache, 0, sizeof(pcache));
-	pcache.gfp_zero = __GFP_ZERO;
+	DEFINE_KVM_MMU_MEMORY_CACHE(cache) page_cache = {
+		.cache = {
+			.gfp_zero = __GFP_ZERO,
+			.capacity = KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE,
+		},
+	};
 
 	end = (gpa + size + PAGE_SIZE - 1) & PAGE_MASK;
 	pfn = __phys_to_pfn(hpa);
@@ -361,12 +363,13 @@ static int stage2_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
 		if (!writable)
 			pte = pte_wrprotect(pte);
 
-		ret = kvm_mmu_topup_memory_cache(&pcache, stage2_pgd_levels);
+		ret = kvm_mmu_topup_memory_cache(&page_cache.cache,
+						 stage2_pgd_levels);
 		if (ret)
 			goto out;
 
 		spin_lock(&kvm->mmu_lock);
-		ret = stage2_set_pte(kvm, 0, &pcache, addr, &pte);
+		ret = stage2_set_pte(kvm, 0, &page_cache.cache, addr, &pte);
 		spin_unlock(&kvm->mmu_lock);
 		if (ret)
 			goto out;
@@ -375,7 +378,7 @@ static int stage2_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
 	}
 
 out:
-	kvm_mmu_free_memory_cache(&pcache);
+	kvm_mmu_free_memory_cache(&page_cache.cache);
 	return ret;
 }
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 624166004e36..6a5f5aa45bac 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -94,6 +94,7 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 
 	/* Mark this VCPU never ran */
 	vcpu->arch.ran_atleast_once = false;
+	vcpu->arch.mmu_page_cache.capacity = KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE;
 	vcpu->arch.mmu_page_cache.gfp_zero = __GFP_ZERO;
 
 	/* Setup ISA features available to VCPU */
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index be4349c9ffea..ffb2b99f3a60 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -694,10 +694,10 @@ struct kvm_vcpu_arch {
 	 */
 	struct kvm_mmu *walk_mmu;
 
-	struct kvm_mmu_memory_cache mmu_pte_list_desc_cache;
-	struct kvm_mmu_memory_cache mmu_shadow_page_cache;
-	struct kvm_mmu_memory_cache mmu_shadowed_info_cache;
-	struct kvm_mmu_memory_cache mmu_page_header_cache;
+	DEFINE_KVM_MMU_MEMORY_CACHE(mmu_pte_list_desc_cache);
+	DEFINE_KVM_MMU_MEMORY_CACHE(mmu_shadow_page_cache);
+	DEFINE_KVM_MMU_MEMORY_CACHE(mmu_shadowed_info_cache);
+	DEFINE_KVM_MMU_MEMORY_CACHE(mmu_page_header_cache);
 
 	/*
 	 * QEMU userspace and the guest each have their own FPU state.
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index f058f28909ea..a8200b3f8782 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -5800,12 +5800,21 @@ int kvm_mmu_create(struct kvm_vcpu *vcpu)
 {
 	int ret;
 
+	vcpu->arch.mmu_pte_list_desc_cache.capacity =
+		KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE;
 	vcpu->arch.mmu_pte_list_desc_cache.kmem_cache = pte_list_desc_cache;
 	vcpu->arch.mmu_pte_list_desc_cache.gfp_zero = __GFP_ZERO;
 
+	vcpu->arch.mmu_page_header_cache.capacity =
+		KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE;
 	vcpu->arch.mmu_page_header_cache.kmem_cache = mmu_page_header_cache;
 	vcpu->arch.mmu_page_header_cache.gfp_zero = __GFP_ZERO;
 
+	vcpu->arch.mmu_shadowed_info_cache.capacity =
+		KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE;
+
+	vcpu->arch.mmu_shadow_page_cache.capacity =
+		KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE;
 	vcpu->arch.mmu_shadow_page_cache.gfp_zero = __GFP_ZERO;
 
 	vcpu->arch.mmu = &vcpu->arch.root_mmu;
diff --git a/include/linux/kvm_types.h b/include/linux/kvm_types.h
index ac1ebb37a0ff..579cf39986ec 100644
--- a/include/linux/kvm_types.h
+++ b/include/linux/kvm_types.h
@@ -83,14 +83,29 @@ struct gfn_to_pfn_cache {
  * MMU flows is problematic, as is triggering reclaim, I/O, etc... while
  * holding MMU locks.  Note, these caches act more like prefetch buffers than
  * classical caches, i.e. objects are not returned to the cache on being freed.
+ *
+ * The storage for the cache object pointers is laid out after the struct, to
+ * allow different declarations to choose different capacities. The capacity
+ * field defines the number of object pointers available after the struct.
  */
 struct kvm_mmu_memory_cache {
 	int nobjs;
+	int capacity;
 	gfp_t gfp_zero;
 	struct kmem_cache *kmem_cache;
-	void *objects[KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE];
+	void *objects[];
 };
-#endif
+
+#define __DEFINE_KVM_MMU_MEMORY_CACHE(_name, _capacity)		\
+	struct {						\
+		struct kvm_mmu_memory_cache _name;		\
+		void *_name##_objects[_capacity];		\
+	}
+
+#define DEFINE_KVM_MMU_MEMORY_CACHE(_name) \
+	__DEFINE_KVM_MMU_MEMORY_CACHE(_name, KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE)
+
+#endif /* KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE */
 
 #define HALT_POLL_HIST_COUNT			32
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 70e05af5ebea..c4cac4195f4a 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -373,9 +373,17 @@ int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min)
 {
 	void *obj;
 
+	/*
+	 * The capacity fieldmust be initialized since the storage for the
+	 * objects pointer array is laid out after the kvm_mmu_memory_cache
+	 * struct and not known at compile time.
+	 */
+	if (WARN_ON(mc->capacity == 0))
+		return -EINVAL;
+
 	if (mc->nobjs >= min)
 		return 0;
-	while (mc->nobjs < ARRAY_SIZE(mc->objects)) {
+	while (mc->nobjs < mc->capacity) {
 		obj = mmu_memory_cache_alloc_obj(mc, GFP_KERNEL_ACCOUNT);
 		if (!obj)
 			return mc->nobjs >= min ? 0 : -ENOMEM;
-- 
2.35.1.1094.g7c7d902a7c-goog

