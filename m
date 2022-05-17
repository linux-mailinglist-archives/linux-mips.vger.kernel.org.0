Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3066652953C
	for <lists+linux-mips@lfdr.de>; Tue, 17 May 2022 01:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350395AbiEPXWu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 May 2022 19:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350458AbiEPXWV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 May 2022 19:22:21 -0400
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27BE04705C
        for <linux-mips@vger.kernel.org>; Mon, 16 May 2022 16:22:12 -0700 (PDT)
Received: by mail-pj1-x1049.google.com with SMTP id y14-20020a17090a784e00b001df7b1f8b74so373480pjl.5
        for <linux-mips@vger.kernel.org>; Mon, 16 May 2022 16:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=9KhR9RDv1+HiuWMCW01kkkAtt9xblGLeDY5Rd9GOluE=;
        b=U75UGGKXGg7r+oQ3OVcmu0mq6W+cm3WPmauKSAABW3YrBxgYUVgkP27Q9zzwgSwLbV
         RB+65TyYko8PxRfFPihGm1E1XLsZ1SALREKzaRb7jsyOlzUIshd4X6AbTcRvS2+bsasp
         8crDdLZmh0yEyAnCujwAjBIpMItmDSZeFCBe6NZqCDfHlusZbzSWqHosZJbBR+C/VDBL
         iPcvx4aIj38s6LMSnbzuldDiFQTXS25ZCKu69EjGM0IYswX8h4KgSRS3/FZUVjEb/uYa
         rDP3oGuLcsHj0MuopRisu5wfQLVFB6oDQ3kPK3zS+/00Nekf7LXtCdnZ/uebIRh5MC59
         6T4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=9KhR9RDv1+HiuWMCW01kkkAtt9xblGLeDY5Rd9GOluE=;
        b=VwYKh19kO+ZJEWULk23u/j3nB4D2y9DqiU/Xtp/m6R0/rnxq1P82bT4cO2ek2keye4
         /B3accQchJQNm0uKrQR84jYG4bNjbqivpA5/CTQxwFCna6O//HGHFHxoKYFn80EcDPVs
         f6nroWJPMm1RjJViJHCQRSChB2WX7yIqY5CYTx/wjHzfscZt3FQJWurwYUIZtNlY8EQb
         fyKj8d5FOz1ShPIq68GkQMLOgl+eC1vAdnSsurpaXoFM+fqU5tR5mfqiHr7f2uh9gRAT
         JqXy0NrtsMFhgZbtN5M9bgKRGVUQO5oT5OtU3vETwg5KMs9ZXT2fnAUXj/6gRDcTo01Z
         twzw==
X-Gm-Message-State: AOAM530Drbalr/P0TlQX9mtuBXUTGZxT29SAsAEVjbZe2+3DDi0i9+CF
        dfrCcEFIoIVaN5VWOtcw2+aKP60dzEck8w==
X-Google-Smtp-Source: ABdhPJxn1Adbrwr0spJT4PBgbyAjVTi3h3KvTvBoOu5lD4Q8uCIbo04/FCFaG2Su7HH2diIb7ajVBHtfJAwHEw==
X-Received: from dmatlack-heavy.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:19cd])
 (user=dmatlack job=sendgmr) by 2002:a17:90b:4b01:b0:1dc:6fee:508a with SMTP
 id lx1-20020a17090b4b0100b001dc6fee508amr22257145pjb.127.1652743331750; Mon,
 16 May 2022 16:22:11 -0700 (PDT)
Date:   Mon, 16 May 2022 23:21:35 +0000
In-Reply-To: <20220516232138.1783324-1-dmatlack@google.com>
Message-Id: <20220516232138.1783324-20-dmatlack@google.com>
Mime-Version: 1.0
References: <20220516232138.1783324-1-dmatlack@google.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [PATCH v6 19/22] KVM: x86/mmu: Zap collapsible SPTEs in shadow MMU at
 all possible levels
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

Currently KVM only zaps collapsible 4KiB SPTEs in the shadow MMU. This
is fine for now since KVM never creates intermediate huge pages during
dirty logging. In other words, KVM always replaces 1GiB pages directly
with 4KiB pages, so there is no reason to look for collapsible 2MiB
pages.

However, this will stop being true once the shadow MMU participates in
eager page splitting. During eager page splitting, each 1GiB is first
split into 2MiB pages and then those are split into 4KiB pages. The
intermediate 2MiB pages may be left behind if an error condition causes
eager page splitting to bail early.

No functional change intended.

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index f83de72feeac..a5d96d452f42 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -6177,18 +6177,25 @@ static bool kvm_mmu_zap_collapsible_spte(struct kvm *kvm,
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
2.36.0.550.gb090851708-goog

