Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36CF36476BE
	for <lists+linux-mips@lfdr.de>; Thu,  8 Dec 2022 20:41:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbiLHTlZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Dec 2022 14:41:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbiLHTki (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Dec 2022 14:40:38 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A9F4389CC
        for <linux-mips@vger.kernel.org>; Thu,  8 Dec 2022 11:40:19 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id 195-20020a2505cc000000b0071163981d18so2516937ybf.13
        for <linux-mips@vger.kernel.org>; Thu, 08 Dec 2022 11:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tkNWRrDgNwNzqtgNwpxgN/DTrlBNLFki8K4gCSCF3lo=;
        b=Jeo44smHjnYpe2uFwUmmqKcQe01M1Ze9ea9B4uMIU5ntQkPkvB3Zc4thQ3NAsyCsM6
         njB6ARB2/jwqICHZjLWARLgqlROkOE8dE/Nlmg+cddGuhCUdBUCre+Ape5y9bEn1AH0m
         QTNzlGiRNxTFT7VabJhOsxdhwjPofjbAJZ1PCWCHwTDUYPBouSQgwVrjYVu7xNslHehx
         1YNfAbWUQ8IDhGJBMwkGg2u+vzD4HHd3ftPyCOz4Y9YrRbPnwANRWTtpcXIgRmYN6yTS
         OWchh5FCUZ+isGuwUpxCxPxLXQApiy8OtxlS5CtERREsPneeyxTaL8RKmGDzc7PdZpGa
         /plg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tkNWRrDgNwNzqtgNwpxgN/DTrlBNLFki8K4gCSCF3lo=;
        b=M9q3nqSoTnMfiDjo178DNVr72F9AKllM0aBdQHe33evsDIg0rQCox59St472r5WNC+
         3QmS5p2OYCaBLRRzmsTf9QPB3Q0c9HiVKjGKeIj1Xt1mv93j6XFXBiuWBP2DmR8JSPnH
         kAu8Q70HOlyOJVbreqExXvYpbSPYlF9ew77zWN1ACmdhxABCEKKfiSU3m8XwqhNAIC95
         AiJyTH77nckCqcaw/VCmVsiFNgIQ4JBuuHJQD/D/0FfYrqvAzy2hT+Uil+Xnp/QsNT18
         wst7YbiBHTDT8vBBvEIAVixWI5GaI0585f1MO6Bi7wzcMe74AaWYsTXMcz9gE+lEe8Q5
         DVDA==
X-Gm-Message-State: ANoB5plzLqbXrgc8TX3U1K0dpiZUN//exUqU56EjBQtxLlJXt+9skenx
        dPu9/LPD6ZdGTmDioRsv0TqkYxRSLH0SmQ==
X-Google-Smtp-Source: AA0mqf6e/93WEAJhtz+5cgWWhhHXPdHpxdnhitMPWlmfhQ9qhBNIB9WsoIo+5YOGLZdc8lSlrXS+3/eouLkxig==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a25:818d:0:b0:70e:58c:1c8b with SMTP id
 p13-20020a25818d000000b0070e058c1c8bmr2474845ybk.229.1670528408086; Thu, 08
 Dec 2022 11:40:08 -0800 (PST)
Date:   Thu,  8 Dec 2022 11:38:56 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-37-dmatlack@google.com>
Subject: [RFC PATCH 36/37] KVM: x86/mmu: Move is_tdp_mmu_page() to mmu_internal.h
From:   David Matlack <dmatlack@google.com>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Matlack <dmatlack@google.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Nadav Amit <namit@vmware.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Yu Zhao <yuzhao@google.com>,
        Colin Cross <ccross@google.com>,
        Hugh Dickins <hughd@google.com>,
        Ben Gardon <bgardon@google.com>,
        Mingwei Zhang <mizhang@google.com>,
        Krish Sadhukhan <krish.sadhukhan@oracle.com>,
        Ricardo Koller <ricarkol@google.com>,
        Jing Zhang <jingzhangos@google.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Move is_tdp_mmu_page(), which is x86-specific, into mmu_internal.h. This
prepares for moving tdp_mmu.h into common code.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu_internal.h | 9 +++++++++
 arch/x86/kvm/mmu/tdp_mmu.h      | 9 ---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index df815cb84bd2..51aef9624521 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -147,4 +147,13 @@ void *mmu_memory_cache_alloc(struct kvm_mmu_memory_cache *mc);
 void track_possible_nx_huge_page(struct kvm *kvm, struct kvm_mmu_page *sp);
 void untrack_possible_nx_huge_page(struct kvm *kvm, struct kvm_mmu_page *sp);
 
+#ifdef CONFIG_X86_64
+static inline bool is_tdp_mmu_page(struct kvm_mmu_page *sp)
+{
+	return !sp->arch.shadow_mmu_page;
+}
+#else
+static inline bool is_tdp_mmu_page(struct kvm_mmu_page *sp) { return false; }
+#endif
+
 #endif /* __KVM_X86_MMU_INTERNAL_H */
diff --git a/arch/x86/kvm/mmu/tdp_mmu.h b/arch/x86/kvm/mmu/tdp_mmu.h
index 897608be7f75..607c1417abd1 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.h
+++ b/arch/x86/kvm/mmu/tdp_mmu.h
@@ -71,13 +71,4 @@ int kvm_tdp_mmu_get_walk(struct kvm_vcpu *vcpu, u64 addr, u64 *sptes,
 u64 *kvm_tdp_mmu_fast_pf_get_last_sptep(struct kvm_vcpu *vcpu, u64 addr,
 					u64 *spte);
 
-#ifdef CONFIG_X86_64
-static inline bool is_tdp_mmu_page(struct kvm_mmu_page *sp)
-{
-	return !sp->arch.shadow_mmu_page;
-}
-#else
-static inline bool is_tdp_mmu_page(struct kvm_mmu_page *sp) { return false; }
-#endif
-
 #endif /* __KVM_X86_MMU_TDP_MMU_H */
-- 
2.39.0.rc1.256.g54fd8350bd-goog

