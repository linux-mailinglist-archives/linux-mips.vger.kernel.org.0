Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 795D352953E
	for <lists+linux-mips@lfdr.de>; Tue, 17 May 2022 01:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350336AbiEPXWy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 May 2022 19:22:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350335AbiEPXV6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 May 2022 19:21:58 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F3283EF21
        for <linux-mips@vger.kernel.org>; Mon, 16 May 2022 16:21:56 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id om14-20020a17090b3a8e00b001df42f1cbaaso405158pjb.5
        for <linux-mips@vger.kernel.org>; Mon, 16 May 2022 16:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=XWhilig2MoNteAc4T6eN7YonYu6WiPDe3XS3DlFt+jY=;
        b=Gn0TUJQ0oAT0sUnrUouOEQhoOdkngm/EQPDfvbvia5LXjKS4924z23mrWOpTdrA/Hr
         Bw8oQYobjaBro2pxwSLg7Fyc94HXzB+5ozfOiafwOz8WfwwQ0NzXhxecfa4kyTI3m2QJ
         99hBZKdhULrDw3t74NLg8XNE1wzCoe9lf4nSUOv1nGOOaU9BsWElxyGN19tCYyEqYBFF
         kPtYaSAu73qvhFt7XYJXU5LrZmtPnpOFV32EWiI7hMWCJ8Ez2KvMTRSoY4bg205rTmiF
         wzgj+9/Cjm495lXdojVTMYd7TaQVu/fzG7qw4s/WRB2kSHkcrk8fwB9Vs0t75EFVkOfe
         VAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=XWhilig2MoNteAc4T6eN7YonYu6WiPDe3XS3DlFt+jY=;
        b=dJX7eKMHBlNRB09xAMVAMGLMSQ3Bun37+KNeLZI0ZkCBaW/cZv6+WGlhEj8fmqej7s
         BV7mVxQs02kr3wetmnviCEPGUz33Fy8SqdI1iNm20KS1ivL3C6nggaqFSVllvuFP10bn
         FGy+D8BpTczp3dMTvcpjlsOQ7byLt5LGrLAPGGewzpyVFClFMyi8Inomlr7Cd7ofnwdg
         A/YcP0nHMNUuedYD+k5SHbnEJtewt1NF7uiHWnlxiJoPmdhetsldhR/WVKX0QJucUe8w
         IY4W6xSIHz5g5X6E4zIJJ1TRuoV7CcfZ8w9Cxl9mVtIIoqytfmkHl2bK/WnIIxGdbQhc
         JT7Q==
X-Gm-Message-State: AOAM533f44qgWWlvRXxuQTC9sZbroztLpaGzRLSiV/PQB1wg/UK4sCjK
        2sI8l6SV97U2jn9KIypuoY1H3+HYCH76Mg==
X-Google-Smtp-Source: ABdhPJz+mv6KLWlHlnd0tKdGhB1w6C7WkQouE6ZrWpIM1Kdm38KemSHw4qOCxOwa0IH2ZdRnQndGM/F0DRga+A==
X-Received: from dmatlack-heavy.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:19cd])
 (user=dmatlack job=sendgmr) by 2002:a62:5ec6:0:b0:50d:a467:3cb7 with SMTP id
 s189-20020a625ec6000000b0050da4673cb7mr19714931pfb.85.1652743315785; Mon, 16
 May 2022 16:21:55 -0700 (PDT)
Date:   Mon, 16 May 2022 23:21:25 +0000
In-Reply-To: <20220516232138.1783324-1-dmatlack@google.com>
Message-Id: <20220516232138.1783324-10-dmatlack@google.com>
Mime-Version: 1.0
References: <20220516232138.1783324-1-dmatlack@google.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [PATCH v6 09/22] KVM: x86/mmu: Move guest PT write-protection to account_shadowed()
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
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Move the code that write-protects newly-shadowed guest page tables into
account_shadowed(). This avoids a extra gfn-to-memslot lookup and is a
more logical place for this code to live. But most importantly, this
reduces kvm_mmu_alloc_shadow_page()'s reliance on having a struct
kvm_vcpu pointer, which will be necessary when creating new shadow pages
during VM ioctls for eager page splitting.

Note, it is safe to drop the role.level == PG_LEVEL_4K check since
account_shadowed() returns early if role.level > PG_LEVEL_4K.

No functional change intended.

Reviewed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index d342fcc5813d..6a3b1b00f02b 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -792,6 +792,9 @@ static void account_shadowed(struct kvm *kvm, struct kvm_mmu_page *sp)
 						    KVM_PAGE_TRACK_WRITE);
 
 	kvm_mmu_gfn_disallow_lpage(slot, gfn);
+
+	if (kvm_mmu_slot_gfn_write_protect(kvm, slot, gfn, PG_LEVEL_4K))
+		kvm_flush_remote_tlbs_with_address(kvm, gfn, 1);
 }
 
 void account_huge_nx_page(struct kvm *kvm, struct kvm_mmu_page *sp)
@@ -2098,11 +2101,8 @@ static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm_vcpu *vcpu,
 	sp->gfn = gfn;
 	sp->role = role;
 	hlist_add_head(&sp->hash_link, sp_list);
-	if (sp_has_gptes(sp)) {
+	if (sp_has_gptes(sp))
 		account_shadowed(vcpu->kvm, sp);
-		if (role.level == PG_LEVEL_4K && kvm_vcpu_write_protect_gfn(vcpu, gfn))
-			kvm_flush_remote_tlbs_with_address(vcpu->kvm, gfn, 1);
-	}
 
 	return sp;
 }
-- 
2.36.0.550.gb090851708-goog

