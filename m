Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05E57529532
	for <lists+linux-mips@lfdr.de>; Tue, 17 May 2022 01:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350363AbiEPXWe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 May 2022 19:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350401AbiEPXWL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 May 2022 19:22:11 -0400
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BB7528E09
        for <linux-mips@vger.kernel.org>; Mon, 16 May 2022 16:22:05 -0700 (PDT)
Received: by mail-pj1-x1049.google.com with SMTP id oa7-20020a17090b1bc700b001df2567933eso407473pjb.4
        for <linux-mips@vger.kernel.org>; Mon, 16 May 2022 16:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=rGzh5GvsV5L2zEqZPzXFz37QyRFi+koDaicRtP2dkmU=;
        b=OPhWIYxaFR2dtemS1rpu36wC5OAd8tOZ8Uy2j4Sg+WmZABVjAcyDohNhu+23Yq9S3i
         lo9dvAU0C2WlPy4wPB/0ufQBWEYovz7uf/zJMgR9WCwBx1KAg2LfO9cHzZRiv3nMmsWp
         rK6uGwu6ZWNC5ACoMjwmE/Djab2jF+ubLqAbGpWr2k6vL2WscKZdZXJ2wR+5v497WQPy
         P8IuV7t04tfEA9/qnPS8z0vRzSxQiXp4Gv3P0w+YCkXoi69Ani0G3bbldBY1bAY33Plj
         0Dtf7YNPhcD3HSt+A297W/OcRbYZVZQn4hgkC5h0dLMFuNzmU0xrtmyPuQEf5QUZhAdP
         yfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=rGzh5GvsV5L2zEqZPzXFz37QyRFi+koDaicRtP2dkmU=;
        b=nGUrXVXJKjnDNy5zvgczHQk/nxKgxJZdFquNkwpVNmRMBF6pm2XIkcdP0O3znoqpkW
         zPwy1TyYNyXdmV7SwrGix04qHO8UkNmWg9fotkytlpe5MyzTM9q0SaZvZ5iGBfY1sOM0
         mmn8sswMjl5yA+brPunG0phiOl0O/4j5qukmuXRuKoGK3hmL7YOR2eKSQtUBP07CtzYW
         cVfVjv+OH0gitbmfNUN04LHxYNcb0TntmAD5RZnP6dXJdyPQKAqSI6pBoAFswJmSUkkW
         jN5gbWcLSbVjl3YeQhLKM/f+hRPV/4wOfDlXjevrPHV5owTngb0/N8gyc3+JMU/6FJvt
         sQqw==
X-Gm-Message-State: AOAM530yW9G2PTDxAxD/HE5KAFYYfL1BHOhPl7+EW/ued6X6+RoZU4+R
        0qafwUIckdIPbSFs7PFgOtA2XvRosVEwwg==
X-Google-Smtp-Source: ABdhPJzOidTi35Ysu50FwznFojTNwKrHJzIVcpYJbrQfhWJlsKRUbKWh5n19ouRkc2VuKRGIDM46saF5Yjcz2A==
X-Received: from dmatlack-heavy.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:19cd])
 (user=dmatlack job=sendgmr) by 2002:a17:90a:2a8a:b0:1df:26ba:6333 with SMTP
 id j10-20020a17090a2a8a00b001df26ba6333mr4145pjd.0.1652743324001; Mon, 16 May
 2022 16:22:04 -0700 (PDT)
Date:   Mon, 16 May 2022 23:21:30 +0000
In-Reply-To: <20220516232138.1783324-1-dmatlack@google.com>
Message-Id: <20220516232138.1783324-15-dmatlack@google.com>
Mime-Version: 1.0
References: <20220516232138.1783324-1-dmatlack@google.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [PATCH v6 14/22] KVM: x86/mmu: Pass const memslot to rmap_add()
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

rmap_add() only uses the slot to call gfn_to_rmap() which takes a const
memslot.

No functional change intended.

Reviewed-by: Ben Gardon <bgardon@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index acb54d6e0ea5..1c0c1f82067d 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1582,7 +1582,7 @@ static bool kvm_test_age_rmapp(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
 
 #define RMAP_RECYCLE_THRESHOLD 1000
 
-static void rmap_add(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
+static void rmap_add(struct kvm_vcpu *vcpu, const struct kvm_memory_slot *slot,
 		     u64 *spte, gfn_t gfn)
 {
 	struct kvm_mmu_page *sp;
-- 
2.36.0.550.gb090851708-goog

