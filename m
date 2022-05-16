Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44657529536
	for <lists+linux-mips@lfdr.de>; Tue, 17 May 2022 01:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350430AbiEPXWc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 May 2022 19:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350447AbiEPXWU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 May 2022 19:22:20 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80CEB46B36
        for <linux-mips@vger.kernel.org>; Mon, 16 May 2022 16:22:08 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id p37-20020a631e65000000b003f266605a63so2392878pgm.5
        for <linux-mips@vger.kernel.org>; Mon, 16 May 2022 16:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=lm/bHTT/Nz8oe32Uk0HDnsFMBQkCUXnMmKcicUoGXfs=;
        b=AiqFginchKqcmSIXeGtxPSBqb5MV1TnDVoarAOH7O4D7Zlwlhc8wdW1cAOq5/xNi5J
         R4cHtwg9tW5UB/VNcissYapZvSpM9wSgWWr3dToUQG8YTIe6NchLfycinkA78fiQCN76
         vlpsSJF0DyEhWxOFdrKCBjBG2kcCiPwCmp0TcOPcuPjD8prOEZ83AEv3sAVWPFmN/but
         c2b0w9QbsvQbdE/Jehn+mo7pVEoU1Pd54G1MAmuCbm+7injGhfmnBG+Heq87ygFDb1h4
         f++8OV2Cf3dOPV2B3RVqKJxop7CsrC4FHzXRm4eYeqU9LvpzZz3DxK29IAgBtoTTm5XP
         JUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=lm/bHTT/Nz8oe32Uk0HDnsFMBQkCUXnMmKcicUoGXfs=;
        b=MY9zB+4iUeyyCczuQ9hgIe+2Ue/m67N3nlmTc1DI2XHdeijZFx/qi2EvvCMV7s5jWN
         9ktyTTGvCRheADtrIM4IxOyoqyfqyT9zrvT1ykU/JDzvtxdZJGBvQzQOJfUcQfNtXrkH
         BpNoliVSNfS62Mra/Kr9vdvdSOzxD/VGSJ4pzT56PNgBYgfsaJ1GE/cS6Os8EVeXtGEZ
         w+5+C+fTIqpX7HGpU0+59Ei5N0vPOB/Y9Re6uK7JQdwkdPjEe6jbXQ11wbLAX11xqM6g
         9EbuH0kF+649OjfMmBdtn5mCEVcSjIlyxLLRKZR4Y2NUF58n6hZcx4UFAldqZ6mkwFn5
         MAVQ==
X-Gm-Message-State: AOAM533q1djcpqm4uHvOgBjiU0wVyQxJjq1T9TxjI5UHoRBVPEupc12b
        BxdjtrzQOWy/PfI35NtGlzv/wYx4hmcREQ==
X-Google-Smtp-Source: ABdhPJwB+FxzZW/zPu8VVr2QPbr7iRVb68cU3Dq9pd0u3oH6GpNdggozRZ5n4LJYaNZrt+GtEc+lvCKMYAzKJQ==
X-Received: from dmatlack-heavy.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:19cd])
 (user=dmatlack job=sendgmr) by 2002:a63:235c:0:b0:3c5:f761:12fd with SMTP id
 u28-20020a63235c000000b003c5f76112fdmr16850570pgm.416.1652743327301; Mon, 16
 May 2022 16:22:07 -0700 (PDT)
Date:   Mon, 16 May 2022 23:21:32 +0000
In-Reply-To: <20220516232138.1783324-1-dmatlack@google.com>
Message-Id: <20220516232138.1783324-17-dmatlack@google.com>
Mime-Version: 1.0
References: <20220516232138.1783324-1-dmatlack@google.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [PATCH v6 16/22] KVM: x86/mmu: Update page stats in __rmap_add()
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

Update the page stats in __rmap_add() rather than at the call site. This
will avoid having to manually update page stats when splitting huge
pages in a subsequent commit.

No functional change intended.

Reviewed-by: Ben Gardon <bgardon@google.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 15c0f03848d3..6aef85dac1e2 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1588,6 +1588,8 @@ static void __rmap_add(struct kvm *kvm,
 
 	sp = sptep_to_sp(spte);
 	kvm_mmu_page_set_gfn(sp, spte - sp->spt, gfn);
+	kvm_update_page_stats(kvm, sp->role.level, 1);
+
 	rmap_head = gfn_to_rmap(gfn, sp->role.level, slot);
 	rmap_count = pte_list_add(cache, spte, rmap_head);
 
@@ -2810,7 +2812,6 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
 
 	if (!was_rmapped) {
 		WARN_ON_ONCE(ret == RET_PF_SPURIOUS);
-		kvm_update_page_stats(vcpu->kvm, level, 1);
 		rmap_add(vcpu, slot, sptep, gfn);
 	}
 
-- 
2.36.0.550.gb090851708-goog

