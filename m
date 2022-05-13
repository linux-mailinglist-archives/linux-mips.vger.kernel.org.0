Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F07E526B54
	for <lists+linux-mips@lfdr.de>; Fri, 13 May 2022 22:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384298AbiEMU3V (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 May 2022 16:29:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384308AbiEMU3C (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 May 2022 16:29:02 -0400
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFFB674DFF
        for <linux-mips@vger.kernel.org>; Fri, 13 May 2022 13:28:50 -0700 (PDT)
Received: by mail-pg1-x549.google.com with SMTP id s68-20020a637747000000b003aaff19b95bso4667533pgc.1
        for <linux-mips@vger.kernel.org>; Fri, 13 May 2022 13:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=urKzIekSt4ry/GhLVLiJhh3xC2/RJ3LQSXDjmJ65Jo0=;
        b=SaiTMr31y0oDFEGzZykrrjRArqJzvgRKUcMLec6CD0eeeJdw2h4SF1ZSljm61841B3
         AmJ/VRFocwNUPQkBUFwUUcMUpBofknPEHL5DUGjp76aPVMJhgUQM6C3uNz8lWCE/tyR7
         pIlkytzLyhaE8cSGymt+um8sZy+EIk7cxiTPQHO6GITnj8uGSBWF7yh+q7BFLoYLxrTA
         w9XXi+mBxh5UIOpNkssUGV9OR9+uBMDhYF7Ou2gJCRCxVocEHh1SNHSxM3sDaGL4pSBQ
         PwdIhDi/xKCd+p9CKcgLe3OpjVPf24Jm2Peod+6Zj1tSjo2xRLjB2L0QM+rlXCZr0Oso
         3t0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=urKzIekSt4ry/GhLVLiJhh3xC2/RJ3LQSXDjmJ65Jo0=;
        b=UMkYQ/cIQpD4qKWyUEkmcoCNdZsgeWeu2Jyvy+9+0/u4ooJs+G9iu+/anFEluFiSva
         nBcRBiJ8w8MEpKBpKJxlFRFg2PGxJ8c5/GcEA7dn8SVSDg2JUKwA431XbKIWQOfQYZgX
         IdKHWAoZC2VOI7p4Q6/giTwKFQmNWrItKiHUe9QjLCOrcL+ZPiU17d/Zo+jbpd013FLj
         e2WzPcwm6mleKxkH4HUx+i5PspLdSPVwgOJcfizNwZfQEjWsyCOFR+B2pSki0EmBLNHK
         HYRuIIXFRJo9ooh1soBxqiKgfjvNSULfBXbfPznm0YKNxxyISAS9yraXETfMzqKndcQZ
         za3Q==
X-Gm-Message-State: AOAM531g5zu1gThRc3rDmQrw935WNnwLT5X5NCviYcQeX6vNUtdEzDYq
        Sj++q6HPzUmMR7R2MfXImHyLFyR13TSS/w==
X-Google-Smtp-Source: ABdhPJxJiiLUXK1V6iCWGjV271VoDavJxN+SADxyQxekrK4f71Ht/23h8YqqMMSjzWmGv8welIHLZcGk1iroJg==
X-Received: from dmatlack-heavy.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:19cd])
 (user=dmatlack job=sendgmr) by 2002:a62:a211:0:b0:50d:cdb2:87f4 with SMTP id
 m17-20020a62a211000000b0050dcdb287f4mr5959919pff.63.1652473730247; Fri, 13
 May 2022 13:28:50 -0700 (PDT)
Date:   Fri, 13 May 2022 20:28:09 +0000
In-Reply-To: <20220513202819.829591-1-dmatlack@google.com>
Message-Id: <20220513202819.829591-12-dmatlack@google.com>
Mime-Version: 1.0
References: <20220513202819.829591-1-dmatlack@google.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [PATCH v5 11/21] KVM: x86/mmu: Pass kvm pointer separately from vcpu
 to kvm_mmu_find_shadow_page()
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
        Lai Jiangshan <jiangshanlai@gmail.com>,
        David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Get the kvm pointer from the caller, rather than deriving it from
vcpu->kvm, and plumb the kvm pointer all the way from
kvm_mmu_get_shadow_page(). With this change in place, the vcpu pointer
is only needed to sync indirect shadow pages. In other words,
__kvm_mmu_get_shadow_page() can now be used to get *direct* shadow pages
without a vcpu pointer. This enables eager page splitting, which needs
to allocate direct shadow pages during VM ioctls.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 9cc73c3453c3..cf27c5de9dc0 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2001,7 +2001,8 @@ static void clear_sp_write_flooding_count(u64 *spte)
 	__clear_sp_write_flooding_count(sptep_to_sp(spte));
 }
 
