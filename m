Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A4B34D56B1
	for <lists+linux-mips@lfdr.de>; Fri, 11 Mar 2022 01:26:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345208AbiCKA1N (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Mar 2022 19:27:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345220AbiCKA1M (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Mar 2022 19:27:12 -0500
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D3041A273B
        for <linux-mips@vger.kernel.org>; Thu, 10 Mar 2022 16:26:02 -0800 (PST)
Received: by mail-pl1-x649.google.com with SMTP id e7-20020a170902ef4700b00151de30039bso3547644plx.17
        for <linux-mips@vger.kernel.org>; Thu, 10 Mar 2022 16:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=sbKWGus3ebobJm3+FVUoYXRe2tQF3TQMqNwj5vm+oQs=;
        b=rVXfocbRBiQbddq7Mymh8A5+rpjWdaiL9E9VqTuaVfs85neIgNVqmcY2867zAHwnJa
         9TkxrBsa1FXUF6fizdhytevf03ZL9ZGE36n9+/W481j9IRCF6RPrAqCOuCHs8jZNwKIx
         WZ8wZGpBYjcCDJjxR4zZSW6m8K6/KkXuyxJuluinWK57EZ80Yg2P+y55gHFkhA6w9Oa1
         ZjUrekfxltWEIcYp6tKHwVmxG/FoOfIojaUB8GXZiciN0zPQtoYypB9jwqwoqblMNs58
         x+sWxZzzU0AXvB2UhlDpsSCnQfHpWc1MNB/G1fw4SMqXvl1aRl6tolbMQZm49L18DnHb
         iqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=sbKWGus3ebobJm3+FVUoYXRe2tQF3TQMqNwj5vm+oQs=;
        b=5OGsV4UOFQR4Pn0IOomV2J1ZQy0xKOMS8zxfQArrKwx65RfDbUqo/8IY3BpANzjPG7
         Q1cOp9G8qpuGJ/FxJukeciNbUwEtX+D9twt5BYv8pM18eUeox+a8rWH3651pfrYFXt3i
         dl4dSm80FoAZYm0UCvDPkjVAgyG5DAnWsNcAf4p7cWvGHfnyWcvR1JLkbo45rJAmpEg8
         Lsebb79c3aO32mmyOwN858BOsuYCR89oEJ4z4epOcP13iPfZliP76D3h5FaMNQYSsB2H
         MW2BuahkFGSYQwngNBnU/BZw/XihytCpa4Wtvq9E9TXTcRHE5WWUCHsWPEs1WbESsQ2n
         oCQA==
X-Gm-Message-State: AOAM5301qHmnNPSydqrQ8FkkkIGIOcNvXf/P7WBEchskMdxV1WmT9JzR
        ER2YhxBXjiR2L0A7+fSnQ3/RzheuiWfOoQ==
X-Google-Smtp-Source: ABdhPJzlF0dOeLQBpCrN6EQ/1uv182Ojcd8GXVsCcPw3S8P1mroh+hcuj+7wbKMkJW298Mx+vaz9w72iGDnQxg==
X-Received: from dmatlack-heavy.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:19cd])
 (user=dmatlack job=sendgmr) by 2002:a05:6a00:890:b0:4f6:686e:a8a9 with SMTP
 id q16-20020a056a00089000b004f6686ea8a9mr7226414pfj.83.1646958361665; Thu, 10
 Mar 2022 16:26:01 -0800 (PST)
Date:   Fri, 11 Mar 2022 00:25:20 +0000
In-Reply-To: <20220311002528.2230172-1-dmatlack@google.com>
Message-Id: <20220311002528.2230172-19-dmatlack@google.com>
Mime-Version: 1.0
References: <20220311002528.2230172-1-dmatlack@google.com>
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
Subject: [PATCH v2 18/26] KVM: x86/mmu: Zap collapsible SPTEs at all levels in
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
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

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 89a7a8d7a632..2032be3edd71 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -6142,18 +6142,30 @@ static bool kvm_mmu_zap_collapsible_spte(struct kvm *kvm,
 	return need_tlb_flush;
 }
 
+static void kvm_rmap_zap_collapsible_sptes(struct kvm *kvm,
+					   const struct kvm_memory_slot *slot)
+{
+	bool flush;
+
+	/*
+	 * Note, use KVM_MAX_HUGEPAGE_LEVEL - 1 since there's no need to zap
+	 * pages that are already mapped at the maximum possible level.
+	 */
+	flush = slot_handle_level(kvm, slot, kvm_mmu_zap_collapsible_spte,
+				  PG_LEVEL_4K, KVM_MAX_HUGEPAGE_LEVEL - 1,
+				  true);
+
+	if (flush)
+		kvm_arch_flush_remote_tlbs_memslot(kvm, slot);
+
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
2.35.1.723.g4982287a31-goog

