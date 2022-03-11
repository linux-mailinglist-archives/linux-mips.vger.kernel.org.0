Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C87414D5692
	for <lists+linux-mips@lfdr.de>; Fri, 11 Mar 2022 01:26:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345162AbiCKA0p (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Mar 2022 19:26:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345172AbiCKA0o (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Mar 2022 19:26:44 -0500
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCA161A2703
        for <linux-mips@vger.kernel.org>; Thu, 10 Mar 2022 16:25:41 -0800 (PST)
Received: by mail-pl1-x64a.google.com with SMTP id z10-20020a170902708a00b0014fc3888923so3540045plk.22
        for <linux-mips@vger.kernel.org>; Thu, 10 Mar 2022 16:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=E1f7dwVMCTIQxzMxcNwcOjBa8usGSsNkBUA4TV7/K5Q=;
        b=dyFlaYzlo6UILgMHQAlPkaaMWow2Ul4B7LMcFG47WnUc9EGN8o4wI1lMnJ3utbSG7p
         q9GeTDSR1RhxNQy56RSpOC5NArGbG4gGdb7XRaIJJfeqUYsywCbqkmnVbTgkMS9Wau2M
         qeWdDfXmPCEfp84dJU25XOuzordVzgtSPCRymjS7qB1/GTeYHqtXALIOMRi2PQLz5BvD
         AdyrtucZlIf+ZhYFru+CvqSrBIOWiaZHMvEkUi3BaaeFk2pLY6D+IXBbJE9WAoXsMSuR
         A54OuPtVrIT/1g7o3yy9wrm+WFzZFhuIaFAK0CDO/gJBFzmHnhMWGPNd5MLO3oeSADwf
         qhOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=E1f7dwVMCTIQxzMxcNwcOjBa8usGSsNkBUA4TV7/K5Q=;
        b=Mk+s6/1vdi++a5wFt6+r0p+s3rym1lMA6cr+gkKOJ/Z2LwdcKoB6U7QaXiqC5ivjkR
         fIaLG0Vh3TL7qJStKLyPN+IGjY/shMoXIGGBQM/DFb4cvAzJKTMH1hlPhx/L/PvgjEIH
         iyy69Jrtb6Q6X7WxbE9Er4FVCHmTNlieEw5Rfy/GqCmLuo/nc0X655vJ2nNrTRnXR8DQ
         +VrEUoVbRdpWz75oXnba5j0HVfFc9iVpx7r73SB4iaGPA1ZDZ4hYygsGsHhPKX1dEs8p
         D5S1RX6qieeLFAlDXtt45nVZRkkKqKLW+BMhPxJlvuDQBD7uLgUrb7m6oxZqpJBQtOUD
         6gNQ==
X-Gm-Message-State: AOAM530TEPh82dK5X50+UoQjXEr4x8XFztA4l5lr1fScviCICyrDfbrx
        lzifDaevIJyEGBoy/CpQFFOGeNznYIUGeQ==
X-Google-Smtp-Source: ABdhPJwCJvv1gmlTzqVHHEXadtDnxMhsFf7CFfV0r1s95pboZSQVSEZ+RKGDk2zGMU2B9w5mZno63N0XkT+ONQ==
X-Received: from dmatlack-heavy.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:19cd])
 (user=dmatlack job=sendgmr) by 2002:a17:902:a3c3:b0:151:ec83:d88 with SMTP id
 q3-20020a170902a3c300b00151ec830d88mr8062530plb.9.1646958341309; Thu, 10 Mar
 2022 16:25:41 -0800 (PST)
Date:   Fri, 11 Mar 2022 00:25:08 +0000
In-Reply-To: <20220311002528.2230172-1-dmatlack@google.com>
Message-Id: <20220311002528.2230172-7-dmatlack@google.com>
Mime-Version: 1.0
References: <20220311002528.2230172-1-dmatlack@google.com>
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
Subject: [PATCH v2 06/26] KVM: x86/mmu: Pass memslot to kvm_mmu_new_shadow_page()
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

Passing the memslot to kvm_mmu_new_shadow_page() avoids the need for the
vCPU pointer when write-protecting indirect 4k shadow pages. This moves
us closer to being able to create new shadow pages during VM ioctls for
eager page splitting, where there is not vCPU pointer.

