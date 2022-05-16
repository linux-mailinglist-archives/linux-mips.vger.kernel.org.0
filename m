Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2D23529518
	for <lists+linux-mips@lfdr.de>; Tue, 17 May 2022 01:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239046AbiEPXVv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 May 2022 19:21:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344310AbiEPXVr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 May 2022 19:21:47 -0400
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 922E53EF21
        for <linux-mips@vger.kernel.org>; Mon, 16 May 2022 16:21:45 -0700 (PDT)
Received: by mail-pf1-x449.google.com with SMTP id z19-20020a62d113000000b0050d183adf6fso6782061pfg.19
        for <linux-mips@vger.kernel.org>; Mon, 16 May 2022 16:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=X4uCUUh1rGfmOD3/lWwoQuwN7ClE8CziC7hFPLNCRtY=;
        b=hFeB6BH3Mk7VshvIAVpWcDVmYDpwvnSY5QkWaYbJwLjo1ir9fhO+bFdQtG6yVGX7zK
         t1oPzzOdhAsMDixXEjwg9yXq9XcutaFq/0xpTdRPmcBzm0YX5ysIkU5vORS5weJGrwP3
         PnoIGB12k06SgULkyahah2r4o4QbWTJO/vap+dojAQ9YZEIfWqymulkkpUqFP8fzSxX/
         Onr7rqoVvwnkIq5SdqjHwNmYnrTcmh2C8bZ/NIp8Sk+2uldb+dFZvYN0xax59BJjkPG8
         rN3X0TFXm4JojsgR1oiPFgxEOIkiTGPaQJbeQ0JUnVSeqzojBCe53i0mRhmWnFnT/ljv
         1QJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=X4uCUUh1rGfmOD3/lWwoQuwN7ClE8CziC7hFPLNCRtY=;
        b=gQk/m5CSGr5VgqQDv0AtvQO7Cj8HwBwzL/mdmK+7AVA6Ihmr9VbpKMoMt5FG9cZjXQ
         P+GZ3X7AhP0RUvUh3URuFZ2IHusmgWnhlQLSQdio6S5ypt5+R73zQrXGaZn7UpGFpzLG
         aKlV9XSs7+fRZqNfBBF2kWmxpD1K6/sJRE9rwhC5s3Gi7obElHmYxb8jvBbUo0CRAY0w
         un+emEzdPW01I2TkMZ3z5IPjjzs4ZOBjiu0evzp3ne37eFmJT6K9H/ljq3cHd14AG2WS
         J7FZeFl2x2yPIMLqh6GcK7Gt9vgVtA7bJvGSX4ZRIuMKdbMiFFoZA4FVZSs6DlLMmfZp
         3UPw==
X-Gm-Message-State: AOAM533/mwt9aZkb7BdcYtuw8BfrZmt/zLro+3PWXx1sn+VH2dDToZOz
        QKx5VoUWefWXi2wQN0Fh/DgafCS7cBECsA==
X-Google-Smtp-Source: ABdhPJwbO+fJ97CqwIl2Sls71Z6JyZGIMq9RjwHMhPS+5NIa19jDwPJcwiSkZGKIgaH0yYfXfhSvJ9zV3C5E3g==
X-Received: from dmatlack-heavy.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:19cd])
 (user=dmatlack job=sendgmr) by 2002:a17:90b:4b83:b0:1df:6862:fa9d with SMTP
 id lr3-20020a17090b4b8300b001df6862fa9dmr5653658pjb.32.1652743305094; Mon, 16
 May 2022 16:21:45 -0700 (PDT)
Date:   Mon, 16 May 2022 23:21:18 +0000
In-Reply-To: <20220516232138.1783324-1-dmatlack@google.com>
Message-Id: <20220516232138.1783324-3-dmatlack@google.com>
Mime-Version: 1.0
References: <20220516232138.1783324-1-dmatlack@google.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [PATCH v6 02/22] KVM: x86/mmu: Use a bool for direct
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

The parameter "direct" can either be true or false, and all of the
callers pass in a bool variable or true/false literal, so just use the
type bool.

No functional change intended.

Reviewed-by: Lai Jiangshan <jiangshanlai@gmail.com>
Reviewed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 774810d8a2ed..34fb0cddff2b 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1690,7 +1690,7 @@ static void drop_parent_pte(struct kvm_mmu_page *sp,
 	mmu_spte_clear_no_track(parent_pte);
 }
 
-static struct kvm_mmu_page *kvm_mmu_alloc_page(struct kvm_vcpu *vcpu, int direct)
+static struct kvm_mmu_page *kvm_mmu_alloc_page(struct kvm_vcpu *vcpu, bool direct)
 {
 	struct kvm_mmu_page *sp;
 
@@ -2023,7 +2023,7 @@ static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu,
 					     gfn_t gfn,
 					     gva_t gaddr,
 					     unsigned level,
-					     int direct,
+					     bool direct,
 					     unsigned int access)
 {
 	union kvm_mmu_page_role role;
-- 
2.36.0.550.gb090851708-goog

