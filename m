Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2828D50C453
	for <lists+linux-mips@lfdr.de>; Sat, 23 Apr 2022 01:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232519AbiDVWQN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Apr 2022 18:16:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232512AbiDVWPj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Apr 2022 18:15:39 -0400
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C558C31AA85
        for <linux-mips@vger.kernel.org>; Fri, 22 Apr 2022 14:06:16 -0700 (PDT)
Received: by mail-pf1-x44a.google.com with SMTP id g5-20020a62f945000000b0050578328060so6097090pfm.17
        for <linux-mips@vger.kernel.org>; Fri, 22 Apr 2022 14:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=YRFXEHEQ0F/L+OIhMiFnoup0hMtFO1aikfS1l340O28=;
        b=LHO6hoSehDzcaxSmuBNa69LqsXqu0X0QCiplTSjHBpc1i+UDmeX5+dmuJ10h+RNVw6
         A770B5ZPMS/iNMSiAp/9LoSs1vNvRBSjsSW/Lrt5QwGLrVMmD9DC54Yp46TY1I85yfN7
         +5cRK6EAaeGNXeoiAXhq0ErhfRwjotp9q1eafRcLhwfpWucB/5uKVZestkC02mfRfbNP
         Y1CcdI84uzdZcL3Qu/jYFxG7Y1M/hNgq6k2jJJLJT+xpkhyj0bLC+KwC2mvCA6ZwCTks
         zL03Iu7Z7aNo0NEmzTqXPy0v+ueNYazP83L7mOzrRlcQLtjImcMEq37GsxA0zV8Av3uD
         x4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=YRFXEHEQ0F/L+OIhMiFnoup0hMtFO1aikfS1l340O28=;
        b=dYD8OaLu/gWGNR1I/gwZaplnEhE7fGGmfNoVC0fvEu/usrP+NO8kzUvjbEcVu3Appd
         AlfUlwbcpTGMFrNH0pnUsZ/iLmvWHx3EajJ1YfLrJNTOsKY0XImhojd+mwgU6R7erYgr
         EgWSQkvpr7fbfaHkQHh0PebdYWqg6oAgWRifpefSM+ZWsNdw3A5MbKG707lgD4cycXrb
         uiZscMXzWY551Nrlvr3bo503biF1368Y/Zdch4u8WXiUdM6ASfEWUsiTrUhp3lsCoWyY
         7g874UsQ2GozUQ+zQq+LGRgp9CnQo6PAcAVijfCgsqHriUj6R4cmba3OqEJ1LWs+fb3S
         rFbQ==
X-Gm-Message-State: AOAM532w/OkDxaQX5mNoXmiVUXIu1fCAf6XUvImojPNBQUkc8i+6sz9a
        lkQw0H7HRbrikV4OtopNR7ReRa7IhvXt3A==
X-Google-Smtp-Source: ABdhPJw/oNy0+kaJBwCxf5EoazVKoHTTI1UYGMDmSr5beP3OKAGQj/xL5RIUegS6CG2XgI5IG997Vq/y6udlcw==
X-Received: from dmatlack-heavy.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:19cd])
 (user=dmatlack job=sendgmr) by 2002:a62:3083:0:b0:505:f7ac:c4a6 with SMTP id
 w125-20020a623083000000b00505f7acc4a6mr6919416pfw.66.1650661576253; Fri, 22
 Apr 2022 14:06:16 -0700 (PDT)
Date:   Fri, 22 Apr 2022 21:05:43 +0000
In-Reply-To: <20220422210546.458943-1-dmatlack@google.com>
Message-Id: <20220422210546.458943-18-dmatlack@google.com>
Mime-Version: 1.0
References: <20220422210546.458943-1-dmatlack@google.com>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
Subject: [PATCH v4 17/20] KVM: x86/mmu: Zap collapsible SPTEs at all levels in
 the shadow MMU
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
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Currently KVM only zaps collapsible 4KiB SPTEs in the shadow MMU (i.e.
in the rmap). This is fine for now KVM never creates intermediate huge
pages during dirty logging, i.e. a 1GiB page is never partially split to
a 2MiB page.

However, this will stop being true once the shadow MMU participates in
eager page splitting, which can in fact leave behind partially split
huge pages. In preparation for that change, change the shadow MMU to
iterate over all necessary levels when zapping collapsible SPTEs.

No functional change intended.

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index ed65899d15a2..479c581e8a96 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -6098,18 +6098,25 @@ static bool kvm_mmu_zap_collapsible_spte(struct kvm *kvm,
 	return need_tlb_flush;
 }
 
+static void kvm_rmap_zap_collapsible_sptes(struct kvm *kvm,
+					   const struct kvm_memory_slot *slot)
+{
+	/*
+	 * Note, use KVM_MAX_HUGEPAGE_LEVEL - 1 since there's no need to zap
+	 * pages that are already mapped at the maximum possible level.
+	 */
+	if (slot_handle_level(kvm, slot, kvm_mmu_zap_collapsible_spte,
+			      PG_LEVEL_4K, KVM_MAX_HUGEPAGE_LEVEL - 1,
+			      true))
+		kvm_arch_flush_remote_tlbs_memslot(kvm, slot);
+}
+
 void kvm_mmu_zap_collapsible_sptes(struct kvm *kvm,
 				   const struct kvm_memory_slot *slot)
 {
 	if (kvm_memslots_have_rmaps(kvm)) {
 		write_lock(&kvm->mmu_lock);
-		/*
-		 * Zap only 4k SPTEs since the legacy MMU only supports dirty
-		 * logging at a 4k granularity and never creates collapsible
-		 * 2m SPTEs during dirty logging.
-		 */
-		if (slot_handle_level_4k(kvm, slot, kvm_mmu_zap_collapsible_spte, true))
-			kvm_arch_flush_remote_tlbs_memslot(kvm, slot);
+		kvm_rmap_zap_collapsible_sptes(kvm, slot);
 		write_unlock(&kvm->mmu_lock);
 	}
 
-- 
2.36.0.rc2.479.g8af0fa9b8e-goog

