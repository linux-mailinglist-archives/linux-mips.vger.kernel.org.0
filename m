Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2618B4D5699
	for <lists+linux-mips@lfdr.de>; Fri, 11 Mar 2022 01:26:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345184AbiCKA0z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Mar 2022 19:26:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345186AbiCKA0y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Mar 2022 19:26:54 -0500
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03AB51A1C78
        for <linux-mips@vger.kernel.org>; Thu, 10 Mar 2022 16:25:52 -0800 (PST)
Received: by mail-pl1-x649.google.com with SMTP id e7-20020a170902ef4700b00151de30039bso3547486plx.17
        for <linux-mips@vger.kernel.org>; Thu, 10 Mar 2022 16:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=FuGhM+ADTv/ZcWx+5nd4XLS/9fWvtmM0zVjBEofzrxU=;
        b=Ji7DjPBUNinn477C4vHC7v0CuY0YoR6Yspro2QMZ2A3u86aqpm1X0/aNnOB3Onp3w2
         HgDtdMQ+gjJdoqlarq8fbzeMvb9spnuW9GS9uYaCSHgwIzu15JEmHu79mAnZ1tLJFwPT
         oFowkvO9jBF3oyujgESdSYeqoe0gYjAcidMXMJAHHt6OtFUYjbz9/XwZHovpDi/VB3a2
         2w1CxktgeA3NrBx+qyKN/4Ey7VJIa/lVAfIOLkSA5mAPxkDNWBz2kAed064YBhLxUxUP
         f0JOgrZf/UTO6C022foFU+9duN7WQjx0LGEL0QoLxC6tLxyIOe8si9f3ojrRG/e9lbPJ
         RSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=FuGhM+ADTv/ZcWx+5nd4XLS/9fWvtmM0zVjBEofzrxU=;
        b=p5EBMq8VTVheU6yXD3/ThFLffxqKqrksPRKnDpKWb1J5E/SquFSbrpsy3xL5Qm/zj8
         ZSdlkxWK1zneN9713TjQUvPEsOZVbzVktL1HQ+LbshMhYC1oEWC/iIM5pRjRSkdgxe7g
         lzrtn3MBMZrVeaxU3cPYQV/6IhfAt2dmUTIS4vm/nyl93P5DrcIeU5QfcvTgb785MZrw
         BByC9nrjb9veXKOwUoR680f8K/ZeUIwXczenzgzhv47Dc4Z4a5zlrbRUECZkTaomiyld
         MtLWYRuMw8bPvG3xzlPdTw0mw2M/FiEPkj1UgyatnT2bqqy5NKRa2vHS78SPh9aXUv40
         WrsQ==
X-Gm-Message-State: AOAM531kYHyJf95MlQl4EIlRhsRo92V2YyMZhxQYjLCTKZvN2IoZ6yOL
        zC3xJFlDd3XVQ+WiOxQAbDmkwVCBUnB6vw==
X-Google-Smtp-Source: ABdhPJwexzqWNekNQlu0Z8Q7kGjrMeWTrgWkJ92wr1Nrhoh86lXtdckWOSYIgTE9CJlEh1iQr24fdow+vmFtsQ==
X-Received: from dmatlack-heavy.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:19cd])
 (user=dmatlack job=sendgmr) by 2002:a17:903:192:b0:151:8df9:6cdb with SMTP id
 z18-20020a170903019200b001518df96cdbmr7919327plg.20.1646958351495; Thu, 10
 Mar 2022 16:25:51 -0800 (PST)
Date:   Fri, 11 Mar 2022 00:25:14 +0000
In-Reply-To: <20220311002528.2230172-1-dmatlack@google.com>
Message-Id: <20220311002528.2230172-13-dmatlack@google.com>
Mime-Version: 1.0
References: <20220311002528.2230172-1-dmatlack@google.com>
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
Subject: [PATCH v2 12/26] KVM: x86/mmu: Pass const memslot to rmap_add()
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

rmap_add() only uses the slot to call gfn_to_rmap() which takes a const
memslot.

No functional change intended.

Reviewed-by: Ben Gardon <bgardon@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 4c8feaeb063d..23c0a36ac93f 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1596,7 +1596,7 @@ static bool kvm_test_age_rmapp(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
 
 #define RMAP_RECYCLE_THRESHOLD 1000
 
-static void rmap_add(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
+static void rmap_add(struct kvm_vcpu *vcpu, const struct kvm_memory_slot *slot,
 		     u64 *spte, gfn_t gfn)
 {
 	struct kvm_mmu_page *sp;
-- 
2.35.1.723.g4982287a31-goog