-static struct kvm_mmu_page *kvm_mmu_find_shadow_page(struct kvm_vcpu *vcpu,
+static struct kvm_mmu_page *kvm_mmu_find_shadow_page(struct kvm *kvm,
+						     struct kvm_vcpu *vcpu,
 						     gfn_t gfn,
 						     struct hlist_head *sp_list,
 						     union kvm_mmu_page_role role)
@@ -2011,7 +2012,7 @@ static struct kvm_mmu_page *kvm_mmu_find_shadow_page(struct kvm_vcpu *vcpu,
 	int collisions = 0;
 	LIST_HEAD(invalid_list);
 
-	for_each_valid_sp(vcpu->kvm, sp, sp_list) {
+	for_each_valid_sp(kvm, sp, sp_list) {
 		if (sp->gfn != gfn) {
 			collisions++;
 			continue;
@@ -2028,7 +2029,7 @@ static struct kvm_mmu_page *kvm_mmu_find_shadow_page(struct kvm_vcpu *vcpu,
 			 * upper-level page will be write-protected.
 			 */
 			if (role.level > PG_LEVEL_4K && sp->unsync)
-				kvm_mmu_prepare_zap_page(vcpu->kvm, sp,
+				kvm_mmu_prepare_zap_page(kvm, sp,
 							 &invalid_list);
 			continue;
 		}
@@ -2056,7 +2057,7 @@ static struct kvm_mmu_page *kvm_mmu_find_shadow_page(struct kvm_vcpu *vcpu,
 
 			WARN_ON(!list_empty(&invalid_list));
 			if (ret > 0)
-				kvm_flush_remote_tlbs(vcpu->kvm);
+				kvm_flush_remote_tlbs(kvm);
 		}
 
 		__clear_sp_write_flooding_count(sp);
@@ -2065,13 +2066,13 @@ static struct kvm_mmu_page *kvm_mmu_find_shadow_page(struct kvm_vcpu *vcpu,
 	}
 
 	sp = NULL;
-	++vcpu->kvm->stat.mmu_cache_miss;
+	++kvm->stat.mmu_cache_miss;
 
 out:
-	kvm_mmu_commit_zap_page(vcpu->kvm, &invalid_list);
+	kvm_mmu_commit_zap_page(kvm, &invalid_list);
 
-	if (collisions > vcpu->kvm->stat.max_mmu_page_hash_collisions)
-		vcpu->kvm->stat.max_mmu_page_hash_collisions = collisions;
+	if (collisions > kvm->stat.max_mmu_page_hash_collisions)
+		kvm->stat.max_mmu_page_hash_collisions = collisions;
 	return sp;
 }
 
@@ -2115,7 +2116,8 @@ static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm *kvm,
 	return sp;
 }
 
-static struct kvm_mmu_page *__kvm_mmu_get_shadow_page(struct kvm_vcpu *vcpu,
+static struct kvm_mmu_page *__kvm_mmu_get_shadow_page(struct kvm *kvm,
+						      struct kvm_vcpu *vcpu,
 						      struct shadow_page_caches *caches,
 						      gfn_t gfn,
 						      union kvm_mmu_page_role role)
@@ -2124,12 +2126,12 @@ static struct kvm_mmu_page *__kvm_mmu_get_shadow_page(struct kvm_vcpu *vcpu,
 	struct kvm_mmu_page *sp;
 	bool created = false;
 
-	sp_list = &vcpu->kvm->arch.mmu_page_hash[kvm_page_table_hashfn(gfn)];
+	sp_list = &kvm->arch.mmu_page_hash[kvm_page_table_hashfn(gfn)];
 
-	sp = kvm_mmu_find_shadow_page(vcpu, gfn, sp_list, role);
+	sp = kvm_mmu_find_shadow_page(kvm, vcpu, gfn, sp_list, role);
 	if (!sp) {
 		created = true;
-		sp = kvm_mmu_alloc_shadow_page(vcpu->kvm, caches, gfn, sp_list, role);
+		sp = kvm_mmu_alloc_shadow_page(kvm, caches, gfn, sp_list, role);
 	}
 
 	trace_kvm_mmu_get_page(sp, created);
@@ -2146,7 +2148,7 @@ static struct kvm_mmu_page *kvm_mmu_get_shadow_page(struct kvm_vcpu *vcpu,
 		.gfn_array_cache = &vcpu->arch.mmu_gfn_array_cache,
 	};
 
-	return __kvm_mmu_get_shadow_page(vcpu, &caches, gfn, role);
+	return __kvm_mmu_get_shadow_page(vcpu->kvm, vcpu, &caches, gfn, role);
 }
 
 static union kvm_mmu_page_role kvm_mmu_child_role(u64 *sptep, bool direct, u32 access)
-- 
2.36.0.550.gb090851708-goog