This change does not negatively impact "Populate memory time" for ept=Y
or ept=N configurations since kvm_vcpu_gfn_to_memslot() caches the last
use slot. So even though we now look up the slot more often, it is a
very cheap check.

Opportunistically move the code to write-protect GFNs shadowed by
PG_LEVEL_4K shadow pages into account_shadowed() to reduce indentation
and consolidate the code. This also eliminates a memslot lookup.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index b6fb50e32291..519910938478 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -793,16 +793,14 @@ void kvm_mmu_gfn_allow_lpage(const struct kvm_memory_slot *slot, gfn_t gfn)
 	update_gfn_disallow_lpage_count(slot, gfn, -1);
 }
 
-static void account_shadowed(struct kvm *kvm, struct kvm_mmu_page *sp)
+static void account_shadowed(struct kvm *kvm,
+			     struct kvm_memory_slot *slot,
+			     struct kvm_mmu_page *sp)
 {
-	struct kvm_memslots *slots;
-	struct kvm_memory_slot *slot;
 	gfn_t gfn;
 
 	kvm->arch.indirect_shadow_pages++;
 	gfn = sp->gfn;
-	slots = kvm_memslots_for_spte_role(kvm, sp->role);
-	slot = __gfn_to_memslot(slots, gfn);
 
 	/* the non-leaf shadow pages are keeping readonly. */
 	if (sp->role.level > PG_LEVEL_4K)
@@ -810,6 +808,9 @@ static void account_shadowed(struct kvm *kvm, struct kvm_mmu_page *sp)
 						    KVM_PAGE_TRACK_WRITE);
 
 	kvm_mmu_gfn_disallow_lpage(slot, gfn);
+
+	if (kvm_mmu_slot_gfn_write_protect(kvm, slot, gfn, PG_LEVEL_4K))
+		kvm_flush_remote_tlbs_with_address(kvm, gfn, 1);
 }
 
 void account_huge_nx_page(struct kvm *kvm, struct kvm_mmu_page *sp)
@@ -2127,6 +2128,7 @@ static struct kvm_mmu_page *kvm_mmu_find_shadow_page(struct kvm_vcpu *vcpu,
 }
 
 static struct kvm_mmu_page *kvm_mmu_new_shadow_page(struct kvm_vcpu *vcpu,
+						    struct kvm_memory_slot *slot,
 						    gfn_t gfn,
 						    union kvm_mmu_page_role role)
 {
@@ -2142,11 +2144,8 @@ static struct kvm_mmu_page *kvm_mmu_new_shadow_page(struct kvm_vcpu *vcpu,
 	sp_list = &vcpu->kvm->arch.mmu_page_hash[kvm_page_table_hashfn(gfn)];
 	hlist_add_head(&sp->hash_link, sp_list);
 
-	if (!role.direct) {
-		account_shadowed(vcpu->kvm, sp);
-		if (role.level == PG_LEVEL_4K && kvm_vcpu_write_protect_gfn(vcpu, gfn))
-			kvm_flush_remote_tlbs_with_address(vcpu->kvm, gfn, 1);
-	}
+	if (!role.direct)
+		account_shadowed(vcpu->kvm, slot, sp);
 
 	return sp;
 }
@@ -2155,6 +2154,7 @@ static struct kvm_mmu_page *kvm_mmu_get_shadow_page(struct kvm_vcpu *vcpu,
 						    gfn_t gfn,
 						    union kvm_mmu_page_role role)
 {
+	struct kvm_memory_slot *slot;
 	struct kvm_mmu_page *sp;
 	bool created = false;
 
@@ -2163,7 +2163,8 @@ static struct kvm_mmu_page *kvm_mmu_get_shadow_page(struct kvm_vcpu *vcpu,
 		goto out;
 
 	created = true;
-	sp = kvm_mmu_new_shadow_page(vcpu, gfn, role);
+	slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn);
+	sp = kvm_mmu_new_shadow_page(vcpu, slot, gfn, role);
 
 out:
 	trace_kvm_mmu_get_page(sp, created);
-- 
2.35.1.723.g4982287a31-goog

