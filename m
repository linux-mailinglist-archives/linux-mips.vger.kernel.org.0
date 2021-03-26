Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6CB4349F79
	for <lists+linux-mips@lfdr.de>; Fri, 26 Mar 2021 03:21:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231380AbhCZCUu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Mar 2021 22:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbhCZCUS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 25 Mar 2021 22:20:18 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56879C06174A
        for <linux-mips@vger.kernel.org>; Thu, 25 Mar 2021 19:20:18 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id a63so8342669yba.2
        for <linux-mips@vger.kernel.org>; Thu, 25 Mar 2021 19:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=ekrm2c/tqxhNwDvhLUIyqs8YOIeJgqbSqOnwbax18+4=;
        b=YdcQ98I9Yi31BYfbI5mofNqLu0s7zazK9SXYPeQVW3A0CsE8n8uwBsqfbrz+hNJeQf
         hKlw9Bs18EPix8GTbqdkIeGm9sfXQfWIqb6TGvA147qbGXU1fsBMhocy59Uzn9A3GAyv
         gB5hL59tW49+9qOGxMcoW/9yOyKalk5S1kT135YJHHpScFacGdPRu7tr3SYyNe1mKpiy
         06NU9OU3xpk0kp3BsWshhi6KqV/dH9Rc1GySZ3ZPI1WIwvn5gqlGmaFU8630EnxnDHBt
         KRksC6VkE64tKcsQx0/LKny3LDeHzk+PJJGthXI+fWDcixqCyJZHU6DQXz1ZGjHfs3Zg
         LQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=ekrm2c/tqxhNwDvhLUIyqs8YOIeJgqbSqOnwbax18+4=;
        b=icn8zxgzB+M74ZwNij8PPxL5X+IqUwIbUIrnjF8jpeCyT3AF+zoh+gbzKEp7OCjZUu
         UIm7Hpx4UaZUlo0t7GjymKAttpKwh6wcHqjQfcWOj6R2cPAfuElIm11iG0BAtfZM/ZgC
         Ey6p3fNOQmp7lla7Zf6Ww0I8tAwro/raBC7kYbZZgj75J11IhwZUlfJEuXuM9u5ULt+7
         cWz7no4JJ94//pijTvLoBMGbECi9G1RcQaaNDfmF71My1TS5qRsqlZACgJM3wkEzO7JH
         YSfIvdDOHlyxmb8BixPC+lvgTUtLGBy7eS4YMKfjdgCM+SEvePfJHcfcuZ63fGa5jx8t
         D22g==
X-Gm-Message-State: AOAM530Uu2Ie/+h8en96LI4jZQ4uVJ61hMtVp9fI0RnpvTyULkcOYMIH
        C/7DQLCVYap26u5yglHKMOVjxkOS05A=
X-Google-Smtp-Source: ABdhPJy4BNfi8kFTaWHGl2NnTrrMeNaxLwOf/RoltlD+YFEkS/eJEmRMjOGw4TqA/0qE4SiqmN8Awa2q6w0=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:f:10:b1bb:fab2:7ef5:fc7d])
 (user=seanjc job=sendgmr) by 2002:a25:bb41:: with SMTP id b1mr16191964ybk.249.1616725217602;
 Thu, 25 Mar 2021 19:20:17 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Thu, 25 Mar 2021 19:19:42 -0700
In-Reply-To: <20210326021957.1424875-1-seanjc@google.com>
Message-Id: <20210326021957.1424875-4-seanjc@google.com>
Mime-Version: 1.0
References: <20210326021957.1424875-1-seanjc@google.com>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
Subject: [PATCH 03/18] KVM: x86/mmu: Coalesce TLB flushes when zapping
 collapsible SPTEs
From:   Sean Christopherson <seanjc@google.com>
To:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ben Gardon <bgardon@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Gather pending TLB flushes across both the legacy and TDP MMUs when
zapping collapsible SPTEs to avoid multiple flushes if both the legacy
MMU (for nested guests) and TDP MMU have mappings for the memslot.

Note, this also optimizes the TDP MMU to flush only the relevant range
when running as L1 with Hyper-V enlightenments.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c     | 6 ++++--
 arch/x86/kvm/mmu/tdp_mmu.c | 8 +++-----
 arch/x86/kvm/mmu/tdp_mmu.h | 4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index d5c9fb34971a..37e2432c78ca 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -5607,11 +5607,13 @@ void kvm_mmu_zap_collapsible_sptes(struct kvm *kvm,
 
 	write_lock(&kvm->mmu_lock);
 	flush = slot_handle_leaf(kvm, slot, kvm_mmu_zap_collapsible_spte, true);
+
+	if (is_tdp_mmu_enabled(kvm))
+		flush = kvm_tdp_mmu_zap_collapsible_sptes(kvm, slot, flush);
+
 	if (flush)
 		kvm_arch_flush_remote_tlbs_memslot(kvm, slot);
 
-	if (is_tdp_mmu_enabled(kvm))
-		kvm_tdp_mmu_zap_collapsible_sptes(kvm, slot);
 	write_unlock(&kvm->mmu_lock);
 }
 
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 463f1be6ff0d..ff2bb0c8012e 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1320,11 +1320,10 @@ static bool zap_collapsible_spte_range(struct kvm *kvm,
  * Clear non-leaf entries (and free associated page tables) which could
  * be replaced by large mappings, for GFNs within the slot.
  */
-void kvm_tdp_mmu_zap_collapsible_sptes(struct kvm *kvm,
-				       struct kvm_memory_slot *slot)
+bool kvm_tdp_mmu_zap_collapsible_sptes(struct kvm *kvm,
+				       struct kvm_memory_slot *slot, bool flush)
 {
 	struct kvm_mmu_page *root;
-	bool flush = false;
 	int root_as_id;
 
 	for_each_tdp_mmu_root_yield_safe(kvm, root) {
@@ -1335,8 +1334,7 @@ void kvm_tdp_mmu_zap_collapsible_sptes(struct kvm *kvm,
 		flush = zap_collapsible_spte_range(kvm, root, slot, flush);
 	}
 
-	if (flush)
-		kvm_flush_remote_tlbs(kvm);
+	return flush;
 }
 
 /*
diff --git a/arch/x86/kvm/mmu/tdp_mmu.h b/arch/x86/kvm/mmu/tdp_mmu.h
index 715aa4e0196d..9ecd8f79f861 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.h
+++ b/arch/x86/kvm/mmu/tdp_mmu.h
@@ -54,8 +54,8 @@ void kvm_tdp_mmu_clear_dirty_pt_masked(struct kvm *kvm,
 				       struct kvm_memory_slot *slot,
 				       gfn_t gfn, unsigned long mask,
 				       bool wrprot);
-void kvm_tdp_mmu_zap_collapsible_sptes(struct kvm *kvm,
-				       struct kvm_memory_slot *slot);
+bool kvm_tdp_mmu_zap_collapsible_sptes(struct kvm *kvm,
+				       struct kvm_memory_slot *slot, bool flush);
 
 bool kvm_tdp_mmu_write_protect_gfn(struct kvm *kvm,
 				   struct kvm_memory_slot *slot, gfn_t gfn);
-- 
2.31.0.291.g576ba9dcdaf-goog

